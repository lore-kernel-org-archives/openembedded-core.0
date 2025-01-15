Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F88C02187
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 08:03:37 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.16197.1736928216614525371
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 00:03:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W6PhmGKi;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa67ac42819so916127866b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 00:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736928215; x=1737533015; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F0jF46tPTKPuabEG0SXnVCqIfXzFlgzlIPup+8k5pvw=;
        b=W6PhmGKiM581/QJENieQaAh4QZQWhth12Zkwqh6KfbEibrrNmVoNBmp5aUeH7DOmot
         iEp3T39a6sjYuikdLj+YHXuzAfVReszlu6/lStxyri+szMiV/XvOxX4FG+iq43BEN+YH
         jy5kchdiBLIjTqK4952uj0hrfu1qePjtgdHM7YYwAHgQMy63pyRonsxFj9oDdaTpaqWp
         pTHZiqusEUXwK57c5ZfCFc5serrUPRfZJXbMvaPsinATc+zwZ8nzWtcRoFOWEDPlNyvA
         x31B08kTe5nAU5oJZ/qfb0cVLC7OpBceemMS8YE9gY98XN50qH4h+ERgs1FyDUu/oxVJ
         TIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736928215; x=1737533015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F0jF46tPTKPuabEG0SXnVCqIfXzFlgzlIPup+8k5pvw=;
        b=nTjLlZHMSpNxMdQKaDsqggUC8TGh/GnaWu0HOzhjbSkNcmUDxjhXCsKtCUOoEqMMBX
         jEsGlnKFwEjmJU4CBKf4nn/4fwNHxVkwqtmvGIkWay62eHIvTwDQufrMg8o9uPkFYGK7
         OBGJ9k0FialcoGeVJHRCR3CQlt/V7j9zIPefL7+Q2/Qdtr95JcJ3kdzabTJ3hsGrBch+
         xjrWyqz1xtxvAvv2IYj5wQ7BdGez2aWgcZLdDtCzkQ4054/3P81cYZ0sUt4jZ9/1xGm+
         kpmHyu8pxUvAuGakz6Mhp4YFZLpMqBbXFyC7NRLBMsd0Tunr3BIHoZkcMH5tgSYuOEs6
         6mPQ==
X-Gm-Message-State: AOJu0YyY5xQpcHYIOjFtP9tAgBsm5qiOMnHLrtO0g48fLuGyUrC7EusM
	Gps21C4ongSpkqFS/DAIfV9U7ktJ0R+SbjvPJBKvcf2GrQcj93+1klYKCIm4
X-Gm-Gg: ASbGncuJG0ynbEEsv3g4dtwQ0yGsilLPhJqelDKr/2vgd9xb3WNHvmJMWcoSnB/5+sr
	lk/IyXXVHH+V5RvzIHsMIJBJ8TNoLAM2r6OvyB8UNG7LY5B7eyfPZnSV7Rm+PL8cA+8r+0ptanW
	nDQUxrA+ROSq05PzupengEkCwSTSuMj4VYvUfrzqJv0+kzSMh/U6yuwzj1aEw2gZE9C2YgraHBT
	w3xb+cuA3F3lEu8GP5w/+Su3zA+Dnlh0m6vF4abBCl/y6LY/SmiFl+x
X-Google-Smtp-Source: AGHT+IGotC59qQavRCz8+fbNyZK/iEHUDzuReOBawyuS2+98YxXlT8qmaATr4Ds0jFeibxnDirNfeA==
X-Received: by 2002:a17:907:7d94:b0:aab:8a9d:6d81 with SMTP id a640c23a62f3a-ab2abc6e270mr2312177666b.44.1736928214633;
        Wed, 15 Jan 2025 00:03:34 -0800 (PST)
Received: from acert-swift3.. ([2a02:810d:600:25f4:3104:fc19:7058:edf4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95b0ab6sm719595666b.155.2025.01.15.00.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 00:03:34 -0800 (PST)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [scarthgap][PATCH] scripts/install-buildtools: Update to 5.0.6
Date: Wed, 15 Jan 2025 09:03:29 +0100
Message-ID: <20250115080330.28137-2-an010@live.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250115080330.28137-1-an010@live.com>
References: <20250115080330.28137-1-an010@live.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 08:03:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209819

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 5.0.6 release of the 5.0 series for buildtools.

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index ee6bfb89eb..972671d50f 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.0.5'
-DEFAULT_INSTALLER_VERSION = '5.0.5'
+DEFAULT_RELEASE = 'yocto-5.0.6'
+DEFAULT_INSTALLER_VERSION = '5.0.6'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


