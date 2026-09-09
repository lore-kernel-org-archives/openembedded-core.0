Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62DE1C79FAA
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:10:19 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6108.1788937813952745161
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:10:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Q+jOgLyM;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b965570d7so62063255e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788937812; x=1789542612; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rkvKXGXp/GtzN/RJMRLUQc57WciEk0nJYyunMjsyqIc=;
        b=Q+jOgLyMl8UCvDBAqsnIwFATAL/Q7KGGgMD6A4gdwT1Y4bNMqOAQbUfqegU9Hl5SIo
         ptkq9uZFWR5U29tqXfgFcekA6uWrtuVNlvEcagZ/r3nGjcUelI+VsNzu7WlBraLJShV8
         7BKBkak9y2ZDHnVBEb/APC3H8ucakJRWOoXMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788937812; x=1789542612;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rkvKXGXp/GtzN/RJMRLUQc57WciEk0nJYyunMjsyqIc=;
        b=GCLhPTzncz+WN/YEDOaGR7ai/J62vY0RRQWVxKRVQJOBeNEqUHwDFNnAy0DKy/mX3H
         5oC5OjMr9bJGW+Ie5yEc+gBDX+pUz73A4E2hLYRuO7snF4tJPjlgccvRmVB0thjjCE0A
         4tWfZi0ahtZpnLR5VBduophkqQ9KjBgE3Tdf8C83Qy39TkCwytSuWeAQnbV7CIpzvFU5
         8mmC5W6HK6mNZgZJ3ssQ67dBJFk3UJbdPh0bMEjO1BzLCuSzxkF3Ao9nEZhJK3msnIKr
         csy6dDX5DMZGdpkxhfxPuNKcZbUPezU686Fe9cvI+a1eMyITmB9h+R03oFN8M8gRUxCP
         bmkA==
X-Gm-Message-State: AFuF++m3NNFXBSH73z3TdYHPAn0XwgGzht6HwFGquRx+lPk+Q6pQQS6X
	XMozsiRTowio7S7vk8M3uGwhqTq0mXUqQ8QMyvVtpdVzqEcgCBQyjwtg2W9wJZLWuc7uObxiGni
	lYuCFtKw=
X-Gm-Gg: AYBFou23uUrG12biW81PbTOStEvuoiYUGxy9y3oAZjuj5sWNLO/Zc/VZTydiabdVEeg
	DwmuNbPKX02nWm3tlBhoyq0QFInkiuU400QA486SY1abLTX7vqUzgrmaT0Sa3Vd59b9ebbGohuk
	+bsmItgdWmmBMkeIlMaqOYBaz4y+b7lX3uaMYRgl2+o2klwT7kdEeU8BZVtefKbTgBC9/nKGIZ9
	+KZ+6L4yauvQsi/3vfkxl/6FFzpy2rNIcHHI6GekTdcyvxUjlvzbAbUHEXb3BfIOY007rbFhy4s
	H8BbRh2YVcFD4p394N2Z+iEUQMTIjCHjeg7MQGZ3dZmF3E4xMb39qkBCVwSU+KRb7ACKIEV9UMY
	bz8/xdGeXT/MW5pJWUOqh95m6EGIfzW81Kh0lPch63B6ot03R6mYx9nhWxlWWRdnHALwif9CaXN
	/0Vg4AJEaNo1ETXAJIHwg/YtvogE2PDEfB8i5YEzOzvKog2KGu94HYVOwi4ttx9b5GU0io3ygIJ
	m+KsjCK0v4YjvWkQ7AYoN7n08p49K5L5decSqO+xUJq5KP1Hmyx5D51s4Fpe1tag0s38XaQmgku
	i3lzl+MYaw==
X-Received: by 2002:a05:600c:530d:b0:49c:fc6e:8cae with SMTP id 5b1f17b1804b1-49cfc6e8f24mr279730795e9.18.1788937812075;
        Wed, 09 Sep 2026 00:10:12 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d07a23e85sm337155045e9.5.2026.09.09.00.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:10:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][wrynose 00/40] Pull request (cover letter only)
Date: Wed,  9 Sep 2026 09:09:50 +0200
Message-ID: <cover.1788937639.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:10:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245407

Those are the patches from the last patch review:
https://lore.kernel.org/openembedded-core/cover.1788629392.git.yoann.congal@smile.fr/T/#t
(No review, no change)

Passed a-full on autobuilder:
Some builds failed due to failed access to our infrastructure (Michael
Halstead is looking into it)
* "Compare AB workers and SANITY_TESTED_DISTROS" failed but succeeded in
  a previous run (with no change related to this)
* qemuarm64-armhost retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/8/builds/4608
* qemux86 retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/30/builds/4563
* qemuarmv5 retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/80/builds/4409
* oe-selftest-armhost: Bitbake Selftest failed but that particular
    bitbake commit succeeded in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/23/builds/4798

The following changes since commit 00c66f1d38a234f7738c2eb8fafa41b4f057a865:

  pseudo: 1.9.10 -> 1.9.11 (2026-08-28 17:24:32 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-next

for you to fetch changes up to 31def396136be047e10c507a50264aad52ba6b0f:

  scripts/install-buildtools: Update to 6.0.3 (2026-09-04 16:21:55 +0200)

----------------------------------------------------------------

Abhishek Bachiphale (1):
  perl: fix CVE-2026-42496 and CVE-2026-42497

Darsh Kelaiya (4):
  python3-git: fix CVE-2026-42284
  python3-git: fix CVE-2026-42215
  python3-git: fix CVE-2026-44243
  python3-git: fix CVE-2026-44244

Deepak Rathore (2):
  python3-cryptography: backport stray file install fix
  qemu: guard RESOLVE_CACHED strace flag

Devansh Patel (1):
  apt: mark CVE-2011-3374 as fixed-version

Esa Jaaskela (1):
  volatile-binds: order systemd-timesyncd after /var/lib

Hetvi Thakar (2):
  python3-idna: Fix CVE-2026-45409
  libssh2: Fix CVE-2026-58051

Jaipaul Cheernam (3):
  expat: set CVE_STATUS for CVE-2026-72522
  util-linux: Fix CVE-2026-3184
  python3: upgrade 3.14.6 -> 3.14.7

Jakub Szczudlo (Nokia) (2):
  gnutls: fix for CVE-2026-42011
  gnutls: fix CVE-2026-42010

Peter Marko (5):
  alsa-lib: patch CVE-2026-56109
  libevent: set status for CVE-2026-63380
  go: upgrade 1.26.5 -> 1.26.6
  util-linux: set status for CVE-2026-13595
  go: upgrade 1.26.6 -> 1.26.7

Richard Purdie (2):
  python3-mako: upgrade 1.3.10 -> 1.3.12
  python3-click: upgrade 8.3.1 -> 8.3.3

Ross Burton (1):
  libevent: upgrade 2.1.12 -> 2.1.13

Sowmya Sathram (1):
  binutils: stable 2.46 branch updates

Tafil Avdyli (2):
  python3: add missing pyc files to core
  python3: fix stringold cache files

Tim Orling (9):
  python3-babel: fix CVE_PRODUCT
  python3-pycryptodome: fix CVE_PRODUCT
  python3-dbusmock: fix CVE_PRODUCT
  python3-wheel: fix CVE_PRODUCT
  python3-click: fix CVE_PRODUCT
  python3-attrs: fix CVE_PRODUCT
  python3-numpy: fix CVE_PRODUCT
  python3-pycryptodomex: fix CVE_PRODUCT
  python3-git: fix CVE_PRODUCT

Vijay Anusuri (3):
  libxfont2: Fix CVE-2026-56001
  libxfont2: Fix CVE-2026-56002
  libxfont2: Fix CVE-2026-56003

Yoann Congal (1):
  scripts/install-buildtools: Update to 6.0.3

 meta/recipes-core/expat/expat_2.7.5.bb        |   3 +
 meta/recipes-core/util-linux/util-linux.inc   |   3 +
 .../util-linux/util-linux/CVE-2026-3184.patch |  61 ++++++++
 .../volatile-binds/volatile-binds.bb          |   9 +-
 meta/recipes-devtools/apt/apt_3.0.3.bb        |   3 +
 .../binutils/binutils-2.46.inc                |   2 +-
 .../go/{go-1.26.5.inc => go-1.26.7.inc}       |   2 +-
 ...e_1.26.5.bb => go-binary-native_1.26.7.bb} |   6 +-
 ..._1.26.5.bb => go-cross-canadian_1.26.7.bb} |   0
 ...{go-cross_1.26.5.bb => go-cross_1.26.7.bb} |   0
 ...osssdk_1.26.5.bb => go-crosssdk_1.26.7.bb} |   0
 ...runtime_1.26.5.bb => go-runtime_1.26.7.bb} |   0
 .../go/{go_1.26.5.bb => go_1.26.7.bb}         |   0
 .../perl/files/CVE-2026-42496.patch           |  99 ++++++++++++
 meta/recipes-devtools/perl/perl_5.42.0.bb     |   1 +
 .../python/python3-attrs_25.4.0.bb            |   2 +
 .../python/python3-babel_2.18.0.bb            |   2 +
 ...-click_8.3.1.bb => python3-click_8.3.3.bb} |   4 +-
 .../python/python3-cryptography.bb            |   1 +
 ...lling-stray-files-into-site-packages.patch |  55 +++++++
 .../python/python3-dbusmock_0.38.1.bb         |   2 +
 .../python3-git/CVE-2026-42215_p1.patch       |  60 ++++++++
 .../python3-git/CVE-2026-42215_p2.patch       |  45 ++++++
 .../python/python3-git/CVE-2026-42284.patch   |  36 +++++
 .../python3-git/CVE-2026-44243_p1.patch       | 134 +++++++++++++++++
 .../python3-git/CVE-2026-44243_p2.patch       |  83 +++++++++++
 .../python3-git/CVE-2026-44244_p1.patch       | 102 +++++++++++++
 .../python3-git/CVE-2026-44244_p2.patch       |  28 ++++
 .../python/python3-git_3.1.43.bb              |  10 ++
 .../python3-idna/CVE-2026-45409_p1.patch      |  75 ++++++++++
 .../python3-idna/CVE-2026-45409_p2.patch      |  48 ++++++
 .../python3-idna/CVE-2026-45409_p3.patch      |  72 +++++++++
 .../python/python3-idna_3.11.bb               |   4 +
 ...-mako_1.3.10.bb => python3-mako_1.3.12.bb} |   2 +-
 .../python/python3-numpy_2.4.3.bb             |   2 +
 .../python/python3-pycryptodome_3.23.0.bb     |   1 +
 .../python/python3-pycryptodomex_3.23.0.bb    |   2 +
 .../python/python3-wheel_0.46.3.bb            |   2 +
 ...shebang-overflow-on-python-config.py.patch |   6 +-
 ...e-stdin-I-O-errors-same-way-as-maste.patch |   4 +-
 ...-use-prefix-value-from-build-configu.patch |   7 +-
 ...-qemu-wrapper-when-gathering-profile.patch |   9 +-
 ...est_sysconfig-for-posix_user-purelib.patch |   4 +-
 .../0001-prefer-valid-entrypoints.patch       |   2 +-
 ...g.py-use-platlibdir-also-for-purelib.patch |   4 +-
 ...le.py-correct-the-test-output-format.patch |   6 +-
 .../python/python3/CVE-2026-11940.patch       |  67 ---------
 .../python/python3/CVE-2026-11972.patch       |  61 --------
 .../python/python3/makerace.patch             |   6 +-
 .../python/python3/python3-manifest.json      |  11 +-
 .../python/python3/valid-dists.patch          |   2 +-
 .../{python3_3.14.6.bb => python3_3.14.7.bb}  |   7 +-
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 ...-if-RESOLVE_CACHED-flag-is-defined-b.patch |  38 +++++
 .../xorg-lib/libxfont2/CVE-2026-56001.patch   |  75 ++++++++++
 .../xorg-lib/libxfont2/CVE-2026-56002.patch   | 138 +++++++++++++++++
 .../xorg-lib/libxfont2/CVE-2026-56003.patch   | 114 ++++++++++++++
 .../xorg-lib/libxfont2_2.0.7.bb               |   5 +
 .../alsa/alsa-lib/CVE-2026-56109.patch        |  33 ++++
 .../alsa/alsa-lib_1.2.15.3.bb                 |   1 +
 .../gnutls/gnutls/CVE-2026-42010.patch        |  41 +++++
 .../gnutls/gnutls/CVE-2026-42011_p1.patch     |  43 ++++++
 .../gnutls/gnutls/CVE-2026-42011_p2.patch     | 141 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   3 +
 ....c-patch-out-tests-that-require-a-wo.patch |   8 +-
 ...ncrease-default-timeval-tolerance-50.patch |  10 +-
 ...-monotonic_prc_fallback-as-retriable.patch |  11 +-
 ...ts-are-marked-failed-only-when-all-a.patch |   9 +-
 .../libevent/Makefile-missing-test-dir.patch  |  14 +-
 ...{libevent_2.1.12.bb => libevent_2.1.13.bb} |   4 +-
 .../libssh2/libssh2/CVE-2026-58051.patch      |  34 +++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |   1 +
 scripts/install-buildtools                    |   4 +-
 73 files changed, 1679 insertions(+), 206 deletions(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-3184.patch
 rename meta/recipes-devtools/go/{go-1.26.5.inc => go-1.26.7.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.26.5.bb => go-binary-native_1.26.7.bb} (80%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.26.5.bb => go-cross-canadian_1.26.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.26.5.bb => go-cross_1.26.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.26.5.bb => go-crosssdk_1.26.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.26.5.bb => go-runtime_1.26.7.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.26.5.bb => go_1.26.7.bb} (100%)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-42496.patch
 rename meta/recipes-devtools/python/{python3-click_8.3.1.bb => python3-click_8.3.3.bb} (87%)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/0002-Fix-installing-stray-files-into-site-packages.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-42215_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-42215_p2.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-42284.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-44243_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-44243_p2.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-44244_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-44244_p2.patch
 create mode 100644 meta/recipes-devtools/python/python3-idna/CVE-2026-45409_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-idna/CVE-2026-45409_p2.patch
 create mode 100644 meta/recipes-devtools/python/python3-idna/CVE-2026-45409_p3.patch
 rename meta/recipes-devtools/python/{python3-mako_1.3.10.bb => python3-mako_1.3.12.bb} (88%)
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-11940.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-11972.patch
 rename meta/recipes-devtools/python/{python3_3.14.6.bb => python3_3.14.7.bb} (98%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0012-linux-user-Check-if-RESOLVE_CACHED-flag-is-defined-b.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56001.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56002.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56003.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-56109.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42010.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42011_p1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42011_p2.patch
 rename meta/recipes-support/libevent/{libevent_2.1.12.bb => libevent_2.1.13.bb} (92%)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-58051.patch


