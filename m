Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6310C31D97
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 12:27:25 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.8979.1720096040301687027
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 05:27:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=T4b1zRWm;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-75e15a48d6aso359994a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 05:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720096039; x=1720700839; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=EUVvTo4HpuHGrQLmoTq7bNFaMxakGDB9S0zRA6T0ql0=;
        b=T4b1zRWmwTt8H2lFVXZZzVFx2nu9C3hRZUvIl0zwSF3sCdx7ytFJ0KuYRx3AsQz0Je
         yha8QaEpCmMfJLesexjzoI9/bZdD1mQV0/wwfaig1hLnn8hXIyVQjpWuQzsfi840cPWs
         YOOoxmcBJE4GjweqCadycYYGkgn0mrPKRJ1KqlgLDjeh++6Q0yXZv5cEhUKoSpLq6og+
         nYIZKQzJ9STevJZkf2tmmsPQyVLZk/275tUklwoGCUE1HiZ+4s+QLpZZpRp+pkzxJ8s9
         zm+AXXrL38RDdoD7pUbJFgKRH6cSLSpBPCifAgh65e9/mmNlZoYWf+nKjSveebhtTSGV
         25fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720096039; x=1720700839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EUVvTo4HpuHGrQLmoTq7bNFaMxakGDB9S0zRA6T0ql0=;
        b=RQD/5DKzy+SBXTiECD9tuj2hHMgMo+Hu1DCt5ui1SHqFq4IjsGg4m2UeFTAnt9OXLs
         RvpJxYcJ1fCv4DtYqM90OxLePd7J1iXt54NmxGzZl4IcLOJDFq9NaNErLtjVmdT80LJj
         QT9VCvKpGaHV/U8Hjls0rBzOwNTpd9nwO7lAVtzycnYs7kajMACd233Kf/Eli/R3LoTH
         1gBHjz+gfPrTgmrZKTBKPLoae0um2Y8pHXN1HwRXN2DnrlVCogfBYYLlc11ewXzz8dEA
         wq6Fy9sW9fg1fkJaNehrIChYGsD6yAu3I3OV8igzSZVxPhzrUaXke5qHQVfd+Pt8FK/f
         3kwQ==
X-Gm-Message-State: AOJu0Yx6E0S9yKUVftEEBxaF+1yAeSVprX7k/pkfPXVSPWSJM+5y8+3P
	cef0Lz62GSjcSeRGvdewN2MdHcLKvNq/ztkaB/E2eg5Q0DYYuKV99MouXwJWPa2xrC4o1630hUj
	x
X-Google-Smtp-Source: AGHT+IEl724KEc2iYp+isBWtht1wBMxj/z4M04vGByNjHKuyz/cwUnjtEOh46nK8X3PzxNx4W8RApw==
X-Received: by 2002:a05:6a20:3943:b0:1bd:25bd:ef6a with SMTP id adf61e73a8af0-1c0cc74b758mr1599070637.22.1720096039225;
        Thu, 04 Jul 2024 05:27:19 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb1c79682csm29416075ad.8.2024.07.04.05.27.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 05:27:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/21] Patch review
Date: Thu,  4 Jul 2024 05:26:52 -0700
Message-Id: <cover.1720095886.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 12:27:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201543

Please review this set of changes for scarthgap and have comments back by
end of day Monday, July 8

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7104

The following changes since commit 9abcb18014020804738dfc7d278d7097679f4d19:

  classes/create-spdx-2.2: Fix SPDX Namespace Prefix (2024-06-28 06:28:58 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Antonin Godard (1):
  devtool: ide-sdk: correct help typo

Archana Polampalli (1):
  gstreamer: upgrade 1.22.11 -> 1.22.12

Bruce Ashfield (3):
  linux-yocto/6.6: update to v6.6.34
  linux-yocto/6.6: update to v6.6.35
  linux-yocto/6.6: fix AMD boot trace

Deepthi Hemraj (1):
  llvm: Fix CVE-2024-0151

Guðni Már Gilbert (4):
  python3-requests: cleanup RDEPENDS
  python3-setuptools: drop python3-2to3 from RDEPENDS
  python3-bcrypt: drop python3-six from RDEPENDS
  python3-pyopenssl: drop python3-six from RDEPENDS

Hitendra Prajapati (1):
  QEMU: Fix CVE-2024-3446 & CVE-2024-3567

Jose Quaresma (1):
  openssh: fix CVE-2024-6387

Khem Raj (1):
  pcmanfm: Disable incompatible-pointer-types warning as error

Martin Jansa (1):
  rng-tools: ignore incompatible-pointer-types errors for now

Mingli Yu (1):
  ruby: Fix CVE-2023-36617

Richard Purdie (3):
  python3-jinja2: Upgrade 3.1.3 -> 3.1.4
  oeqa/selftest/recipetool: Fix for usrmerge in DISTRO_FEATURES
  oeqa/selftest/devtool: Fix for usrmerge in DISTRO_FEATURES

Ross Burton (1):
  curl: locale-base-en-us isn't glibc-specific

Siddharth Doshi (1):
  OpenSSL: Security fix for CVE-2024-5535

Yi Zhao (1):
  libpam: fix runtime error in pam_pwhistory moudle

 meta/lib/oeqa/selftest/cases/devtool.py       |    2 +
 meta/lib/oeqa/selftest/cases/recipetool.py    |   16 +-
 .../openssh/openssh/CVE-2024-6387.patch       |   27 +
 .../openssh/openssh_9.6p1.bb                  |    1 +
 .../openssl/openssl/CVE-2024-5535_1.patch     |  113 ++
 .../openssl/openssl/CVE-2024-5535_10.patch    |  203 +++
 .../openssl/openssl/CVE-2024-5535_2.patch     |   43 +
 .../openssl/openssl/CVE-2024-5535_3.patch     |   38 +
 .../openssl/openssl/CVE-2024-5535_4.patch     |   82 ++
 .../openssl/openssl/CVE-2024-5535_5.patch     |  176 +++
 .../openssl/openssl/CVE-2024-5535_6.patch     | 1173 +++++++++++++++++
 .../openssl/openssl/CVE-2024-5535_7.patch     |   43 +
 .../openssl/openssl/CVE-2024-5535_8.patch     |   66 +
 .../openssl/openssl/CVE-2024-5535_9.patch     |  271 ++++
 .../openssl/openssl_3.2.2.bb                  |   10 +
 .../llvm/0002-llvm-Fix-CVE-2024-0151.patch    | 1086 +++++++++++++++
 meta/recipes-devtools/llvm/llvm_18.1.5.bb     |    1 +
 .../python/python3-bcrypt_4.1.2.bb            |    1 -
 ...inja2_3.1.3.bb => python3-jinja2_3.1.4.bb} |    8 +-
 .../python/python3-pyopenssl_24.0.0.bb        |    1 -
 .../python/python3-requests_2.31.0.bb         |    6 +-
 .../python/python3-setuptools_69.1.1.bb       |    1 -
 meta/recipes-devtools/qemu/qemu.inc           |    5 +
 .../qemu/qemu/CVE-2024-3446-01.patch          |   73 +
 .../qemu/qemu/CVE-2024-3446-02.patch          |   48 +
 .../qemu/qemu/CVE-2024-3446-03.patch          |   47 +
 .../qemu/qemu/CVE-2024-3446-04.patch          |   52 +
 .../qemu/qemu/CVE-2024-3567.patch             |   48 +
 .../ruby/ruby/CVE-2023-36617_1.patch          |   56 +
 .../ruby/ruby/CVE-2023-36617_2.patch          |   52 +
 meta/recipes-devtools/ruby/ruby_3.2.2.bb      |    2 +
 ...x-passing-NULL-filename-argument-to-.patch |   69 +
 meta/recipes-extended/pam/libpam_1.5.3.bb     |    1 +
 .../linux/linux-yocto-rt_6.6.bb               |    6 +-
 .../linux/linux-yocto-tiny_6.6.bb             |    6 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  |   28 +-
 ...ols_1.22.11.bb => gst-devtools_1.22.12.bb} |    2 +-
 ...22.11.bb => gstreamer1.0-libav_1.22.12.bb} |    2 +-
 ...1.22.11.bb => gstreamer1.0-omx_1.22.12.bb} |    2 +-
 ...bb => gstreamer1.0-plugins-bad_1.22.12.bb} |    2 +-
 ...b => gstreamer1.0-plugins-base_1.22.12.bb} |    2 +-
 ...b => gstreamer1.0-plugins-good_1.22.12.bb} |    2 +-
 ...b => gstreamer1.0-plugins-ugly_1.22.12.bb} |    2 +-
 ...2.11.bb => gstreamer1.0-python_1.22.12.bb} |    2 +-
 ...bb => gstreamer1.0-rtsp-server_1.22.12.bb} |    2 +-
 ...22.11.bb => gstreamer1.0-vaapi_1.22.12.bb} |    2 +-
 ...1.0_1.22.11.bb => gstreamer1.0_1.22.12.bb} |    2 +-
 meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb    |    2 +
 meta/recipes-support/curl/curl_8.7.1.bb       |    2 +-
 .../rng-tools/rng-tools_6.16.bb               |    4 +
 scripts/lib/devtool/ide_sdk.py                |    2 +-
 51 files changed, 3844 insertions(+), 49 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_1.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_10.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_2.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_3.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_4.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_5.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_6.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_7.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_8.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_9.patch
 create mode 100644 meta/recipes-devtools/llvm/llvm/0002-llvm-Fix-CVE-2024-0151.patch
 rename meta/recipes-devtools/python/{python3-jinja2_3.1.3.bb => python3-jinja2_3.1.4.bb} (79%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3446-01.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3446-02.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3446-03.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3446-04.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3567.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch
 create mode 100644 meta/recipes-extended/pam/libpam/0001-pam_pwhistory-fix-passing-NULL-filename-argument-to-.patch
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.22.11.bb => gst-devtools_1.22.12.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.22.11.bb => gstreamer1.0-libav_1.22.12.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.22.11.bb => gstreamer1.0-omx_1.22.12.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.22.11.bb => gstreamer1.0-plugins-bad_1.22.12.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.22.11.bb => gstreamer1.0-plugins-base_1.22.12.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.22.11.bb => gstreamer1.0-plugins-good_1.22.12.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.22.11.bb => gstreamer1.0-plugins-ugly_1.22.12.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.22.11.bb => gstreamer1.0-python_1.22.12.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.22.11.bb => gstreamer1.0-rtsp-server_1.22.12.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.22.11.bb => gstreamer1.0-vaapi_1.22.12.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.22.11.bb => gstreamer1.0_1.22.12.bb} (97%)

-- 
2.34.1


