Return-Path: <rsangam@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F267C5DF7E
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 12:04:21 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7364.1787054652518379879
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 05:04:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=JDTpbMJf;
 spf=pass (domain: mvista.com, ip: 209.85.216.48, mailfrom: rsangam@mvista.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso3525099a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 05:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1787054652; x=1787659452; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UPZuMEb5F0apebtJifNwpRMM01pbO+qjKzH8kMGcF58=;
        b=JDTpbMJfGxY6oX5D55LJJcYQfCjPaISpo8sZEKcHub+cyUJFASqB4EhCQXu9OVyqsT
         dH0xTGep27pG7j+p+vqT76bzO3dSoxnhbLk63nBqaH10q6IcgUfY2ncSOU+Fu05P2OdX
         ByH+aHbfVlAT6fPLfOBHKsrNyv58cnf9ZVl/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787054652; x=1787659452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UPZuMEb5F0apebtJifNwpRMM01pbO+qjKzH8kMGcF58=;
        b=ErCkRp5SCILdtCi8RTnnTBSDWV5mcQVH1EN6zFXgU9al7dQZ+UCsT5J1Bv5fS57/Pd
         ZRSkZu5b9VD+tjhNkeWmEWEBxgLoRliUYdMftrVxwqXhI8WSSt7qja2U4rFabAUOZyrf
         PuxAF01fxDuLOGjPBcQXHDPzV5FFjU331rZQ/7DyVeBAGo8x+1nlA3rxl1RHQTe9oQaD
         cp5oBekaFHXTSr+asN8VP1Odpa2pp2aTSjr4Oy7zBGtG/cC0n8zbBNM9BnoH57PPx8p1
         mHwRWYkLx7E3MLgo38F3+777Q+w/jSuusQNNugFel6EmmebCKcVo+MNYU0rxfoFZAlAS
         taBQ==
X-Gm-Message-State: AOJu0YxtBDysizJy47N7QHqH5RbFQ077lBFtmL973Rl8rUdg4XUlH3HT
	1HA4IbUL2PrJ5kseWnA/bM+dopDHtRZA/SfryZrC83UO4vAy60MQhKf+90yMacEZnVrrOR/qR+c
	BrO1L
X-Gm-Gg: AR+sD12XMkznJCTe23fP9jcd9Fq/Ugf+PXKZSLotbRd8o4eg/Eg7W9qvFD++CVaw0sF
	28d/InPvpIkcwdOxzZT9oIdO9chNt/A+qmy66xvu8bDPwKmGR+P3TmKLE5h0d/0Ehf80f4eROLM
	3tTJ5IzVSN7bQbgM1A6lNUvOSe2oCxzqG9YViuyT7lY542jTaa0e8dTTf/HkIY/yFIAFqCX5pyl
	Bp85rJvgFcQR/RBzIvgqfo1QQ3+Yo3O15Tt2XQXsdhQ6WqXdg4PE6NuSqYwljo5kM6F1bv2PbKo
	xu4SmIa5ZsZ3MD5yhk9lHQE6vQDfQ/pNIqqmPEXw4sGyxLOMzQ7pmyk6B4MFtiWYmpepXmFiPPe
	S7kcewilhAiEVnBTWkoas2mGjO3+F6WPPKevay25LmCmdHyQbzggC1OrOWmsEM2F2XatRWenKJL
	Djooz8efFPA7b2ewwtsoe4YrL4LwAGO9P47xdls/EOHUNYPkR7qpp92qpDm0PS9hJ4Ct1d
X-Received: by 2002:a17:90a:dfd0:b0:38f:23d6:b4ad with SMTP id 98e67ed59e1d1-3933b792985mr34216590a91.8.1787054651616;
        Tue, 18 Aug 2026 05:04:11 -0700 (PDT)
Received: from MVIN00040.mvista.com ([49.207.228.61])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1415315a206sm15164809c88.10.2026.08.18.05.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 05:04:11 -0700 (PDT)
From: Rohini Sangam <rsangam@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Rohini Sangam <rsangam@mvista.com>
Subject: [scarthgap][PATCH] libsndfile: Security fix for CVE-2026-37555
Date: Tue, 18 Aug 2026 17:34:04 +0530
Message-Id: <20260818120404.43393-1-rsangam@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 12:04:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243675

Pick patch from [1] also mentioned at debian in [2]

[1] https://github.com/libsndfile/libsndfile/commit/c32c090ff9bb45e1dae637957c9c9b47b3967623
[2] https://security-tracker.debian.org/tracker/CVE-2026-37555

Signed-off-by: Rohini Sangam <rsangam@mvista.com>
---
 .../libsndfile1/CVE-2026-37555.patch          | 48 +++++++++++++++++++
 .../libsndfile/libsndfile1_1.2.2.bb           |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2026-37555.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2026-37555.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2026-37555.patch
new file mode 100644
index 0000000000..b2e671f2b3
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2026-37555.patch
@@ -0,0 +1,48 @@
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
+
+Signed-off-by: Rohini Sangam <rsangam@mvista.com>
+---
+ src/sds.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/sds.c b/src/sds.c
+index 6bc7617..0dc082d 100644
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
+-- 
+2.44.4
+
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
index 4cf4237573..5d2a2c256b 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
@@ -13,6 +13,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libsndfile-${PV}.tar.xz \
            file://CVE-2024-50612.patch \
            file://CVE-2025-56226-01.patch \
            file://CVE-2025-56226-02.patch \
+           file://CVE-2026-37555.patch \
           "
 GITHUB_BASE_URI = "https://github.com/libsndfile/libsndfile/releases/"
 
-- 
2.34.1


