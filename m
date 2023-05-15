Return-Path: <deepadeepthi98@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC01C77B7D
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 06:54:30 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.82787.1684133666599778357
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 May 2023 23:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=iw3GqSnm;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: deepadeepthi98@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1aaebed5bd6so87044755ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 23:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684133666; x=1686725666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B3iC1ZzdWMqMXetYS2UWWCGJONLQUlauC3tA5R2q/Zs=;
        b=iw3GqSnmIbsIzzx17z0OMdUhJBpODQgkVJfYzt6f7yEqOY097isHU6KSroO91I/j16
         ihMb0X02VobbY8TufuizI+9/jM6IvwoEg4XvwCw8aL4/wVBW658akcBXROpg8GYY5HPZ
         zl5sGuMN6qSPDi7/3pUbPKhuWUCkZbc/8WdW6Rwm10UiMUPDS5Os/In/5S5wou/VCiSh
         DX7ixgO/5p61kA/4Q5r3CRUBSHwMhuN+caXiQkXKXIKYWja6JvYpMgs51hSFIsdmD1NH
         feyDv6R39OSM89RANOJeGWXPpm8IYxqS4ctlnHu23hS64nLRozZakEJOojrE6FLAuTOX
         /rMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684133666; x=1686725666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B3iC1ZzdWMqMXetYS2UWWCGJONLQUlauC3tA5R2q/Zs=;
        b=RQxl64SqJ1PipQoDUPdilPicrfRA4Fm9QuVMyuPB4e1CvUasl/cnSdjUzVl9qVMZRj
         NXtxfBogMzMsOh1VnT9m0jYGvRxgszOTK6pa9SpYiBS3GGtErlchx1l4rBDKBJM+6zSf
         IbP+xy+1F51BqdkHm583FlbIpnI8GaLe0o1L4HKkEbsz6w2lpw72hDZpUIrUpBeUMgAp
         ERMTPXIMnG+pL5/uWLBUIs4fm5VqmxVpPu2ti/R9d/+7Yap/Z/5gACNhcpq9/QyRGJeW
         xTTaHqax5C1/CUCDmJhRYBN6YT1FDOMmBDYxlXo9V6IE8CR0ZEJqtGr0wKXW9qGRxVtT
         jmOw==
X-Gm-Message-State: AC+VfDxK9ZSvz0/4K59xcvPFhs2snE7IlBDzuK7teawkEKAVrl5aC2i9
	bqqqQPGZlwt0pRW5nf7NABq83e30bShsff68
X-Google-Smtp-Source: ACHHUZ54UcXuFlgauNqGAH4TgMRteaQ7qu50ZPIDWIr71i7iumFUIlf9uM1X4oWROqYxxdUh9iWt+g==
X-Received: by 2002:a17:902:d505:b0:1a6:dd9a:62c5 with SMTP id b5-20020a170902d50500b001a6dd9a62c5mr42064096plg.10.1684133665444;
        Sun, 14 May 2023 23:54:25 -0700 (PDT)
Received: from bft-PowerEdge-R620.. ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id i9-20020a170902eb4900b001a1b808c1d8sm12580444pli.245.2023.05.14.23.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 23:54:25 -0700 (PDT)
From: Deepthi Hemraj <deepadeepthi98@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	shivams@gmail.com,
	sundeep.kokkonda@gmail.com
Subject: [kirkstone][PATCH] binutils : Fix CVE-2023-25584
Date: Mon, 15 May 2023 12:24:18 +0530
Message-Id: <20230515065418.1439677-1-deepadeepthi98@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 06:54:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181230

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=c9178f285acf19e066be8367185d52837161b0a2]

CVE-2023-25584

Signed-off-by: Deepthi Hemraj <deepadeepthi98@gmail.com>
---
 .../binutils/binutils-2.38.inc                |   9 +-
 .../binutils/0027-CVE-2023-25584-1.patch      |  56 ++
 .../binutils/0027-CVE-2023-25584-2.patch      |  33 ++
 .../binutils/0027-CVE-2023-25584-3.patch      | 533 ++++++++++++++++++
 4 files changed, 625 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0027-CVE-2023-25584-1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0027-CVE-2023-25584-2.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0027-CVE-2023-25584-3.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 5c3ff3d93a..9a54071ed4 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -50,11 +50,8 @@ SRC_URI = "\
      file://0021-CVE-2023-1579-2.patch \
      file://0021-CVE-2023-1579-3.patch \
      file://0021-CVE-2023-1579-4.patch \
-     file://0022-CVE-2023-25584-1.patch \
-     file://0022-CVE-2023-25584-2.patch \
-     file://0022-CVE-2023-25584-3.patch \
-     file://0023-CVE-2023-25585.patch \
-     file://0026-CVE-2023-1972.patch \
-     file://0025-CVE-2023-25588.patch \
+     file://0027-CVE-2023-25584-1.patch \
+     file://0027-CVE-2023-25584-2.patch \
+     file://0027-CVE-2023-25584-3.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0027-CVE-2023-25584-1.patch b/meta/recipes-devtools/binutils/binutils/0027-CVE-2023-25584-1.patch
new file mode 100644
index 0000000000..8d4b670829
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0027-CVE-2023-25584-1.patch
@@ -0,0 +1,56 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Thu, 17 Mar 2022 09:35:39 +0000 (+1030)
+Subject: ubsan: Null dereference in parse_module
+X-Git-Tag: gdb-12.1-release~59
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=c9178f285acf19e066be8367185d52837161b0a2
+
+ubsan: Null dereference in parse_module
+
+	* vms-alpha.c (parse_module): Sanity check that DST__K_RTNBEG
+	has set module->func_table for DST__K_RTNEND.  Check return
+	of bfd_zalloc.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=c9178f285acf19e066be8367185d52837161b0a2]
+
+CVE-2023-25584
+
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+
+---
+
+diff --git a/bfd/vms-alpha.c b/bfd/vms-alpha.c
+index 4a92574c850..1129c98f0e2 100644
+--- a/bfd/vms-alpha.c
++++ b/bfd/vms-alpha.c
+@@ -4352,9 +4352,13 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+
+   /* Initialize tables with zero element.  */
+   curr_srec = (struct srecinfo *) bfd_zalloc (abfd, sizeof (struct srecinfo));
++  if (!curr_srec)
++    return false;
+   module->srec_table = curr_srec;
+
+   curr_line = (struct lineinfo *) bfd_zalloc (abfd, sizeof (struct lineinfo));
++  if (!curr_line)
++    return false;
+   module->line_table = curr_line;
+
+   while (length == -1 || ptr < maxptr)
+@@ -4389,6 +4393,8 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+	case DST__K_RTNBEG:
+	  funcinfo = (struct funcinfo *)
+	    bfd_zalloc (abfd, sizeof (struct funcinfo));
++	  if (!funcinfo)
++	    return false;
+	  funcinfo->name
+	    = _bfd_vms_save_counted_string (abfd, ptr + DST_S_B_RTNBEG_NAME,
+					    maxptr - (ptr + DST_S_B_RTNBEG_NAME));
+@@ -4401,6 +4407,8 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+	  break;
+
+	case DST__K_RTNEND:
++	  if (!module->func_table)
++	    return false;
+	  module->func_table->high = module->func_table->low
+	    + bfd_getl32 (ptr + DST_S_L_RTNEND_SIZE) - 1;
+
diff --git a/meta/recipes-devtools/binutils/binutils/0027-CVE-2023-25584-2.patch b/meta/recipes-devtools/binutils/binutils/0027-CVE-2023-25584-2.patch
new file mode 100644
index 0000000000..399519cbf8
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0027-CVE-2023-25584-2.patch
@@ -0,0 +1,33 @@
+From: Nick Clifton <nickc@redhat.com>
+Date: Mon, 5 Dec 2022 11:11:44 +0000 (+0000)
+Subject: Fix an illegal memory access when parsing a corrupt VMS Alpha file.
+X-Git-Tag: gdb-13-branchpoint~160
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=942fa4fb32738ecbb447546d54f1e5f0312d2ed4
+
+Fix an illegal memory access when parsing a corrupt VMS Alpha file.
+
+	PR 29848
+	* vms-alpha.c (parse_module): Fix potential out of bounds memory
+	access.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=942fa4fb32738ecbb447546d54f1e5f0312d2ed4]
+
+CVE-2023-25584
+
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+
+---
+
+diff --git a/bfd/vms-alpha.c b/bfd/vms-alpha.c
+index 9531953bb6d..c0eb5bc5a2a 100644
+--- a/bfd/vms-alpha.c
++++ b/bfd/vms-alpha.c
+@@ -4366,7 +4366,7 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+     return false;
+   module->line_table = curr_line;
+
+-  while (length == -1 || ptr < maxptr)
++  while (length == -1 || (ptr + 3) < maxptr)
+     {
+       /* The first byte is not counted in the recorded length.  */
+       int rec_length = bfd_getl16 (ptr) + 1;
diff --git a/meta/recipes-devtools/binutils/binutils/0027-CVE-2023-25584-3.patch b/meta/recipes-devtools/binutils/binutils/0027-CVE-2023-25584-3.patch
new file mode 100644
index 0000000000..5e9da47206
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0027-CVE-2023-25584-3.patch
@@ -0,0 +1,533 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 12 Dec 2022 07:58:49 +0000 (+1030)
+Subject: Lack of bounds checking in vms-alpha.c parse_module
+X-Git-Tag: gdb-13-branchpoint~87
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=77c225bdeb410cf60da804879ad41622f5f1aa44
+
+Lack of bounds checking in vms-alpha.c parse_module
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
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=77c225bdeb410cf60da804879ad41622f5f1aa44]
+
+CVE-2023-25584
+
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+---
+
+diff --git a/bfd/vms-alpha.c b/bfd/vms-alpha.c
+index c0eb5bc5a2a..3b63259cc81 100644
+--- a/bfd/vms-alpha.c
++++ b/bfd/vms-alpha.c
+@@ -4345,7 +4345,7 @@ new_module (bfd *abfd)
+
+ static bool
+ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+-	      int length)
++	      bfd_size_type length)
+ {
+   unsigned char *maxptr = ptr + length;
+   unsigned char *src_ptr, *pcl_ptr;
+@@ -4366,7 +4366,7 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+     return false;
+   module->line_table = curr_line;
+
+-  while (length == -1 || (ptr + 3) < maxptr)
++  while (ptr + 3 < maxptr)
+     {
+       /* The first byte is not counted in the recorded length.  */
+       int rec_length = bfd_getl16 (ptr) + 1;
+@@ -4374,15 +4374,19 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+
+       vms_debug2 ((2, "DST record: leng %d, type %d\n", rec_length, rec_type));
+
+-      if (length == -1 && rec_type == DST__K_MODEND)
++      if (rec_length > maxptr - ptr)
++	break;
++      if (rec_type == DST__K_MODEND)
+	break;
+
+       switch (rec_type)
+	{
+	case DST__K_MODBEG:
++	  if (rec_length <= DST_S_B_MODBEG_NAME)
++	    break;
+	  module->name
+	    = _bfd_vms_save_counted_string (abfd, ptr + DST_S_B_MODBEG_NAME,
+-					    maxptr - (ptr + DST_S_B_MODBEG_NAME));
++					    rec_length - DST_S_B_MODBEG_NAME);
+
+	  curr_pc = 0;
+	  prev_pc = 0;
+@@ -4396,13 +4400,15 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+	  break;
+
+	case DST__K_RTNBEG:
++	  if (rec_length <= DST_S_B_RTNBEG_NAME)
++	    break;
+	  funcinfo = (struct funcinfo *)
+	    bfd_zalloc (abfd, sizeof (struct funcinfo));
+	  if (!funcinfo)
+	    return false;
+	  funcinfo->name
+	    = _bfd_vms_save_counted_string (abfd, ptr + DST_S_B_RTNBEG_NAME,
+-					    maxptr - (ptr + DST_S_B_RTNBEG_NAME));
++					    rec_length - DST_S_B_RTNBEG_NAME);
+	  funcinfo->low = bfd_getl32 (ptr + DST_S_L_RTNBEG_ADDRESS);
+	  funcinfo->next = module->func_table;
+	  module->func_table = funcinfo;
+@@ -4412,6 +4418,8 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+	  break;
+
+	case DST__K_RTNEND:
++	  if (rec_length < DST_S_L_RTNEND_SIZE + 4)
++	    break;
+	  if (!module->func_table)
+	    return false;
+	  module->func_table->high = module->func_table->low
+@@ -4444,10 +4452,63 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+
+	  vms_debug2 ((3, "source info\n"));
+
+-	  while (src_ptr < ptr + rec_length)
++	  while (src_ptr - ptr < rec_length)
+	    {
+	      int cmd = src_ptr[0], cmd_length, data;
+
++	      switch (cmd)
++		{
++		case DST__K_SRC_DECLFILE:
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
+	      switch (cmd)
+		{
+		case DST__K_SRC_DECLFILE:
+@@ -4472,7 +4533,6 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+
+		    module->file_table [fileid].name = filename;
+		    module->file_table [fileid].srec = 1;
+-		    cmd_length = src_ptr[DST_S_B_SRC_DF_LENGTH] + 2;
+		    vms_debug2 ((4, "DST_S_C_SRC_DECLFILE: %d, %s\n",
+				 fileid, module->file_table [fileid].name));
+		  }
+@@ -4489,7 +4549,6 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+		  srec->sfile = curr_srec->sfile;
+		  curr_srec->next = srec;
+		  curr_srec = srec;
+-		  cmd_length = 2;
+		  vms_debug2 ((4, "DST_S_C_SRC_DEFLINES_B: %d\n", data));
+		  break;
+
+@@ -4504,14 +4563,12 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+		  srec->sfile = curr_srec->sfile;
+		  curr_srec->next = srec;
+		  curr_srec = srec;
+-		  cmd_length = 3;
+		  vms_debug2 ((4, "DST_S_C_SRC_DEFLINES_W: %d\n", data));
+		  break;
+
+		case DST__K_SRC_INCRLNUM_B:
+		  data = src_ptr[DST_S_B_SRC_UNSBYTE];
+		  curr_srec->line += data;
+-		  cmd_length = 2;
+		  vms_debug2 ((4, "DST_S_C_SRC_INCRLNUM_B: %d\n", data));
+		  break;
+
+@@ -4519,21 +4576,18 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+		  data = bfd_getl16 (src_ptr + DST_S_W_SRC_UNSWORD);
+		  curr_srec->sfile = data;
+		  curr_srec->srec = module->file_table[data].srec;
+-		  cmd_length = 3;
+		  vms_debug2 ((4, "DST_S_C_SRC_SETFILE: %d\n", data));
+		  break;
+
+		case DST__K_SRC_SETLNUM_L:
+		  data = bfd_getl32 (src_ptr + DST_S_L_SRC_UNSLONG);
+		  curr_srec->line = data;
+-		  cmd_length = 5;
+		  vms_debug2 ((4, "DST_S_C_SRC_SETLNUM_L: %d\n", data));
+		  break;
+
+		case DST__K_SRC_SETLNUM_W:
+		  data = bfd_getl16 (src_ptr + DST_S_W_SRC_UNSWORD);
+		  curr_srec->line = data;
+-		  cmd_length = 3;
+		  vms_debug2 ((4, "DST_S_C_SRC_SETLNUM_W: %d\n", data));
+		  break;
+
+@@ -4541,7 +4595,6 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+		  data = bfd_getl32 (src_ptr + DST_S_L_SRC_UNSLONG);
+		  curr_srec->srec = data;
+		  module->file_table[curr_srec->sfile].srec = data;
+-		  cmd_length = 5;
+		  vms_debug2 ((4, "DST_S_C_SRC_SETREC_L: %d\n", data));
+		  break;
+
+@@ -4549,19 +4602,16 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+		  data = bfd_getl16 (src_ptr + DST_S_W_SRC_UNSWORD);
+		  curr_srec->srec = data;
+		  module->file_table[curr_srec->sfile].srec = data;
+-		  cmd_length = 3;
+		  vms_debug2 ((4, "DST_S_C_SRC_SETREC_W: %d\n", data));
+		  break;
+
+		case DST__K_SRC_FORMFEED:
+-		  cmd_length = 1;
+		  vms_debug2 ((4, "DST_S_C_SRC_FORMFEED\n"));
+		  break;
+
+		default:
+		  _bfd_error_handler (_("unknown source command %d"),
+				      cmd);
+-		  cmd_length = 2;
+		  break;
+		}
+
+@@ -4574,18 +4624,114 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+
+	  vms_debug2 ((3, "line info\n"));
+
+-	  while (pcl_ptr < ptr + rec_length)
++	  while (pcl_ptr - ptr < rec_length)
+	    {
+	      /* The command byte is signed so we must sign-extend it.  */
+	      int cmd = ((signed char *)pcl_ptr)[0], cmd_length, data;
+
++	      switch (cmd)
++		{
++		case DST__K_DELTA_PC_W:
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
+	      switch (cmd)
+		{
+		case DST__K_DELTA_PC_W:
+		  data = bfd_getl16 (pcl_ptr + DST_S_W_PCLINE_UNSWORD);
+		  curr_pc += data;
+		  curr_linenum += 1;
+-		  cmd_length = 3;
+		  vms_debug2 ((4, "DST__K_DELTA_PC_W: %d\n", data));
+		  break;
+
+@@ -4593,131 +4739,111 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+		  data = bfd_getl32 (pcl_ptr + DST_S_L_PCLINE_UNSLONG);
+		  curr_pc += data;
+		  curr_linenum += 1;
+-		  cmd_length = 5;
+		  vms_debug2 ((4, "DST__K_DELTA_PC_L: %d\n", data));
+		  break;
+
+		case DST__K_INCR_LINUM:
+		  data = pcl_ptr[DST_S_B_PCLINE_UNSBYTE];
+		  curr_linenum += data;
+-		  cmd_length = 2;
+		  vms_debug2 ((4, "DST__K_INCR_LINUM: %d\n", data));
+		  break;
+
+		case DST__K_INCR_LINUM_W:
+		  data = bfd_getl16 (pcl_ptr + DST_S_W_PCLINE_UNSWORD);
+		  curr_linenum += data;
+-		  cmd_length = 3;
+		  vms_debug2 ((4, "DST__K_INCR_LINUM_W: %d\n", data));
+		  break;
+
+		case DST__K_INCR_LINUM_L:
+		  data = bfd_getl32 (pcl_ptr + DST_S_L_PCLINE_UNSLONG);
+		  curr_linenum += data;
+-		  cmd_length = 5;
+		  vms_debug2 ((4, "DST__K_INCR_LINUM_L: %d\n", data));
+		  break;
+
+		case DST__K_SET_LINUM_INCR:
+		  _bfd_error_handler
+		    (_("%s not implemented"), "DST__K_SET_LINUM_INCR");
+-		  cmd_length = 2;
+		  break;
+
+		case DST__K_SET_LINUM_INCR_W:
+		  _bfd_error_handler
+		    (_("%s not implemented"), "DST__K_SET_LINUM_INCR_W");
+-		  cmd_length = 3;
+		  break;
+
+		case DST__K_RESET_LINUM_INCR:
+		  _bfd_error_handler
+		    (_("%s not implemented"), "DST__K_RESET_LINUM_INCR");
+-		  cmd_length = 1;
+		  break;
+
+		case DST__K_BEG_STMT_MODE:
+		  _bfd_error_handler
+		    (_("%s not implemented"), "DST__K_BEG_STMT_MODE");
+-		  cmd_length = 1;
+		  break;
+
+		case DST__K_END_STMT_MODE:
+		  _bfd_error_handler
+		    (_("%s not implemented"), "DST__K_END_STMT_MODE");
+-		  cmd_length = 1;
+		  break;
+
+		case DST__K_SET_LINUM_B:
+		  data = pcl_ptr[DST_S_B_PCLINE_UNSBYTE];
+		  curr_linenum = data;
+-		  cmd_length = 2;
+		  vms_debug2 ((4, "DST__K_SET_LINUM_B: %d\n", data));
+		  break;
+
+		case DST__K_SET_LINUM:
+		  data = bfd_getl16 (pcl_ptr + DST_S_W_PCLINE_UNSWORD);
+		  curr_linenum = data;
+-		  cmd_length = 3;
+		  vms_debug2 ((4, "DST__K_SET_LINE_NUM: %d\n", data));
+		  break;
+
+		case DST__K_SET_LINUM_L:
+		  data = bfd_getl32 (pcl_ptr + DST_S_L_PCLINE_UNSLONG);
+		  curr_linenum = data;
+-		  cmd_length = 5;
+		  vms_debug2 ((4, "DST__K_SET_LINUM_L: %d\n", data));
+		  break;
+
+		case DST__K_SET_PC:
+		  _bfd_error_handler
+		    (_("%s not implemented"), "DST__K_SET_PC");
+-		  cmd_length = 2;
+		  break;
+
+		case DST__K_SET_PC_W:
+		  _bfd_error_handler
+		    (_("%s not implemented"), "DST__K_SET_PC_W");
+-		  cmd_length = 3;
+		  break;
+
+		case DST__K_SET_PC_L:
+		  _bfd_error_handler
+		    (_("%s not implemented"), "DST__K_SET_PC_L");
+-		  cmd_length = 5;
+		  break;
+
+		case DST__K_SET_STMTNUM:
+		  _bfd_error_handler
+		    (_("%s not implemented"), "DST__K_SET_STMTNUM");
+-		  cmd_length = 2;
+		  break;
+
+		case DST__K_TERM:
+		  data = pcl_ptr[DST_S_B_PCLINE_UNSBYTE];
+		  curr_pc += data;
+-		  cmd_length = 2;
+		  vms_debug2 ((4, "DST__K_TERM: %d\n", data));
+		  break;
+
+		case DST__K_TERM_W:
+		  data = bfd_getl16 (pcl_ptr + DST_S_W_PCLINE_UNSWORD);
+		  curr_pc += data;
+-		  cmd_length = 3;
+		  vms_debug2 ((4, "DST__K_TERM_W: %d\n", data));
+		  break;
+
+		case DST__K_TERM_L:
+		  data = bfd_getl32 (pcl_ptr + DST_S_L_PCLINE_UNSLONG);
+		  curr_pc += data;
+-		  cmd_length = 5;
+		  vms_debug2 ((4, "DST__K_TERM_L: %d\n", data));
+		  break;
+
+		case DST__K_SET_ABS_PC:
+		  data = bfd_getl32 (pcl_ptr + DST_S_L_PCLINE_UNSLONG);
+		  curr_pc = data;
+-		  cmd_length = 5;
+		  vms_debug2 ((4, "DST__K_SET_ABS_PC: 0x%x\n", data));
+		  break;
+
+@@ -4726,15 +4852,11 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+		    {
+		      curr_pc -= cmd;
+		      curr_linenum += 1;
+-		      cmd_length = 1;
+		      vms_debug2 ((4, "bump pc to 0x%lx and line to %d\n",
+				   (unsigned long)curr_pc, curr_linenum));
+		    }
+		  else
+-		    {
+-		      _bfd_error_handler (_("unknown line command %d"), cmd);
+-		      cmd_length = 2;
+-		    }
++		    _bfd_error_handler (_("unknown line command %d"), cmd);
+		  break;
+		}
+
+@@ -4864,7 +4986,8 @@ build_module_list (bfd *abfd)
+	return NULL;
+
+       module = new_module (abfd);
+-      if (!parse_module (abfd, module, PRIV (dst_section)->contents, -1))
++      if (!parse_module (abfd, module, PRIV (dst_section)->contents,
++			 PRIV (dst_section)->size))
+	return NULL;
+       list = module;
+     }
-- 
2.34.1


