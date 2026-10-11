Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47FD8CA9EC9
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 09:08:11 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23918.1791709686678401762
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 02:08:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vebSvmA0;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so12412705e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 02:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791709685; x=1792314485; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3WTmB8RhhmV2/Wb8msL0hbYtGV5WasKZQlA7TTOMNpM=;
        b=vebSvmA0wxO3mgE5mrSlx+5T8mXRYLWhisIVJKZv26rvN/Ag2IXPG8xtHw0IASWoCQ
         Cba8j5cV1N07NZ64lNRUQvLJ3yKAkgjbhk8WsNk6pjFPmlX+kc5sePIrOb7Px58ROZhG
         oJZUSzQA6WfeMJ0HkuPcmrYElcGpUCiAA0QJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791709685; x=1792314485;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3WTmB8RhhmV2/Wb8msL0hbYtGV5WasKZQlA7TTOMNpM=;
        b=iU6iAnXk7SPRl6BF/cO4ZytCArulUWBvSvnuOKpmPxmQAqtIm5TViPaGGMpFJRToUT
         m5Am846t39/Tk7v9/kTGDmInrD8ZkkaeE2+hz0N16L9mhllm5rIU31/090urGg3aprsX
         nfs+O3AYA5XK2udtNZje/w4jUHTH5BllWIM014OEPtfJlongnorSLKNrKNvYk99DMaes
         li918LYAC1OIcpYFRG19bH+apstf0PgpqFcGZ05zv6x0VrTmTiKE2gH0Vbk2/BwNMckZ
         LaBEN4Gn4gfOqnU4+OCjVgv/u6PaFVJiogsAOoeUbZG1wZTx9X+/ZEd2y+d2WJR34MG1
         LEjQ==
X-Gm-Message-State: AFq9FYIFsOo3VoS88uTe+qvMZmNZwWghzpYSDVL1qRB0Qk5PhR1fTOHe
	A2BHP1xpsLMJ7Y0QaL7LdnwfOLFf/jdmRscFqVQQyNwbiMn8ry9B+InF+CLEWxVH9ksr+NXf6zy
	WDwpLuWQ=
X-Gm-Gg: AYBFou0m/fJJJZgl+BC58tO0RFDVnQd6Flkej8nb+aWQHuNRcqd4aU4k58fd2FLhJxx
	r1ZAUcO+abvQFQnMpZvLZPQTVgStPu0mzP84guDc0h/MfnizzPQoHJFQjsQSprG8Ob47jJS71dw
	hwcNZHN/QT1BfYc0ZQ7dsBoTFyJ0jWKf8iQsQQlYgCpWp9irHGN196IXCnWrecItUlFl9Rju4xv
	/Lb4Y6zlsmRqMjU4QTbDusOoNdvBgGlgCSa14Oi97pYh31OEUnWAPoNNUYDW/tKtSjtlE55ao0z
	XEaP0Gi6i/B+7AL6Ueg1q66WugIE6gLKRq4lHvyGw4Qlnl/IYy39J0pf+ccO8fWC3yxDpMRF4LG
	HStTRh9H9ejp0DBPweNnbu2fmwL+qdM6BhXizc0BlxmlLY6dIdlKKOPaO1EUFniTBAzbnQlxD/H
	4QQoHIYJMnCn129vGkGLom3mcxNpdJsquodwlP5N2dfiN+si75hBlWqQPotFmTbjGba96rYHarN
	l3XTEByLMQD58jnbjMjyQ0cdgRcQguuXDZ98nRpX6JmuNr8FEl/g574rKBy+m1lGTIXSmep/Q==
X-Received: by 2002:a05:600c:524a:b0:49b:9202:6f80 with SMTP id 5b1f17b1804b1-4a18e4a4f2amr119662865e9.6.1791709684748;
        Sun, 11 Oct 2026 02:08:04 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf214a1sm227036635e9.7.2026.10.11.02.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 02:08:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][blacksail 00/18] Pull request (cover letter only)
Date: Sun, 11 Oct 2026 11:07:50 +0200
Message-ID: <cover.1791709419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 09:08:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247570

Those are the patches from the last patch review:
https://lore.kernel.org/all/cover.1791318909.git.yoann.congal@smile.fr/

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4887
* qemuriscv64-ptest failed on:
  * 16422 – AB-INT PTEST RISCV64: python3 ptest failure (python3-more-itertools)
  * 15896 – AB-INT PTEST RISCV64: e2fsprogs ptest failure
  ... both known AB-INT issues that a similar branch passed:
      https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2553
* Since this test, I dropped "tclibc-baremetal.inc: fix gcc-cross EXTRA_OECONF" per review.
I don't think this is worth restarting an a-full run for this patch
removal.

The following changes since commit 419c1b0f1ed0e3ce22b1022061f763d007883121:

  build-appliance-image: Update to blacksail head revisions (2026-09-29 20:31:43 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/blacksail-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/blacksail-next

for you to fetch changes up to e182a0c4b91fd459c1f9dece0c7c23f7f9eaa7ab:

  recipes-support/gnutls: disable slow tests for RISCV64 (2026-10-06 22:31:54 +0200)

----------------------------------------------------------------

Ankur Tyagi (1):
  tzdata/tzcode-native: upgrade 2026d -> 2026e

Bhavikkumar Girishbhai Ronvelia (1):
  libpcre2-ptest: add testoutput3C for locale variant

Bruce Ashfield (2):
  linux-yocto/6.18: update to v6.18.54
  linux-yocto/7.2: update to v7.2.8

Jaipaul Cheernam (2):
  perlcross: Upgrade 1.6.4 -> 1.6.5
  perlcross: drop redundant LDFLAGS-when-linking-libperl patch

Jinwang Li (1):
  bluez5: fix obexd/pbap u128_to_string skipping data[4]

Joao Marcos Costa (1):
  recipes-support/gnutls: disable slow tests for RISCV64

Khem Raj (1):
  go: skip internal/cgrouptest when cpu.max is not available

Mathieu Dubois-Briand (3):
  libpcre2: upgrade 10.48 -> 10.49
  python3-pytz: upgrade 2026.3.post1 -> 2026.4
  python3-hypothesis: upgrade 6.168.1 -> 6.168.3

Peter Marko (1):
  alsa-lib: patch CVE-2026-90781

Pratik Farkase (1):
  util-linux: update flock test patch Upstream-Status to Backport

Richard Purdie (1):
  python3-hypothesis: upgrade 6.168.0 -> 6.168.1

Ross Burton (1):
  elfutils: fix handling of DWARF5 compilation units

Sunil Dora (1):
  opkg: take the default architecture from the target CPU

Yoann Congal (1):
  opkg: update Upstream-Status for a merged patch

 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 ...p-Fix-u128_to_string-skipping-data-4.patch |  33 ++++
 ...ncrease-wait-for-flock-child-timeout.patch |   2 +-
 .../elfutils/elfutils_0.196.bb                |   1 +
 .../elfutils/files/srcfiles.patch             |  65 +++++++
 meta/recipes-devtools/go/go-1.27.1.inc        |   1 +
 ...est-skip-when-cpu.max-is-not-availab.patch |  39 ++++
 ...the-default-architecture-from-the-ta.patch |  45 +++++
 meta/recipes-devtools/opkg/opkg_0.10.0.bb     |   1 +
 ...ile-check-the-file-if-patched-or-not.patch |   2 +-
 .../files/0001-patches-for-perl-5.44.0.patch  | 110 -----------
 ...oss-add-LDFLAGS-when-linking-libperl.patch |  24 ---
 ...Add-configure-checks-for-perl-5.44.0.patch |  47 -----
 ...Fix-checkfield-for-C23-compatibility.patch |  35 ----
 .../perl-cross/files/determinism.patch        |   4 +-
 ...{perlcross_1.6.4.bb => perlcross_1.6.5.bb} |   6 +-
 ...168.0.bb => python3-hypothesis_6.168.3.bb} |   2 +-
 ...2026.3.post1.bb => python3-pytz_2026.4.bb} |   2 +-
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 .../linux/linux-yocto-rt_6.18.bb              |   6 +-
 .../linux/linux-yocto-rt_7.2.bb               |   6 +-
 .../linux/linux-yocto-tiny_6.18.bb            |   6 +-
 .../linux/linux-yocto-tiny_7.2.bb             |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.18.bb |  24 +--
 meta/recipes-kernel/linux/linux-yocto_7.2.bb  |  24 +--
 .../alsa/alsa-lib/CVE-2026-90781.patch        |  41 +++++
 .../alsa/alsa-lib_1.2.16.1.bb                 |   4 +-
 meta/recipes-support/gnutls/gnutls/run-ptest  |   1 +
 meta/recipes-support/gnutls/gnutls_3.8.13.bb  |  18 ++
 .../libpcre/libpcre2/testoutput3C             | 174 ++++++++++++++++++
 .../{libpcre2_10.48.bb => libpcre2_10.49.bb}  |   4 +-
 31 files changed, 472 insertions(+), 268 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/srcfiles.patch
 create mode 100644 meta/recipes-devtools/go/go/0011-internal-cgrouptest-skip-when-cpu.max-is-not-availab.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/0003-CMakeLists-take-the-default-architecture-from-the-ta.patch
 delete mode 100644 meta/recipes-devtools/perl-cross/files/0001-patches-for-perl-5.44.0.patch
 delete mode 100644 meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
 delete mode 100644 meta/recipes-devtools/perl-cross/files/0002-Add-configure-checks-for-perl-5.44.0.patch
 delete mode 100644 meta/recipes-devtools/perl-cross/files/0003-Fix-checkfield-for-C23-compatibility.patch
 rename meta/recipes-devtools/perl-cross/{perlcross_1.6.4.bb => perlcross_1.6.5.bb} (75%)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.168.0.bb => python3-hypothesis_6.168.3.bb} (91%)
 rename meta/recipes-devtools/python/{python3-pytz_2026.3.post1.bb => python3-pytz_2026.4.bb} (86%)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-90781.patch
 create mode 100644 meta/recipes-support/libpcre/libpcre2/testoutput3C
 rename meta/recipes-support/libpcre/{libpcre2_10.48.bb => libpcre2_10.49.bb} (93%)


