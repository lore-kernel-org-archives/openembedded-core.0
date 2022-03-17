Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA49AC433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 11:57:04 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.9291.1647518223816354921
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IpaHYw6l;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id
 v2-20020a7bcb42000000b0037b9d960079so4841785wmj.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pSRxWnhomkTiTrIm8ccdljYy45BLK/PmGy0C5BN1CrU=;
        b=IpaHYw6l/ZcpN6DxrB4k6FOenWRRf985uCHNLweLwqd9J/z+or/dTBhBnPQnONmX/z
         O/EjI7Mx+xrVAbZxeNbrCyfg/qrKsLn31aS/72z8s+ptl1uOP3LDcVU/BL4F3AguorI5
         0O0sQ9IASgSjUw3nAdWTPDc/ncPN0KyMQ7Yd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pSRxWnhomkTiTrIm8ccdljYy45BLK/PmGy0C5BN1CrU=;
        b=J1QaFkPTAvnuf6rn2WALcdL0Ckg7ZC7uQZfALt8M59xUkbWwX3TScFdzNfd+770tJJ
         im3MEA6D6p3FIWjJOGoC8stgZy0+jhQuSAjrqjxF2K9dP/FWYgIWm3h1Aveh0JughWvx
         N3fudlWcVS29BTn/5AZA82v9NPqxMPtQRNBwgU5EuWboekRBwgyIrXIAc6AIk5wyXpbQ
         Ud/0mtjY3YcxSVWBYruhTR3ThEaAlgBFWKqZajJRht8ouNBM29xmUMSMKefNRAdsUQxx
         Vr5eYYV16xBm5v1ONpSMiTKXDc9PDjPKerc/kfNO3xsrvZ/f70XyM9PpLWphx//+ptw0
         RFyw==
X-Gm-Message-State: AOAM53276M+epHpIm8kPp4vIsQXMMcCAiwWCq3K7RjTETg3e/ISR3zUp
	W1NjyZLdgyLL56p/6loKiiOhOsxnjGEaLVnA
X-Google-Smtp-Source: 
 ABdhPJwIPN1GW2Z6blR9JNvT/OmADcrE49r/fXxIkFSg82ARqqZux2wfEoZtMoznejDlb35mqpKhkw==
X-Received: by 2002:a05:600c:4f0c:b0:38c:7fb9:e57a with SMTP id
 l12-20020a05600c4f0c00b0038c7fb9e57amr1325821wmq.90.1647518221674;
        Thu, 17 Mar 2022 04:57:01 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:64d8:6f1c:d663:861])
        by smtp.gmail.com with ESMTPSA id
 f22-20020a1cc916000000b00380d3e49e89sm3892315wmb.22.2022.03.17.04.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 04:57:01 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	Quentin Schulz <foss@0leil.net>,
	Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Armin Kuster <akuster808@gmail.com>,
	Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 00/26] Add support for sphinx documentation generation
Date: Thu, 17 Mar 2022 11:56:34 +0000
Message-Id: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 11:57:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163386

We use sphinx for the project documentation. We also build the documentation on the
autobuilder and we use a buildtools-docs-tarball to do it that I created a couple of
years ago using recipes upon which this series is based.

We'd like to be able to generate this tarball from the metadata so I've cleaned up
the patches and present them in this series. The first version back in 2020 was 
from Armin, I've since made changes including sorting out the LICENSE fields.

We have a dilemma of whether to do this in meta-python or core. I'm personally
torn but a number of the base dependencies such as urllib3 and requests should
probably be in core anyway which ended up being the deciding factor. This does
mean we can include docs build tools in build images out the box in future too.

Of note is that as well as adding the buildtools-docs-tarball, a test is also
added using the mechanism Ross used for adding tests to buildtools-tarball. This
makes for a pretty neat test that tests whether the resulting docs tarball can
actually work and generate our docs.

Richard Purdie (26):
  python3-docutil: Extend to nativesdk
  python3-snowballstemmer: Add new recipe
  python3-imagesize: Add new recipe
  python3-alabaster: Add new recipe
  python3-pyasn1: Add from meta-oe/meta-python
  python3-certifi: Add from meta-oe/meta-python
  python3-chardet: Add from meta-oe/meta-python
  python3-ndg-httpsclient: Add from meta-oe/meta-python
  python3-pyopenssl: Add from meta-oe/meta-python
  python3-pysocks: Add from meta-oe/meta-python
  python3-pytest-runner: Add from meta-oe/meta-python
  python3-requests: Add from meta-oe/meta-python
  python3-urllib3: Add from meta-oe/meta-python
  python3-babel: Add recipe from meta-oe/meta-python
  python3-sphinxcontrib-qthelp: Add new recipe
  python3-sphinxcontrib-devhelp: Add new recipe
  python3-sphinxcontrib-htmlhelp: Add new recipe
  python3-sphinxcontrib-serializinghtml: Add new recipe
  python3-sphinxcontrib-jsmath: Add new recipe
  python3-sphinxcontrib-applehelp: add new recipe
  python3-sphinx-rtd-theme: Add new recipe
  python3-sphinx: Add a new recipe
  python3: Add missing HOMEPAGE entries
  maintainers.inc: Add new python recipes
  Add buildtools-docs-tarball recipe
  buildtools-docs-tarball: Add test for building documentation using
    sphinx

 meta/conf/distro/include/maintainers.inc      | 24 +++++++++++++-
 .../lib/oeqa/sdk/buildtools-docs-cases/README |  2 ++
 .../oeqa/sdk/buildtools-docs-cases/build.py   | 17 ++++++++++
 .../meta/buildtools-docs-tarball.bb           | 18 +++++++++++
 meta/recipes-core/meta/buildtools-tarball.bb  |  5 ++-
 .../recipes-devtools/python/python-pyasn1.inc | 31 +++++++++++++++++++
 .../python/python3-alabaster_0.7.12.bb        | 11 +++++++
 .../python/python3-babel_2.9.1.bb             | 26 ++++++++++++++++
 .../python/python3-certifi_2021.10.8.bb       | 14 +++++++++
 .../python/python3-chardet_4.0.0.bb           | 24 ++++++++++++++
 .../python/python3-docutils_0.18.1.bb         |  2 +-
 .../python/python3-imagesize_1.2.0.bb         | 11 +++++++
 .../python/python3-ndg-httpsclient_0.5.1.bb   | 31 +++++++++++++++++++
 .../python/python3-pyasn1/run-ptest           |  3 ++
 .../python/python3-pyasn1_0.4.8.bb            |  2 ++
 .../python/python3-pyopenssl_22.0.0.bb        | 23 ++++++++++++++
 .../python/python3-pysocks_1.7.1.bb           | 20 ++++++++++++
 .../python/python3-pytest-runner_5.3.1.bb     | 16 ++++++++++
 .../python/python3-requests_2.27.1.bb         | 25 +++++++++++++++
 .../python/python3-snowballstemmer_2.2.0.bb   | 13 ++++++++
 .../python/python3-sphinx-rtd-theme_0.5.0.bb  | 21 +++++++++++++
 .../python/python3-sphinx_4.4.0.bb            | 22 +++++++++++++
 .../python3-sphinxcontrib-applehelp_1.0.2.bb  | 12 +++++++
 .../python3-sphinxcontrib-devhelp_1.0.2.bb    | 12 +++++++
 .../python3-sphinxcontrib-htmlhelp_2.0.0.bb   | 12 +++++++
 .../python3-sphinxcontrib-jsmath_1.0.1.bb     | 12 +++++++
 .../python3-sphinxcontrib-qthelp_1.0.3.bb     | 12 +++++++
 ...on3-sphinxcontrib-serializinghtml_1.1.5.bb | 12 +++++++
 .../python/python3-urllib3_1.26.8.bb          | 22 +++++++++++++
 29 files changed, 452 insertions(+), 3 deletions(-)
 create mode 100644 meta/lib/oeqa/sdk/buildtools-docs-cases/README
 create mode 100644 meta/lib/oeqa/sdk/buildtools-docs-cases/build.py
 create mode 100644 meta/recipes-core/meta/buildtools-docs-tarball.bb
 create mode 100644 meta/recipes-devtools/python/python-pyasn1.inc
 create mode 100644 meta/recipes-devtools/python/python3-alabaster_0.7.12.bb
 create mode 100644 meta/recipes-devtools/python/python3-babel_2.9.1.bb
 create mode 100644 meta/recipes-devtools/python/python3-certifi_2021.10.8.bb
 create mode 100644 meta/recipes-devtools/python/python3-chardet_4.0.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-imagesize_1.2.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
 create mode 100644 meta/recipes-devtools/python/python3-pyasn1/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb
 create mode 100644 meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-pysocks_1.7.1.bb
 create mode 100644 meta/recipes-devtools/python/python3-pytest-runner_5.3.1.bb
 create mode 100644 meta/recipes-devtools/python/python3-requests_2.27.1.bb
 create mode 100644 meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-sphinx-rtd-theme_0.5.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-sphinx_4.4.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb
 create mode 100644 meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb
 create mode 100644 meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb
 create mode 100644 meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb
 create mode 100644 meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb
 create mode 100644 meta/recipes-devtools/python/python3-urllib3_1.26.8.bb

-- 
2.32.0


