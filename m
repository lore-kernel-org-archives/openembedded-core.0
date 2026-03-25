Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C9B0103A9B3
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 11:31:39 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20275.1774438293484425929
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 04:31:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EdZ9ygvG;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48702d51cd0so50692765e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 04:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774438292; x=1775043092; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nAM9S/touDd+wCEPfE3dWPnaiAFMP259XMzuh8cbNh8=;
        b=EdZ9ygvGqjIqQaYyJ+i/MPH56x/hhDeACDr6pQt62aNycAQVNy3vqLIFuFOxnoCcAI
         A5HC2SkKsYuJmhJEJaOTxzLmP9wnzsXpX0nxQP/PD3P4k08TyUhRcLGgX4SGQXgTUlQj
         WK9llb6hes57Kc3LY0ZX+C2BoTeNAtTvVOYP1z3Fj5fXl30azWHHXaVi2AsI0PD9C8EB
         e9Xt1yz1YQB7u6RPIAHKO8DYlydf/DY/vGfrbHxT4uMHou13UNbYremkZ8Xa/farq+Qa
         YPHWLgOoxFfHpY31y01YOqhozH4/YOSvxzaLvTHFz6DPrCHDkqzXb/tzIJjXW0xe9HfP
         YDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438292; x=1775043092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nAM9S/touDd+wCEPfE3dWPnaiAFMP259XMzuh8cbNh8=;
        b=Ppn5uFph5LhbucclNjbGN24mIGEZKAWxRrBbC/nsH+9w8FT9qc8jVjPB3HM1CA8mpE
         0xx8HQYoITgbgJIVFv7KCXjSBiFEIAkaaqxN2PShSITXiGSyk3Q1s1EP8hLWxFmwrri1
         JYiaiH94K74pxrYMKXQYUSsObJX+yOU5PZ1e9w1nw1hcFdG5bDra7yZohQIVTcnt/eQK
         mLtoS+ZrEQyXfjLozZ7RpNZHxlFmiD4I3EvMl1/qe4EJS7Vk2NVKH/RBgPa+kQEdqDTT
         mbBLZ2P4kLxTMka1TUhu6HjYP2GwNVgTzU5X6GfxlKn+Uq9FrnqSYT1LMSKEaverXIO0
         rZBw==
X-Gm-Message-State: AOJu0YybKfBTCyP5xs5Px2r6wYVgrGWT2mKy7g92QinKKG/S5oqRhewo
	8AkUVvUZMb7dl32F1eeGf/QvPxgJZHe8oOWrvNEMj5KCIpa2SlgVV0MqwyWORQ==
X-Gm-Gg: ATEYQzzp2BxoXQbOO83OtCo9LYisYKAVyU2WrpVfH7dREMqKfB/xCHfo1ZXngWd53WE
	jouChst01MZ53A/q4bMRQnxqgC93TjcLaIUf6a5Aref88JhP36VeP7BB1cgY4ySWKNgIry3BTxo
	WK7+KXEWKC8dLMtZSMU4PDZMBcjVbmS83fFWYsWpYGRofHrFMi+3bJRl/RtvKMMZ7j5n7xH2vVU
	08KQFygFcHk3xPvQu/JS9ktyXNM/54OPTVaWg6e9FvShGopUTAB5cq79XG1p5tCKGTQVhhBpaen
	h6NOLRkVcjPMcxwXXWhqxeDi070vl8F0mUWZ47P/Twfe1Z9fvyii550HBLt8c0etTvZ2z4uIh7g
	n66rJUTIEGDd4gWA0HDS7cgslnCI38AQ2WQE4yGfbg9fbCK8EyjgR3arpXrcQy/qnCq8ph+KhTa
	8FGWZoXM26aE7HJNuAwvEKYZ7/
X-Received: by 2002:a05:600c:1e2a:b0:485:3423:727d with SMTP id 5b1f17b1804b1-4871606deb5mr49215655e9.26.1774438291335;
        Wed, 25 Mar 2026 04:31:31 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711693a08sm170539955e9.2.2026.03.25.04.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:31:30 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [RFC][PATCH 03/14] python3native.bbclass: Fix settings
Date: Wed, 25 Mar 2026 12:24:13 +0100
Message-ID: <20260325113112.1163632-4-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325113112.1163632-1-zboszor@gmail.com>
References: <20260325113112.1163632-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 11:31:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233877

With PYTHON_DIR now containing PYTHON_ABI, don't use the latter.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/classes-recipe/python3native.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/python3native.bbclass b/meta/classes-recipe/python3native.bbclass
index da1283d6b3..755a6c156c 100644
--- a/meta/classes-recipe/python3native.bbclass
+++ b/meta/classes-recipe/python3native.bbclass
@@ -20,8 +20,8 @@ export STAGING_LIBDIR
 # find_package(PythonLibs REQUIRED)
 # which ends up using libs/includes from build host
 # Therefore pre-empt that effort
-export PYTHON_LIBRARY = "${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so"
-export PYTHON_INCLUDE_DIR = "${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
+export PYTHON_LIBRARY = "${STAGING_LIBDIR}/lib${PYTHON_DIR}.so"
+export PYTHON_INCLUDE_DIR = "${STAGING_INCDIR}/${PYTHON_DIR}"
 
 # suppress host user's site-packages dirs.
 export PYTHONNOUSERSITE = "1"
-- 
2.53.0


