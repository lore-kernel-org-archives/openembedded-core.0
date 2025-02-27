Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88FB1C19F32
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 17:40:01 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.17016.1740677998521529951
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 09:39:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rmCCZ2PP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2233622fdffso25276465ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 09:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740677998; x=1741282798; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=drlB5xtVF8Roq1Mc0SsgU3I4MTpES+612KYNaJu0naA=;
        b=rmCCZ2PPHMtQz9cnuMFiADVqVkG1IpzoR1SBoapFG/gdchL41JBsbkWnAH/ZpREPp2
         YOJ2Dx7otm83OhmvyNAw6kfkPbfOjdcvrW0IgwMs41aSbrtl5ReRcXhzTnZ4XitXDBUS
         hzZgBBZIW/dCNjY5QBCIbkd7p+rXq1wCqyz3a78g4ws8x8YHE8TvQ6lXsqGlqzL4NdYV
         UqWvnylTxjoUgIYzE5WgYcA3n8MWsFMy59jRcuViZ1NzpEf5PLVOGqS/B1hjSeks8SLn
         l1I5mDawzw7kVUHjYd/9DveEawLq9fhkGgt7/3KT/BgvQYF2BCBztlTLOQ6XYRqqwkuC
         3ZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740677998; x=1741282798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=drlB5xtVF8Roq1Mc0SsgU3I4MTpES+612KYNaJu0naA=;
        b=W6rt9jE0F4ItqyFt5WKnL7A/zy3Kp4lA+jOLSv9Lqc0P7791x00u+B17nBC1awYBuQ
         V2CFzP52FdpvSQgNGyK3jkyZ3MqF/HSgvTd/9ruDinq484OusfeTn+PL4/HJVLsxxYFG
         vz9cz+aR/PF0suLEaukz9gLnun1jeeMVR7O7xNnlO5ChVk9gvQg3q5V5/g5drsACj5ao
         6Pn2VdnhUYzg+kDBkNsBuOTrGe4YWzaaTLQxckGER4uDRmJykylFTiteOkIupvVteMO1
         AdNZdh3TqwCbW1/FBmQCa3wGP/GZwJKwxjxBOJYmOGeBjm/8ep2YEDDa3EOAtT+DFSBk
         3/Sw==
X-Gm-Message-State: AOJu0YxqE+GYNxFxB7SAUOzjKMx342O8iIlW2HKAYnuJm7Dva5Nvi3S+
	tKtxv0WvTjYojoC/QIO3nYVQRObM/8rtrZ5odfkvZ1Z+i0Rw6Y2OAg1LeVwyZ8paZRTOROyKTN6
	U
X-Gm-Gg: ASbGnctJ2OcLWMfTnUlv6kFtLd6l0FrDcJrhy/VAsIK9DhIE9K8RAirPQVD3SOmtjaX
	z4MB3hU4TfsN4w6guVby32z6GhJytIx0B547zRJlagsd68mfk1/xQdBFGYhX8bmJKmBpJZ2oeue
	+JxrqOePNonJnCtmW98BnU7jMi/MAFblB0AFx54OxADPIPAdHTd6dbxEFsgR4QOxXQUlqsYO25n
	gURCNNgNybFdS7yfGHO1DnSvxm/IO8d1XgOCBYjsMUEZbkhCCSF4dkRKKpPTwX8mAPDQd2qMfj1
	e+ye7CkElG44Z8AiOg==
X-Google-Smtp-Source: AGHT+IGgONXMjP3U3Y4w/YHfdtKUeuVqSjm5WytVA9YPSB2tbMyenjXRHN3jGJCiumryf9pJOvFbHQ==
X-Received: by 2002:a05:6a20:1590:b0:1f2:e31c:527e with SMTP id adf61e73a8af0-1f2e31c5401mr7951072637.34.1740677997488;
        Thu, 27 Feb 2025 09:39:57 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:1dd4:58fa:4fa2:f901])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a00249c3sm1914727b3a.85.2025.02.27.09.39.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 09:39:57 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/15] Patch review
Date: Thu, 27 Feb 2025 09:39:35 -0800
Message-ID: <cover.1740677838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 17:40:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212022

Please review this set of changes for kirkstone and have comments back by
end of day Monday, March 3

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1094

The following changes since commit 73b5570a16708d1e749b1ec525299d10557cbf56:

  vim: Upgrade 9.1.0764 -> 9.1.1043 (2025-02-24 06:54:05 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Guocai He (2):
  tzcode: Update SRC_URI
  xz: Update SRC_URI

Jiaying Song (1):
  boost: fix do_fetch error

Libo Chen (1):
  virglrenderer: fix do_fetch error

Moritz Haase (1):
  meta: Enable '-o pipefail' for the SDK installer

Narpat Mali (1):
  systemd: upgrade 250.5 -> 250.14

Vijay Anusuri (9):
  xserver-xorg: Fix for CVE-2025-26594
  xserver-xorg: Fix for CVE-2025-26595
  xserver-xorg: Fix for CVE-2025-26596
  xserver-xorg: Fix for CVE-2025-26597
  xserver-xorg: Fix for CVE-2025-26598
  xserver-xorg: Fix for CVE-2025-26599
  xserver-xorg: Fix for CVE-2025-26600
  xserver-xorg: Fix for CVE-2025-26601
  bind: Upgrade 9.18.28 -> 9.18.33

 meta/files/toolchain-shar-extract.sh          |   5 +
 .../bind/{bind_9.18.28.bb => bind_9.18.33.bb} |   2 +-
 ...d-boot_250.5.bb => systemd-boot_250.14.bb} |   0
 meta/recipes-core/systemd/systemd.inc         |   2 +-
 .../0001-Adjust-for-musl-headers.patch        |  20 +-
 ...sysctl.d-binfmt.d-modules-load.d-to-.patch |  18 +-
 ...1-core-fix-build-when-seccomp-is-off.patch |  41 ++
 ...ass-correct-parameters-to-getdents64.patch |  49 ++-
 ...w-json_variant_dump-to-return-an-err.patch |  60 ---
 .../0002-Add-sys-stat.h-for-S_IFDIR.patch     |   6 +-
 ...3-missing_type.h-add-comparison_fn_t.patch |   6 +-
 ...k-parse_printf_format-implementation.patch |   6 +-
 ...missing.h-check-for-missing-strndupa.patch |  62 ++-
 ...OB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch |   8 +-
 ...008-add-missing-FTW_-macros-for-musl.patch |   4 +-
 ..._register_atfork-for-non-glibc-build.patch |   6 +-
 ...10-Use-uintmax_t-for-handling-rlim_t.patch |   6 +-
 ...sable-tests-for-missing-typedefs-in-.patch |   2 +-
 ...T_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |   4 +-
 ...patible-basename-for-non-glibc-syste.patch |   2 +-
 ...uffering-when-writing-to-oom_score_a.patch |   6 +-
 ...compliant-strerror_r-from-GNU-specif.patch |   2 +-
 ...definition-of-prctl_mm_map-structure.patch |   2 +-
 .../0021-test-json.c-define-M_PIl.patch       |   4 +-
 ...-not-disable-buffer-in-writing-files.patch |  38 +-
 .../0025-Handle-__cpu_mask-usage.patch        |   2 +-
 .../systemd/0026-Handle-missing-gshadow.patch |   4 +-
 ...l.h-Define-MIPS-ABI-defines-for-musl.patch |   4 +-
 .../systemd/systemd/CVE-2022-3821.patch       |  45 --
 .../systemd/systemd/CVE-2022-4415-1.patch     | 109 -----
 .../systemd/systemd/CVE-2022-4415-2.patch     | 391 ------------------
 .../systemd/systemd/CVE-2022-45873.patch      | 124 ------
 .../systemd/systemd/CVE-2023-7008.patch       |  40 --
 .../{systemd_250.5.bb => systemd_250.14.bb}   |   7 +-
 meta/recipes-extended/timezone/timezone.inc   |   8 +-
 meta/recipes-extended/xz/xz_5.2.6.bb          |   2 +-
 .../virglrenderer/virglrenderer_0.9.1.bb      |   2 +-
 .../xserver-xorg/CVE-2025-26594-1.patch       |  54 +++
 .../xserver-xorg/CVE-2025-26594-2.patch       |  51 +++
 .../xserver-xorg/CVE-2025-26595.patch         |  65 +++
 .../xserver-xorg/CVE-2025-26596.patch         |  49 +++
 .../xserver-xorg/CVE-2025-26597.patch         |  46 +++
 .../xserver-xorg/CVE-2025-26598.patch         | 120 ++++++
 .../xserver-xorg/CVE-2025-26599-1.patch       |  66 +++
 .../xserver-xorg/CVE-2025-26599-2.patch       | 129 ++++++
 .../xserver-xorg/CVE-2025-26600.patch         |  68 +++
 .../xserver-xorg/CVE-2025-26601-1.patch       |  71 ++++
 .../xserver-xorg/CVE-2025-26601-2.patch       |  85 ++++
 .../xserver-xorg/CVE-2025-26601-3.patch       |  52 +++
 .../xserver-xorg/CVE-2025-26601-4.patch       | 132 ++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |  13 +
 meta/recipes-support/boost/boost-1.78.0.inc   |   2 +-
 52 files changed, 1201 insertions(+), 901 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.28.bb => bind_9.18.33.bb} (97%)
 rename meta/recipes-core/systemd/{systemd-boot_250.5.bb => systemd-boot_250.14.bb} (100%)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-core-fix-build-when-seccomp-is-off.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-shared-json-allow-json_variant_dump-to-return-an-err.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/CVE-2022-3821.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/CVE-2022-4415-1.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/CVE-2022-4415-2.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/CVE-2022-45873.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/CVE-2023-7008.patch
 rename meta/recipes-core/systemd/{systemd_250.5.bb => systemd_250.14.bb} (99%)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26594-1.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26594-2.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26595.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26596.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26597.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26598.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26599-1.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26599-2.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26600.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26601-1.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26601-2.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26601-3.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26601-4.patch

-- 
2.43.0


