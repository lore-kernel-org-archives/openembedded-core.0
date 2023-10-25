Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD0CC25B47
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 15:47:09 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.47144.1698248827162009879
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Oct 2023 08:47:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=JpsdGF3j;
 spf=pass (domain: baylibre.com, ip: 209.85.208.179, mailfrom: jstephan@baylibre.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c509d5ab43so89147461fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 08:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698248825; x=1698853625; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dVvO1EH4wGI3UYxVNn9H9kQ5MDxyLV5OWJ2hhrmSP7U=;
        b=JpsdGF3jBIzrk9UjRuqDrs9Gk8WrG0pP/i8t3VpjFG1NSSN6Az7FaqvwXl/DH174RQ
         WIQrE+BQPreS3JjVFKPiuPQ8641JQbAxNMdCaAW9tmgEAh+YGl5P3XzRBKfsiLAB9VMU
         UUA2v3Ge4FwzC71fxRAYpjP0EUU52M42Kyksk585kR5P8gubxUqTnYpldzDj1u5OWFX/
         9hv6uJr05zGne+ALG+zYc3/i/s9VknipUX+THY65T4bfjflZIIF6PhGg0YqkakO24LTT
         JERJnRcB/+E3YsJAuSjS15Rn3i/qHyP66wyplH74xH7mDrdNS3uW6Ddstj2Q81QUnvDq
         Hbrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698248825; x=1698853625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dVvO1EH4wGI3UYxVNn9H9kQ5MDxyLV5OWJ2hhrmSP7U=;
        b=g5t+HuavQrVNrJGgdWw1HGvxuirQycDr/cpKE9mNo268zscPndhuQxLt34Lj/RbRMY
         JjXBY/n0a41Fu8xJ94F1jPfOdXRjj1pI9tfXJ3pjn5BrCun3qFa1iIdIlR9bCphy42So
         8wn8YWkUpDrQtyryplecxwj88DM41PngqCJRx2Pedb/0paDAWGjFsQm08hn//JhCgrqR
         oxqV/ue2IIz1irKwfmvhvT3VND1ny9J5kChdEGTO3k4dtSEFp+yzfHhQtW8biYlMGbmc
         Sg4S5CcFtJG92BNPcWDsC5DNxXNgSJ4Qw18JJN91lgDsi31LfdLl2tmqhgZ2iwGRfeJo
         gIjg==
X-Gm-Message-State: AOJu0YwccjEOQCj6LFKI1lZhJG7lNOMdebjs0z2xcNrI3qmbz6ZFVp3x
	/WjscFejT4uouAvOv4OAYVH2dBSk/c0+nfWJyxTdAA==
X-Google-Smtp-Source: AGHT+IG4PEYzyK9MlazuPGVhVX+GTgu+qnCUrmgIOqhz7nJ5JKDFv9hxn2LuKCeWiETKeZOx3NB5Dg==
X-Received: by 2002:a05:6512:71:b0:507:a6b2:c63e with SMTP id i17-20020a056512007100b00507a6b2c63emr9769304lfo.53.1698248824533;
        Wed, 25 Oct 2023 08:47:04 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id a10-20020adfe5ca000000b0032415213a6fsm12301964wrn.87.2023.10.25.08.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 08:47:04 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v4 0/5] devtool/recipetool: add support of PEP-517
Date: Wed, 25 Oct 2023 17:46:54 +0200
Message-ID: <20231025154659.2442373-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 15:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189684

Hello all,

This series adds basic support for PEP-517 in recipetool/devtool, plus somes
others fixes.

Recipetool/devtool selftest passed locally

Missing features:
- extra or optionnal dependencies are not handled
- version number for dependencies are not handled (issue already present
  for the legacy setuptool)
- some projects can declare a minimal pyproject.toml file, and put all
  the metadata in setup.py/setup.cfg/requirements.txt .. theses cases
  are not handled. If a pyproject.toml file is found, assumes it has all
  necessary metadata.

Changes from v3
- add missing patch 

Changes from v2:
- try to use tomllib from python core (since 3.11) and if not available,
  try to import tomli (instead of toml, as tomllib and tomli have both the
  same api)
- improve support for poetry: poetry looks for metadata into the
  "tools.poetry" section instead of the "project" section
- add the selftests for the 3 supported backends. Skip the tests if
  tomliib (python > 3.11) or tomli is not installed
- fix self test failing with the new "python3-" prefix added to
  recipetool for python recipes

Julien Stephan (5):
  scripts:recipetool:create_buildsys_python: fix license note
  scripts:recipetool:create_buildsys_python: prefix created recipes with
    python3-
  scripts:recipetool:create_buildsys_python: refactor code for futur
    PEP517 addition
  scripts:recipetool:create_buildsys_python: add PEP517 support
  oeqa/selftest/recipetool: add selftest for PEP-517 recipe creation

 meta/lib/oeqa/selftest/cases/recipetool.py    |  106 +-
 .../lib/recipetool/create_buildsys_python.py  | 1019 +++++++++++------
 2 files changed, 760 insertions(+), 365 deletions(-)

-- 
2.42.0


