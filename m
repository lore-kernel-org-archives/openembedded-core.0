Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web08.841.1603382014880455803
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 08:53:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=FLl7Q/9+;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.196, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f196.google.com with SMTP id bf6so1181799plb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2020 08:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version:in-reply-to:references
         :content-transfer-encoding;
        bh=kysRyba4haAZn2plgsNTQH58EglPv1vHvZnuZ/rY1Tw=;
        b=FLl7Q/9+3+9Yy3XZCw5gOzMm9oSnrQFs+d7HxPXxmUlfr5ccfzrxjjzARJM5xZXdg3
         ubPPNkCqUKvoclxzaDwNJvL2faoy0XQyzbXmyOrchm/GpObTbePadWh6UHWUzrQEJY6w
         gw5V7AC8WTYFRQRpRnoKns90hkuLotMgG0ROBD/uaPhSqDttbIS9qKMATCaR1YL1Blep
         IZv35XEvEMVmv5zABo12zDaWKssM9Z0S/1cVvvp0W1nZJO/Lbzsjt7e6iZmzBHj165eb
         lOelS7hCjeFhmhf4UPkgwQfhbLa/OKNdVzHKywWkfIaGys5o2rc9IoUAJ3XkklBtcGkP
         wGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :in-reply-to:references:content-transfer-encoding;
        bh=kysRyba4haAZn2plgsNTQH58EglPv1vHvZnuZ/rY1Tw=;
        b=iFgNjT4Zql4KbVEKeNw2ih0rCwOayvXHzq+rpVcScyUaXlbtMlDhCgyNFvzDvPxlwT
         7pmJ0nfmpC2iTXpVDffme7ElEd4xmvGiDseVgB2Y61xSA8khkHJXc7sQJhou0grDuu+C
         MoHVK/W2A7nJ/uGQjzolejRIwT8D/6DLfIvLx6UUJPXIzwN36ljRx2i13aFJ23iCVwe4
         4a3RvnR5pLoTcb3xRKBmhQTM5SabctpbxrkpgkmFtHbTF7cgaGQNhS7R60Mh/YJM22iC
         TKenKRNISQZbUUZWNFVJYsILXgTyoC3jkpOdRcJ8u/HJ5yUBCW6zIdKLxYYhKkD+d2q6
         3I5g==
X-Gm-Message-State: AOAM531gJIpZDymyY7jgjwT8VBaTc+lr7TxcPuB1tB1XEdPzCPb98ObL
	MpeE3XPtCRt2GLGBWOAoQF0/C8n6jSfsDwGF
X-Google-Smtp-Source: ABdhPJyk923Efgwsfrdk7ND4cLzR5TqUe1dvSIEvddwcTRFWxzvUnx0TU9AmdZW+/5AkIVupQSi1ow==
X-Received: by 2002:a17:902:6ac4:b029:d5:edd9:43c with SMTP id i4-20020a1709026ac4b02900d5edd9043cmr3346795plt.16.1603382013938;
        Thu, 22 Oct 2020 08:53:33 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id kc21sm2423558pjb.36.2020.10.22.08.53.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 08:53:33 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/14] qemu: change TLBs number to 64 in 34Kf mips cpu model
Date: Thu, 22 Oct 2020 05:51:47 -1000
Message-Id: <89e6fc44a378cb3489376d7193672cdf94c504b6.1603381705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <cover.1603381704.git.steve@sakoman.com>
References: <cover.1603381704.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Victor Kamensky <kamensky@cisco.com>

Replace OE private qemu patch with one that got upstreamed
and solves the same problem: increase qemumips CI performance
by increasing number of TLBs in CPU model and reduce need to
run software TLB refill code.

Signed-off-by: Victor Kamensky <kamensky@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a99dace7463d310688f4098a51316dc0743651e2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...ease-number-of-TLB-entries-on-the-34.patch | 59 +++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-target-mips-Increase-number-of-TLB-entries-on-the-34.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 7ce89c0023..76f97eef35 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -48,6 +48,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2020-14364.patch \
 	   file://CVE-2020-14415.patch \
 	   file://CVE-2020-16092.patch \
+	   file://0001-target-mips-Increase-number-of-TLB-entries-on-the-34.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-target-mips-Increase-number-of-TLB-entries-on-the-34.patch b/meta/recipes-devtools/qemu/qemu/0001-target-mips-Increase-number-of-TLB-entries-on-the-34.patch
new file mode 100644
index 0000000000..5227b7cbd2
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-target-mips-Increase-number-of-TLB-entries-on-the-34.patch
@@ -0,0 +1,59 @@
+From 68fa519a6cb455005317bd61f95214b58b2f1e69 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
+Date: Fri, 16 Oct 2020 15:20:37 +0200
+Subject: [PATCH] target/mips: Increase number of TLB entries on the 34Kf core
+ (16 -> 64)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Per "MIPS32 34K Processor Core Family Software User's Manual,
+Revision 01.13" page 8 in "Joint TLB (JTLB)" section:
+
+  "The JTLB is a fully associative TLB cache containing 16, 32,
+   or 64-dual-entries mapping up to 128 virtual pages to their
+   corresponding physical addresses."
+
+There is no particular reason to restrict the 34Kf core model to
+16 TLB entries, so raise its config to 64.
+
+This is helpful for other projects, in particular the Yocto Project:
+
+  Yocto Project uses qemu-system-mips 34Kf cpu model, to run 32bit
+  MIPS CI loop. It was observed that in this case CI test execution
+  time was almost twice longer than 64bit MIPS variant that runs
+  under MIPS64R2-generic model. It was investigated and concluded
+  that the difference in number of TLBs 16 in 34Kf case vs 64 in
+  MIPS64R2-generic is responsible for most of CI real time execution
+  difference. Because with 16 TLBs linux user-land trashes TLB more
+  and it needs to execute more instructions in TLB refill handler
+  calls, as result it runs much longer.
+
+(https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg03428.html)
+
+Buglink: https://bugzilla.yoctoproject.org/show_bug.cgi?id=13992
+Reported-by: Victor Kamensky <kamensky@cisco.com>
+Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Message-Id: <20201016133317.553068-1-f4bug@amsat.org>
+
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/68fa519a6cb455005317bd61f95214b58b2f1e69]
+Signed-off-by: Victor Kamensky <kamensky@cisco.com>
+
+---
+ target/mips/translate_init.c.inc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: qemu-5.1.0/target/mips/translate_init.inc.c
+===================================================================
+--- qemu-5.1.0.orig/target/mips/translate_init.inc.c
++++ qemu-5.1.0/target/mips/translate_init.inc.c
+@@ -254,7 +254,7 @@ const mips_def_t mips_defs[] =
+         .CP0_PRid = 0x00019500,
+         .CP0_Config0 = MIPS_CONFIG0 | (0x1 << CP0C0_AR) |
+                        (MMU_TYPE_R4000 << CP0C0_MT),
+-        .CP0_Config1 = MIPS_CONFIG1 | (1 << CP0C1_FP) | (15 << CP0C1_MMU) |
++        .CP0_Config1 = MIPS_CONFIG1 | (1 << CP0C1_FP) | (63 << CP0C1_MMU) |
+                        (0 << CP0C1_IS) | (3 << CP0C1_IL) | (1 << CP0C1_IA) |
+                        (0 << CP0C1_DS) | (3 << CP0C1_DL) | (1 << CP0C1_DA) |
+                        (1 << CP0C1_CA),
-- 
2.17.1

