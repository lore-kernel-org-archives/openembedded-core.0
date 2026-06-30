Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD97C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 13:49:23 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21476.1782827362055883441
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 06:49:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Pk+L/Jt7;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-471eeac43bfso2938198f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 06:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782827360; x=1783432160; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R3eo4jUCbS3e2y73nEM8/N3JlssQWfHZiVupVU603UY=;
        b=Pk+L/Jt7FVhit7qgidcR+nsUIQGhn5chPI3wV8e9oJlcJagOU85GeQPYxgZzO7f05Z
         z/0K5lW85wRPXT0896sO3X8BKsrKbTLcpEkSv5lfLu6chgDqAZK197nQDYbTErf1C91n
         Z2l3XFxUHloEfYqhfCQtxj+BDJ2SpnJIL31Oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782827360; x=1783432160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3eo4jUCbS3e2y73nEM8/N3JlssQWfHZiVupVU603UY=;
        b=Ab84aCc6rp88JnWaKGIblekcvQTeLJ0dEPLxXG6nC6V101grdtaul1KpWdr0JpRG0l
         ugWpC+Ukv/isFsdHrFyuAdcABfAFwS45nrMxlIRWmUUAvKRhzFkgHmapgg5WWNqXla25
         AxKfrx9c1ggRRl9oINRCmoXztTwgCO4uuz2c9kJNosJDO11VDWGSj5TifF//V5iHRd+M
         5i5dIaYOKD2y8bZhjVLchiWjFjirliuKWQIAr+Eurr3y+PzjTjNQpCcr2rnoDgRfDgor
         ajsXVCm1p+0CEJ52AYEeqrXwM5G+mGS0/bQOOOkVlylqrDl3KZI1M9CI5QgE+Sdsigsf
         hPLw==
X-Gm-Message-State: AOJu0YxPR6HIChVKf2Z+SfaMSAJeiye4G0OZyGIWz5AdYwkn5M802SuR
	ztNz2wsI8pMbE7D2T6z/qzPX2UfSRVG0jIsealKJi47WIIxQ5rIM3H0xLLiRod3O78BsC4nTYzj
	a1vbE1Do=
X-Gm-Gg: AfdE7cnh+XPSuTYxbv1/FRrmWEMorSHMiEwE2cunRR5MEvBfskOp1gTPaoCJydamJn8
	AlXtvHvBQ+NRdsE+qs2UYoqOFAraF8YRN4nxWXcwcdriTYHUBez6o74LTEo7FMl1Xt42T6qHvHj
	LHXEw5GPHgGvKbLbjzBRJvPv8Dc7gu+lWm9Qb99S75GdWU1ZlyCr4Lc8/jJOUduD74i+bWJruRi
	3tyEA3t8kMKulr3+29SiP1GwPrx3jNRygj9jo8o50OZeXmPp86hkTP+NN+6/paynX8L1JLmVrbC
	x/YbJUFwxTHqBTRinoqhfGU+CymNncohcaE1UGR2p5aRScMg0fLCBvLk37N7WW8ZfK4uLxI+JG5
	kUZjAc51+ieFUzzd8dFhH8IqY1RgCaGcaD10vSQ9FSfjn88MYWPFpJD1AU6+DnWdp/S66Ay6dK7
	gzhp3dFWYvyHJa5SFdyRkHYiQNnyxyRtpVNBTy4az5p/re+4seGVjYtO/73bHb1Iq9Sdj/vI4+J
	q5exEDQieEHs1x1iCzFeJKn06UB
X-Received: by 2002:a5d:6107:0:b0:46c:cffc:7638 with SMTP id ffacd0b85a97d-47659ee67b3mr723671f8f.30.1782827360129;
        Tue, 30 Jun 2026 06:49:20 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0041d7d5fc68d4e77b.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:41d7:d5fc:68d4:e77b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47563d194b0sm8484528f8f.1.2026.06.30.06.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 06:49:19 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-core ML <openembedded-core@lists.openembedded.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] dropbear: Add missing WTFPL & Unlicense in LICENSE and LIC_FILES_CHKSUM
Date: Tue, 30 Jun 2026 15:48:54 +0200
Message-ID: <20260630134853.537737-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 13:49:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239896

From: Yoann Congal <yoann.congal@smile.fr>

Vendored libtomcrypt and libtommath are respectively WTFPL and
Unlicense: update LICENSE to reflect that and include vendored LICENSE
files in LIC_FILES_CHKSUM to detect changes.

Note: libtomcrypt/LICENSE also specify "Public domain" but that is not a
real licence, so choose the alternative: WTFPL.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/dropbear/dropbear_2026.91.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dropbear/dropbear_2026.91.bb b/meta/recipes-core/dropbear/dropbear_2026.91.bb
index 826a691b04d..cdddd64fe2c 100644
--- a/meta/recipes-core/dropbear/dropbear_2026.91.bb
+++ b/meta/recipes-core/dropbear/dropbear_2026.91.bb
@@ -6,8 +6,12 @@ SECTION = "console/network"
 # some files are from other projects and have others license terms:
 #   public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2, PuTTY
 # The 'public-domain' file is headered as MIT
-LICENSE = "MIT & BSD-3-Clause & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=25cf44512b7bc8966a48b6b1a9b7605f"
+LICENSE = "MIT & BSD-3-Clause & BSD-2-Clause & WTFPL & Unlicense"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE;md5=25cf44512b7bc8966a48b6b1a9b7605f \
+    file://libtomcrypt/LICENSE;md5=71baacc459522324ef3e2b9e052e8180 \
+    file://libtommath/LICENSE;md5=23e7e0a32e53a2b1d35f5fd9ef053402 \
+"
 
 DEPENDS = "zlib virtual/crypt"
 RPROVIDES:${PN} = "ssh sshd"

