Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 134C46012C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 03:46:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAJ3k51n005341
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 19:46:05 -0800
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 18 Nov 2015 19:46:03 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Nov 2015 19:46:02 -0800
Message-ID: <697e3410a7668ae4656a66a46e6c49bd21fda616.1447904699.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1447904699.git.liezhi.yang@windriver.com>
References: <cover.1447904699.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] rpm: Generate per distribution and multilib macro files
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
X-List-Received-Date: Thu, 19 Nov 2015 03:46:06 -0000
Content-Type: text/plain

From: Mark Hatle <mark.hatle@windriver.com>

The distribution and multilib macro files are required for rpmbuild, on the
target, to work properly.  These override the default settings from the
upstream macro files with the proper values for the OE configuration.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.14.bb |   81 +++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index 3930410..96e46f3 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -115,6 +115,9 @@ inherit autotools gettext
 
 acpaths = "-I ${S}/db/dist/aclocal -I ${S}/db/dist/aclocal_java"
 
+# The local distribution macro directory
+distromacrodir = "${libdir}/rpm/poky"
+
 # Specify the default rpm macros in terms of adjustable variables
 rpm_macros = "%{_usrlibrpm}/macros:%{_usrlibrpm}/${DISTRO}/macros:%{_usrlibrpm}/${DISTRO}/%{_target}/macros:%{_etcrpm}/macros.*:%{_etcrpm}/macros:%{_etcrpm}/%{_target}/macros:~/.oerpmmacros"
 rpm_macros_class-native = "%{_usrlibrpm}/macros:%{_usrlibrpm}/${DISTRO}/macros:%{_usrlibrpm}/${DISTRO}/%{_target}/macros:~/.oerpmmacros"
@@ -339,6 +342,7 @@ FILES_${PN}-build = "${prefix}/src/rpm \
 		${libdir}/rpm/vpkg-provides.sh \
 		${libdir}/rpm/vpkg-provides2.sh \
 		${libdir}/rpm/perfile_rpmdeps.sh \
+		${distromacrodir} \
 		"
 RDEPENDS_${PN} = "base-files run-postinsts"
 RDEPENDS_${PN}_class-native = ""
@@ -479,6 +483,83 @@ do_install_append() {
 
 }
 
+do_install_append_class-target() {
+	# Create and install distribution specific macros
+	mkdir -p ${D}/${distromacrodir}
+	cat << EOF > ${D}/${distromacrodir}/macros
+%_defaultdocdir		${docdir}
+
+%_prefix                ${prefix}
+%_exec_prefix           ${exec_prefix}
+%_datarootdir           ${datadir}
+%_bindir                ${bindir}
+%_sbindir               ${sbindir}
+%_libexecdir            %{_libdir}/%{name}
+%_datadir               ${datadir}
+%_sysconfdir            ${sysconfdir}
+%_sharedstatedir        ${sharedstatedir}
+%_localstatedir         ${localstatedir}
+%_lib                   lib
+%_libdir                %{_exec_prefix}/%{_lib}
+%_includedir            ${includedir}
+%_oldincludedir         ${oldincludedir}
+%_infodir               ${infodir}
+%_mandir                ${mandir}
+%_localedir             %{_libdir}/locale
+EOF
+
+	# Create and install multilib specific macros
+	${@multilib_rpmmacros(d)}
+}
+
+def multilib_rpmmacros(d):
+    localdata = d.createCopy()
+    # We need to clear the TOOLCHAIN_OPTIONS (--sysroot)
+    localdata.delVar('TOOLCHAIN_OPTIONS')
+
+    # Set 'localdata' values to be consistent with 'd' values.
+    localdata.setVar('distromacrodir', d.getVar('distromacrodir', True))
+    localdata.setVar('WORKDIR', d.getVar('WORKDIR', True))
+
+    ret = gen_arch_macro(localdata)
+
+    variants = d.getVar("MULTILIB_VARIANTS", True) or ""
+    for item in variants.split():
+        # Load overrides from 'd' to avoid having to reset the value...
+        localdata = d.createCopy()
+        overrides = d.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
+        localdata.setVar("OVERRIDES", overrides)
+        localdata.setVar("MLPREFIX", item + "-")
+        bb.data.update_data(localdata)
+        ret += gen_arch_macro(localdata)
+    return ret
+
+def gen_arch_macro(d):
+    # Generate shell script to produce the file as part of do_install
+    val  = "mkdir -p ${D}/${distromacrodir}/${TARGET_ARCH}-${TARGET_OS}\n"
+    val += "cat << EOF > ${D}/${distromacrodir}/${TARGET_ARCH}-${TARGET_OS}/macros\n"
+    val += "%_lib               ${baselib}\n"
+    val += "%_libdir            ${libdir}\n"
+    val += "%_localedir         ${localedir}\n"
+    val += "\n"
+    val += "# Toolchain configuration\n"
+    val += "%TOOLCHAIN_OPTIONS  %{nil}\n"
+    val += "%__ar               ${@d.getVar('AR', True).replace('$','%')}\n"
+    val += "%__as               ${@d.getVar('AS', True).replace('$','%')}\n"
+    val += "%__cc               ${@d.getVar('CC', True).replace('$','%')}\n"
+    val += "%__cpp              ${@d.getVar('CPP', True).replace('$','%')}\n"
+    val += "%__cxx              ${@d.getVar('CXX', True).replace('$','%')}\n"
+    val += "%__ld               ${@d.getVar('LD', True).replace('$','%')}\n"
+    val += "%__nm               ${@d.getVar('NM', True).replace('$','%')}\n"
+    val += "%__objcopy          ${@d.getVar('OBJCOPY', True).replace('$','%')}\n"
+    val += "%__objdump          ${@d.getVar('OBJDUMP', True).replace('$','%')}\n"
+    val += "%__ranlib           ${@d.getVar('RANLIB', True).replace('$','%')}\n"
+    val += "%__strip            ${@d.getVar('STRIP', True).replace('$','%')}\n"
+    val += "EOF\n"
+    val += "\n"
+    return d.expand(val)
+
+
 add_native_wrapper() {
         create_wrapper ${D}/${bindir}/rpm \
 		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
-- 
1.7.9.5


