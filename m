Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9132E744AE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:36:58 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id p84-v6so3157511oic.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fgLExMHlY+0t+HwphjigR0pg2LmveIjqF6nLOVlI/Sw=;
	b=ph0g7mfOMDa1B2zNAt0x4gFj6UBvIyofrIU+aEuG7BfqaT4yWN/j+r6HO8Klm0kV06
	jyuFuh0uEJGhw5kw4heIt1GtQuGn9pCuZd6/4P9RgByLLs9mUtOgTmaAWZSYvRde3+3f
	BI95W3aiZNgOUfpM3jxR6inQbALDQGbOVc0o5khsBGIhpnSrTpL6ZyJzaCtEHwfLy5SH
	+ES++z/f+pg1QH1Z9+7TDTc56nMcj/51QGOTLC5lRMdg+A4ZxKAfIZAeupTy9zkWX+T8
	SmqL+iZ3dKgdLgbgo3msW0GpQdn/Fjs3BNoiwKKf3IvKVQjIxSrusf/FZVQ7/qaMczyT
	mXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fgLExMHlY+0t+HwphjigR0pg2LmveIjqF6nLOVlI/Sw=;
	b=FaHXghV+dM4tm2BKp+Imoq8PedAhtC42xKUTD/noqePnSG0ZfJGPM5bMmsXqbFQ5lE
	1w/ABlX7gcL/eI0LAL4PRpdAIC6Vr1JG+0mV5NMtOXlgS9mlU9B9LJsqp8DVjej1NrVJ
	eBb00l6xZAvemONPAyTK9mRKCOeUGjxgNUKvfz08xwqrDf/57bci1zbm4c/MhXmvHJHu
	gIMZfh4T0bk0mGBy8gu2KhjoG/RkoR+eT69+YJOlA89qMQ+dLG+/2L7m3jUXg2hcQo+Z
	drFVp2swPu8PV9yZVTAcONxUPMI4lQOKkyemeyVjqlpYu6CAUESsR/xpj/zSo3MLflOs
	Ib2g==
X-Gm-Message-State: APzg51Ajh+nJ+f33fM2Znn4L40WhCRoi5FfauexxzOu3fvExk+gq54w6
	JOGG5Lkq1eNGA9FlYwUpelzBzCWuiRE=
X-Google-Smtp-Source: ANB0VdbJ90UpYgxNmMH/aSvXihxb1kEeSIpzlXnsExoHsMeVOxffWGsu1/F61ixSzb3G+iieI6mqoA==
X-Received: by 2002:aca:d946:: with SMTP id
	q67-v6mr1659653oig.212.1534945019437; 
	Wed, 22 Aug 2018 06:36:59 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	h186-v6sm3746773oib.55.2018.08.22.06.36.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 06:36:58 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 19:05:30 +0530
Message-Id: <1534944940-21566-24-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V2 24/34] qemu: CVE-2018-7550
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
X-List-Received-Date: Wed, 22 Aug 2018 13:36:58 -0000

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


