Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58622C433FE
	for <webhook@archiver.kernel.org>; Sat, 27 Nov 2021 09:54:19 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.34590.1638006858015894448
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Nov 2021 01:54:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NSvjR046;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id v11so24010063wrw.10
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Nov 2021 01:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2/BQi2OPaS8Oj+g3yIorPRAJQuKpM5Q5nvHPZ8Kn1Mk=;
        b=NSvjR046uALNxQYvyqw0mzgwlcIbmQ88H5XA6VBV0Lsgh9XZbbhya3YKuzk9soqHrP
         wtinF+p4YEs4eGyKpbkd0RNhgVZuJHwUhL05AZaHLrKgWer/ByC3EYISsamo7AhgLsvY
         kF92L4HuAB65YTafPDMeixW/gpVgO1yHKNwOBYY0UZzgkdgNY33WSgFJrGFrrGbrD7Yv
         sJlV4HVZzkb6x1YnbQKUWezHpdTPa3imukqkZQWCQpl+WCVUfZKiH1695K6tGPq8kPmi
         EHwKBhlw6XQaE/T6igVnEGq353NVrfATku05XSPYOTFzUXukQ0gDlNTCCgFTY1N9W45G
         7Q0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2/BQi2OPaS8Oj+g3yIorPRAJQuKpM5Q5nvHPZ8Kn1Mk=;
        b=GWGpXiBOLKHh3XOAkqSdHULeGaCcmyIDzylzyCx9V+NYOv7LgEwi5e78VOgvw4COVG
         CkiKHdJZVnN1KZJIlozLGDEwO3KSx2rhso6HWb8kNtyxexiue3Tpg5+rkjYYNcr269Kq
         ApuCOF6ccDLIc9lRrItfmyhE5qn632hqkHV/m2HLTT3FIcqBk6JHVwM/QzSLTzUAkrSR
         HJwi0Ktn4P5SqDIbj+XQARBbZ4RP1a4Jf0fW/pZP+VSPVqoBbV7qa7dnfXC5uVzORt/1
         u5LziBqJXAzT+sxZCC41HEpZOQBZj/Xw9+Wt7qzj0AVC36YytliGw50SxVHNegEgEpfk
         YyCA==
X-Gm-Message-State: AOAM5304PXx2C1S3JSl9TFTLpt8ZWatture+bq36no2Nnj2j5aIER2Sl
	eq2FwfpeezgqFxV6lQR2uhIeZTOei5K17g==
X-Google-Smtp-Source: 
 ABdhPJxQsS5DdM4i1ROtIw7JwyV5O3b2CqWD5zVljUxPGmlYzDUXarMZjt71wKCTNDnEitjFAFKdOg==
X-Received: by 2002:a5d:6449:: with SMTP id d9mr19646835wrw.332.1638006856643;
        Sat, 27 Nov 2021 01:54:16 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 w4sm8484302wrs.88.2021.11.27.01.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 01:54:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/13] python3-rfc3339/3986-validator: correct upstream
 version check
Date: Sat, 27 Nov 2021 10:53:57 +0100
Message-Id: <20211127095357.1748429-13-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211127095357.1748429-1-alex@linutronix.de>
References: <20211127095357.1748429-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Nov 2021 09:54:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158862

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb | 1 +
 meta/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb b/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb
index 7f1bbaf97d..9bc5fed921 100644
--- a/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb
+++ b/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb
@@ -8,6 +8,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/python-rfc3339-validator:"
 SRC_URI[sha256sum] = "138a2abdf93304ad60530167e51d2dfb9549521a836871b88d7f4695d0022f6b"
 
 PYPI_PACKAGE = "rfc3339_validator"
+UPSTREAM_CHECK_REGEX = "/rfc3339-validator/(?P<pver>(\d+[\.\-_]*)+)/"
 
 inherit pypi setuptools3
 
diff --git a/meta/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb b/meta/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb
index 68b3db1f48..4abd181acf 100644
--- a/meta/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb
+++ b/meta/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb
@@ -9,6 +9,7 @@ SRC_URI[md5sum] = "47f7657b790aaf6011a1ab3d86c6be95"
 SRC_URI[sha256sum] = "3d44bde7921b3b9ec3ae4e3adca370438eccebc676456449b145d533b240d055"
 
 PYPI_PACKAGE = "rfc3986_validator"
+UPSTREAM_CHECK_REGEX = "/rfc3986-validator/(?P<pver>(\d+[\.\-_]*)+)/"
 
 inherit pypi setuptools3
 
-- 
2.20.1


