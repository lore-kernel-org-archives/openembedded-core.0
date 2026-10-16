Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ECBBCCA490
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 22:24:46 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5933.1792189482090410104
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 15:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dlM+VSrf;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so4577395e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 15:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792189480; x=1792794280; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=veJfwsQqDJbcmqbccYYEQ5qUzKQUrGhEIvG4M2Ic8E4=;
        b=dlM+VSrfDKM8KnCElIx2rguvJpDn1eWZqgPx54fQeTM5QHUhvL7+qw6+yqF4xzW4fD
         6bc00LHVMLlWav6niUPDwN3EGog4YCmxERna+NQYst0DADk741Ez/6Vnfx+TFQGpT9Pu
         myqIlDdXNpX/eDsZk7xV3glJNliEwYBx1wYJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189480; x=1792794280;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=veJfwsQqDJbcmqbccYYEQ5qUzKQUrGhEIvG4M2Ic8E4=;
        b=llczLGHbSwNS5Zg72IKtO+E0uyRZrR9OXTPKTdMMQLEIvLkgldEQD1dnjqbwpsiqKu
         GeBmhpnPriF7UdQuBzpkKUWqvRIZI17FoMXCJNi2cUDfuH46w0UCdyOtqozxNndnTJXD
         BgdS0+FlH3s2C4x0ziN6T+In+VTeBLKAvo2h30dSn9Wzzru3xQorLtiZEdfXJV4KZS2d
         UEXrJF0xAmEP4BQF46iLPOSEaUAAAbuFN6KR/u4rqeH28gyZOBG6ikVrUwhkF55FnwUu
         KmjlhjJFrrNJSE9BvT3KEGbPwiA+KcKuhPBSfFMwK/Jpi7E0xX2+V25uIpQQ+OaFvN+E
         soIA==
X-Gm-Message-State: AFq9FYJCzbCYPF08sGn6RaYqRR+A2mN9csZ9rQVS4JZmQ8HfWeEhTAXx
	mMo0KdW4i2uVnbXqGoZrPANc4PWpmkxFShUVx9dHalSIeTq9+JdJMiJ7/7Evv4F12XqCQUzPlln
	isS33X6I=
X-Gm-Gg: AYBFou0pqJlsAX936hUWXFfdstoW256gndmYVYTFFLRDLpNzneI9YIWggb242z4y74k
	lIUXjaryT75nPt54QWl1VMYPXyHw6jBb+MOw6Yn6yx8o1wOudkVtK8n03oldLVTfvujz11dldol
	qhx7bdLDvkhBlCrXKyk3G+L+88i2nc6HYrCuSeOQBFBl2E4NYCmrfql2zlDEzZ4zA3EAalZ/ta5
	yJJf8Sr8efJnSJE6M+Ze+HjKXqVqJiwm7KoMFddHi9Jz4nJkL+inI8oiN5IOqxud16Ro20sIZbl
	/mGthWlNc6d4COANk3JmMqr1JeqZ+YHLJWtCib/oJqG7qQPWMXfZzupm7Xmc8dgVMRhbpxWqFVC
	y1oCKK+HbfTbijvK3FnsJ+KK4v4GAb0SwTn85PQiJzMaBA6wwjCs9SYNW3WkvonWM7++FX05KQA
	BAZ86IEqOfFL2aHYUdfYZJcXPZ1LVyqpb7/of7R6WsokeeLhT3vhlekFL3dCJHgU23gDs1chZJT
	oyf78udle/pclhOzTTHd7ckUylmoV8BwNOG/9em6A8aPI7kYk9l8Etw1hV/ZVIRnRWd1tc5o5vr
	yvJyC6dy
X-Received: by 2002:a5d:46c2:0:b0:48d:df08:307c with SMTP id ffacd0b85a97d-48e07f9eea1mr1180134f8f.44.1792189479549;
        Fri, 16 Oct 2026 15:24:39 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503862sm7639515f8f.46.2026.10.16.15.24.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:24:39 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 00/17] Patch review
Date: Sat, 17 Oct 2026 00:24:02 +0200
Message-ID: <cover.1792189264.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 22:24:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248051

Please review this set of changes for blacksail and have comments back by
end of day Tuesday, October 20.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4944
* oe-selftest-debian failed with 16455 – AB-INT: Can't clone file://oe-core in devtool tests
  retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/35/builds/5079
* oe-selftest-armhost failed with 16456 – AB-INT: "unparsed line" error in devtool /tmp/ clone of oe-core
  retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/23/builds/5110

The following changes since commit e182a0c4b91fd459c1f9dece0c7c23f7f9eaa7ab:

  recipes-support/gnutls: disable slow tests for RISCV64 (2026-10-06 22:31:54 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/blacksail-review
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/blacksail-review

for you to fetch changes up to a4461e117c1c501b7021d20c1380e4187fcda4c1:

  barebox: inherit upstream-stable-release-point (2026-10-16 14:49:39 +0200)

----------------------------------------------------------------

Daniel Turull (1):
  lib/oe/recipeutils: honor stable_upgrade for UPSTREAM_CHECK_COMMITS
    recipes

Darsh Kelaiya (1):
  python3-click: depend on python3-shell for shlex

Frieder Schrempf (1):
  sqlite3: Fix host include path leaking in with readline/editline

Hemanth Kumar M D (1):
  gcc: Fix for CVE-2026-102010

Jaipaul Cheernam (1):
  kea: Upgrade 3.2.0 -> 3.2.1

Kris Gavvala (1):
  nasm: fix CVE-2026-6067

Lucas Stach (1):
  barebox: inherit upstream-stable-release-point

Mathieu Dubois-Briand (1):
  libpcre2: Remove testoutput3C file

Peter Marko (7):
  popt: patch CVE-2026-18743
  popt: patch CVE-2026-18739
  libpng: upgrade 1.6.58 -> 1.6.59
  expat: patch CVE-2026-102633
  expat: patch CVE-2026-77214
  glibc: stable 2.44 branch updates to 34106fee69
  go: upgrade 1.27.1 -> 1.27.2

Richard Purdie (1):
  python3-mako: upgrade 1.4.1 -> 1.4.3

Ross Burton (1):
  tcl: skip timing-sensitive clock tests

 meta/lib/oe/recipeutils.py                    |  25 ++-
 meta/recipes-bsp/barebox/barebox.bb           |   2 +-
 ...-qualifiers-to-OpenSSL-X509-pointers.patch |  49 -----
 ...se-a-runtime-safe-interpreter-string.patch |   8 +-
 .../0001-mk_cfgrpt.sh-strip-prefixes.patch    |   2 +-
 ...er_unittest_support.cc-do-not-write-.patch |   2 +-
 .../kea/files/fix-multilib-conflict.patch     |   2 +-
 .../kea/{kea_3.2.0.bb => kea_3.2.1.bb}        |   3 +-
 .../expat/expat/CVE-2026-102633.patch         |  68 +++++++
 .../expat/expat/CVE-2026-77214.patch          | 106 +++++++++++
 meta/recipes-core/expat/expat_2.8.5.bb        |   2 +
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 meta/recipes-core/glibc/glibc_2.44.bb         |   3 +-
 meta/recipes-devtools/gcc/gcc-16.2.inc        |   1 +
 .../gcc/gcc/0026-CVE-2026-102010.patch        |  71 +++++++
 .../go/{go-1.27.1.inc => go-1.27.2.inc}       |   2 +-
 ...e_1.27.1.bb => go-binary-native_1.27.2.bb} |   6 +-
 ..._1.27.1.bb => go-cross-canadian_1.27.2.bb} |   0
 ...{go-cross_1.27.1.bb => go-cross_1.27.2.bb} |   0
 ...osssdk_1.27.1.bb => go-crosssdk_1.27.2.bb} |   0
 ...runtime_1.27.1.bb => go-runtime_1.27.2.bb} |   0
 ...ent-based-hash-generation-less-pedan.patch |   8 +-
 ...3-ld-add-soname-to-shareable-objects.patch |   6 +-
 ...d-go-make-GOROOT-precious-by-default.patch |   2 +-
 ...ut-build-specific-paths-from-linker-.patch |   4 +-
 ...est-skip-when-cpu.max-is-not-availab.patch |   6 +-
 .../go/{go_1.27.1.bb => go_1.27.2.bb}         |   0
 .../nasm/nasm/CVE-2026-6067.patch             |  36 ++++
 meta/recipes-devtools/nasm/nasm_3.02.bb       |   1 +
 .../python/python3-click_8.5.0.bb             |   1 +
 ...n3-mako_1.4.1.bb => python3-mako_1.4.3.bb} |   2 +-
 meta/recipes-devtools/tcltk/tcl/run-ptest     |   2 +
 meta/recipes-devtools/tcltk8/tcl8/run-ptest   |   2 +
 ...ts-stream-per-test-results-to-stdout.patch |   2 +-
 .../{libpng_1.6.58.bb => libpng_1.6.59.bb}    |   2 +-
 .../libpcre/libpcre2/testoutput3C             | 174 ------------------
 .../recipes-support/libpcre/libpcre2_10.49.bb |   2 -
 .../popt/popt/CVE-2026-18739.patch            |  92 +++++++++
 .../popt/popt/CVE-2026-18743.patch            |  97 ++++++++++
 meta/recipes-support/popt/popt_1.19.bb        |   4 +-
 meta/recipes-support/sqlite/sqlite3_3.53.4.bb |   4 +-
 41 files changed, 532 insertions(+), 269 deletions(-)
 delete mode 100644 meta/recipes-connectivity/kea/files/0001-Add-const-qualifiers-to-OpenSSL-X509-pointers.patch
 rename meta/recipes-connectivity/kea/{kea_3.2.0.bb => kea_3.2.1.bb} (96%)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-102633.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-77214.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0026-CVE-2026-102010.patch
 rename meta/recipes-devtools/go/{go-1.27.1.inc => go-1.27.2.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.27.1.bb => go-binary-native_1.27.2.bb} (80%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.27.1.bb => go-cross-canadian_1.27.2.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.27.1.bb => go-cross_1.27.2.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.27.1.bb => go-crosssdk_1.27.2.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.27.1.bb => go-runtime_1.27.2.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.27.1.bb => go_1.27.2.bb} (100%)
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2026-6067.patch
 rename meta/recipes-devtools/python/{python3-mako_1.4.1.bb => python3-mako_1.4.3.bb} (88%)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.58.bb => libpng_1.6.59.bb} (97%)
 delete mode 100644 meta/recipes-support/libpcre/libpcre2/testoutput3C
 create mode 100644 meta/recipes-support/popt/popt/CVE-2026-18739.patch
 create mode 100644 meta/recipes-support/popt/popt/CVE-2026-18743.patch


