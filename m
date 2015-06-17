Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CB02760557
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 17:04:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5HH4joJ013140
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 10:04:45 -0700 (PDT)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 17 Jun 2015 10:04:45 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jun 2015 12:04:42 -0500
Message-ID: <1434560682-89221-4-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1434560682-89221-1-git-send-email-mark.hatle@windriver.com>
References: <1434560682-89221-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] rpm: Generate per distribution and multilib macro files
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
X-List-Received-Date: Wed, 17 Jun 2015 17:04:45 -0000
Content-Type: text/plain

The distribution and multilib macro files are required for rpmbuild, on the
target, to work properly.  These override the default settings from the
upstream macro files with the proper values for the OE configuration.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.14.bb | 80 +++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index fb81f12..35c86bd 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -107,6 +107,9 @@ inherit autotools gettext
 
 acpaths = "-I ${S}/db/dist/aclocal -I ${S}/db/dist/aclocal_java"
 
+# The local distribution macro directory
+distromacrodir = "${libdir}/rpm/${DISTRO}"
+
 # Specify the default rpm macros in terms of adjustable variables
 rpm_macros = "%{_usrlibrpm}/macros:%{_usrlibrpm}/${DISTRO}/macros:%{_usrlibrpm}/${DISTRO}/%{_target}/macros:%{_etcrpm}/macros.*:%{_etcrpm}/macros:%{_etcrpm}/%{_target}/macros:~/.oerpmmacros"
 rpm_macros_class-native = "%{_usrlibrpm}/macros:%{_usrlibrpm}/${DISTRO}/macros:%{_usrlibrpm}/${DISTRO}/%{_target}/macros:~/.oerpmmacros"
@@ -331,6 +334,7 @@ FILES_${PN}-build = "${prefix}/src/rpm \
 		${libdir}/rpm/vpkg-provides.sh \
 		${libdir}/rpm/vpkg-provides2.sh \
 		${libdir}/rpm/perfile_rpmdeps.sh \
+		${distromacrodir} \
 		"
 RDEPENDS_${PN} = "base-files run-postinsts"
 RDEPENDS_${PN}_class-native = ""
@@ -472,6 +476,82 @@ do_install_append() {
 
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
+    # Set it to the consistent of 'd'.
+    localdata.setVar('distromacrodir', d.getVar('distromacrodir', True))
+    localdata.setVar('WORKDIR', d.getVar('WORKDIR', True))
+
+    ret = gen_arch_macro(localdata)
+
+    variants = d.getVar("MULTILIB_VARIANTS", True) or ""
+    for item in variants.split():
+        # Load overrides from 'd' to avoid having to reset the value...
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
1.9.3


