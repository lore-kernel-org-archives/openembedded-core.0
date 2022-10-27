Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F58FA3747
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 20:16:39 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web12.2230.1666901792265795413
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 13:16:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ptXlR8Uy;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id q9so7990078ejd.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 13:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ibcFPL89OP9iRyOZjtiFT5KaTv1/BuHYHzZtkPh8cQ0=;
        b=ptXlR8UymDHtl7MUOzUAHR3wIZeX/EZYvmdMkp9Doa2MucYQdKS+50MOvOY6ukZ3hh
         cFXOb34rGUt7KCm8PY9UKBG5/Um/11mx8sBkHl7hmoYiFO836GCzq8M9C+Sbc45uJVZY
         8YLBSk6QtPYs1b2+Skz+NYK7ZmyjfOiDh9xtD3ZQvtdYuuhzrhqJJmu9YRe9Dx3OBxOV
         w6TvX3qPJe/aI1ZToWcuc9wTKWVdfYGaHq/2Wmpse68RifELwUy7XncCHwFmAYSR0+/U
         LuUSXLArccd3hDxKoDzIOwjChX91fnkFwl/oiLsbq6o8pO+ISYbhnT3jYjyds5tDXOqg
         Q1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ibcFPL89OP9iRyOZjtiFT5KaTv1/BuHYHzZtkPh8cQ0=;
        b=FcXRNf3EzV0Vqj3i4bnJVszXJ7PFtw2yC2DaAPqOJVJ5A1lE2NvKFFmlSy8WamT8gU
         Ra3upiPm8uyCsEAUZ9/2tQhzUZwioXoGhM7rs7Hyrhuh21asifJTk+u7p5HnnE5fGGfl
         aHG4oP6hbhFxYdPkOsxgzGHCzpor6EsVsSLaWe9uCcicFP/aJOHVjRbKyTu4/9BkJCA7
         dxV699NLyzCA7nC5h66/UiGNcNpswcX0zkcRohYvj80RFvia4NRkP/zePZH4Lcpk3W6x
         tcHVUVH2+n3klF1RbtNRP7R6St9kuVnWYA1oePGAXwCKLMmmoPIIprLhoNHQ6d/GxXZW
         GHRQ==
X-Gm-Message-State: ACrzQf1wdCigo0+ODLG1SPW7Nytz4kh9i3WYQvMfU+9Gem9SNYRL9YrE
	N9yO0vakJmgx+ONx7a0kK/A3kjtX6sVSOA==
X-Google-Smtp-Source: AMsMyM5fZf4Vg6bo/ENOXP8JLwy9ECsICTrktB9tfTqWbamQcDmAAhifTEO0vV6UG4BBO0NC4gNYEw==
X-Received: by 2002:a17:906:9b86:b0:73d:72cf:72af with SMTP id dd6-20020a1709069b8600b0073d72cf72afmr43700451ejc.440.1666901794811;
        Thu, 27 Oct 2022 13:16:34 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id la19-20020a170907781300b0077b2b0563f4sm1267225ejc.173.2022.10.27.13.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 13:16:34 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/23] python3-jsonschema: upgrade 4.9.1 -> 4.16.0
Date: Thu, 27 Oct 2022 22:16:05 +0200
Message-Id: <20221027201611.3644334-17-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221027201611.3644334-1-alex@linutronix.de>
References: <20221027201611.3644334-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 20:16:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172220

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...thon3-jsonschema_4.9.1.bb => python3-jsonschema_4.16.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-jsonschema_4.9.1.bb => python3-jsonschema_4.16.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.9.1.bb b/meta/recipes-devtools/python/python3-jsonschema_4.16.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-jsonschema_4.9.1.bb
rename to meta/recipes-devtools/python/python3-jsonschema_4.16.0.bb
index 125bc6b4d5..5704f55a15 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.9.1.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.16.0.bb
@@ -4,14 +4,14 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
 
-SRC_URI[sha256sum] = "408c4c8ed0dede3b268f7a441784f74206380b04f93eb2d537c7befb3df3099f"
+SRC_URI[sha256sum] = "165059f076eff6971bae5b742fc029a7b4ef3f9bcf04c14e4776a7605de14b23"
 
 inherit pypi python_hatchling
 
 PACKAGES =+ "${PN}-tests"
 FILES:${PN}-tests = "${libdir}/${PYTHON_DIR}/site-packages/jsonschema/tests"
 
-DEPENDS += "${PYTHON_PN}-hatch-vcs-native"
+DEPENDS += "${PYTHON_PN}-hatch-fancy-pypi-readme-native ${PYTHON_PN}-hatch-vcs-native "
 
 PACKAGECONFIG ??= "format"
 PACKAGECONFIG[format] = ",,,\
-- 
2.30.2


