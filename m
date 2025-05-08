Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27BC1C3ABBE
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 20:16:47 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.5816.1746735401026193051
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 13:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jrfocNOG;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac345bd8e13so193803566b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 13:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746735399; x=1747340199; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oncgOOrrhMP3470qOGmQQbtBjqmEjsm+xI3C8tA9Fjo=;
        b=jrfocNOGrN75z0QKzCUdrnjIhX2z0Pm5+1pP9vzQq8RuLfWDl62wdtko8iXqoEyr2l
         u8xChIxRyYTXM8kf04mX6shFidedTBRPopyvaRVHfQq9+omwVXWJuSP7TrpIqctVQzzM
         N/HzDqrCAfbXftnoWwqTFV/B/HIbvpZB3t1LCqWJh9uxHCVeKoHx/pYh40wO37ywiTt9
         wIVxYS7ZdlCIh6noEWBOi4oNjVj9eKfBIVQcMprBh/eba29ImVB0gtxFMAZTHyt9eoB2
         0tmrfHs5r4dCijEGWMzDkMuBfhYiEBMeRVRepek7/TO9pdagWlTndpKQ82IpZTejG3LV
         NqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746735399; x=1747340199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oncgOOrrhMP3470qOGmQQbtBjqmEjsm+xI3C8tA9Fjo=;
        b=oqJhP9MDn8LuE4W9k50CF+P2vErFeJ7eDdNJCPyxXx+2DSgSi3Sek0+59T9gRHctRp
         X7/ll4VtG6yiB7ZvEEoLSF2MXc7dWCsYChIrG09On9QPV+GRZJJKR0FXi/fzLcSqSUjK
         Q80a5pdldQpTwz4cMgAlDx0qYx7ggEE9ZVPxYO2Rs8CA0WKc7FGEv0/RYRaXE6B1dA9q
         6/KzPGZQzHFP8kQ12HFk9li6UwLtNtgz5lRTlr4KTPFgRvJGkO/v7mIYmPQueWx1ODPP
         WT06XCH5MswpF6gTAL4qiuosQDVV9DTT2dhB4meAGJgUUjB7tlQuMcteHCn9FSi7mSbp
         4/mg==
X-Gm-Message-State: AOJu0YzLQsBrcYk40V2Waf93jkc1a34O+p34YsPRCaAFfn8jysGnf1jS
	U/ghbD2UTKlLsDgY3N3DyK1xM/VzSbvLb74zrdzFwVPYF++tyFMdlUffOA==
X-Gm-Gg: ASbGncunZH/7I2n5My+mcWbm7D5iVUuJ15zxjc73tb9WBbQMTEiJ1h8+a0hf3WV2C7h
	6DKgmAnqLOQD+N6xwNRGCdtyKWsEMFAfwEWS+LSKnHxEBefS4e0qKr0kNCcA4HKfjqnQSTiYIyc
	0bft6+Y3H62qtFwT35OHlVjFYOJNSDuAumSwNXZha90fGJ6aKG6xHEc/yEUWUlwjbCtUht3hkCS
	2wwPa2SvbHkty/rHbQKafrtBIujIVtJRE7SnpMCtJEiuNJ+sk5gBuW6FM0M6WyLZQY6VGf24/UL
	mzGdUTtoqSdT0ZEqU8V2pLuvM9lQChSBTCznl4Z6
X-Google-Smtp-Source: AGHT+IHGvOvd0Md1Z94je6oKtt6zn03AQWv2k7hjCpq+fP7x0TaAEPsL3gPl1I06ezo7F1kP0J0CZA==
X-Received: by 2002:a17:907:d30a:b0:aca:db46:8170 with SMTP id a640c23a62f3a-ad2192a1cd1mr91681766b.60.1746735399178;
        Thu, 08 May 2025 13:16:39 -0700 (PDT)
Received: from acert-swift3.. ([2a02:810d:625:1800:c942:8429:98e4:61e8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21933f4e6sm37610866b.54.2025.05.08.13.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 13:16:38 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [styhead][PATCH] scripts/install-buildtools: Update to 5.1.4
Date: Thu,  8 May 2025 22:16:30 +0200
Message-ID: <20250508201633.44249-3-an010@live.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250508201633.44249-1-an010@live.com>
References: <20250508201633.44249-1-an010@live.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 20:16:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216160

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 5.1.4 release of the 5.1 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 5e5c42ef31..aa67a03724 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.1.2'
-DEFAULT_INSTALLER_VERSION = '5.1.2'
+DEFAULT_RELEASE = 'yocto-5.1.4'
+DEFAULT_INSTALLER_VERSION = '5.1.4'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


