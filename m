Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrP5Q-0004XN-UP
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 09:54:21 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Jul 2012 00:43:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="169736809"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.178])
	by azsmga001.ch.intel.com with ESMTP; 18 Jul 2012 00:42:59 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jul 2012 00:42:41 -0700
Message-Id: <adacb382d303eb10906a801c3d77ac05da99eefb.1342597081.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <fee3def2ca49e3349758d9cd9a9cf5645f03cf18.1342597081.git.sgw@linux.intel.com>
References: <fee3def2ca49e3349758d9cd9a9cf5645f03cf18.1342597081.git.sgw@linux.intel.com>
In-Reply-To: <cover.1342597081.git.sgw@linux.intel.com>
References: <cover.1342597081.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 12/18] scripts/bitbake: Check the git-native version and build it if necessary
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jul 2012 07:54:23 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We require git version 1.7.5 or later for the git remote --mirror=xxx syntax.
If we have an older version of git, this patch ensure we build git-replacement-native.
We add an alternative PROVIDES in the same way as tar-native to allow this script
to trigger the build whilst still allowing git-native in ASSUME_PROVIDED.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/git/git.inc |    2 ++
 scripts/bitbake                   |   17 ++++++++++++++++-
 2 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index ce2f574..6748b70 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -3,6 +3,8 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 DEPENDS = "openssl curl zlib expat"
 
+PROVIDES_append_virtclass-native = " git-replacement-native"
+
 SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.bz2 "
 S = "${WORKDIR}/git-${PV}"
 
diff --git a/scripts/bitbake b/scripts/bitbake
index 3772d82..580f377 100755
--- a/scripts/bitbake
+++ b/scripts/bitbake
@@ -58,7 +58,9 @@ elif [ -z "$BUILDDIR" ] ; then
 fi
 
 needtar="1"
+needgit="1"
 TARVERSION=`tar --version | head -n 1 | cut -d ' ' -f 4`
+GITVERSION=`git --version | cut -d ' ' -f 3`
 float_test() {
      echo | awk 'END { exit ( !( '"$1"')); }'
 }
@@ -67,6 +69,10 @@ float_test() {
 # but earlier versions do not; this needs to work properly for sstate
 float_test "$TARVERSION > 1.23" && needtar="0"
 
+# Need git >= 1.7.5 for git-remote --mirror=xxx syntax
+float_test "$GITVERSION >= 1.7.5" && needgit="0"
+
+
 buildpseudo="1"
 if [ $needpseudo = "1" ]; then
     if [ -e "$BUILDDIR/pseudodone" ]; then
@@ -97,6 +103,10 @@ fi
 if [ -e "$PSEUDOBINDIR/tar" -a "$needtar" = "1" ]; then
     needtar="0"
 fi
+# If git is already built, we don't want to do it again...
+if [ -e "$PSEUDOBINDIR/git" -a "$needgit" = "1" ]; then
+    needgit="0"
+fi
 
 if [ $needpseudo = "0" ]; then
     buildpseudo="0"
@@ -123,6 +133,11 @@ if [ $buildpseudo -gt 0 ]; then
     if [ $needtar = "0" ]; then
         TARTARGET=""
     fi
+    GITTARGET="git-replacement-native"
+    if [ $needgit = "0" ]; then
+        GITTARGET=""
+    fi
+
     # Pass through debug options
     additionalopts=""
     for opt in $@; do
@@ -134,7 +149,7 @@ if [ $buildpseudo -gt 0 ]; then
             fi
         done
     done
-    bitbake pseudo-native $TARTARGET $additionalopts -c populate_sysroot
+    bitbake pseudo-native $TARTARGET $GITTARGET $additionalopts -c populate_sysroot
     ret=$?
     if [ "$ret" != "0" ]; then
         exit 1
-- 
1.7.7.6



