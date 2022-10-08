Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ABCBC433FE
	for <webhook@archiver.kernel.org>; Sat,  8 Oct 2022 23:55:16 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web08.9221.1665273305933021856
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Oct 2022 16:55:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HaKf7chW;
 spf=pass (domain: gmail.com, ip: 209.85.214.170,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id l1so7497898pld.13
        for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Oct 2022 16:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RpAJG9G1tz9zfezKEX+8WEWm5JbwWl4XKFPyWPK6/Vc=;
        b=HaKf7chWEP29WV+POiwi81esgJywixFIXdKpvk+cac3tAQP7mihpm1yHF1CxGIxdE0
         9IhTYmVQCKpE/F2D+tOlhN3TR0oi6FkR4WNMaOV7n7AxtNEQIXjbeOAoI4c8b+Tz8bFH
         dVCgprPv10JJVGnc2SAE5cE7w/SYYLPrbJnphyo7aNmAhm7h2u1LTevw6vRh+srcETaO
         rDO/f+YEfzLdKB41DLOHOzVhWr72Ca2DdetT063uadfLEbviUmLF/hxAVRWQ8bRgLGnA
         DhW8OuH6Z144Lw8DakoEWpbR2IyHNnZ9vWXEOmzgUZSZYKA5O2j9xlU6MkHV1wr/FSVb
         Bo9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RpAJG9G1tz9zfezKEX+8WEWm5JbwWl4XKFPyWPK6/Vc=;
        b=w9WM4grVPs1CMFIkyDhmdEBTBgiLtSNfb+urzmOxYpNPOk7QT7WLZ3FrBHYsSzjUzq
         dgTLGwggVUVr/G1P4no0i0f85Vs3V9o9oxSv738aRZPRKcmO8VVI2tM6ckmVW0in2duc
         DeTre0PF1myiOC7IiQo2+Zh5ilAy2OI7FsnvB+6StelQPEhvxUB1CBX5zbwZGvqJL8ZF
         Qj3up1zWTQtIHLx+CN0wDbbZZTIL7eLYN3Be7rVSvtxHNJHLZpNdiR4R66sa+BJkN49P
         CebNfmg5DYdryVr7OBtsevoXt6+Qj0f75XedpDaTAJ3NDEangHo+WAgsaegrAObZA4TO
         J+Ww==
X-Gm-Message-State: ACrzQf35VbgyDcR4vwwjY4JL4tlwNdhM/0oZ2UtpL8FfoE/8wNxHliT6
	JSfCHSvNefXb1pDBtnvhTsxWh6zRfQM=
X-Google-Smtp-Source: 
 AMsMyM4WKLRHGj9eQpG53AGwO9VAnWFCPeaBNRVpRMg6GhlbaExxvNqWBWPtLP++k2thL4HJQqUxDQ==
X-Received: by 2002:a17:902:ef85:b0:17f:5f55:9425 with SMTP id
 iz5-20020a170902ef8500b0017f5f559425mr12111219plb.135.1665273304682;
        Sat, 08 Oct 2022 16:55:04 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net
 ([2601:1c0:ca00:cea0:170:23ea:e88e:bfb7])
        by smtp.gmail.com with ESMTPSA id
 k11-20020a170902ce0b00b0017f57787a4asm3814710plg.229.2022.10.08.16.55.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Oct 2022 16:55:04 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/10] Post-langdale recipe upgrades
Date: Sat,  8 Oct 2022 16:54:44 -0700
Message-Id: <cover.1665270768.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Oct 2022 23:55:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171538

Partitially with the help of AUH.

Notably:
 - python3-bcrypt now builds Rust extensions
 - python3-pyopenssl drops SSLv2, SSLv3; requires python3-cryptography
   38.0.x
 - python3-cryptography: final deprecation of OpenSSL 1.1.0; dropped in
   39.0.x
 - python3-poetry-core: adds Python 3.11 support

a-quick build:
https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1935

The following changes since commit 3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2:

  ref-manual/faq.rst: update references to products built with OE / Yocto Project (2022-10-07 10:54:26 +0100)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib timo/recipe-upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=timo/recipe-upgrades

Tim Orling (10):
  python3-cryptography: upgrade 37.0.4 -> 38.0.1
  python3-cryptography-vectors: upgrade 37.0.4 -> 38.0.1
  python3-certifi: upgrade 2022.9.14 -> 2022.9.24
  python3-hypothesis: upgrade 6.54.5 -> 6.56.1
  python3-pyopenssl: upgrade 22.0.0 -> 22.1.0
  python3-bcrypt: upgrade 3.2.2 -> 4.0.0
  python3-sphinx: upgrade 5.1.1 -> 5.2.3
  python3-setuptools-rust: upgrade 1.5.1 -> 1.5.2
  python3-iso8601: upgrade 1.0.2 -> 1.1.0
  python3-poetry-core: upgrade 1.0.8 -> 1.3.2

 .../python/python3-bcrypt_3.2.2.bb            |  30 -----
 .../python/python3-bcrypt_4.0.0.bb            |  79 ++++++++++++
 ...2.9.14.bb => python3-certifi_2022.9.24.bb} |   2 +-
 ...=> python3-cryptography-vectors_38.0.1.bb} |   2 +-
 .../0001-Cargo.toml-specify-pem-version.patch |  29 -----
 ....0.4.bb => python3-cryptography_38.0.1.bb} | 113 ++++++++++--------
 ...6.54.5.bb => python3-hypothesis_6.56.1.bb} |   2 +-
 ...8601_1.0.2.bb => python3-iso8601_1.1.0.bb} |   4 +-
 .../python/python3-poetry-core_1.0.8.bb       |  44 -------
 .../python/python3-poetry-core_1.3.2.bb       |  45 +++++++
 ..._22.0.0.bb => python3-pyopenssl_22.1.0.bb} |   2 +-
 ....1.bb => python3-setuptools-rust_1.5.2.bb} |   2 +-
 ...phinx_5.1.1.bb => python3-sphinx_5.2.3.bb} |  25 ++--
 13 files changed, 209 insertions(+), 170 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb
 create mode 100644 meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb
 rename meta/recipes-devtools/python/{python3-certifi_2022.9.14.bb => python3-certifi_2022.9.24.bb} (86%)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_37.0.4.bb => python3-cryptography-vectors_38.0.1.bb} (90%)
 delete mode 100644 meta/recipes-devtools/python/python3-cryptography/0001-Cargo.toml-specify-pem-version.patch
 rename meta/recipes-devtools/python/{python3-cryptography_37.0.4.bb => python3-cryptography_38.0.1.bb} (41%)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.54.5.bb => python3-hypothesis_6.56.1.bb} (91%)
 rename meta/recipes-devtools/python/{python3-iso8601_1.0.2.bb => python3-iso8601_1.1.0.bb} (61%)
 delete mode 100644 meta/recipes-devtools/python/python3-poetry-core_1.0.8.bb
 create mode 100644 meta/recipes-devtools/python/python3-poetry-core_1.3.2.bb
 rename meta/recipes-devtools/python/{python3-pyopenssl_22.0.0.bb => python3-pyopenssl_22.1.0.bb} (86%)
 rename meta/recipes-devtools/python/{python3-setuptools-rust_1.5.1.bb => python3-setuptools-rust_1.5.2.bb} (92%)
 rename meta/recipes-devtools/python/{python3-sphinx_5.1.1.bb => python3-sphinx_5.2.3.bb} (48%)

-- 
2.34.1


