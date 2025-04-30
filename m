Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0C8AC369DC
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 12:57:40 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.16141.1746017496915783235
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Apr 2025 05:51:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=F0cZMuqV;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.51, mailfrom: dario.binacchi@amarulasolutions.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-abec8b750ebso1171452666b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 05:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1746017495; x=1746622295; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jtxGwjn6XeJQyEJWMtHbAmT5zb3aajFKvF/qxzms2SY=;
        b=F0cZMuqV1P0plJeqZdfheU/30jN8QT1ZKg+7zvMzH8rQr4T/lvqkhVU20YYOJxqegs
         tHUZlP6nuUansFkc5BR9nu73aAMRGxLr1dXgoQ1JrpszAPwF+2KbXerWZxo4b4KTDMvY
         60SCqz3GJfL9IkHSZFmVgQhejHKV1ZZWUezb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746017495; x=1746622295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jtxGwjn6XeJQyEJWMtHbAmT5zb3aajFKvF/qxzms2SY=;
        b=GX6j8NqK//3MfQNIem1kFrMOypKdjVlsLsHm5HFJqmZlpmu8enW9Z48cbgW8M+iNDY
         Vru0iia6oe2Ml93BOXNRJdHqhohpKF2KQVWHlbx7WD/IZDSFrqonLzs6z4E5SrHz6UmT
         6oSJBFPGAZahhnM9hecmx+8oydMdvNLk5yKVJudXWfH0yaFN71UUiYv93+vDNiKmb0l1
         ELosWImxh4VSHaeueOnE2nJmg7yz7/cx8g7WseZVdNVCUAvw+HIeL+rd2YO3JZVpR2wO
         8qOYWcc+KRhhXiKPcQHH8cxDYIrKF0Ol/dM6VkkbOIyaWFKZAzwfhsr8n4Iz/OMALCAl
         HZpg==
X-Gm-Message-State: AOJu0YzkucDFTiqaXsjxKvYwX5otTp9k5DSYJ41HBwK6HtA+sX/DSDf0
	bShKezUQ4B/664ZAYrX8k4jD4KwkI33BVCAdvaY1z+nB28+VOjC7WBhX182Pnd7gOco7oFWRKhY
	R
X-Gm-Gg: ASbGnctt0xfr02f+zmjMEXcAiLQVGSKR7MVtZcT0Jh9hasEskhCk8lozdoRw8zRT8ZB
	km52vjWfm1rwIkvjqOFjq6fEBnFsFVHaXCLyrjn51+AZTuKnb3N01jFesLGempAK4faKjWxgpcx
	qQjFCrtUk5m+zTmulCflv3NM0vWyVANyyRo+gA0Z+nber8H452BIOQaAwk9qRBv2mIo6sk9ZdGI
	pTT8YAtszQ97GcnKPJg7hYriXJTPd686Q2fJMHGwt3NbbLVb0IkgmfsCSD6/qgVwqKZQKd5wrf0
	upiE6oXfzdUvbaOqFywKLDM0aS9qOuzD8Yjq2sG+YruvISSaBVOQ1uehHtJZ3RUMSiyAB1Zcr8T
	p2W7x
X-Google-Smtp-Source: AGHT+IHkp0KrmQDqbJhmdFf3eEsbWVllaYZl3tOXXxS9I4DtMbQlp2WVerNfOB1p2rBwIZP/eiBmhw==
X-Received: by 2002:a17:906:fe48:b0:ac7:3918:50f3 with SMTP id a640c23a62f3a-acedc75818amr368089066b.58.1746017495057;
        Wed, 30 Apr 2025 05:51:35 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.66])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acec9e47497sm246500966b.160.2025.04.30.05.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 05:51:34 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [PATCH 1/1] mmc-utils: upgrade to latest revision
Date: Wed, 30 Apr 2025 14:51:31 +0200
Message-ID: <20250430125131.2797720-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 12:57:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215747

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index a5e9d53deb84..1f287a8df9ee 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "2aef4cd9a84ddc76349fc0d7e10d675e7fa596fa"
+SRCREV = "c515ea2e1cebfbf9d81aa6a5c1bf67a79d2a7e58"
 
 PV = "0.1+git"
 
-- 
2.43.0


