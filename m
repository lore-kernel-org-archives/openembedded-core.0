Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E7FF67730D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2016 12:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u51CZeIW006852; Wed, 1 Jun 2016 13:35:57 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6TGMcqbNOigW; Wed,  1 Jun 2016 13:35:57 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u51CZpVD006869
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 1 Jun 2016 13:35:52 +0100
Received: from richard by hex with local (Exim 4.86)
	(envelope-from <richard@rpsys.net>)
	id 1b85NH-0000jx-5a; Wed, 01 Jun 2016 13:35:51 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2016 13:35:19 +0100
Message-Id: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 01/22] oe-buildenv-internal: Update to python3
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
X-List-Received-Date: Wed, 01 Jun 2016 12:35:59 -0000

Check that 'python' is a python v2 since that is what we assume everywhere
and upstream python devs recommend. We can need both python2 and python3
available since we don't control the software we might download and run.

Also check that python 3 is >= 3.4.0, our minimum version for bitbake.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/oe-buildenv-internal | 38 +++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 81ee784..56d3419 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -29,27 +29,31 @@ if [ -z "$OE_SKIP_SDK_CHECK" ] && [ -n "$OECORE_SDK_VERSION" ]; then
     return 1
 fi
 
-# Make sure we're not using python v3.x. This check can't go into
-# sanity.bbclass because bitbake's source code doesn't even pass
-# parsing stage when used with python v3, so we catch it here so we
-# can offer a meaningful error message.
-py_v3_check=$(/usr/bin/env python --version 2>&1 | grep "Python 3")
-if [ -n "$py_v3_check" ]; then
-    echo >&2 "Bitbake is not compatible with python v3"
-    echo >&2 "Please set up python v2 as your default python interpreter"
+# Make sure we're not using python v3.x as 'python', we don't support it.
+py_v2_check=$(/usr/bin/env python --version 2>&1 | grep "Python 3")
+if [ -n "$py_v2_check" ]; then
+    echo >&2 "OpenEmbedded requires 'python' to be python v2 (>= 2.7.3), not python v3."
+    echo >&2 "Please set up python v2 as your default 'python' interpreter."
     return 1
 fi
-unset py_v3_check
-
-# Similarly, we now have code that doesn't parse correctly with older
-# versions of Python, and rather than fixing that and being eternally
-# vigilant for any other new feature use, just check the version here.
-py_v26_check=$(python -c 'import sys; print sys.version_info >= (2,7,3)')
-if [ "$py_v26_check" != "True" ]; then
-    echo >&2 "BitBake requires Python 2.7.3 or later"
+unset py_v2_check
+
+py_v27_check=$(python -c 'import sys; print sys.version_info >= (2,7,3)')
+if [ "$py_v27_check" != "True" ]; then
+    echo >&2 "OpenEmbedded requires 'python' to be python v2 (>= 2.7.3), not python v3."
+    echo >&2 "Please upgrade your python v2."
+fi
+unset py_v27_check
+
+# We potentially have code that doesn't parse correctly with older versions 
+# of Python, and rather than fixing that and being eternally vigilant for 
+# any other new feature use, just check the version here.
+py_v34_check=$(python3 -c 'import sys; print(sys.version_info >= (3,4,0))')
+if [ "$py_v34_check" != "True" ]; then
+    echo >&2 "BitBake requires Python 3.4.0 or later as 'python3'"
     return 1
 fi
-unset py_v26_check
+unset py_v34_check
 
 if [ -z "$BDIR" ]; then
     if [ -z "$1" ]; then
-- 
2.5.0


