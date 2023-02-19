Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EAE5C64ED9
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:30 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.3841.1676835070862692901
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dKiHUPnM;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id c3so884099wrb.6
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgDFrHmvmjIVxK8IZlCX/COgg8eQzPn2INGxH6LiZXw=;
        b=dKiHUPnMxw0A8ceSfz61ah3e6T4HgdQvLECpiy+RaAJigWNfUlHrHoR4RcpkZKVdjP
         dmRBP5hBzJp7uyLC/PPOzQM518mBYMfS9CTXNaHac1kJyooH2RpPEtVoQr0OF8l8pLtF
         kBbsBcP3E2AU2VRQO57Uw7KtbU2TKtPVGMFF3GO3dvT5JyR/i4zdoLDy29YePAndHLbf
         oIdMjFgRnr3UlBrjhAxn12sxNpfpT5mGFDfloW4RkaftwZ7C7X71ubamAutQ5vyiu7VB
         PNXhKxTVZPSiBHh/iIYBc+UprnzUqtRUZqSPZ6FpKMJjJmnqvtVCVPAme3jrO9bnnvNj
         iGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NgDFrHmvmjIVxK8IZlCX/COgg8eQzPn2INGxH6LiZXw=;
        b=iFcdg8KUDmkZ5+ojl7UFcUh7t6fwJ9ClVaWf1WGiJsVPVv8adH6BiK8YP6Xn8qggUy
         vppGTBp7NXSJMNRbLIYH0FY41fNpLG1U4oaGurQxgVqAHe3dbKSF9ta7NrTaeVbAf3H8
         Irqk4V94dj8uT+V/aB7HHCMFAEH+tdBS4CeF3NLmQQIspNcAJGukuzSD4PrtRGcDt3Tt
         j+o+MT6iEm01RyDa6aHcD8HbW2IppYaEEOE5nuUzXwyKUvrXNdXQKUzPTReaRurPH90J
         fFLibJoEaeVuv6lqhTnBv0oi8QeYo9NTRQNBHC+Voh76x2wTeh+rfF1Ss3FRkGKAH2Jn
         U5jg==
X-Gm-Message-State: AO0yUKUsuOESmXTe1jvUkm4NKNq0TKUJqh7LeuqV+ck032W6kAtlT1cf
	TXLDR3v+wm3bk2xhNNUzD3VjEr57bsE=
X-Google-Smtp-Source: AK7set+6s+v/sx3mrIzGF0oKiUJ5gWwmRkMqYtDie7EgqDbP4nn9SyBG6Yn4OsbJdruQ0WuzHIbpMA==
X-Received: by 2002:adf:e98b:0:b0:2c5:eaab:ab3 with SMTP id h11-20020adfe98b000000b002c5eaab0ab3mr802689wrm.18.1676835086834;
        Sun, 19 Feb 2023 11:31:26 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:26 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 33/39] diffoscope: upgrade 234 -> 235
Date: Sun, 19 Feb 2023 20:30:55 +0100
Message-Id: <20230219193101.338397-33-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177376

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../diffoscope/{diffoscope_234.bb => diffoscope_235.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_234.bb => diffoscope_235.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_234.bb b/meta/recipes-support/diffoscope/diffoscope_235.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_234.bb
rename to meta/recipes-support/diffoscope/diffoscope_235.bb
index 994d3e9422..e4cc2a95b8 100644
--- a/meta/recipes-support/diffoscope/diffoscope_234.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_235.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "6091d555bc88ceca285dc40e63df56b57385aa0dc552daa70bde81e8a69f8c7a"
+SRC_URI[sha256sum] = "3279f6637f1e9f757ca9b8c2870ed79ceead5971e5a15d952a0579b2b45720a2"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.30.2


