Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2326C87FCF
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 18:44:52 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.3810.1754592290760957949
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 11:44:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=TG8ZN4LB;
 spf=pass (domain: konsulko.com, ip: 209.85.210.169, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-76bdc73f363so1400128b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 11:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1754592290; x=1755197090; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=cDagbFmrf0F0lrim+CyQOHroTkaK7+arP0BGiPYkedk=;
        b=TG8ZN4LB/ymYh9JeCK9dMtSy7LSNzcI8ixaCCiXx1dc8IWcRLbhd7Xg+oDKAEPtlhA
         H/KccTOnsqOlZGgJ0hkddta347+Adde2xUrZj+nlokbPqw6sGTpXRTZa47YpBFpjNWdJ
         mUvPgQX4vcQvPYTN5KM0OitjmfcOopZtOIFig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754592290; x=1755197090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cDagbFmrf0F0lrim+CyQOHroTkaK7+arP0BGiPYkedk=;
        b=Qbfy8NZDikKH8P0dyk63DJp/uPkWDZgG4dYVih7uiMk9DIobhxNa21Gb+4iDfjiyN6
         tArFhMEMEk0RVfMK+MbZae0cx92SP6Doi6sX+VzmwisZkgHHIWcZp0B06Mg4HKXS3pJT
         sZBrYOxADkeZSJ9QLRVz7FcWUbwAuAxhqFsv0VIq/erROEw/6gS57e0U7Xf2VTEmbOWB
         RCoRdfIJbdFr9+SGxtFl4SXgByRjHoL119IygBXdCQGgBFW9E+6zj8QpMSyV2Qvq8Jl4
         7xrFjrnkKi+WvM9lKytUMrAoR7qQ+A3R+qCoA9AR56biXqAAKYUcgt2c6L+xT6nrNbUn
         7MFQ==
X-Gm-Message-State: AOJu0Ywa0zfCy2UL2WzCB0BDb3MWwLCyVfefSIi6Ed4cka79ajodvg2Y
	CeU3/3c/bOBjGazInK6VXNo/8gmi1LQnUCYcqqp/WSTmHay+kVU9Q8gdw00i0Gkc9bu3Na98gZM
	lV3IpuvM=
X-Gm-Gg: ASbGnctgVyfoPjcWtPwA3RgyPsUp6TszkZoocCSbLWSXqPKhYHRuQ+AhWKFhFMuE6V8
	ItCvhLPGdX6fVZ8PLpXdaDC29S9AYeKE0ZABslFjwEdBCXySRUjBCnW+D0UArPzdCCa2dqETwni
	R0Bem4lFG9YmPZFEbju2T6n/QGkTSVcpeN2yE6j7J2mJi7BAJE5Vq3Wj4kkTqvC5Gcin//S+TPY
	FbXTbFTz74n1o7+4j70MHthf9xBpjkOa0s1zHnkZyQ2rS30etdQwNUS+pRSMaeRLOSy+Xvs1M6n
	ay1/3m84vyW7+hB/rLZioSj4Lflmk+GV4psI9ENOljBYkcJ2/iNRAoiKZdbgvexJFJOvPk3xaVO
	5Khkddvr9LXalEtXZKlw4JsuqY/GjgHlGot1Ct0R7myVL75cA50EMu+ibd69F5Q==
X-Google-Smtp-Source: AGHT+IFj07k8hiagRVjlivkXibpRDqvwHpAGt9bY3EV4/o5esCL23kK+L0Q/3qVu6fNP0uBqmf+2NQ==
X-Received: by 2002:a05:6a20:a127:b0:240:1dc:490d with SMTP id adf61e73a8af0-24052b83321mr998033637.33.1754592288899;
        Thu, 07 Aug 2025 11:44:48 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76c3aeb6645sm2244254b3a.8.2025.08.07.11.44.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 11:44:48 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] Recipe upgrades for 2025-08-07
Date: Thu,  7 Aug 2025 11:44:37 -0700
Message-ID: <cover.1754591996.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 18:44:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221578

From: Tim Orling <tim.orling@konsulko.com>

Mostly AUH upgrades, but update to latest for python3-cryptography*

The following changes since commit b36799ea7d62dd2ff695c1e995ac96e6cd1e973d:

  runqemu: fix special characters bug (2025-08-07 12:11:16 +0100)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib timo/upgrades-20250807
  https://git.yoctoproject.org/poky-contrib/log/?h=timo/upgrades-20250807

Tim Orling (4):
  python3-maturin: upgrade 1.9.1 -> 1.9.3
  python3-cryptography{-vectors}: upgrade to  45.0.6
  python3-certifi: upgrade 2025.7.9 -> 2025.8.3
  python3-zipp: upgrade 3.21.0 -> 3.23.0

 ...ython3-certifi_2025.7.9.bb => python3-certifi_2025.8.3.bb} | 2 +-
 meta/recipes-devtools/python/python3-cryptography-common.inc  | 2 +-
 meta/recipes-devtools/python/python3-cryptography-vectors.bb  | 2 +-
 meta/recipes-devtools/python/python3-cryptography.bb          | 2 +-
 .../0001-pyproject.toml-remove-benchmark-disable-option.patch | 4 ++--
 .../{python3-maturin_1.9.1.bb => python3-maturin_1.9.3.bb}    | 2 +-
 .../python/{python3-zipp_3.21.0.bb => python3-zipp_3.23.0.bb} | 4 ++--
 7 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-devtools/python/{python3-certifi_2025.7.9.bb => python3-certifi_2025.8.3.bb} (87%)
 rename meta/recipes-devtools/python/{python3-maturin_1.9.1.bb => python3-maturin_1.9.3.bb} (92%)
 rename meta/recipes-devtools/python/{python3-zipp_3.21.0.bb => python3-zipp_3.23.0.bb} (67%)

-- 
2.43.0


