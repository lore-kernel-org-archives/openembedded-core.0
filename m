Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D67C44507
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 18:43:26 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.881.1783881802294653467
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 11:43:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=TuhFib9t;
 spf=pass (domain: underview.tech, ip: 74.125.224.47, mailfrom: vince@underview.tech)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-664d7863920so2021326d50.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 11:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783881801; x=1784486601; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xY0Pn7U6NOSf7/OLBPumK49syT+tCcj+nuXZL9nMcxI=;
        b=TuhFib9tuhkNQYpGLZIgfDM9bddYCSXsGR1WrO8RmsME7ciBPCpXbbyAnbsKfGnv4P
         I1yfVxuFoTO0jbD3hi2Qh3bfkPc1kwlXZZrkX/w8QOKqdECEETNRYROKe9dzqCIB33WU
         WJJh5htWqaG6x1k7tRAEWN+nP54Jb5Avtb4HW4GBjj3/IC6ftq5YFTTTa5Nqyp/QJ3xo
         vw2tkxkTAEUzsnILc8BdDFLjDSZMQvG55TqNj51YUc1673cOlaTMI3plByRd3bYLwcQJ
         iVlILKzOfW3yXQsoUBvhi0eBV+08P1lnRVJ6WisJCDX2Cr3z4lhC8eW/Mv5ENM92Mq+T
         NmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783881801; x=1784486601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xY0Pn7U6NOSf7/OLBPumK49syT+tCcj+nuXZL9nMcxI=;
        b=tNOfDN0Bl+0WmjLqbNOEAWdEkNEI7cJ8JJfJo7VbSUCr0Z9a7BuW8r/sJ5kWHmsjDW
         zmy7B1xEoLFIC7MSIBo/N7NhSm18GAuUZU3I6gUdNxTmiysZq9nPmb97VmkF3zSZ22LE
         wTSBWkpUA3fxEL4pDBwgB6oHcF6ygkqZtJdbpbzpB1jh/sSozo2f/wbb7wfaIQWLXJAE
         w9ZzXhtqlKOY5dS9pNGdCcEnJ5wNvyJJ79cWRnPZPjltRZZwiJ/8kk1r2rc5hk+68ukT
         qkWu6WyptzmJsjYXoIC2zvYLSPRK0dav4qru5ftGYqYZjMZhSZcg8Bn2F5kiGWXasbaQ
         UBEA==
X-Gm-Message-State: AOJu0YzyzBU7EBUQk8Q+8OxERWHWytP0CG1JOsUTxnDcnrHGE9f+J44p
	NfQEdtuS2BXPW9c2YZgLl0xvtGedxd65Lt1BGaURUybGotbaPWqzFcVHbmYL1vgCp2s3afDmanH
	j2Z0qxuM=
X-Gm-Gg: AfdE7cnHWtCoWxCJ5aVp7qsVzWYUwprW2eZGYbxlANM3pPDUOiVfpdBQmx15lReDmdG
	JBHCEWttH3qhAN8Mm+LWHKvdSo2uPDYhCPUvUkNX0GVxeUJJokFpbn7vk1fh+HqO+49ACmRkvnU
	TRwyBydCCy7c4hZFczT6Bc4T7eG7o9J0rVKC9UG3Ll/VKwGy6DFztBrtYnF9Mbx76iWWwA0FzDL
	O/WB6k08fVDT3kN5W1d0Oe99JbqyGHI2bAZ359oKuCeQVgjhHM8uqMwQhvEsWmdArrmQ1Ae2R7g
	aLuIi6TMOVxszmnyICD5THQxZEq9Wm60PATWS9BlCxzWR9a8KK59G687JaSzx5BZBzUwxluBteQ
	pmpu8TtvroinoLi/b54sUq/+u1Litjo6nBxmTRbsaW+9BS4Rsek2j4XT877STc3QYa7CxH8MD6j
	T2a1+7F+rKAMO/YcgJkqVOKbUs
X-Received: by 2002:a53:c053:0:20b0:667:8b90:2eb8 with SMTP id 956f58d0204a3-667d7f48184mr3731478d50.87.1783881801378;
        Sun, 12 Jul 2026 11:43:21 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787b23b35sm11768236d50.21.2026.07.12.11.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 11:43:21 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v4 04/27] machine: rename kernel prefix
Date: Sun, 12 Jul 2026 14:42:44 -0400
Message-ID: <20260712184307.3259642-4-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712184307.3259642-1-vince@underview.tech>
References: <20260712184307.3259642-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 18:43:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240794

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/conf/machine/include/loongarch/qemuloongarch.inc | 2 +-
 meta/conf/machine/include/riscv/qemuriscv.inc         | 2 +-
 meta/conf/machine/qemuppc64.conf                      | 2 +-
 meta/conf/machine/qemux86-64.conf                     | 2 +-
 meta/conf/machine/qemux86.conf                        | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/machine/include/loongarch/qemuloongarch.inc b/meta/conf/machine/include/loongarch/qemuloongarch.inc
index e1bcfabc43..9cd26fb6d0 100644
--- a/meta/conf/machine/include/loongarch/qemuloongarch.inc
+++ b/meta/conf/machine/include/loongarch/qemuloongarch.inc
@@ -15,7 +15,7 @@ IMAGE_FSTYPES += "ext4 wic.qcow2"
 
 WKS_FILE ?= "qemuloongarch.wks"
 
-MACHINE_EXTRA_RRECOMMENDS += " kernel-modules"
+MACHINE_EXTRA_RRECOMMENDS += "${KERNEL_PACKAGE_NAME}-modules"
 
 #EXTRA_IMAGEDEPENDS += "opensbi"
 
diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
index bac376ce5a..37d5787ee2 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -15,7 +15,7 @@ IMAGE_FSTYPES += "ext4.zst wic.qcow2"
 
 WKS_FILE ?= "qemuriscv.wks"
 
-MACHINE_EXTRA_RRECOMMENDS += " kernel-modules"
+MACHINE_EXTRA_RRECOMMENDS += "${KERNEL_PACKAGE_NAME}-modules"
 
 EXTRA_IMAGEDEPENDS += "opensbi"
 RISCV_SBI_PLAT ?= "generic"
diff --git a/meta/conf/machine/qemuppc64.conf b/meta/conf/machine/qemuppc64.conf
index 2fbd26a6f9..1cfdeea025 100644
--- a/meta/conf/machine/qemuppc64.conf
+++ b/meta/conf/machine/qemuppc64.conf
@@ -20,4 +20,4 @@ QB_KERNEL_CMDLINE_APPEND = "console=hvc0 nohugevmalloc"
 #QB_OPT_APPEND += "-device qemu-xhci -device usb-tablet -device usb-kbd"
 QB_OPT_APPEND = "-usb -device usb-tablet"
 
-MACHINE_EXTRA_RRECOMMENDS += " kernel-modules"
+MACHINE_EXTRA_RRECOMMENDS += "${KERNEL_PACKAGE_NAME}-modules"
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 8aac7634b7..f0c9a6141b 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -31,7 +31,7 @@ MACHINE_FEATURES += "x86 pci"
 
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
 
-MACHINE_EXTRA_RRECOMMENDS = "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
+MACHINE_EXTRA_RRECOMMENDS = "${KERNEL_PACKAGE_NAME}-module-snd-ens1370 ${KERNEL_PACKAGE_NAME}-module-snd-rawmidi"
 
 WKS_FILE ?= "qemux86-directdisk.wks"
 do_image_wic[depends] += "syslinux:do_populate_sysroot syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 51f080bd2a..22e2ae836e 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -27,7 +27,7 @@ MACHINE_FEATURES += "x86 pci"
 
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
 
-MACHINE_EXTRA_RRECOMMENDS = "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
+MACHINE_EXTRA_RRECOMMENDS = "${KERNEL_PACKAGE_NAME}-module-snd-ens1370 ${KERNEL_PACKAGE_NAME}-module-snd-rawmidi"
 
 WKS_FILE ?= "qemux86-directdisk.wks"
 do_image_wic[depends] += "syslinux:do_populate_sysroot syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
-- 
2.43.0


