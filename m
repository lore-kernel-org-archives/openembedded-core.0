Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D68EC61DB7
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 13:01:06 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15966.1787576462618295770
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 06:01:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=I7Q7hkM+;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso35020555e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 06:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787576461; x=1788181261; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rA4EwgjAvggDCDtg8p1B4xxguIKW7SlTg84bNxmE4Tg=;
        b=I7Q7hkM+vC16fuorYANAkYoMiTXTwO1JICa84ihVgv+5y3Sf6AZLg9vFRoznBKyf9S
         OBW94mM3JdphPHBvifSSEqk/ZRxScCz7kYeteg3HSh0rZszp/vBPeoI5UgmsAgPalzx6
         3604P8uOKzjbCQ+dWsW693OcivfhbUUuLcRbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576461; x=1788181261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rA4EwgjAvggDCDtg8p1B4xxguIKW7SlTg84bNxmE4Tg=;
        b=ez+VlUY/2cPEmEln1Uzr1uvgseBrYXgBiWda4sgGwzChYDM8aLSd6wIHKC0hWqxEU4
         kxxq5s95LOBPLwqeyIGceDKtBuVVNB9IeJC0M0BtKfCH/9rKX0M73etbt8AHtkuL7asi
         5R6srPtXQWDRA1/bzUZlRdLB13DUJded0vB8dPVL4X8an7RwcykXtbY946UaNjnxe8iN
         E6kY1kiOj7GD3OCPcJ0JJ4fniKHJ/UmojvVpBTQRelxPbqI3/JGTuZUXNB1M8IC35RNX
         mVLn/TqALCyB+34/PEZEwGW7JQm4aFQ7uFeRPIFAMGw0QjsUUenyVvww/qSPHSkXOeRf
         pNOw==
X-Gm-Message-State: AFuF++mwJn3KJSw4CKXs8/iPV2PjnfF513kQXfbskn+7UhtxX95wvDrY
	NqHlBhidxHhXv+TVYeAA8CcbU6qeeCEG501MIeiE9gakuVp4T8y3/fg0VzV6U99VVZb2nWXBhaK
	mBRQ/LuU=
X-Gm-Gg: AR+sD10f7KAc+NBF9NQ2elVHL+ey9m4XUhmbyBeFd38T+UD6znKJn+9zn4dNQu/jfUz
	Kz9T8jxBxsAtDx9WRF8oHEa5WA+Ln0SS7pkMCXyrnUy8/2IOa3qxd24rSvFpz8KAwUsaM+1WaAQ
	CuXjuCc0ukQzYNQQaIesWogCOmpGUj7bstTOT6jW9fomt0DMg70RPfRrs4AFd1n+xtdJKo98JOq
	8/mCPndXl9NxXyEN7JIOdhh3ylhCRT2GsUW9LxYZ1Rbzihjr8QEgaNrJmu8YD6lFUoFpuVN+Dc4
	YP/nknhCRItJBtxi53szjLYDczJYiMirNAirt4gBv3vtgY5IFhHYcirJSMOXJ+RQadhAjclVNA9
	jjFvdnAhAYFhd8ZLpTrIaWB1g1ZNnBbyyjBSkBTOwZCM26nG/9qy6ciMwNiWAoseI2lLnLixGkb
	g/GBWL5pcSg/LRJ8lU5cKxFfLC15QJblfLl6YL2lwg/SQpAxCbLdAfOIgRu1eCuD9ZEnGO/4xFv
	t9fT9cfhuwYaY87zZS3y0YSVEcB9aiGOBGfGgv3p+LQO0CNA11ByJDr513ELlvAuzaM35A=
X-Received: by 2002:a05:600c:4ecb:b0:499:900c:9c68 with SMTP id 5b1f17b1804b1-499c19a766fmr202534115e9.6.1787576444357;
        Mon, 24 Aug 2026 06:00:44 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c35935f5sm61379865e9.2.2026.08.24.06.00.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:00:43 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 07/19] libsndfile1: patch CVE-2026-37555
Date: Mon, 24 Aug 2026 14:59:49 +0200
Message-ID: <575de444a879e838cd18f583b2a7117debf01d6c.1787576160.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787576160.git.yoann.congal@smile.fr>
References: <cover.1787576160.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 13:01:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244114

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-37555

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../libsndfile1/CVE-2026-37555.patch          | 44 +++++++++++++++++++
 .../libsndfile/libsndfile1_1.2.2.bb           |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2026-37555.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2026-37555.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2026-37555.patch
new file mode 100644
index 00000000000..bac8476ee8c
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2026-37555.patch
@@ -0,0 +1,44 @@
+From c32c090ff9bb45e1dae637957c9c9b47b3967623 Mon Sep 17 00:00:00 2001
+From: Alb3e3 <74142887+Alb3e3@users.noreply.github.com>
+Date: Sat, 27 Jun 2026 14:34:16 +0200
+Subject: [PATCH] sds: avoid divide-by-zero in sds_byterate for zero-frame
+ files
+
+sds_read_header() sets psf->sf.frames directly from the file's 3-byte
+data-length field without a lower bound, so a crafted .sds file can
+leave psf->sf.frames == 0. SDS never sets psf->bytewidth, so
+sf_current_byterate() falls through to psf->byterate (sds_byterate),
+which computes
+
+    (psf->datalength * psf->sf.samplerate) / psf->sf.frames
+
+dividing by zero -> SIGFPE crash (denial of service) when an
+application calls the public sf_current_byterate() on such a file.
+
+Guard the division with psf->sf.frames > 0, returning -1 (the same
+'unknown' value already used for the write path) otherwise.
+
+Reproduced with a 21-byte crafted .sds (data-length field = 0) under
+AddressSanitizer: 'FPE ... in sds_byterate src/sds.c:761' before the
+fix; returns -1 cleanly after.
+
+CVE: CVE-2026-37555
+Upstream-Status: Backport [https://github.com/libsndfile/libsndfile/commit/c32c090ff9bb45e1dae637957c9c9b47b3967623]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/sds.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/sds.c b/src/sds.c
+index 2a0f164c..1070e653 100644
+--- a/src/sds.c
++++ b/src/sds.c
+@@ -757,7 +757,7 @@ sds_seek (SF_PRIVATE *psf, int mode, sf_count_t seek_from_start)
+ static int
+ sds_byterate (SF_PRIVATE * psf)
+ {
+-	if (psf->file.mode == SFM_READ)
++	if (psf->file.mode == SFM_READ && psf->sf.frames > 0)
+ 		return (psf->datalength * psf->sf.samplerate) / psf->sf.frames ;
+ 
+ 	return -1 ;
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
index c1fb5223067..a26f57d7f42 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
@@ -14,6 +14,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libsndfile-${PV}.tar.xz \
            file://0001-Include-stdbool.h-instead-of-redefining-bool-true-an.patch \
            file://CVE-2025-56226-01.patch \
            file://CVE-2025-56226-02.patch \
+           file://CVE-2026-37555.patch \
           "
 GITHUB_BASE_URI = "https://github.com/libsndfile/libsndfile/releases/"
 

