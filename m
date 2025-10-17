Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B065DCCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:39:23 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.3198.1760733559207256771
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:39:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gAE4pygj;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-781db5068b8so1988779b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760733558; x=1761338358; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=a8gbPg31SAXG4RiyOelWNCX8oas0lljBCd0jbGlU/54=;
        b=gAE4pygjoN9N10aPyQ6PqJ2DPY8VbxtCKYzgL0+Vtwx79DgSPGfWe26BvoVTQeQrc3
         kj6awmixnY2ShBH6VJNbwKIIDW1a9Zcjxx+AGhZg7cBAHgoyo9LIqTEHqaLTl2CV0D0B
         qTjMCGUYVrhl2gKhlDNIdUDYeXBKOrcwXyV6wC2HS9g1xquKwlSOUDxlSlqT6Bid1sV4
         eLSI+nNGbUyARvKSnzZTS7Vhk66b8eAx/uzP3IbsVao3cZe1k/X2lyrTjGiXBYRA+0qg
         J+AKSDR6uKPA0m43nDOBHi03Tm7fBxl671uOFoO4Gd/Be1qS7yd+OkhdNxYklagM3y2Y
         K0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733558; x=1761338358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a8gbPg31SAXG4RiyOelWNCX8oas0lljBCd0jbGlU/54=;
        b=efSxO2bziA3rnN561TWOlaoN7JSGEbiLSkV+cOkw0GTTs+NEMZ6rmZwnvctVfY1wiH
         NOsgBcilC7pwIyoecBbFt/RcVGxxvb/xVh1SirJ5NGb22ScPmaqh7jfbH3dcSmnRxj0Z
         rsQnfb0/InIYYm0XZJhFnCiXNTbCvjW1DiQlTXQrh9HfiLIChz9K+besi8pPzeBCWS/g
         4j3NCF+dX2yk2genJVJUlqximAfqgfQ4yI8K7s+vzmrJ+rq5In3cLNFKhsmgZZNQY/2D
         /le+cW0CN170STGupakMm28x8cGHNUh8RNTdaKgwScVEQNiKA2mylWFZRtOEHvrgcE+L
         64+w==
X-Gm-Message-State: AOJu0YxCwPUn1PYkMRZlqjF/KL52yIpzGoOyy3bikJsg+06kgsOvBIHC
	X3uXgK0yyZOYFk6ivvtkn045AsRBfqEC3M+UDpaoM/WdeLW208Rsu1CNreGCeEOlSdSzuRYvh/w
	jxq5TLUs=
X-Gm-Gg: ASbGnctsQlyllmET1WojiBIrrylOkWdeqikomic+F0IRsiXEfkVTLYJwt69OskOQCsK
	WZlBpBn2oSrvfzbd/CEr171kowXl4BKzHpKHheEMbsNjOeasmciSfkXst1LhWfGgA5fzaO2Dzoj
	at2vDJBiv5PlTI6LymwVwmAm0lH2bbrlIlbGuDcUnAB3mHHHNW5Xu7gRLyYHG5qD2snskNT6wZL
	hpf2OvbLE+dHm6FXmycKGvRiCkXfiQtbp6NPIsXB9N04K1BVS5TOKGhn4rET74gLizhgPC3GJdj
	uZwQPsQa5ihGI6gpXL7UMB+Z2hQs12TBobZRfEveFD4hpRDhr0Gd6h7WkvFTClEPQ6q4v3BDL9S
	N4QS4lQrTeN0MwMIBSVmnh9q4hqPG5WucTLa04MKRSM3igu6UtKZ4944oiabZhbD4SSaPcASFCn
	Ma
X-Google-Smtp-Source: AGHT+IEqHDAWFR+9iwd7NE2WnTmw06g4mO9gnwoaigf/nBAuRWiOoXF9PyfqxbylukqBJjMfJswGxg==
X-Received: by 2002:a05:6a00:1895:b0:77d:13e3:cd08 with SMTP id d2e1a72fcca58-7a220a31668mr6031697b3a.5.1760733558315;
        Fri, 17 Oct 2025 13:39:18 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aaee:e640:34cd:6f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f254esm477061b3a.45.2025.10.17.13.39.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:39:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/26] Patch review
Date: Fri, 17 Oct 2025 13:38:43 -0700
Message-ID: <cover.1760733431.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 20:39:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225034

Please review this set of changes for scarthgap and have comments back by
end of day Tuesday, October 21

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2608

The following changes since commit 7af6b75221d5703ba5bf43c7cd9f1e7a2e0ed20b:

  build-appliance-image: Update to scarthgap head revision (2025-10-13 12:47:05 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Bruce Ashfield (12):
  linux-yocto/6.6: update to v6.6.98
  linux-yocto/6.6: update to v6.6.99
  linux-yocto/6.6: update to v6.6.100
  linux-yocto/6.6: update to v6.6.101
  linux-yocto/6.6: update to v6.6.102
  linux-yocto/6.6: update to v6.6.103
  linux-yocto/6.6: update to v6.6.106
  linux-yocto/6.6: update to v6.6.107
  linux-yocto/6.6: update to v6.6.108
  linux-yocto/6.6: update to v6.6.109
  linux-yocto/6.6: update to v6.6.110
  linux-yocto/6.6: update to v6.6.111

Carlos Alberto Lopez Perez (1):
  icu: Backport patch to fix build issues with long paths (>512 chars)

David Nyström (2):
  openssh: fix CVE-2025-61985
  openssh: fix CVE-2025-61984

Deepesh Varatharajan (1):
  glibc: stable 2.39 branch updates

Michael Haener (1):
  oeqa/runtime/ping: don't bother trying to ping localhost

Peter Marko (5):
  qemu: patch CVE-2024-8354
  binutils: patch CVE-2025-11082
  binutils: patch CVE-2025-11083
  gnupg: mark CVE-2025-30258 as patched
  python3: upgrade 3.12.11 -> 3.12.12

Rajeshkumar Ramasamy (2):
  glib-networking: fix CVE-2025-60018
  glib-networking: fix CVE-2025-60019

Saravanan (2):
  python3-xmltodict: fix CVE-2025-9375
  cmake: fix CVE-2025-9301

 meta/lib/oeqa/runtime/cases/ping.py           |   7 +
 .../openssh/openssh/CVE-2025-61984.patch      | 125 ++++++++++
 .../openssh/openssh/CVE-2025-61985.patch      |  47 ++++
 .../openssh/openssh_9.6p1.bb                  |   2 +
 .../glib-networking/CVE-2025-60018.patch      |  83 +++++++
 .../glib-networking/CVE-2025-60019.patch      | 147 ++++++++++++
 .../glib-networking/glib-networking_2.78.1.bb |   2 +
 meta/recipes-core/glibc/glibc-version.inc     |   4 +-
 .../binutils/binutils-2.42.inc                |   2 +
 .../binutils/0024-CVE-2025-11082.patch        |  46 ++++
 .../binutils/0025-CVE-2025-11083.patch        |  77 ++++++
 .../cmake/cmake/CVE-2025-9301.patch           |  71 ++++++
 meta/recipes-devtools/cmake/cmake_3.28.3.bb   |   1 +
 .../python3-xmltodict/CVE-2025-9375-1.patch   | 111 +++++++++
 .../python3-xmltodict/CVE-2025-9375-2.patch   | 176 ++++++++++++++
 .../python/python3-xmltodict_0.13.0.bb        |   2 +
 ...e-treat-overflow-in-UID-GID-as-failu.patch |   2 +-
 .../python/python3/CVE-2025-8194.patch        | 219 ------------------
 ...{python3_3.12.11.bb => python3_3.12.12.bb} |   3 +-
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2024-8354.patch             |  75 ++++++
 .../linux/linux-yocto-rt_6.6.bb               |   6 +-
 .../linux/linux-yocto-tiny_6.6.bb             |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  |  28 +--
 meta/recipes-support/gnupg/gnupg_2.4.8.bb     |   1 +
 ...813_rise_buffer_sizes_pkgdata_PR3058.patch |  72 ++++++
 meta/recipes-support/icu/icu_74-2.bb          |   1 +
 test                                          |   0
 28 files changed, 1073 insertions(+), 244 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2025-61984.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2025-61985.patch
 create mode 100644 meta/recipes-core/glib-networking/glib-networking/CVE-2025-60018.patch
 create mode 100644 meta/recipes-core/glib-networking/glib-networking/CVE-2025-60019.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0024-CVE-2025-11082.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0025-CVE-2025-11083.patch
 create mode 100644 meta/recipes-devtools/cmake/cmake/CVE-2025-9301.patch
 create mode 100644 meta/recipes-devtools/python/python3-xmltodict/CVE-2025-9375-1.patch
 create mode 100644 meta/recipes-devtools/python/python3-xmltodict/CVE-2025-9375-2.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-8194.patch
 rename meta/recipes-devtools/python/{python3_3.12.11.bb => python3_3.12.12.bb} (99%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-8354.patch
 create mode 100644 meta/recipes-support/icu/icu/ICU-22813_rise_buffer_sizes_pkgdata_PR3058.patch
 create mode 100644 test

-- 
2.43.0


