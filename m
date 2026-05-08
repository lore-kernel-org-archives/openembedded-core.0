Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E2AFCD342F
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 06:26:46 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7702.1778221605358026130
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 23:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=i7ySC50Z;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488d2079582so17772535e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 23:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778221603; x=1778826403; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=buYkeoczFaZzlB3RWIqzJmoYcPqzDKhBsW/5+Rry/Vc=;
        b=i7ySC50ZkfURWvL0OwIqtnnguFSRb1ckuX4x7LCrTahHtwW7aM+KmgUU97O2gJ1z6W
         s3c/77wRFrur91dO2USA6o8vCUEN/driY/yTBufbKL6Fjj3ywRPkVwrrMgDDaYz5f8Eu
         fE4FsmR4vGS7PS443dLXpQPv9zXdg0mFNDHYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778221603; x=1778826403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=buYkeoczFaZzlB3RWIqzJmoYcPqzDKhBsW/5+Rry/Vc=;
        b=CjncoLCvYVgDCLzzKoSQvO9ARux4N4GHpoiVbtWNilMzrbQq7jh8N+1Bh+qcgTDtm9
         GZ0rImyFAnPy9CTzOF9oSvR/5p/ZCVynzmG1X89/qrGUFTBmKBwaEoxu4q8uZgUvS/Y3
         1S5ngNHo1BX8bpZ7jl/5qsLqgyU8h+9KK5W9eWY+He3lSnscxaoBNfxLrAUlfrzmvhZw
         hD/LL2GC9CdWTATiN5L4gA2ytpzjjxV2B6Ete2uSjymCw/B1LFpQkxBbnEmV52BA8T5V
         qjGwqwZOTl6z+ptowYdtWeGdeAMTn5QbR1uUKCZDbTEzD17bufv+W+cK6pDsOZUR+7tU
         KGpA==
X-Gm-Message-State: AOJu0YwR6BcMcCyT3w+rrmuKMUvM5W4C5QvYyP+CNwtPRP7luKvCbZOR
	YUaQBxmJnaIcGv0K5kPQ8ywFvtnUc4xXkGR4dYbUHL9f2VkKmjSXM/nrYZkbox6bl95TRVTApx1
	CKXfztS8=
X-Gm-Gg: AeBDietWex0me7t7PggrUor9Mv8wh9P2X+poIDkwVkYu6N3r9tPI/9kG4NQ7YuYBuR8
	CdfTQuhENLZpuSJKShdEm3rS4IpkOpLCp3QqZPPxehtj5mcIU1C1X9bjEWZu0M4BnRALi0Y0pb1
	T7z3pkvdcG+NScPM0u3YH7HkoZb/KntlEiuxK6uG1MnKNzNsQDgthIIW2+XnTlhhynjB10NjiSd
	TDYHREs0TK2c+OwWRCifIfGzaRfzosFUMcpXgkELViDNwgha8XS76w4F4oIqwUuzo7zP8OtxG1w
	hFeF0AY9qsBvLts8rZidLVvDKFYdS84eMZpAuwkryKYfqtiPMfv+azotl9E9zJJUDLBfnLmHh6Z
	8D0alUnmeraBcRlHEpsQE2a0r6JRJswbTZl1PnwKmo/MsvI7UO0m35CCHhy+QVkqp3MSa8JrE5E
	LiJ1E/gHvH4369oHvLZuLOlhbURuU6ajM1eQMIn07fuoumRfR3Y/bh31eXYqGsnzxORqJKsWkTQ
	n7mPy6SI9V5Bnoi5WQ5MKKGVJs=
X-Received: by 2002:a05:600d:18:b0:488:b811:51c4 with SMTP id 5b1f17b1804b1-48e51f3c4f4mr137375955e9.25.1778221603241;
        Thu, 07 May 2026 23:26:43 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e68ec5c49sm15202695e9.11.2026.05.07.23.26.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 23:26:42 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 2/8] libarchive: fix for CVE-2026-4426
Date: Fri,  8 May 2026 08:25:54 +0200
Message-ID: <e4e78640b75acb474f82ca9e24be9a1d5b06740b.1778198884.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198884.git.yoann.congal@smile.fr>
References: <cover.1778198884.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 06:26:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236634

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick patch from [1] also mentioned at Debian report in [2]

[1] https://github.com/libarchive/libarchive/commit/c3cb1c568ebf9e8f7f478cfc0356ae54e99712b0
[2] https://security-tracker.debian.org/tracker/CVE-2026-4426

More details: https://nvd.nist.gov/vuln/detail/CVE-2026-4426

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libarchive/libarchive/CVE-2026-4426.patch | 58 +++++++++++++++++++
 .../libarchive/libarchive_3.7.9.bb            |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-4426.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2026-4426.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4426.patch
new file mode 100644
index 00000000000..c303c2372a5
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4426.patch
@@ -0,0 +1,58 @@
+From c3cb1c568ebf9e8f7f478cfc0356ae54e99712b0 Mon Sep 17 00:00:00 2001
+From: elhananhaenel <elhanan.haenel@mail.huji.ac.il>
+Date: Sat, 7 Mar 2026 22:14:23 +0200
+Subject: [PATCH] iso9660: validate pz_log2_bs in parse_rockridge_ZF1()
+
+The zisofs block size exponent (pz_log2_bs) read from the Rock Ridge ZF
+extension entry is used directly in shift expressions without validation.
+The zisofs specification only permits values 15, 16, or 17 (corresponding
+to 32K, 64K, and 128K block sizes).
+
+When pz_log2_bs >= 64 on 64-bit systems (or >= 32 on 32-bit), the
+expression (size_t)1UL << pz_log2_bs is undefined behavior per C11
+6.5.7. On 32-bit systems, a large exponent also causes the block pointer
+allocation size computation (ceil + 1) * 4 to overflow to zero, leading
+to a heap buffer overflow write after malloc(0).
+
+Fix: reject any pz_log2_bs outside the range [15, 17] by disabling
+zisofs for the entry (file->pz = 0), which prevents the zisofs
+decompression path from executing.
+
+Found by fuzzing with ASAN/UBSAN.
+
+CVE: CVE-2026-4426
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/c3cb1c568ebf9e8f7f478cfc0356ae54e99712b0]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libarchive/archive_read_support_format_iso9660.c | 15 ++++++++++-----
+ 1 file changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/libarchive/archive_read_support_format_iso9660.c b/libarchive/archive_read_support_format_iso9660.c
+index 7d3655a..477aae9 100644
+--- a/libarchive/archive_read_support_format_iso9660.c
++++ b/libarchive/archive_read_support_format_iso9660.c
+@@ -2756,11 +2756,16 @@ parse_rockridge_ZF1(struct file_info *file, const unsigned char *data,
+ {
+ 
+ 	if (data[0] == 0x70 && data[1] == 0x7a && data_length == 12) {
+-		/* paged zlib */
+-		file->pz = 1;
+-		file->pz_log2_bs = data[3];
+-		file->pz_uncompressed_size = archive_le32dec(&data[4]);
+-	}
++        /* paged zlib */
++        file->pz = 1;
++        file->pz_log2_bs = data[3];
++        if (file->pz_log2_bs < 15 || file->pz_log2_bs > 17) {
++            /* Invalid block size exponent; disable zisofs. */
++            file->pz = 0;
++            return;
++        }
++        file->pz_uncompressed_size = archive_le32dec(&data[4]);
++    }
+ }
+ 
+ static void
+-- 
+2.50.1
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index bc0d3ba0743..de9682400a8 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -46,6 +46,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2025-60753-02.patch \
            file://CVE-2026-4111-1.patch \
            file://CVE-2026-4111-2.patch \
+           file://CVE-2026-4426.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 

