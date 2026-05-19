Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1933DCD5BB8
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 23:30:41 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.954.1779233431897013300
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 16:30:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RB8RQy28;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-44ccbd3290aso3938264f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 16:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779233430; x=1779838230; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7e3baXU966NXPvqcW/VR37EGm4oDAwNd670im0ikUIY=;
        b=RB8RQy288IPEPOtJzLp0dGMk12i54Kpjhm4rUTKgjyB4VbX82wUQkCIuNuVq1m7hy8
         eRtlRM8QLQfxiNCYjwQ3Z2EuY55ShBl9VBMoKvxyioIGuBUdBG3nIZ1JlxQG1lGO1X4R
         Flo9+KzYpvieVZyoPnFqvRZotiiaYes9xc8P4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779233430; x=1779838230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7e3baXU966NXPvqcW/VR37EGm4oDAwNd670im0ikUIY=;
        b=PaiueKevosXBbrCUTyyNA7wKFexjkE9ecStGFbJuD/Rfarhg+VJW6SdFSXQJkQ9jiw
         jzGX5zo/2XYe4wMv01tHKoQ2cnsR+Hhp2xt4RJkLzKrOhZZW58IcDH/BLinXhGC3gYkb
         lkS5XDrAAyePJiuGTjSVF7B+lCr4tGeOWt/VgV2IAGMpSsNU+35bMIkQ3ba8WugTC7eF
         xWV9eL7E71t1q9oE3GkzqYVFFj+8hVVx7H3HMF7DDCUXvldOGX4A/ePvf9frDgK16QVq
         3vSPoeLCcmd65LbNDB/X8zQAonWKshxiKOFbpHv1luDIME35Jur8CJatY2BqlHv+Hm42
         VznA==
X-Gm-Message-State: AOJu0YxfRa8tv2iMEl4baJn0lfBGrNW5cU1dnkc8JXBg08L32VIXjfx0
	6/VmnOcKWQ7QEgxN2N29bIO/AWhMQxC0sXF+RVDSvOxd+RaFkINSp5+yXVnqa2lp3e6j61vMO+W
	9Gw+n
X-Gm-Gg: Acq92OEkh5tnLZnnnDGp9Eo4EYjod/tK6hm0WNGTeSkgP5wewS9ST6H5WktEq2rEntF
	UOzDiQwIRGd+RxNryNgReD14MZsLcGEsP+MV0yw9VHZJ2WAJpjagxQRs6Gpq3wAU70a2+hi/nmZ
	65Rgqbzq9gceEaJmcYPLnaoTY5BjzD/7Jld/s//z3eEOpb9zxjf+NDUMTEDPmw2fQzx+fanTgTh
	gaIDzj+8SGN9pXBevDKFzPwccSyQiUMl0QjMAzC4mGecltEFxXmaYZ/Lu/U6gYztZLCEWM4Zg01
	sBxE2778KOrPzeRMRYvdbjHMdFD1qZFkk9wDXZPu9H0s2WFWeEss+XxxM/5T1xYZbQwoGtEqE6r
	h1HBIgKu8Z8QvsWxmiNwsn0+XSMgaX9nLXRSqWD7ImFdJ9DKb0fh220KIJT/NaKHoF4TcXh/SOa
	gpQcE2dIPqv+urbxzr1eWQsjYbVYjTMxMKZEIjcuLU00o2mbvr3AmScVyYhEUEbIiG2W8+KgmHU
	NfAiH7be8quH8N1F31lSaw1O7I=
X-Received: by 2002:a05:600c:848c:b0:488:b749:8482 with SMTP id 5b1f17b1804b1-48fe60e52c1mr348358325e9.4.1779233430079;
        Tue, 19 May 2026 16:30:30 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5bc94sm224705795e9.4.2026.05.19.16.30.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 16:30:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 07/28] sbom-cve-check-update-nvd-native: Update source revision
Date: Wed, 20 May 2026 01:29:44 +0200
Message-ID: <9d3d22ca591c13a84a9210779d03c0c7cc91d062.1779232800.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779232800.git.yoann.congal@smile.fr>
References: <cover.1779232800.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 23:30:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237354

From: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>

Update source revision to v2026.05.07-000006

(cherry picked from commit 3724b93538d3acbec9f48d4c524b51d166071708)
Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../sbom-cve-check/sbom-cve-check-update-nvd-native.bb        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb
index c868ba09c18..26a14e6eb16 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/fkie-cad/nvd-json-data-feeds"
 SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "nvd-fkie"
 
-# v2026.03.19-010002
-SRCREV = "49f8bbe1b0b0884e16bdc37ab68db997085570a7"
+# v2026.05.07-000006
+SRCREV = "72d8841c8ad9083ebf6723063f275444ea0d76f9"
 
 require sbom-cve-check-update-db.inc

