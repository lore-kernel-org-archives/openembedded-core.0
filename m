Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8040EF48DE
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 08:10:20 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67359.1770970219599996692
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 00:10:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=aWOfNo1c;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4837584120eso841155e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 00:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770970217; x=1771575017; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/E8A1PAM6yE9E5lIaqVPc41Z/7gH8fLOnoDcV8d+BYk=;
        b=aWOfNo1cS6vzGILSI8ACX5ajAfhflS3clOSMiC9/agTCiFJ/erq0oI/xB6nqGNl1il
         yHJJJfv8WQ9APmTc1cccoF2L467A3dZLRKQIdyolAJNavyZXkwA2bvKPDWcP6eu0tGba
         7yghxXCG1yKRLEFUsHU3ELvEZCW1kfsWxs8FI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770970217; x=1771575017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/E8A1PAM6yE9E5lIaqVPc41Z/7gH8fLOnoDcV8d+BYk=;
        b=laM577tF9xgzginancvuduZMSy2BBdA8krxv/4kC1PeRhuwKA9iIjtTexMsYf9dPlE
         eblzR61Cqbvq2Ec0eQG4EJtH2gTNC5BxKQd78X0G0TstJC6GXvGog8VXvtRZzGCeFUu9
         RDROCGFTntBNVz5oN0BKvR6+fCfz9BnKyJZYPXMVPaxbEL2qg+lkws44x52DZ6mkwGMS
         bbhuD0zpIW7u0w0C6KsGqIjJoI9n4wIJPkO3WzFnkHHSJlT4BVlaC6M25e7AGvK6LScN
         kmv4NRwvFox7QIAmgHqZ/rjksKxT4qj4IOhfDhiR8bukBpxUrmtbiIgrrUGvHDPXBRp6
         mY0g==
X-Gm-Message-State: AOJu0YzueGhKtygubtVveu1xIdalPWRGTCUeakziSjNyLB3pobtFrk+7
	eLV63iKJzi+J16B949Q4QOrXBh7BdOtSlJw2uct4beP7dqfoDRDgwIjhEnmn7uhEHJalTTM7zUo
	cT5A6
X-Gm-Gg: AZuq6aKsOdnHGBZlxEFj9Kv6Xahtg1AU/YJm/jutcwjj24ea+hbE9hwmcgM7RvFHyoL
	AZwSAJ8FXfeVEAxz6xekiL74RywACVFX077rgOSDmvwwu4pYLfBNT7mJCoFI/CuzkjcBlXXkiQk
	zRSvMKi2i6J8jVwPZVzointRtm7nIGleZsWwhFxJsJKHnp/oqTAhZg/fIojAyRD0mV3SDiTCr2K
	9oU1APkQUrBbLP6F6VztMkUwqX+YJfu0Vu5iRoalIeygNyJ0AREipR9YVeCQ0ugRUkbn9OtdbTf
	F0toDMH2WWQGpAv4a0EpcXJF/J3llAxDNzA8Qy7FF62p6I8CQOqEsV6Dql9LP56drh0fmO+vGg6
	LTiKbdCu8EPMFj+VpdP/glF6M8izn/EYQQXzzzSrMap3EZwLKHDSWwQsYDJIRCZLWrMLAQchfSL
	+NGP9AKDQfSsLxwupo4KiBYZOOXhONkeOap9GUoAXlvMTt3yhcwjllu8P+gFcmQr774ncOUGORq
	wbMqlIJKO2rgCh4rMkgL5exusg=
X-Received: by 2002:a05:600c:4746:b0:471:114e:5894 with SMTP id 5b1f17b1804b1-48373a565d0mr13672065e9.25.1770970216807;
        Fri, 13 Feb 2026 00:10:16 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00d6f202ec534aee64.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:d6f2:2ec:534a:ee64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-437969fd36dsm3590815f8f.0.2026.02.13.00.10.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 00:10:16 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 00/19] Patch review
Date: Fri, 13 Feb 2026 09:08:18 +0100
Message-ID: <cover.1770968514.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 08:10:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231082

Please review this set of changes for whinlatter and have comments back by
end of day Monday, February 16.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3205
Note: The only difference between 198bfb003b5 (this build) and ea633ee08
(this review) is that I added cherry-pick info in some commits (IMHO, it
is not worth restarting an a-full for this. But you can ask for it if
you want)

The following changes since commit 000a044d285d93ded3280f27360165c943bb5d7e:

  inetutils: patch CVE-2026-24061 (2026-02-10 21:15:17 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/whinlatter-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/whinlatter-nut

for you to fetch changes up to ea633ee08638624e18ec14ca69ace3a72b498a31:

  devtool: deploy: Reset PATH after strip_execs (2026-02-12 23:17:04 +0000)

----------------------------------------------------------------

Adarsh Jagadish Kamini (1):
  avahi: Backport fix CVE-2025-68276

Aleksandar Nikolic (1):
  scripts/install-buildtools: Update to 5.3.1

Amaury Couderc (2):
  avahi: patch CVE-2025-68468
  avahi: patch CVE-2025-68471

Ankur Tyagi (3):
  mobile-broadband-provider-info: upgrade 20250613 -> 20251101
  avahi: patch CVE-2026-24401
  vim: ignore CVE-2025-66476

Bruce Ashfield (2):
  linux-yocto/6.12: update to v6.12.69
  linux-yocto/6.12: update CVE exclusions (6.12.69)

Dragomir, Daniel (2):
  wic/engine: fix copying directories into wic image with ext* partition
  oeqa/selftest/wic: test recursive dir copy on ext partitions

Hongxu Jia (2):
  webkitgtk: workaround compile failure for large debug symbols
  webkitgtk: upgrade 2.50.0 -> 2.50.4

Paul Barker (2):
  devtool: deploy: Run pseudo with correct PATH
  devtool: deploy: Reset PATH after strip_execs

Peter Marko (4):
  openssl: upgrade 3.5.4 -> 3.5.5
  ffmpeg: ignore 10 CVEs
  libsndfile1: patch CVE-2025-56226
  go: upgrade 1.25.6 -> 1.25.7

 .../distro/include/yocto-space-optimize.inc   |     3 -
 meta/lib/oeqa/selftest/cases/wic.py           |    65 +
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |     4 +
 .../avahi/files/CVE-2025-68276.patch          |    68 +
 .../avahi/files/CVE-2025-68468.patch          |    32 +
 .../avahi/files/CVE-2025-68471.patch          |    36 +
 .../avahi/files/CVE-2026-24401.patch          |    74 +
 ...obile-broadband-provider-info_20251101.bb} |     2 +-
 ...ke-history-reporting-when-test-fails.patch |    23 +-
 .../0001-extend-check_cwm-test-timeout.patch  |     2 +-
 .../{openssl_3.5.4.bb => openssl_3.5.5.bb}    |     2 +-
 .../go/{go-1.25.6.inc => go-1.25.7.inc}       |     2 +-
 ...e_1.25.6.bb => go-binary-native_1.25.7.bb} |     6 +-
 ..._1.25.6.bb => go-cross-canadian_1.25.7.bb} |     0
 ...{go-cross_1.25.6.bb => go-cross_1.25.7.bb} |     0
 ...osssdk_1.25.6.bb => go-crosssdk_1.25.7.bb} |     0
 ...runtime_1.25.6.bb => go-runtime_1.25.7.bb} |     0
 .../go/{go_1.25.6.bb => go_1.25.7.bb}         |     0
 .../linux/cve-exclusion_6.12.inc              | 13004 ++++++++++------
 .../linux/linux-yocto-rt_6.12.bb              |     6 +-
 .../linux/linux-yocto-tiny_6.12.bb            |     6 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb |    28 +-
 meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb  |     7 +
 .../libsndfile1/CVE-2025-56226-01.patch       |    36 +
 .../libsndfile1/CVE-2025-56226-02.patch       |    43 +
 .../libsndfile/libsndfile1_1.2.2.bb           |     2 +
 ...able-to-control-macro-__PAS_ALWAYS_I.patch |     8 +-
 ...spection.cmake-prefix-variables-obta.patch |     2 +-
 ...-on-RISCV-https-bugs.webkit.org-show.patch |     4 +-
 .../webkit/webkitgtk/fix-ftbfs-riscv64.patch  |    24 +-
 .../webkitgtk/fix-musl-compilation.patch      |    94 -
 ...ceof_handler_for_32-bit_C-loop_build.patch |   122 -
 .../webkit/webkitgtk/reproducibility.patch    |     2 +-
 .../webkit/webkitgtk/sys_futex.patch          |    11 +-
 .../webkit/webkitgtk/t6-not-declared.patch    |     6 +-
 ...ebkitgtk_2.50.0.bb => webkitgtk_2.50.4.bb} |    15 +-
 meta/recipes-support/vim/vim_9.1.bb           |     2 +
 scripts/install-buildtools                    |     4 +-
 scripts/lib/devtool/__init__.py               |     3 +-
 scripts/lib/devtool/deploy.py                 |     9 +-
 scripts/lib/wic/engine.py                     |    63 +-
 41 files changed, 8390 insertions(+), 5430 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68471.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2026-24401.patch
 rename meta/recipes-connectivity/mobile-broadband-provider-info/{mobile-broadband-provider-info_20250613.bb => mobile-broadband-provider-info_20251101.bb} (91%)
 rename meta/recipes-connectivity/openssl/{openssl_3.5.4.bb => openssl_3.5.5.bb} (99%)
 rename meta/recipes-devtools/go/{go-1.25.6.inc => go-1.25.7.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.25.6.bb => go-binary-native_1.25.7.bb} (79%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.25.6.bb => go-cross-canadian_1.25.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.25.6.bb => go-cross_1.25.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.25.6.bb => go-crosssdk_1.25.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.25.6.bb => go-runtime_1.25.7.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.25.6.bb => go_1.25.7.bb} (100%)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-56226-01.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-56226-02.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/fix-musl-compilation.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/fix_op_instanceof_handler_for_32-bit_C-loop_build.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.50.0.bb => webkitgtk_2.50.4.bb} (93%)


