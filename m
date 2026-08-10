Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF6F8C5AC82
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 05:11:22 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23469.1786338681155796367
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 22:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dMUK+6kk;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954dff6536so12024885e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 22:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786338679; x=1786943479; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uxFd2pKANCMeRXtUt5g3RcCXMD0Gfdq+OT1Tp848yuA=;
        b=dMUK+6kkjBIrgMEz9gIW6ZjKtsPiCkFbQZH7WA0p472MWT3/ThjMK82uXQWgy30kvp
         pgO/l334It7QX2T9B8aPblnxOjAQhe+qP7H9aPt5hp41OpqrY1z4E6PtCo4KPpKCmavx
         QrMEbHMSBHNTvnJ0tz9cSGHucll3uhiD2bZFyCxpZaZVntvatRB7lyLoSFRamOOEHexM
         kpW2xOHy+FOhMvgI+yN7Q3PQp7Tn8Y9WYiZGapFL9xG7bZmHWoP3lTF2nQGti4i8p0Z1
         /dhUoDH1c+sTxsDc5p1N8ZCapEyrdO3pGCyes7F+OF3bTM6nXssZNnTrcXEQe0OIemAr
         rtBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786338679; x=1786943479;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uxFd2pKANCMeRXtUt5g3RcCXMD0Gfdq+OT1Tp848yuA=;
        b=SGgRO/+ifTeBOc1hgD3TPK9PFHFR0nU2wUu1pqs1P7Oqbvegg2v/to8FT+NUmmrvSI
         pmEB0OzYrm3aAHQlLHgNsw2prM1yzFfXeL3Q03NGf3UF0z5gSOmU53UEi9jdfSB/CASD
         k4PqUTH205gWfufRn7IS9c5qfXgs6/eILXVgVjz75m4xuCjBxidIx+Bzwz27mj0oxGF4
         TSUnqBaBbs3JiOX01HLxSkWmoNvVY4Hrju5stzA3aqZH6i3iHFPKX1vYOvjJjly1zUMd
         /UT99ZzuzoMWFFyPzNYVI8gRZRNv0KzB1HX8ivT2/ZcVs3POQJ7tu8qeKOJgcF8KMVFi
         HXVA==
X-Gm-Message-State: AOJu0Yxs4yLGA8qf1oAA/jgC5IQanWM5HFYcxDOQlAYldg94UgmIF4xW
	6EibdeuzjCxoh2YkAIgu79efvfBWW2byCO6u1S00qXUywlKtjCRCe5O3mdG0iQ==
X-Gm-Gg: AR+sD10PMJWBPkHa5JJ7NU9SH9EwZOxlid7kd0gmxJqBwvyEILWsa7WSaewSSwkLHor
	fYnkY5h2Vr7vB46OkDyCl+6HlsasX2vSk51/MB7dC89XSCVD2SdsWguLvveeU4PqYP1RkWdDz3Z
	axsADOfKoGFoQmt7fKRSSIuDO58D9QJZ3nShP5q2D8GpgFJ2o8Al29KCeDPL7JlLFvnlDmcJelF
	YkCkewxez5S3pt1GxF+WXL/0mmnM63B5WP6f45NXafedKHmsccNE+dO1aWykHEHeUYNcqfdU0oJ
	OSsr98S5AspCNRdesPv11Tqdg8e6H3YCjRo/jtPrrZWJcijKAwBLQVhor8uAbIZkqSohk+EohUy
	wLFdC6uTJzVbZilVzHVVMK9J8cWnjb48pVKidEvXKJ7Tz4eSYXJErIzMMgBt77U0qCgJElacYBo
	oSX1GBSkxK+K3oKzbPsQPHU19WiPvEgPqWYW5NPrPGkDIjcmKESNW3lvtsp9KlOG3j0hHPIam1f
	hea2ZUUoNh/5oH+CMvfcceNt9M5X9lCK3s2MvE=
X-Received: by 2002:a05:600c:4f82:b0:499:518d:ebd6 with SMTP id 5b1f17b1804b1-49959e3c714mr324734155e9.17.1786338679113;
        Sun, 09 Aug 2026 22:11:19 -0700 (PDT)
Received: from [192.168.5.15] (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995422016fsm315556305e9.8.2026.08.09.22.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 22:11:18 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [PATCH v2 0/2] tune-cortexa32: Add AArch32 QEMU machine
Date: Mon, 10 Aug 2026 06:11:06 +0100
Message-Id: <20260810-tune-a32-v2-0-52045fd54937@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGpdeWoC/22NQQ6CMBBFr0JmbU07NIKuvIdhUcoAY4SStjQaw
 t0F3Lp8yfvvLxDIMwW4ZQt4ShzYjRvgKQPbm7Ejwc3GgBIvspBKxHkkYXIURdlKVKhLba+w6ZO
 nlt9H6lH9OMz1k2zc97vRc4jOf46vpHbvTzYpIYXReYtlrZrC6Hs3GH6drRugWtf1C6PPEWiyA
 AAA
X-Change-ID: 20260701-tune-a32-78f0212484c9
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>, 
 Alex Kiernan <alexk@a-squared-projects.uk>, Jon Mason <jdmason@kudzu.us>
X-Mailer: b4 0.15.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 05:11:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243105

Cortex-A32 is an AArch32-only ARMv8-A core - it has no AArch64 mode at
all. The current tune-cortexa32.inc lacks the thumb feature, and its
AArch32 crypto FPU selection and PACKAGE_EXTRA_ARCHS names are wrong for
a Thumb-2 build.

Adds a qemuarmv8a32 machine so the above is actually exercisable: QEMU
has no Cortex-A32 model, so it runs on the 'virt' machine with
qemu-system-aarch64 using the Cortex-A32's AArch64-capable sibling, the
Cortex-A35, with 'aarch64=off' so the guest is AArch32-only. This
provides the ARMv8-A AArch32 feature set including the crypto extensions
needed by the crypto tune, and the same binary supports KVM on AArch64
hosts whose CPUs implement AArch32 at EL1 via '-cpu host,aarch64=off'.
The kernel is built as a zImage and u-boot uses qemu_arm_defconfig,
matching the other 32-bit ARM QEMU machines.

AI-Generated: Claude Code (Claude Opus 4.8)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Alex Kiernan <alexk@a-squared-projects.uk>
---
Changes in v2:
- Drop merged AArch32 ARMv8-A patches
- Cherry-pick upstream QEMU support to Allow aarch64=off for TCG
- Rework qemuarmv8a32 so it runs on qemu-system-aarch64 with aarch64=off
- Link to v1: https://patch.msgid.link/20260701-tune-a32-v1-0-a43f28b1d7a4@gmail.com

---
Alex Kiernan (2):
      qemu: Backport support for 'aarch64=off' with TCG
      qemuarmv8a32: add QEMU machine for AArch32 ARMv8-A

 meta/conf/machine/qemuarmv8a32.conf                |  38 ++++++
 meta/recipes-devtools/qemu/qemu.inc                |   2 +
 ...lear-AArch64-ID-regs-from-ARMISARegisters.patch | 110 +++++++++++++++++
 ...-Allow-aarch64-off-to-be-set-for-TCG-CPUs.patch | 134 +++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_6.18.bb      |   2 +-
 5 files changed, 285 insertions(+), 1 deletion(-)
---
base-commit: ddb2dd22942f2fcacb6b88d5b37d2a26ca832982
change-id: 20260701-tune-a32-78f0212484c9

Best regards,
--  
Alex Kiernan <alex.kiernan@gmail.com>


