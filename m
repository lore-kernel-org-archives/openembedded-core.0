Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2FCA965E03
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 08:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7H8p3j1018943 for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 09:51:03 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5n3B2cHho90T
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 09:51:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7H8p1ws018940
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 09:51:02 +0100
Message-ID: <1408265461.24858.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Aug 2014 09:51:01 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] qemu-targets.inc: Update to handle mingw/darwin
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
X-List-Received-Date: Sun, 17 Aug 2014 08:51:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

For non-linux targets, don't return linux-user qemu targets. This change
also improves readability of the functions through better variable names.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/qemu/qemu-targets.inc b/meta/recipes-devtools/qemu/qemu-targets.inc
index 9f009bf..5c35655 100644
--- a/meta/recipes-devtools/qemu/qemu-targets.inc
+++ b/meta/recipes-devtools/qemu/qemu-targets.inc
@@ -5,14 +5,18 @@
 def get_qemu_target_list(d):
     import bb
     archs = d.getVar('QEMU_TARGETS', True).split()
-    targets = ""
+    tos = d.getVar('HOST_OS', True)
+    softmmuonly = ""
     for arch in ['mips64', 'mips64el', 'ppcemb']:
         if arch in archs:
-            targets += arch + "-softmmu,"
+            softmmuonly += arch + "-softmmu,"
             archs.remove(arch)
+    linuxuseronly = ""
     for arch in ['armeb', 'alpha', 'ppc64abi32', 'sparc32plus']:
         if arch in archs:
-            targets += arch + "-linux-user,"
+            linuxuseronly += arch + "-linux-user,"
             archs.remove(arch)
-    return targets + ''.join([arch + "-linux-user" + "," + arch + "-softmmu" + "," for arch in archs]).rstrip(',')
+    if 'linux' not in tos:
+        return softmmuonly + ''.join([arch + "-softmmu" + "," for arch in archs]).rstrip(',')
+    return softmmuonly + linuxuseronly + ''.join([arch + "-linux-user" + "," + arch + "-softmmu" + "," for arch in archs]).rstrip(',')
 



