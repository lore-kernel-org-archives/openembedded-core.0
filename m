Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A791ECA0EFA
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 13:44:46 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.64670.1756215878168625950
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 06:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=3Uax1CRF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so5130796b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 06:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756215877; x=1756820677; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NO/YhZy2n3OU6zLV3e3KH6QuoGwQSqhnof+IrJVGTHk=;
        b=3Uax1CRFOo2TF7joNWWYAR2CkauLIC829jkVpiDkE1MEH/3K9QSDf1TFc/IV4Zak51
         A/iis4jfNYO1RZd2KeDJhz4GMFkFFhJEjeIEDIw+rRYjOOujHes7+9x8iDDH+8e6E9tX
         PI0G0OlH1CEpyCkcVMJ5VsYosFhQQq3ZMEdWZOduNAN0tXxwVTPCQK3lmSwuIFh2DsHe
         MAHwQ5xepZUuSZCtoPnSwxmIoDJFsYKf5mKt5iIK20ACV9QVS+xFbJ0Z3BXLEdiP+YFg
         8e3W1/5+2yTCQWpXnhqlLoItBXfgHviFoaQ2iH9PmhRGaKnEYsOKDy/WBVaUkdj6s4+C
         miqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215877; x=1756820677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NO/YhZy2n3OU6zLV3e3KH6QuoGwQSqhnof+IrJVGTHk=;
        b=kXd4Lvsil1CVwcN+QHH2cZRVgSbG9aXkvBbI+g7syPWs5+Nb1UYL9wQHc265AoBVp/
         KRielKOQ8xuS38jwyBUYUrqx26JKDWDm/78jmZsUK4cyITU45yh8nj8Pg0ZbEjPxXV02
         FC39LwYNl1zUNjZHbDe5HY0L13M+MXil0Y/XIX218mthIUmBoArZYx2E2LQde0SQUXYW
         v/hTZZnWeWmPgcrsEZTBxirqXOsqcsWzw3kycCrW7fyhwFczF5vw8C42eM7SvrzuZWGH
         xaOqG6YfQo1cKKTM3+oOvMHKceqG/fz+rRFkrlBmMhx7qQ1+AaAVtT0g4BexpAPdoDEg
         P2Pw==
X-Gm-Message-State: AOJu0YwbiHGSPoMcCDgdOwo0YBU5giznrdx05OxXIS2PkSz1bO9WHU+T
	lSpwPYnhN5jNrCpKuYLu1M/5mspyNLeftnPq6697ZiLFQBDxGuq0RvvOtbXkjHz7uIvxtcifn2v
	zAkvc
X-Gm-Gg: ASbGncurFB2ibf8Dr4PrbSzzI6Hvw+RK3H1tk5Tl/UosQYQLoNmCDVKcRMp/4L8vUwb
	WlezpunRhQ7d6VzWZz4I7HB6Dv/PNoBTWlTbOGiCc9KWx4IR2x7kZt/TFpe20WTTWVsEjV20Tz7
	b+16O3XSvAMQiqz3IDFaYQA/iY5u7n5sLODjQEquVgsYoCIUroD8ogiMQEc9yC6mKH3CIEXtLR2
	vHyCUGQozpW+e+BYJxCR/rsNucG3V3vWuAy32LI42Yr7Bct5TzwQwNVDSlHUIyAhm7BUVCohIie
	LVyA19/EDAYLclMaHjzh8Rwz1TFqzL8JuEy8PeLQOTen572mxmeqpp+Hare0pVqfIhOyEaZ8jFs
	NLzie6P9oV8aihw==
X-Google-Smtp-Source: AGHT+IGlSH+ZGojrprxGjWPyIiaz7zmRceEVuGO1gLiHzmG1oZHlkTtuL1StbeeJEvsfCv/us1PgNA==
X-Received: by 2002:a17:903:3885:b0:246:61e:b55f with SMTP id d9443c01a7336-2462efdf210mr175674065ad.60.1756215877381;
        Tue, 26 Aug 2025 06:44:37 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1687:ddce:d4c7:f578])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24668779fa9sm96941595ad.27.2025.08.26.06.44.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 06:44:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/9] Patch review
Date: Tue, 26 Aug 2025 06:44:22 -0700
Message-ID: <cover.1756215756.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 13:44:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222461

Please review this set of changes for kirkstone and have comments back by
end of day Thursday, August 28

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2267

The following changes since commit e401a16d8e26d25cec95fcea98d6530036cffca1:

  libubootenv: backport patch to fix unknown type name 'size_t' (2025-08-19 10:14:55 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Hitendra Prajapati (1):
  gstreamer1.0-plugins-base: fix CVE-2025-47807

Jiaying Song (1):
  openssl: fix CVE-2023-50781

Peter Marko (4):
  qemu: ignore CVE-2024-7730
  glib-2.0: patch CVE-2025-7039
  dpkg: patch CVE-2025-6297
  libarchive: patch regression of patch for CVE-2025-5918

Vijay Anusuri (3):
  xserver-xorg: Fix for CVE-2025-49178
  xserver-xorg: Fix for CVE-2025-49179
  xserver-xorg: Fix for CVE-2025-49180

 .../openssl/openssl/CVE-2023-50781-1.patch    | 618 ++++++++++++++++++
 .../openssl/openssl/CVE-2023-50781-2.patch    | 358 ++++++++++
 .../openssl/openssl/CVE-2023-50781-3.patch    |  41 ++
 .../openssl/openssl/CVE-2023-50781-4.patch    | 441 +++++++++++++
 .../openssl/openssl/CVE-2023-50781-5.patch    | 284 ++++++++
 .../openssl/openssl/CVE-2023-50781-6.patch    |  57 ++
 .../openssl/openssl_3.0.17.bb                 |   8 +-
 .../glib-2.0/glib-2.0/CVE-2025-7039-01.patch  |  40 ++
 .../glib-2.0/glib-2.0/CVE-2025-7039-02.patch  |  43 ++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |   2 +
 .../dpkg/dpkg/CVE-2025-6297.patch             | 125 ++++
 meta/recipes-devtools/dpkg/dpkg_1.21.4.bb     |   1 +
 meta/recipes-devtools/qemu/qemu.inc           |   3 +
 ...2025-5918.patch => CVE-2025-5918-01.patch} |   0
 .../libarchive/CVE-2025-5918-02.patch         |  51 ++
 .../libarchive/libarchive_3.6.2.bb            |   3 +-
 .../xserver-xorg/CVE-2025-49178.patch         |  49 ++
 .../xserver-xorg/CVE-2025-49179.patch         |  67 ++
 .../xserver-xorg/CVE-2025-49180-1.patch       |  44 ++
 .../xserver-xorg/CVE-2025-49180-2.patch       |  52 ++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |   4 +
 .../CVE-2025-47807.patch                      |  49 ++
 .../gstreamer1.0-plugins-base_1.20.7.bb       |   1 +
 23 files changed, 2339 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-1.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-2.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-3.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-4.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-5.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-6.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-7039-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-7039-02.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/CVE-2025-6297.patch
 rename meta/recipes-extended/libarchive/libarchive/{CVE-2025-5918.patch => CVE-2025-5918-01.patch} (100%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5918-02.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49178.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49179.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49180-1.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49180-2.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2025-47807.patch

-- 
2.43.0


