Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 880D779487
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 15:09:54 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id 13-v6so3757036ois.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 08:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fgLExMHlY+0t+HwphjigR0pg2LmveIjqF6nLOVlI/Sw=;
	b=BDi5IvUbaQP/iJsC82VvTvefAYoE/kOwkgLRMcwO2j8VC3RSOYkO+Xy9YrtDFjPGRn
	J2tbi86uLhE3z3tKkGKGFj+oGxeXIBC9E7WSE34x7fj+lMW1QqoJDVK4CDCdp7XA9Etx
	NlkkyrDAp94VCOKP8HBplXduoXwId4hIiB7lDKAZ4jls1hpCaIUOpfHqOo0WoEOWPBCk
	AfwUayZSsUtHlW9d/zP+bIn0CTthMWXfu26nPkuggnxGT8kWmuETFhEW/D1HJZW++fWt
	Sxfr3biecHObVkwi32TRWbk+0ZI8xU3MctOCYJ/O4jjN/S6jMYtThxEChi3WJQ3a86qF
	gxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fgLExMHlY+0t+HwphjigR0pg2LmveIjqF6nLOVlI/Sw=;
	b=OUwpGNHvV8Xj4OuEwO84q0Qld/bMIfaexA4bpiBTIJb9V1XzZ7MDPEpl5vxMyMA9E8
	K6NtpVcPiRd0rX65V4u1yr8XVagRqHdFk2FXsvJPaNCvqsPSlvR7w2ztlFRLpwbOaL9i
	H69G8bTJJMdkQp9rFJftDUD8Q/GkgxFSFr1hf3VD9wVaiwDkhbxzHD/eFPmdcRH9VOtX
	7b/GjObSVzhKJ5rI4IwxsxLBR+Zkfgd3JS+PhMBTxvXyg1/uNqPEQ6Xea52sBSTMYXXr
	uBbmHrBAs9pZ02SYmJH+XlcOAzh5jmpfj+22o6b5ULZzUyyTfuHrPYVEgZjhu0u94vjU
	Axzg==
X-Gm-Message-State: APzg51DtREKPalR3HP7aWV3Aa1OmzU5G1GYSp9r3vqMVhqWh49m4/i11
	SjTAYA+OSO2tF4Wp586tzxCQATTo5lA=
X-Google-Smtp-Source: ANB0VdYMyFvSWHstf0dTkNVATJpnGmUuYcQt3xLItniCj2istgMXJIDVuqonP9mMeUU1uJ93pdVlxQ==
X-Received: by 2002:aca:adc6:: with SMTP id
	w189-v6mr4539065oie.174.1534950595540; 
	Wed, 22 Aug 2018 08:09:55 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	i132-v6sm1024281oif.20.2018.08.22.08.09.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 08:09:55 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 20:38:42 +0530
Message-Id: <1534950532-23850-24-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V3 24/34] qemu: CVE-2018-7550
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
X-List-Received-Date: Wed, 22 Aug 2018 15:09:54 -0000

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


