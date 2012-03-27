Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SCeRp-0001K4-8p
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 00:01:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2RLpxPh005751
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2012 14:51:59 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 27 Mar 2012 14:52:00 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Mar 2012 16:57:31 -0500
Message-ID: <6fcf0f17e30fc31e281078a3d04200806148cb78.1332884952.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1332884952.git.mark.hatle@windriver.com>
References: <cover.1332884952.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 2/2] scripts/bitbake: Update to help rebuild pseudo-native
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
X-List-Received-Date: Tue, 27 Mar 2012 22:01:02 -0000
Content-Type: text/plain

Attempt to detect when pseudo-native has been updated.  If it has been updated,
or if the user is attempting an operation with pseudo-native in the name, force
a build of pseudo-native, prior to running the main build.

Note: This causes a build, then clean in the case of
   bitbake -c cleansstate pseudo-native

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 scripts/bitbake |   36 +++++++++++++++++++++++++++++++-----
 1 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/scripts/bitbake b/scripts/bitbake
index 45c8697..eb9e14f 100755
--- a/scripts/bitbake
+++ b/scripts/bitbake
@@ -55,21 +55,47 @@ fi
 buildpseudo="1"
 if [ $needpseudo = "1" ] && [ -e "$BUILDDIR/pseudodone" ]; then
     PSEUDOBINDIR=`cat $BUILDDIR/pseudodone`
-    if [ -e "$PSEUDOBINDIR/pseudo" -a -e "$PSEUDOBINDIR/tar" -a "$needtar" = "1" ]; then
+    if [ -e "$PSEUDOBINDIR/pseudo" ]; then
         buildpseudo="0"
     fi
-    if [ -e "$PSEUDOBINDIR/pseudo" -a $needtar = "0" ]; then
-        buildpseudo="0"
+
+    # Verify that the pseudo recipes are older then the pseudodone file
+    PSEUDO_RECIPE="`dirname $0`/../meta/recipes-devtools/pseudo"
+    if [ $buildpseudo -eq 0 ] && [ ! -d "$PSEUDO_RECIPE" ]; then
+        echo "Unable to verify if pseudo-native is up to date..." >&2
+    elif [ $buildpseudo -eq 0 ]; then
+	PSEUDO_NEWER=`find $PSEUDO_RECIPE -type f -newer $BUILDDIR/pseudodone`
+	if [ -n "$PSEUDO_NEWER" ]; then
+            buildpseudo="2"
+	fi
     fi
 fi
+
+# If tar is already built, we don't want to do it again...
+if [ -e "$PSEUDOBINDIR/tar" -a "$needtar" = "1" ]; then
+    needtar="0"
+fi
+
 if [ $needpseudo = "0" ]; then
     buildpseudo="0"
 fi
 
+# If pseudo-native is an argument, assume the user wants to build pseudo-native!
+if [ $needpseudo != "0" -a $buildpseudo -eq 0 ]; then
+    for opt in $@; do
+        if [ "$opt" = "pseudo-native" ]; then
+            buildpseudo="3"
+            break
+        fi
+    done
+fi
+
 OLDPATH=$PATH
 export PATH=`echo $PATH | sed s#[^:]*/scripts:##`
-if [ $buildpseudo = "1" ]; then
-    echo "Pseudo is not present but is required, building this first before the main build"
+if [ $buildpseudo -gt 0 ]; then
+    [ $buildpseudo -eq 1 ] && echo "Pseudo is not present but is required, building this first before the main build"
+    [ $buildpseudo -eq 2 ] && echo "Pseudo may be out of date, rebuilding pseudo before the main build"
+    [ $buildpseudo -eq 3 ] && echo "Building pseudo-native before main build"
     export PSEUDO_BUILD=1
     TARTARGET="tar-replacement-native"
     if [ $needtar = "0" ]; then
-- 
1.7.3.4



