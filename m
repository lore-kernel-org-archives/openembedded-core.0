Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C152ACDE007
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 14:17:18 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8323.1782310631095797321
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 07:17:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ovBwGd1v;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6a0ddedcd00so497984eaf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 07:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782310630; x=1782915430; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+Hk2+YachxqQX6kWSojLn2SnN6LUuJSYR8UrGWFTD4=;
        b=ovBwGd1vtpbeCU2y2D4IL3Mro+KZutcjf6OWcHjWei5F6FjoVjjFGp5b6YzChV0HX0
         YN5M2x1TmOy4wVlNbIuX4dVUcMV8N9ZxOfofZFLHj6FuBCtlB0jp7P8q27MLM0V9Coh0
         PAERKQNFKiCQenIMyLiFNjorIh0zTj9yj8WD6O7gUkJs2wer8BqlhgMWby9E2EBwbUH9
         jwZ3v7bAYb8GI34RIvyYDWL/o7PsLBIBCcdy39Vb/MFEC9AaLAdamYPLqMKfsfq6XrhY
         rLOpQQ/ewhklF034LX5pi3ZEk3IUmtWqQIBIWE7IeWm2JTkPbYfUQEIBwNo/GHTWslMB
         zLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782310630; x=1782915430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3+Hk2+YachxqQX6kWSojLn2SnN6LUuJSYR8UrGWFTD4=;
        b=N9P6zyMrdrjX6KC934geZ5Li6c8/kYv3KKP0jpBKL+wGyDcLpOtwAgYNSeC9PqGzu5
         oRpheoqXw11PJFmriWY6361RYpOV6/h+urFJ3E90jlHOYQg+UrAJe3GiQXWFzPv7YBZK
         TLB8y4DP8R22DHSZN6urRgDuW3yjjh7vtHcmEvbYMQ8s/9CQ7a7w+DS6XuIut0BHvX9G
         lMT+wktN8aK7PXJeUpRd/Ttuaba8Y4OcryXHI0Cobnni4ZvBw+rmd8BOGseY+/xUEb+y
         EWLCyrmjXERFCzbNx26vKQME1UoHnbx+hOn4fp6GmFla3I+kb0lDZZVQDunPMlRl7s8R
         NzYw==
X-Gm-Message-State: AOJu0Yw9KWBse5Jdz6jdjHwZoHNBeU/O4A/llAXh2XHivseVReSRTV1g
	pc1jEwwVXrhOlqzvu9o4b+/foKjWniin6o7BXfDWtgm/eDTr4Djba1fekmLHDQ==
X-Gm-Gg: AfdE7clEzhiOk+KkL65f9v6AUhh5aL0z3JsriZKAzh19Cmuj+VMimbmv+P2ZVbb511U
	yMz3U4dS1tWAj1KdIPAKba50z8BavjH4aLRMrpr8cTUTSS36nSD2S/tk4s1qqfbEvxOXZQ/KOvD
	zBCu/PmOGsTIsD8pQEMRj9gtL+f85uYQS6k/HOafgJ1mOucca3dVB1vKQ4/YanNjpBrpF1hDIew
	BRQ1fpYN+FBML1O2HD3kPSsXwBZBylfcgJWQzGYPpWXQb2Tfkwd1Ipo+CwgFWdOpFNDcBYMtX4C
	agjdcAemj89TTNxlhg7/yZSJTJGAd0YYu490gDcRtvZEd6QpU32wosUhFyK9Z70zHPj60Nepd/a
	pomIE4JR9W0c9fGRj9b9cluQKgnW1na5Nc0Gv1lfzGp9hoYu6MtCPlrBUIOLWA0hhNSZ12TGSqs
	lNn67vaoYhtA==
X-Received: by 2002:a05:6820:1c8f:b0:69e:3ba9:dffd with SMTP id 006d021491bc7-6a122e816famr2071897eaf.19.1782310630181;
        Wed, 24 Jun 2026 07:17:10 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::87cd])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a0e9f2a4e9sm8946149eaf.2.2026.06.24.07.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 07:17:09 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3 0/8] Implement SPDX for deploy tasks
Date: Wed, 24 Jun 2026 08:15:17 -0600
Message-ID: <20260624141706.2164567-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618165032.347436-1-JPEWhacker@gmail.com>
References: <20260618165032.347436-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 14:17:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239509

The SPDX use case for file system image has been well defined since SPDX
was first implemented, however there has always been a desire to also
express SPDX output for other non-image deliverables (primarily, those
that have a do_deploy task or similar). These types of tasks cannot
easily use the traditional method of having a separate SPDX task that
runs to create their SPDX output as this causes lots of problems with
the way dependencies are specified. Instead, it is desirable for these
tasks to directly produce SPDX output that can be consumed by other
tasks that depend on them.

This patch series adds support for this. Any sstate task that starts
with "do_deploy" can now be added to the SPDX_DEPLOY_TASKS list and it
will run a postfunc to generate SPDX output that describes what is being
deployed. For classical do_deploy tasks, this is setup to be easy by
automatically capturing all the deployed output files in the SPDX data,
but other tasks can be added as well.

Finally, the do_create_image_spdx task is removed and replaced with a
SPDX deploy postfunc using this new system. This means that any task
that depends on do_image_complete will automatically also get the SPDX
output for the image, simplifying the dependency handling.

V2: Fixed SPDX documents missing at SBoM creation time when the
documents were not a direct dependency of the SBoM, and were present in
a sstate object. Previously, these sstate objects were not restored
because they were "covered" by the later sstate tasks, but now they are
restored if they are depended on by a task that creates SPDX output.

V3: Fixed a bug where dependencies that are not in the taskhash could be
missing when the final SBoM is created and added tests.

Joshua Watt (8):
  spdx: Skip dependencies that are not in the taskhash
  spdx: Add ability for deploy tasks to create SPDX
  oeqa: Add SPDX deploy SBoM test
  classes-global/sstate: Keep SPDX generating setscene dependencies
  Add SPDX deploy tasks to various recipes
  spdx: Replace do_create_image_spdx with deploy task
  grub-efi: Change to MACHINE_ARCH
  systemd-boot: Change to MACHINE_ARCH

 meta/classes-global/sstate.bbclass            |  38 ++-
 meta/classes-recipe/barebox.bbclass           |   1 +
 .../create-spdx-image-3.0.bbclass             |  32 +-
 meta/classes-recipe/deploy.bbclass            |   1 +
 meta/classes-recipe/devicetree.bbclass        |   1 +
 meta/classes-recipe/kernel-fit-image.bbclass  |   1 +
 meta/classes-recipe/kernel.bbclass            |   1 +
 meta/classes-recipe/nospdx.bbclass            |   2 +-
 meta/classes/create-spdx-3.0.bbclass          | 173 ++++++++++
 meta/classes/spdx-common.bbclass              |   2 +-
 meta/lib/oe/sbom30.py                         |  46 ++-
 meta/lib/oe/spdx30_tasks.py                   | 314 ++++++++++++++----
 meta/lib/oe/spdx_common.py                    |   2 +-
 meta/lib/oeqa/selftest/cases/spdx.py          |  11 +
 meta/recipes-bsp/grub/grub-efi_2.14.bb        |   3 +
 meta/recipes-bsp/opensbi/opensbi_1.8.1.bb     |   1 +
 meta/recipes-bsp/u-boot/u-boot.inc            |   1 +
 .../systemd/systemd-boot_259.5.bb             |   4 +-
 18 files changed, 534 insertions(+), 100 deletions(-)

-- 
2.54.0


