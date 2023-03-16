Return-Path: <yashinde145@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD402C6FD1F
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 11:09:56 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.9533.1678964995357555812
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 04:09:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fkuqX7gD;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: yashinde145@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id h12-20020a17090aea8c00b0023d1311fab3so1214659pjz.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 04:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678964994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mCo37oxWezI/H/VrZSqYG3GJC1Zr5WUYXwd0IgdH6cg=;
        b=fkuqX7gDKINGO7gcvEsk5I5oE2io5teFSQIUNcbJ7IIGv+L+t+1s3ae4ADgkqvMA+O
         5frfeGO/VxbI67eGKXuuhiLi0yjJqk90vaCwfR83kMCaJlhKIb+/Ogm8Q6vRbT1WTJDC
         V9TKoE1czFdUAvAcv01qkyFRplD2GammfJOU2Ma1FIuWZEKhLb1fxYLtC5DRtcacae2n
         QNX6Yij2uG/6XsOJy7Hzc7Uyj1+yh1MwCkUXimthc6aPwrOquMas2lTWgrS2frG7R7eg
         2yP22upSSRoeBQLRFUzD25FPeN0MGiELBxHVJk7swnReK/7BOcwWKX/omwz6uJ0pVt7c
         0YJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678964994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mCo37oxWezI/H/VrZSqYG3GJC1Zr5WUYXwd0IgdH6cg=;
        b=dwLB3zOrCzuoazTRbsgygScO+m20jYx4i6y1iVT9s0sDvNQAU1YvO+KUD6fHx1r4/Z
         S5YXqYCrZwAlGdK+lzCi1JLSslSz5EKhsTootrve/uGsG25CN5cwZA6VEyILzWbpFoF7
         r4TVLQk73I0J1lzeqQFVVZ9UEKD9RL2Mx2KPPDjCQuhN8UykrMljwRl3zz/dUWBCNeeq
         dEWf6pGL+KnPc86haygPWJoIRrxPpb0L1AcTnaPxvLZyl4l8PI/oE+0F5R2OCtCDNYga
         W2fzI8UXy62asCKacRbP8YdjR4fI2uI7EGG9iO6mzuhIrFVDRy5dX5iTVsRU9iUs2HuV
         j9ag==
X-Gm-Message-State: AO0yUKWVl/AM8xMf96sfGAn6iFbb6qCvgy58/5uR6PSRaBYe5V0IPoBI
	JL0wr1530oSeidc/Zm7h9L3d7m9w3ls=
X-Google-Smtp-Source: AK7set89H8BVfwJxQIWisWffmWTh8p1d5b+N2YS3BaajIigG5H4nQK+3W7RW1TuMIDKIEc2RdTei/w==
X-Received: by 2002:a17:902:d40c:b0:1a0:49eb:4cb8 with SMTP id b12-20020a170902d40c00b001a049eb4cb8mr2310897ple.44.1678964994351;
        Thu, 16 Mar 2023 04:09:54 -0700 (PDT)
Received: from bft-2.. ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id kb5-20020a170903338500b0019a6cce2060sm5359460plb.57.2023.03.16.04.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 04:09:53 -0700 (PDT)
From: Yash Shinde <yashinde145@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Yash.Shinde@windriver.com
Subject: [PATCH] binutils: Fix CVE-2023-25586
Date: Thu, 16 Mar 2023 16:39:44 +0530
Message-Id: <20230316110944.2622115-1-yashinde145@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 11:09:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178701

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;h=5830876a0cca17bef3b2d54908928e72cca53502]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../binutils/binutils-2.40.inc                |  1 +
 .../binutils/0016-CVE-2023-25586.patch        | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0016-CVE-2023-25586.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.40.inc b/meta/recipes-devtools/binutils/binutils-2.40.inc
index c2b926bb32..93631ca3d7 100644
--- a/meta/recipes-devtools/binutils/binutils-2.40.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.40.inc
@@ -34,5 +34,6 @@ SRC_URI = "\
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
      file://0014-configure-remove-dependencies-on-gmp-and-mpfr-when-g.patch \
      file://0015-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
+     file://0016-CVE-2023-25586.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0016-CVE-2023-25586.patch b/meta/recipes-devtools/binutils/binutils/0016-CVE-2023-25586.patch
new file mode 100644
index 0000000000..43e36caf3f
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0016-CVE-2023-25586.patch
@@ -0,0 +1,34 @@
+From 5830876a0cca17bef3b2d54908928e72cca53502 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 6 Dec 2022 08:37:52 +1030
+Subject: [PATCH] PR29855, ch_type in bfd_init_section_decompress_status can be
+ uninitialized
+
+	PR 29855
+	* compress.c (bfd_init_section_decompress_status): Set ch_type
+	to zero for zlib-gnu case.
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=5830876a0cca17bef3b2d54908928e72cca53502]
+
+CVE: CVE-2023-25586
+
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+---
+ bfd/compress.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/bfd/compress.c b/bfd/compress.c
+index 3d8c1d769f1..6b083468ca8 100644
+--- a/bfd/compress.c
++++ b/bfd/compress.c
+@@ -1012,7 +1012,7 @@ bfd_init_section_decompress_status (bfd *abfd, sec_ptr sec)
+	  return false;
+	}
+       uncompressed_size = bfd_getb64 (header + 4);
+-      ch_type = ch_none;
++      ch_type = 0;
+     }
+   else if (!bfd_check_compression_header (abfd, header, sec,
+					  &ch_type,
+--
+2.31.1
-- 
2.34.1


