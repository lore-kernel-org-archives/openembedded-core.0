Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F4E9CD4851
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 06:08:37 +0000 (UTC)
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4457.1778738914700757792
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 23:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=jAQmL/Y/;
 spf=pass (domain: mvista.com, ip: 74.125.82.42, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-134ac81c445so2184846c88.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 23:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1778738914; x=1779343714; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=djeWP3Y96iwmAay1mVZW709Nr76vOHFEn9F+ykSLX3M=;
        b=jAQmL/Y/b2EUlgg4QVU2nCzflCZwNuXqTe9ySSJf8vfbawCGbhpv1SQeQGzKuTNAOA
         v0yg0PV4DuQUA8hJXSiKhJToVKc+dq+r0KEXf6OqykLN685dXKSn+275p/KC5bm9KGhp
         6AGZi2xS9f56Q3UyqtemFQ/v6Y+gmw6Axvv50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778738914; x=1779343714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djeWP3Y96iwmAay1mVZW709Nr76vOHFEn9F+ykSLX3M=;
        b=B9fjxRKPd/RbCJddTjnZoQTBXmgKlLYIXW44MBHH/1ge3ef4qsn2VoCmYjLID0FrIO
         LtZLbKGgLv8ewS07rpY70/2SyBgLdpkeocvs3Uw66sbOCSzRZE53aSA6jkGq5G+AsWJt
         hjguWMu0M0dJ9CLio4oQXCHrq34Qr0xRfRucseCX+AgTEDAqf04ELyhQ/UcKThJ/Fq53
         7qZCnEyCw7wGOa5C7bDPEtHaV4xl91aYennxnamRg+UOKztxfItXJ02OpQaEyMJZaPu2
         zFBAf6EJO3pUkjJ1jyDXfrlfyFVvR2Tz65J1LHzQ+Y4NkK/qxDTw8DU5jM+QlSUbJjyC
         2Y2A==
X-Gm-Message-State: AOJu0YxogS/+rc5aUfmDYGRclEsJRN+lARv5YC77MX8FQWROo+jRJEX+
	00syCqCFpjJbh+s91z+HhBWVtWkphGL9Ro6W0YDGsM7brCeVafkuYQoBcXyyuGCsYPa63nmBXnW
	WwUm8x10=
X-Gm-Gg: Acq92OFrerR3hCSat/05uNgnMHtDH6vywAbnl25tVXzTqft/ewkeTO1tjTIjtbJD+wr
	GXl0TnUHIFux7f30S+COuZkKHY6Xfa8P6joGUimPZuZaakkbfCYff1Zu3Zv/HRjdr33nNb57S4L
	Et70HrEXaeitbaozbcipdw5XTJOzxVQA6fCKRLTcFi7BC57iuQBwPP65Er12SOXGX7emf1a2rcm
	Rl84RilfB+VgGBbWOGFgKcWkA2HTNWt2UvPhv+HoCoKLtoSGJ7BIfOcT4m/KbX1qAg7zzBZCjl5
	yfvmQalC8yZuKcXjDjr2pOx1+tfey5bxGW3qpo0a4RGvUQ1lhsYATBu0o/CaoPNj57BjUc9655H
	3trRsKvPXU9Urehbw8wQQ5oAKZWAtEDlpJQzXRUEJsowRNLtuJMsgKAw008wnc1Tru3M2Yanud1
	GEM+6aNPQc68/R0zcGgbCqHzjGiaTBOn1XbZXf
X-Received: by 2002:a05:7022:6993:b0:133:12af:3fea with SMTP id a92af1059eb24-13439c5e4bcmr4091808c88.43.1778738913586;
        Wed, 13 May 2026 23:08:33 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302978b3cb2sm2384635eec.30.2026.05.13.23.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 23:08:33 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] libexif: fix for CVE-2026-40385, CVE-2026-40386
Date: Thu, 14 May 2026 11:38:26 +0530
Message-ID: <20260514060826.311481-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 06:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237017

Pick patch from [1] & [2] also mentioned at Debian report in [3] & [4]

[1] https://github.com/libexif/libexif/commit/93003b93e50b3d259bd2227d8775b73a53c35d58
[2] https://github.com/libexif/libexif/commit/dc6eac6e9655d14d0779d99e82d0f5f442d2f34b
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-40385
[4] https://nvd.nist.gov/vuln/detail/CVE-2026-40386

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libexif/libexif/CVE-2026-40385.patch      | 35 ++++++++++++++
 .../libexif/libexif/CVE-2026-40386.patch      | 46 +++++++++++++++++++
 .../recipes-support/libexif/libexif_0.6.24.bb |  2 +
 3 files changed, 83 insertions(+)
 create mode 100644 meta/recipes-support/libexif/libexif/CVE-2026-40385.patch
 create mode 100644 meta/recipes-support/libexif/libexif/CVE-2026-40386.patch

diff --git a/meta/recipes-support/libexif/libexif/CVE-2026-40385.patch b/meta/recipes-support/libexif/libexif/CVE-2026-40385.patch
new file mode 100644
index 0000000000..75f7fea6e4
--- /dev/null
+++ b/meta/recipes-support/libexif/libexif/CVE-2026-40385.patch
@@ -0,0 +1,35 @@
+From 93003b93e50b3d259bd2227d8775b73a53c35d58 Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <meissner@suse.de>
+Date: Fri, 3 Apr 2026 11:18:47 +0200
+Subject: [PATCH] Avoid overflow on 32bit system when reading Nikon MakerNotes
+
+The addition o2 = datao + exif_get_long(buf + o2, n->order)
+could have overflowed on systems with 32bit unsigned int size_t.
+
+This could have caused out of bound reads of data, leading to
+misparsing of exif / crashes.
+
+Reported-By: Kerwin <kerwinxia66001@gmail.com>
+
+CVE: CVE-2026-40385
+Upstream-Status: Backport from [https://github.com/libexif/libexif/commit/93003b93e50b3d259bd2227d8775b73a53c35d58]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libexif/olympus/exif-mnote-data-olympus.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libexif/olympus/exif-mnote-data-olympus.c b/libexif/olympus/exif-mnote-data-olympus.c
+index 3dbe1d3..a5ed7ad 100644
+--- a/libexif/olympus/exif-mnote-data-olympus.c
++++ b/libexif/olympus/exif-mnote-data-olympus.c
+@@ -382,6 +382,7 @@ exif_mnote_data_olympus_load (ExifMnoteData *en,
+ 		o2 += 2;
+ 
+ 		/* Go to where the number of entries is. */
++		if (CHECKOVERFLOW(o2,buf_size,exif_get_long (buf + o2, n->order))) return;
+ 		o2 = datao + exif_get_long (buf + o2, n->order);
+ 		break;
+ 
+-- 
+2.50.1
+
diff --git a/meta/recipes-support/libexif/libexif/CVE-2026-40386.patch b/meta/recipes-support/libexif/libexif/CVE-2026-40386.patch
new file mode 100644
index 0000000000..3792aa02a6
--- /dev/null
+++ b/meta/recipes-support/libexif/libexif/CVE-2026-40386.patch
@@ -0,0 +1,46 @@
+From dc6eac6e9655d14d0779d99e82d0f5f442d2f34b Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <meissner@suse.de>
+Date: Thu, 2 Apr 2026 13:26:31 +0200
+Subject: [PATCH] fixed 2 unsigned integer underflows
+
+this could cause crashes or data leaks.
+
+Reported-by: Kerwin <kerwinxia66001@gmail.com>
+
+CVE: CVE-2026-40386
+Upstream-Status: Backport from [https://github.com/libexif/libexif/commit/dc6eac6e9655d14d0779d99e82d0f5f442d2f34b]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libexif/fuji/exif-mnote-data-fuji.c       | 2 +-
+ libexif/olympus/exif-mnote-data-olympus.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libexif/fuji/exif-mnote-data-fuji.c b/libexif/fuji/exif-mnote-data-fuji.c
+index e3af4e1..3f295d3 100644
+--- a/libexif/fuji/exif-mnote-data-fuji.c
++++ b/libexif/fuji/exif-mnote-data-fuji.c
+@@ -68,7 +68,7 @@ exif_mnote_data_fuji_get_value (ExifMnoteData *d, unsigned int i, char *val, uns
+ 	ExifMnoteDataFuji *n = (ExifMnoteDataFuji *) d;
+ 
+ 	if (!d || !val) return NULL;
+-	if (i > n->count -1) return NULL;
++	if (i >= n->count) return NULL;
+ /*
+ 	exif_log (d->log, EXIF_LOG_CODE_DEBUG, "ExifMnoteDataFuji",
+ 		  "Querying value for tag '%s'...",
+diff --git a/libexif/olympus/exif-mnote-data-olympus.c b/libexif/olympus/exif-mnote-data-olympus.c
+index a5ed7ad..bdeb5a9 100644
+--- a/libexif/olympus/exif-mnote-data-olympus.c
++++ b/libexif/olympus/exif-mnote-data-olympus.c
+@@ -76,7 +76,7 @@ exif_mnote_data_olympus_get_value (ExifMnoteData *d, unsigned int i, char *val,
+ 	ExifMnoteDataOlympus *n = (ExifMnoteDataOlympus *) d;
+ 
+ 	if (!d || !val) return NULL;
+-	if (i > n->count -1) return NULL;
++	if (i >= n->count) return NULL;
+ /*
+ 	exif_log (d->log, EXIF_LOG_CODE_DEBUG, "ExifMnoteDataOlympus",
+ 		  "Querying value for tag '%s'...",
+-- 
+2.50.1
+
diff --git a/meta/recipes-support/libexif/libexif_0.6.24.bb b/meta/recipes-support/libexif/libexif_0.6.24.bb
index b3ee15a37f..8418b72c52 100644
--- a/meta/recipes-support/libexif/libexif_0.6.24.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.24.bb
@@ -11,6 +11,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libexif-${PV}.tar.bz2 \
            file://0001-Add-serial-tests-config-needed-by-ptest.patch \
            file://run-ptest \
            file://CVE-2026-32775.patch \
+           file://CVE-2026-40385.patch \
+           file://CVE-2026-40386.patch \
            "
 
 SRC_URI[sha256sum] = "d47564c433b733d83b6704c70477e0a4067811d184ec565258ac563d8223f6ae"
-- 
2.50.1


