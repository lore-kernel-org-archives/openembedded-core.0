Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A79ACA0ED1
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 16:45:16 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.16482.1755276310733891678
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 09:45:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=09ExoREC;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-323266d38c2so2375258a91.0
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 09:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755276310; x=1755881110; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5jNIHf942f8syEVqFgE+wihtbUva//B2gtndOaLltk=;
        b=09ExoRECL9CqmafqusH25aPNxdNYSTFf6AkEMi/tTQnbUue2E2Uz5Vm1rhxRW/rVRC
         m5padNvSlJTuzAtocblYIMBtHuegf2pu4+2RqyIV7611XnQ8CBuYs2fzMR/iJTKyP68Y
         YpgSSQTukzTah9rpyR6bJxBaFgktH3W6hXzktdhD9qTLcql2B/3l1amJIDEht9GhYPUN
         +3f/nUswEqQfOfduaoh40o42tP1m3KOIvAdM5TxM2K0fosMASkV3CmEWntC/KAokFp7L
         ++WOvg4zdF1cyRhvGH8HuXQNr2cv7S58axn+EqPBU49Vg3mJ1p7/CdZRDXXN+bexOj3h
         5YcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755276310; x=1755881110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5jNIHf942f8syEVqFgE+wihtbUva//B2gtndOaLltk=;
        b=s9bxNEy18J8p4EZC/ZrbRffeZAwHIyz7qALcsQMVaGorUn7sdnm//qhkQ1A7FQhBXf
         u/FYPQG41pxJfs3VeVowPIpZoIw9NinIqJUPp93VqFS8ymGi+OsRT/AgmEvqvlsGkVjP
         1s+dTArdUUNECG5n2sBMfdeoL1ixirlMWEGkS99746vRPcNpOTREl904AD4vcthMGqjl
         RPax6r0m8XQRRx3t5IIhYceRqZI79Y2nkcePqNtWjYz3AvfU3DJRzcQeJanOiDHt7jsm
         M1cnAMwHziLEEbkiOZznuyR35oWgC6VBuSP81VjL2rGrN4lCiFBZjXWyac2YpQPAnr8e
         yeQA==
X-Gm-Message-State: AOJu0YwIkcjDUNcsq4ybTb4qHUsMA6Q8xGbT+dB38dTw2KAibsfprFMi
	F7gZYq1eRx3QxvzdDiFHqtW3dteGAk6ShM65hn0c8k+6C/U4mnboYHI2zbWaGcDawKTZGmCF5iE
	KC0iY
X-Gm-Gg: ASbGncspsNeL29XVsy3dv2ZJnSBrCBgcrs5oCs/rhyOBfMrnjudKE1HODz+MlofAaA3
	9yHt3xn+RC34oPPv0Msi+31niUuGhe9GviPy3GlqfjBnQhNyQDRi05RUF0v8pJMUhPHfpz4LCeF
	F3PirgAXhom8dUXkAJJRn11utrm9989WclxueqUmpA+6Q5ORnktrTEb9f2C3XrBgMl+24TABwXV
	jXPmYY+Ew6JKah/NEl5AF9B9uPT5aweP6SEuEHaAkZDdkuMbu/dK72iWUcxPkkTG8hXmM13j7YZ
	zo6tP67+VtA38xDl9oGPFjoTFTT04Yiz5ISfTLaCPSVagZxZc+76TiwCaLCpCh/hQEo+VqCE3MN
	1jyTPNNrzNhV8DuMD3TxcucbP
X-Google-Smtp-Source: AGHT+IFlGtfrHRqvcHeStydByaGgOedxB7MxvcVbvPuNf1PG3tC5FELPUTX7cbbPdxaCb9/xIgL57w==
X-Received: by 2002:a17:90b:268c:b0:321:87fa:e1e4 with SMTP id 98e67ed59e1d1-32341df8cfbmr4266602a91.6.1755276309884;
        Fri, 15 Aug 2025 09:45:09 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3ec5:7840:3390:1caa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c9ab2asm1554476a91.30.2025.08.15.09.45.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 09:45:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 3/9] go: ignore CVE-2025-0913
Date: Fri, 15 Aug 2025 09:44:54 -0700
Message-ID: <ec1c6ab989b298773e8df8a6a4532f88b93617ff.1755276097.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755276097.git.steve@sakoman.com>
References: <cover.1755276097.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 16:45:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221983

From: Peter Marko <peter.marko@siemens.com>

This is problem on Windows platform only.

Per NVD report [1], CPE has "and" clause
Running on/with
 cpe:2.3:o:microsoft:windows:-:*:*:*:*:*:*:*

Also linked patch [2] changes Windows files only (and tests).

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-0913
[2] https://go-review.googlesource.com/c/go/+/672396

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index af09cb52cd..ea57b23c3e 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -19,3 +19,5 @@ SRC_URI += "\
     file://CVE-2025-4673.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
+
+CVE_STATUS[CVE-2025-0913] = "not-applicable-platform: Issue only applies on Windows"
-- 
2.43.0


