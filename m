Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id DE0F76B7D7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 13:57:33 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id rp2so746275pbb.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 06:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=BsoJF3lJDeVmudMpnXV/yFf1NX2dNLVNswFJJBcP9MY=;
	b=U0NtK9sqWNmObBmdr6sLTsidxb8u2gpy7FPJwh3PVeyBPkBdtOtRBSPudFosYQgvEt
	JtqiCln3Uf5FoUftQKvrvgP50yVu9nZkd2iK2yJJCI/SCvA2uM/SUQOkfHCSkUyxjz0d
	IUEIIpE3U7S4GC8OKYCdGlJEoJWbyo5qXz+XaY0t3EDLQlP95pdktH04jTmtnau6RWuK
	rRhRl1Zj+/KudCLjtWg96j0aQm/B29x/YFse1yfc9SBv/FIRFORsO6luBN9HQtLfujMg
	fydtsPXSS/IDNo9++Fj0tawE6jnyYBy4DA+rR+H/laonqd9AjbFP1mc50/H6lcQwUsAK
	mzqA==
X-Received: by 10.66.146.42 with SMTP id sz10mr15681595pab.78.1376575054329;
	Thu, 15 Aug 2013 06:57:34 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	gg9sm18117120pbc.25.2013.08.15.06.57.33 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 06:57:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 06:56:49 -0700
Message-Id: <1376575009-4204-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [PATCH] qemu: Fix bit extraction for MTFSFI and MTFSF
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
X-List-Received-Date: Thu, 15 Aug 2013 13:57:34 -0000

Power ISA 2.05 enhancements introduced regression
in mtfsfi implementation. Fixed thusly

[YOCTO #4854]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../qemu/files/target-ppc_fix_bit_extraction.patch | 70 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_1.5.0.bb           |  4 +-
 2 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/files/target-ppc_fix_bit_extraction.patch

diff --git a/meta/recipes-devtools/qemu/files/target-ppc_fix_bit_extraction.patch b/meta/recipes-devtools/qemu/files/target-ppc_fix_bit_extraction.patch
new file mode 100644
index 0000000..d750923
--- /dev/null
+++ b/meta/recipes-devtools/qemu/files/target-ppc_fix_bit_extraction.patch
@@ -0,0 +1,70 @@
+Delivered-To: raj.khem@gmail.com
+Received: by 10.50.216.195 with SMTP id os3csp11191igc;
+        Thu, 15 Aug 2013 04:32:45 -0700 (PDT)
+X-Received: by 10.180.98.3 with SMTP id ee3mr1508103wib.48.1376566364872;
+        Thu, 15 Aug 2013 04:32:44 -0700 (PDT)
+Return-Path: <aurelien@aurel32.net>
+Received: from hall.aurel32.net (hall.aurel32.net. [2001:470:1f0b:4a8::1])
+        by mx.google.com with ESMTPS id vv5si15578100wjc.49.2013.08.15.04.32.44
+        for <raj.khem@gmail.com>
+        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
+        Thu, 15 Aug 2013 04:32:44 -0700 (PDT)
+Received-SPF: pass (google.com: best guess record for domain of aurelien@aurel32.net designates 2001:470:1f0b:4a8::1 as permitted sender) client-ip=2001:470:1f0b:4a8::1;
+Authentication-Results: mx.google.com;
+       spf=pass (google.com: best guess record for domain of aurelien@aurel32.net designates 2001:470:1f0b:4a8::1 as permitted sender) smtp.mail=aurelien@aurel32.net
+Received: from [2001:470:d4ed:1:2db:dfff:fe14:52d] (helo=ohm.aurel32.net)
+	by hall.aurel32.net with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
+	(Exim 4.80)
+	(envelope-from <aurelien@aurel32.net>)
+	id 1V9vnG-0006cO-NN; Thu, 15 Aug 2013 13:32:42 +0200
+Received: from aurel32 by ohm.aurel32.net with local (Exim 4.80)
+	(envelope-from <aurelien@aurel32.net>)
+	id 1V9vnF-0002Lw-7L; Thu, 15 Aug 2013 13:32:41 +0200
+From: Aurelien Jarno <aurelien@aurel32.net>
+To: qemu-devel@nongnu.org
+Cc: Khem Raj <raj.khem@gmail.com>,
+	Alexander Graf <agraf@suse.de> ,
+	qemu-stable@nongnu.org,
+	qemu-ppc@nongnu.org,
+	Aurelien Jarno <aurelien@aurel32.net>
+Subject: [PATCH] target-ppc: fix bit extraction for FPBF and FPL
+Date: Thu, 15 Aug 2013 13:32:38 +0200
+Message-Id: <1376566358-8989-1-git-send-email-aurelien@aurel32.net>
+X-Mailer: git-send-email 1.7.10.4
+
+Bit extraction for the FP BF and L field of the MTFSFI and MTFSF
+instructions is wrong and doesn't match the reference manual (which
+explain the bit number in big endian format). It has been broken in
+commit 7d08d85645def18eac2a9d672c1868a35e0bcf79.
+
+This patch fixes this, which in turn fixes the problem reported by
+Khem Raj about the floor() function of libm.
+
+Reported-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
+
+Upstream-Status: Backport
+
+---
+ target-ppc/translate.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+I don't know if we still have time to get this into 1.6, hence the Cc:
+to stable. In anycase it also needs to be fixed in 1.5.
+
+Index: qemu-1.5.0/target-ppc/translate.c
+===================================================================
+--- qemu-1.5.0.orig/target-ppc/translate.c	2013-05-20 08:34:40.000000000 -0700
++++ qemu-1.5.0/target-ppc/translate.c	2013-08-15 06:49:25.028144352 -0700
+@@ -428,9 +428,9 @@
+ EXTRACT_HELPER(SR, 16, 4);
+ 
+ /* mtfsf/mtfsfi */
+-EXTRACT_HELPER(FPBF, 19, 3);
++EXTRACT_HELPER(FPBF, 23, 3);
+ EXTRACT_HELPER(FPIMM, 12, 4);
+-EXTRACT_HELPER(FPL, 21, 1);
++EXTRACT_HELPER(FPL, 25, 1);
+ EXTRACT_HELPER(FPFLM, 17, 8);
+ EXTRACT_HELPER(FPW, 16, 1);
+ 
diff --git a/meta/recipes-devtools/qemu/qemu_1.5.0.bb b/meta/recipes-devtools/qemu/qemu_1.5.0.bb
index 91b8120..d6dd743 100644
--- a/meta/recipes-devtools/qemu/qemu_1.5.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_1.5.0.bb
@@ -4,7 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
 SRC_URI += "file://fdt_header.patch \
-            file://target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch"
+            file://target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch \
+            file://target-ppc_fix_bit_extraction.patch \
+           "
 
 SRC_URI_prepend = "http://wiki.qemu.org/download/qemu-${PV}.tar.bz2"
 SRC_URI[md5sum] = "b6f3265b8ed39d77e8f354f35cc26e16"
-- 
1.8.3.4


