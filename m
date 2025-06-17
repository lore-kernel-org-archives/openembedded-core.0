Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA041C71157
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 21:20:34 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.31406.1750195232309880513
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 14:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dwKzBNHq;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-74849e33349so5210949b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 14:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750195231; x=1750800031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SZmAA0E2SWnOK95qmvHK3+DKponzratbJLkcy8YaB84=;
        b=dwKzBNHq90kYiyM6quy/Xn92OVnriAk2AG0ZQvpWKg/yIvA5CurzgfNXFE2CpsOE0T
         +5qbXmUmYfqXI29dz0dWGptejwRP7XHCg8ZqfKsFb4+W/l3yHPvVUwd1MtjTcfbiZH/+
         4SYjcgZ5Hz351pkC3V/u7kcAQuUi/EwnorkJ74+NsZbafhsUepd8fuxhaafX3Y94L0dJ
         dpjhF46JRso+ST9xvRe+ez+X7x7mK4heXT4RrdSkU+LO3yNXfgYS84z6+WsWpZNQJ//2
         PS6SLc7/NCc26sxXH+HjNJKEYCdxYxE7uncbB+OrF9vZAKAT4u2hv2JkvcLSX9K9vDnX
         5zHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195231; x=1750800031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SZmAA0E2SWnOK95qmvHK3+DKponzratbJLkcy8YaB84=;
        b=OWIOdbPnOa/Q5uLhpBoQVEzbetVeSntnJ9xJ7/1BIg+WPvH8hEXBABrpzOWnbsfmjv
         mwyfclaOKpi6Mphry4yEMUCb+F2cj8ZtFn6MA7UcyBT8Er9gyw5yEPgv6z0b+r1kotiU
         deeFxwjEQaBWwa0VXdo3QnS8rfHpPylP/OtXZieocWpqUavThvECBYP2CrontWmVAgF8
         rCBtI4wGuXqW1tWkakD0Qn/ufE1xO596qKgeqk4Anp86aVXwCvX0yxhPX6RoaB190EKX
         ePwVFVD2P3pNGirVjnYnY+giia2JZrrAsp3PkyT9GNg4CACgUAxsENSJZnmLGylANl1O
         5G7g==
X-Gm-Message-State: AOJu0YzimBbHXLXUCC2920Iy0fWAmkFjXsTtAPtbpHgPrteBVKapNR4F
	eU7f/JrLCBUyMhI+5VQ+t6BQigb92iBsJobJiynoHntF5i+XEolCFguW7eudJonuxxu7x4G7UBq
	7pJB0
X-Gm-Gg: ASbGncsFiGlShSer/2RPz274E4K4toUiQLZJFXZinEbvs8iiHNKTxuqEva2dR9cxF92
	VZ8j0VDiWwDFonP0esnMItOTQWNvoduF81U/mkzfJYSJ1vEpFEV13za6gkYiAC0gpk0UQeWpOjj
	+taJVuUosCVtqvxlegPXsXeopA5Eo97q2HoYAGj1kF+WNAXhsOst48xKi3XjfsiwzDmtL30UhPP
	r25kJD8lrxQJOYtLSt5AILmRL4Yu+omhpFpnlmeC+nu9NjOUW394HzNpBblW3/2ERDGbmXdYWlA
	6asZbu2/zN3155IKsrTN3qK46MvqJ370AAt5qsFmT+jqlvBcjnxPfg==
X-Google-Smtp-Source: AGHT+IE66O54kRP/ZW4W/aap6MqNnD49yuLuLNrrNTw1tvu0LfXuKyh6MDF07m78bS8hBLRyMi5tHQ==
X-Received: by 2002:a05:6a00:3c8f:b0:73c:c11:b42e with SMTP id d2e1a72fcca58-7489d0309f3mr21721564b3a.20.1750195231295;
        Tue, 17 Jun 2025 14:20:31 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffeccf1sm9720728b3a.18.2025.06.17.14.20.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 14:20:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/27] Patch review
Date: Tue, 17 Jun 2025 14:19:57 -0700
Message-ID: <cover.1750195103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 21:20:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218917

Please review this set of changes for kirkstone and have comments back by
end of day Thursday, June 19

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1828

The following changes since commit 350513959f6800eef6579153c2ae95960ca24ea7:

  kernel.bbclass: add original package name to RPROVIDES for -image and -base (2025-06-09 08:44:59 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Aditya Tayade (1):
  e2fsprogs: removed 'sed -u' option

Aleksandar Nikolic (1):
  scripts/install-buildtools: Update to 4.0.27

Colin Pinnell McAllister (1):
  ffmpeg: fix CVE-2025-1373

Guocai He (1):
  babeltrace/libatomic-ops: correct the SRC_URI

Jiaying Song (1):
  python3-requests: fix CVE-2024-47081

Peter Marko (1):
  net-tools: patch CVE-2025-46836

Poonam Jadhav (1):
  libpng: Improve ptest

Sunil Dora (9):
  Glibc: Fix for CVE-2025-4802
  glibc: pthreads NPTL lost wakeup fix 2
  glibc: nptl Update comments and indentation for new condvar
    implementation
  glibc: nptl Remove unnecessary catch-all-wake in condvar group switch
  glibc: nptl Remove unnecessary quadruple check in pthread_cond_wait
  glibc: nptl Use a single loop in pthread_cond_wait instaed of a nested
    loop
  glibc: nptl Fix indentation
  glibc: nptl rename __condvar_quiesce_and_switch_g1
  glibc: nptl Use all of g1_start and g_signals

Vijay Anusuri (9):
  libsoup-2.4: Fix CVE-2025-2784
  libsoup: Fix CVE-2025-2784
  libsoup-2.4: Fix CVE-2025-32050
  libsoup: Fix CVE-2025-32050
  libsoup-2.4: Fix CVE-2025-32052
  libsoup: Fix CVE-2025-32052
  libsoup-2.4: Fix CVE-2025-32053
  libsoup: Fix CVE-2025-32053
  libsoup: Fix CVE-2025-46420

aszh07 (2):
  ffmpeg: Add "libswresample libavcodec" to CVE_PRODUCT
  xz: Update LICENSE variable for xz packages

 .../distro/include/ptest-packagelists.inc     |   2 +-
 .../glibc/glibc/0025-CVE-2025-4802.patch      | 249 ++++++++++
 .../glibc/glibc/0026-PR25847-1.patch          | 455 ++++++++++++++++++
 .../glibc/glibc/0026-PR25847-2.patch          | 144 ++++++
 .../glibc/glibc/0026-PR25847-3.patch          |  77 +++
 .../glibc/glibc/0026-PR25847-4.patch          | 117 +++++
 .../glibc/glibc/0026-PR25847-5.patch          | 105 ++++
 .../glibc/glibc/0026-PR25847-6.patch          | 169 +++++++
 .../glibc/glibc/0026-PR25847-7.patch          | 160 ++++++
 .../glibc/glibc/0026-PR25847-8.patch          | 192 ++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   9 +
 .../e2fsprogs/e2fsprogs/run-ptest             |   3 +-
 .../python3-requests/CVE-2024-47081.patch     |  37 ++
 .../python/python3-requests_2.27.1.bb         |   1 +
 .../net-tools/CVE-2025-46836-01.patch         |  91 ++++
 .../net-tools/CVE-2025-46836-02.patch         |  31 ++
 .../net-tools/net-tools_2.10.bb               |   2 +
 meta/recipes-extended/xz/xz_5.2.6.bb          |   6 +-
 .../recipes-kernel/lttng/babeltrace_1.5.11.bb |   2 +-
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb |   7 +
 .../recipes-multimedia/libpng/files/run-ptest |  26 +-
 .../libpng/libpng_1.6.39.bb                   |  43 +-
 .../libatomic-ops/libatomic-ops_7.6.14.bb     |   4 +-
 .../libsoup/libsoup-2.4/CVE-2025-2784-1.patch |  52 ++
 .../libsoup/libsoup-2.4/CVE-2025-2784-2.patch | 135 ++++++
 .../libsoup/libsoup-2.4/CVE-2025-32050.patch  |  28 ++
 .../libsoup/libsoup-2.4/CVE-2025-32052.patch  |  30 ++
 .../libsoup/libsoup-2.4/CVE-2025-32053.patch  |  38 ++
 .../libsoup/libsoup-2.4_2.74.2.bb             |   5 +
 .../libsoup/libsoup/CVE-2025-2784-1.patch     |  73 +++
 .../libsoup/libsoup/CVE-2025-2784-2.patch     | 140 ++++++
 .../libsoup/libsoup/CVE-2025-32050.patch      |  28 ++
 .../libsoup/libsoup/CVE-2025-32052.patch      |  30 ++
 .../libsoup/libsoup/CVE-2025-32053.patch      |  38 ++
 .../libsoup/libsoup/CVE-2025-46420.patch      |  60 +++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |   6 +
 scripts/install-buildtools                    |   4 +-
 37 files changed, 2557 insertions(+), 42 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-1.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-2.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-3.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-4.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-5.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-6.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-7.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-8.patch
 create mode 100644 meta/recipes-devtools/python/python3-requests/CVE-2024-47081.patch
 create mode 100644 meta/recipes-extended/net-tools/net-tools/CVE-2025-46836-01.patch
 create mode 100644 meta/recipes-extended/net-tools/net-tools/CVE-2025-46836-02.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-2784-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-2784-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32050.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32052.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32053.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-46420.patch

-- 
2.43.0


