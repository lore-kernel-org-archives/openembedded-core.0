Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61AA7C5DF95
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:58:03 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10425.1787155082258957657
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:58:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RuRX1I1I;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47fd4531020so713548f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787155080; x=1787759880; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IosZslMiOULuM9yAtZfjLYH2sr6yoVTinwM5xa8XCis=;
        b=RuRX1I1INOP1iWq8lR3Dql/g8xS+tDrUAHiuZONBGLd+FX6IQLlB8xIFH5NubRGEfh
         33K35gadxkobrkmznluZkC5tdu5wVpWnNktVT4MwV+yE8VPvpvHHjZsCD4Zwhlgehwuo
         MKijXFqmVWbq42zrno8j06fwiZf1Ci7m7yVh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155080; x=1787759880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IosZslMiOULuM9yAtZfjLYH2sr6yoVTinwM5xa8XCis=;
        b=P/6ADjr6AzmP/sC1sSVERpPhmUZmKSja6ZOnZM+LGHweo3p5GdltUfpQLI+rQ1BirQ
         MRcGZrKiaV2QJKM+mCNa/NxQW/aGaIRrJVIQhSkzR2ikWuwK3txIW727gO3Yddc/YIgx
         sWqD8bXqUjdNAO24kGfzlugRq1si1zzDAgsTfmKu0gc9PG3bmoL5yiHwyKRt5xztb8Rd
         hRFNI0MMUZG6qwuVJBNtwIvHfiNFpI9cRIPvQNDgUC1SVV67jDNR8C8s6jkDhVFeJrlI
         4yWAKuSrTC2diE4l+UwhjzT9lx/6oRARXwXm0aUyqOoABlRShhyy6cuITxA01pEKSMjE
         pItA==
X-Gm-Message-State: AFuF++nrns9ZTLdIh1uNOFxTes/GclqL0F7eDw8xpLowBTa0B8klRisy
	6c8W4tN2VQtpYzsOQd93GcOATyrblrYUDnG2BnPVEeEIXcAxBoVJMW5qIcKjAgT3ag+49E6xbR7
	mZ/z1RTQ=
X-Gm-Gg: AR+sD10Z+pMLG+zJYzKfhnHw7VcM3gcoqiHKxgaN6kFaKMUkOQXJfFdulj/e7Jrzy+t
	RksO5xKfSefFq69mlBYt5IVRbl4iuGFto3M9d243mStsGww+GJTSgxRBIfC+jTdAfudu0C/ZH8b
	yJplIFcryeSpemW8mCPhZ3AFKIR/7Wt18eoQtgaABzSfAK8HFxSA5xx+Y3mrbK55FGTap4R+iUM
	NjcQqmFoizjTcbeJCWG+CFIBWWTevpK6BYv09mQVG31TsYZrCGom6kDJbNWyM4XmU2ElbLiQb9b
	hZ97gfghdisBbsX+FW579NfTN5LHVKpyMyVWMii/lFzuzh6ptLlPngwu70jsyfBkyobRYVaYHNM
	iy6S0HSQuA/xl6Y3kc8gma7L3X8iROfBRSzJANTqOQbC9w6cG4WXeOl62RNr+ZI0KzccP/DRZml
	/P5y46V5tFyd5vq/ZpCENckDGorfbocz1xBYm9Y8cK/mvNwCwH1mXR83yje8Q8YWERtJxiwvF66
	m3VyCrdidlsHcR+jkRAikJUwXlxIrf/o9HNNdSZtPpm86eyqepEigazPHBjwDHHYi7b/4QbMy2x
	Y2Qbc6FcNYfKihKtstB9z/IGP9Ryduw1Qj2rMztK
X-Received: by 2002:a05:6000:490c:b0:481:56ec:b422 with SMTP id ffacd0b85a97d-482b1eaa195mr11072039f8f.9.1787155080486;
        Wed, 19 Aug 2026 08:58:00 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm7215698f8f.35.2026.08.19.08.57.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:58:00 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 36/37] libsndfile1: patch CVE-2026-37555
Date: Wed, 19 Aug 2026 17:57:07 +0200
Message-ID: <e9fadfaa7ab3a93526fed23c7203dcb7a1331f46.1787154074.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787154074.git.fabien.thomas@smile.fr>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:58:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243772

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-37555

(From OE-Core rev: bdf36cd3a438b0d52de4c8971c19268ff1fc427f)

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
index 4cf42375739..5d2a2c256b0 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
@@ -13,6 +13,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libsndfile-${PV}.tar.xz \
            file://CVE-2024-50612.patch \
            file://CVE-2025-56226-01.patch \
            file://CVE-2025-56226-02.patch \
+           file://CVE-2026-37555.patch \
           "
 GITHUB_BASE_URI = "https://github.com/libsndfile/libsndfile/releases/"
 

