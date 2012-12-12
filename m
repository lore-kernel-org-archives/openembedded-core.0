Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TirKY-0003Mk-JW
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 19:46:55 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Dec 2012 10:32:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,267,1355126400"; d="scan'208";a="263101150"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.189])
	by fmsmga002.fm.intel.com with ESMTP; 12 Dec 2012 10:32:21 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Dec 2012 18:31:34 +0000
Message-Id: <c278681893d342b427c5a67018f24f1c9488875f.1355337025.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1355337025.git.paul.eggleton@linux.intel.com>
References: <cover.1355337025.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1355337025.git.paul.eggleton@linux.intel.com>
References: <cover.1355337025.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v3 10/13] rpm/smart: Fix runtime-relocation issues w/ RPM and Smart
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Dec 2012 18:46:55 -0000

From: Mark Hatle <mark.hatle@windriver.com>

Fix runtime-relocation issues with the RPM and Smart wrappers.

In addition the patches were necessary to fix related problems.
The changes to the includes three categories of issues:
  *) Incorrect pathname evaluations
  *) Incorrect evaluation of the /etc/rpm/platform file contents
  *) Confusing vendor #define checks

Finally, a simple way to debug the platformScore was added as
that is necessary to debug how this works and into the smart system.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../python/python-smartpm_1.4.1.bb                 |   17 +++-
 .../rpm/rpm/rpm-debug-platform.patch               |   65 +++++++++++++++
 meta/recipes-devtools/rpm/rpm/rpm-platform.patch   |    2 +-
 meta/recipes-devtools/rpm/rpm/rpm-platform2.patch  |   87 +++++++++++++++-----
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |   41 +++++----
 5 files changed, 173 insertions(+), 39 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-debug-platform.patch

diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
index 53f232b..04f61f8 100644
--- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
+++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
@@ -11,7 +11,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
 
 DEPENDS = "python rpm"
-PR = "r4"
+PR = "r5"
 SRCNAME = "smart"
 
 SRC_URI = "\
@@ -87,6 +87,21 @@ do_install_append() {
    fi
 }
 
+add_native_wrapper() {
+        create_wrapper ${D}/${bindir}/smart \
+		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
+		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
+		RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/locale
+}
+
+do_install_append_class-native() {
+        add_native_wrapper
+}
+
+do_install_append_class-nativesdk() {
+        add_native_wrapper
+}
+
 PACKAGES = "${PN}-dev ${PN}-dbg ${PN}-doc smartpm \
             ${@base_contains('PACKAGECONFIG', 'rpm', '${PN}-backend-rpm', '', d)} \
             ${@base_contains('PACKAGECONFIG', 'qt4', '${PN}-interface-qt4', '', d)} \
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-debug-platform.patch b/meta/recipes-devtools/rpm/rpm/rpm-debug-platform.patch
new file mode 100644
index 0000000..25ebbdc
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-debug-platform.patch
@@ -0,0 +1,65 @@
+Debug the platform score generation...
+
+Index: rpm-5.4.9/lib/rpmrc.c
+===================================================================
+--- rpm-5.4.9.orig/lib/rpmrc.c
++++ rpm-5.4.9/lib/rpmrc.c
+@@ -465,6 +465,8 @@ static rpmRC rpmPlatform(const char * pl
+ 
+     rc = (rpmRC) rpmiobSlurp(platform, &iob);
+ 
++    fprintf(stderr, "D: rpmPlatform file %s\n", platform);
++
+     if (rc || iob == NULL) {
+ 	rc = RPMRC_FAIL;
+ 	goto exit;
+@@ -486,6 +488,7 @@ static rpmRC rpmPlatform(const char * pl
+ 	    while (--t > p && xisspace(*t))
+ 		*t = '\0';
+ 	    if (t > p) {
++		fprintf(stderr, "D: rpmPlatform mireAppend REGEX %s\n", p);
+ 		xx = mireAppend(RPMMIRE_REGEX, 0, p, NULL, &mi_re, &mi_nre);
+ 	    }
+ 	    continue;
+@@ -503,6 +506,11 @@ static rpmRC rpmPlatform(const char * pl
+ 		_gnu = rpmExpand("-", cvog->gnu, NULL);
+ 
+ 	    addMacro(NULL, "_platform_gnu", NULL, (_gnu ? _gnu : ""), -1);
++	    fprintf(stderr, "D: rpmPlatform addMacro %s-%s-%s(%s)\n",
++	    	rpmExpand("%{_platform_cpu}", NULL),
++		rpmExpand("%{_platform_vendor}", NULL),
++		rpmExpand("%{_platform_os}", NULL),
++		rpmExpand("%{_platform_gnu}", NULL));
+ #else
+ 	    addMacro(NULL, "_host_cpu", NULL, cvog->cpu, -1);
+ 	    addMacro(NULL, "_host_vendor", NULL, cvog->vendor, -1);
+@@ -510,6 +518,7 @@ static rpmRC rpmPlatform(const char * pl
+ #endif
+ 	}
+ 
++	fprintf(stderr, "D: rpmPlatform mireAppend STRCMP %s -- ", p);
+ #if defined(RPM_VENDOR_OPENPKG) /* explicit-platform */
+ 	/* do not use vendor and GNU attribution */
+ 	p = rpmExpand("%{_host_cpu}-%{_host_os}", NULL);
+@@ -518,6 +527,7 @@ static rpmRC rpmPlatform(const char * pl
+ 		(cvog && *cvog->gnu ? "-" : NULL),
+ 		(cvog ? cvog->gnu : NULL), NULL);
+ #endif
++	fprintf(stderr, "%s\n", p);
+ 	xx = mireAppend(RPMMIRE_STRCMP, 0, p, NULL, &mi_re, &mi_nre);
+ 	p = _free(p);
+ 	
+@@ -686,9 +696,12 @@ int rpmPlatformScore(const char * platfo
+ 
+     if ((mire = (miRE) mi_re) != NULL)
+     for (i = 0; i < mi_nre; i++) {
+-	if (mireRegexec(mire + i, platform, 0) >= 0)
++	if (mireRegexec(mire + i, platform, 0) >= 0) {
++	    fprintf(stderr, "D: rpmPlatformScore %s (%d)\n", platform, i + 1);
+ 	    return (i + 1);
++	}
+     }
++    fprintf(stderr, "D: rpmPlatformScore %s (%d)\n", platform, 0);
+     return 0;
+ }
+ /*@=onlytrans@*/
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-platform.patch b/meta/recipes-devtools/rpm/rpm/rpm-platform.patch
index 7b81857..9e167d8 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-platform.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-platform.patch
@@ -40,7 +40,7 @@ diff -ur rpm-5.4.0.orig/lib/depends.c rpm-5.4.0/lib/depends.c
      return rc;
  }
  
-+#if defined(RPM_VENDOR_WINDRIVER)
++#if defined(RPM_VENDOR_WINDRIVER) || defined(RPM_VENDOR_POKY)
 +#define _ETC_RPM_SYSINFO        "%{_etcrpm}/sysinfo"
 +#else
 +#define _ETC_RPM_SYSINFO        SYSCONFIGDIR "/sysinfo"
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-platform2.patch b/meta/recipes-devtools/rpm/rpm/rpm-platform2.patch
index 3d50e46..6683d8f 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-platform2.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-platform2.patch
@@ -3,10 +3,13 @@ Fix up platform and related sysinfo file loading (part 2).
 Upstream-Status: Pending
 
 We need to ensure that we set the _gnu flag somehow.  We do this by reading
-from the platform file, and setting a new platform_gnu and related vars.
+from the platform file, and setting a new _platform_gnu and related vars.
 
-We then check for the existance of these things and change the configure
-time defaults to the run-time values as necessary.
+The default values of _host_cpu, _host_vendor and _host_os are changed to
+reference either the automatically determined _target_... or _platform_...
+values.  The macros file uses the configure time defaults in _platform_...
+versions have not been defined.  This preserves existing behavior, but
+ensures reasonable defaults are always available.
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
@@ -14,17 +17,43 @@ Index: rpm-5.4.9/lib/rpmrc.c
 ===================================================================
 --- rpm-5.4.9.orig/lib/rpmrc.c
 +++ rpm-5.4.9/lib/rpmrc.c
-@@ -487,9 +487,10 @@ static rpmRC rpmPlatform(const char * pl
+@@ -328,10 +328,15 @@ static void setDefaults(void)
+ 	/*@modifies rpmGlobalMacroContext, internalState @*/
+ {
+ 
+-#if defined(RPM_VENDOR_WINDRIVER)
++#if defined(RPM_VENDOR_WINDRIVER) || defined(RPM_VENDOR_POKY)
+     addMacro(NULL, "_usrlibrpm", NULL, __usrlibrpm, RMIL_DEFAULT);
+     addMacro(NULL, "_etcrpm", NULL, __etcrpm, RMIL_DEFAULT);
+     addMacro(NULL, "_vendor", NULL, "%{?_host_vendor}%{!?_host_vendor:wrs}", RMIL_DEFAULT);
++
++    addMacro(NULL, "_host_cpu", NULL, "%{?_platform_cpu}%{!?_platform_cpu:%{?_target_cpu}}", RMIL_DEFAULT);
++    addMacro(NULL, "_host_vendor", NULL, "%{?_platform_vendor}%{!?_platform_cpu:%{?_target_vendor}}", RMIL_DEFAULT);
++    addMacro(NULL, "_host_os", NULL, "%{?_platform_os}%{!?_platform_os:%{?_target_os}}", RMIL_DEFAULT);
++    addMacro(NULL, "_host_gnu", NULL, "%{?_platform_gnu}%{!?_platform_gnu:%{?_gnu}}", RMIL_DEFAULT);
+ #endif
+ 
+     addMacro(NULL, "_usr", NULL, USRPREFIX, RMIL_DEFAULT);
+@@ -487,9 +492,22 @@ static rpmRC rpmPlatform(const char * pl
  	}
  
  	if (!parseCVOG(p, &cvog) && cvog != NULL) {
--	    addMacro(NULL, "_host_cpu", NULL, cvog->cpu, -1);
--	    addMacro(NULL, "_host_vendor", NULL, cvog->vendor, -1);
--	    addMacro(NULL, "_host_os", NULL, cvog->os, -1);
++#if defined(RPM_VENDOR_POKY)
++	    char * _gnu = NULL;
++
 +	    addMacro(NULL, "_platform_cpu", NULL, cvog->cpu, -1);
 +	    addMacro(NULL, "_platform_vendor", NULL, cvog->vendor, -1);
 +	    addMacro(NULL, "_platform_os", NULL, cvog->os, -1);
-+	    addMacro(NULL, "_platform_gnu", NULL, cvog->gnu, -1);
++
++	    if (cvog->gnu && cvog->gnu[0] != '\0')
++		_gnu = rpmExpand("-", cvog->gnu, NULL);
++
++	    addMacro(NULL, "_platform_gnu", NULL, (_gnu ? _gnu : ""), -1);
++#else
+ 	    addMacro(NULL, "_host_cpu", NULL, cvog->cpu, -1);
+ 	    addMacro(NULL, "_host_vendor", NULL, cvog->vendor, -1);
+ 	    addMacro(NULL, "_host_os", NULL, cvog->os, -1);
++#endif
  	}
  
  #if defined(RPM_VENDOR_OPENPKG) /* explicit-platform */
@@ -32,25 +61,45 @@ Index: rpm-5.4.9/macros/macros.in
 ===================================================================
 --- rpm-5.4.9.orig/macros/macros.in
 +++ rpm-5.4.9/macros/macros.in
-@@ -873,7 +873,7 @@ $_arbitrary_tags_tests	Foo:Bar
- %_build_arch		@RPMCANONARCH@
- %_vendor		@RPMCANONVENDOR@
+@@ -875,9 +875,9 @@ $_arbitrary_tags_tests	Foo:Bar
  %_os			@RPMCANONOS@
--%_gnu			@RPMCANONGNU@
-+%_gnu			%{?_platform_gnu:-%{_platform_gnu}}%{!?_platform_gnu:@RPMCANONGNU@}
+ %_gnu			@RPMCANONGNU@
+ 
+-%_host_platform		%{_host_cpu}-%{_host_vendor}-%{_host_os}%{?_gnu}
+-%_build_platform	%{_build_cpu}-%{_build_vendor}-%{_build_os}%{?_gnu}
+-%_target_platform	%{_target_cpu}-%{_target_vendor}-%{_target_os}%{?_gnu}
++%_host_platform		%{_host_cpu}-%{_host_vendor}-%{_host_os}%{?_host_gnu}%{!?_host_gnu:%{?_gnu}}
++%_build_platform	%{_build_cpu}-%{_build_vendor}-%{_build_os}%{?_host_gnu}%{!?_host_gnu:%{?_gnu}}
++%_target_platform	%{_target_cpu}-%{_target_vendor}-%{_target_os}%{?_host_gnu}%{!?_host_gnu:%{?_gnu}}
  
- %_host_platform		%{_host_cpu}-%{_host_vendor}-%{_host_os}%{?_gnu}
- %_build_platform	%{_build_cpu}-%{_build_vendor}-%{_build_os}%{?_gnu}
-@@ -920,9 +920,9 @@ $_arbitrary_tags_tests	Foo:Bar
+ #==============================================================================
+ # ---- configure macros.
+@@ -920,9 +920,10 @@ $_arbitrary_tags_tests	Foo:Bar
  %_build_os		%{_host_os}
  %_host			@host@
  %_host_alias		@host_alias@%{nil}
 -%_host_cpu		@host_cpu@
 -%_host_vendor		@host_vendor@
 -%_host_os		@host_os@
-+%_host_cpu		%{?_platform_cpu}%{!?_platform_cpu:@host_cpu@}
-+%_host_vendor		%{?_platform_vendor}%{!?_platform_vendor:@host_vendor@}
-+%_host_os		%{?_platform_os}%{!?_platform_os:@host_os@}
++%_host_cpu		%{?_platform_cpu}%{!?_platform_cpu:%{_arch}}
++%_host_vendor		%{?_platform_vendor}%{!?_platform_vendor:%{_vendor}}
++%_host_os		%{?_platform_os}%{!?_platform_os:%{_os}}
++%_host_gnu		%{?_platform_gnu}%{!?_platform_gnu:%{_gnu}}
  %_target		%{_host}
  %_target_alias		%{_host_alias}
  %_target_cpu		%{_host_cpu}
+Index: rpm-5.4.9/python/rpmmodule.c
+===================================================================
+--- rpm-5.4.9.orig/python/rpmmodule.c
++++ rpm-5.4.9/python/rpmmodule.c
+@@ -65,8 +65,8 @@ static PyObject * archScore(PyObject * s
+     if (!PyArg_ParseTupleAndKeywords(args, kwds, "s", kwlist, &arch))
+ 	return NULL;
+ 
+-#if defined(RPM_VENDOR_WINDRIVER)
+-    platform = rpmExpand(arch, "-%{_host_vendor}", "-%{_host_os}%{?_gnu}", NULL);
++#if defined(RPM_VENDOR_WINDRIVER) || defined(RPM_VENDOR_POKY)
++    platform = rpmExpand(arch, "-%{_host_vendor}", "-%{_host_os}%{?_host_gnu}%{!?_host_gnu:%{?_gnu}}", NULL);
+ #else
+     platform = rpmExpand(arch, "-", "%{_vendor}", "-", "%{_os}", NULL);
+ #endif
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index 7311d0e..be76f24 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "libpcre attr acl popt ossp-uuid file bison-native"
-PR = "r58"
+PR = "r59"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -86,6 +86,11 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
 	   file://rpm-platform2.patch \
 	  "
 
+# Uncomment the following line to enable platform score debugging
+# This is useful when identifying issues with Smart being unable
+# to process certain package feeds.
+#SRC_URI += "file://rpm-debug-platform.patch"
+
 SRC_URI[md5sum] = "60d56ace884340c1b3fcac6a1d58e768"
 SRC_URI[sha256sum] = "bac7cc5bd9d0e8262fdc0099349924608da8f680f5cb243751f696552239dde8"
 
@@ -150,7 +155,7 @@ PACKAGECONFIG[tcl] = "--with-tcl,--without-tcl,tcl,"
 PACAKGECONFIG[augeas] = "--with-augeas,--without-augeas,augeas,"
 
 EXTRA_OECONF += "--verbose \
-		--sysconfdir=/etc \
+		--sysconfdir=${sysconfdir} \
 		--with-file \
 		--with-path-magic=%{_usrlibrpm}/../../share/misc/magic.mgc \
 		--with-syck=internal \
@@ -226,7 +231,7 @@ FILES_${PN}-dbg += "${libdir}/rpm/.debug \
 
 FILES_${PN}-common = "${bindir}/rpm2cpio \
 		${bindir}/gendiff \
-		/etc/rpm \
+		${sysconfdir}/rpm \
 		/var/spool/repackage \
 		"
 
@@ -444,30 +449,30 @@ do_install_append() {
 
 do_install_append_class-native() {
         create_wrapper ${D}/${bindir}/rpm \
-		RPM_USRLIBRPM=${STAGING_LIBDIR_NATIVE}/rpm \
-		RPM_ETCRPM=${STAGING_ETCDIR_NATIVE}/rpm \
-		RPM_LOCALEDIRRPM=${STAGING_DATADIR_NATIVE}/locale
+		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
+		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
+		RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/locale
 
         create_wrapper ${D}/${bindir}/rpm2cpio \
-		RPM_USRLIBRPM=${STAGING_LIBDIR_NATIVE}/rpm \
-		RPM_ETCRPM=${STAGING_ETCDIR_NATIVE}/rpm \
-		RPM_LOCALEDIRRPM=${STAGING_DATADIR_NATIVE}/locale
+		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
+		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
+		RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/locale
 
         create_wrapper ${D}/${bindir}/rpmbuild \
-		RPM_USRLIBRPM=${STAGING_LIBDIR_NATIVE}/rpm \
-		RPM_ETCRPM=${STAGING_ETCDIR_NATIVE}/rpm \
-		RPM_LOCALEDIRRPM=${STAGING_DATADIR_NATIVE}/locale
+		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
+		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
+		RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/locale
 
         create_wrapper ${D}/${bindir}/rpmconstant \
-		RPM_USRLIBRPM=${STAGING_LIBDIR_NATIVE}/rpm \
-		RPM_ETCRPM=${STAGING_ETCDIR_NATIVE}/rpm \
-		RPM_LOCALEDIRRPM=${STAGING_DATADIR_NATIVE}/locale
+		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
+		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
+		RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/locale
 
 	for rpm_binary in ${D}/${libdir}/rpm/bin/rpm*; do
         	create_wrapper $rpm_binary
-			RPM_USRLIBRPM=${STAGING_LIBDIR_NATIVE}/rpm \
-			RPM_ETCRPM=${STAGING_ETCDIR_NATIVE}/rpm \
-			RPM_LOCALEDIRRPM=${STAGING_DATADIR_NATIVE}/locale
+			RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
+			RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
+			RPM_LOCALEDIRRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('datadir', True), d.getVar('bindir', True))}/locale
 	done
 
 	# Adjust popt macros to match...
-- 
1.7.10.4



