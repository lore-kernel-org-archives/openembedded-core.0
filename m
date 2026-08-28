Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4687DC61DBD
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 07:28:04 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1282.1787902083220679852
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 00:28:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=N7IWsW0k;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so957919a91.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 00:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787902082; x=1788506882; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9J1ICBW360kzG4R+GfbmmUEHU1CQT+6Rv08kza9YzRs=;
        b=N7IWsW0kDfhTc+CbCdA7ADcUDLM9p1MXSDiIHI7vsQyd/l4iLCL59oXO75fTpiysit
         EZI2ssLbaxJnu+EXf6lbYEHThASt+E+v+H0AFHWdDsDZqNNgXhAyCWr8wTMPbH0IqyEb
         xK+dD+Q2fQrwit+1OCfD2EYUIcLjTONI27eaNMxRBwnMgFhw+pgNzjhvBM2gE/RVaMrT
         d9ZO8sufSrzrfGfZGT4jmCIo5kmpoxlFCpoa+Ulq06POnH4em2VrVHHB9Nd1eKP5QzS7
         4s7lUZqrqIzbuccenQ3ErlHpVYf5sqjUiAUsEsrIRx0zg1Dor0iLgJfIxX0DqrHyXWcu
         WaxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787902082; x=1788506882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9J1ICBW360kzG4R+GfbmmUEHU1CQT+6Rv08kza9YzRs=;
        b=ao9JvFuoXIAoWyDnh8e5Y8qb+3vjiHkShvlGczGXaBhImA2X2DnAAC4b+DtzVzPguy
         f1im3cuw8LjtsqQva7eRGqgNpJzjMgb+UUj/Bn3e2PcBBGmN8yxR/mKC2ODOpwsYuFvy
         ZV70sAKTp47RNvaC8EAHp5v2zCcGjZjAkX8aTKHSXhUJ/uk0GRiJ5ljj0eIxiwzTcYL+
         sTiQR+vbaFfPtx1NtUlbfdxhgYjuwaJzqDukxChgc4ElEF1RK3DdgirEfO2QSaQ+3IT2
         4LrtKO+cyDmEB0nYaoTU799RYs9cgtPhwgvtSoBOOXVIvBKEjm8gOPIFngH0haQ/STjP
         Qdzg==
X-Gm-Message-State: AFuF++lgCzO8w5A7aufO6tI42nB4H3oMBqy9FIfku2gBhEXVs2AL6CiX
	hqjRrxw5QzPmQeUX9QHQJH9eidUFSJksm895jlQ+A4BDg3Czv6RZDIzPgYzsNQ==
X-Gm-Gg: AR+sD10uyoSgs8YbltN0VpS46Jz/BPKsXO1NZi4YNypP1xQI9nyztf31S4V9QXcb0f8
	fMbkd/sp0NzLkYKIkR5MOKKlQE9fNB1Rj+N6zPBz5jt7GLC/GoyqucGY/ZplexGqs4HWZBSPx58
	3cI0FZZNDZ45wi1mU19tzsw1xp9A7ZXhG928OCXEu7oDJS+c8434Hy1AbYYaEALzdT2S76cDQjp
	nmKMyKqxlqBAifaCsk6rQkHB3d2sBX7V07Ec9uXb+b86Z9/GujqPeykj8TdwkdCheqJByq1Rtbg
	piuZVfqCrt99dz141AqLOfwrh016peBbHmHGNZy8IOjpc/Ep8Re1Z7of40qBc5ey2zKxx77pmxD
	120wMfA4ZCgRe0GcbyIqbJPkE7AQW/Kzq9xpegUDc4oJpJAWHFpdnhBLp31ObYShKiKza98YW4E
	AA5HBDCi46FZ++C24Mf3fBUeXB28yxkHHtYK1NyLmAzEh8//kwQV0Z5+KzmbDkTQcFv2NTwarR
X-Received: by 2002:a17:90b:2d04:b0:390:8361:a532 with SMTP id 98e67ed59e1d1-396d0ebfb40mr11601046a91.7.1787902082329;
        Fri, 28 Aug 2026 00:28:02 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b1868086sm6043192a91.9.2026.08.28.00.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 00:28:01 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta][PATCH 1/2] vte: upgrade 0.84.0 -> 0.84.1
Date: Fri, 28 Aug 2026 19:27:52 +1200
Message-ID: <20260828072753.3287708-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 07:28:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244519

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-support/vte/{vte_0.84.0.bb => vte_0.84.1.bb} | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)
 rename meta/recipes-support/vte/{vte_0.84.0.bb => vte_0.84.1.bb} (90%)

diff --git a/meta/recipes-support/vte/vte_0.84.0.bb b/meta/recipes-support/vte/vte_0.84.1.bb
similarity index 90%
rename from meta/recipes-support/vte/vte_0.84.0.bb
rename to meta/recipes-support/vte/vte_0.84.1.bb
index 43aa280c56..543a4c6474 100644
--- a/meta/recipes-support/vte/vte_0.84.0.bb
+++ b/meta/recipes-support/vte/vte_0.84.1.bb
@@ -20,10 +20,7 @@ inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-intr
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
 "
 
-SRC_URI[archive.sha256sum] = "0414e31583836aeb7878da25f67c515f7e8879917ecc37c92e26b83e8d8fc3e3"
-# remove the below line when updating to vte 0.84.1 (or higher) as it includes
-# https://gitlab.gnome.org/GNOME/vte/-/commit/77fe661760d2afac1e4d5a4b7eba477cbed6b430
-EXTRA_OEMESON += "-Dsimdutf:base64=true"
+SRC_URI[archive.sha256sum] = "aca1caa8478aebcdbb1d67897fb3511eb7601debae6810e16a15b6fa25f31ac8"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 

