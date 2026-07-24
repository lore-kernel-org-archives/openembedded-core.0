Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC08CC53214
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 09:02:07 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15475.1784883721247371986
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 02:02:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=l+360GQd;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-907ae240ac3so812836d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 02:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784883720; x=1785488520; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p4J1uXW0L4IZ9q5TWpAeZwNfwDkN5c9U6HbuVvnaDjE=;
        b=l+360GQdl9sPaoNC/zqkrPaDeFCfWWrq0aaRuS5kh+CtO0Iz4vjEx/OTcKUWGg3fh7
         FLoOj99j5cIDPpQvYFc9zeqAqq7s0M2X20eEq2B5faq67PfhCZTUvUUhgRxEnS2qkQBE
         x9zttfern+xL9WH5OhLj1iPxmGda5TQPwxcjitEPIW8CTHVQGr0+Z8N0FAVEdiCuGJYF
         kQipdy6Bpbz1z4x2GTTzHHlsePtGYINRrn3zZbwNr4IzZ9DQ0rmd0Yvboen0+fhZSVe+
         6RMUhGw8MZddgDnZQIIOvQDvVQuC5D6HlpHy0feHUBvE/droTtEqSRHgTbp1ZyaSKjvl
         FE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883720; x=1785488520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p4J1uXW0L4IZ9q5TWpAeZwNfwDkN5c9U6HbuVvnaDjE=;
        b=kJl8J85T9WkZutjqdM9lx5GbyjGLveMkQsMqalxI64zODrHaVhe/xhGG+0DBV51YgG
         oowBfLpa1Nm1OXez4zu+oYSQJms9+4seHEMj7O03hBU+9/ux8znibcy8qVQQZDxuyuh1
         oYcaOF5byQ4y7hbTzZyoOZy0cLALPQoalMFjSGUHTj4ed4YgF67gl5VvgFn/zzRS/Hs0
         3tTYSpmF8jVy+cfzyVYr7L0ydRm1L9ahzCypphGGzkKsPaEk3McbzthFpVuptCibA1cn
         +Yquw8PYnQHjdoSjp6aIeg3ZrcYg/6cKYY3YxWoHuVei+Sj72EkvLIYDVfqKzFT8+ats
         T95w==
X-Gm-Message-State: AOJu0Yypj4IpEFJ74E49/RcKBIVI5RC22BHV/QLW0Qrvtrv7A8akq01Z
	78XrlFhbbvhjMP8esoHRXPzUPOuaGZMjsTcjHOL8bY6AOyvvSaYK2is6fMPh1w==
X-Gm-Gg: AR+sD104tyG6VwwbzctekwubOZEI6W5g+y6lzDkW1+L1hNfdEYdkO16EB6Kx3bp6A0b
	NBpdYovyc3IvkHq43o7Me82E3xiBP4Rjea3Zv3X3Kef+ijBTdQStZ5vut8mcdTRRjVuy+7cj/T3
	AsK+cM0vyxrpISdFo5B3w2ieqzr62hE695kqBE1wRdKt3ZSzkXSekz/0lPWf8itnAHNupsiveBV
	7c2qGiZ4LGCx5ymGschF29YkCOvfOpAU2JI6TYHWktjnYYX2JanjzlPQiT6FTMi9q2RfVAAtUGk
	04lJUSw0mvtM/LIVWAv/OMtehg2HCvt4Ni7SqgesMrEkjrXk9L1F4omvPqEqjFmHb18hbIB8Scg
	B0DnhCe7y1M/nmW1/GeMV7AZlo4YMCWUzFYyug4XWPMSoJ6kwDrOUF8t/Cja+XLi5iZptVckSs4
	bcvgkCqLtfQcWuzmjbyfFMmnZb/Lu4fPut01AO8UmRg+eU
X-Received: by 2002:a05:6214:21e3:b0:8e9:f62b:8f9c with SMTP id 6a1803df08f44-907ca690248mr70049376d6.49.1784883719793;
        Fri, 24 Jul 2026 02:01:59 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907baa27cf1sm63968326d6.46.2026.07.24.02.01.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:01:58 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 00/10] wic: ship its tools, and add an SDK_FEATURES lever
Date: Fri, 24 Jul 2026 05:01:36 -0400
Message-ID: <20260724090146.19924-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241910

wic shells out to a range of host-side tools but does not declare them,
so wherever it is installed as a package (rather than run from the
bitbake do_image_wic task, which has the wic-tools native sysroot on
PATH) it works only by chance depending on what the host has installed.

Patch 1 is a cleanup of wic-tools: it moves the target bootloader
firmware (syslinux, grub-efi, systemd-boot) out of wic-tools and into the
wic oe-selftest that actually needs it, leaving wic-tools to stage only
the host tools wic runs.

Patch 2 then makes wic declare those host tools directly: wic gains
RDEPENDS on the tools it runs, so they are installed alongside it in
every variant that packages it.

Patches 3 and 4 are follow-on cleanups of the wic oe-selftest now that
wic and its tools all resolve from the wic-tools native sysroot: drop a
dead in-tree wic lookup, and drop the redundant per-test PATH overrides
that duplicated what the test setup already establishes.

The rest of the series turns "what optional tools go into the SDK" into
an explicit, self-documenting choice built around SDK_FEATURES, a list in
the same spirit as DISTRO_FEATURES / MACHINE_FEATURES / IMAGE_FEATURES: a
developer reads the setting and knows exactly what their SDK contains.

  - patch 5 adds the SDK_FEATURES variable and documents it (default
    empty), with no features wired to it yet;
  - patch 6 adds an opt-in "wic" feature;
  - patch 7 adds an opt-in "sbom" feature (SPDX + SBOM/CVE tooling);
  - patch 8 adds an opt-in "lldb" feature;
  - patch 9 moves the existing (unconditional, arch-gated) qemu addition
    behind a "qemu" feature, on by default so nothing regresses;
  - patch 10 moves the cross-canadian gdb behind a "gdb" feature, on by
    default; binutils and gcc stay unconditional since a cross-compiler
    is intrinsic to an SDK.

The opt-in features come first, then the two that default on. After the
whole series the default SDK_FEATURES is "gdb qemu", so an unmodified
configuration produces the same SDK as before. The intent is to present
the full range of knobs and let review settle which belong on by default;
the split across separate patches is deliberate so each can be debated on
its own. SDK_FEATURES is a plain list, so downstream layers can define
their own features (for example a cgdb feature in meta-openembedded) the
same way.

changes in v4:
- new patch 1: move the target bootloader firmware out of wic-tools and
  stage it from the wic oe-selftest instead, so wic-tools carries only
  the host tools wic runs. Ordered first so the wic RDEPENDS patch no
  longer needs to describe firmware that is about to leave wic-tools.
- wic RDEPENDS patch: gate the grub RDEPENDS to x86 and aarch64. grub is
  not in COMPATIBLE_HOST on arm hard-float, so the unconditional
  dependency in v3 made wic unbuildable there and broke "bitbake world"
  (Nothing RPROVIDES 'grub'), which in turn failed the sstate samesigs
  oe-selftests that build world under a qemuarm config. syslinux moves
  into the same arch-gated appends.
- new patches 3 and 4: oe-selftest cleanups enabled by the above (drop
  the dead COREBASE/scripts wic lookup and the redundant per-test PATH
  overrides).
- SDK_FEATURES: split the v3 "add wic via a new SDK_FEATURES lever" patch
  into a variable-only patch (patch 5) plus a wic feature patch (patch
  6), and reorder so the opt-in features (wic, sbom, lldb) come before
  the default-on ones (qemu, gdb).

changes in v3:
- replace the SDK_INCLUDE_WIC yes/no knob with the general SDK_FEATURES
  lever, and use it for qemu, sbom, gdb and lldb as well as wic
- the v2 "buildtools-extended-tarball: drop wic helper tools" patch was
  merged already and is dropped from the series

changes in v2:
- dropped the wic-tools.inc refactor; folded the tool list into the wic
  recipe
- reworked the buildtools-extended-tarball change into a plain removal
- gated wic in the SDK behind a knob instead of adding it unconditionally

Trevor Woerner (10):
  wic-tools: move bootloader firmware staging into the wic oe-selftest
  wic: add runtime dependencies on the tools it invokes
  oeqa/selftest/wic: drop dead COREBASE/scripts wic lookup
  oeqa/selftest/wic: drop redundant per-test PATH overrides
  nativesdk-packagegroup-sdk-host: add an SDK_FEATURES lever
  nativesdk-packagegroup-sdk-host: add wic to SDK_FEATURES
  nativesdk-packagegroup-sdk-host: add an sbom SDK feature
  nativesdk-packagegroup-sdk-host: add an lldb SDK feature
  nativesdk-packagegroup-sdk-host: gate qemu behind SDK_FEATURES
  packagegroup-cross-canadian: gate gdb behind SDK_FEATURES

 meta/conf/bitbake.conf                        |   1 +
 meta/conf/documentation.conf                  |   1 +
 meta/lib/oeqa/selftest/cases/wic.py           | 853 +++++++++---------
 meta/recipes-core/meta/wic-tools.bb           |  11 +-
 .../nativesdk-packagegroup-sdk-host.bb        |   5 +-
 .../packagegroup-cross-canadian.bb            |   2 +-
 meta/recipes-support/wic/wic_0.3.1.bb         |  30 +
 7 files changed, 448 insertions(+), 455 deletions(-)

-- 
2.50.0.173.g8b6f19ccfc3a


