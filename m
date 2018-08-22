Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0673B793BD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:20:44 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id q11-v6so3021077oic.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1MMvZafEYW7Svc28KT7WhXR3dZCMwuSb7e+MYnXzPrY=;
	b=bGOF9h7wx7CJJPBL12UAaKJhUOiDkXFRyCl9sXIOMuoJuzg6SFXv2y80Nmj1ryzMNp
	e3FT8q3YytK1piP486DlZbZZmcGV3DfakdpufwZ2LspNzVnqOJxXn+xoz0Qa8h13Yxft
	RVPk0O1bqVf9HEadfhUflFkt5eBe+joK6vlyRg+D3gH/ILji/NHEhf/BMlMxaisA6RBQ
	oKhnvoeElecWfUw9MlopdQpqo4etZsuKxRq/O4iTnCntRs2/2boO/gRwMbnl30yUcnGV
	aqL9c684z7/CNQDWG4Eeqc7vg7hlmXInVAw5z8twhFMYjqHykJsxNArVXleCra8j1O7B
	WU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1MMvZafEYW7Svc28KT7WhXR3dZCMwuSb7e+MYnXzPrY=;
	b=J0cmU+0uwBPhuhFdpWB74ra5l99un3STMZZvqqun3+LKWcvLUWJJIgmwlzeiGRmEpG
	zMGzaDw3wi+nIVzmUOZgNSlzZi87V51IYT/Cs3GLWJR5S1tkRdqbX8cSMSg2mUWSm6/h
	RqVINL3xg4b3hPdBjLxO2ubKzyvP5j2+so6yFJ7KMSdSoATzaks1cw/tG0p3NKT1txYo
	9Qv+T2a9bSYQxYPPUBs9Ai3mnslbJUSlMjFmR8gleBNQvHRu223qrsiuBfNuhNDSNrYE
	veefpVZn66pDzdghcG0KIapBmZsl1B6JqGyOte1TNGKVUvAyKgIAr0wmjiQ6GURZf3ex
	19Zg==
X-Gm-Message-State: APzg51DmNh/gKmdYNoIkCckI0p9vLfQNCPqaJsHYazq9kUKUKvldBwk+
	qJiNWN56HggAL1ki1wbspzNqWWPBlEA=
X-Google-Smtp-Source: ANB0Vdbi+vlh77FOMqb8z8JDs+VrqXMMT7SzrR9TsbvFwnKwHArTPd3f6yYzLVOkX6KhlVUrShnI9w==
X-Received: by 2002:aca:3a03:: with SMTP id
	h3-v6mr3820657oia.270.1534944045764; 
	Wed, 22 Aug 2018 06:20:45 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	t141-v6sm2354715oif.18.2018.08.22.06.20.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 06:20:45 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 18:50:00 +0530
Message-Id: <1534944009-21362-10-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534944009-21362-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534944009-21362-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [SUMO][PATCH 10/19] qemu: CVE-2018-7550
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
X-List-Received-Date: Wed, 22 Aug 2018 13:20:45 -0000

multiboot: bss_end_addr can be zero

The multiboot spec
(https://www.gnu.org/software/grub/manual/multiboot/),
section 3.1.3, allows for bss_end_addr to be zero.

A zero bss_end_addr signifies there is no .bss section.

Affects qemu < v2.12.0

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../recipes-devtools/qemu/qemu/CVE-2018-7550.patch | 62 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.11.1.bb          |  1 +
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
diff --git a/meta/recipes-devtools/qemu/qemu_2.11.1.bb b/meta/recipes-devtools/qemu/qemu_2.11.1.bb
index 7de21ac..db7ead7 100644
--- a/meta/recipes-devtools/qemu/qemu_2.11.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.11.1.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
            file://0012-arm-translate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch \
            file://0013-ps2-check-PS2Queue-pointers-in-post_load-routine.patch \
            file://0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch \
+           file://CVE-2018-7550.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
 
-- 
2.7.4


