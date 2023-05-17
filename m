Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C0A3C7EE23
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 08:06:48 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.44461.1684310804777859019
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 01:06:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=Gtg9lb3a;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.44, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3063433fa66so236754f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 01:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684310803; x=1686902803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0UGKj86wzOvxFCp1xqFkWyfJKJ2+Q6k4acGKL4xtiEM=;
        b=Gtg9lb3aJswHqNKiNO0a0ptm3f743stxc4zaYfwE8iLj8XhYx90cPQutKX8m61c0yn
         02oGBvVexx36wt0qwRSeLfr1llX1gP38WIbPSU3fdsLzywT6MyLNZ7NNVRkO427p+4eN
         XhhhFcccYhcNoFT14UDHcgl0qefDX+oUozq8g/+3EAwgGj1jeXmeyQBT0pvBG5cIsFt6
         wEPz7EjJc+jTv6gwkn7I6G+Sp0pOJvX/+BUH6DaoNoDSavmy8bZ6aJRYwxxbOguCvCAX
         EiA7V3QJij9WhmJRoTl1LaeSnLpGbahWolQA/IuSHEbgiVXE1FV87N/4EUd/V/i5gmRX
         1aKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684310803; x=1686902803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0UGKj86wzOvxFCp1xqFkWyfJKJ2+Q6k4acGKL4xtiEM=;
        b=RWV/+nqtQDCRZDPIBLomsKLXR0wcLgB42tsZPjf+iiOJDZRW8ki6P9rZQ1RHSBArgl
         YA4v0fUPifsWr3GyCq5vd+w7D3/9mwE4H48oF2iEcRY2VRi5qnxtHR37Zchu+L5Is0Bi
         hsedfKKlKveC9c6S/IMd+E+SszuGUJ8YfDRgm6jescI4k3hztC1DkGrY/3MqMEnYWGFQ
         hlFqd5aL/XYaUd4QviQkPwRz4B2JeDPs9QkYr7ABi+zfD33lsyQchRYMn9znapOh5q3f
         i8xWzsf7vo0+fQGXdDQBT7pnvmsS7Hn2f0vOJptLrUYBBKplsymH/dt/Malkn2J3CR2t
         1KPw==
X-Gm-Message-State: AC+VfDx+nLq7s36insdQtPQvl9Mi9gzB5hbWrJnsDxwEjl1Y/0Iqi1zC
	17HwwhfNliFyy9bkQtiDQMealw==
X-Google-Smtp-Source: ACHHUZ5nsJdh/RwYambNhL1nV/HfC/4jLHe9wAk8JYix97H32QLl84ePy1Msg9pgsSXxmNvtfqelJQ==
X-Received: by 2002:adf:ed0b:0:b0:307:a1ff:f648 with SMTP id a11-20020adfed0b000000b00307a1fff648mr20706730wro.2.1684310802835;
        Wed, 17 May 2023 01:06:42 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6f0d:9301:2b67:fec])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d6746000000b003090cb7a9e6sm1919593wrw.31.2023.05.17.01.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 01:06:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][PATCH 00/20] python3: fix run-time dependencies
Date: Wed, 17 May 2023 10:06:19 +0200
Message-Id: <20230517080639.9336-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 08:06:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181449

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I noticed that every now and then I import some python package into an
image only to find out the recipe didn't pull in all required run-time
dependencies. I would fix it whenever I noticed it but figured that I
could right a script that would go over all python packages, build a
minimal image and see that all its modules can be imported.

The patches in this series are the result of that. Most simply add
missing RDEPENDS, some are additional tweaks to recipes and the last
three add new standard library packages to the manifest. These are the
ones for which simply adding python3-misc would still be insufficient in
terms of run-time dependencies.

I plan to do the same for meta-python but this will take more time and I
need to think of some automated way of updating the recipes first.

Bartosz Golaszewski (20):
  python3-async: add missing run-time dependencies
  python3-attrs: unify RDEPENDS
  python3-attrs: don't use PYTHON_PN
  python3-attrs: add missing run-time dependencies
  python3-certifi: add missing run-time dependencies
  python3-libfdt: new package
  python3-dtschema: add missing run-time dependencies
  python3-hypothesis: fix run-time dependencies
  python3-tomli: add missing run-time dependencies
  python3-pathspec: add missing run-time dependencies
  python3-installer: add missing run-time dependencies
  python3-sphinx-rtd-theme: add missing run-time dependencies
  python3-setuptools-rust: fix RDEPENDS and allow target build
  python3-pyproject-hooks: add missing run-time dependencies
  python3-pycryptodome: don't use PYTHON_PN
  python3-pycryptodome: add missing run-time dependencies
  python3-pygobject: add missing run-time dependencies
  python3-manifest: cgitb: new package
  python3-manifest: zipapp: new package
  python3-manifest: turtle: new package

 meta/recipes-devtools/python/python-async.inc |  5 ++-
 .../python/python-pycryptodome.inc            |  8 ++--
 .../python/python3-attrs_23.1.0.bb            | 15 +++----
 .../python/python3-certifi_2022.12.7.bb       |  2 +
 .../python/python3-dtschema_2023.4.bb         |  7 +++-
 .../python/python3-hypothesis_6.71.0.bb       |  2 +-
 .../python/python3-installer_0.7.0.bb         |  6 +++
 .../python/python3-libfdt_1.7.0.post1.bb      | 20 +++++++++
 .../python/python3-pathspec_0.11.1.bb         |  2 +
 .../python/python3-pygobject_3.44.1.bb        |  5 ++-
 .../python/python3-pyproject-hooks_1.0.0.bb   |  5 ++-
 .../python/python3-setuptools-rust_1.5.2.bb   | 17 ++++----
 .../python/python3-sphinx-rtd-theme_1.2.0.bb  |  5 ++-
 .../python/python3-tomli_2.0.1.bb             |  5 +++
 .../python/python3/python3-manifest.json      | 42 +++++++++++++++++++
 15 files changed, 121 insertions(+), 25 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-libfdt_1.7.0.post1.bb

-- 
2.39.2


