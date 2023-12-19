Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0967C46CD3
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 13:48:49 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.13928.1702993719590878168
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 05:48:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wvbMQySK;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.54, mailfrom: steve@sakoman.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-203fb334415so166278fac.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 05:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702993718; x=1703598518; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iAfbr4BgDXTomyAPQX5gpKLGFI9M1fS/px3ocQoYEhA=;
        b=wvbMQySK74P9aarOXORtn5IsxlrlTov7LMFPwoAdnDGQ2z7xcrvs76Q/rElkJHHlrN
         yxPc/XP/ArdKTKlL/IZeIinFsiq8O+wSVL0EkxlPbZf4REMR7RZBTCvR2sJm6Qjn9N+D
         sCT2eg0ObngFpD6qjgzuWevxSk7UERRGObo9hR0rGJdRcm98I7iX8Xd4JUbpNJGghBJ4
         6RB+m8PP4of4SoraOJkx3FJYhZTWb9iHUE0seDZpqSv9sMqz9kKmhqZFsPck+WaePTC2
         6wAnklEOp9iJqAHoWg0CEXbZo+VXd09GEvm2IS/zcKQATO7d0Cn8ZkJK3E3ODe6AsenS
         91QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702993718; x=1703598518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iAfbr4BgDXTomyAPQX5gpKLGFI9M1fS/px3ocQoYEhA=;
        b=Ff0GY9f0Dxh7P7b+TCDpfyag2b26nhGTBxLa9o7SeLyWX4HiDlzT5nMhM4dIZ1ko96
         t4c793BNsIZ4rlCTSPmmA+moHYmBpZDlEVq6BTNdAlOAtK2gI5XeJ37X6i27Vjlsl/jF
         MuKmCxd6MRwopExB12HMCZV+hJc66/3ZgivbWZeVCkyss38q6Qz+i50wFfOL1oUyztJC
         xVu2dZoFEwifC8MXqfw2KE73CHtMSTeZNkowZh4fc7+F3pehswv51wfVCgq3GFiY5WZh
         V/oQYnoVVF36YBt+JKQ1OHH9O3EtbWBhz6GKl4p1oBo6R2IM6Rvjtp9JigtIrgaKq5uv
         zmkA==
X-Gm-Message-State: AOJu0YxLIfDNyGSnyR26+a0LlMbCktIrPPvKFD+AXfvo4KMzNkqQWEhV
	FG/BceODkePXBqlqOGqfqJFz6fuZHgITsrLJmY1KLg==
X-Google-Smtp-Source: AGHT+IH1LZ085Zc6M7m4L49rSi45iSoA13GFxQxnVCbHIQOK1NeTkL4n9MUYenp7qsvmAlXG4AoNGw==
X-Received: by 2002:a05:6870:15ce:b0:203:a080:2d55 with SMTP id k14-20020a05687015ce00b00203a0802d55mr5544707oad.107.1702993718193;
        Tue, 19 Dec 2023 05:48:38 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id h4-20020a655184000000b0059d6f5196fasm16815398pgq.78.2023.12.19.05.48.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 05:48:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/5] binutils: Fix CVE-2023-25584
Date: Tue, 19 Dec 2023 03:48:21 -1000
Message-Id: <8eff0e0ce44c60efcf6bec083d5794313f3ac4ad.1702993573.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702993573.git.steve@sakoman.com>
References: <cover.1702993573.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 13:48:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192735

From: Lee Chee Yang <chee.yang.lee@intel.com>

import patch from ubuntu to fix CVE-2023-25584
http://archive.ubuntu.com/ubuntu/pool/main/b/binutils/binutils_2.34-6ubuntu1.7.debian.tar.xz

upstream patch :
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=77c225bdeb410cf60da804879ad41622f5f1aa44

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.34.inc                |   1 +
 .../binutils/binutils/CVE-2023-25584.patch    | 530 ++++++++++++++++++
 2 files changed, 531 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2023-25584.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.34.inc b/meta/recipes-devtools/binutils/binutils-2.34.inc
index 371e8e9fa4..4824db6dcf 100644
--- a/meta/recipes-devtools/binutils/binutils-2.34.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.34.inc
@@ -55,5 +55,6 @@ SRC_URI = "\
      file://CVE-2022-38533.patch \
      file://CVE-2023-25588.patch \
      file://CVE-2021-46174.patch \
+     file://CVE-2023-25584.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2023-25584.patch b/meta/recipes-devtools/binutils/binutils/CVE-2023-25584.patch
new file mode 100644
index 0000000000..732ea43210
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2023-25584.patch
@@ -0,0 +1,530 @@
+CVE: CVE-2023-25584
+Upstream-Status: Backport [ import from ubuntu http://archive.ubuntu.com/ubuntu/pool/main/b/binutils/binutils_2.34-6ubuntu1.7.debian.tar.xz  upstream  https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=77c225bdeb410cf60da804879ad41622f5f1aa44 ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+[Ubuntu note: this is backport of the original patch, no major changes just
+ fix this patch for this release]
+From 77c225bdeb410cf60da804879ad41622f5f1aa44 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 12 Dec 2022 18:28:49 +1030
+Subject: [PATCH] Lack of bounds checking in vms-alpha.c parse_module
+
+	PR 29873
+	PR 29874
+	PR 29875
+	PR 29876
+	PR 29877
+	PR 29878
+	PR 29879
+	PR 29880
+	PR 29881
+	PR 29882
+	PR 29883
+	PR 29884
+	PR 29885
+	PR 29886
+	PR 29887
+	PR 29888
+	PR 29889
+	PR 29890
+	PR 29891
+	* vms-alpha.c (parse_module): Make length param bfd_size_type.
+	Delete length == -1 checks.  Sanity check record_length.
+	Sanity check DST__K_MODBEG, DST__K_RTNBEG, DST__K_RTNEND lengths.
+	Sanity check DST__K_SOURCE and DST__K_LINE_NUM elements
+	before accessing.
+	(build_module_list): Pass dst_section size to parse_module.
+---
+ bfd/vms-alpha.c | 213 ++++++++++++++++++++++++++++++++++++++----------
+ 1 file changed, 168 insertions(+), 45 deletions(-)
+
+--- binutils-2.34.orig/bfd/vms-alpha.c
++++ binutils-2.34/bfd/vms-alpha.c
+@@ -4267,7 +4267,7 @@ new_module (bfd *abfd)
+ 
+ static void
+ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+-	      int length)
++	      bfd_size_type length)
+ {
+   unsigned char *maxptr = ptr + length;
+   unsigned char *src_ptr, *pcl_ptr;
+@@ -4284,7 +4284,7 @@ parse_module (bfd *abfd, struct module *
+   curr_line = (struct lineinfo *) bfd_zalloc (abfd, sizeof (struct lineinfo));
+   module->line_table = curr_line;
+ 
+-  while (length == -1 || ptr < maxptr)
++  while (ptr < maxptr)
+     {
+       /* The first byte is not counted in the recorded length.  */
+       int rec_length = bfd_getl16 (ptr) + 1;
+@@ -4292,15 +4292,19 @@ parse_module (bfd *abfd, struct module *
+ 
+       vms_debug2 ((2, "DST record: leng %d, type %d\n", rec_length, rec_type));
+ 
+-      if (length == -1 && rec_type == DST__K_MODEND)
++      if (rec_length > maxptr - ptr)
++	break;
++      if (rec_type == DST__K_MODEND)
+ 	break;
+ 
+       switch (rec_type)
+ 	{
+ 	case DST__K_MODBEG:
++	  if (rec_length <= DST_S_B_MODBEG_NAME)
++	    break;
+ 	  module->name
+ 	    = _bfd_vms_save_counted_string (abfd, ptr + DST_S_B_MODBEG_NAME,
+-					    maxptr - (ptr + DST_S_B_MODBEG_NAME));
++					    rec_length - DST_S_B_MODBEG_NAME);
+ 
+ 	  curr_pc = 0;
+ 	  prev_pc = 0;
+@@ -4314,11 +4318,13 @@ parse_module (bfd *abfd, struct module *
+ 	  break;
+ 
+ 	case DST__K_RTNBEG:
++	  if (rec_length <= DST_S_B_RTNBEG_NAME)
++	    break;
+ 	  funcinfo = (struct funcinfo *)
+ 	    bfd_zalloc (abfd, sizeof (struct funcinfo));
+ 	  funcinfo->name
+ 	    = _bfd_vms_save_counted_string (abfd, ptr + DST_S_B_RTNBEG_NAME,
+-					    maxptr - (ptr + DST_S_B_RTNBEG_NAME));
++					    rec_length - DST_S_B_RTNBEG_NAME);
+ 	  funcinfo->low = bfd_getl32 (ptr + DST_S_L_RTNBEG_ADDRESS);
+ 	  funcinfo->next = module->func_table;
+ 	  module->func_table = funcinfo;
+@@ -4328,6 +4334,8 @@ parse_module (bfd *abfd, struct module *
+ 	  break;
+ 
+ 	case DST__K_RTNEND:
++	  if (rec_length < DST_S_L_RTNEND_SIZE + 4)
++	    break;
+ 	  module->func_table->high = module->func_table->low
+ 	    + bfd_getl32 (ptr + DST_S_L_RTNEND_SIZE) - 1;
+ 
+@@ -4358,13 +4366,66 @@ parse_module (bfd *abfd, struct module *
+ 
+ 	  vms_debug2 ((3, "source info\n"));
+ 
+-	  while (src_ptr < ptr + rec_length)
++	  while (src_ptr - ptr < rec_length)
+ 	    {
+ 	      int cmd = src_ptr[0], cmd_length, data;
+ 
+ 	      switch (cmd)
+ 		{
+ 		case DST__K_SRC_DECLFILE:
++		  if (src_ptr - ptr + DST_S_B_SRC_DF_LENGTH >= rec_length)
++		    cmd_length = 0x10000;
++		  else
++		    cmd_length = src_ptr[DST_S_B_SRC_DF_LENGTH] + 2;
++		  break;
++
++		case DST__K_SRC_DEFLINES_B:
++		  cmd_length = 2;
++		  break;
++
++		case DST__K_SRC_DEFLINES_W:
++		  cmd_length = 3;
++		  break;
++
++		case DST__K_SRC_INCRLNUM_B:
++		  cmd_length = 2;
++		  break;
++
++		case DST__K_SRC_SETFILE:
++		  cmd_length = 3;
++		  break;
++
++		case DST__K_SRC_SETLNUM_L:
++		  cmd_length = 5;
++		  break;
++
++		case DST__K_SRC_SETLNUM_W:
++		  cmd_length = 3;
++		  break;
++
++		case DST__K_SRC_SETREC_L:
++		  cmd_length = 5;
++		  break;
++
++		case DST__K_SRC_SETREC_W:
++		  cmd_length = 3;
++		  break;
++
++		case DST__K_SRC_FORMFEED:
++		  cmd_length = 1;
++		  break;
++
++		default:
++		  cmd_length = 2;
++		  break;
++		}
++
++	      if (src_ptr - ptr + cmd_length > rec_length)
++		break;
++
++	      switch (cmd)
++		{
++		case DST__K_SRC_DECLFILE:
+ 		  {
+ 		    unsigned int fileid
+ 		      = bfd_getl16 (src_ptr + DST_S_W_SRC_DF_FILEID);
+@@ -4384,7 +4445,6 @@ parse_module (bfd *abfd, struct module *
+ 
+ 		    module->file_table [fileid].name = filename;
+ 		    module->file_table [fileid].srec = 1;
+-		    cmd_length = src_ptr[DST_S_B_SRC_DF_LENGTH] + 2;
+ 		    vms_debug2 ((4, "DST_S_C_SRC_DECLFILE: %d, %s\n",
+ 				 fileid, module->file_table [fileid].name));
+ 		  }
+@@ -4401,7 +4461,6 @@ parse_module (bfd *abfd, struct module *
+ 		  srec->sfile = curr_srec->sfile;
+ 		  curr_srec->next = srec;
+ 		  curr_srec = srec;
+-		  cmd_length = 2;
+ 		  vms_debug2 ((4, "DST_S_C_SRC_DEFLINES_B: %d\n", data));
+ 		  break;
+ 
+@@ -4416,14 +4475,12 @@ parse_module (bfd *abfd, struct module *
+ 		  srec->sfile = curr_srec->sfile;
+ 		  curr_srec->next = srec;
+ 		  curr_srec = srec;
+-		  cmd_length = 3;
+ 		  vms_debug2 ((4, "DST_S_C_SRC_DEFLINES_W: %d\n", data));
+ 		  break;
+ 
+ 		case DST__K_SRC_INCRLNUM_B:
+ 		  data = src_ptr[DST_S_B_SRC_UNSBYTE];
+ 		  curr_srec->line += data;
+-		  cmd_length = 2;
+ 		  vms_debug2 ((4, "DST_S_C_SRC_INCRLNUM_B: %d\n", data));
+ 		  break;
+ 
+@@ -4431,21 +4488,18 @@ parse_module (bfd *abfd, struct module *
+ 		  data = bfd_getl16 (src_ptr + DST_S_W_SRC_UNSWORD);
+ 		  curr_srec->sfile = data;
+ 		  curr_srec->srec = module->file_table[data].srec;
+-		  cmd_length = 3;
+ 		  vms_debug2 ((4, "DST_S_C_SRC_SETFILE: %d\n", data));
+ 		  break;
+ 
+ 		case DST__K_SRC_SETLNUM_L:
+ 		  data = bfd_getl32 (src_ptr + DST_S_L_SRC_UNSLONG);
+ 		  curr_srec->line = data;
+-		  cmd_length = 5;
+ 		  vms_debug2 ((4, "DST_S_C_SRC_SETLNUM_L: %d\n", data));
+ 		  break;
+ 
+ 		case DST__K_SRC_SETLNUM_W:
+ 		  data = bfd_getl16 (src_ptr + DST_S_W_SRC_UNSWORD);
+ 		  curr_srec->line = data;
+-		  cmd_length = 3;
+ 		  vms_debug2 ((4, "DST_S_C_SRC_SETLNUM_W: %d\n", data));
+ 		  break;
+ 
+@@ -4453,7 +4507,6 @@ parse_module (bfd *abfd, struct module *
+ 		  data = bfd_getl32 (src_ptr + DST_S_L_SRC_UNSLONG);
+ 		  curr_srec->srec = data;
+ 		  module->file_table[curr_srec->sfile].srec = data;
+-		  cmd_length = 5;
+ 		  vms_debug2 ((4, "DST_S_C_SRC_SETREC_L: %d\n", data));
+ 		  break;
+ 
+@@ -4461,19 +4514,16 @@ parse_module (bfd *abfd, struct module *
+ 		  data = bfd_getl16 (src_ptr + DST_S_W_SRC_UNSWORD);
+ 		  curr_srec->srec = data;
+ 		  module->file_table[curr_srec->sfile].srec = data;
+-		  cmd_length = 3;
+ 		  vms_debug2 ((4, "DST_S_C_SRC_SETREC_W: %d\n", data));
+ 		  break;
+ 
+ 		case DST__K_SRC_FORMFEED:
+-		  cmd_length = 1;
+ 		  vms_debug2 ((4, "DST_S_C_SRC_FORMFEED\n"));
+ 		  break;
+ 
+ 		default:
+ 		  _bfd_error_handler (_("unknown source command %d"),
+ 				      cmd);
+-		  cmd_length = 2;
+ 		  break;
+ 		}
+ 
+@@ -4486,7 +4536,7 @@ parse_module (bfd *abfd, struct module *
+ 
+ 	  vms_debug2 ((3, "line info\n"));
+ 
+-	  while (pcl_ptr < ptr + rec_length)
++	  while (pcl_ptr - ptr < rec_length)
+ 	    {
+ 	      /* The command byte is signed so we must sign-extend it.  */
+ 	      int cmd = ((signed char *)pcl_ptr)[0], cmd_length, data;
+@@ -4494,10 +4544,106 @@ parse_module (bfd *abfd, struct module *
+ 	      switch (cmd)
+ 		{
+ 		case DST__K_DELTA_PC_W:
++		  cmd_length = 3;
++		  break;
++
++		case DST__K_DELTA_PC_L:
++		  cmd_length = 5;
++		  break;
++
++		case DST__K_INCR_LINUM:
++		  cmd_length = 2;
++		  break;
++
++		case DST__K_INCR_LINUM_W:
++		  cmd_length = 3;
++		  break;
++
++		case DST__K_INCR_LINUM_L:
++		  cmd_length = 5;
++		  break;
++
++		case DST__K_SET_LINUM_INCR:
++		  cmd_length = 2;
++		  break;
++
++		case DST__K_SET_LINUM_INCR_W:
++		  cmd_length = 3;
++		  break;
++
++		case DST__K_RESET_LINUM_INCR:
++		  cmd_length = 1;
++		  break;
++
++		case DST__K_BEG_STMT_MODE:
++		  cmd_length = 1;
++		  break;
++
++		case DST__K_END_STMT_MODE:
++		  cmd_length = 1;
++		  break;
++
++		case DST__K_SET_LINUM_B:
++		  cmd_length = 2;
++		  break;
++
++		case DST__K_SET_LINUM:
++		  cmd_length = 3;
++		  break;
++
++		case DST__K_SET_LINUM_L:
++		  cmd_length = 5;
++		  break;
++
++		case DST__K_SET_PC:
++		  cmd_length = 2;
++		  break;
++
++		case DST__K_SET_PC_W:
++		  cmd_length = 3;
++		  break;
++
++		case DST__K_SET_PC_L:
++		  cmd_length = 5;
++		  break;
++
++		case DST__K_SET_STMTNUM:
++		  cmd_length = 2;
++		  break;
++
++		case DST__K_TERM:
++		  cmd_length = 2;
++		  break;
++
++		case DST__K_TERM_W:
++		  cmd_length = 3;
++		  break;
++
++		case DST__K_TERM_L:
++		  cmd_length = 5;
++		  break;
++
++		case DST__K_SET_ABS_PC:
++		  cmd_length = 5;
++		  break;
++
++		default:
++		  if (cmd <= 0)
++		    cmd_length = 1;
++		  else
++		    cmd_length = 2;
++		  break;
++		}
++
++	      if (pcl_ptr - ptr + cmd_length > rec_length)
++		break;
++
++	      switch (cmd)
++		{
++		case DST__K_DELTA_PC_W:
+ 		  data = bfd_getl16 (pcl_ptr + DST_S_W_PCLINE_UNSWORD);
+ 		  curr_pc += data;
+ 		  curr_linenum += 1;
+-		  cmd_length = 3;
+ 		  vms_debug2 ((4, "DST__K_DELTA_PC_W: %d\n", data));
+ 		  break;
+ 
+@@ -4505,131 +4651,111 @@ parse_module (bfd *abfd, struct module *
+ 		  data = bfd_getl32 (pcl_ptr + DST_S_L_PCLINE_UNSLONG);
+ 		  curr_pc += data;
+ 		  curr_linenum += 1;
+-		  cmd_length = 5;
+ 		  vms_debug2 ((4, "DST__K_DELTA_PC_L: %d\n", data));
+ 		  break;
+ 
+ 		case DST__K_INCR_LINUM:
+ 		  data = pcl_ptr[DST_S_B_PCLINE_UNSBYTE];
+ 		  curr_linenum += data;
+-		  cmd_length = 2;
+ 		  vms_debug2 ((4, "DST__K_INCR_LINUM: %d\n", data));
+ 		  break;
+ 
+ 		case DST__K_INCR_LINUM_W:
+ 		  data = bfd_getl16 (pcl_ptr + DST_S_W_PCLINE_UNSWORD);
+ 		  curr_linenum += data;
+-		  cmd_length = 3;
+ 		  vms_debug2 ((4, "DST__K_INCR_LINUM_W: %d\n", data));
+ 		  break;
+ 
+ 		case DST__K_INCR_LINUM_L:
+ 		  data = bfd_getl32 (pcl_ptr + DST_S_L_PCLINE_UNSLONG);
+ 		  curr_linenum += data;
+-		  cmd_length = 5;
+ 		  vms_debug2 ((4, "DST__K_INCR_LINUM_L: %d\n", data));
+ 		  break;
+ 
+ 		case DST__K_SET_LINUM_INCR:
+ 		  _bfd_error_handler
+ 		    (_("%s not implemented"), "DST__K_SET_LINUM_INCR");
+-		  cmd_length = 2;
+ 		  break;
+ 
+ 		case DST__K_SET_LINUM_INCR_W:
+ 		  _bfd_error_handler
+ 		    (_("%s not implemented"), "DST__K_SET_LINUM_INCR_W");
+-		  cmd_length = 3;
+ 		  break;
+ 
+ 		case DST__K_RESET_LINUM_INCR:
+ 		  _bfd_error_handler
+ 		    (_("%s not implemented"), "DST__K_RESET_LINUM_INCR");
+-		  cmd_length = 1;
+ 		  break;
+ 
+ 		case DST__K_BEG_STMT_MODE:
+ 		  _bfd_error_handler
+ 		    (_("%s not implemented"), "DST__K_BEG_STMT_MODE");
+-		  cmd_length = 1;
+ 		  break;
+ 
+ 		case DST__K_END_STMT_MODE:
+ 		  _bfd_error_handler
+ 		    (_("%s not implemented"), "DST__K_END_STMT_MODE");
+-		  cmd_length = 1;
+ 		  break;
+ 
+ 		case DST__K_SET_LINUM_B:
+ 		  data = pcl_ptr[DST_S_B_PCLINE_UNSBYTE];
+ 		  curr_linenum = data;
+-		  cmd_length = 2;
+ 		  vms_debug2 ((4, "DST__K_SET_LINUM_B: %d\n", data));
+ 		  break;
+ 
+ 		case DST__K_SET_LINUM:
+ 		  data = bfd_getl16 (pcl_ptr + DST_S_W_PCLINE_UNSWORD);
+ 		  curr_linenum = data;
+-		  cmd_length = 3;
+ 		  vms_debug2 ((4, "DST__K_SET_LINE_NUM: %d\n", data));
+ 		  break;
+ 
+ 		case DST__K_SET_LINUM_L:
+ 		  data = bfd_getl32 (pcl_ptr + DST_S_L_PCLINE_UNSLONG);
+ 		  curr_linenum = data;
+-		  cmd_length = 5;
+ 		  vms_debug2 ((4, "DST__K_SET_LINUM_L: %d\n", data));
+ 		  break;
+ 
+ 		case DST__K_SET_PC:
+ 		  _bfd_error_handler
+ 		    (_("%s not implemented"), "DST__K_SET_PC");
+-		  cmd_length = 2;
+ 		  break;
+ 
+ 		case DST__K_SET_PC_W:
+ 		  _bfd_error_handler
+ 		    (_("%s not implemented"), "DST__K_SET_PC_W");
+-		  cmd_length = 3;
+ 		  break;
+ 
+ 		case DST__K_SET_PC_L:
+ 		  _bfd_error_handler
+ 		    (_("%s not implemented"), "DST__K_SET_PC_L");
+-		  cmd_length = 5;
+ 		  break;
+ 
+ 		case DST__K_SET_STMTNUM:
+ 		  _bfd_error_handler
+ 		    (_("%s not implemented"), "DST__K_SET_STMTNUM");
+-		  cmd_length = 2;
+ 		  break;
+ 
+ 		case DST__K_TERM:
+ 		  data = pcl_ptr[DST_S_B_PCLINE_UNSBYTE];
+ 		  curr_pc += data;
+-		  cmd_length = 2;
+ 		  vms_debug2 ((4, "DST__K_TERM: %d\n", data));
+ 		  break;
+ 
+ 		case DST__K_TERM_W:
+ 		  data = bfd_getl16 (pcl_ptr + DST_S_W_PCLINE_UNSWORD);
+ 		  curr_pc += data;
+-		  cmd_length = 3;
+ 		  vms_debug2 ((4, "DST__K_TERM_W: %d\n", data));
+ 		  break;
+ 
+ 		case DST__K_TERM_L:
+ 		  data = bfd_getl32 (pcl_ptr + DST_S_L_PCLINE_UNSLONG);
+ 		  curr_pc += data;
+-		  cmd_length = 5;
+ 		  vms_debug2 ((4, "DST__K_TERM_L: %d\n", data));
+ 		  break;
+ 
+ 		case DST__K_SET_ABS_PC:
+ 		  data = bfd_getl32 (pcl_ptr + DST_S_L_PCLINE_UNSLONG);
+ 		  curr_pc = data;
+-		  cmd_length = 5;
+ 		  vms_debug2 ((4, "DST__K_SET_ABS_PC: 0x%x\n", data));
+ 		  break;
+ 
+@@ -4638,15 +4764,11 @@ parse_module (bfd *abfd, struct module *
+ 		    {
+ 		      curr_pc -= cmd;
+ 		      curr_linenum += 1;
+-		      cmd_length = 1;
+ 		      vms_debug2 ((4, "bump pc to 0x%lx and line to %d\n",
+ 				   (unsigned long)curr_pc, curr_linenum));
+ 		    }
+ 		  else
+-		    {
+-		      _bfd_error_handler (_("unknown line command %d"), cmd);
+-		      cmd_length = 2;
+-		    }
++		    _bfd_error_handler (_("unknown line command %d"), cmd);
+ 		  break;
+ 		}
+ 
+@@ -4778,7 +4900,7 @@ build_module_list (bfd *abfd)
+ 	return NULL;
+ 
+       module = new_module (abfd);
+-      parse_module (abfd, module, PRIV (dst_section)->contents, -1);
++      parse_module (abfd, module, PRIV (dst_section)->contents, PRIV (dst_section)->size);
+       list = module;
+     }
+ 
-- 
2.34.1


