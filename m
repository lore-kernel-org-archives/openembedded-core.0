Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D52FD4F1F
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 18:41:12 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2594.1773168064754314122
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 11:41:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YTU0eNzu;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4671cbce465so793105b6e.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 11:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773168064; x=1773772864; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GVN8BsWJ91n6Ck6f+fTXfnuWB3r+gmTUV8WlG2wXn/Q=;
        b=YTU0eNzuuO2hmxUPEXK3r+2HoW+HmrsGjuMnGdEj/Qp2QNosb3pvlTItCJoA3p7x8M
         grKF2nKncPEzm/hWsH9lcQT9pCCl3EqjQIZkUNJodr+L/JWkUNaRebkvy0PMUpOmuM0f
         I9MPnncaItZ8kUUw1a8Rd+LItt8sOv+dB/W4XSSKfK+c2/sCxpBkwHLL0umJsBdYUwu1
         XFotBePAaciYjEPiyPNgey0AYeImcN4Fn8iLhvkfSG/miCKpUxmNcns1PC+6J5QVc1Is
         uurmmvPfgSV2Dgguqo/byLlmKqD7LCZe01yMWljbqSYzZHpmgPYauckR9nip08gnJ8Pi
         KbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773168064; x=1773772864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GVN8BsWJ91n6Ck6f+fTXfnuWB3r+gmTUV8WlG2wXn/Q=;
        b=gFOmQiqnUO9hWSMTuxr1RxKtuSnib5EPJ4R0J3sExNbEtuyZbf6euPq6NDpfQz+agu
         FhHRDpqvn4KGY2AR7VKCx4Owk4VUu4AXDPo3QEbDPqy/Rx+qmMM4HX74yDv1prp8p9Ai
         zmpb0nFo1XHjhR2RtnNKC1HM0qUaAA2Ac5m3QYC+ydIgpqspWWOsTAEjhuYVgNTznb8W
         nGXwS+WQK1AeuMSARagC10NaXqhK47/xTtr/KbXJBAYzkEHG1tUb5BueNuoDx95VgNOA
         48anwRo2flmOzYAcQ4xc1YuHdsJz93iMM42kGsCNb7zwoAvOogAB8yRPhpkEO73Aa1Sg
         xqTQ==
X-Gm-Message-State: AOJu0YzCSPlfSxbq7icNQmTxZjqyR72ZjhbttC+MBuII+7qacp8faBVa
	40LaBuNLDgRMQQ7T2aihAU1Lrqn5a9GFiBf1liJvZDRISX1IhKiQ0PjyUfWtQw==
X-Gm-Gg: ATEYQzylGACVsB6fBpul8WeDaswPWsVfA2ZRYVuuY/AGCwGmKmYySnItANslVamSScC
	2korwrYahj5En7hfoO8o39FT74EFDnXE1ZgWneRNoWY+HIt1r3ZNnSGKJhmrY5vaXPaS6BxEf9i
	fbxbkRLlBTt1Km2w/dbul4nqVvgnacG84N03lEEDogcaHGP+QTXem7toWQC1UPg9jJ6u4XqNxB3
	zkmZtjD4MAJ5LiqT4PdemKY9WXreX73g5827P3uG/0iTYza5SXSNaCmgfWcw3XxA6cnphzCFK5P
	a/0D+ntemyTHi5Fljv8l/Dyvx6ameCCr1A4eFNUEngWOW/KJfAGZ/QR50loerbDb72sM6iXsFZo
	U/ytcf3N9+C97RuLWuQ1AMxI1caZfWpP0SR/fauYBrMbjadLueJ4mW0FCrwxogKCYVJfkh3jR+D
	AZf2E2M98BYC2Yg/mTtmuq
X-Received: by 2002:a05:6808:238f:b0:463:ab56:9ed1 with SMTP id 5614622812f47-466dc9f47ebmr8122989b6e.6.1773168063809;
        Tue, 10 Mar 2026 11:41:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4200:11c0::9891])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4671d2a7ebfsm2444524b6e.20.2026.03.10.11.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 11:41:03 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v6 00/15] Add SPDX 3 Recipe Information
Date: Tue, 10 Mar 2026 12:38:20 -0600
Message-ID: <20260310184058.533343-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304164835.3072507-1-JPEWhacker@gmail.com>
References: <20260304164835.3072507-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 18:41:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232811

Changes the SPDX 3 output to include a "recipe" package that describe
static information available at parse time (without building). This is
primarily useful for gathering SPDX 3 VEX information about some or all
recipes, enabling SPDX 3 to be used in place of cve_check.bbclass and
vex.bbclass.

Special thanks to Benjamin Robin <benjamin.robin@bootlin.com> for
helping work through this.

V2: Fixes a bug where do_populate_sysroot was running when it should not
be. Drops the patch to ignore ASSUME_PROVIDES recipes, since this is
incorrect (this is already handled by bitbake in the taskgraph, and
doesn't need to be manually removed).

V3: Fixes a bug where meta-world-recipe-sbom was reporting a circular
dependency. meta-world-recipe-sbom also no longer runs in world builds,
as there's no reason to this. Finally, fixes a bug where
NO_GENERIC_LICENSE files would fail to be found in do_create_spdx
(because do_unpack was not run).

V4: Fixes test cases. Adds SPDX_PACKAGE_INCLUDE_VEX to control if VEX
information is linked to binary packages, or just recipes. Defaults to
"0" to significantly reduce the size of the SPDX output.

V5: Fixes dummy-sdk-packages to not generate SPDX output, since it
does funny things with its arch which prevents it from rebuilding SPDX
data properly, and no SPDX data is needed for it anyway

V6: Fixes a bug where SPDX task would not correctly re-run when they
change, which would cause errors about missing SPDX document. Also
updates to the latest version of the SPDX bindings which improves
performance

Joshua Watt (15):
  llvm-project-source: Use allarch.bbclass
  gcc-source: Use allarch.bbclass
  spdx3: Add recipe SPDX data
  spdx3: Add recipe SBoM task
  spdx3: Add is-native property
  spdx30: Include patch file information in VEX
  spdx: De-duplicate CreationInfo
  spdx_common: Check for dependent task in task flags
  spdx30: Skip install package CVE information
  dummy-sdk-package: Disable SPDX
  spdx: Remove fatal errors for missing providers
  spdx3: Use common variable for vardeps
  glibc-testsuite: Do not generate SPDX
  spdx: Remove do_collect_spdx_deps task
  spdx: Update to latest bindings

 meta/classes-global/sstate.bbclass            |    4 +-
 .../create-spdx-image-3.0.bbclass             |    4 +-
 .../create-spdx-sdk-3.0.bbclass               |    4 +-
 meta/classes-recipe/kernel.bbclass            |    2 +-
 meta/classes-recipe/nospdx.bbclass            |    2 +-
 meta/classes/create-spdx-2.2.bbclass          |   33 +-
 meta/classes/create-spdx-3.0.bbclass          |   92 +-
 meta/classes/spdx-common.bbclass              |   34 +-
 meta/conf/distro/include/maintainers.inc      |    1 +
 meta/lib/oe/sbom30.py                         |  239 +-
 meta/lib/oe/spdx30/__init__.py                |    8 +
 meta/lib/oe/spdx30/__main__.py                |   12 +
 meta/lib/oe/spdx30/cmd.py                     |   75 +
 meta/lib/oe/{spdx30.py => spdx30/model.py}    | 5935 ++++++++++-------
 meta/lib/oe/spdx30/stub.pyi                   | 2544 +++++++
 meta/lib/oe/spdx30_tasks.py                   |  512 +-
 meta/lib/oe/spdx_common.py                    |   78 +-
 meta/lib/oeqa/selftest/cases/spdx.py          |   41 +-
 .../glibc/glibc-testsuite_2.42.bb             |    1 +
 meta/recipes-core/meta/dummy-sdk-package.inc  |    1 +
 .../meta/meta-world-recipe-sbom.bb            |   29 +
 .../clang/llvm-project-source.inc             |    8 +-
 meta/recipes-devtools/gcc/gcc-source.inc      |   16 +-
 scripts/contrib/make-spdx-bindings.sh         |    3 +-
 24 files changed, 6922 insertions(+), 2756 deletions(-)
 create mode 100644 meta/lib/oe/spdx30/__init__.py
 create mode 100644 meta/lib/oe/spdx30/__main__.py
 create mode 100644 meta/lib/oe/spdx30/cmd.py
 rename meta/lib/oe/{spdx30.py => spdx30/model.py} (52%)
 create mode 100644 meta/lib/oe/spdx30/stub.pyi
 create mode 100644 meta/recipes-core/meta/meta-world-recipe-sbom.bb

-- 
2.53.0


