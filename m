Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id 281A179282
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:17:38 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id b15-v6so2454432oib.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0i+DHqfPw5hB3x5c8sdQnJKyzV1pl1CqETwVXn6QHDg=;
	b=MGg/AYeh1nvcpDJ5po/abOxv545XwaNGQlSBxWJIw4NPle76ioWFtGU7P/O1hXSYJu
	eKKzBad9uJQf/1SVO3o0Xlx+aXoQhMIn5HATx6zHhsZLCItLTs8KVrwA4nWzwHsOZoCQ
	KGzOo8QTA7QAxptsE4nEOBUSi/ejI+WFfnWzqj3IEbLsqfUyGlqaycIIgIORgL6XpBD5
	P0pomHgBzHoqPhEZxuhVOS59wpx0OuwkP55RCVLfgEasZrQUneSAc8uq6lhb/WdA5H88
	PXbLppjJVRuVkViimlg6YxklnLBYXJVtB5YqQedsCHGz3R/7toZKWZJm14e6XYIAp/iB
	tI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0i+DHqfPw5hB3x5c8sdQnJKyzV1pl1CqETwVXn6QHDg=;
	b=WmZo4zDvwBuJNmRfQPFarNPszwJngx2cd6P+jbG5VgCkPJo27cjYEljf/c51f2LOqz
	bWQq02JMGs0ui68DTYguRmNaKz5b/ueL1F+1rFzaRgvZMIx1y+SWGw0XCGj818DQzjeR
	eGHqVKrHmK23Bn+xOKlXjWX3rJnJq/RmyAklLwtFvhuJO1lkzknYH9MMewf8Ai0zeJCi
	ND17LBzX0DXo8KWleBv+a4MVBZNjKdYNXAYAT0wsQH7TAONX9qZTuYLxZLJW+4VuJho8
	v1BnD72dEmi86qh6Zsbrj6w9Kwlip1U2pqLK/m27TFeprM+LzW6/pK1ZDdkHJlKMfeol
	dCWw==
X-Gm-Message-State: APzg51D8p93l5IR+ttYyPvNa9+yA1CoYGMjOTfOugnWjP4p2czqTI7gd
	Bjqjr2DC2MSuV+SJ6UOApiM4QbkvgIY=
X-Google-Smtp-Source: ANB0VdacmY3iKnmE4Wc7MMKjdDuCfR9SeY70rjMLTU8X33q6ARVlPlUl3dSYntY0hfpiBneAmq+D/Q==
X-Received: by 2002:aca:894:: with SMTP id
	142-v6mr3617296oii.125.1534936659210; 
	Wed, 22 Aug 2018 04:17:39 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	v5-v6sm694446oix.36.2018.08.22.04.17.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:17:38 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:46:46 +0530
Message-Id: <1534936615-11658-10-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936615-11658-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936615-11658-1-git-send-email-jkrishnanjanappa@mvista.com>
Cc: Ferret on Shark <shark_admin@mvista.co>
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
X-List-Received-Date: Wed, 22 Aug 2018 11:17:38 -0000

From: Ferret on Shark <shark_admin@mvista.co>

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


