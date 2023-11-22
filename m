Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 898C9C61D9D
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 11:08:37 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.16865.1700651308608980879
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 03:08:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Rr5/Rlu0;
 spf=pass (domain: baylibre.com, ip: 209.85.208.44, mailfrom: jstephan@baylibre.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5488bf9e193so5316827a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 03:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700651306; x=1701256106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KipHb3vRSDHOp8SmChsQo6p+17Cr2QFOgyv5ogKLg58=;
        b=Rr5/Rlu0yLBaDQ9HYiS+B8h58HbRF4RQlbmMtB9TNvUqF3wUfsKZlhotS7zqRHvuxR
         x/W5XSp8zQ902Fw5S/9lVMLlemq9d5BLYz+tzWWxJwd0wHpU60yXzdpXasI/3KovE2vC
         hkF0JIc0C2pi6lhiJ35AyR3fkKhXh3eSqolsu7Q8U8iIJbQaPGS7TxCg+LA3qlrDiz1N
         +x/iJS1ymhe1pWKN5ZssbbdzKc2MvrhwZhnfYGnSxEZSeOEptaNfD8h1rAGX2ULkmr9a
         0nn7Adlyzt/yjyc/TmMIjvt0tnU5cy2KD7/3ENU73adgLZLEqpGo5nuFQOitpWtZF8/K
         vQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700651306; x=1701256106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KipHb3vRSDHOp8SmChsQo6p+17Cr2QFOgyv5ogKLg58=;
        b=dG/QM9rwu3C7sUkHOMWKUyaOwwlxPszVUCEow3EU+b2nqGXOyEAHTcamxqeZr9o5jA
         LXhGxNhfVP/9DHsoZOsrPivgpyBWIJY6riDfaCCFWHLFlFDYOHWial8Z1luCsE4tSqGK
         Fcj+xZ3ywOvKzs9IyJC1D4DeelNG1CpXpiAfJVidaH3CASxzYSngI6/hSBsCh/rcqKb6
         RrYw3xChcumLbcjnXASR6wJyoHpfpXcVWuXwVVaAFZfLFVKO3mFRsOs19zFQCKYmxM85
         /EfR5YYCVnLY0b8J7/2NMpQ1d43m5U0H4AvcKYdik+ebzZCTN3Sk3y8hRd+eYaGVBDzj
         Bipw==
X-Gm-Message-State: AOJu0YyUWZt4XuIyQd3Lg9vv8QQNYyRnOkdRurk5Q8e6Kp4RdiZZgiCT
	6Hhrq2851orJ8PCBsNZyZmnBRpsX0fM8fT//Qk/Y/Q==
X-Google-Smtp-Source: AGHT+IGSfoD1AM4HNCQuigsYbjswFmOlw9aI9EAsoaflHlw5t+z1OaC3pl3fzxcHYAVW+vVKFVCuTw==
X-Received: by 2002:a05:6402:1a4c:b0:543:c388:1d69 with SMTP id bf12-20020a0564021a4c00b00543c3881d69mr1699949edb.16.1700651305297;
        Wed, 22 Nov 2023 03:08:25 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id o23-20020aa7c7d7000000b0053e88c4d004sm5790713eds.66.2023.11.22.03.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 03:08:25 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 0/6] devtool: add support of submodules
Date: Wed, 22 Nov 2023 12:08:12 +0100
Message-ID: <20231122110818.932618-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 11:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191061

This series adds the support of git submodules, so we can use devtool
modify with gitsm recipes to create modify and export patches using
devtool finish.

This series also adds support of git submodules defined inside SRC_URI
(i.e extracting a secondary git tree inside S)

My dev branch is available here : [1].

It passed full recipetool/devtool oeselftest locally

Cheers
Julien

[1]: https://git.yoctoproject.org/poky-contrib/log/?h=jstephan/devtool-submodule-fix


Julien Stephan (6):
  devtool: fix update-recipe dry-run mode
  devtool: finish/update-recipe: restrict mode srcrev to recipes fetched
    from SCM
  devtool: tag all submodules
  devtool: add support for git submodules
  oeqa/selftest/devtool: add test for git submodules
  lib/oe/recipeutils.py: remove trailing white-spaces

 meta/classes/devtool-source.bbclass     |   3 +
 meta/lib/oe/patch.py                    |  64 +++---
 meta/lib/oe/recipeutils.py              |  29 ++-
 meta/lib/oeqa/selftest/cases/devtool.py |  47 ++++
 scripts/lib/devtool/__init__.py         |  24 ++
 scripts/lib/devtool/standard.py         | 284 +++++++++++++++---------
 scripts/lib/devtool/upgrade.py          |  51 +++--
 scripts/lib/recipetool/append.py        |   4 +-
 8 files changed, 333 insertions(+), 173 deletions(-)

--
2.42.0


