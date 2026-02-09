Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3D2BE7E0BC
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:58:57 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44552.1770631136537430337
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:58:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qNqT9Pqq;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-483487335c2so664195e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 01:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770631135; x=1771235935; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7YKxcM2vwmXcX+cRmJiT49rwFg4SgAY6HFwZ+WcRLrA=;
        b=qNqT9PqqtjM3YscJ1C+HubVvSXQh+SthGTmQQTyOk+kJRvRB/zgoHhZ74g+U3bshTK
         9LVhwacNyQBCQ5v2yhJeCtIjUCQIXJac5vbMScu7jmMmieJtoY8fDIgptDKi6VB70Lqs
         T+ACTveu80rf4f82Rj7ybnvNmdKhnM/bWZXEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770631135; x=1771235935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YKxcM2vwmXcX+cRmJiT49rwFg4SgAY6HFwZ+WcRLrA=;
        b=kSokgo+tZLYDSV1QAENBxuwznLIBwlbly5QsPPfvanHjwmtOd6xl1fERQeKznDqArb
         pMX5JxfNzaDbukpo1vBmz8CHAkIVCAnLiO6br3iVodVp1Bzbm8B0k8Kc5cKDBE3yVZzb
         dJsxlGoobPsOfLH+RIwiUxV7Axeak+eFYidA/hQx1oiUXm4HuJpYEzhy/6UswNImlWGa
         dToE1xhkPh6KbuqL2PKrcEhcni5AeJl5eCXzL7VlJVywwOxazUVqx2xGa7w3IYxoX/OW
         /x9UitXxUaxq2zKpygUoTgO2uZDThBjMW5kcnx4k7tK7yygqyLw+NiswMkLffGUNSiEU
         lguQ==
X-Gm-Message-State: AOJu0YwsHTC5++TuQ0xEV0SD8AP0aWvyw8I1wqDSuCJdIsLpElyV8lNz
	fWrg9YtB0Rormqkout/7dgE4f9S47NHjTmT5T1AK8e0vqknp1EmJacVxJLy1TtIN23ktkDhD60n
	2qLlxJyQ=
X-Gm-Gg: AZuq6aJIArPSh3dux8A3E4awOoQ8nMF6QkhevJDv8MzosEu5VaR8T8uMDkkS4Qm+3YF
	hxwbWmalHPU4L6hFm1WHi+i9lj8hcw466mxP1uLkJp4oBrpreLZvuq+XKlH7zooW4JwzUwxwJ0o
	SDtTSX714nmbpXvde/1FWP/TjPw7+sqQhzzGa3fGc4iDqLRuJOhq8TD/2QymdLJXCHhRUXitf4d
	G7PXs2vwPHZ5+HM3LQS9oq4Yja5gVwsezzsASBzvOLfFp9tFgJn6Z7uml/4n17CwXun3u3uQwpQ
	KkqXBbUA8IU7h+8cxrN2272IWEP6RD0VPWekCUPgnLB3KOhRSmXfi3HGoEroxeqcp2d+2MkQB3k
	kJc2omuqmwuWSOyZKvHAaB1b3RmKfQQLq/dylUITmKYsQbNnTHNa14aJ//fIWNJvEVi4/G5zRMy
	gKy2CeO3wFU5UVr2YH5KwWxTngebGf8PqIX2Fo8N6fSHXNX1yOs7t2SjL37zSsHqRqpiilyyo1X
	32i+42S7bX78hQ=
X-Received: by 2002:a05:600c:608e:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-48320928fd1mr159237765e9.7.1770631134624;
        Mon, 09 Feb 2026 01:58:54 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320728ac7sm232265145e9.13.2026.02.09.01.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:58:54 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][whinlatter 00/22] Pull request (cover letter only)
Date: Mon,  9 Feb 2026 10:58:33 +0100
Message-ID: <cover.1770630733.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230777

Those are the patches from the last patch review:
https://lore.kernel.org/openembedded-core/cover.1770109549.git.yoann.congal@smile.fr/T/#t
(with added cherry-pick info, where appropriate)

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3181

The following changes since commit fa31089d48cac2aa11279e932a77f4dbdc02c02d:

  libarchive: upgrade 3.8.4 -> 3.8.5 (2026-01-26 08:44:38 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/whinlatter-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/whinlatter-next

for you to fetch changes up to 7ffbe7bb6e262a410afac64c5211df0d52c202c7:

  inetutils: patch CVE-2026-24061 (2026-02-09 01:51:46 +0100)

----------------------------------------------------------------

Hugo SIMELIERE (1):
  libtasn1: Fix CVE-2025-13151

Jiaying Song (1):
  grub: fix CVE-2025-54770 CVE-2025-61661 CVE-2025-61662 CVE-2025-61663
    CVE-2025-61664

Ken Kurematsu (1):
  libtheora: set CVE_PRODUCT

Khai Dang (1):
  docbook-xml-dtd4: fix the fetching failure

Mark Hatle (1):
  dpkg: Fix ADMINDIR

Mathieu Dubois-Briand (2):
  oeqa/gitarchive: Fix git push URL parameter
  oeqa/gitarchive: Push tag before copying log files

Peter Marko (13):
  go: upgrade 1.25.5 -> 1.25.6
  zlib: ignore CVE-2026-22184
  python3-urllib3: patch CVE-2026-21441
  glibc: stable 2.42 branch updates
  dropbear: patch CVE-2025-14282
  libpng: upgrade 1.6.53 -> 1.6.54
  glib-2.0: patch CVE-2026-0988
  libxml2: patch CVE-2026-0989
  libxml2: patch CVE-2026-0990
  libxml2: patch CVE-2026-0992
  libxml2: add follow-up patch for CVE-2026-0992
  expat: upgrade 2.7.3 -> 2.7.4
  inetutils: patch CVE-2026-24061

Richard Purdie (2):
  scripts/oe-git-archive: Ensure new push parameter is specified
  pseudo: Update to 1.9.3 release

 meta/lib/oe/package_manager/deb/__init__.py   |   4 +
 .../oeqa/selftest/cases/gitarchivetests.py    |   4 +-
 meta/lib/oeqa/utils/gitarchive.py             |   8 +-
 .../grub/files/CVE-2025-54770.patch           |  41 +++
 .../grub/files/CVE-2025-61661.patch           |  40 +++
 .../grub/files/CVE-2025-61662.patch           |  72 ++++
 .../grub/files/CVE-2025-61663_61664.patch     |  64 ++++
 meta/recipes-bsp/grub/grub2.inc               |   4 +
 .../inetutils/CVE-2026-24061-01.patch         |  38 ++
 .../inetutils/CVE-2026-24061-02.patch         |  82 +++++
 .../inetutils/inetutils_2.6.bb                |   2 +
 .../dropbear/dropbear/CVE-2025-14282-01.patch | 280 +++++++++++++++
 .../dropbear/dropbear/CVE-2025-14282-02.patch |  97 +++++
 .../dropbear/dropbear/CVE-2025-14282-03.patch | 282 +++++++++++++++
 .../dropbear/dropbear/CVE-2025-14282-04.patch |  72 ++++
 .../dropbear/dropbear/CVE-2025-14282-05.patch |  46 +++
 .../recipes-core/dropbear/dropbear_2025.88.bb |   5 +
 .../expat/{expat_2.7.3.bb => expat_2.7.4.bb}  |   2 +-
 .../glib-2.0/files/CVE-2026-0988.patch        |  58 +++
 meta/recipes-core/glib-2.0/glib.inc           |   1 +
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 meta/recipes-core/glibc/glibc_2.42.bb         |   2 +-
 .../libxml/libxml2/CVE-2026-0989.patch        | 309 ++++++++++++++++
 .../libxml/libxml2/CVE-2026-0990.patch        |  76 ++++
 .../libxml/libxml2/CVE-2026-0992-01.patch     |  49 +++
 .../libxml/libxml2/CVE-2026-0992-02.patch     | 336 ++++++++++++++++++
 .../libxml/libxml2/CVE-2026-0992-03.patch     |  33 ++
 meta/recipes-core/libxml/libxml2_2.14.6.bb    |   5 +
 meta/recipes-core/zlib/zlib_1.3.1.bb          |   2 +
 .../docbook-xml/docbook-xml-dtd4_4.5.bb       |  10 +-
 ...-dirs.c-set_rootfs-was-not-checking-.patch |  46 +++
 meta/recipes-devtools/dpkg/dpkg_1.22.21.bb    |   1 +
 .../go/{go-1.25.5.inc => go-1.25.6.inc}       |   2 +-
 ...e_1.25.5.bb => go-binary-native_1.25.6.bb} |   6 +-
 ..._1.25.5.bb => go-cross-canadian_1.25.6.bb} |   0
 ...{go-cross_1.25.5.bb => go-cross_1.25.6.bb} |   0
 ...osssdk_1.25.5.bb => go-crosssdk_1.25.6.bb} |   0
 ...runtime_1.25.5.bb => go-runtime_1.25.6.bb} |   0
 ...ent-based-hash-generation-less-pedan.patch |   8 +-
 ...ng-cgo-on-386-call-C-sigaction-funct.patch |   4 +-
 ...d-go-make-GOROOT-precious-by-default.patch |   2 +-
 .../go/{go_1.25.5.bb => go_1.25.6.bb}         |   0
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   4 +-
 .../python3-urllib3/CVE-2026-21441.patch      | 111 ++++++
 .../python/python3-urllib3_2.5.0.bb           |   1 +
 .../{libpng_1.6.53.bb => libpng_1.6.54.bb}    |   4 +-
 .../libtheora/libtheora_1.2.0.bb              |   2 +
 .../gnutls/libtasn1/CVE-2025-13151.patch      |  30 ++
 .../recipes-support/gnutls/libtasn1_4.20.0.bb |   1 +
 scripts/lib/resulttool/store.py               |   9 +-
 scripts/oe-git-archive                        |   2 +-
 51 files changed, 2228 insertions(+), 31 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-54770.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61661.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61662.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61663_61664.patch
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-01.patch
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-02.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-14282-01.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-14282-02.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-14282-03.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-14282-04.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-14282-05.patch
 rename meta/recipes-core/expat/{expat_2.7.3.bb => expat_2.7.4.bb} (92%)
 create mode 100644 meta/recipes-core/glib-2.0/files/CVE-2026-0988.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0989.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992-01.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992-02.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992-03.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/0001-lib-dpkg-options-dirs.c-set_rootfs-was-not-checking-.patch
 rename meta/recipes-devtools/go/{go-1.25.5.inc => go-1.25.6.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.25.5.bb => go-binary-native_1.25.6.bb} (79%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.25.5.bb => go-cross-canadian_1.25.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.25.5.bb => go-cross_1.25.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.25.5.bb => go-crosssdk_1.25.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.25.5.bb => go-runtime_1.25.6.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.25.5.bb => go_1.25.6.bb} (100%)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.patch
 rename meta/recipes-multimedia/libpng/{libpng_1.6.53.bb => libpng_1.6.54.bb} (94%)
 create mode 100644 meta/recipes-support/gnutls/libtasn1/CVE-2025-13151.patch


