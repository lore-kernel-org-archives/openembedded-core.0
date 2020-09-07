Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.6533.1599512004283000181
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 13:53:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ekxMKJsp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id a17so16932846wrn.6
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 13:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tMkplPXpQX/Ksv98ZyvTchyvQgTUZb9TeeqvFez275U=;
        b=ekxMKJsp/Kke1Pk3jNW2cFSHreFVgn9fBwQi8MWluaVEjnanCika9pm+OZ5Z2OGuwN
         l0X/qa5nVBXusgk8IgtkTjncY8vlYBtx9KNqkSGTQHTBdfz03LCW6EsFnasY3iAf1R2B
         lAYoQnUJQ0A4NlY8J3PjW+DOaputlgZ24A7d0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tMkplPXpQX/Ksv98ZyvTchyvQgTUZb9TeeqvFez275U=;
        b=O8kEbBDg3lAT8c6LwqY7DlaHV7bZnv56K/qTNdDDY3s2fPk6RfnKAgLNmZbi6tgb2f
         kzYT4t29X3lxt+LKZpZvyXxu2RbPWHCQt2K+F/I2AQHslgPfbkuNlF3IZZ8YwW7WiChk
         fN4tb+zKNKq2iVB//3E162QlxcwyUoUFePr/kaaSmtKwbhRCxgv+HFMpQJqHYy7CvieK
         XJ4jzM1/MUCBD2T60pYvN+8qIaQAFQkbltPDXCM8Q3lugmQGVF/de9/LA2SbgyURBbrx
         ABi2kVbS+k3YZKqSSvItpoWVz8w5ZM8mm0sOLwlM0EMEcMDuN5tJYMG7d0P8O1Lj+ab8
         uBpQ==
X-Gm-Message-State: AOAM532QJ72MA7rYEgRbNCRdb+8+Ve9ckuaTs2JgSKnkG9ijMbDrLO9K
	vnpQ+Rv37YOxdj6PRuZuRsxLzWE+2mDZ2Q==
X-Google-Smtp-Source: ABdhPJzUmxowg1sBQrLq2Q0vuAtOwLgKcsf59fkm9Nm9CoVIs8+JAyjvmt19eJqDSGP+xtiPnA3yLA==
X-Received: by 2002:a5d:660f:: with SMTP id n15mr18652782wru.103.1599512002281;
        Mon, 07 Sep 2020 13:53:22 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (e.4.4.b.0.8.f.4.f.c.f.0.9.0.5.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8509:fcf:4f80:b44e])
        by smtp.gmail.com with ESMTPSA id 92sm32888299wra.19.2020.09.07.13.53.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 13:53:21 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][zeus 00/19] Add buildtools-extended support to zeus
Date: Mon,  7 Sep 2020 21:53:02 +0100
Message-Id: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series backports buildtools-extended-tarball support to zeus
along with various fixes to allow it and automated testing to work
most effectively.

Jeremy Puhlman (3):
  buildtools-extended-tarball: Add libstc++.a
  buildtools-tarball: add nativesdk-python
  buildtools-extended-tarball: add nativesdk-libxcrypt-dev

Khem Raj (1):
  uninative: Upgrade to 2.9

Liwei Song (1):
  buildtools-tarball: export OPENSSL_CONF for openssl

Richard Purdie (11):
  buildtools-tarball: Add an ld.so.conf for nativesdk-binutils
  binutils: Fix relocation of ld.so.conf in nativesdk builds
  binutils: Install non-alternatives links for nativesdk
  files/toolchain-shar-extract.sh: Rework PATH cleaning
  buildtools-extended-tarball: Add locale command
  glibc: Update nativesdk locale relocation patch
  oeqa/testsdk: Use original PATH
  oeqa/selftest: Ensure buildtools in environment variables isn't
    replaced
  attr: Disable parallel make install
  selftest/signing: Ensure build path relocation is safe
  python3-testtools: Avoid traceback2 module requirement

Steve Sakoman (1):
  buildtools-tarball: export OPENSSL_CONF in environment setup

Tim Orling (2):
  buildtools-extended-tarball: add recipe with build-essentials
  nativesdk-buildtools-perl-dummy: add dependencies for autoconf and
    automake

 meta/conf/distro/include/yocto-uninative.inc  | 10 +--
 meta/files/toolchain-shar-extract.sh          | 11 +--
 meta/lib/oeqa/core/utils/concurrencytest.py   |  2 +-
 meta/lib/oeqa/sdkext/testsdk.py               |  7 +-
 meta/lib/oeqa/selftest/cases/signing.py       |  4 +-
 ...Make-relocatable-install-for-locales.patch | 35 +++++++-
 .../meta/buildtools-extended-tarball.bb       | 36 +++++++++
 meta/recipes-core/meta/buildtools-tarball.bb  |  6 ++
 .../meta/nativesdk-buildtools-perl-dummy.bb   |  3 +
 .../binutils/nativesdk-relocation.patch       | 80 +++++++++++++++++++
 .../binutils/binutils_2.32.bb                 |  5 ++
 .../python3-testtools/no_traceback2.patch     | 23 ++++++
 .../python/python3-testtools_2.3.0.bb         |  2 +
 meta/recipes-support/attr/attr_2.4.47.bb      |  3 +
 14 files changed, 203 insertions(+), 24 deletions(-)
 create mode 100644 meta/recipes-core/meta/buildtools-extended-tarball.bb
 create mode 100644 meta/recipes-devtools/binutils/binutils/nativesdk-relocation.patch
 create mode 100644 meta/recipes-devtools/python/python3-testtools/no_traceback2.patch

-- 
2.25.1

