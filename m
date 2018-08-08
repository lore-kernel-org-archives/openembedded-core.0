Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id CA57478E8F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 15:35:37 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id k3-v6so1264256pgq.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 08:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=n0BpLtegNBJEXCoHSnIoSxU9VdAsBfMBCNW+zXatoHE=;
	b=l58ZMO41RuYrCzDUJQpLw5cD1/w1nhONxzSRepmJoFyT0/1LcZ0GYeKW7OWjPYjIQE
	MXAmrRRiICho/Rt0ruBHM1VFURNlbRTae5HWcM0sWpjJ+VaeYFJP5enmkx0aTnwEKgc/
	hvsC/LAhEaIEoAs/nHy7aU9ctcvvB7vVmYZOpwjS54JMdVrdISuI0kh8ynldHpQQ+HHU
	3tzFwoCuQcgIsPDGoJXSOKknDpTVzA8vIiO+ybiicPleDgMi52T3+iUYfwYxO9j0FSss
	pgzvWrxkdaXq08qo6p0KrfYuVmnCkeP/SWP4vq/TP7+3KIa+N5I1BbpHPfXdm7sjNu3h
	DP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=n0BpLtegNBJEXCoHSnIoSxU9VdAsBfMBCNW+zXatoHE=;
	b=SDg3EDdTMtZQ1iEHtR+UhUEYJkg0egr+W8718f0UJ4xe/BfyxMmBY8HTXEG2ettysJ
	eY8dHpIZsQQJGEzkuh+MArJOY73rhN1mbtqJQZX43Xm7nTaKYb+gVut3Q6gsHi86fSVE
	FdBZqdrCOuQa1ZuJ3mEFJtcKFA38DZeXSLKt6EYxC3UMne6/RNOUKdp5J61YUq4HnCA3
	fpvCrrB7BsdhFmZu3ehuz1CY60KDPSKua70U2TYem/E6X4buVhnZ7+0cY4T4HKIOiTks
	ulIsmqU8Fdy5ab7nnem7x5rPKp/bLNRTWd/XUQ76CgM5aI4ONuZhBUCZa5GOEoT0Z4Si
	N98g==
X-Gm-Message-State: AOUpUlHQ0lrstx02i87Tcbzyf1BOc97fNmJ8qqQgqdY+dMWDs1QNckbf
	UUKbml2WppyCVzCLG77Gefw=
X-Google-Smtp-Source: AA+uWPzeKp4lP6/DmEE8m5EQGxdGaGmPV6gbkvOujf/2ZD63K25ItIA+MYaJhZmOXVjAwqIKS9M2yQ==
X-Received: by 2002:a63:4306:: with SMTP id
	q6-v6mr2936165pga.181.1533742538836; 
	Wed, 08 Aug 2018 08:35:38 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	q78-v6sm8290927pfi.185.2018.08.08.08.35.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 08:35:38 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 08:35:10 -0700
Message-Id: <1533742522-24357-15-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
References: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 15/27] binutls: Security fix for CVE-2017-15939
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
X-List-Received-Date: Wed, 08 Aug 2018 15:35:38 -0000

From: Armin Kuster <akuster@mvista.com>

affects: <= 2.29.1

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |   1 +
 .../binutils/binutils/CVE-2017-15939.patch         | 113 +++++++++++++++++++++
 2 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-15939.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index 1983d85..917f667 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -50,6 +50,7 @@ SRC_URI = "\
      file://CVE-2017-15024.patch \
      file://CVE-2017-15025.patch \
      file://CVE-2017-15225.patch \
+     file://CVE-2017-15939.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-15939.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-15939.patch
new file mode 100644
index 0000000..bccad76
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-15939.patch
@@ -0,0 +1,113 @@
+From a54018b72d75abf2e74bf36016702da06399c1d9 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 26 Sep 2017 09:38:26 +0930
+Subject: [PATCH] PR22205, .debug_line file table NULL filename
+
+The PR22200 fuzzer testcase found one way to put NULLs into .debug_line
+file tables.  PR22205 finds another.  This patch gives up on trying to
+prevent NULL files in the file table and instead just copes with them.
+Arguably, this is better than giving up and showing no info from
+.debug_line.  I've also fixed a case where the fairly recent DWARF5
+support in handling broken DWARG could result in uninitialized memory
+reads, and made a small tidy.
+
+	PR 22205
+	* dwarf2.c (concat_filename): Return "<unknown>" on NULL filename.
+	(read_formatted_entries): Init "fe".
+	(decode_line_info <DW_LNE_define_file>): Use line_info_add_file_name.
+
+Upstream-Status: Backport
+Affects: <= 2.29.1
+CVE: CVE-2017-15939
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog |  7 +++++++
+ bfd/dwarf2.c  | 35 +++++++++++++----------------------
+ 2 files changed, 20 insertions(+), 22 deletions(-)
+
+Index: git/bfd/dwarf2.c
+===================================================================
+--- git.orig/bfd/dwarf2.c
++++ git/bfd/dwarf2.c
+@@ -1597,6 +1597,8 @@ concat_filename (struct line_info_table
+     }
+ 
+   filename = table->files[file - 1].name;
++  if (filename == NULL)
++    return strdup ("<unknown>");
+ 
+   if (!IS_ABSOLUTE_PATH (filename))
+     {
+@@ -1956,6 +1958,7 @@ read_formatted_entries (struct comp_unit
+       bfd_byte *format = format_header_data;
+       struct fileinfo fe;
+ 
++      memset (&fe, 0, sizeof fe);
+       for (formati = 0; formati < format_count; formati++)
+ 	{
+ 	  bfd_vma content_type, form;
+@@ -2256,6 +2259,7 @@ decode_line_info (struct comp_unit *unit
+       unsigned int discriminator = 0;
+       int is_stmt = lh.default_is_stmt;
+       int end_sequence = 0;
++      unsigned int dir, xtime, size;
+       /* eraxxon@alumni.rice.edu: Against the DWARF2 specs, some
+ 	 compilers generate address sequences that are wildly out of
+ 	 order using DW_LNE_set_address (e.g. Intel C++ 6.0 compiler
+@@ -2330,31 +2334,18 @@ decode_line_info (struct comp_unit *unit
+ 		case DW_LNE_define_file:
+ 		  cur_file = read_string (abfd, line_ptr, line_end, &bytes_read);
+ 		  line_ptr += bytes_read;
+-		  if ((table->num_files % FILE_ALLOC_CHUNK) == 0)
+-		    {
+-		      struct fileinfo *tmp;
+-
+-		      amt = table->num_files + FILE_ALLOC_CHUNK;
+-		      amt *= sizeof (struct fileinfo);
+-		      tmp = (struct fileinfo *) bfd_realloc (table->files, amt);
+-		      if (tmp == NULL)
+-			goto line_fail;
+-		      table->files = tmp;
+-		    }
+-		  table->files[table->num_files].name = cur_file;
+-		  table->files[table->num_files].dir =
+-		    _bfd_safe_read_leb128 (abfd, line_ptr, &bytes_read,
+-					   FALSE, line_end);
++		  dir = _bfd_safe_read_leb128 (abfd, line_ptr, &bytes_read,
++					       FALSE, line_end);
+ 		  line_ptr += bytes_read;
+-		  table->files[table->num_files].time =
+-		    _bfd_safe_read_leb128 (abfd, line_ptr, &bytes_read,
+-					   FALSE, line_end);
++		  xtime = _bfd_safe_read_leb128 (abfd, line_ptr, &bytes_read,
++						 FALSE, line_end);
+ 		  line_ptr += bytes_read;
+-		  table->files[table->num_files].size =
+-		    _bfd_safe_read_leb128 (abfd, line_ptr, &bytes_read,
+-					   FALSE, line_end);
++		  size = _bfd_safe_read_leb128 (abfd, line_ptr, &bytes_read,
++						FALSE, line_end);
+ 		  line_ptr += bytes_read;
+-		  table->num_files++;
++		  if (!line_info_add_file_name (table, cur_file, dir,
++						xtime, size))
++		    goto line_fail;
+ 		  break;
+ 		case DW_LNE_set_discriminator:
+ 		  discriminator =
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,10 @@
++2017-09-26  Alan Modra  <amodra@gmail.com>
++ 
++       PR 22205
++       * dwarf2.c (concat_filename): Return "<unknown>" on NULL filename.
++       (read_formatted_entries): Init "fe".
++       (decode_line_info <DW_LNE_define_file>): Use line_info_add_file_name.
++
+ 2017-10-09  Alan Modra  <amodra@gmail.com>
+ 
+        PR 22212
-- 
2.7.4


