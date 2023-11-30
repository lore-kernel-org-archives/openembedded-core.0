Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A32D6C46CA3
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 22:02:21 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.8309.1701381736907367199
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 14:02:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=GM55OU1B;
 spf=pass (domain: baylibre.com, ip: 209.85.128.50, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-409299277bbso13098385e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 14:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701381734; x=1701986534; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PLDMnnif5fpnixs6tJ4l35BxCYrs7yznDbCmbkzB39Q=;
        b=GM55OU1BTUFPllGOupyfIdywTb9Up1UZVcxJ3mtV5SkAAd9zyzLmojU+We5z6Eauy8
         ngPv/f/1UXs8c6PfgQpL+bWkppSz4As7+aJ2zyHMKMqzeo+V242EOdEPfnP6FobAZYUi
         opJaUis5NBVJETnpHsW5S5e1OMBMFjSbb3DjtdDuetlde/Hjmfbnsq37s76U7cmyQ+2S
         YsOvhWRuUb/l84hVmT7bLj8t/LiULqe3Ukxj2a7k7d78Nyqzz6p8iaO2aePpb9t2NsfM
         JHaWDu/RXMJX3s48LBA8c/xDX7IdfmiqHAxFW4Ecq/9ZYJ8BS4bKjTh1Beub3QK9RCxA
         2qBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701381734; x=1701986534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PLDMnnif5fpnixs6tJ4l35BxCYrs7yznDbCmbkzB39Q=;
        b=QVg8V91p6bTC+YaD9uHzsc2tXhq89vREueLyNrB47H0T0zOCMbaUaH8qIWqGbPoPSl
         BKh7Dz2ajj2jZFgXL0UowwzJge5ZfrN+H69iKFZU0NKc+D762TcQ1PNkehB55VKnIyHx
         26LHaBEHfcqz38Ycc24s0R1jyMHjm0zBlHhS6bAYtDaTsPtTlSFGeBjgCcDQFLqwhAEF
         p5iCtWQNNx+BImXffszJoYvdeQU9WIa4CvEINzoUDle88nCDCedO4KUwpo3bUFK1j4kz
         AtM95qJ6qxZy21gJdpgWHtwylxBrPtlG9RCe0hTjA6IsGhzvhSKMn0zjilWpNa5NHCoZ
         VMVQ==
X-Gm-Message-State: AOJu0Yz26O+oHYArkfZF3Toh4KZcfVC2lnHsr3pF3S0On2ygj8M89+Kn
	sbXAJTPEEyXP+dlRVwTwhZfyKQ4whtqz9Mo5+VMCiw==
X-Google-Smtp-Source: AGHT+IELuy6mRP3maBJTkbpziOf80JOIY8iGIx/sw5xodHTJWC0L0LmU6l86u9PAesUDdzjw1zaBiQ==
X-Received: by 2002:a1c:750a:0:b0:40b:5e59:e9eb with SMTP id o10-20020a1c750a000000b0040b5e59e9ebmr73515wmc.138.1701381734535;
        Thu, 30 Nov 2023 14:02:14 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id w3-20020a05600c474300b0040b36050f1bsm3231372wmo.44.2023.11.30.14.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 14:02:14 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [RFC] [PATCH 0/7] Several fixes around recipetool appendsrcfile(s) and oe.recipeutils.bbappend_recipe
Date: Thu, 30 Nov 2023 23:01:48 +0100
Message-ID: <20231130220156.726263-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 22:02:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191544

Hi all,

I was trying to use recipetool appendsrcfile to add a file to a recipe and I noticed several issues:
* -m is not correctly supported
* recipetool appendsrfile(s) are missing a usefull dry-run mode
* appendsrc function relies on oe.recipeutils.bbappend_recipe but
  duplicates some code: it constructs itself the new src_uri entry
  although oe.recipeutils.bbappend_recipe is already doing it
* we are lacking a mode to patch the recipe itself

So this series tries to fix the issues above, fix the selftest
accordingly and add new test for -m and for "patch mode" (update recipe)
and also add a way to specify the name of the file to add
(in oe.recipeutils.bbappend_recipe)

There is still one point I would like to discuss:
I skip test_recipetool_appendsrcfile_existing_in_src_uri_diff_params
test because recipetool appendsrcfile(s) used to not add new src_uri entry
if the entry already exist even with different parameters while
oe.recipeutils.bbappend_recipe adds it if parameters are different. So
we need to figure out if we want to keep the old behaviour and if we need
to patch oe.recipeutils.bbappend_recipe, and update the test or remove
it.
I feel like if the parameters are different then we should add the new
src_entry (so old behaviour was not correct) and remove old entry so
either use "SRC_URI:remove" in bbapend file or completely remove the old
entry in patch mode

What do you think?

Cheers
Julien

Julien Stephan (7):
  recipetool: appendsrcfile(s): add dry-run mode
  recipeutils: bbappend_recipe: fix undefined variable
  recipetool: appendsrcfile(s): use params instead of extraline
  recipeutils: bbappend_recipe: fix file not added to SRC_URI if name is
    specified
  recipeutils: bbappend_recipe: allow to patch the recipe itself
  recipetool: appendsrcfile(s): add a mode to update the recipe itself
  oeqa/selftest/recipetool: appendsrfile: add test for machine

 meta/lib/oe/recipeutils.py                 | 51 +++++++++++-------
 meta/lib/oeqa/selftest/cases/recipetool.py | 30 +++++++++--
 scripts/lib/recipetool/append.py           | 60 ++++++++++++++++------
 3 files changed, 103 insertions(+), 38 deletions(-)

-- 
2.42.0


