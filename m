Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A5BC071547
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Sep 2014 01:50:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8Q1oFsr022043
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 18:50:15 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 25 Sep 2014 18:50:08 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Sep 2014 09:49:19 +0800
Message-ID: <a75894c5190c4c9101f6eabf6f41ace7040582b6.1411696027.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1411696027.git.Chong.Lu@windriver.com>
References: <cover.1411696027.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] apt: fix for CVE-2014-0478
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
X-List-Received-Date: Fri, 26 Sep 2014 01:50:15 -0000
Content-Type: text/plain

APT before 1.0.4 does not properly validate source packages, which allows
man-in-the-middle attackers to download and install Trojan horse packages
by removing the Release signature.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-0478

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 .../apt-0.9.9.4/apt-0.9.9.4-CVE-2014-0478.patch    | 193 +++++++++++++++++++++
 meta/recipes-devtools/apt/apt.inc                  |   1 +
 2 files changed, 194 insertions(+)
 create mode 100644 meta/recipes-devtools/apt/apt-0.9.9.4/apt-0.9.9.4-CVE-2014-0478.patch

diff --git a/meta/recipes-devtools/apt/apt-0.9.9.4/apt-0.9.9.4-CVE-2014-0478.patch b/meta/recipes-devtools/apt/apt-0.9.9.4/apt-0.9.9.4-CVE-2014-0478.patch
new file mode 100644
index 0000000..79a6897
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt-0.9.9.4/apt-0.9.9.4-CVE-2014-0478.patch
@@ -0,0 +1,193 @@
+This patch comes from:
+https://bugs.debian.org/cgi-bin/bugreport.cgi?msg=73;filename=apt_0.9.7.9%2Bdeb7u2.debdiff;att=1;bug=749795
+
+Upstream-Status: Backport
+
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+
+diff -uarN apt-0.9.9.4-org/cmdline/apt-get.cc apt-0.9.9.4/cmdline/apt-get.cc
+--- apt-0.9.9.4-org/cmdline/apt-get.cc	2014-08-29 15:37:42.587156134 +0800
++++ apt-0.9.9.4/cmdline/apt-get.cc	2014-08-29 15:51:16.672334086 +0800
+@@ -1046,25 +1046,8 @@
+    return true;
+ }
+ 									/*}}}*/
+-// CheckAuth - check if each download comes form a trusted source	/*{{{*/
+-// ---------------------------------------------------------------------
+-/* */
+-static bool CheckAuth(pkgAcquire& Fetcher)
++static bool AuthPrompt(std::string UntrustedList, bool const PromptUser)
+ {
+-   string UntrustedList;
+-   for (pkgAcquire::ItemIterator I = Fetcher.ItemsBegin(); I < Fetcher.ItemsEnd(); ++I)
+-   {
+-      if (!(*I)->IsTrusted())
+-      {
+-         UntrustedList += string((*I)->ShortDesc()) + " ";
+-      }
+-   }
+-
+-   if (UntrustedList == "")
+-   {
+-      return true;
+-   }
+-        
+    ShowList(c2out,_("WARNING: The following packages cannot be authenticated!"),UntrustedList,"");
+ 
+    if (_config->FindB("APT::Get::AllowUnauthenticated",false) == true)
+@@ -1073,6 +1056,9 @@
+       return true;
+    }
+ 
++   if (PromptUser == false)
++      return _error->Error(_("Some packages could not be authenticated"));
++
+    if (_config->FindI("quiet",0) < 2
+        && _config->FindB("APT::Get::Assume-Yes",false) == false)
+    {
+@@ -1090,6 +1076,28 @@
+    return _error->Error(_("There are problems and -y was used without --force-yes"));
+ }
+ 									/*}}}*/
++// CheckAuth - check if each download comes form a trusted source	/*{{{*/
++// ---------------------------------------------------------------------
++/* */
++static bool CheckAuth(pkgAcquire& Fetcher, bool PromptUser=true)
++{
++   string UntrustedList;
++   for (pkgAcquire::ItemIterator I = Fetcher.ItemsBegin(); I < Fetcher.ItemsEnd(); ++I)
++   {
++      if (!(*I)->IsTrusted())
++      {
++         UntrustedList += string((*I)->ShortDesc()) + " ";
++      }
++   }
++
++   if (UntrustedList == "")
++   {
++      return true;
++   }
++
++   return AuthPrompt(UntrustedList, PromptUser);
++}
++
+ // InstallPackages - Actually download and install the packages		/*{{{*/
+ // ---------------------------------------------------------------------
+ /* This displays the informative messages describing what is going to 
+@@ -2482,6 +2490,7 @@
+ 
+    // Load the requestd sources into the fetcher
+    unsigned J = 0;
++   std::string UntrustedList;
+    for (const char **I = CmdL.FileList + 1; *I != 0; I++, J++)
+    {
+       string Src;
+@@ -2491,7 +2500,10 @@
+ 	 delete[] Dsc;
+ 	 return _error->Error(_("Unable to find a source package for %s"),Src.c_str());
+       }
+-      
++     
++      if (Last->Index().IsTrusted() == false)
++         UntrustedList += Src + " ";
++ 
+       string srec = Last->AsStr();
+       string::size_type pos = srec.find("\nVcs-");
+       while (pos != string::npos)
+@@ -2575,7 +2587,11 @@
+ 			Last->Index().SourceInfo(*Last,*I),Src);
+       }
+    }
+-   
++
++   // check authentication status of the source as well
++   if (UntrustedList != "" && !AuthPrompt(UntrustedList, false))
++      return false;  
++ 
+    // Display statistics
+    unsigned long long FetchBytes = Fetcher.FetchNeeded();
+    unsigned long long FetchPBytes = Fetcher.PartialPresent();
+diff -uarN apt-0.9.9.4-org/test/integration/framework apt-0.9.9.4/test/integration/framework
+--- apt-0.9.9.4-org/test/integration/framework	2014-08-29 15:37:42.623156154 +0800
++++ apt-0.9.9.4/test/integration/framework	2014-08-29 15:55:23.592197940 +0800
+@@ -151,7 +151,7 @@
+ 	mkdir rootdir aptarchive keys
+ 	cd rootdir
+ 	mkdir -p etc/apt/apt.conf.d etc/apt/sources.list.d etc/apt/trusted.gpg.d etc/apt/preferences.d
+-	mkdir -p var/cache var/lib var/log
++	mkdir -p var/cache var/lib var/log tmp
+ 	mkdir -p var/lib/dpkg/info var/lib/dpkg/updates var/lib/dpkg/triggers
+ 	touch var/lib/dpkg/available
+ 	mkdir -p usr/lib/apt
+@@ -910,3 +910,35 @@
+ 	local IGNORE
+ 	read IGNORE
+ }
++
++testsuccess() {
++	if [ "$1" = '--nomsg' ]; then
++		shift
++	else
++		msgtest 'Test for successful execution of' "$*"
++	fi
++	local OUTPUT="${TMPWORKINGDIRECTORY}/rootdir/tmp/testsuccess.output"
++	if $@ >${OUTPUT} 2>&1; then
++		msgpass
++	else
++		echo >&2
++		cat >&2 $OUTPUT
++		msgfail
++	fi
++}
++
++testfailure() {
++	if [ "$1" = '--nomsg' ]; then
++		shift
++	else
++		msgtest 'Test for failure in execution of' "$*"
++	fi
++	local OUTPUT="${TMPWORKINGDIRECTORY}/rootdir/tmp/testfailure.output"
++	if $@ >${OUTPUT} 2>&1; then
++		echo >&2
++		cat >&2 $OUTPUT
++		msgfail
++	else
++		msgpass
++	fi
++}
+diff -uarN apt-0.9.9.4-org/test/integration/test-apt-get-source-authenticated apt-0.9.9.4/test/integration/test-apt-get-source-authenticated
+--- apt-0.9.9.4-org/test/integration/test-apt-get-source-authenticated	1970-01-01 08:00:00.000000000 +0800
++++ apt-0.9.9.4/test/integration/test-apt-get-source-authenticated	2014-08-29 15:58:06.137156796 +0800
+@@ -0,0 +1,31 @@
++#!/bin/sh
++#
++# Regression test for debian bug #749795. Ensure that we fail with
++# a error if apt-get source foo will download a source that comes
++# from a unauthenticated repository
++#
++set -e
++
++TESTDIR=$(readlink -f $(dirname $0))
++. $TESTDIR/framework
++
++setupenvironment
++configarchitecture "i386"
++
++# a "normal" package with source and binary
++buildsimplenativepackage 'foo' 'all' '2.0'
++
++setupaptarchive --no-update
++
++APTARCHIVE=$(readlink -f ./aptarchive)
++rm -f $APTARCHIVE/dists/unstable/*Release*
++
++# update without authenticated InRelease file
++testsuccess aptget update
++
++# this all should fail
++testfailure aptget install -y foo
++testfailure aptget source foo
++
++# allow overriding the warning
++testsuccess aptget source --allow-unauthenticated foo
diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
index b528c00..378021a 100644
--- a/meta/recipes-devtools/apt/apt.inc
+++ b/meta/recipes-devtools/apt/apt.inc
@@ -11,6 +11,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/apt_${PV}.tar.gz \
            file://truncate-filename.patch \
            file://nodoc.patch \
            file://disable-configure-in-makefile.patch \
+           file://apt-0.9.9.4-CVE-2014-0478.patch \
            "
 
 inherit autotools gettext
-- 
1.9.1


