Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97C76C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 17:17:41 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.58808.1742231856218341706
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 10:17:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K5bwww3N;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso3161688f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 10:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742231853; x=1742836653; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7GPzRbXDiNYWe5Rq2TbRMBv1SPaxVGYKGAGvEIGDBx0=;
        b=K5bwww3N41RL37eeHmfAm02zCP6MM/wldXlbB8YExO/JppY9jS7dCCmzRPWXYm3xDQ
         Jq4/S8KdoCtWOEmEY8oh0t8rk+CWiCjcchDcdHftzdDfodlGshGtCqY4rtyf9DreILsv
         A2uOUc+kRfNGq+aZ61WUPCTaL0CrKR94fmg/yOc5cOCIJFsG8P2RdKvyUiffSUZED6kM
         BJ+uLvGoOWUCz+NUTAdn0L5DtYsi3Qe9PWkurlT7ve1c6f84ZcYsat9nA5zxP33SnOLe
         3ke/hXM4RhegtnZl+XGH4b+R0eqLe9BqG92ldLwdwxiaBRymX+a3jp6F+HCL2twrlL0X
         uupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231853; x=1742836653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7GPzRbXDiNYWe5Rq2TbRMBv1SPaxVGYKGAGvEIGDBx0=;
        b=hg0lDn/8X1/PJqtyX1L7f8XjqdZcPuyPlmJssu52czWuY4bkcx/C+eamkXup7IfSPQ
         fbArUVl2teNxoj68vsfZft53NU72o3nJYKD19qZIwBqfgcodeh0KOos7Kd2E8CmTcHGX
         dlkbpIwSKAd3OOajbHBf1Q8a1oY1rxxXy2igEFd4bmp6XHPe4sIpjXOtnU0BwSuoc2nl
         WwSKjyXh9sm+wonvbR2xoIfLRTFvz1NspQXiltMWb6CJ/DI5uZ51NfACZuf//vvZfsrP
         PjNWiUijReyfi5cDperC+OBVZKo26+xpH72udXGoLinGzHm0Zu5rkhU1tFw0rc1eTOhl
         iFUA==
X-Gm-Message-State: AOJu0Yy7LQVVnLcNiw4TvdOGbc7N5OhcACaZ5u/v3OS7IDB6/5Fk64Lf
	TloJoTEP1vptXCypvpD7eHmsAqqGjTJAurQrCmafKwYjRgarH+/Vt+8IDA==
X-Gm-Gg: ASbGncu6th7N3lgYjnxmO1qksatQAzT3J6KqpmHkhVVT/LRkns7T4OcPFOOmugMJ78x
	epnpcQ9TniAUWITDLtOyGCwBZQMRvDaLX0Mtd9rjzWu5+d9W1iTD/q1rr5gSUvnUO/nbho2EVx/
	+xrOOSUOidKAg1DkoOWRoc/m+/yY++n4bwm8NyVeSlK6zto1ZCqOsPf/kdjt986QvU0H2F286lj
	FR9HILdxBzn5RVdolSTjAGIzAVusmYEf6XndBRvHHNm4GHGAhC22zMZZaprCWGoPWRoCXLPx6c9
	Vijq9rmhip2TQpHCXSKpAoh9yiQczDnebdqpgj7iLGCFv4arQs77WovpAH3n43DzqD0=
X-Google-Smtp-Source: AGHT+IGLj07Z4zWzDE6/H3k/lDv2hPdC3w2I5MiZ3KLRhN4L/xSrTPEfqGNgRi0xGX1t7XNYDp67rg==
X-Received: by 2002:a5d:6c6c:0:b0:391:34:4fa9 with SMTP id ffacd0b85a97d-3971a6850b1mr16087563f8f.0.1742231853265;
        Mon, 17 Mar 2025 10:17:33 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c82c255bsm15255902f8f.23.2025.03.17.10.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:17:32 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4 0/2] oe-selftest: fitimage add more u-boot tests
Date: Mon, 17 Mar 2025 18:13:54 +0100
Message-ID: <20250317171720.963083-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 17:17:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213119

changes in comparison to v3:
- Write bb_vars.get('VAR', "default) instead of bb_vars.get('VAR') or "default"
changes in comparison to v2:
- Split into 2 patches
- Fix a typo: ftc-native -> dtc-native
- Add one more similar change as a preparation for my next patches

Adrian Freihofer (2):
  oe-selftest: fitimage improve bb_vars access
  oe-selftest: fitimage add more u-boot tests

 meta/lib/oeqa/selftest/cases/fitimage.py | 138 ++++++++++++++++++++---
 1 file changed, 123 insertions(+), 15 deletions(-)

-- 
2.48.1


