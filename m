Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D517FC981E
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 22:46:40 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38742.1774824391103272248
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 15:46:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=H+RRG1SF;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48374014a77so45854455e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 15:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774824389; x=1775429189; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=opYYiiAGzKudO74e69ozgiKldcEKJWYcLRt8C5xbni8=;
        b=H+RRG1SFJBzprqGY4UgeOpNZT525rX4BpikqEk3r50ohFa9fjYfeAFrHofhCHR+zKZ
         M08W4e7jZf3vNt1x2eNc0FxvWB3ysEoyat4leRUw34WHJtMHpca1BwXjHyLrvXvCbBUL
         q7EBExo2TypQL6chRxiPJaasrsvxJIb880PAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774824389; x=1775429189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=opYYiiAGzKudO74e69ozgiKldcEKJWYcLRt8C5xbni8=;
        b=RqskTT9TqcQRXKmZlvRxEVyYD3tVRySPUkYROk4a1L5eE9HYiG/OEvjcWl8gSzFWyS
         +JEMYGPu+cSJQStmvLgGSSG2hM+JlJuraLxDXz1GbiIW01pPgIQyvgbzHKTxGKRfJN1a
         J8mkTL+6/k9X7576moxnRJdFwD30knoNIce1sQOFmiXYLpR1eL39oKg5AQuZaUmWWNHu
         niEv0JN1NDzJaiqU2PrE/D1z/sqwa0ZP3+7Rmx84gfWGtzexYi9DkvzKyYkfN24yRd1r
         bf1KYysXVc/9tQOYRBAbG4zzD+xsEJF1M6q2RlmeCYeslOi37eoRiiGtPV3KHqgDGryo
         BA7Q==
X-Gm-Message-State: AOJu0Ywayv194VISDG4SVQ3NA0N3JyFjUb1SlD5Fp1wIdVmGpTEnDLL0
	9QMr9blzhyxKrzryMR7AlHWNXIyKmV01FMLA1KAXYoSD6kcta8YIMDbmZD9YVJN6jNIeiVymw41
	HLCqfOb8=
X-Gm-Gg: ATEYQzwUd7UHGAHARTQ6eIOFoNA0MVgO6qKvryg/0wKTwJ0jlI28DhXvjp9UBf2uktp
	RnfgG3N9/3GTBtPwBkTDYqfaU3AhSuGmy0p5mj1Q0Diaym6w3+EJJC6ITInTCUn+5LSw1IHBFZL
	LuB1Fej2RFCpz8oUbthjWSpghWHimiRzUjTzngvf5VE8+1FSszAMzHvEuc8U3a5RWTF8qj8S1YV
	+XWAteijNma0Cc8QG6R61TQBOVEBd9mL/CzJIqRZGK3lGH6bVEAkcmyaZz50zroFqnVFkfDhAlu
	a5VBVoXRKq2r/7r80JOAaxg5FFjIQ53w6HfcKNA+S8HMBCa337RWlc3ygvFBZuuTE+W1xMeMd0U
	zhYkAdEEK92URgIhQMf4Yvttt4gY9DyqRafRQq77DJVHzfXZXwxi5GJj1oSFTELJjdE1yFXG8mg
	ksRTYbsf1DuKIR7xs0ets0VVNY8vyji6zTfWkJgsBEasqMxifzaAHvotRZydNUWqmIpotCTci1p
	cdPhzQdkb72e+E9jeBocWvnWYg=
X-Received: by 2002:a05:600c:8b6d:b0:485:35ba:1d81 with SMTP id 5b1f17b1804b1-48727eb7fb7mr177375935e9.21.1774824389198;
        Sun, 29 Mar 2026 15:46:29 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873061eeeasm133760375e9.2.2026.03.29.15.46.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 15:46:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/11] Patch review
Date: Mon, 30 Mar 2026 00:46:07 +0200
Message-ID: <cover.1774824253.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 22:46:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234181

Please review this set of changes for scarthgap and have comments back by
end of day Tuesday, March 31.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3546
Note: This particular build had a gnutls patch that I removed because it needed a small change[0].
Build (currently running) without the gnutls patch: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3551

[0]: https://lore.kernel.org/openembedded-core/DHFLXG1K82R7.3EOQRZ2H6KW8Q@smile.fr/T/#t

The following changes since commit 41597b5260fb5ca811d0fb4ae7e65246d61734eb:

  Revert "scripts/install-buildtools: Update to 5.0.16" (2026-03-26 09:48:20 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

for you to fetch changes up to e6f3b2e043259650d80fb6f761797c5cf5587eb5:

  python3-pyopenssl: Fix CVE-2026-27459 (2026-03-30 00:09:38 +0200)

----------------------------------------------------------------

João Marcos Costa (Schneider Electric) (1):
  spdx: add option to include only compiled sources

Martin Jansa (3):
  dtc: backport fix for build with glibc-2.43
  elfutils: don't add -Werror to avoid discarded-qualifiers
  binutils: backport patch to fix build with glibc-2.43 on host

Michael Halstead (2):
  yocto-uninative: Update to 5.0 for needed patchelf updates
  yocto-uninative: Update to 5.1 for glibc 2.43

Nguyen Dat Tho (1):
  python3-cryptography: Fix CVE-2026-26007

Paul Barker (1):
  tzdata,tzcode-native: Upgrade 2025b -> 2025c

Richard Purdie (1):
  pseudo: Add fix for glibc 2.43

Vijay Anusuri (2):
  python3-pyopenssl: Fix CVE-2026-27448
  python3-pyopenssl: Fix CVE-2026-27459

 meta/classes/spdx-common.bbclass              |   3 +
 meta/conf/distro/include/yocto-uninative.inc  |  10 +-
 meta/lib/oe/spdx30_tasks.py                   |  12 ++
 .../binutils/binutils-2.42.inc                |   1 +
 ...tect-against-standard-library-macros.patch |  31 ++++
 .../elfutils/elfutils_0.191.bb                |   1 +
 ...001-config-eu.am-do-not-force-Werror.patch |  34 ++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   2 +-
 .../python3-cryptography/CVE-2026-26007.patch | 149 ++++++++++++++++++
 .../python/python3-cryptography_42.0.5.bb     |   1 +
 .../python3-pyopenssl/CVE-2026-27448.patch    | 124 +++++++++++++++
 .../python3-pyopenssl/CVE-2026-27459.patch    | 109 +++++++++++++
 .../python/python3-pyopenssl_24.0.0.bb        |   5 +
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 .../0001-Fix-discarded-const-qualifiers.patch |  85 ++++++++++
 meta/recipes-kernel/dtc/dtc_1.7.0.bb          |   1 +
 16 files changed, 565 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0022-gprofng-protect-against-standard-library-macros.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-config-eu.am-do-not-force-Werror.patch
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/CVE-2026-26007.patch
 create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.patch
 create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27459.patch
 create mode 100644 meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch


