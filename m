Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A73F974DB1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 02:43:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4P2h9vj022275
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 19:43:10 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Thu, 24 May 2018 19:43:09 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 May 2018 10:48:29 +0800
Message-ID: <2aa1400ebe1effb9ffc0b9f995fa6bfd2e2aaeae.1527216285.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1527216285.git.liezhi.yang@windriver.com>
References: <cover.1527216285.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 24/24] nativesdk-rpm: Add wrappers for nativesdk support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 May 2018 02:43:08 -0000
Content-Type: text/plain

From: Ovidiu Panait <ovidiu.panait@windriver.com>

When installing the SDK to a non-default path, running "rpm --showrc" from the
sdk will produce the following error:
error: Unable to open /opt/windriver/wrlinux-small/10.17.41/sysroots/x86_64-wrlinuxsdk-linux/usr/lib/rpm/rpmrc for reading: No such file or directory.

Fix this by adding wrappers that dynamically export the RPM_CONFIGDIR,
RPM_ETCCONFIGDIR and MAGIC environment variables, pointing to the proper
sdk locations.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_4.14.1.bb | 42 ++++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.14.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
index d49530e..cf26c1e 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
@@ -67,6 +67,7 @@ EXTRA_OECONF_append_libc-musl = " --disable-nls"
 # Disable dbus for native, so that rpm doesn't attempt to inhibit shutdown via session dbus even when plugins support is enabled.
 # Also disable plugins by default for native.
 EXTRA_OECONF_append_class-native = " --sysconfdir=/etc --localstatedir=/var --without-dbus --disable-plugins"
+EXTRA_OECONF_append_class-nativesdk = " --sysconfdir=/etc --localstatedir=/var --without-dbus --disable-plugins"
 
 BBCLASSEXTEND = "native nativesdk"
 
@@ -77,21 +78,22 @@ ASNEEDED = ""
 
 # Direct rpm-native to read configuration from our sysroot, not the one it was compiled in
 # libmagic also has sysroot path contamination, so override it
+
+WRAPPER_TOOLS = " \
+   ${bindir}/rpm \
+   ${bindir}/rpm2archive \
+   ${bindir}/rpm2cpio \
+   ${bindir}/rpmbuild \
+   ${bindir}/rpmdb \
+   ${bindir}/rpmgraph \
+   ${bindir}/rpmkeys \
+   ${bindir}/rpmsign \
+   ${bindir}/rpmspec \
+   ${libdir}/rpm/rpmdeps \
+"
+
 do_install_append_class-native() {
-        tools="\
-                ${bindir}/rpm \
-                ${bindir}/rpm2archive \
-                ${bindir}/rpm2cpio \
-                ${bindir}/rpmbuild \
-                ${bindir}/rpmdb \
-                ${bindir}/rpmgraph \
-                ${bindir}/rpmkeys \
-                ${bindir}/rpmsign \
-                ${bindir}/rpmspec \
-                ${libdir}/rpm/rpmdeps \
-        "
-
-        for tool in $tools; do
+        for tool in ${WRAPPER_TOOLS}; do
                 create_wrapper ${D}$tool \
                         RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
                         RPM_ETCCONFIGDIR=${STAGING_DIR_NATIVE} \
@@ -100,6 +102,18 @@ do_install_append_class-native() {
         done
 }
 
+do_install_append_class-nativesdk() {
+        for tool in ${WRAPPER_TOOLS}; do
+                create_wrapper ${D}$tool \
+                        RPM_CONFIGDIR='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
+                        RPM_ETCCONFIGDIR='$'{RPM_ETCCONFIGDIR-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/..} \
+                        MAGIC='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/misc/magic.mgc \
+                        RPM_NO_CHROOT_FOR_SCRIPTS=1
+        done
+
+        rm -rf ${D}/var
+}
+
 # Rpm's make install creates var/tmp which clashes with base-files packaging
 do_install_append_class-target() {
     rm -rf ${D}/var
-- 
2.7.4


