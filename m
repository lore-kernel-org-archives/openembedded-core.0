Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sr6c6-0002jY-Hy for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 14:10:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6HBxVfL011025
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 12:59:31 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10807-02 for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 12:59:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6HBxPOm011019
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 12:59:26 +0100
Message-ID: <1342526368.10484.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Jul 2012 12:59:28 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] scripts/bitbake: Check the git-native version and build it if necessary
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
X-List-Received-Date: Tue, 17 Jul 2012 12:10:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We require git version 1.7.5 or later for the git remote --mirror=xxx syntax.
If we have an older version of git, this patch ensure we build git-replacement-native.
We add an alternative PROVIDES in the same way as tar-native to allow this script
to trigger the build whilst still allowing git-native in ASSUME_PROVIDED.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
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




