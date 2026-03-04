Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E48EF9002
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 16:48:46 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23099.1772642918776032061
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 08:48:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bcUKKKv4;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-46391e91e16so4957827b6e.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 08:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772642918; x=1773247718; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVuryeRCjevGdB14tqyQUloKI0A4Opi0qK9GOfD7oBQ=;
        b=bcUKKKv4GJDzB5ojfUs5Y6h4T/YYJ40Ak0s1TBiJ0TAGozqTw1pijNupV/gqybHdN/
         BUX7qv0w2Mw9DP8ofp0g28v/3UnHNKo7ywDsWIdYK4KRDxdHshyZoJUfzIivptK6U4An
         va8jKlpNxlMKfJFdOlilXYobvdyo24uVvN0UcelqkpZwvBwJlugQhyOhYrCa8jhbXqmy
         vzAYVCqdH+5kIKa4PINUl3QR7fRxX2AJJcwQ+fsDubel4esHLQDT4/5BoYBekLqV7Kfq
         gH6+HEAKGpHAposOp6ZKMUBSb7ywZS+OxruFyLMWvExwZJKHBUn3RxqNj9Za1eemgvkE
         +7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772642918; x=1773247718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PVuryeRCjevGdB14tqyQUloKI0A4Opi0qK9GOfD7oBQ=;
        b=tEPfMxAPI67uk4jbgqKvzMlFdExalni+BJqPAJHRnO12SWhQEAnd83ddsuNjAao9Cy
         LSWTTxpD7SMIztq3qOrqBXdT/OLubiJxwa2Kb8mEqc6HSdY++4c1j6nJ9Ps9XhjiEw5U
         E+fgHP+ujxVry4xtxu8bMweWDL0nhpMajITiVCNBczYPXJq17zvQ6iGo5TokJ3zjYpvl
         YJ2XfilWsVa6MYgBdaPSmMGF5pEy1nQcII2818vWubbwkeL5KQOWUJY/fLhpWfr7ciL7
         bOfOZLYVmf+SXeNiddaoQfbH9IjQJQ2SZK4aeWkHDAuoVjRA16lHbKo4CrnO1OSoIM47
         r1Yw==
X-Gm-Message-State: AOJu0Yyj4Smsdev69eXwa4nx43ohImRWqMAnR95DrpFtKx9qrOI3OubT
	TxhVRMegAKJqoeGvP5EOhfE5ylAwiX/CNZjAsrg07umO0lyPOFMXFsf2p1F2mA==
X-Gm-Gg: ATEYQzyCyABUqGtcTpBpS3PHLvG0fk5f9+HXOUxTFcpXtC48kViEl9WQ8CTpF3IrC5c
	33k+hzZDZ8vOEfoBykoTtWOf0/5xaBooA2mTpDO8RcfJ9seMe3JmoFXDo5rGaoR8RixTUCldkox
	Cs/Y5wf7yeyr0kXyFM8mgXLe7D/IymshGeKx/wBb6OLdBjqcvbiWn4l74pE2W1gRLAkfqY0/c0/
	p2b4ui2yuCrHi37zSWW0b2xZN0WuZCkD8iben+e7nRTZdCBBoWiu3EE1wZ9XTIgfFSMr2bkNcVl
	e9C1J1TRogfJ/saR64JxGl4nBPj8T7VRVZEIpbz+kz/u3mgyMSNz9IIa11BCzXIyo1rovrxEdfM
	al8r9KmZlahC0/EmWeA5iumeePbCFA0S8QCA3w1yKZLvErNLhoWxVuPG994B2Umw4cCWv9DADTc
	tKDzxl3/mCVwWfPGQSRQq1oe6jzV8+8SE=
X-Received: by 2002:a05:6808:3086:b0:464:a0b8:3a4b with SMTP id 5614622812f47-4651acaea3fmr1176418b6e.40.1772642917698;
        Wed, 04 Mar 2026 08:48:37 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::f681])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4160d2c9fc2sm18466442fac.18.2026.03.04.08.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 08:48:37 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v5 00/13] Add SPDX 3 Recipe Information
Date: Wed,  4 Mar 2026 09:44:11 -0700
Message-ID: <20260304164835.3072507-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303004550.650726-1-JPEWhacker@gmail.com>
References: <20260303004550.650726-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 16:48:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232384

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

Joshua Watt (13):
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

 meta/classes-global/sstate.bbclass            |   4 +-
 .../create-spdx-image-3.0.bbclass             |   4 +-
 .../create-spdx-sdk-3.0.bbclass               |   4 +-
 meta/classes-recipe/kernel.bbclass            |   2 +-
 meta/classes-recipe/nospdx.bbclass            |   1 +
 meta/classes/create-spdx-2.2.bbclass          |  15 +-
 meta/classes/create-spdx-3.0.bbclass          |  87 ++-
 meta/classes/spdx-common.bbclass              |  22 +-
 meta/conf/distro/include/maintainers.inc      |   1 +
 meta/lib/oe/sbom30.py                         | 192 ++++---
 meta/lib/oe/spdx30.py                         |   2 +-
 meta/lib/oe/spdx30_tasks.py                   | 496 +++++++++++++-----
 meta/lib/oe/spdx_common.py                    |  11 +
 meta/lib/oeqa/selftest/cases/spdx.py          |  41 +-
 .../glibc/glibc-testsuite_2.42.bb             |   1 +
 meta/recipes-core/meta/dummy-sdk-package.inc  |   1 +
 .../meta/meta-world-recipe-sbom.bb            |  29 +
 .../clang/llvm-project-source.inc             |   8 +-
 meta/recipes-devtools/gcc/gcc-source.inc      |  16 +-
 19 files changed, 667 insertions(+), 270 deletions(-)
 create mode 100644 meta/recipes-core/meta/meta-world-recipe-sbom.bb

-- 
2.53.0


