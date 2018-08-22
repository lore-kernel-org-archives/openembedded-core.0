Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7AE5B7936E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:19:17 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id q11-v6so2453251oic.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fgLExMHlY+0t+HwphjigR0pg2LmveIjqF6nLOVlI/Sw=;
	b=oXWZk4CGWyj3QdQ8qmfZ45c/4QRoUBKcjSStbb7IRp9htOqL4ELKnda0Ht47jpTp/H
	GlBL3Aubv7yrQ4cB4hjuZ+7CV8zrc8OM+trZb6hWOI3AWTdqLGri4C9nqWlXKPdnIKjO
	AXi5Pt1UZGjqKGjTGeoCIf/DMK79L6L86whd1V2AjeqG/jKpNNjIEGAf03Iyw3eEHoEh
	g4czFvhGc3mp9etIuYi4SoTUXS3bbatmSSYiNAPuS3s2SbtIya1KQtzsJy2e5JKABtja
	8m55c/NKKSmXWGYHC29+tTAERdzoC+hjzAaEF1R8PP5/Os3ResDKeN7wyZR3z3snH1SU
	4qpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fgLExMHlY+0t+HwphjigR0pg2LmveIjqF6nLOVlI/Sw=;
	b=Ut70w8CpdjLHC6Qo7trStWl0yxO5J3YyHouaxKHlv+zdOKgSo8IIlShdkPIojFoBmp
	ELBFluulumEihhyWR4BKjGtJudpRgvJ/+TPHzltVm9GRAPb9b2Z7f/O25IIPocZnoeVe
	Fl17emukBkjEzQKMdZVOqLMAp5Qr75PVvOPweTK+eezN3oZF3IWrCcZTcAMW4BNOnepE
	zPF/GoL9DaDgKrI/L38nAIAz9tRVjMV98Anr2vXEciCTmmj1VFuSZHFJZfVa0C6pC2oC
	UCnKtgVU5DOWgrTVEgxM/2yHy5Cj7Wn3sCp1oGZdTnx9r0lEVoxSPSNZHtbyQE5oN5mM
	Uktw==
X-Gm-Message-State: APzg51BScxWrTLuUG6+JOgFiZAE9eI/bIdVDaT3xJmaY9L174ln4An/y
	BW895XYTfbqu6mhkBUeA3hnwbfTmM9w=
X-Google-Smtp-Source: ANB0VdaLTGzFE+LtqNeQVnP2WGPI/lkmZMBAGsElagQKltkWRD66/WBQLqlEYW7+jiSHWLmYDZ4kaA==
X-Received: by 2002:aca:b208:: with SMTP id
	b8-v6mr3540392oif.144.1534936758394; 
	Wed, 22 Aug 2018 04:19:18 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	c9-v6sm862308oia.1.2018.08.22.04.19.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:19:18 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:48:02 +0530
Message-Id: <1534936692-11736-24-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH 24/34] qemu: CVE-2018-7550
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Aug 2018 11:19:17 -0000

multiboot: bss_end_addr can be zero

The multiboot spec
(https://www.gnu.org/software/grub/manual/multiboot/),
section 3.1.3, allows for bss_end_addr to be zero.

A zero bss_end_addr signifies there is no .bss section.

Affects qemu < v2.12.0

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../recipes-devtools/qemu/qemu/CVE-2018-7550.patch | 62 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.10.0.bb          |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-7550.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2018-7550.patch b/meta/recipes-devtools/qemu/qemu/CVE-2018-7550.patch
new file mode 100644
index 0000000..9923d12
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2018-7550.patch
@@ -0,0 +1,62 @@
+From 2a8fcd119eb7c6bb3837fc3669eb1b2dfb31daf8 Mon Sep 17 00:00:00 2001
+From: Jack Schwartz <jack.schwartz@oracle.com>
+Date: Thu, 21 Dec 2017 09:25:15 -0800
+Subject: [PATCH] multiboot: bss_end_addr can be zero
+
+The multiboot spec (https://www.gnu.org/software/grub/manual/multiboot/),
+section 3.1.3, allows for bss_end_addr to be zero.
+
+A zero bss_end_addr signifies there is no .bss section.
+
+CVE: CVE-2018-7550
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commitdiff;h=2a8fcd119eb7c6bb3837fc3669eb1b2dfb31daf8]
+
+Suggested-by: Daniel Kiper <daniel.kiper@oracle.com>
+Signed-off-by: Jack Schwartz <jack.schwartz@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Reviewed-by: Prasad J Pandit <pjp@fedoraproject.org>
+Signed-off-by: Kevin Wolf <kwolf@redhat.com>
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ hw/i386/multiboot.c | 18 ++++++++++--------
+ 1 file changed, 10 insertions(+), 8 deletions(-)
+
+diff --git a/hw/i386/multiboot.c b/hw/i386/multiboot.c
+index 46d9c68bf5..bb8d8e4629 100644
+--- a/hw/i386/multiboot.c
++++ b/hw/i386/multiboot.c
+@@ -233,12 +233,6 @@ int load_multiboot(FWCfgState *fw_cfg,
+         mh_entry_addr = ldl_p(header+i+28);
+ 
+         if (mh_load_end_addr) {
+-            if (mh_bss_end_addr < mh_load_addr) {
+-                fprintf(stderr, "invalid mh_bss_end_addr address\n");
+-                exit(1);
+-            }
+-            mb_kernel_size = mh_bss_end_addr - mh_load_addr;
+-
+             if (mh_load_end_addr < mh_load_addr) {
+                 fprintf(stderr, "invalid mh_load_end_addr address\n");
+                 exit(1);
+@@ -249,8 +243,16 @@ int load_multiboot(FWCfgState *fw_cfg,
+                 fprintf(stderr, "invalid kernel_file_size\n");
+                 exit(1);
+             }
+-            mb_kernel_size = kernel_file_size - mb_kernel_text_offset;
+-            mb_load_size = mb_kernel_size;
++            mb_load_size = kernel_file_size - mb_kernel_text_offset;
++        }
++        if (mh_bss_end_addr) {
++            if (mh_bss_end_addr < (mh_load_addr + mb_load_size)) {
++                fprintf(stderr, "invalid mh_bss_end_addr address\n");
++                exit(1);
++            }
++            mb_kernel_size = mh_bss_end_addr - mh_load_addr;
++        } else {
++            mb_kernel_size = mb_load_size;
+         }
+ 
+         /* Valid if mh_flags sets MULTIBOOT_HEADER_HAS_VBE.
+-- 
+2.13.3
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.10.0.bb b/meta/recipes-devtools/qemu/qemu_2.10.0.bb
index 48b8675..5b88154 100644
--- a/meta/recipes-devtools/qemu/qemu_2.10.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.10.0.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
            file://0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch \
            file://CVE-2017-15119.patch \
            file://CVE-2017-18043.patch \
+           file://CVE-2018-7550.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
 
-- 
2.7.4


