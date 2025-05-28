Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 116A4C5B549
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 15:34:01 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.923.1748446432408330204
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 08:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Bb/n3vAU;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-742c7a52e97so4095130b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 08:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748446432; x=1749051232; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SjN/l1pgqMbuVWqpdtyK3/Vt+7Cw+hwuY7p7TdZ9zRQ=;
        b=Bb/n3vAUGgqN7cSTWFCxZRq6pcNfS/1blhXqKjg65jh2I2ayNLJmvixD3Kx54Jv56V
         vgpXPMiqZpwzeFw1HLbQoeKUgqnuBNAUJKwGXNxDOdK3QfsgEuxqD1XGOIF7q6DyyriR
         pRHkqjQbYxmlShW6ue+ECwjr/RH5Fllm7kn3Y3Uf4zLuzQE6IKjB9EKc+Ca9fJysNMUU
         lWPvxeq7ho96HAiaPUx11R4M4VWLR3QJ6EazWyv0R3oMMWU1pxkVNB+6nOKgRdWZz8zw
         xd1NvgmZqvNZol1Noz+rwkqIz2z8x4XpsSNLGR1gUTA2tmaYLn5kO8roGQOmgWDzpQoR
         epFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748446432; x=1749051232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SjN/l1pgqMbuVWqpdtyK3/Vt+7Cw+hwuY7p7TdZ9zRQ=;
        b=qEWZ12qbdScSiX7JzYHGwwFbbW4yEa8sWt+K+0ARcDnpcxyKMDPy3QFO8NUBvuM8r0
         ZCzEKGR7mL4IvVsfHFI4Qc3+snyznQHNFWDQrYQh2tZIzEStsLoGjOuM5kytOWarGb5q
         9y5Q/uqYlr3xWDvEtJ/fuaP0cQBUCKnx54EdY6dCQkyVuzHlbJJMnU+fGe5lbNIkm1dX
         O2vsAEv6jOUCSZAVJuWrgD17I+6h7WhSzs9a7IeQ97kbIE0+i7Egjflo2VqCdDCmrqeO
         D74P5okV01WSG554ckzIZh1vchjpBWZCtSUnZ5TUvu/v3sLjNLoRSClgsgbHDAYcQ7T9
         PfOw==
X-Gm-Message-State: AOJu0YyTHC9Dedj1kaNssWFX7ACyOUv18pWOMswGRPj2EV8HPELfCA1U
	Td3TQxkzKvH7co1I+Ch0aReBF1wj7Agl2m3M5octgbyYlF7IZd1XZdevHCPI+BdMtg4hqGrPqmf
	/dixV
X-Gm-Gg: ASbGnctkSZ8o6gGAqzaQ4d9z9DcY/EHuG6KFNEmU1WoQcFl+hAjtQDqP72hbjxIKM+R
	7PO4bptb4AHVwk1KaFAfOE+3+adrsP39y/YvEpGRxpQtmIlT0tsaCVBHGhPT723kkTS4lzANx65
	ujD1K2hzOIA5Y62O4qZswn8PLnF+cKCn2vF022v95jVQKV4+6+dPJsp+Q2a4rV7+HnoFyVlIFdZ
	ZtW/kgWHw5NM6rL4VMBQQzMJm6FT+aLdVPaHe6TFDGCMeTdPksy7BG/MHXt3Y7XKH37DtoLL5V9
	3JTlW1u0poPnJyalfVNROXOEWs+fvbrSHnmrqmhKT7E=
X-Google-Smtp-Source: AGHT+IHXTQ8zsa1ZyLp6CeCuWi8gXGUzJloGme7o2++oFlsh0uL91N9gzmxs5dhr67oynYchNWluKQ==
X-Received: by 2002:a05:6a20:9f90:b0:1f3:41d5:65f6 with SMTP id adf61e73a8af0-2188c34145bmr32503187637.32.1748446431617;
        Wed, 28 May 2025 08:33:51 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2f2f:1884:f4cc:456c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-746e343c1basm1400268b3a.132.2025.05.28.08.33.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 08:33:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 08/14] binutils: Fix CVE-2025-1178
Date: Wed, 28 May 2025 08:33:17 -0700
Message-ID: <3325b9dfd7a0da2236c96630b67ac2c6d4375840.1748446235.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748446235.git.steve@sakoman.com>
References: <cover.1748446235.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 15:34:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217372

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Prevent an abort in the bfd linker when attempting to
generate dynamic relocs for a corrupt input file.

PR 32638

Backport a patch from upstream to fix CVE-2025-1178
Upstream-Status: Backport from [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=75086e9de1707281172cc77f178e7949a4414ed0]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.44.inc                |  1 +
 .../binutils/0015-CVE-2025-1178.patch         | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0015-CVE-2025-1178.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index 28100abbe9..681b42fc3c 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -35,5 +35,6 @@ SRC_URI = "\
      file://0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
+     file://0015-CVE-2025-1178.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0015-CVE-2025-1178.patch b/meta/recipes-devtools/binutils/binutils/0015-CVE-2025-1178.patch
new file mode 100644
index 0000000000..c39f43fba4
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0015-CVE-2025-1178.patch
@@ -0,0 +1,33 @@
+From 75086e9de1707281172cc77f178e7949a4414ed0 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 5 Feb 2025 13:26:51 +0000
+Subject: [PATCH] Prevent an abort in the bfd linker when attempting to
+ generate dynamic relocs for a corrupt input file.
+
+PR 32638
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=75086e9de1707281172cc77f178e7949a4414ed0]
+CVE: CVE-2025-1178
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/bfd/elf64-x86-64.c b/bfd/elf64-x86-64.c
+index cb32732e..a08e9c97 100644
+--- a/bfd/elf64-x86-64.c
++++ b/bfd/elf64-x86-64.c
+@@ -5031,6 +5031,15 @@ elf_x86_64_finish_dynamic_symbol (bfd *output_bfd,
+ 
+       if (generate_dynamic_reloc)
+ 	{
++	  /* If the relgot section has not been created, then
++	     generate an error instead of a reloc.  cf PR 32638.  */
++	  if (relgot == NULL || relgot->size == 0)
++	    {
++	      info->callbacks->einfo (_("%F%pB: Unable to generate dynamic relocs because a suitable section does not exist\n"),
++					output_bfd);
++	      return false;
++	    }
++	  
+ 	  if (relative_reloc_name != NULL
+ 	      && htab->params->report_relative_reloc)
+ 	    _bfd_x86_elf_link_report_relative_reloc
-- 
2.43.0


