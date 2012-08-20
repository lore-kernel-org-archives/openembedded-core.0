Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T3ULS-0001tr-Ox for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 17:56:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7KFimA6003308
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 16:44:48 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01011-03 for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 16:44:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7KFiaSI003301
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 16:44:41 +0100
Message-ID: <1345477476.3907.24.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Aug 2012 16:44:36 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] formfactor: Clean up errors on machines without framebuffers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Aug 2012 15:56:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If fbset can't find a framebuffer we end up with a mess on the console.
We might as well avoid doing this on machines without a framebuffer.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-bsp/formfactor/files/config b/meta/recipes-bsp/formfactor/files/config
index a3f762a..41066de 100755
--- a/meta/recipes-bsp/formfactor/files/config
+++ b/meta/recipes-bsp/formfactor/files/config
@@ -28,16 +28,18 @@ if [ -z "$DISPLAY_ORIENTATION" ]; then
     DISPLAY_ORIENTATION=0
 fi
 
-if [ -z "$DISPLAY_WIDTH_PIXELS" ]; then
-    DISPLAY_WIDTH_PIXELS=`/usr/sbin/fbset | grep geometry | awk '{ print $2 }'`
-fi
-
-if [ -z "$DISPLAY_HEIGHT_PIXELS" ]; then
-    DISPLAY_HEIGHT_PIXELS=`/usr/sbin/fbset | grep geometry | awk '{ print $3 }'`
-fi
-
-if [ -z "$DISPLAY_BPP" ]; then
-    DISPLAY_BPP=`/usr/sbin/fbset | grep geometry | awk '{ print $6 }'`
+if [ -e "/dev/fb" ]; then
+    if [ -z "$DISPLAY_WIDTH_PIXELS" ]; then
+        DISPLAY_WIDTH_PIXELS=`/usr/sbin/fbset | grep geometry | awk '{ print $2 }'`
+    fi
+
+    if [ -z "$DISPLAY_HEIGHT_PIXELS" ]; then
+        DISPLAY_HEIGHT_PIXELS=`/usr/sbin/fbset | grep geometry | awk '{ print $3 }'`
+    fi
+
+    if [ -z "$DISPLAY_BPP" ]; then
+        DISPLAY_BPP=`/usr/sbin/fbset | grep geometry | awk '{ print $6 }'`
+    fi
 fi
 
 # 
diff --git a/meta/recipes-bsp/formfactor/formfactor_0.0.bb b/meta/recipes-bsp/formfactor/formfactor_0.0.bb
index 31b4490..69c58f2 100644
--- a/meta/recipes-bsp/formfactor/formfactor_0.0.bb
+++ b/meta/recipes-bsp/formfactor/formfactor_0.0.bb
@@ -3,7 +3,7 @@ SECTION = "base"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r20"
+PR = "r21"
 
 SRC_URI = "file://config file://machconfig"
 S = "${WORKDIR}"




