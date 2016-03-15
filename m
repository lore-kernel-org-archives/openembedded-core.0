Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 3D0B670101
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 17:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id AD0FF2E1BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:14 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id SYXXZv9MUBJP
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:14 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 2C0132E1A1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:14 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 16A66145E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:14 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 14E9CB3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:14 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 1355B106C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:14 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u2FHhEuw014466
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:14 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u2FHhESq014465
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Mar 2016 18:43:14 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Mar 2016 18:43:11 +0100
Message-Id: <a4803495a2d392310b9a1924293535fc0b3b3e0a.1458063686.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1458063686.git.pkj@axis.com>
References: <cover.1458063686.git.pkj@axis.com>
In-Reply-To: <cover.1458063686.git.pkj@axis.com>
References: <cover.1458063686.git.pkj@axis.com>
Subject: [PATCH 6/6] oe-buildenv-internal: Some clean up
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
X-List-Received-Date: Tue, 15 Mar 2016 17:43:17 -0000

* Consistent indentation (four spaces)
* Use [ -z ...] and [ -n ... ] where possible
* Unset temporary variables
* Use $(...) instead of `...`
* Avoid an unnecessary call to expr

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/oe-buildenv-internal | 46 +++++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 6a63399..14af872 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -24,7 +24,7 @@ if [ -z "$OEROOT" ]; then
     return 1
 fi
 
-if [ -z "$OE_SKIP_SDK_CHECK" -a ! -z "$OECORE_SDK_VERSION" ]; then
+if [ -z "$OE_SKIP_SDK_CHECK" ] && [ -n "$OECORE_SDK_VERSION" ]; then
     echo >&2 "Error: The OE SDK/ADT was detected as already being present in this shell environment. Please use a clean shell when sourcing this environment script."
     return 1
 fi
@@ -33,24 +33,26 @@ fi
 # sanity.bbclass because bitbake's source code doesn't even pass
 # parsing stage when used with python v3, so we catch it here so we
 # can offer a meaningful error message.
-py_v3_check=`/usr/bin/env python --version 2>&1 | grep "Python 3"`
-if [ "$py_v3_check" != "" ]; then
-	echo >&2 "Bitbake is not compatible with python v3"
-	echo >&2 "Please set up python v2 as your default python interpreter"
-	return 1
+py_v3_check=$(/usr/bin/env python --version 2>&1 | grep "Python 3")
+if [ -n "$py_v3_check" ]; then
+    echo >&2 "Bitbake is not compatible with python v3"
+    echo >&2 "Please set up python v2 as your default python interpreter"
+    return 1
 fi
+unset py_v3_check
 
 # Similarly, we now have code that doesn't parse correctly with older
 # versions of Python, and rather than fixing that and being eternally
 # vigilant for any other new feature use, just check the version here.
-py_v26_check=`python -c 'import sys; print sys.version_info >= (2,7,3)'`
+py_v26_check=$(python -c 'import sys; print sys.version_info >= (2,7,3)')
 if [ "$py_v26_check" != "True" ]; then
-	echo >&2 "BitBake requires Python 2.7.3 or later"
-	return 1
+    echo >&2 "BitBake requires Python 2.7.3 or later"
+    return 1
 fi
+unset py_v26_check
 
-if [ "x$BDIR" = "x" ]; then
-    if [ "x$1" = "x" ]; then
+if [ -z "$BDIR" ]; then
+    if [ -z "$1" ]; then
         BDIR="build"
     else
         BDIR="$1"
@@ -62,34 +64,34 @@ if [ "x$BDIR" = "x" ]; then
         # Remove any possible trailing slashes. This is used to work around
         # buggy readlink in Ubuntu 10.04 that doesn't ignore trailing slashes
         # and hence "readlink -f new_dir_to_be_created/" returns empty.
-        BDIR=`echo $BDIR | sed -re 's|/+$||'`
+        BDIR=$(echo $BDIR | sed -re 's|/+$||')
 
-        BDIR=`readlink -f "$BDIR"`
+        BDIR=$(readlink -f "$BDIR")
         if [ -z "$BDIR" ]; then
-            PARENTDIR=`dirname "$1"`
+            PARENTDIR=$(dirname "$1")
             echo >&2 "Error: the directory $PARENTDIR does not exist?"
             return 1
         fi
     fi
-    if [ "x$2" != "x" ]; then
+    if [ -n "$2" ]; then
         BITBAKEDIR="$2"
     fi
 fi
-if expr "$BDIR" : '/.*' > /dev/null ; then
+if [ "${BDIR#/}" != "$BDIR" ]; then
     BUILDDIR="$BDIR"
 else
-    BUILDDIR="`pwd`/$BDIR"
+    BUILDDIR="$(pwd)/$BDIR"
 fi
 unset BDIR
 
-if [ "x$BITBAKEDIR" = "x" ]; then
-    BITBAKEDIR="$OEROOT/bitbake$BBEXTRA/"
+if [ -z "$BITBAKEDIR" ]; then
+    BITBAKEDIR="$OEROOT/bitbake$BBEXTRA"
 fi
 
-BITBAKEDIR=`readlink -f "$BITBAKEDIR"`
-BUILDDIR=`readlink -f "$BUILDDIR"`
+BITBAKEDIR=$(readlink -f "$BITBAKEDIR")
+BUILDDIR=$(readlink -f "$BUILDDIR")
 
-if ! (test -d "$BITBAKEDIR"); then
+if [ ! -d "$BITBAKEDIR" ]; then
     echo >&2 "Error: The bitbake directory ($BITBAKEDIR) does not exist!  Please ensure a copy of bitbake exists at this location"
     return 1
 fi
-- 
2.1.0


