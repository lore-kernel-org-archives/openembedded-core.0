Return-Path: <Ovidiu.Panait@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1BD19786C1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 13:45:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w1RDjdnV016544
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 05:45:39 -0800 (PST)
Received: from otp-linux01.wrs.com (128.224.126.17) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 27 Feb 2018 05:45:13 -0800
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Feb 2018 15:45:41 +0200
Message-ID: <20180227134541.147175-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.16.2
MIME-Version: 1.0
Subject: [PATCH] nativesdk-rpm: Add wrappers for nativesdk support
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
X-List-Received-Date: Tue, 27 Feb 2018 13:45:38 -0000
Content-Type: text/plain

When installing the SDK to a non-default path, running "rpm --showrc" from the
sdk will produce the following error:
error: Unable to open /opt/poky/2.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/rpm/rpmrc for reading: No such file or directory. 

Fix this by adding wrappers that dynamically export the RPM_CONFIGDIR,
RPM_ETCCONFIGDIR and MAGIC environment variables, pointing to the proper
sdk locations.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_4.14.1.bb | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/meta/recipes-devtools/rpm/rpm_4.14.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
index 7b8ea46a75..daaf4637a3 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
@@ -65,6 +65,7 @@ EXTRA_OECONF_append_libc-musl = " --disable-nls"
 #
 # Also disable plugins, so that rpm doesn't attempt to inhibit shutdown via session dbus
 EXTRA_OECONF_append_class-native = " --sysconfdir=/etc --localstatedir=/var --disable-plugins"
+EXTRA_OECONF_append_class-nativesdk = " --sysconfdir=/etc --localstatedir=/var --disable-plugins"
 
 BBCLASSEXTEND = "native nativesdk"
 
@@ -96,6 +97,31 @@ do_install_append_class-native() {
         done
 }
 
+do_install_append_class-nativesdk() {
+        tools="\
+                ${bindir}/rpm \
+                ${bindir}/rpm2archive \
+                ${bindir}/rpm2cpio \
+                ${bindir}/rpmbuild \
+                ${bindir}/rpmdb \
+                ${bindir}/rpmgraph \
+                ${bindir}/rpmkeys \
+                ${bindir}/rpmsign \
+                ${bindir}/rpmspec \
+                ${libdir}/rpm/rpmdeps \
+        "
+
+        for tool in $tools; do
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
2.16.2


