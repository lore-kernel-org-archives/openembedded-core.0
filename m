Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EBDBEB3648
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 00:46:03 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7682.1772498754277201661
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 16:45:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lcRHDpcC;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4645dde00a7so6334192b6e.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 16:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772498753; x=1773103553; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+7wSz64LsbPC8JKn3bh+ITt6UxgzzTiozodhrwtjaw=;
        b=lcRHDpcC9K/2guUr4slv0wa519Enx3FPWDP67dcXiVZK6Eh5d1aipxE+Zor+otlTOe
         M6WJCi/hhbz3tia3HF4s1wOw377Ca9WZqkHTQkVRpTFWjniWAks1TmVaQWnXxhvtInEf
         FUpwkYyYxQWcbqmYs4PHdXU7eqbdWVWZMGR9sxuGEbbC4123slPREuOZcJSq8nozNy6W
         qKalzCyW/8XD0lKbI5/EeCZan+K7scY3sYTCozT6h1yhGFn0Q7XcrvbABAceGKH9TWvU
         X+d4Yj1Rhuzysv6b3JR7xbevAuA36M7aFNA1ZvNnSOAlT/B/SMMYMfhm7Uvz473B4pDr
         6CFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772498753; x=1773103553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N+7wSz64LsbPC8JKn3bh+ITt6UxgzzTiozodhrwtjaw=;
        b=Frf/Ebh0B6IeZlkLf12TADSNo1kVfnN/lth1orRsc2LcfNyMrphNCUqsXI8OKOvIIu
         rFjTajWSuJT0LajDgE67wRTyQp0bzsvdAc7uCUFjJ/eXjLTul5t9MuCJl7QpLQcej9U3
         FhgWo6E9tA7fi+J4idJEBxYLXkoD4bZBzRZMBNcq5+2v7kPWYaem9IC42P/fJJBx5ZtN
         5DlpC13KUL1ZmFAY10CKz1i7YexHBKdr+a22z6iVBC7MY2lcoj4xR4IXjpkIoJij8xof
         nK+w4G9ZWn/r5xFFs4N4jnHJ0wo2ulvgsRe9nity8izZ27mCRwt3I71/R4te+eVBeBiC
         +OQA==
X-Gm-Message-State: AOJu0YzuDaz/EL42767VWSgBY93vQ3GTwyWaSCWezvIOOtJozJCGgyUE
	z4RsEzydOP/kge4RKewVshOM2DtzLs9apMnRLU796imnanI6RFAxkdg3OkDByw==
X-Gm-Gg: ATEYQzzNR/g5z1IaJQMyUWkrP1ZWpQkuaZZSOo9hf1OuAfdgviVsLE8hi26jvo1Yubh
	4Qr2HScB47PKkutcbBfu76A2sgAt+4MTJEYK/U4qbxOyDySd/udTdgpzg3b3bEzX41GSx0Fw1jK
	V210NYjsYnsAOOQ31/wW1YnmKuuSezvV0SywqENZ6uIM4+taF+YQnMpPvNodfkJ70OJuyxH0Xd8
	wUnrEITby6SYwZ/nrHKw+jKRTMkaqsJFKCdj0nQ9RRlLay7NI16dgWSxTVeJy/dS04TM12nchdf
	O5kYpt6yb7WoDgFZx3cbPm7A0HJaPFhXUs9astMZCQSwo50V6c3gLQnKvDIEiU8he4DZH+Z/Ma0
	KsgP5soOLoHKvpf0apvMQIphrycjA6J2zO+j0CjDvNtcPJ+PpP+BwC46fxqV+Gok2dCprMcbuhk
	53eSKis0CkDURxAK0aWzgzio8KoKx3DV8=
X-Received: by 2002:a05:6808:1494:b0:43f:28bb:2f85 with SMTP id 5614622812f47-4650c681376mr171846b6e.8.1772498753329;
        Mon, 02 Mar 2026 16:45:53 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::ba6c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-464bb59b66fsm8637446b6e.10.2026.03.02.16.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 16:45:52 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: benjamin.robin@bootlin.com,
	ross.burton@arm.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v4 0/9] Add SPDX 3 Recipe Information
Date: Mon,  2 Mar 2026 17:43:47 -0700
Message-ID: <20260303004550.650726-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226173930.2847872-1-JPEWhacker@gmail.com>
References: <20260226173930.2847872-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 00:46:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232223

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

Joshua Watt (9):
  llvm-project-source: Use allarch.bbclass
  gcc-source: Use allarch.bbclass
  spdx3: Add recipe SPDX data
  spdx3: Add recipe SBoM task
  spdx3: Add is-native property
  spdx30: Include patch file information in VEX
  spdx: De-duplicate CreationInfo
  spdx_common: Check for dependent task in task flags
  spdx30: Skip install package CVE information

 meta/classes-global/sstate.bbclass            |   4 +-
 .../create-spdx-image-3.0.bbclass             |   4 +-
 .../create-spdx-sdk-3.0.bbclass               |   4 +-
 meta/classes-recipe/kernel.bbclass            |   2 +-
 meta/classes-recipe/nospdx.bbclass            |   1 +
 meta/classes/create-spdx-2.2.bbclass          |  12 +-
 meta/classes/create-spdx-3.0.bbclass          |  92 +++-
 meta/classes/spdx-common.bbclass              |  22 +-
 meta/conf/distro/include/maintainers.inc      |   1 +
 meta/lib/oe/sbom30.py                         | 192 ++++---
 meta/lib/oe/spdx30.py                         |   2 +-
 meta/lib/oe/spdx30_tasks.py                   | 488 +++++++++++++-----
 meta/lib/oe/spdx_common.py                    |  11 +
 meta/lib/oeqa/selftest/cases/spdx.py          |  41 +-
 .../meta/meta-world-recipe-sbom.bb            |  29 ++
 .../clang/llvm-project-source.inc             |   8 +-
 meta/recipes-devtools/gcc/gcc-source.inc      |  16 +-
 17 files changed, 669 insertions(+), 260 deletions(-)
 create mode 100644 meta/recipes-core/meta/meta-world-recipe-sbom.bb

-- 
2.53.0


