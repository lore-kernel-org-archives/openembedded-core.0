Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B3BC41513
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 09:26:25 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.5216.1718097978931872460
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 02:26:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bKdSe80D;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-57c5c51cb89so1046780a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 02:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718097977; x=1718702777; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LkcYvP7RhfO92yKvaDZE+mR/dyscgqJwuwVwE4iC/7Y=;
        b=bKdSe80DCnKq4prZQ6HNORmakaExww/v8qxOf10rSVAoJw6hU34GTw3+/y4JpEuaYv
         h11+g71tBj2Hqi/I4NOjZD1eHvZTuRUBZKGM7VZSkG4efKHb82Fme0iEgdqLDfFLeRBS
         kEbIVIQQVTjbddWbbb8QJugGNrywU9XYY/3bvrZoCUuJ8HfOt8bqc4smc3WYHAiN8wSI
         30KC5G2LgwW0ufmuiHN0UYOWtjJZQwC0z5qtkg+BLodMqZlkTSE1cjf58oL6+woM0R8p
         gTWpvInOid7C8aatH0R+IrPVKd/Faj42jgORjF5PnT/UagVNYVq22ccqRvOZsTayoGe+
         ePSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718097977; x=1718702777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LkcYvP7RhfO92yKvaDZE+mR/dyscgqJwuwVwE4iC/7Y=;
        b=lo88dGELZ2YmvWMoachdyJ5AN0c9xLKabltQNh9xWIw0iJTuFhH2dU6WJ/K8Vx9T3K
         KKTsCJcJ3IPDgWHuJHpHR5FM8lBURw9vzrHQDebAposHYp6SNEFkpjmoYHknBUhKmPjG
         xRWudli9OqSfBki1Yp3KhxtkMZMeuTCCYxp+3KwTUDkjjjT+9k5DO1+MVfkIv6l/09a5
         S5Kt/8yozc32lYZK+phHj/LI+K5A+qxb+vSXXDCuzFSDngcimd82fr4eVjmc/vJF/V7Q
         oDkNRnTvfzzIXZ60lrfA0XI6qLQN0MPwM0reAdsAf8RwpU5semrrAOX9qYK+ndrf+b8N
         a44w==
X-Gm-Message-State: AOJu0Yxlhr8SE8FLW6UzZeiiyGatmIlNYC34HX1PmkG4+MNAnLCP8d8E
	PfBeV/z6+FTz6P2TAguoXZcvP0LshbIskeZ9ALlIDBclSZlhiRxQjhVpcS1i
X-Google-Smtp-Source: AGHT+IEM1RA8lCZYLP8ZWq+ZD+9fXv9T1lMwf8H4518Y2QMhWA6U9s0zE6LWtDQvBoQ6YGSeCbYwAQ==
X-Received: by 2002:a17:906:b096:b0:a6f:185b:6406 with SMTP id a640c23a62f3a-a6f185b6507mr448400566b.69.1718097976972;
        Tue, 11 Jun 2024 02:26:16 -0700 (PDT)
Received: from an.. ([2a02:810d:640:170::d5f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6e23c9f22asm570173966b.171.2024.06.11.02.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 02:26:16 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [PATCH 3/3] install-buildtools: update base-url, release and installer version
Date: Tue, 11 Jun 2024 11:25:58 +0200
Message-Id: <20240611092558.513238-4-an010@live.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240611092558.513238-1-an010@live.com>
References: <20240611092558.513238-1-an010@live.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 09:26:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200500

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update the following default values:
- DEFAULT_BASE_URL (https instead of http)
- DEFAULT_RELEASE (5.0.1)
- DEFAULT_INSTALLER_VERSION (5.0.1)

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 4f85fe87d4..5b86c13077 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -56,9 +56,9 @@ PROGNAME = 'install-buildtools'
 logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
-DEFAULT_BASE_URL = 'http://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-4.1'
-DEFAULT_INSTALLER_VERSION = '4.1'
+DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
+DEFAULT_RELEASE = 'yocto-5.0.1'
+DEFAULT_INSTALLER_VERSION = '5.0.1'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


