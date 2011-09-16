Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R4a5w-0006Nw-GT for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 17:12:48 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8GFDh6p026163 for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 16:13:43 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 1RXa33Ue8qJs
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 16:13:43 +0100 (BST)
Received: from [192.168.1.36] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8GFDbf1026159
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 16:13:39 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Sep 2011 16:07:25 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316185653.20858.30.camel@ted>
Mime-Version: 1.0
Subject: [PATCH] qemu: Fix reversed BGR values on ARM Versatile emulation
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
X-List-Received-Date: Fri, 16 Sep 2011 15:12:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

[YOCTO #1469]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/arm-bgr.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/arm-bgr.patch
new file mode 100644
index 0000000..3b460d0
--- a/dev/null
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/arm-bgr.patch
@@ -0,0 +1,30 @@
+After kernel commit:
+
+http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-3.0/commit/?h=meta&id=9728c1b6a724daefc413b44e10253cdbb5e06d08
+
+It appears that the emulated colours in qemu are incorrect and that 
+the red and blue channels are reversed. This patch reverses that logic
+so the colours are correctly displayed on the versatile platform which
+doesn't support the BGR bit.
+
+RP 16/9/2011
+
+Upstream-status: Pending
+
+Index: qemu-0.14.0/hw/pl110.c
+===================================================================
+--- qemu-0.14.0.orig/hw/pl110.c	2011-09-16 14:45:34.228668514 +0100
++++ qemu-0.14.0/hw/pl110.c	2011-09-16 15:17:22.458671206 +0100
+@@ -141,7 +141,11 @@
+         fprintf(stderr, "pl110: Bad color depth\n");
+         exit(1);
+     }
+-    if (s->cr & PL110_CR_BGR)
++
++    if (s->versatile && s->bpp == BPP_16)
++        /* Code assumes BPP_16 == 565 and BGR is never set on the versatile in 565 mode */
++        bpp_offset = 0;
++    else if (s->cr & PL110_CR_BGR)
+         bpp_offset = 0;
+     else
+         bpp_offset = 18;
diff --git a/meta/recipes-devtools/qemu/qemu_0.14.0.bb b/meta/recipes-devtools/qemu/qemu_0.14.0.bb
index 055321e..03519ad 100644
--- a/meta/recipes-devtools/qemu/qemu_0.14.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_0.14.0.bb
@@ -3,7 +3,7 @@ require qemu.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-PR = "r2"
+PR = "r3"
 
 FILESPATH = "${FILE_DIRNAME}/qemu-${PV}"
 FILESDIR = "${WORKDIR}"
@@ -19,6 +19,7 @@ SRC_URI = "\
     file://spice-qxl-locking-fix-for-qemu-kvm.patch \
     file://Detect-and-use-GCC-atomic-builtins-for-locking.patch \
     file://larger_default_ram_size.patch \
+    file://arm-bgr.patch \
     "
 
 # Only use the GL passthrough patches for native/nativesdk versions




