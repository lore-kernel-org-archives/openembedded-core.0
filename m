Return-Path: <mschiffer@universe-factory.net>
Received: from chaos.universe-factory.net (chaos.universe-factory.net
	[37.72.148.22])
	by mail.openembedded.org (Postfix) with ESMTP id EF5BA731A5
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jan 2016 23:53:08 +0000 (UTC)
Received: from avalon.neoraider.dn42 (unknown [IPv6:fd1b:c28a:2fd6::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by chaos.universe-factory.net (Postfix) with ESMTPSA id 662491814EB
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Jan 2016 00:53:08 +0100 (CET)
From: Matthias Schiffer <mschiffer@universe-factory.net>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Jan 2016 00:53:01 +0100
Message-Id: <7ef127138c4ba5c89b42b892c84aaa7766f78a4c.1451778497.git.mschiffer@universe-factory.net>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <c00e9825d8e0221666adffd95ed157f9affe06b8.1451778497.git.mschiffer@universe-factory.net>
References: <c00e9825d8e0221666adffd95ed157f9affe06b8.1451778497.git.mschiffer@universe-factory.net>
In-Reply-To: <c00e9825d8e0221666adffd95ed157f9affe06b8.1451778497.git.mschiffer@universe-factory.net>
References: <c00e9825d8e0221666adffd95ed157f9affe06b8.1451778497.git.mschiffer@universe-factory.net>
Subject: [PATCH v2 3/3] base-files: create typical merged /usr symlinks if the "merged-usr" distro feature is set
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
X-List-Received-Date: Sat, 02 Jan 2016 23:53:10 -0000

The typical symlinks are:

* /bin -> usr/bin
* /sbin -> usr/sbin
* /lib -> usr/lib
* /usr/sbin -> bin

It is checked that only sane symlinks are created, so a half-merged /usr
(e.g, merging bin and sbin, but not lib) is feasible as well.

The following options in a distro configuration create a full Fedora-style
merged /usr:

  DISTRO_FEATURES_DEFAULT += "merged-usr"
  base_bindir = "${exec_prefix}/bin"
  base_sbindir = "${exec_prefix}/bin"
  sbindir = "${exec_prefix}/bin"
  base_libdir = "${exec_prefix}/${baselib}"
  nonarch_base_libdir = "${exec_prefix}/lib"

[YOCTO #7040]

Signed-off-by: Matthias Schiffer <mschiffer@universe-factory.net>
---
v2:
* add the merged-usr symlinks in a separate task, so do_install can be
  overridden independently of the merged-usr feature.
* add PACKAGECONFIG for merged-usr, so the package is rebuilt when the
  distro feature is changed.


 meta/recipes-core/base-files/base-files_3.0.14.bb | 36 +++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 2af7ecd..21a740f 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -30,6 +30,13 @@ S = "${WORKDIR}"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
+PACKAGECONFIG ??= " \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'merged-usr','merged-usr', '', d)} \
+"
+
+PACKAGECONFIG[merged-usr] = ",,"
+
+
 docdir_append = "/${P}"
 dirs1777 = "/tmp ${localstatedir}/volatile/tmp"
 dirs2775 = ""
@@ -136,6 +143,35 @@ do_install () {
 	ln -sf /proc/mounts ${D}${sysconfdir}/mtab
 }
 
+do_install_merged_usr () {
+	if ${@bb.utils.contains('PACKAGECONFIG','merged-usr','false','true',d)}; then
+		return
+	fi
+
+	if [ "${base_bindir}" != "/bin" ]; then
+		ln -snf "${@d.getVar('base_bindir', True)[1:]}" ${D}/bin
+	fi
+
+	if [ "${base_sbindir}" != "/sbin"  ]; then
+		ln -snf "${@d.getVar('base_sbindir', True)[1:]}" ${D}/sbin
+	fi
+
+	if [ "${nonarch_base_libdir}" != "/lib" ]; then
+		ln -snf "${@d.getVar('nonarch_base_libdir', True)[1:]}" ${D}/lib
+	fi
+
+	if [ "${base_libdir}" != "/${baselib}" ]; then
+		ln -snf "${@d.getVar('base_libdir', True)[1:]}" ${D}/${baselib}
+	fi
+
+	if [ "${bindir}" = "${exec_prefix}/bin" -a "${sbindir}" = "${exec_prefix}/bin" ]; then
+		ln -snf bin ${D}${exec_prefix}/sbin
+	fi
+}
+
+addtask install_merged_usr after do_install before do_package do_populate_sysroot
+
+
 DISTRO_VERSION[vardepsexclude] += "DATE"
 do_install_basefilesissue () {
 	if [ "${hostname}" ]; then
-- 
2.6.4


