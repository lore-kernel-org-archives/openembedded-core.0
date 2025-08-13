Return-Path: <pistora.tobias@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8328ACA0EE0
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 09:21:20 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.97136.1755076870928198987
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 02:21:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P4++40DQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: pistora.tobias@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-458ba079338so4234875e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 02:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755076869; x=1755681669; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ouDlNMKjEWaWrRfFd5474pNmqJnrDi9kfCaXcWQ498g=;
        b=P4++40DQKHFzvnfADX7SxqaTbmlrrzuENnKS1mbkbTXCvEI6lwK9jHJIBl0OyNYPLN
         SzRTkUDtAeaXgdTo4H0HfpWAgfB/sVh94Kl74W2EiCasooJnSrcIM75w6PL67C96TZi5
         SDQf7pjGe/eazim4u6Jmi+fkBpr+r5HGPtdHzuUkU/JC/cbCdkZ8iyFNGU7Ous9uN+85
         tk1BrLA09UhLOjWW4J9thhRzFZTcs/rT0zdtxp0HRFzYJtYdT+A96jWdwg3CDdNHWgR0
         oRu1lHUTF4vcZRc59m9q6jrxgdsQ1xFzGa/q+VJkFBN5lOCruudz8mFTwCFXOTeJBkT4
         q+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755076869; x=1755681669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ouDlNMKjEWaWrRfFd5474pNmqJnrDi9kfCaXcWQ498g=;
        b=TQkdjuWPF0eRPxztY/dFaL+uxHORV7rAlFGoewM5bScbI9Yed2v/yCuZUs6hkYwI0+
         QQ9nR+jt39YtIken/5n5k17TvCOiwMCq1v/Ms4W2j45TVNy/PwJdTT9AzNs1G/V3Olof
         6WoeK9v03HmA2iruT18f3jlHtTGyE9+NMecbkm5LY2iTJHkM3/aIxrC2D15+9YAD1foo
         K9XUucF57iTEOsfrUCXTkmv35Ay6r4zd06QDg6OeCPPjcRyPiH9wA3w7fH3RAzfawNcd
         3ABddNnpI7C0KYjD+l9Z3H8brbXKWfRMDtBsi5kygRVJUq7xPYTGqHwlsUI37Bg8pOaj
         IpRw==
X-Gm-Message-State: AOJu0YyXGmO52mKm2EG8E7gTMZR853zxgEPGpsCEcEG4/fB3CsYxONKp
	id0R8PfJWW4S6pdAn01+9hHz++WJLmJsBuUVFQREY1LYNxa9+4GF5K8BTQlWWCjv
X-Gm-Gg: ASbGncudSGnVtEcrwaxhKtrTZfq25SvyjqrJKqj5i9clrexr2WWyyZFef6x6KFfOil2
	kR7+xEJWOaZ8K/r44y8QmdAxrIJiE1X77bKgn/8qtfar9DEKqHHqe9FmoSURnNObdxieE9tO5ec
	xY69uYI1aQDOF7rUIPCDrYB3UrnPdpFC2aaSrOpa4kaCfVrtl8ePskY4TpxYYHE8D/qm/h6MKBn
	Hi+l17FIM66gdsp9I6z3VtCbl7T9HqgSseHrO5iD7l+vO2W8qkkCtlV8tFaokxhshZhdZSZOoHd
	5E1pXwrRkRTWtJHWfO9vYBu7ybrQz6vjYCIQEJ15CG6e8xlVkUDrVJJ/XLsQsNq1qAyUX6DtXZv
	4G1p8HauoXYSFggnsNbBmOek5ybjGENhqJz1cvkS6Q0sJLjKyPimYBCNXYcisMIXemhE01qWJiA
	==
X-Google-Smtp-Source: AGHT+IGp4n4ZwI/dLOhxKk71pr51GFOSGhJp9CzqGCTqURlRxdf/C1rxFFAg15PWPwkEq/Bvw4LQ7w==
X-Received: by 2002:a05:600c:1993:b0:43c:ed33:a500 with SMTP id 5b1f17b1804b1-45a1704ab30mr14096685e9.10.1755076869115;
        Wed, 13 Aug 2025 02:21:09 -0700 (PDT)
Received: from debian-workstation-pto.wien.schrack-seconet.com ([81.223.165.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c453328sm49440914f8f.46.2025.08.13.02.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 02:21:08 -0700 (PDT)
From: Tobias Pistora <pistora.tobias@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tobias Pistora <pistora.tobias@gmail.com>
Subject: [PATCH v2 0/2] devtool: fix upgrade for recipes with git submodules
Date: Wed, 13 Aug 2025 11:20:40 +0200
Message-Id: <20250813092042.247966-1-pistora.tobias@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 09:21:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221795

Fixes [YOCTO #15943]

This patch fixes a bug where devtool upgrade failed when upgrading recipes that include git submodules (via gitsm).
Furthermore a selftest is add that covers gitsm components for devtool upgrade command.

Tobias Pistora (2):
  devtool: fix upgrade for recipes with git submodules
  selftest/devtool: add devtool upgrade selftest for recipes with git
    submodules

 .../devtool/devtool-upgrade-test5_git.bb      | 32 +++++++++++++++++++
 .../devtool-upgrade-test5_git.bb.upgraded     | 31 ++++++++++++++++++
 meta/lib/oeqa/selftest/cases/devtool.py       | 10 ++++--
 scripts/lib/devtool/upgrade.py                |  4 +--
 4 files changed, 72 insertions(+), 5 deletions(-)
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb.upgraded

-- 
2.39.5


