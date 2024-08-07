Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 223C1C52D71
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 15:43:50 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.36791.1723045420157779775
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 08:43:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=zrD/h+xd;
 spf=pass (domain: baylibre.com, ip: 209.85.167.172, mailfrom: tgamblin@baylibre.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3db145c8010so23859b6e.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 08:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723045419; x=1723650219; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4v2IhCVLAcghszzNV0p39+Wtg/KmiNxaTn8DV7sXOrM=;
        b=zrD/h+xdVJCzBX+M83lagcZ5eqNebDWFjp3aVYwB1aPwF/j7Kvi0e2yqStY2jFRQtm
         mTjjkqPMk8Y5/wXXovW1Zn42xczXkYNHIKgd3BX6/gi+3MGYD5IG+fxOPTtfNGyzJODk
         E3NWpd3hz0mKh+4zjCA0perzmbBpHJNynnmYnhRehq053zhA+1T9TdOjWdhBBb3Oi0B9
         IhSnCo3EdGuXniH+Ut8ayoNJaIrrlTJvNCm2n+5P2gKcJbhzArCsR0lb9eaRH0X3I9x+
         9QXRvqOZoI7SgU1iizVGQyh7AFIAEfSRv7SGMQn+yyQqYwW+Np0W8cQTXtWVC5sGOwwO
         CfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723045419; x=1723650219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4v2IhCVLAcghszzNV0p39+Wtg/KmiNxaTn8DV7sXOrM=;
        b=LIi/23AXTeSeEhc+KeZoDCTx6tVDzLaDME8Md+0PaHXxKc09ZSUMrzRW3MWs943/0B
         GvMAK/RLQyg59gSovgkNL0EQ3FiLX2DpNRMJx40yWgh+LqRyJLd68SJIAvmu2eel6CCB
         hnirwHKw/fvWchNpRwLy9/iKclfikK+7TKl3t+6p+UPkAs4++vF1Zi5Gde434Tt1ZsvS
         Fnni3/deirXEq5qDu31w4gxplTYxmf7ynO39pViQikduBXssDaGdhmPtQSQ8MX8AjPyd
         sEDDIkintF+i9tgaJA793cwKqfyQt0RpO4sBAa7W8c020zBAHsDbwF++WrRe4UPk0QdP
         Iwlw==
X-Gm-Message-State: AOJu0YyqmgdZM5dICRN2vGUTZ6PmVMqNrA09xozWWE/G9lM+6QIdwWG6
	FKK6pzUrYXxJLf83Bjo1m5kHiMdzdLJp9k8iQSXHLWVuS0wDELc//HIIPU9/36aj7pjBQ8xqlcA
	0
X-Google-Smtp-Source: AGHT+IG8+mAJ2EQzAEwZzRlOK6Fyh4E+F6dpz2koa4+vjZamqfGG6JM92Pfkd5CiYSPWD2QLu7mg1w==
X-Received: by 2002:a05:6808:13d1:b0:3db:3303:8377 with SMTP id 5614622812f47-3db5581341fmr22548432b6e.30.1723045419269;
        Wed, 07 Aug 2024 08:43:39 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-451c86ffe9asm5770661cf.3.2024.08.07.08.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 08:43:38 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [OE-core][PATCH 3/9] python3-pytest: upgrade 8.3.1 -> 8.3.2
Date: Wed,  7 Aug 2024 11:43:27 -0400
Message-Id: <20240807154333.533180-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240807154333.533180-1-tgamblin@baylibre.com>
References: <20240807154333.533180-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 15:43:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203082

Changelog (https://docs.pytest.org/en/stable/changelog.html#pytest-8-3-2-2024-07-24):

Bug fixes
- #12652: Resolve regression conda environments where no longer being automatically detected.
  - by @RonnyPfannschmidt

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/{python3-pytest_8.3.1.bb => python3-pytest_8.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_8.3.1.bb => python3-pytest_8.3.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-pytest_8.3.1.bb b/meta/recipes-devtools/python/python3-pytest_8.3.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-pytest_8.3.1.bb
rename to meta/recipes-devtools/python/python3-pytest_8.3.2.bb
index 145c01a5db..459d91f1be 100644
--- a/meta/recipes-devtools/python/python3-pytest_8.3.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest_8.3.2.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "7e8e5c5abd6e93cb1cc151f23e57adc31fcf8cfd2a3ff2da63e23f732de35db6"
+SRC_URI[sha256sum] = "c132345d12ce551242c87269de812483f5bcc87cdbb4722e48487ba194f9fdce"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.39.2


