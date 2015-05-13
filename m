Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9DFB173FE4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 02:27:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4D2RfOu029876
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 19:27:41 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Tue, 12 May 2015 19:27:40 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 May 2015 10:23:06 +0800
Message-ID: <1431483786-32699-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][Resend] apt: upgrade to 1.0.9.9
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
X-List-Received-Date: Wed, 13 May 2015 02:27:41 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Upgrade to fix the several CVEs: CVE-2014-0488, CVE-2014-0490
Remove apt-0.9.9.4-CVE-2014-0478.patch, which was backport.
Romve no-ko-translation.patch, apt-1.0.9.9 has ko translation
Update use-host.patch no-curl.patch db_linking_hack.patch and
noconfigure.patch
Not build the test cases since it requires gtest

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../apt-0.9.9.4/apt-0.9.9.4-CVE-2014-0478.patch    | 193 ---------------------
 .../apt/apt-0.9.9.4/no-ko-translation.patch        |  11 --
 .../disable-configure-in-makefile.patch            |   0
 .../apt/apt-1.0.9.9/disable-test.patch             |  58 +++++++
 .../fix-gcc-4.6-null-not-defined.patch             |   0
 .../{apt-0.9.9.4 => apt-1.0.9.9}/makerace.patch    |   0
 .../{apt-0.9.9.4 => apt-1.0.9.9}/no-nls-dpkg.patch |   0
 .../{apt-0.9.9.4 => apt-1.0.9.9}/noconfigure.patch |  17 +-
 .../apt/{apt-0.9.9.4 => apt-1.0.9.9}/nodoc.patch   |   0
 .../truncate-filename.patch                        |   0
 .../{apt-0.9.9.4 => apt-1.0.9.9}/use-host.patch    |   6 +-
 ...apt-native_0.9.9.4.bb => apt-native_1.0.9.9.bb} |   4 +-
 meta/recipes-devtools/apt/apt.inc                  |   5 +-
 .../apt/{apt_0.9.9.4.bb => apt_1.0.9.9.bb}         |   4 +-
 .../apt/files/db_linking_hack.patch                |   6 +-
 meta/recipes-devtools/apt/files/no-curl.patch      |   8 +-
 16 files changed, 83 insertions(+), 229 deletions(-)
 delete mode 100644 meta/recipes-devtools/apt/apt-0.9.9.4/apt-0.9.9.4-CVE-2014-0478.patch
 delete mode 100644 meta/recipes-devtools/apt/apt-0.9.9.4/no-ko-translation.patch
 rename meta/recipes-devtools/apt/{apt-0.9.9.4 => apt-1.0.9.9}/disable-configure-in-makefile.patch (100%)
 create mode 100644 meta/recipes-devtools/apt/apt-1.0.9.9/disable-test.patch
 rename meta/recipes-devtools/apt/{apt-0.9.9.4 => apt-1.0.9.9}/fix-gcc-4.6-null-not-defined.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.9.4 => apt-1.0.9.9}/makerace.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.9.4 => apt-1.0.9.9}/no-nls-dpkg.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.9.4 => apt-1.0.9.9}/noconfigure.patch (54%)
 rename meta/recipes-devtools/apt/{apt-0.9.9.4 => apt-1.0.9.9}/nodoc.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.9.4 => apt-1.0.9.9}/truncate-filename.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.9.4 => apt-1.0.9.9}/use-host.patch (84%)
 rename meta/recipes-devtools/apt/{apt-native_0.9.9.4.bb => apt-native_1.0.9.9.bb} (55%)
 rename meta/recipes-devtools/apt/{apt_0.9.9.4.bb => apt_1.0.9.9.bb} (74%)

diff --git a/meta/recipes-devtools/apt/apt-0.9.9.4/apt-0.9.9.4-CVE-2014-0478.patch b/meta/recipes-devtools/apt/apt-0.9.9.4/apt-0.9.9.4-CVE-2014-0478.patch
deleted file mode 100644
index 79a6897..0000000
--- a/meta/recipes-devtools/apt/apt-0.9.9.4/apt-0.9.9.4-CVE-2014-0478.patch
+++ /dev/null
@@ -1,193 +0,0 @@
-This patch comes from:
-https://bugs.debian.org/cgi-bin/bugreport.cgi?msg=73;filename=apt_0.9.7.9%2Bdeb7u2.debdiff;att=1;bug=749795
-
-Upstream-Status: Backport
-
-Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
-Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
-
-diff -uarN apt-0.9.9.4-org/cmdline/apt-get.cc apt-0.9.9.4/cmdline/apt-get.cc
---- apt-0.9.9.4-org/cmdline/apt-get.cc	2014-08-29 15:37:42.587156134 +0800
-+++ apt-0.9.9.4/cmdline/apt-get.cc	2014-08-29 15:51:16.672334086 +0800
-@@ -1046,25 +1046,8 @@
-    return true;
- }
- 									/*}}}*/
--// CheckAuth - check if each download comes form a trusted source	/*{{{*/
--// ---------------------------------------------------------------------
--/* */
--static bool CheckAuth(pkgAcquire& Fetcher)
-+static bool AuthPrompt(std::string UntrustedList, bool const PromptUser)
- {
--   string UntrustedList;
--   for (pkgAcquire::ItemIterator I = Fetcher.ItemsBegin(); I < Fetcher.ItemsEnd(); ++I)
--   {
--      if (!(*I)->IsTrusted())
--      {
--         UntrustedList += string((*I)->ShortDesc()) + " ";
--      }
--   }
--
--   if (UntrustedList == "")
--   {
--      return true;
--   }
--        
-    ShowList(c2out,_("WARNING: The following packages cannot be authenticated!"),UntrustedList,"");
- 
-    if (_config->FindB("APT::Get::AllowUnauthenticated",false) == true)
-@@ -1073,6 +1056,9 @@
-       return true;
-    }
- 
-+   if (PromptUser == false)
-+      return _error->Error(_("Some packages could not be authenticated"));
-+
-    if (_config->FindI("quiet",0) < 2
-        && _config->FindB("APT::Get::Assume-Yes",false) == false)
-    {
-@@ -1090,6 +1076,28 @@
-    return _error->Error(_("There are problems and -y was used without --force-yes"));
- }
- 									/*}}}*/
-+// CheckAuth - check if each download comes form a trusted source	/*{{{*/
-+// ---------------------------------------------------------------------
-+/* */
-+static bool CheckAuth(pkgAcquire& Fetcher, bool PromptUser=true)
-+{
-+   string UntrustedList;
-+   for (pkgAcquire::ItemIterator I = Fetcher.ItemsBegin(); I < Fetcher.ItemsEnd(); ++I)
-+   {
-+      if (!(*I)->IsTrusted())
-+      {
-+         UntrustedList += string((*I)->ShortDesc()) + " ";
-+      }
-+   }
-+
-+   if (UntrustedList == "")
-+   {
-+      return true;
-+   }
-+
-+   return AuthPrompt(UntrustedList, PromptUser);
-+}
-+
- // InstallPackages - Actually download and install the packages		/*{{{*/
- // ---------------------------------------------------------------------
- /* This displays the informative messages describing what is going to 
-@@ -2482,6 +2490,7 @@
- 
-    // Load the requestd sources into the fetcher
-    unsigned J = 0;
-+   std::string UntrustedList;
-    for (const char **I = CmdL.FileList + 1; *I != 0; I++, J++)
-    {
-       string Src;
-@@ -2491,7 +2500,10 @@
- 	 delete[] Dsc;
- 	 return _error->Error(_("Unable to find a source package for %s"),Src.c_str());
-       }
--      
-+     
-+      if (Last->Index().IsTrusted() == false)
-+         UntrustedList += Src + " ";
-+ 
-       string srec = Last->AsStr();
-       string::size_type pos = srec.find("\nVcs-");
-       while (pos != string::npos)
-@@ -2575,7 +2587,11 @@
- 			Last->Index().SourceInfo(*Last,*I),Src);
-       }
-    }
--   
-+
-+   // check authentication status of the source as well
-+   if (UntrustedList != "" && !AuthPrompt(UntrustedList, false))
-+      return false;  
-+ 
-    // Display statistics
-    unsigned long long FetchBytes = Fetcher.FetchNeeded();
-    unsigned long long FetchPBytes = Fetcher.PartialPresent();
-diff -uarN apt-0.9.9.4-org/test/integration/framework apt-0.9.9.4/test/integration/framework
---- apt-0.9.9.4-org/test/integration/framework	2014-08-29 15:37:42.623156154 +0800
-+++ apt-0.9.9.4/test/integration/framework	2014-08-29 15:55:23.592197940 +0800
-@@ -151,7 +151,7 @@
- 	mkdir rootdir aptarchive keys
- 	cd rootdir
- 	mkdir -p etc/apt/apt.conf.d etc/apt/sources.list.d etc/apt/trusted.gpg.d etc/apt/preferences.d
--	mkdir -p var/cache var/lib var/log
-+	mkdir -p var/cache var/lib var/log tmp
- 	mkdir -p var/lib/dpkg/info var/lib/dpkg/updates var/lib/dpkg/triggers
- 	touch var/lib/dpkg/available
- 	mkdir -p usr/lib/apt
-@@ -910,3 +910,35 @@
- 	local IGNORE
- 	read IGNORE
- }
-+
-+testsuccess() {
-+	if [ "$1" = '--nomsg' ]; then
-+		shift
-+	else
-+		msgtest 'Test for successful execution of' "$*"
-+	fi
-+	local OUTPUT="${TMPWORKINGDIRECTORY}/rootdir/tmp/testsuccess.output"
-+	if $@ >${OUTPUT} 2>&1; then
-+		msgpass
-+	else
-+		echo >&2
-+		cat >&2 $OUTPUT
-+		msgfail
-+	fi
-+}
-+
-+testfailure() {
-+	if [ "$1" = '--nomsg' ]; then
-+		shift
-+	else
-+		msgtest 'Test for failure in execution of' "$*"
-+	fi
-+	local OUTPUT="${TMPWORKINGDIRECTORY}/rootdir/tmp/testfailure.output"
-+	if $@ >${OUTPUT} 2>&1; then
-+		echo >&2
-+		cat >&2 $OUTPUT
-+		msgfail
-+	else
-+		msgpass
-+	fi
-+}
-diff -uarN apt-0.9.9.4-org/test/integration/test-apt-get-source-authenticated apt-0.9.9.4/test/integration/test-apt-get-source-authenticated
---- apt-0.9.9.4-org/test/integration/test-apt-get-source-authenticated	1970-01-01 08:00:00.000000000 +0800
-+++ apt-0.9.9.4/test/integration/test-apt-get-source-authenticated	2014-08-29 15:58:06.137156796 +0800
-@@ -0,0 +1,31 @@
-+#!/bin/sh
-+#
-+# Regression test for debian bug #749795. Ensure that we fail with
-+# a error if apt-get source foo will download a source that comes
-+# from a unauthenticated repository
-+#
-+set -e
-+
-+TESTDIR=$(readlink -f $(dirname $0))
-+. $TESTDIR/framework
-+
-+setupenvironment
-+configarchitecture "i386"
-+
-+# a "normal" package with source and binary
-+buildsimplenativepackage 'foo' 'all' '2.0'
-+
-+setupaptarchive --no-update
-+
-+APTARCHIVE=$(readlink -f ./aptarchive)
-+rm -f $APTARCHIVE/dists/unstable/*Release*
-+
-+# update without authenticated InRelease file
-+testsuccess aptget update
-+
-+# this all should fail
-+testfailure aptget install -y foo
-+testfailure aptget source foo
-+
-+# allow overriding the warning
-+testsuccess aptget source --allow-unauthenticated foo
diff --git a/meta/recipes-devtools/apt/apt-0.9.9.4/no-ko-translation.patch b/meta/recipes-devtools/apt/apt-0.9.9.4/no-ko-translation.patch
deleted file mode 100644
index 7aa408f..0000000
--- a/meta/recipes-devtools/apt/apt-0.9.9.4/no-ko-translation.patch
+++ /dev/null
@@ -1,11 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
----
- po/LINGUAS |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/po/LINGUAS
-+++ b/po/LINGUAS
-@@ -1 +1 @@
--ar ast bg bs ca cs cy da de dz el es eu fi fr gl hu it ja km ko ku lt mr nb ne nl nn pl pt pt_BR ro ru sk sl sv th tl uk vi zh_CN zh_TW
-+ar ast bg bs ca cs cy da de dz el es eu fi fr gl hu it ja km ku lt mr nb ne nl nn pl pt pt_BR ro ru sk sl sv th tl uk vi zh_CN zh_TW
diff --git a/meta/recipes-devtools/apt/apt-0.9.9.4/disable-configure-in-makefile.patch b/meta/recipes-devtools/apt/apt-1.0.9.9/disable-configure-in-makefile.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.9.9.4/disable-configure-in-makefile.patch
rename to meta/recipes-devtools/apt/apt-1.0.9.9/disable-configure-in-makefile.patch
diff --git a/meta/recipes-devtools/apt/apt-1.0.9.9/disable-test.patch b/meta/recipes-devtools/apt/apt-1.0.9.9/disable-test.patch
new file mode 100644
index 0000000..676795d
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt-1.0.9.9/disable-test.patch
@@ -0,0 +1,58 @@
+[PATCH] disable test
+
+Upstream-Status: Inappropriate [configuration]
+
+test needs gtest package, so not build the test dir
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ Makefile     | 7 +++----
+ configure.ac | 6 ------
+ 2 files changed, 3 insertions(+), 10 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 5f5fb27..5070e96 100644
+--- a/Makefile
++++ b/Makefile
+@@ -9,8 +9,8 @@ endif
+ .PHONY: default
+ default: startup all
+ 
+-.PHONY: headers library clean veryclean all binary program doc test update-po
+-all headers library clean veryclean binary program doc manpages docbook test update-po startup dirs:
++.PHONY: headers library clean veryclean all binary program doc update-po
++all headers library clean veryclean binary program doc manpages docbook update-po startup dirs:
+ 	$(MAKE) -C vendor $@
+ 	$(MAKE) -C apt-pkg $@
+ 	$(MAKE) -C apt-inst $@
+@@ -21,9 +21,8 @@ all headers library clean veryclean binary program doc manpages docbook test upd
+ 	$(MAKE) -C dselect $@
+ #	$(MAKE) -C doc $@
+ 	$(MAKE) -C po $@
+-	$(MAKE) -C test $@
+ 
+-all headers library clean veryclean binary program doc manpages docbook test update-po: startup dirs
++all headers library clean veryclean binary program doc manpages docbook update-po: startup dirs
+ 
+ dirs: startup
+ 
+diff --git a/configure.ac b/configure.ac
+index 5663aaf..b0f9564 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -89,12 +89,6 @@ AC_CHECK_LIB(curl, curl_easy_init,
+      AC_MSG_ERROR([failed: I need CURL due https support]),
+ )
+ 
+-AC_LANG_PUSH([C++])
+-AC_CHECK_HEADER(gtest/gtest.h,,
+-     AC_MSG_ERROR([failed: I need gtest to build tests]),
+-)
+-AC_LANG_POP([C++])
+-
+ 
+ AC_SUBST(BDBLIB)
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/apt/apt-0.9.9.4/fix-gcc-4.6-null-not-defined.patch b/meta/recipes-devtools/apt/apt-1.0.9.9/fix-gcc-4.6-null-not-defined.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.9.9.4/fix-gcc-4.6-null-not-defined.patch
rename to meta/recipes-devtools/apt/apt-1.0.9.9/fix-gcc-4.6-null-not-defined.patch
diff --git a/meta/recipes-devtools/apt/apt-0.9.9.4/makerace.patch b/meta/recipes-devtools/apt/apt-1.0.9.9/makerace.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.9.9.4/makerace.patch
rename to meta/recipes-devtools/apt/apt-1.0.9.9/makerace.patch
diff --git a/meta/recipes-devtools/apt/apt-0.9.9.4/no-nls-dpkg.patch b/meta/recipes-devtools/apt/apt-1.0.9.9/no-nls-dpkg.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.9.9.4/no-nls-dpkg.patch
rename to meta/recipes-devtools/apt/apt-1.0.9.9/no-nls-dpkg.patch
diff --git a/meta/recipes-devtools/apt/apt-0.9.9.4/noconfigure.patch b/meta/recipes-devtools/apt/apt-1.0.9.9/noconfigure.patch
similarity index 54%
rename from meta/recipes-devtools/apt/apt-0.9.9.4/noconfigure.patch
rename to meta/recipes-devtools/apt/apt-1.0.9.9/noconfigure.patch
index 712d5e7..ebc6720 100644
--- a/meta/recipes-devtools/apt/apt-0.9.9.4/noconfigure.patch
+++ b/meta/recipes-devtools/apt/apt-1.0.9.9/noconfigure.patch
@@ -1,24 +1,25 @@
 Upstream-Status: Inappropriate [configuration]
 Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
 
-Index: apt-0.9.7.7/apt-pkg/packagemanager.cc
-===================================================================
---- apt-0.9.7.7.orig/apt-pkg/packagemanager.cc
-+++ apt-0.9.7.7/apt-pkg/packagemanager.cc
-@@ -893,10 +893,12 @@ bool pkgPackageManager::SmartUnPack(PkgI
+
+diff --git a/apt-pkg/packagemanager.cc b/apt-pkg/packagemanager.cc
+index 249542c..0a1911f 100644
+--- a/apt-pkg/packagemanager.cc
++++ b/apt-pkg/packagemanager.cc
+@@ -952,10 +952,12 @@ bool pkgPackageManager::SmartUnPack(PkgIterator Pkg, bool const Immediate, int c
        return false;
  
     if (Immediate == true) {
 +#if 0
        // Perform immedate configuration of the package. 
           if (SmartConfigure(Pkg, Depth + 1) == false)
-             _error->Warning(_("Could not perform immediate configuration on '%s'. "
+             _error->Error(_("Could not perform immediate configuration on '%s'. "
                 "Please see man 5 apt.conf under APT::Immediate-Configure for details. (%d)"),Pkg.FullName().c_str(),2);
 +#endif
     }
     
     return true;
-@@ -986,6 +988,7 @@ pkgPackageManager::OrderResult pkgPackag
+@@ -1038,6 +1040,7 @@ pkgPackageManager::OrderResult pkgPackageManager::OrderInstall()
        }
     }
  
@@ -26,7 +27,7 @@ Index: apt-0.9.7.7/apt-pkg/packagemanager.cc
     // Final run through the configure phase
     if (ConfigureAll() == false)
        return Failed;
-@@ -1000,6 +1003,7 @@ pkgPackageManager::OrderResult pkgPackag
+@@ -1052,6 +1055,7 @@ pkgPackageManager::OrderResult pkgPackageManager::OrderInstall()
  	 return Failed;
        }
     }
diff --git a/meta/recipes-devtools/apt/apt-0.9.9.4/nodoc.patch b/meta/recipes-devtools/apt/apt-1.0.9.9/nodoc.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.9.9.4/nodoc.patch
rename to meta/recipes-devtools/apt/apt-1.0.9.9/nodoc.patch
diff --git a/meta/recipes-devtools/apt/apt-0.9.9.4/truncate-filename.patch b/meta/recipes-devtools/apt/apt-1.0.9.9/truncate-filename.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.9.9.4/truncate-filename.patch
rename to meta/recipes-devtools/apt/apt-1.0.9.9/truncate-filename.patch
diff --git a/meta/recipes-devtools/apt/apt-0.9.9.4/use-host.patch b/meta/recipes-devtools/apt/apt-1.0.9.9/use-host.patch
similarity index 84%
rename from meta/recipes-devtools/apt/apt-0.9.9.4/use-host.patch
rename to meta/recipes-devtools/apt/apt-1.0.9.9/use-host.patch
index 25caa3b..b30fcff 100644
--- a/meta/recipes-devtools/apt/apt-0.9.9.4/use-host.patch
+++ b/meta/recipes-devtools/apt/apt-1.0.9.9/use-host.patch
@@ -1,9 +1,9 @@
 Upstream-Status: Pending
 
-Index: apt-0.9.7.7/configure.in
+Index: apt-0.9.7.7/configure.ac
 ===================================================================
---- apt-0.9.7.7.orig/configure.in
-+++ apt-0.9.7.7/configure.in
+--- apt-0.9.7.7.orig/configure.ac
++++ apt-0.9.7.7/configure.ac
 @@ -112,7 +112,7 @@ dnl This is often the dpkg architecture
  dnl First check against the full canonical canoncial-system-type in $target
  dnl and if that fails, just look for the cpu
diff --git a/meta/recipes-devtools/apt/apt-native_0.9.9.4.bb b/meta/recipes-devtools/apt/apt-native_1.0.9.9.bb
similarity index 55%
rename from meta/recipes-devtools/apt/apt-native_0.9.9.4.bb
rename to meta/recipes-devtools/apt/apt-native_1.0.9.9.bb
index d5934f9..cbaf25b 100644
--- a/meta/recipes-devtools/apt/apt-native_0.9.9.4.bb
+++ b/meta/recipes-devtools/apt/apt-native_1.0.9.9.bb
@@ -3,7 +3,7 @@ require apt-native.inc
 SRC_URI += "file://noconfigure.patch \
             file://no-curl.patch"
 
-SRC_URI[md5sum] = "72b3283acd9b99868da5545f0499b0da"
-SRC_URI[sha256sum] = "770cb94d7f4c922c2a1516f2b5ec852d3ad668a8c9c3713ac2528c861b7fa79a"
+SRC_URI[md5sum] = "e70c6d6227883cfc0dda6bc5db509bca"
+SRC_URI[sha256sum] = "96bebcd7bfee0b2386741a8315182ba39487bdd743ecf5c1fc5b8b889cca2478"
 
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
index 321934b..04fcd65 100644
--- a/meta/recipes-devtools/apt/apt.inc
+++ b/meta/recipes-devtools/apt/apt.inc
@@ -2,8 +2,7 @@ SUMMARY = "Advanced front-end for dpkg"
 LICENSE = "GPLv2.0+"
 SECTION = "base"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20130726T154545Z/pool/main/a/${BPN}/${BPN}_${PV}.tar.gz \
-           file://no-ko-translation.patch \
+SRC_URI = "http://snapshot.debian.org/archive/debian/20150428T221633Z/pool/main/a/${BPN}/${BPN}_${PV}.tar.xz \
            file://use-host.patch \
            file://makerace.patch \
            file://no-nls-dpkg.patch \
@@ -11,7 +10,7 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20130726T154545Z/pool/main/
            file://truncate-filename.patch \
            file://nodoc.patch \
            file://disable-configure-in-makefile.patch \
-           file://apt-0.9.9.4-CVE-2014-0478.patch \
+           file://disable-test.patch \
            "
 
 inherit autotools gettext
diff --git a/meta/recipes-devtools/apt/apt_0.9.9.4.bb b/meta/recipes-devtools/apt/apt_1.0.9.9.bb
similarity index 74%
rename from meta/recipes-devtools/apt/apt_0.9.9.4.bb
rename to meta/recipes-devtools/apt/apt_1.0.9.9.bb
index 77cbff1..22e941f 100644
--- a/meta/recipes-devtools/apt/apt_0.9.9.4.bb
+++ b/meta/recipes-devtools/apt/apt_1.0.9.9.bb
@@ -3,8 +3,8 @@ RDEPENDS_${PN} = "dpkg bash debianutils"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
 require apt.inc
 
-SRC_URI[md5sum] = "72b3283acd9b99868da5545f0499b0da"
-SRC_URI[sha256sum] = "770cb94d7f4c922c2a1516f2b5ec852d3ad668a8c9c3713ac2528c861b7fa79a"
+SRC_URI[md5sum] = "e70c6d6227883cfc0dda6bc5db509bca"
+SRC_URI[sha256sum] = "96bebcd7bfee0b2386741a8315182ba39487bdd743ecf5c1fc5b8b889cca2478"
 
 require apt-package.inc
 
diff --git a/meta/recipes-devtools/apt/files/db_linking_hack.patch b/meta/recipes-devtools/apt/files/db_linking_hack.patch
index d2246b3..a61d4b0 100644
--- a/meta/recipes-devtools/apt/files/db_linking_hack.patch
+++ b/meta/recipes-devtools/apt/files/db_linking_hack.patch
@@ -1,9 +1,9 @@
 Upstream-Status: Backport
 
-Index: apt-0.7.3/configure.in
+Index: apt-0.7.3/configure.ac
 ===================================================================
---- apt-0.7.3.orig/configure.in	2007-07-01 10:38:45.000000000 +0000
-+++ apt-0.7.3/configure.in	2007-08-21 13:39:26.000000000 +0000
+--- apt-0.7.3.orig/configure.ac	2007-07-01 10:38:45.000000000 +0000
++++ apt-0.7.3/configure.ac	2007-08-21 13:39:26.000000000 +0000
 @@ -67,8 +67,20 @@
        [AC_DEFINE(HAVE_BDB)
         BDBLIB="-ldb"
diff --git a/meta/recipes-devtools/apt/files/no-curl.patch b/meta/recipes-devtools/apt/files/no-curl.patch
index 9fd3b3a..30238fa 100644
--- a/meta/recipes-devtools/apt/files/no-curl.patch
+++ b/meta/recipes-devtools/apt/files/no-curl.patch
@@ -5,8 +5,8 @@ Upstream-Status: Inappropriate [configuration]
  methods/makefile |    7 -------
  2 files changed, 13 deletions(-)
 
---- a/configure.in
-+++ b/configure.in
+--- a/configure.ac
++++ b/configure.ac
 @@ -86,12 +86,6 @@ AC_CHECK_HEADER(db.h,
  
  LIBS="$saveLIBS"
@@ -23,14 +23,14 @@ Upstream-Status: Inappropriate [configuration]
 --- a/methods/makefile
 +++ b/methods/makefile
 @@ -51,13 +51,6 @@ LIB_MAKES = apt-pkg/makefile
- SOURCE = http.cc http_main.cc rfc2553emu.cc connect.cc
+ SOURCE = http.cc http_main.cc rfc2553emu.cc connect.cc server.cc
  include $(PROGRAM_H)
  
 -# The https method
 -PROGRAM=https
 -SLIBS = -lapt-pkg -lcurl $(INTLLIBS)
 -LIB_MAKES = apt-pkg/makefile
--SOURCE = https.cc
+-SOURCE = https.cc server.cc
 -include $(PROGRAM_H)
 -
  # The ftp method
-- 
1.9.1


