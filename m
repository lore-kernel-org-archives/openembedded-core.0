Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id B19236A8D1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 17:16:15 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r57HLKuR002265 for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Jun 2013 18:21:20 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KEj_dH0hPKBx
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 18:21:20 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r57HLHTu002249
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Jun 2013 18:21:19 +0100
Message-ID: <1370625363.6864.59.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 07 Jun 2013 18:16:03 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] scripts/bitbake sanity.bbclass: Migrate tests for git and tar versions
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
X-List-Received-Date: Fri, 07 Jun 2013 17:16:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Migrate tests for correct git and tar versions from the wrapper script
to the sanity class.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 6cad4bc..6cea423 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -359,6 +359,29 @@ def check_gcc_march(sanity_data):
 
     return result
 
+# Tar version 1.24 and onwards handle overwriting symlinks correctly
+# but earlier versions do not; this needs to work properly for sstate
+def check_tar_version(sanity_data, loosever):
+    status, result = oe.utils.getstatusoutput("tar --version")
+    if status != 0:
+        return "Unable to execute tar --version, exit code %s\n" % status
+    version = result.split()[3]
+    if loosever(version) < loosever("1.24"):
+        return "Your version of tar is older than 1.24 and has bugs which will break builds. Please install a newer version of tar.\n"
+    return None
+
+# We use git parameters and functionality only found in 1.7.5 or later
+def check_git_version(sanity_data, loosever):
+    status, result = oe.utils.getstatusoutput("git --version 2> /dev/null")
+    if status != 0:
+        return "Unable to execute git --version, exit code %s\n" % status
+    version = result.split()[2]
+    bb.warn(version)
+    if loosever(version) < loosever("1.7.5"):
+        return "Your version of git is older than 1.7.5 and has bugs which will break builds. Please install a newer version of git.\n"
+    return None
+
+
 def check_sanity(sanity_data):
     import subprocess
 
@@ -409,6 +432,15 @@ def check_sanity(sanity_data):
         messages = messages + 'Please set a MACHINE in your local.conf or environment\n'
         machinevalid = False
 
+    tarmsg = check_tar_version(sanity_data, LooseVersion)
+    if tarmsg:
+        messages = messages + tarmsg
+
+    gitmsg = check_git_version(sanity_data, LooseVersion)
+    if gitmsg:
+        messages = messages + gitmsg
+
+
     # Check we are using a valid local.conf
     current_conf  = sanity_data.getVar('CONF_VERSION', True)
     conf_version =  sanity_data.getVar('LOCALCONF_VERSION', True)
diff --git a/scripts/bitbake b/scripts/bitbake
index 31a34b3..a8c67bb 100755
--- a/scripts/bitbake
+++ b/scripts/bitbake
@@ -57,26 +57,6 @@ elif [ -z "$BUILDDIR" ] ; then
     BUILDDIR="`pwd`"
 fi
 
-needtar="1"
-needgit="1"
-TARVERSION=`tar --version | head -n 1 | cut -d ' ' -f 4`
-GITVERSION=`git --version 2> /dev/null | cut -d ' ' -f 3`
-float_test() {
-     echo | awk 'END { exit ( !( '"$1"')); }'
-}
-version_compare() {
-    python -c "from distutils.version import LooseVersion; import sys; sys.exit(not (LooseVersion('$1') $2 LooseVersion('$3')))"
-}
-
-# Tar version 1.24 and onwards handle overwriting symlinks correctly
-# but earlier versions do not; this needs to work properly for sstate
-float_test "$TARVERSION > 1.23" && needtar="0"
-
-if [ ! -z $GITVERSION ]; then
-    # Need git >= 1.7.5 for git-remote --mirror=xxx syntax
-    version_compare $GITVERSION ">=" 1.7.5 && needgit="0"
-fi
-
 buildpseudo="1"
 if [ $needpseudo = "1" ]; then
     if [ -e "$BUILDDIR/pseudodone" ]; then
@@ -103,14 +83,6 @@ if [ $needpseudo = "1" ]; then
     fi
 fi
 
-# If tar is already built, we don't want to do it again...
-if [ -e "$PSEUDOBINDIR/tar" -a "$needtar" = "1" ]; then
-    needtar="0"
-fi
-# If git is already built, we don't want to do it again...
-if [ -e "$PSEUDOBINDIR/git" -a "$needgit" = "1" ]; then
-    needgit="0"
-fi
 
 if [ $needpseudo = "0" ]; then
     buildpseudo="0"
@@ -133,14 +105,6 @@ if [ $buildpseudo -gt 0 ]; then
     [ $buildpseudo -eq 2 ] && echo "Pseudo may be out of date, rebuilding pseudo before the main build"
     [ $buildpseudo -eq 3 ] && echo "Building pseudo-native before main build"
     export PSEUDO_BUILD=1
-    TARTARGET="tar-replacement-native"
-    if [ $needtar = "0" ]; then
-        TARTARGET=""
-    fi
-    GITTARGET="git-replacement-native"
-    if [ $needgit = "0" ]; then
-        GITTARGET=""
-    fi
 
     # Pass through debug options
     additionalopts=""
@@ -154,11 +118,7 @@ if [ $buildpseudo -gt 0 ]; then
         done
     done
 
-    if [ $needtar = "1" ]; then
-	bitbake $TARTARGET -c populate_sysroot
-    fi
-
-    bitbake pseudo-native $GITTARGET $additionalopts -c populate_sysroot
+    bitbake pseudo-native $additionalopts -c populate_sysroot
     ret=$?
     if [ "$ret" != "0" ]; then
         exit 1



