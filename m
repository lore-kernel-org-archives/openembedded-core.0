Return-Path: <vinay.m.engg@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 73BBB7F820
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 08:11:03 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id j22so3529103pgh.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 01:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=wQYpcXRxe40LUmWOYjredzL3ur+1WWe7nH+qRG9Aoic=;
	b=j5y1hZ98LpBU0ZeJmUyLvFBT+v2j5hUqsfJcMG2U8KFxX6nUD0qCgJiPgSxNm2Y/Wc
	mbvQP1PJUDD9ggHetIqXVkjM7079Gx1SfO5qRI3m68BBSDQ9flXmWzysXMmWImSvICEB
	N7xIqU01W9pLakR8SRJlB7fLsAoUEsTxmI+wgXJI+v/JDJTJzT+dtUW7Ba0Ta9SkTksa
	3fkiiLrv9N4lQm821OnNoJC+nG8SR6T83iZmXfspHqyNvsTnIABU5D73tWBjI1xpGSDa
	KKJWDwjMthVEVFyN/Z/cCm4XIHVdcOJZjIsRDCh/wqRoSszlpPb4FFa5bKnKYd9z5C2u
	HbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wQYpcXRxe40LUmWOYjredzL3ur+1WWe7nH+qRG9Aoic=;
	b=UZE2/DifWXXXiLJ2geiu1d8orZpCI4+DNk6ApDJDqHxXY2m+Qjih2E+VE8i/J3llYD
	xu7xx7Mx3ZsSNpaSdVJLC9S4a7DfAefVs0lkVO9jGtS5UKxxYiA7tSOXmCg3Z4ozchDN
	YLF2NJgucLDIytZ5RoOE2k/o0mFtBbDkfKLlkGQINcepqyp0WOYlNcEHEt+tP0JCB9l0
	AZg9j/naMULjeix2IdDQnqTuge5cslLD7MGpV1/6kAG/mNbS7CEyaVWHs4ofejZVqeVS
	U/slHoypCKfa9XJdF1sqLXzKJgNBwojCYt4cnZDUO7M/VTtWlwI+f9qVoK7n82T/PFok
	1lrA==
X-Gm-Message-State: APjAAAVCy8eLJ2nI6ORyPhIQo6wSRU67bicofoEpmx+fAYl/0NimVZyY
	or1sZc6vNjyiTX4SyDZR+9yJOhTnfA0=
X-Google-Smtp-Source: APXvYqxwqxkMN+1YHtbsGE0TCOlYWsJR5OgQArekdZY0nteXWnk8uExFtHpIVzJ9E3Y+a04WWqANfQ==
X-Received: by 2002:a65:6085:: with SMTP id t5mr5002963pgu.450.1572509463999; 
	Thu, 31 Oct 2019 01:11:03 -0700 (PDT)
Received: from localhost.localdomain ([49.204.85.206])
	by smtp.gmail.com with ESMTPSA id
	c9sm3529113pfb.114.2019.10.31.01.11.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Oct 2019 01:11:03 -0700 (PDT)
From: Vinay Kumar <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2019 13:40:52 +0530
Message-Id: <1572509452-17499-1-git-send-email-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] Backport the upstream fix. that was not present in master.
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
X-List-Received-Date: Thu, 31 Oct 2019 08:11:03 -0000

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
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


