Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E88A8C25B6C
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 14:40:30 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.149461.1698158427996247466
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Oct 2023 07:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=eirCqOIZ;
 spf=pass (domain: baylibre.com, ip: 209.85.208.173, mailfrom: jstephan@baylibre.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2c518a1d83fso72323351fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 07:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698158426; x=1698763226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kOhKS+bNdIGwiVRiMsuNlw65IADgJuNi6gH6xYvT9LQ=;
        b=eirCqOIZuoUd1tLPbbkrf6vmpZLwZUJ0tPLWU1+j4Nd33wuuKDAznfRedGXDfqAcYp
         Y8W+n3V7h2MMtmtZ25iuhzx0o5InJOrc0X/MYTiOo9SaUQEE+93sTsSQTvcZY8cC8rP+
         tC9cgf8jSN1UYiWvjSyWQfa9NmmCXyVXiRgUEcnfRs1g1FVXJZwwOIUQod5y4oHI9cIr
         7xpeB0IiDtIhdb4KbUzZ9WhkhJ7S4wk+YgP6eyknJ37XxbnshxegS83QfiQD1eNOZqKn
         znWeUGjMoMZHzAJBI1zr2WQFADyYZ6zM2Il+hQV2C5JMA3IuZpHOe3jRj387hUaz4Puq
         4iWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698158426; x=1698763226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kOhKS+bNdIGwiVRiMsuNlw65IADgJuNi6gH6xYvT9LQ=;
        b=NT0fOwTht3qChCrj8jnJgiiKUkBgu0MI0OufI6m2ZbP2KVTv7GDN/VYOpLbBwpX3gE
         lhgALriE+tyxOUc0tGFLmb/653Uzjc5uaaRM0i5mao0uuCNoRK3GRBCPaG0ap8hhptXE
         YCfaEM7nC0WtpHj2Gzp/vBUHA4yJg/XRTYB9lJIUrbkQ0aMNAa2HlITbEAnmmdgC5eiH
         fyV72dDMTFD08L6TcvFccinn+6M3cZmHeJ2UsHrxZa2PbCOjuhf2kIJpjkIPGMF0MuYW
         Y84Pe3yZduPCexNct6pfASP6/6vyTtvSQ73ogC+Lth9ypvZ1TNqMrXUvkyz7s58TQRwt
         1d4Q==
X-Gm-Message-State: AOJu0Yx92LYXOXGryEohlmI5qdGXYqr6C2iBJny66BZgAEcXUrJYGGty
	dUeJh7B1plK7FkuO0uu/q1eZPJr2idZDPFaWQlHX3w==
X-Google-Smtp-Source: AGHT+IGq6awdVBekAa75vtlCk4j3teVR4DvUSOVpifcdN1Ua0zomNAUT+9ue+6/UKsPNT8kAHB4YNg==
X-Received: by 2002:a05:6512:34c7:b0:500:ac71:8464 with SMTP id w7-20020a05651234c700b00500ac718464mr7005323lfr.66.1698158425909;
        Tue, 24 Oct 2023 07:40:25 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id k32-20020a05600c1ca000b00401e32b25adsm12387271wms.4.2023.10.24.07.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 07:40:25 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v3 0/4] devtool/recipetool: add support of PEP-517
Date: Tue, 24 Oct 2023 16:40:17 +0200
Message-ID: <20231024144022.1532605-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 14:40:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189648

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

Julien Stephan (4):
  scripts:recipetool:create_buildsys_python: prefix created recipes with
    python3-
  scripts:recipetool:create_buildsys_python: refactor code for futur
    PEP517 addition
  scripts:recipetool:create_buildsys_python: add PEP517 support
  oeqa/selftest/recipetool: add selftest for PEP-517 recipe creation

 meta/lib/oeqa/selftest/cases/recipetool.py    |  106 +-
 .../lib/recipetool/create_buildsys_python.py  | 1017 +++++++++++------
 2 files changed, 759 insertions(+), 364 deletions(-)

--
2.42.0

