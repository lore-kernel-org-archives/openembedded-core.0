Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4900C61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:01:30 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.8773.1678888882340309191
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Ebt2iQXd;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id k2so12239874pll.8
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 07:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678888881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CmQI1dioHPfui6iRnOO+dew8HiDFKZqE38kEcqGrmb8=;
        b=Ebt2iQXdX5ZqA+iUYfYocyfuOrcqpjAwv2pv8Yi2RhguQPaXYGK7Q5GomDKLqVNodS
         y1ogEmA/XoWokF8hlHZJOl5/F3ckv3vIRykppoNoTbSx15W5Z+F7q170K/2zjCjHrzqQ
         TouDTLsM0SkfSaL4pq8C/Wonjfbf5XNjE9FWW7NFkJMXod4a6KrssHxXE1duU2kHSeJK
         KLI+nQHDNl8Wev53ke58eWhmjmLy/V0i6lnr4ivRphKbERHohaeNPkRMSzSo+Zrmlykm
         8tv6EKL6ovrWDIhODmGLIt1P9+w3dfytcgxrRdmRDmGDbehykRTc6lYhdPUtpIcfT/9F
         /IIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678888881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CmQI1dioHPfui6iRnOO+dew8HiDFKZqE38kEcqGrmb8=;
        b=cIgk508PFDlEKe9d7NUxpEYQFguAFnqXaFA8036g97mH2LU+ygxu1L4Gz2iwOKWVRH
         rGVFfMzn0S+D2qI2HVDG7QopSnLLpcDAgD7jG1qpgOSqV52IEeIFqvj4GDsCZr+zy3+m
         pMlYLmX5MkdbGSJdFjHgCAEQfnGA9Jw0mvXBGnJDVlkrgTBOUTnFtcQuNve2M6wbhDBD
         8rdCnbiDgw+YRphfuHXQTZfiGBoxQ9GQ2L4REc3BjD3aKDP1SsJ5rXgjHZt0PoANv8n+
         iWQ1zoSUsXl+LWSdF65Tk1639F7vjkH+EK0BzrANkb6S9NXV9aYRm3OYloE1/gFxiM4M
         mXuQ==
X-Gm-Message-State: AO0yUKUrkPciYGVEdfqj/WxngwcXCtMCoX0IpXrgObfF0GZs3bYnZ8AF
	pMGYfdG4fLva14VGddyfOv6KV4ZC8raYk/y2fPI=
X-Google-Smtp-Source: AK7set/cyStZV3Xk5tGUbV/fn/4Bi2GwCYe8UCDFCrFsASKfVCTAGxHDm/SuhaPkruNFsO7/RORqKA==
X-Received: by 2002:a17:902:fa45:b0:19e:874e:7275 with SMTP id lb5-20020a170902fa4500b0019e874e7275mr2439113plb.23.1678888881139;
        Wed, 15 Mar 2023 07:01:21 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902f54600b001a0432ca99csm3663755plf.269.2023.03.15.07.01.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 07:01:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/22] Patch review
Date: Wed, 15 Mar 2023 04:00:51 -1000
Message-Id: <cover.1678888649.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 14:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178551

Please review this set of patches for kirkstone and have comments back by
end of day Friday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5050

The following changes since commit 9e8cbf46fe6e4e257b76b228de56d4a891199896:

  nghttp2: never build python bindings (2023-03-06 04:10:00 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Bruce Ashfield (3):
  linux-yocto/5.15: update to v5.15.94
  linux-yocto/5.15: update to v5.15.96
  linux-yocto-rt/5.15: update to -rt59

Chee Yang Lee (1):
  tiff: fix multiple CVEs

Ming Liu (1):
  linux: inherit pkgconfig in kernel.bbclass

Narpat Mali (1):
  libmicrohttpd: upgrade 0.9.75 -> 0.9.76

Peter Marko (1):
  systemd: add group sgx to udev package

Poonam (1):
  python3-setuptools-rust-native: Add direct dependency of native
    python3 modules

Richard Purdie (2):
  binutils: Fix nativesdk ld.so search
  oeqa/selftest/prservice: Improve debug output for failure

Ross Burton (2):
  shadow: ignore CVE-2016-15024
  vim: add missing pkgconfig inherit

Shubham Kulkarni (1):
  glibc: Security fix for CVE-2023-0687

Siddharth Doshi (2):
  epiphany: Security fix for CVE-2023-26081
  harfbuzz: Security fix for CVE-2023-25193

Tom Hochstein (2):
  meson: Fix wrapper handling of implicit setup command
  oeqa/sdk: Improve Meson test

Vivek Kumbhar (1):
  gnutls: fix CVE-2023-0361 timing side-channel in the TLS RSA key
    exchange code

Wang Mingyu (3):
  iso-codes: upgrade 4.12.0 -> 4.13.0
  lua: Fix install conflict when enable multilib.
  vala: Fix install conflict when enable multilib.

Xiangyu Chen (1):
  sudo: update 1.9.12p2 -> 1.9.13p3

 meta-selftest/files/static-group              |   1 +
 meta/classes/kernel.bbclass                   |   2 +-
 meta/lib/oeqa/sdk/cases/buildepoxy.py         |   2 +-
 meta/lib/oeqa/selftest/cases/prservice.py     |   2 +-
 .../glibc/glibc/CVE-2023-0687.patch           |  82 ++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 meta/recipes-core/systemd/systemd_250.5.bb    |   2 +-
 ...dk-Search-for-alternative-ld.so.conf.patch |   2 +-
 meta/recipes-devtools/lua/lua_5.4.4.bb        |   3 +
 .../meson/meson/meson-wrapper                 |  17 +-
 .../python3-setuptools-rust-native_1.1.2.bb   |   4 +-
 meta/recipes-devtools/vala/vala.inc           |   5 +-
 meta/recipes-extended/shadow/shadow_4.11.1.bb |   3 +
 ...o.conf.in-fix-conflict-with-multilib.patch |  21 +-
 meta/recipes-extended/sudo/sudo.inc           |   2 +-
 .../{sudo_1.9.12p2.bb => sudo_1.9.13p3.bb}    |   2 +-
 meta/recipes-gnome/epiphany/epiphany_42.4.bb  |   1 +
 .../epiphany/files/CVE-2023-26081.patch       |  90 +++++++++
 .../harfbuzz/CVE-2023-25193-pre1.patch        | 135 +++++++++++++
 .../harfbuzz/harfbuzz/CVE-2023-25193.patch    | 185 ++++++++++++++++++
 .../harfbuzz/harfbuzz_4.0.1.bb                |   4 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb  |   2 -
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto.inc     |   1 -
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +--
 .../libtiff/tiff/CVE-2022-48281.patch         |  26 +++
 .../CVE-2023-0800_0801_0802_0803_0804.patch   | 128 ++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   2 +
 .../gnutls/gnutls/CVE-2023-0361.patch         |  85 ++++++++
 meta/recipes-support/gnutls/gnutls_3.7.4.bb   |   1 +
 ...so-codes_4.12.0.bb => iso-codes_4.13.0.bb} |   2 +-
 ...ttpd_0.9.75.bb => libmicrohttpd_0.9.76.bb} |   2 +-
 meta/recipes-support/vim/vim.inc              |   2 +-
 34 files changed, 799 insertions(+), 56 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2023-0687.patch
 rename meta/recipes-extended/sudo/{sudo_1.9.12p2.bb => sudo_1.9.13p3.bb} (96%)
 create mode 100644 meta/recipes-gnome/epiphany/files/CVE-2023-26081.patch
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193-pre1.patch
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-48281.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-0800_0801_0802_0803_0804.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2023-0361.patch
 rename meta/recipes-support/iso-codes/{iso-codes_4.12.0.bb => iso-codes_4.13.0.bb} (94%)
 rename meta/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.75.bb => libmicrohttpd_0.9.76.bb} (91%)

-- 
2.34.1


