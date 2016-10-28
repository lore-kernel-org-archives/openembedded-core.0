Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 91827719E9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 18:41:04 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id i85so1914234pfa.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 11:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Zlu+2XnAeAqa7N8qcY7MWct/BQvxbdL4OrItMKPpHUY=;
	b=jyb1yLhKjBzZa94lBViVpIqfcvBpDIOnuK6LySWPlaCLXdaqzoJfLDPNBAjx2FTqOo
	PXnZCusjGcbDvq0Vhae8MyQPTB7avzIlaFe9hkYtL04CDXTHb+iVLB8EtaGNuYKPi1lz
	hNR2R8Qc2vwvIU/GytkkYo5zohXJPEgK11Xy5JkzavzG01/n6wD53rDlKLhJbQII1b8K
	Apy9rlSfA7OCYgTAdmzEFbepFTMZRFeUS6fB3iUKxbWWQsc6zPZJKaXZieUUxt+zeKV7
	CtqnOEtJa1CLo9th9vyRUxgncXQkdDkgdjrsNt0yrAraJ1kM5g9wtUNWgdqHs4CkLevO
	soiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Zlu+2XnAeAqa7N8qcY7MWct/BQvxbdL4OrItMKPpHUY=;
	b=ICTZ5PQZoWVXwVMOtdf/mQI8v0yI3osl48FMc2kprUHL+QIyd60vRJgqUHYB0kWZyP
	30zRulnX3tKp3jo/i8ez5e87rckDkLPSx2al9dsgFvbxMVM+HOqNbvlY28HQRCjttxBC
	ssyFhqUzjZi5LvKQgagzM2p2FfYNxQZVrTjZhBJOvUJ1xu9RDD4vudgyV9uS9kSE3WWk
	fI7/NzJ9Dt5bMUIekYEfbpS6og1wy0Rkvj/+zjKtyBihGaGUo/GwMWLNMwujfe+uXReI
	jkHEGGJdC+zKX2g+WF2oImeQa0PEgDQAqQqaLoaqatBkcL4zEtQ57DgbgXgScMLbpCyW
	omow==
X-Gm-Message-State: ABUngvc7KZ9Y6boXwmo+z98W2qIIRLNwGajAls2nWXVKOXlT9+prT5aUfxrQw0qmS1p4cA==
X-Received: by 10.98.202.156 with SMTP id y28mr27413626pfk.130.1477680066329; 
	Fri, 28 Oct 2016 11:41:06 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	i123sm20546435pfg.30.2016.10.28.11.41.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Oct 2016 11:41:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2016 11:40:58 -0700
Message-Id: <20161028184058.14189-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.1
Subject: [master/morty][PATCH] binutils-2.27: Fix linker segfaults when linking binary files
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
X-List-Received-Date: Fri, 28 Oct 2016 18:41:05 -0000

Fixes segfaults when doing partial linking and generaring binary objects

/tmp/binu/ld/ld-new -r -b binary -o etc_certs_ui_ca_pem.o etc_certs_ui_ca_pem

0  elf32_arm_count_additional_relocs (sec=0x79bf40) at /mnt/a/work/oe/binutils-gdb/bfd/elf32-arm.c:18210
1  0x000000000047635a in bfd_elf_final_link (abfd=abfd@entry=0x783250, info=info@entry=0x748400 <link_info>) at /mnt/a/work/oe/binutils-gdb/bfd/elflink.c:11224
2  0x000000000044df7b in elf32_arm_final_link (abfd=0x783250, info=0x748400 <link_info>) at /mnt/a/work/oe/binutils-gdb/bfd/elf32-arm.c:12131
3  0x0000000000418917 in ldwrite () at /mnt/a/work/oe/binutils-gdb/ld/ldwrite.c:577
4  0x000000000040365f in main (argc=<optimized out>, argv=<optimized out>) at /mnt/a/work/oe/binutils-gdb/ld/ldmain.c:433

gold works ok. The patch is already applied in master binutils

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.27.inc   |  1 +
 ...lt-in-ARM-linker-when-trying-to-parse-a-b.patch | 31 ++++++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0016-Fix-seg-fault-in-ARM-linker-when-trying-to-parse-a-b.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.27.inc b/meta/recipes-devtools/binutils/binutils-2.27.inc
index af1420b..fc81721 100644
--- a/meta/recipes-devtools/binutils/binutils-2.27.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.27.inc
@@ -36,6 +36,7 @@ SRC_URI = "\
      file://0014-libtool-remove-rpath.patch \
      file://0015-binutils-mips-gas-pic-relax-linkonce.diff \
      file://0015-Refine-.cfi_sections-check-to-only-consider-compact-.patch \
+     file://0016-Fix-seg-fault-in-ARM-linker-when-trying-to-parse-a-b.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/0016-Fix-seg-fault-in-ARM-linker-when-trying-to-parse-a-b.patch b/meta/recipes-devtools/binutils/binutils/0016-Fix-seg-fault-in-ARM-linker-when-trying-to-parse-a-b.patch
new file mode 100644
index 0000000..33bf1e8
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0016-Fix-seg-fault-in-ARM-linker-when-trying-to-parse-a-b.patch
@@ -0,0 +1,31 @@
+From 72b09de92cc597c53b1d762882b67a17fe56846c Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Tue, 23 Aug 2016 09:45:11 +0100
+Subject: [PATCH 16/16] Fix seg-fault in ARM linker when trying to parse a
+ binary file.
+
+	* elf32-arm.c (elf32_arm_count_additional_relocs): Return zero if
+	there is no arm data associated with the section.
+---
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ bfd/elf32-arm.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bfd/elf32-arm.c b/bfd/elf32-arm.c
+index 700bec3..3fab609 100644
+--- a/bfd/elf32-arm.c
++++ b/bfd/elf32-arm.c
+@@ -18207,7 +18207,7 @@ elf32_arm_count_additional_relocs (asection *sec)
+ {
+   struct _arm_elf_section_data *arm_data;
+   arm_data = get_arm_elf_section_data (sec);
+-  return arm_data->additional_reloc_count;
++  return arm_data == NULL ? 0 : arm_data->additional_reloc_count;
+ }
+ 
+ /* Called to set the sh_flags, sh_link and sh_info fields of OSECTION which
+-- 
+2.10.1
+
-- 
2.10.1


