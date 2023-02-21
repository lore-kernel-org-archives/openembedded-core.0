Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D976C677F1
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 20:45:19 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web10.53796.1677012316895960071
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 12:45:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bgg07NeJ;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: twoerner@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id a1so2388063iln.9
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 12:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EuNVXSYBydz1kD3+hvzkwAcCkIrsP94aomqX3w20rBQ=;
        b=bgg07NeJ4GJEvrHVQbmb/l0YvztVdGmtGH6fKfN2oBGq/G09kkflTxMGxBlqcj7q6c
         hanT+0i4DJipgdqRy07lErCnEph0mmneGX89WNAAiFnQgSWp9Wzc6uxahxtQRWdnqHyQ
         Zd5/Dpw5Mywy/kK+MisDQUjEdzOGkM0l7irgr/HQUaIBuMgHwzSdY7xEeX33wDKfFgEc
         ehrtz0v1CCG2eJTM6YKXo7CXSl15FWtjr/0Bhg3AOuMCQCt/B9GffcKnD7WSao9gFMdw
         J6/3tyGkQGGsIJSA0WtjbRI9OLm4In7HbmiZbzrPfsmkaTPyXt/JSrUc64wUPmOKn2tr
         JgIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EuNVXSYBydz1kD3+hvzkwAcCkIrsP94aomqX3w20rBQ=;
        b=7pKZRGBfkhhpSzoTpVvX/6d6476sl+mX872DRndUA2u3Bn79jAI7leaImKDLWxXJyU
         u2gGvS4UBJFjTI8HAo85YObNwJ63YkoP/9iFDd6g6TYgcp1lq/cot5Acy0SQq0Icd0og
         nwxEb1hJGhGGQe1hZ38sbJeFNT9Ql6u6LeDokkit7FOwJDOEc8QVr2fkuVb02OyJjSVE
         T5uUmJHj/irf+4krvargPgT17BbHeP4wq8l5R+vmF6q08NreERiHZN5Nnmgk5BDNw+Ts
         wlR3VQWgP/iCoyYvDqSz+6/F7vr+ybtYPIt+kayEaBtvxGNK3NjZyk6B5pAu45zYTERh
         xKxA==
X-Gm-Message-State: AO0yUKUj610Z4op5pBeZBVdS6xWrwFmLz3I7gM33F0BIb5nctW5+gnHf
	A9rMivfPPyuUJGWjg1knQsUz256Sa24=
X-Google-Smtp-Source: AK7set8rOeSnIh0OtwRJ1UBzZKow4kKiYKrWfI7JIeANN1CwbZksjuthkz3VXFSuD41wBts0jR/HXw==
X-Received: by 2002:a05:6e02:1c22:b0:313:e6ae:3490 with SMTP id m2-20020a056e021c2200b00313e6ae3490mr4243090ilh.14.1677012315938;
        Tue, 21 Feb 2023 12:45:15 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id e11-20020a02a50b000000b003a58ae912aasm414347jam.28.2023.02.21.12.45.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 12:45:14 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/11] QB_SMP: allow user modification
Date: Tue, 21 Feb 2023 15:44:44 -0500
Message-Id: <20230221204445.23931-11-twoerner@gmail.com>
X-Mailer: git-send-email 2.36.0.rc2.17.g4027e30c53
In-Reply-To: <20230221204445.23931-1-twoerner@gmail.com>
References: <20230221204445.23931-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 20:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177548

Allow a user to override the QM_SMP value giving them the opportunity to
select for themselves the number of CPUs to use in qemu.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/conf/machine/include/riscv/qemuriscv.inc  | 2 +-
 meta/conf/machine/include/x86/qemuboot-x86.inc | 2 +-
 meta/conf/machine/qemuarm.conf                 | 2 +-
 meta/conf/machine/qemuarm64.conf               | 2 +-
 meta/conf/machine/qemuppc64.conf               | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
index 1d32b4a58209..c977a266ca21 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -26,7 +26,7 @@ UBOOT_ENTRYPOINT:riscv32 = "0x80400000"
 UBOOT_ENTRYPOINT:riscv64 = "0x80200000"
 
 # qemuboot options
-QB_SMP = "-smp 4"
+QB_SMP ?= "-smp 4"
 QB_KERNEL_CMDLINE_APPEND = "earlycon=sbi"
 QB_MACHINE = "-machine virt"
 QB_DEFAULT_BIOS = "fw_jump.elf"
diff --git a/meta/conf/machine/include/x86/qemuboot-x86.inc b/meta/conf/machine/include/x86/qemuboot-x86.inc
index 3953679366d9..dd7e7c938413 100644
--- a/meta/conf/machine/include/x86/qemuboot-x86.inc
+++ b/meta/conf/machine/include/x86/qemuboot-x86.inc
@@ -1,6 +1,6 @@
 # For runqemu
 IMAGE_CLASSES += "qemuboot"
-QB_SMP = "-smp 4"
+QB_SMP ?= "-smp 4"
 QB_CPU:x86 = "-cpu IvyBridge -machine q35,i8042=off"
 QB_CPU_KVM:x86 = "-cpu IvyBridge -machine q35,i8042=off"
 
diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index 1bd4e3e154fc..c5234231e2e5 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -16,7 +16,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 QB_SYSTEM_NAME = "qemu-system-arm"
 QB_MACHINE = "-machine virt,highmem=off"
 QB_CPU = "-cpu cortex-a15"
-QB_SMP = "-smp 4"
+QB_SMP ?= "-smp 4"
 # Standard Serial console
 QB_KERNEL_CMDLINE_APPEND = "vmalloc=256"
 # For graphics to work we need to define the VGA device as well as the necessary USB devices
diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index ffc51c803fa7..2f0f0e4f842f 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -16,7 +16,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 QB_SYSTEM_NAME = "qemu-system-aarch64"
 QB_MACHINE = "-machine virt"
 QB_CPU = "-cpu cortex-a57"
-QB_SMP = "-smp 4"
+QB_SMP ?= "-smp 4"
 QB_CPU_KVM = "-cpu host -machine gic-version=3"
 # For graphics to work we need to define the VGA device as well as the necessary USB devices
 QB_GRAPHICS = "-device virtio-gpu-pci"
diff --git a/meta/conf/machine/qemuppc64.conf b/meta/conf/machine/qemuppc64.conf
index 770933931324..2fbd26a6f997 100644
--- a/meta/conf/machine/qemuppc64.conf
+++ b/meta/conf/machine/qemuppc64.conf
@@ -13,7 +13,7 @@ SERIAL_CONSOLES ?= "115200;hvc0"
 QB_SYSTEM_NAME = "qemu-system-ppc64"
 QB_MACHINE = "-machine pseries"
 QB_CPU = "-cpu POWER9"
-QB_SMP = "-smp 2"
+QB_SMP ?= "-smp 2"
 
 QB_NFSROOTFS_EXTRA_OPT = "wsize=524288,rsize=524288"
 QB_KERNEL_CMDLINE_APPEND = "console=hvc0 nohugevmalloc"
-- 
2.36.0.rc2.17.g4027e30c53


