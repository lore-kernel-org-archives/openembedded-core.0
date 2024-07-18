Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41272C3DA49
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 13:45:51 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.15383.1721310350573660454
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 06:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xpQe8bI+;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fbc3a9d23bso6543785ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 06:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721310350; x=1721915150; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=y247v4ZfsqHlXJW/wK0/mk8DO7uRaOdcIJbs2pKcp0Y=;
        b=xpQe8bI+2FsGaaSpL5kuOAXnaokPwwPVoc4I2iLFixnwGi1DmPO/4YAqivySbn02Uw
         103GUwRbrKU8mO9njwadIZbzOFaJwK5Sl5gySo0JWptrkv0Nx+Okci4STRi+DzlEqsrQ
         ddKQY6ziRcpye2hyQ3TceTSrWupZD+WZP8h2BYj3my8nrRHFdfKbbZeinLjExdrTbts+
         Wwhy757MK7wAGBJe9sUp5ygOhTVUyAG6sQrRDNJ6pBn1NVlLweSM0ayy6czfGJ7NC+uD
         iXRY/YFZmF2CeycHzW9oxds0Oqmhr82zAhu5uqM8tYO/LmrNIpA/ScKFbGbRrTZ/AeJB
         ex4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721310350; x=1721915150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y247v4ZfsqHlXJW/wK0/mk8DO7uRaOdcIJbs2pKcp0Y=;
        b=nbwJ2bu/zDNkOq4EbmY3n6bB1f8l54UN0YAEZTaf5cnwE5P+WEgBDqiMrN+1OqIc+z
         NQZKL3almtcKXU71OGooff5YlIV4mq7cloP0Rep4UQm2oZDWDDMPg8IcijvHj9DoZv8U
         W4HvW0JUwdDEldpLrzsAGOysVTPgstsUmpoWM8oku9VarrBb6los3hMZokds7dg38oE+
         Ebobde4f1X9Uax+K8IqjgQKdM2YSeL4bKdKt3j9mGKlc3Pa1ocjrOf0DFivibtQPap2V
         wzYT4flajnbzmwE8wBm7LRb7BdA9q9Mk0ihcnfatbuUPvZ6DrNJ+9S+4BmqWyrr6eDs0
         +i8Q==
X-Gm-Message-State: AOJu0YzSTJTxr8/Ow1yehfdQHDvQfvICUQT0Msjz7ekU7q0034oOu91G
	8dnLJZQC53OicQxj+4eGgPROwWGJbV7Rw2nu9ZqF8v2qxyE6kSrywLcK2GEjbRaM7WIV/PDkdxN
	U
X-Google-Smtp-Source: AGHT+IGJGKG+rtupnT2F3v0+SLyJ5J07vxTICVNHaq93wPKPlnHPcSNv55XPJ9ctv04waWO5Y2UpCA==
X-Received: by 2002:a17:902:e54e:b0:1fc:4aff:5b46 with SMTP id d9443c01a7336-1fc4e67c6abmr42623165ad.47.1721310349527;
        Thu, 18 Jul 2024 06:45:49 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb6ffbdsm93366985ad.60.2024.07.18.06.45.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 06:45:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/12] Patch review
Date: Thu, 18 Jul 2024 06:45:29 -0700
Message-Id: <cover.1721310237.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 13:45:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202213

Please review this set of changes for scarthgap and have comments back by
end of day Monday, July 21

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7150

The following changes since commit bf3fe8c01c5cc00ada22049f4f0abb485e2a626f:

  webkitgtk: fix do_compile errors on beaglebone-yocto (2024-07-13 07:07:10 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Archana Polampalli (1):
  less: fix CVE-2024-32487

Changqing Li (4):
  vulkan-samples: fix do_compile error when -Og enabled
  multilib.conf: remove appending to PKG_CONFIG_PATH
  gettext: fix a parallel build issue
  pixman: fixing inline failure with -Og

Deepthi Hemraj (1):
  binutils: stable 2.42 branch updates

Hitendra Prajapati (1):
  vte: fix CVE-2024-37535

Jose Quaresma (1):
  go: upgrade 1.22.4 -> 1.22.5

Peter Marko (2):
  busybox: Patch CVE-2021-42380
  busybox: Patch CVE-2023-42363

Steve Sakoman (1):
  Revert "apt: runtime error: filename too long (tmpdir length)"

Vijay Anusuri (1):
  openssh: fix CVE-2024-39894

 meta/conf/multilib.conf                       |   9 --
 .../openssh/openssh/CVE-2024-39894.patch      |  35 ++++
 .../openssh/openssh_9.6p1.bb                  |   1 +
 ...-fix-segfault-when-compiled-by-clang.patch |  41 +++++
 .../busybox/busybox/CVE-2021-42380.patch      | 151 ++++++++++++++++++
 .../busybox/busybox/CVE-2023-42363.patch      |  67 ++++++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |   3 +
 ...1-intl-Fix-build-failure-with-make-j.patch |  35 ++++
 meta/recipes-core/gettext/gettext_0.22.5.bb   |   1 +
 ...he-filename-can-t-be-longer-than-255.patch |  40 -----
 meta/recipes-devtools/apt/apt_2.6.1.bb        |   1 -
 .../binutils/binutils-2.42.inc                |   2 +-
 .../go/{go-1.22.4.inc => go-1.22.5.inc}       |   2 +-
 ...e_1.22.4.bb => go-binary-native_1.22.5.bb} |   6 +-
 ..._1.22.4.bb => go-cross-canadian_1.22.5.bb} |   0
 ...{go-cross_1.22.4.bb => go-cross_1.22.5.bb} |   0
 ...osssdk_1.22.4.bb => go-crosssdk_1.22.5.bb} |   0
 ...runtime_1.22.4.bb => go-runtime_1.22.5.bb} |   0
 ...ent-based-hash-generation-less-pedan.patch |  11 +-
 ...OOLDIR-to-be-overridden-in-the-envir.patch |  12 +-
 ...3-ld-add-soname-to-shareable-objects.patch |   9 +-
 ...de-CC-when-building-dist-and-go_boot.patch |  10 +-
 ...dist-separate-host-and-target-builds.patch |   9 +-
 ...d-go-make-GOROOT-precious-by-default.patch |  13 +-
 ...ut-build-specific-paths-from-linker-.patch |  12 +-
 ...ldgo.go-do-not-hardcode-host-compile.patch |  11 +-
 ...uild-paths-on-staticly-linked-arches.patch |   9 +-
 .../go/{go_1.22.4.bb => go_1.22.5.bb}         |   0
 .../less/files/CVE-2024-32487.patch           |  74 +++++++++
 meta/recipes-extended/less/less_643.bb        |   1 +
 ...ce-FORCE_INLINE_TEMPLATE-with-inline.patch |  52 ++++++
 .../vulkan/vulkan-samples_git.bb              |   1 +
 ...loat.c-fix-inlining-failed-in-call-t.patch |  56 +++++++
 .../xorg-lib/pixman_0.42.2.bb                 |   1 +
 .../vte/vte/CVE-2024-37535-01.patch           |  64 ++++++++
 .../vte/vte/CVE-2024-37535-02.patch           |  85 ++++++++++
 meta/recipes-support/vte/vte_0.74.2.bb        |   5 +-
 37 files changed, 711 insertions(+), 118 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2024-39894.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-awk-fix-segfault-when-compiled-by-clang.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2021-42380.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2023-42363.patch
 create mode 100644 meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failure-with-make-j.patch
 delete mode 100644 meta/recipes-devtools/apt/apt/0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch
 rename meta/recipes-devtools/go/{go-1.22.4.inc => go-1.22.5.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.22.4.bb => go-binary-native_1.22.5.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.22.4.bb => go-cross-canadian_1.22.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.22.4.bb => go-cross_1.22.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.22.4.bb => go-crosssdk_1.22.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.22.4.bb => go-runtime_1.22.5.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.22.4.bb => go_1.22.5.bb} (100%)
 create mode 100644 meta/recipes-extended/less/files/CVE-2024-32487.patch
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-zstd.c-replace-FORCE_INLINE_TEMPLATE-with-inline.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-float.c-fix-inlining-failed-in-call-t.patch
 create mode 100644 meta/recipes-support/vte/vte/CVE-2024-37535-01.patch
 create mode 100644 meta/recipes-support/vte/vte/CVE-2024-37535-02.patch

-- 
2.34.1


