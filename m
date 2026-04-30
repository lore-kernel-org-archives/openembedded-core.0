Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B00CD13D3
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 06:33:37 +0000 (UTC)
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14390.1777530816829414506
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 23:33:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=EglRU06d;
 spf=pass (domain: mvista.com, ip: 74.125.82.53, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12c8ccc7755so861771c88.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 23:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1777530816; x=1778135616; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j5SxYAiptCJxdRnFwDhlJO/TFlr1PGg31GnvwMBcZTc=;
        b=EglRU06d8L52rFURodieifnVoAXkn+pA8DET3nyJieRuSKYIh/XkzHxbFXh7h3iZez
         NooPmjo6chWXttYjSITPl3gZfKpQn9+hyOPlvyAvKhIVy/wnUIERNr31gDq2T+nrMuz7
         78p7AgnY2QrjCz9ba9FVm7a+fse8uzSFWF1iY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777530816; x=1778135616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5SxYAiptCJxdRnFwDhlJO/TFlr1PGg31GnvwMBcZTc=;
        b=c8CX/Q+qa7Tb2+yy3V/4pATJInUobM1mA4KNhnq2rL4AXjT3J1v7g1EUbILAdiVo6H
         445V/sdjdXd5AURiaEmPNABlO83/zV1wzBCEUcPestg0mm8Cw4d0gjay3rJ5troszFVl
         HyMWiOBuB1Url38u9HbmIOotE/womE2IJm7qBfixTtSWpxBTLMOBc73PjwznbVO0KJ9V
         jS7i+9frIs3yqcfo1q/sFWGcJ2IDe4cwo5X6fJekQIxPcJpQKwaBfkOFrUxtWQqDpyk1
         p8X1TBn2IBu6glQo+aq1GZDp3GPUndDK4SvBVi113LLwcp60zyVsvZsfhtTnY5vxKQY1
         SMwQ==
X-Gm-Message-State: AOJu0YzUoC55EUymZ+ziy/60HV0tWDnCqbssydkzSqm3uXMAs53MqnBi
	Gm2ZWcEon3jEwXfgpWT2qiJkTfWN96JD9IX8YVBRLJhBjsptooJvWeyrPccei7kh4ekMr4Lp3WT
	kXMBm
X-Gm-Gg: AeBDievc0CoOFgZOEydAnBNV5iOkRIMbw/zfkf5DoVxdLu79/0RWghnUThUbCufYoiH
	DyZ2bf6oiXzPkcLV7nhXqJguL8A7wiHxffVmefYvk8LpF15B4Hnx8QN/b0YppzpBs+q4nb9Ux4D
	K1S8fpa1tB0aDOQqiqvrk6uGavHpjexsbL/V3yucTll1OYcmBfZYH3PVEq1cZt1TNiBpGtV4biA
	Tg/r8jHC0f7Fsth9lzKqZJ5w0HyNHs1RBOtgg7XefAl9qM/9a3xE0gUFxuwuWDkJCuplht+GpqP
	WSkU0uaV903qzbD0hcNxwCEx/rs0xYcFQRcvb4KCqlNEzvRWGbM9UJTzRNfPLoK4CugH9ZI7wic
	3naHx76H5Xu9ZVQ5v/Rqd4hAurxbstBY35qBe864pvuVgwvCC+w8lIINUygtnAh/lPlXfbDQB5C
	vRmA1yo78QAvz0kllzY1IR0oG1trOa2dU/SNS8SULFclC5SDc=
X-Received: by 2002:a05:7022:1603:b0:12d:c3fb:14a7 with SMTP id a92af1059eb24-12deac8fc66mr809986c88.18.1777530815526;
        Wed, 29 Apr 2026 23:33:35 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12de31ab65fsm6115186c88.0.2026.04.29.23.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 23:33:35 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] libarchive: fix for CVE-2026-4426
Date: Thu, 30 Apr 2026 12:03:28 +0530
Message-ID: <20260430063328.370756-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 06:33:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236139

Pick patch from [1] also mentioned at Debian report in [2]

[1] https://github.com/libarchive/libarchive/commit/c3cb1c568ebf9e8f7f478cfc0356ae54e99712b0
[2] https://security-tracker.debian.org/tracker/CVE-2026-4426

More details: https://nvd.nist.gov/vuln/detail/CVE-2026-4426

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libarchive/libarchive/CVE-2026-4426.patch | 58 +++++++++++++++++++
 .../libarchive/libarchive_3.7.9.bb            |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-4426.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2026-4426.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4426.patch
new file mode 100644
index 0000000000..c303c2372a
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
index bc0d3ba074..de9682400a 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -46,6 +46,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2025-60753-02.patch \
            file://CVE-2026-4111-1.patch \
            file://CVE-2026-4111-2.patch \
+           file://CVE-2026-4426.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-- 
2.50.1


