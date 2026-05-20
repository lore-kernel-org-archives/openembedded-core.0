Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F70CCD4F3C
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:21:01 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7276.1779265260219818151
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:21:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JUSTJ05w;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-441209fb77eso2776916f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 01:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779265258; x=1779870058; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UdDcbjtZW60Wr2ec3qnImoJ8Tf6fQAzlWlAChPrpwPE=;
        b=JUSTJ05wG1GZSMCSM09cgjyVL5cmQo6Kr1feRMJ0pTMw7tiIkzXRFNB70bhUsvaKFE
         E2Liky1ammhYTpLiEugUm44j1xq6aCfmBnTLG/BWSoKieFSTtWr1z3XuWfbBkNJRAirQ
         HZdD/n0I59HyNEyj28bcRpXb2Z925cM2b+Vw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265258; x=1779870058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UdDcbjtZW60Wr2ec3qnImoJ8Tf6fQAzlWlAChPrpwPE=;
        b=nKmyn3rKTfvgt8F7WQ1OoYAMxAi4sVumjk+j3JrjDS0UOniRO0SDF0KmhSMfafLpVv
         yzqiuuXthIm00z8bU2aOhx9uDHHZ3BezelqhHw+1SC3rbqhDPDlhvCMrL2RmsOWLCR0V
         b1zSSRaZWPABsS1KZdvpNYOfpLdV98hLn2UGERtw582ib0wFKN4tESmOKAywmFm9keM4
         u9nBAI/Pkwoaq+2C5mHxPmbGWv8ThXEL+hpkqr4PB3CQycDmBkzWVS6ShNdAQ6T1YGuF
         Ay/BMerSmje8MASDDC00XK64deWuipvEWm2CxnCMOs41tKfhLa5XELOhEFj0YmWNat1n
         PwlQ==
X-Gm-Message-State: AOJu0YwEsyaxD8kXIdgabAQSwPtQwAkEUqj4M3CLZZCxuxfCxeiGFTkH
	oug0sjHlXMnw/l8qZqGd//EVtXCtkhpdUTtf9+TDiBY51V/y2Pvk4PJKha/dmKI0OOtgPoiOb8q
	mrCH/
X-Gm-Gg: Acq92OHRd0im7X97fpPj1TufveEy6/D13Y0IrWHB8idDW7P7h/JNvFbKdfRPWasia1n
	pGRh31lTbcdqrJQ0GOBlsOFyQAxenCVolS+rJlQL79EV8amfscTJeoHGYwj1uKSZUR82zx3QzmJ
	cwxjm6RVJaq9+T1eoCFNP9QHRUk3X7hKdulIzLedqWDy92NPn+rCYqJmFwwD21A8Fxtku5EtAke
	6UpFgqH4M+eswlcSo3pxfsC5RkYzlvQBpFw7pg1gW5C/xfDl/K9JTDMeZb1/Gj6ypmVTukeNbPM
	kCInplv1aOxw88szxXKlVzoJYu8X/ggcWJwb6Am5gg3s9ifK4/W9Kpm9DWXIQy6hkOMr51LzedY
	w+GX+Kp3LcjGbONzUUULiZ08IsTjn1SA7O95uvV0PW/vok9i3nxWJlKk2ddy+WDNd0iEUUymPel
	YfJbrDb/pHpMxJgcyzVcSmyxJz6dGywSaFqCEMtNJfXgTdRXR0hY3LAG5OOloczEwd0fGaY+91r
	1QUpMZ1S+BMomh7BoVpCynwYuUh
X-Received: by 2002:a05:6000:1624:b0:45e:89e9:348b with SMTP id ffacd0b85a97d-45e89e9354cmr7027874f8f.7.1779265258316;
        Wed, 20 May 2026 01:20:58 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-250c-63aa-0256-2b9f-d16e-d784.rev.sfr.net. [2a02:8440:250c:63aa:256:2b9f:d16e:d784])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm56350642f8f.10.2026.05.20.01.20.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:20:57 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose v2 05/28] python3-sbom-cve-check: Update to version 1.3.1
Date: Wed, 20 May 2026 10:20:06 +0200
Message-ID: <f8968cff873aadfda38707eb0b72163df3829735.1779264709.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779264709.git.yoann.congal@smile.fr>
References: <cover.1779264709.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:21:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237404

From: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>

For details on this new release which fixes various bugs, see:
https://github.com/bootlin/sbom-cve-check/releases/tag/v1.3.1

Also, update the LICENSE, which is now GPL-2.0-or-later instead of
GPL-2.0-only, to be compatible with the licence dependencies.

(cherry picked from commit f8bdcebd01a16adb4e5d5a89c6b47c5f0af1f5a4)
Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...bom-cve-check_1.3.0.bb => python3-sbom-cve-check_1.3.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/sbom-cve-check/{python3-sbom-cve-check_1.3.0.bb => python3-sbom-cve-check_1.3.1.bb} (76%)

diff --git a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.0.bb b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.1.bb
similarity index 76%
rename from meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.0.bb
rename to meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.1.bb
index 96fc167ecbc..8120848a667 100644
--- a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.0.bb
+++ b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.1.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Lightweight SBOM CVE analysis tool"
 HOMEPAGE = "https://github.com/bootlin/sbom-cve-check"
 SECTION = "devel/python"
-LICENSE = "GPL-2.0-only"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=570a9b3749dd0463a1778803b12a6dce"
 
 PYPI_PACKAGE = "sbom_cve_check"
-SRC_URI[sha256sum] = "dad6f9df848f6dd7b69922baef0ec187b66ad0847fe0cf62614529e27203e842"
+SRC_URI[sha256sum] = "675828b2f02f11620b7a229853a24d09264bf41161be5fbb80a92456f46a14e0"
 
 inherit pypi python_hatchling
 

