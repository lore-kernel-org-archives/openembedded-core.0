Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7775BC07E97
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 22:52:57 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.10452.1701211967912825554
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 14:52:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tCUQ4Axl;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-285e7c85b30so1970498a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 14:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701211966; x=1701816766; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=svEQ0VGXiBeEVJ81YNHRJAEL+PKOtxTYfS6za1JeOjk=;
        b=tCUQ4Axlv250XHhozOMt3Q7mN7+tRN0s3FAJF7u6BYT//dXRj0VmK7G0MjEXzX0s6B
         Q0lkEuYtZykof9xrRl9nusTUBsdY8ZVgIw8Wy5P5STvUZPX+F0Hl+5wKFw6RLJ8KrhDq
         7yUBYq/9/5KSBMqzFvMIQNHvT2bDBG4RfyX/NqL2630PK7/jqLjThzqie7oHBkCJ+nPA
         2vk1f6VEE9Z7WqxlVYZDANcAyrzQBwqXleeS9Y9w6ZwFmYA5QO0EYEelTnMP0rWo0cwA
         zxE/XIJVQSheWArGdXniLoWe8QwuFVygyzxpBHLrtdroWVJ5+ixoNYXLtpG9tjdL8Xd8
         aRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701211967; x=1701816767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=svEQ0VGXiBeEVJ81YNHRJAEL+PKOtxTYfS6za1JeOjk=;
        b=U0bzycMOa2Otf+Zig56YEL/EgvJyS27MYygKFozeYFQE8e5EHh2BFXPOTR/6BLhC5E
         DnKa8wE9hihR2mNOUxdeqkJyCgtjld3txBD3RhZBq/DUC1WO0STdjDz67se/0sgzjher
         R/2QgL5fAzwrIcRjGvPHjYtXE6YW7N9NqcBRoDxINo8EXpK6DLK26C5e3Fz70luF0271
         6XiDmUnNAJ16hYOo/pyak5LxF4Ga00w6LCJB77g6/w/A+cevjrY1L2ji6y0D6Si1IWhQ
         zgERpc32xhKlVBxK3X/cgve83tXUSP+lSeoapbDwIl7myRaEyCC4TR425OLMhNTtu1d6
         2xCg==
X-Gm-Message-State: AOJu0YwEBHg9wJCso69CMyoymh+CHvDezz8b7275bqgvINZ3wWBgx1Wv
	UhnUCRFjYRj60FgtH0vnjiEw3fXUiaw5xU5D4CRSBQ==
X-Google-Smtp-Source: AGHT+IEZxaeRUNPr4yzwtS/fmvJycPDV2NB3U/q6i+9r9Q8qj97enevDwgBFJOqzpD07BGdzmjB0nQ==
X-Received: by 2002:a17:90b:350f:b0:285:ad94:a7fd with SMTP id ls15-20020a17090b350f00b00285ad94a7fdmr10595826pjb.44.1701211966549;
        Tue, 28 Nov 2023 14:52:46 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id cu20-20020a17090afa9400b00282ecb631a9sm9621898pjb.25.2023.11.28.14.52.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 14:52:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/13] Patch review
Date: Tue, 28 Nov 2023 12:52:27 -1000
Message-Id: <cover.1701210903.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 22:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191395

Please review this set of changes for dunfell and have comments back by
end of day Thursday, November 30

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6252

The following changes since commit ff7dbcc0206203e2ece68ca91a37050a4bc822a2:

  selftest: skip virgl test on all fedora (2023-11-14 06:35:38 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Archana Polampalli (1):
  vim: Upgrade 9.0.2048 -> 9.0.2068

Etienne Cordonnier (1):
  vim: update obsolete comment

Hitendra Prajapati (1):
  grub: fix CVE-2023-4692 & CVE-2023-4693

Lee Chee Yang (3):
  wayland: fix CVE-2021-3782
  python3-setuptools: fix CVE-2022-40897
  curl: fix CVE-2023-28321 CVE-2023-28322

Richard Purdie (1):
  vim: Improve locale handling

Steve Sakoman (1):
  vim: use upstream generated .po files

Vijay Anusuri (5):
  libx11: Fix for CVE-2023-43785 CVE-2023-43786 and CVE-2023-43787
  shadow: backport patch to fix CVE-2023-29383
  bind: Backport fix for CVE-2023-3341
  avahi: backport Debian patches to fix multiple CVE's
  tiff: backport Debian patch to fix CVE-2022-40090

 .../grub/files/CVE-2023-4692.patch            |  97 ++++
 .../grub/files/CVE-2023-4693.patch            |  62 ++
 meta/recipes-bsp/grub/grub2.inc               |   2 +
 meta/recipes-connectivity/avahi/avahi.inc     |   9 +
 .../avahi/files/CVE-2023-1981.patch           |  60 ++
 .../avahi/files/CVE-2023-38469-1.patch        |  48 ++
 .../avahi/files/CVE-2023-38469-2.patch        |  65 +++
 .../avahi/files/CVE-2023-38470-1.patch        |  57 ++
 .../avahi/files/CVE-2023-38470-2.patch        |  53 ++
 .../avahi/files/CVE-2023-38471-1.patch        |  73 +++
 .../avahi/files/CVE-2023-38471-2.patch        |  52 ++
 .../avahi/files/CVE-2023-38472.patch          |  45 ++
 .../avahi/files/CVE-2023-38473.patch          | 109 ++++
 .../bind/bind/CVE-2023-3341.patch             | 175 ++++++
 .../recipes-connectivity/bind/bind_9.11.37.bb |   1 +
 .../python/python-setuptools.inc              |   2 +
 .../python3-setuptools/CVE-2022-40897.patch   |  29 +
 .../files/0001-Overhaul-valid_field.patch     |  66 +++
 .../shadow/files/CVE-2023-29383.patch         |  54 ++
 meta/recipes-extended/shadow/shadow.inc       |   2 +
 .../wayland/wayland/CVE-2021-3782.patch       | 111 ++++
 .../wayland/wayland_1.18.0.bb                 |   1 +
 .../xorg-lib/libx11/CVE-2023-43785.patch      |  63 ++
 .../xorg-lib/libx11/CVE-2023-43786-1.patch    |  42 ++
 .../xorg-lib/libx11/CVE-2023-43786-2.patch    |  46 ++
 .../xorg-lib/libx11/CVE-2023-43787-1.patch    |  52 ++
 .../xorg-lib/libx11/CVE-2023-43787-2.patch    |  64 ++
 .../recipes-graphics/xorg-lib/libx11_1.6.9.bb |   5 +
 .../libtiff/files/CVE-2022-40090.patch        | 548 ++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |   1 +
 .../curl/curl/CVE-2023-28321.patch            | 272 +++++++++
 .../curl/curl/CVE-2023-28322.patch            | 380 ++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   2 +
 meta/recipes-support/vim/vim.inc              |  25 +-
 34 files changed, 2658 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2023-4692.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2023-4693.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-1981.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38470-1.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38470-2.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38471-1.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38471-2.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2023-3341.patch
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/CVE-2022-40897.patch
 create mode 100644 meta/recipes-extended/shadow/files/0001-Overhaul-valid_field.patch
 create mode 100644 meta/recipes-extended/shadow/files/CVE-2023-29383.patch
 create mode 100644 meta/recipes-graphics/wayland/wayland/CVE-2021-3782.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43785.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43786-1.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43786-2.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43787-1.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43787-2.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-40090.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28321.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28322.patch

-- 
2.34.1


