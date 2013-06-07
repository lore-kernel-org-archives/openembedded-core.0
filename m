Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 5130A6A8D1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 17:16:56 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r57HM1UG002327 for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Jun 2013 18:22:01 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XTnJf1araXLd
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 18:22:01 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r57HLtv8002321
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Jun 2013 18:21:57 +0100
Message-ID: <1370625401.6864.60.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 07 Jun 2013 18:16:41 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] scripts/oe-buildenv-internal bitbake: Migrate python version checks
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
X-List-Received-Date: Fri, 07 Jun 2013 17:16:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/scripts/bitbake b/scripts/bitbake
index a8c67bb..dde61c4 100755
--- a/scripts/bitbake
+++ b/scripts/bitbake
@@ -27,26 +27,6 @@ done
 [ $needpseudo = "0" ] && break
 done
 
-# Make sure we're not using python v3.x. This check can't go into
-# sanity.bbclass because bitbake's source code doesn't even pass
-# parsing stage when used with python v3, so we catch it here so we
-# can offer a meaningful error message.
-py_v3_check=`/usr/bin/env python --version 2>&1 | grep "Python 3"`
-if [ "$py_v3_check" != "" ]; then
-	echo "Bitbake is not compatible with python v3"
-	echo "Please set up python v2 as your default python interpreter"
-	exit 1
-fi
-
-# Similarly, we now have code that doesn't parse correctly with older
-# versions of Python, and rather than fixing that and being eternally
-# vigilant for any other new feature use, just check the version here.
-py_v26_check=`python -c 'import sys; print sys.version_info >= (2,6,0)'`
-if [ "$py_v26_check" != "True" ]; then
-	echo "BitBake requires Python 2.6 or later"
-	exit 1
-fi
-
 if [ ! -e conf/bblayers.conf ] ; then
     BDPRINT=""
     [ -n "$BUILDDIR" ] && BDPRINT=": $BUILDDIR"
diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 644df8f..a33698c 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -29,6 +29,26 @@ if [ ! -z "$OECORE_SDK_VERSION" ]; then
     return 1
 fi
 
+# Make sure we're not using python v3.x. This check can't go into
+# sanity.bbclass because bitbake's source code doesn't even pass
+# parsing stage when used with python v3, so we catch it here so we
+# can offer a meaningful error message.
+py_v3_check=`/usr/bin/env python --version 2>&1 | grep "Python 3"`
+if [ "$py_v3_check" != "" ]; then
+	echo "Bitbake is not compatible with python v3"
+	echo "Please set up python v2 as your default python interpreter"
+	exit 1
+fi
+
+# Similarly, we now have code that doesn't parse correctly with older
+# versions of Python, and rather than fixing that and being eternally
+# vigilant for any other new feature use, just check the version here.
+py_v26_check=`python -c 'import sys; print sys.version_info >= (2,6,0)'`
+if [ "$py_v26_check" != "True" ]; then
+	echo "BitBake requires Python 2.6 or later"
+	exit 1
+fi
+
 if [ "x$BDIR" = "x" ]; then
     if [ "x$1" = "x" ]; then
         BDIR="build"



