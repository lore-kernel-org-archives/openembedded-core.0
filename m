Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B29CBF4484F
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 12:27:12 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.155261.1775824031517695120
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 05:27:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XRd58uWa;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4888375f735so19443135e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 05:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775824030; x=1776428830; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8uAwvunlpzLpRAbMo1LDoPU5XDnWQCPcS7D64hhf52E=;
        b=XRd58uWaWIQD97YQeJK4+Lki3idkthRoBICTIkv9KPyEa/G9TZvPulwW4tNBhUWgoc
         SZ61mIx+n+YvncrUD2fiKt133B3cS8rDFJ9avzAmUrV0RpkK4IcMvFQlhWqNo7/V3ViO
         49zPAPtMYRvVcCV7w+YfML1iHZH1aLiLsEJMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775824030; x=1776428830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uAwvunlpzLpRAbMo1LDoPU5XDnWQCPcS7D64hhf52E=;
        b=OBsWf+eGvdTkfd15rlaooTbIAk3I7LlmZVAOAmdTsMsrfz/XT2j1CwjKKuF4NtGFZp
         AjWfWb0QM8GeZgEzqL0X7HT1dl9llnkuyGZoMI43uMFJTefbrV/H5kVye1OCOkrxZknB
         nju1QHFML48XNhQdvhoVLyaG3PXPeZspxV6qk6xf5zoV2nhA8hcw348P6HZSxcRIebXY
         g2PYMKZNTcZb0P9PCkYYpgPMuNfZN07nrQPgJMIP1gSMPkTwofYRlz7Ig1Yt82Z2KHwi
         yOtHrTUVG/wYUx0bbfYhPAsVp6z+8M1zU5N+0jqdxI0CRL1xhgqw6J2p3Er/Tcd98Xsf
         2CvA==
X-Gm-Message-State: AOJu0YygjaAgXVaq4XZEo8V1VhE+RTwGcGbvptYuZqiMEo4FmohluBVN
	b8yKA7oO30t3voVkUtNMNYS29zD94lQACud2zo2Dag7XUJJKl9uuglkfl1BC7G13w8M54ta5fGj
	QixOsBryxzg5M
X-Gm-Gg: AeBDiesvfejpejFK+BnqJeE1ZhLh1YaYGKJSsizeIrQEgmET9EfGjxtk+f7ZO/651Dn
	tz00I0oKnYaBl0EKfyPcfBEL2O5ANnwVKCDB3SuzImo8kRv4s364x1CskS6fvVTYAxsISRVQH1i
	3VXtsO7mULg3q9YNaoj37ft+D8Hiwkv89pqZuy0dWUUDXZx7rUrN4C3DILmm/3emZCfkv0Ge585
	mBjxgWzyYJoY1DQTSqIkdR6moJT11QeRoji3XMN/vhEIf8pMhEHDqt4KuizwO6flzA3hrgBlFb0
	+SpzDT2b9g8710CPHuTz26tgCJzvoqqcMGlctBPRKT+68N7vv8Ote+umityt70i2VtBDfRUX1jW
	Pdht1xxiqydpJhcabQDKvXa6nRFyjWaY+TNmndZmvndkEDPfXNwfP9rAK8U/MwS6JVBQnm48n+x
	oF0MPzLFMvw3sqR0vMgawU0OS0SXAFm4MQKwoLWQk2W+kMIuQsiac7xwr0NVSdA/2I6TtvqWeu0
	0c/BXdCK7LdB/DH9/8+002KFsNS
X-Received: by 2002:a05:600c:8207:b0:488:7a24:9ddf with SMTP id 5b1f17b1804b1-488d688dd31mr36423765e9.28.1775824029578;
        Fri, 10 Apr 2026 05:27:09 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bcd4fc1a1ff2417c.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bcd4:fc1a:1ff2:417c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5df2062sm21098165e9.12.2026.04.10.05.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 05:27:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][kirkstone 0/1] Pull request
Date: Fri, 10 Apr 2026 14:26:59 +0200
Message-ID: <cover.1775823919.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 12:27:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235020

This is a last minute fix about the git:// protocol migration.
It passed oe-selftest:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/69/builds/209

The following changes since commit f2bc121f821f684a541b1f4e317078c50d29c389:

  scripts/install-buildtools: Update to 4.0.34 (2026-04-10 00:51:17 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

for you to fetch changes up to b507de6d469890f14d153c0eb48361d97d24a71e:

  oeqa/selftest/git-submodule-test: Default to https git protocol for YP/OE repos (2026-04-10 13:26:01 +0200)

----------------------------------------------------------------

Yoann Congal (1):
  oeqa/selftest/git-submodule-test: Default to https git protocol for
    YP/OE repos

 .../recipes-test/git-submodule-test/git-submodule-test.bb     | 4 ++--
 meta/lib/oeqa/selftest/cases/archiver.py                      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)


