Return-Path: <vinay.m.engg@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id F04B17F8C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 10:23:26 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id r1so3743580pgj.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 03:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=76KbD1QioP5MZ86aVunkrPsAA5C2WxnfTjcebS5G08M=;
	b=HaP26pVkrM1wP0L5QbohTqf40lZ+NDBT5ZQYpMFbz0Tc86FsV/8e1zC7U3xF/eCCZk
	JQQ5d1Tyqw+NUHFa22brS/bgiucQdJaqYVV33uOgCcaBHkqKkT33/H+Hq0h2thYsUJvn
	uLBZLHChQUPxNnO1ybRIAv9yOOsPUU4SbzQQd96M5bQJ5T04Y9btbGlExUTlj/7AYlhe
	WcIMqKS4pWaPx/Vl2cQTDK0F3wowQT0rQU/+rp76fABHE0LAIXsUfJQgU6So/V3XqiHD
	tVbeQjfq84D71OT6mq2fKbIpKe3y68ayv512294YZgY9LtMPYjTkFC7xCCAt0BRaWZT8
	WIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=76KbD1QioP5MZ86aVunkrPsAA5C2WxnfTjcebS5G08M=;
	b=OgCoqKVgf6+bZ4roNIx8tTZe5j4WsQTJskCFJiRoaGX3eQGGTbm3m9/CXL274SmLKr
	MMRvaXpOYEvZOzJxZwl1PHHis1KybprpFu4Ir01q0Hm2RXfGP0BLOVwrwOGWeTaTEvLa
	W96VIwPpVgXM6zr8MQszK2NKZnUPhl4+FY1vtZ3mb8a9frO04iH4qhohV++c90kGrCE9
	1Dr1qrdTR6T7W7h5zMsxzWsImxCX7+eHH8EhEktZOzwiJGTLOk9f8dp+gGd1f7cpgnj0
	XjC5fDJEPQsjyPCLpfjvAuw4HrnxxazGIEoXL4a9OOL9FLf8tXXQwSqxdaCHCr1cfRmc
	a3MQ==
X-Gm-Message-State: APjAAAUhBiU18gjO4jHVbD11bhwqmTL+wKCJsRA66ApSOt9NAsmleK6l
	0teLd16ebk2HCv1R/yemNCiIXDSwsyU=
X-Google-Smtp-Source: APXvYqxSGUfAJ+vl9pgp7UQarjWR101hyYwvFjqb2dYzuDbCVIcDy/Jb2mMaGZuCCDPSgsUnsuI1dg==
X-Received: by 2002:a63:cf42:: with SMTP id b2mr5679116pgj.113.1572517407482; 
	Thu, 31 Oct 2019 03:23:27 -0700 (PDT)
Received: from localhost.localdomain ([49.204.85.206])
	by smtp.gmail.com with ESMTPSA id j11sm3027468pgk.3.2019.10.31.03.23.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Oct 2019 03:23:27 -0700 (PDT)
From: Vinay Kumar <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2019 15:53:16 +0530
Message-Id: <1572517396-312-1-git-send-email-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] gdb: Fix CVE-2019-1010180
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
X-List-Received-Date: Thu, 31 Oct 2019 10:23:27 -0000

Backport the upstream fix. that was not present in master.

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>

Upstream-Status: Pending
---
 meta/recipes-devtools/gdb/gdb-8.3.1.inc            |  1 +
 .../gdb/gdb/CVE-2019-1010180.patch                 | 34 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/CVE-2019-1010180.patch

diff --git a/meta/recipes-devtools/gdb/gdb-8.3.1.inc b/meta/recipes-devtools/gdb/gdb-8.3.1.inc
index 39f1c48..aec913f 100644
--- a/meta/recipes-devtools/gdb/gdb-8.3.1.inc
+++ b/meta/recipes-devtools/gdb/gdb-8.3.1.inc
@@ -16,6 +16,7 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0009-Change-order-of-CFLAGS.patch \
            file://0010-resolve-restrict-keyword-conflict.patch \
            file://0011-Fix-invalid-sigprocmask-call.patch \
+           file://CVE-2019-1010180.patch \
            "
 SRC_URI[md5sum] = "73b6a5d8141672c62bf851cd34c4aa83"
 SRC_URI[sha256sum] = "1e55b4d7cdca7b34be12f4ceae651623aa73b2fd640152313f9f66a7149757c4"
diff --git a/meta/recipes-devtools/gdb/gdb/CVE-2019-1010180.patch b/meta/recipes-devtools/gdb/gdb/CVE-2019-1010180.patch
new file mode 100644
index 0000000..6e52024
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/CVE-2019-1010180.patch
@@ -0,0 +1,34 @@
+diff --git a/gdb/ChangeLog b/gdb/ChangeLog
+index 961a2e2..1dfb0cb 100644
+--- a/gdb/ChangeLog
++++ b/gdb/ChangeLog
+@@ -1,3 +1,9 @@
++2019-10-16  Keith Seitz  <keiths@redhat.com>
++
++	PR gdb/23567
++	* dwarf2read.c (dwarf2_per_objfile::locate_sections): Discard
++	sections whose size is greater than the file size.
++
+ 2019-09-20  Joel Brobecker  <brobecker@adacore.com>
+ 
+ 	* version.in: Set GDB version number to 8.3.1.
+diff --git a/gdb/dwarf2read.c b/gdb/dwarf2read.c
+index 4251ed0..fafdb89 100644
+--- a/gdb/dwarf2read.c
++++ b/gdb/dwarf2read.c
+@@ -2378,6 +2378,15 @@ dwarf2_per_objfile::locate_sections (bfd *abfd, asection *sectp,
+   if ((aflag & SEC_HAS_CONTENTS) == 0)
+     {
+     }
++  else if (elf_section_data (sectp)->this_hdr.sh_size
++	   > bfd_get_file_size (abfd))
++    {
++      bfd_size_type size = elf_section_data (sectp)->this_hdr.sh_size;
++      warning (_("Discarding section %s which has a section size (%s"
++		 ") larger than the file size [in module %s]"),
++	       bfd_section_name (abfd, sectp), phex_nz (size, sizeof (size)),
++	       bfd_get_filename (abfd));
++    }
+   else if (section_is_p (sectp->name, &names.info))
+     {
+       this->info.s.section = sectp;
-- 
2.7.4


