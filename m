Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C53FC7EE32
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 23:14:06 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.2790.1750806843401713571
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 16:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=OX8RbQyd;
 spf=pass (domain: konsulko.com, ip: 209.85.210.171, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7481600130eso7057291b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 16:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1750806842; x=1751411642; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LFPxiJb24mVekjpMmYKwKTEiYg/4LBkJQVgyd7ZNfe4=;
        b=OX8RbQydx6CV8kV+zBZuyLsdF628+iE5niwKCgjISKRaet35WJB/SM/upIvoxOtl3o
         p+lIU5xnutieY/Q6ofktxEAlqiwGmAU1zE2xWwggB3ouE9HswCO85XWI6vmoNRiG4EJo
         VyJqja0EZdyZIEyrOFVUiKAWJwZIkmuX05Klc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750806842; x=1751411642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LFPxiJb24mVekjpMmYKwKTEiYg/4LBkJQVgyd7ZNfe4=;
        b=gDDRhr2Z3LorUgG10hArTf4jOOQ6l5cvxbtxyDuO5jxgqMPyY+/PmiBnR1P6UIdZJG
         /rmYQ4568jTpvR79PYynLHuSjDj1M/l0YFuMjM9eXqk4Y3K83LSFPdBJQfGjQ/LlHMPQ
         lAaNYMRAvaNpKFwVxEdyfX1bguOzdSFv3Rx1SCTVXnMufC+BcaFJAO17jOQo5XQfu3pj
         Mmlo0RNcSfe6XsaQPWPpqfQnJLDB8OMzO37lfwfU3gHnZbJvVbEjyTTS3mN4FAiiGu3b
         VOD4W2MkwYBiZdUID1DR8juB41zyLctCZ746sXLIDpMURIvt2CuLpWP/zBsz5V9J2e2Q
         egbw==
X-Gm-Message-State: AOJu0YxappOVUKc/Xyt/nEphdh4rY0+QBQyrdavp2pLKYN1K0gQNw8+u
	sGf2ANowf0HhN1QMBcfjwu0VQRwJCefLgNt8dUF6iQOmXmRLMDpW+QwMq4K9cKWqXieBcjJmiUs
	Y8uRXrHc=
X-Gm-Gg: ASbGncsKt7ljFaBdgKg8iicnlInzYBrjJnlw2FTC2lCb+zctxCjrlmIvZnLZkcc2yjj
	KRAQoVlYIu5bxDiG9jRPbtqzo2YrS4r7FTO/ZgMJGu8iP457Xa8XM2zldaaRsgxu1L2yKHcxmWM
	mGAo6awNmAC5GQ9OtTl/RGh0NKeZGFaFIUFJEeEBowlHPOlIpygZreAx+7RWc43ZV7aB79DdY93
	d10MJLrfiV28ox7bunQNBfoNAehVWHG0xQgm8Qxmt1kYg58RRJWewmQ8LMprhw7vJzOJ1nbk1Jv
	Nhudl8YlpUJiIeZxdud4V2iWgOwlCvpjsjXxXy+1EfK6+/vq88NblxhO5QpYlWq8azmu1eMZtPZ
	FWcFDuYu0m4pXffFfeSQreB+2ng==
X-Google-Smtp-Source: AGHT+IH+3F2vqq0uLysaCoPjTHlKtCIVWss9+qKmaIN+zOd7795UKJwu8uwT0qv8FTjhXqjx7eh7zA==
X-Received: by 2002:a05:6a00:9291:b0:748:3385:a4a with SMTP id d2e1a72fcca58-74ad45e6fffmr1376190b3a.23.1750806842171;
        Tue, 24 Jun 2025 16:14:02 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c882ccf9sm2937044b3a.94.2025.06.24.16.14.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 16:14:01 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] Upgrades (AUH) for 2025-06-24
Date: Tue, 24 Jun 2025 16:13:50 -0700
Message-ID: <cover.1750806216.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 23:14:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219289

From: Tim Orling <tim.orling@konsulko.com>

Upgrades mostly from AUH, with the exception of python3-maturin
which were done manually (they should work with AUH again after 1.8.7 fixed
the SRC_URI issue due to patch).

The following changes since commit ea4b963d9a59210bb9eeaee55dcb6378ef65baba:

  buildhistory: Drop BUILDHISTORY_RESET due to reliability issues (2025-06-24 13:53:23 +0100)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib timo/upgrades-2025-06-24
  https://git.yoctoproject.org/poky-contrib/log/?h=timo/upgrades-2025-06-24

Tim Orling (6):
  python3-wheel: upgrade 0.45.1 -> 0.46.1
  python3-maturin: upgrade 1.8.6 -> 1.8.7
  python3-maturin: upgrade 1.8.7 -> 1.9.0
  python3-cryptography{-vectors}: upgrade 45.0.3 -> 45.0.4
  python3-certifi: upgrade 2025.4.26 -> 2025.6.15
  python3-pytest-subtests: upgrade 0.14.1 -> 0.14.2

 ...5.4.26.bb => python3-certifi_2025.6.15.bb} |  4 +-
 .../python/python3-cryptography-common.inc    |  2 +-
 .../python/python3-cryptography-vectors.bb    |  2 +-
 .../python/python3-cryptography.bb            |  2 +-
 ...toml-remove-benchmark-disable-option.patch |  4 +-
 .../python/python3-maturin-crates.inc         | 54 ++++++++++++-------
 ...urin_1.8.6.bb => python3-maturin_1.9.0.bb} |  4 +-
 ...1.bb => python3-pytest-subtests_0.14.2.bb} |  2 +-
 ...heel_0.45.1.bb => python3-wheel_0.46.1.bb} |  2 +-
 9 files changed, 46 insertions(+), 30 deletions(-)
 rename meta/recipes-devtools/python/{python3-certifi_2025.4.26.bb => python3-certifi_2025.6.15.bb} (80%)
 rename meta/recipes-devtools/python/{python3-maturin_1.8.6.bb => python3-maturin_1.9.0.bb} (78%)
 rename meta/recipes-devtools/python/{python3-pytest-subtests_0.14.1.bb => python3-pytest-subtests_0.14.2.bb} (88%)
 rename meta/recipes-devtools/python/{python3-wheel_0.45.1.bb => python3-wheel_0.46.1.bb} (85%)

-- 
2.43.0


