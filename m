Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E882EEE49A5
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 17:38:45 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.1001.1692639523081130272
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 10:38:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=xow+B0aP;
 spf=pass (domain: baylibre.com, ip: 209.85.160.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-41090d0f015so9611261cf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 10:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1692639522; x=1693244322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A62JQtynGWWjNauYStJqSUohxQ28vMY1ZFOmfRTS7ms=;
        b=xow+B0aPxBbqNcmE3fqIqiwOwYW6xMn0GSn7zW40abt8bPbXX3EDPL3vajuFvS3KR0
         c8BybNFnLccgxOg4snNp4CuRjawnJIbBkCZT5lcezH2XY/1Dmd0MTquCc6fj12HOv89y
         XTzfa/oZYkd05s5Gq7ioCawWg54Eog5xgGSlME4JUlb0J/r7Ro51iD2Wcja24JHo7PuD
         00bAXVSLxT43lCo2iKYIH8444G0ZNpaZZ377hNOm1ipf/mVVPrqDIcX83aNl/5p16q7c
         qmSAe1RR5eC7iC9euiszhERhB9VMFGdhZl1HilvYEEw646nVsTo0vOYuyoA7eMabT2fO
         INfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692639522; x=1693244322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A62JQtynGWWjNauYStJqSUohxQ28vMY1ZFOmfRTS7ms=;
        b=H9LawlASrudYYrzNhOxcnwhfvbhDA8RD2+98sZFCJk6+PbtBJDbpaKcAduOrm5yt0S
         urqfcExlDlT/McGt9Ie4iyCMtMFXfUnCa0ZH98pizqzfexi4HpjdsVRhDdeTbaIZUXpc
         f6vE9/vFx1kGSLOlCZ+HlZEfUgzfn+8ROz+zNNNKd48mbjDGQjNFuttYwDlqOpGIaewK
         zkzhvIv6LHnIYYIL/YneODgEMv/JdELXqS9dP7UBCopT578NR1N2Ld14PbEVei1j40K6
         8o23qYx2wtkDgA4gi7nWF89yN5LxKlbdmdo+7471Hg74/ioWHQQcbEeM3Pf2VdrZXFY8
         dnqQ==
X-Gm-Message-State: AOJu0YxE1SBp7XgwLqTW6ebEVrJbeu2MCSsNWtXjcOvq1P9WVZJV58OF
	/Kwe7kwR6hy8I6gUFFqgogjbumiTpsFll44SwKw=
X-Google-Smtp-Source: AGHT+IGEYOX5mTzkSW4WgqjFBN04FySYN2JJqrLAwXZH7plPxXdjf8F9iT3CVqODYYDhlsnR2y9hkA==
X-Received: by 2002:ac8:5e51:0:b0:406:9532:55ab with SMTP id i17-20020ac85e51000000b00406953255abmr9113154qtx.42.1692639521701;
        Mon, 21 Aug 2023 10:38:41 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id a5-20020ac84345000000b003f7fd3ce69fsm2513347qtn.59.2023.08.21.10.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 10:38:41 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: tim.orling@konsulko.com,
	raj.khem@gmail.com
Subject: [OE-core][PATCH 0/2] Upgrading Cython to 3.0.0
Date: Mon, 21 Aug 2023 13:38:38 -0400
Message-ID: <20230821173840.1337747-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 17:38:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186479

The Cython 3.0.0 release contains many changes. Since there are a large
number of recipes that depend on it, there will potentially be build
issues with recipes in meta-python and elsewhere. I performed a world
build on poky alone with the python3-cython upgrade and the only recipe
to fail was python3-pyyaml, so that has been tweaked to work (via two
new patches for the recipe; thanks to Tim Orling for the heads-up).

Trevor Gamblin (2):
  python3-cython: upgrade 0.29.36 -> 3.0.0
  python3-pyyaml: Make compatible with Cython 3.0.0

 .../recipes-devtools/python/python-cython.inc |  4 +-
 ...hon_0.29.36.bb => python3-cython_3.0.0.bb} |  0
 .../0001-Fix-builds-with-Cython-3.patch       | 47 +++++++++++++++++++
 ...roject.toml-don-t-pin-Cython-version.patch | 26 ++++++++++
 .../python/python3-pyyaml_6.0.1.bb            |  4 ++
 5 files changed, 79 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-cython_0.29.36.bb => python3-cython_3.0.0.bb} (100%)
 create mode 100644 meta/recipes-devtools/python/python3-pyyaml/0001-Fix-builds-with-Cython-3.patch
 create mode 100644 meta/recipes-devtools/python/python3-pyyaml/0001-pyproject.toml-don-t-pin-Cython-version.patch

-- 
2.41.0


