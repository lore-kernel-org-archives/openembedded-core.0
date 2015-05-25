Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A810373231
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 May 2015 05:07:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4P57MTc021936
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 24 May 2015 22:07:22 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Sun, 24 May 2015 22:07:21 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 May 2015 13:01:54 +0800
Message-ID: <1432530114-18270-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v3] apt: upgrade to 1.0.9.9
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
X-List-Received-Date: Mon, 25 May 2015 05:07:23 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

1. Upgrade to fix the several CVEs: CVE-2014-0488, CVE-2014-0490
2. Remove apt-0.9.9.4-CVE-2014-0478.patch, which was backport.
3. Romve no-ko-translation.patch, apt-1.0.9.9 has ko translation
4. Update use-host.patch no-curl.patch db_linking_hack.patch and
noconfigure.patch
5. Not build the test cases since it requires gtest
6. install libapt-private.so.* to libdir, otherwise this file is
not installed into sysroot for native, and apt-get will use host's,
and lead to fail
7. Revert apt commit[a2a75ff45]"always run 'dpkg --configure -a'
at the end of our dpkg callings" for native package, otherwise
the postscript for these installed packages will be run, and fail
since the rootfs dir is not considered
8. Add lzma dependency by PACKAGECONFIG for target, and add xz
dependency for native

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../apt-0.9.9.4/apt-0.9.9.4-CVE-2014-0478.patch    | 193 -----------
 .../apt/apt-0.9.9.4/no-ko-translation.patch        |  11 -
 ...ys-run-dpkg-configure-a-at-the-end-of-our.patch | 378 +++++++++++++++++++++
 .../disable-configure-in-makefile.patch            |   0
 .../apt/apt-1.0.9.9/disable-test.patch             |  58 ++++
 .../fix-gcc-4.6-null-not-defined.patch             |   0
 .../{apt-0.9.9.4 => apt-1.0.9.9}/makerace.patch    |   0
 .../{apt-0.9.9.4 => apt-1.0.9.9}/no-nls-dpkg.patch |   0
 .../{apt-0.9.9.4 => apt-1.0.9.9}/noconfigure.patch |  17 +-
 .../apt/{apt-0.9.9.4 => apt-1.0.9.9}/nodoc.patch   |   0
 .../truncate-filename.patch                        |   0
 .../{apt-0.9.9.4 => apt-1.0.9.9}/use-host.patch    |   6 +-
 meta/recipes-devtools/apt/apt-native.inc           |   8 +-
 ...apt-native_0.9.9.4.bb => apt-native_1.0.9.9.bb} |   4 +-
 meta/recipes-devtools/apt/apt.inc                  |   7 +-
 .../apt/{apt_0.9.9.4.bb => apt_1.0.9.9.bb}         |   5 +-
 .../apt/files/db_linking_hack.patch                |   6 +-
 meta/recipes-devtools/apt/files/no-curl.patch      |   8 +-
 18 files changed, 470 insertions(+), 231 deletions(-)
 delete mode 100644 meta/recipes-devtools/apt/apt-0.9.9.4/apt-0.9.9.4-CVE-2014-0478.patch
 delete mode 100644 meta/recipes-devtools/apt/apt-0.9.9.4/no-ko-translation.patch
 create mode 100644 meta/recipes-devtools/apt/apt-1.0.9.9/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
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
 rename meta/recipes-devtools/apt/{apt_0.9.9.4.bb => apt_1.0.9.9.bb} (67%)

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
diff --git a/meta/recipes-devtools/apt/apt-1.0.9.9/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch b/meta/recipes-devtools/apt/apt-1.0.9.9/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
new file mode 100644
index 0000000..d33069b
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt-1.0.9.9/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
@@ -0,0 +1,378 @@
+From 106797f1c66fa578dad21fd9380bf9d576573dfd Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Fri, 22 May 2015 08:05:15 +0800
+Subject: [PATCH] Revert "always run 'dpkg --configure -a' at the end of our
+ dpkg callings"
+
+Upstream-Status: Inappropriate [embedded specific]
+
+This reverts commit a2a75ff4516f7609f4c55b42270abb8d08943c60, which
+always run 'dpkg --configure -a' at the end of our dpkg callings,
+but it does not work for cross-compile, since the rootfs dir can not
+be passed into dpkg, and lead to the below similar error:
+   -------
+   |mkdir: cannot create directory '/usr/lib/opkg': Permission denied
+   -------
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ apt-pkg/deb/dpkgpm.cc                              |  9 +--
+ test/integration/framework                         | 25 ++++----
+ test/integration/test-apt-progress-fd              | 67 +++++++++----------
+ test/integration/test-apt-progress-fd-deb822       | 18 ++----
+ test/integration/test-apt-progress-fd-error        |  2 +-
+ ...est-bug-769609-triggers-still-pending-after-run | 75 ----------------------
+ .../test-no-fds-leaked-to-maintainer-scripts       |  6 +-
+ 7 files changed, 56 insertions(+), 146 deletions(-)
+ delete mode 100755 test/integration/test-bug-769609-triggers-still-pending-after-run
+
+diff --git a/apt-pkg/deb/dpkgpm.cc b/apt-pkg/deb/dpkgpm.cc
+index b187efb..f269764 100644
+--- a/apt-pkg/deb/dpkgpm.cc
++++ b/apt-pkg/deb/dpkgpm.cc
+@@ -1049,12 +1049,6 @@ void pkgDPkgPM::BuildPackagesProgressMap()
+ 	 PackagesTotal++;
+       }
+    }
+-   /* one extra: We don't want the progress bar to reach 100%, especially not
+-      if we call dpkg --configure --pending and process a bunch of triggers
+-      while showing 100%. Also, spindown takes a while, so never reaching 100%
+-      is way more correct than reaching 100% while still doing stuff even if
+-      doing it this way is slightly bending the rules */
+-   ++PackagesTotal;
+ }
+                                                                         /*}}}*/
+ #if (APT_PKG_MAJOR >= 4 && APT_PKG_MINOR < 13)
+@@ -1294,8 +1288,9 @@ bool pkgDPkgPM::GoNoABIBreak(APT::Progress::PackageManager *progress)
+ 
+    // support subpressing of triggers processing for special
+    // cases like d-i that runs the triggers handling manually
++   bool const SmartConf = (_config->Find("PackageManager::Configure", "all") != "all");
+    bool const TriggersPending = _config->FindB("DPkg::TriggersPending", false);
+-   if (_config->FindB("DPkg::ConfigurePending", true) == true)
++   if (_config->FindB("DPkg::ConfigurePending", SmartConf) == true)
+       List.push_back(Item(Item::ConfigurePending, PkgIterator()));
+ 
+    // for the progress
+diff --git a/test/integration/framework b/test/integration/framework
+index 70ad381..00672ad 100644
+--- a/test/integration/framework
++++ b/test/integration/framework
+@@ -1178,13 +1178,10 @@ testnopackage() {
+ 	fi
+ }
+ 
+-testdpkgstatus() {
+-	local STATE="$1"
+-	local NR="$2"
+-	shift 2
+-	msgtest "Test that $NR package(s) are in state $STATE with" "dpkg -l $*"
+-	local PKGS="$(dpkg -l "$@" 2>/dev/null | grep "^${STATE}" | wc -l)"
+-	if [ "$PKGS" != $NR ]; then
++testdpkginstalled() {
++	msgtest "Test for correctly installed package(s) with" "dpkg -l $*"
++	local PKGS="$(dpkg -l "$@" 2>/dev/null | grep '^i' | wc -l)"
++	if [ "$PKGS" != $# ]; then
+ 		echo >&2 $PKGS
+ 		dpkg -l "$@" | grep '^[a-z]' >&2
+ 		msgfail
+@@ -1193,12 +1190,16 @@ testdpkgstatus() {
+ 	fi
+ }
+ 
+-testdpkginstalled() {
+-	testdpkgstatus 'ii' "$#" "$@"
+-}
+-
+ testdpkgnotinstalled() {
+-	testdpkgstatus 'ii' '0' "$@"
++	msgtest "Test for correctly not-installed package(s) with" "dpkg -l $*"
++	local PKGS="$(dpkg -l "$@" 2> /dev/null | grep '^i' | wc -l)"
++	if [ "$PKGS" != 0 ]; then
++		echo
++		dpkg -l "$@" | grep '^[a-z]' >&2
++		msgfail
++	else
++		msgpass
++	fi
+ }
+ 
+ testmarkedauto() {
+diff --git a/test/integration/test-apt-progress-fd b/test/integration/test-apt-progress-fd
+index 68cc043..d72e7e7 100755
+--- a/test/integration/test-apt-progress-fd
++++ b/test/integration/test-apt-progress-fd
+@@ -19,14 +19,13 @@ testequal "dlstatus:1:0:Retrieving file 1 of 1
+ dlstatus:1:0:Retrieving file 1 of 1
+ pmstatus:dpkg-exec:0:Running dpkg
+ pmstatus:testing:0:Installing testing (amd64)
+-pmstatus:testing:16.6667:Preparing testing (amd64)
+-pmstatus:testing:33.3333:Unpacking testing (amd64)
+-pmstatus:testing:50:Preparing to configure testing (amd64)
+-pmstatus:dpkg-exec:50:Running dpkg
+-pmstatus:testing:50:Configuring testing (amd64)
+-pmstatus:testing:66.6667:Configuring testing (amd64)
+-pmstatus:testing:83.3333:Installed testing (amd64)
+-pmstatus:dpkg-exec:83.3333:Running dpkg" cat apt-progress.log
++pmstatus:testing:20:Preparing testing (amd64)
++pmstatus:testing:40:Unpacking testing (amd64)
++pmstatus:testing:60:Preparing to configure testing (amd64)
++pmstatus:dpkg-exec:60:Running dpkg
++pmstatus:testing:60:Configuring testing (amd64)
++pmstatus:testing:80:Configuring testing (amd64)
++pmstatus:testing:100:Installed testing (amd64)" cat apt-progress.log
+ 
+ # upgrade
+ exec 3> apt-progress.log
+@@ -35,14 +34,13 @@ testequal "dlstatus:1:0:Retrieving file 1 of 1
+ dlstatus:1:0:Retrieving file 1 of 1
+ pmstatus:dpkg-exec:0:Running dpkg
+ pmstatus:testing:0:Installing testing (amd64)
+-pmstatus:testing:16.6667:Preparing testing (amd64)
+-pmstatus:testing:33.3333:Unpacking testing (amd64)
+-pmstatus:testing:50:Preparing to configure testing (amd64)
+-pmstatus:dpkg-exec:50:Running dpkg
+-pmstatus:testing:50:Configuring testing (amd64)
+-pmstatus:testing:66.6667:Configuring testing (amd64)
+-pmstatus:testing:83.3333:Installed testing (amd64)
+-pmstatus:dpkg-exec:83.3333:Running dpkg" cat apt-progress.log
++pmstatus:testing:20:Preparing testing (amd64)
++pmstatus:testing:40:Unpacking testing (amd64)
++pmstatus:testing:60:Preparing to configure testing (amd64)
++pmstatus:dpkg-exec:60:Running dpkg
++pmstatus:testing:60:Configuring testing (amd64)
++pmstatus:testing:80:Configuring testing (amd64)
++pmstatus:testing:100:Installed testing (amd64)" cat apt-progress.log
+ 
+ # reinstall
+ exec 3> apt-progress.log
+@@ -51,24 +49,22 @@ testequal "dlstatus:1:0:Retrieving file 1 of 1
+ dlstatus:1:0:Retrieving file 1 of 1
+ pmstatus:dpkg-exec:0:Running dpkg
+ pmstatus:testing:0:Installing testing (amd64)
+-pmstatus:testing:16.6667:Preparing testing (amd64)
+-pmstatus:testing:33.3333:Unpacking testing (amd64)
+-pmstatus:testing:50:Preparing to configure testing (amd64)
+-pmstatus:dpkg-exec:50:Running dpkg
+-pmstatus:testing:50:Configuring testing (amd64)
+-pmstatus:testing:66.6667:Configuring testing (amd64)
+-pmstatus:testing:83.3333:Installed testing (amd64)
+-pmstatus:dpkg-exec:83.3333:Running dpkg" cat apt-progress.log
++pmstatus:testing:20:Preparing testing (amd64)
++pmstatus:testing:40:Unpacking testing (amd64)
++pmstatus:testing:60:Preparing to configure testing (amd64)
++pmstatus:dpkg-exec:60:Running dpkg
++pmstatus:testing:60:Configuring testing (amd64)
++pmstatus:testing:80:Configuring testing (amd64)
++pmstatus:testing:100:Installed testing (amd64)" cat apt-progress.log
+ 
+ # and remove
+ exec 3> apt-progress.log
+ testsuccess aptget remove testing -y -o APT::Status-Fd=3
+ testequal "pmstatus:dpkg-exec:0:Running dpkg
+ pmstatus:testing:0:Removing testing (amd64)
+-pmstatus:testing:25:Preparing for removal of testing (amd64)
+-pmstatus:testing:50:Removing testing (amd64)
+-pmstatus:testing:75:Removed testing (amd64)
+-pmstatus:dpkg-exec:75:Running dpkg" cat apt-progress.log
++pmstatus:testing:33.3333:Preparing for removal of testing (amd64)
++pmstatus:testing:66.6667:Removing testing (amd64)
++pmstatus:testing:100:Removed testing (amd64)" cat apt-progress.log
+ 
+ # install non-native and ensure we get proper progress info
+ exec 3> apt-progress.log
+@@ -79,13 +75,12 @@ testequal "dlstatus:1:0:Retrieving file 1 of 1
+ dlstatus:1:0:Retrieving file 1 of 1
+ pmstatus:dpkg-exec:0:Running dpkg
+ pmstatus:testing2:0:Installing testing2 (i386)
+-pmstatus:testing2:16.6667:Preparing testing2 (i386)
+-pmstatus:testing2:33.3333:Unpacking testing2 (i386)
+-pmstatus:testing2:50:Preparing to configure testing2 (i386)
+-pmstatus:dpkg-exec:50:Running dpkg
+-pmstatus:testing2:50:Configuring testing2 (i386)
+-pmstatus:testing2:66.6667:Configuring testing2 (i386)
+-pmstatus:testing2:83.3333:Installed testing2 (i386)
+-pmstatus:dpkg-exec:83.3333:Running dpkg" cat apt-progress.log
++pmstatus:testing2:20:Preparing testing2 (i386)
++pmstatus:testing2:40:Unpacking testing2 (i386)
++pmstatus:testing2:60:Preparing to configure testing2 (i386)
++pmstatus:dpkg-exec:60:Running dpkg
++pmstatus:testing2:60:Configuring testing2 (i386)
++pmstatus:testing2:80:Configuring testing2 (i386)
++pmstatus:testing2:100:Installed testing2 (i386)" cat apt-progress.log
+ 
+ rm -f apt-progress*.log
+diff --git a/test/integration/test-apt-progress-fd-deb822 b/test/integration/test-apt-progress-fd-deb822
+index badc985..9d22794 100755
+--- a/test/integration/test-apt-progress-fd-deb822
++++ b/test/integration/test-apt-progress-fd-deb822
+@@ -27,41 +27,37 @@ Message: Installing testing (amd64)
+ 
+ Status: progress
+ Package: testing:amd64
+-Percent: 16.6667
++Percent: 20
+ Message: Preparing testing (amd64)
+ 
+ Status: progress
+ Package: testing:amd64
+-Percent: 33.3333
++Percent: 40
+ Message: Unpacking testing (amd64)
+ 
+ Status: progress
+ Package: testing:amd64
+-Percent: 50
++Percent: 60
+ Message: Preparing to configure testing (amd64)
+ 
+ Status: progress
+-Percent: 50
++Percent: 60
+ Message: Running dpkg
+ 
+ Status: progress
+ Package: testing:amd64
+-Percent: 50
++Percent: 60
+ Message: Configuring testing (amd64)
+ 
+ Status: progress
+ Package: testing:amd64
+-Percent: 66.6667
++Percent: 80
+ Message: Configuring testing (amd64)
+ 
+ Status: progress
+ Package: testing:amd64
+-Percent: 83.3333
++Percent: 100
+ Message: Installed testing (amd64)
+-
+-Status: progress
+-Percent: 83.3333
+-Message: Running dpkg
+ " cat apt-progress.log
+ 
+ 
+diff --git a/test/integration/test-apt-progress-fd-error b/test/integration/test-apt-progress-fd-error
+index 6323007..a47095b 100755
+--- a/test/integration/test-apt-progress-fd-error
++++ b/test/integration/test-apt-progress-fd-error
+@@ -18,7 +18,7 @@ setupaptarchive
+ exec 3> apt-progress.log
+ testfailure aptget install foo1 foo2 -y -o APT::Status-Fd=3
+ msgtest "Ensure correct error message"
+-if grep -q "aptarchive/pool/foo2_0.8.15_amd64.deb:36.3636:trying to overwrite '/usr/bin/file-conflict', which is also in package foo1 0.8.15" apt-progress.log; then
++if grep -q "aptarchive/pool/foo2_0.8.15_amd64.deb:40:trying to overwrite '/usr/bin/file-conflict', which is also in package foo1 0.8.15" apt-progress.log; then
+ 	msgpass
+ else
+ 	cat apt-progress.log
+diff --git a/test/integration/test-bug-769609-triggers-still-pending-after-run b/test/integration/test-bug-769609-triggers-still-pending-after-run
+deleted file mode 100755
+index 146fa76..0000000
+--- a/test/integration/test-bug-769609-triggers-still-pending-after-run
++++ /dev/null
+@@ -1,75 +0,0 @@
+-#!/bin/sh
+-set -e
+-
+-TESTDIR=$(readlink -f $(dirname $0))
+-. $TESTDIR/framework
+-
+-setupenvironment
+-configarchitecture 'amd64'
+-
+-msgtest 'Check if installed dpkg supports' 'noawait trigger'
+-if dpkg-checkbuilddeps -d 'dpkg (>= 1.16.1)' /dev/null; then
+-	msgpass
+-else
+-	msgskip 'dpkg version too old'
+-	exit 0
+-fi
+-configdpkgnoopchroot
+-
+-buildtriggerpackages() {
+-	local TYPE="$1"
+-	setupsimplenativepackage "triggerable-$TYPE" 'all' '1.0' 'unstable' "Depends: trigdepends-$TYPE"
+-	BUILDDIR="incoming/triggerable-${TYPE}-1.0"
+-	cat >${BUILDDIR}/debian/postinst <<EOF
+-#!/bin/sh
+-if [ "\$1" = 'triggered' ]; then
+-	ls -l /proc/self/fd/
+-fi
+-EOF
+-	echo "$TYPE /usr/share/doc" > ${BUILDDIR}/debian/triggers
+-	buildpackage "$BUILDDIR" 'unstable' 'main' 'native'
+-	rm -rf "$BUILDDIR"
+-	buildsimplenativepackage "trigdepends-$TYPE" 'all' '1.0' 'unstable'
+-}
+-
+-#buildtriggerpackages 'interest'
+-buildtriggerpackages 'interest-noawait'
+-buildsimplenativepackage "trigstuff" 'all' '1.0' 'unstable'
+-
+-setupaptarchive
+-
+-runtests() {
+-	local TYPE="$1"
+-	msgmsg 'Working with trigger type' "$TYPE"
+-	testsuccess aptget install triggerable-$TYPE -y
+-	cp rootdir/tmp/testsuccess.output terminal.output
+-	testsuccess grep '^REWRITE ' terminal.output
+-	testdpkginstalled triggerable-$TYPE trigdepends-$TYPE
+-
+-	testsuccess aptget install trigdepends-$TYPE -y --reinstall
+-	cp rootdir/tmp/testsuccess.output terminal.output
+-	testsuccess grep '^REWRITE ' terminal.output
+-	testsuccess grep ' root root ' terminal.output
+-	testdpkginstalled triggerable-$TYPE trigdepends-$TYPE
+-
+-	testsuccess aptget install trigstuff -y
+-	cp rootdir/tmp/testsuccess.output terminal.output
+-	testsuccess grep '^REWRITE ' terminal.output
+-	testsuccess grep ' root root ' terminal.output
+-	testdpkginstalled triggerable-$TYPE trigdepends-$TYPE trigstuff
+-
+-	testsuccess aptget purge trigstuff -y
+-	cp rootdir/tmp/testsuccess.output terminal.output
+-	testsuccess grep '^REWRITE ' terminal.output
+-	testsuccess grep ' root root ' terminal.output
+-	testdpkginstalled triggerable-$TYPE trigdepends-$TYPE
+-	testdpkgnotinstalled trigstuff
+-
+-	testsuccess aptget purge trigdepends-$TYPE -y
+-	cp rootdir/tmp/testsuccess.output terminal.output
+-	testfailure grep '^REWRITE ' terminal.output
+-	testfailure grep ' root root ' terminal.output
+-	testdpkgnotinstalled triggerable-$TYPE trigdepends-$TYPE
+-}
+-#runtests 'interest'
+-runtests 'interest-noawait'
+diff --git a/test/integration/test-no-fds-leaked-to-maintainer-scripts b/test/integration/test-no-fds-leaked-to-maintainer-scripts
+index 41c0570..d3960d7 100755
+--- a/test/integration/test-no-fds-leaked-to-maintainer-scripts
++++ b/test/integration/test-no-fds-leaked-to-maintainer-scripts
+@@ -59,8 +59,7 @@ startup packages configure
+ configure $PKGNAME 1.0 <none>
+ status unpacked $PKGNAME 1.0
+ status half-configured $PKGNAME 1.0
+-status installed $PKGNAME 1.0
+-startup packages configure" cut -f 3- -d' ' rootdir/var/log/dpkg.log
++status installed $PKGNAME 1.0" cut -f 3- -d' ' rootdir/var/log/dpkg.log
+ }
+ checkinstall
+ 
+@@ -85,8 +84,7 @@ status config-files $PKGNAME 1.0
+ status config-files $PKGNAME 1.0
+ status config-files $PKGNAME 1.0
+ status config-files $PKGNAME 1.0
+-status not-installed $PKGNAME <none>
+-startup packages configure" cut -f 3- -d' ' rootdir/var/log/dpkg.log
++status not-installed $PKGNAME <none>" cut -f 3- -d' ' rootdir/var/log/dpkg.log
+ }
+ checkpurge
+ 
+-- 
+2.1.4
+
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
diff --git a/meta/recipes-devtools/apt/apt-native.inc b/meta/recipes-devtools/apt/apt-native.inc
index fede869..c6e85b8 100644
--- a/meta/recipes-devtools/apt/apt-native.inc
+++ b/meta/recipes-devtools/apt/apt-native.inc
@@ -1,11 +1,13 @@
 require apt.inc
 inherit native
 
-DEPENDS += "dpkg-native gettext-native db-native curl-native"
+DEPENDS += "dpkg-native gettext-native db-native curl-native xz-native"
 PACKAGES = ""
 USE_NLS = "yes"
 
-SRC_URI += "file://db_linking_hack.patch"
+SRC_URI += "file://db_linking_hack.patch \
+            file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \           
+"
 
 python do_install () {
     bb.build.exec_func('do_install_base', d)
@@ -41,6 +43,8 @@ do_install_base () {
 	install -m 0755 bin/apt-extracttemplates ${D}${bindir}/
 	install -m 0755 bin/apt-ftparchive ${D}${bindir}/
 
+	oe_libinstall -so -C bin libapt-private ${D}${libdir}/
+
 	eval `cat environment.mak | grep ^GLIBC_VER | sed -e's, = ,=,'`
 	eval `cat environment.mak | grep ^LIBSTDCPP_VER | sed -e's, = ,=,'`
 	oe_libinstall -so -C bin libapt-pkg$GLIBC_VER$LIBSTDCPP_VER ${D}${libdir}/
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
index 321934b..173b806 100644
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
@@ -11,12 +10,14 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20130726T154545Z/pool/main/
            file://truncate-filename.patch \
            file://nodoc.patch \
            file://disable-configure-in-makefile.patch \
-           file://apt-0.9.9.4-CVE-2014-0478.patch \
+           file://disable-test.patch \
            "
 
 inherit autotools gettext
 
 EXTRA_AUTORECONF = "--exclude=autopoint,autoheader"
+PACKAGECONFIG ??= "lzma"
+PACKAGECONFIG[lzma] = "ac_cv_lib_lzma_lzma_easy_encoder=yes,ac_cv_lib_lzma_lzma_easy_encoder=no,xz"
 
 do_configure_prepend() {
     rm -rf ${S}/buildlib/config.sub
diff --git a/meta/recipes-devtools/apt/apt_0.9.9.4.bb b/meta/recipes-devtools/apt/apt_1.0.9.9.bb
similarity index 67%
rename from meta/recipes-devtools/apt/apt_0.9.9.4.bb
rename to meta/recipes-devtools/apt/apt_1.0.9.9.bb
index 77cbff1..34923ca 100644
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
 
@@ -15,4 +15,5 @@ do_install_append() {
     #Write the correct apt-architecture to apt.conf
     APT_CONF=${D}/etc/apt/apt.conf
     echo 'APT::Architecture "${DPKG_ARCH}";' > ${APT_CONF}
+    oe_libinstall -so -C bin libapt-private ${D}${libdir}/
 }
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


