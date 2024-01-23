Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF39C47258
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 22:17:44 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.7965.1706048260747711144
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 14:17:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Lw+tjg/7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 51CCD40002;
	Tue, 23 Jan 2024 22:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706048258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=80TMtbemdSHesWqfiXjirFv/Jzh4jnyHQ/Pz4sgnpfU=;
	b=Lw+tjg/7hrzvhIAe6Tuwt74bWyitJnHTNvkGf4G5eWWtfyvnHixA5QsipoPMmgM55tPxHm
	u1rlrbLGt1/EPKvrUvk36u9izZoziisizkjaZyymxVCgL6cPWl5a5eM8vEn6rhS1EBGo4a
	FVgJlPq+Krn2dX5MWAQFtjQsZeMnPdXoGTvM9X2+8Gf4iVLydHj+toAUAqcerS+B4ZT4ue
	nzOQFkO6Z9R465MJxt24q9GZgIRuRnA2a1uB28LyTzkWPGlVPu2/xH290bvnSZO+DA+PjG
	kion11BxJZoKB3ad8w57OcxoSNDg3SN7CC8yw2JPhIA0pviZDcratv0ie6Pu1g==
Date: Tue, 23 Jan 2024 23:17:37 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ashishx88 <ashish.emailaddress@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Ashish Kumar Mishra <ashishm@mvista.com>
Subject: Re: [OE-core] [PATCH v2] binutils: Add patch to fix CVE-2023-25584
Message-ID: <20240123221737fdab60d9@mail.local>
References: <20240122085956.3991507-1-ashish.emailaddress@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240122085956.3991507-1-ashish.emailaddress@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 22:17:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194253

Hello,

This doesn't apply on master, please specify which branch this is for.

On 22/01/2024 14:29:56+0530, Ashishx88 wrote:
> Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=77c225bdeb410cf60da804879ad41622f5f1aa44]
> 
> CVE: CVE-2023-25584
> Signed-off-by: Ashish Kumar Mishra <ashishm@mvista.com>
> ---
>  .../binutils/binutils-2.39.inc                |   1 +
>  .../binutils/0016-CVE-2023-25584.patch        | 535 ++++++++++++++++++
>  2 files changed, 536 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0016-CVE-2023-25584.patch
> 
> diff --git a/meta/recipes-devtools/binutils/binutils-2.39.inc b/meta/recipes-devtools/binutils/binutils-2.39.inc
> index 419571d56c..d57c97edcb 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.39.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.39.inc
> @@ -36,6 +36,7 @@ SRC_URI = "\
>       file://0014-CVE-2022-38128-2.patch \
>       file://0014-CVE-2022-38128-3.patch \
>       file://0015-CVE-2022-4285.patch \
> +     file://0016-CVE-2023-25584.patch \
>  "
>  S  = "${WORKDIR}/git"
>  # Already in 2.39 branch
> diff --git a/meta/recipes-devtools/binutils/binutils/0016-CVE-2023-25584.patch b/meta/recipes-devtools/binutils/binutils/0016-CVE-2023-25584.patch
> new file mode 100644
> index 0000000000..c19e1adb72
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0016-CVE-2023-25584.patch
> @@ -0,0 +1,535 @@
> +From 278ba66aa1d2f1a355940ae2c706ad804becda07 Mon Sep 17 00:00:00 2001
> +From: Alan Modra <amodra@gmail.com>
> +Date: Sun, 21 Jan 2024 20:10:49 +0530
> +Subject: [PATCH] CVE-2023-25584
> +
> +Lack of bounds checking in vms-alpha.c parse_module
> +
> +	PR 29873
> +	PR 29874
> +	PR 29875
> +	PR 29876
> +	PR 29877
> +	PR 29878
> +	PR 29879
> +	PR 29880
> +	PR 29881
> +	PR 29882
> +	PR 29883
> +	PR 29884
> +	PR 29885
> +	PR 29886
> +	PR 29887
> +	PR 29888
> +	PR 29889
> +	PR 29890
> +	PR 29891
> +	* vms-alpha.c (parse_module): Make length param bfd_size_type.
> +	Delete length == -1 checks.  Sanity check record_length.
> +	Sanity check DST__K_MODBEG, DST__K_RTNBEG, DST__K_RTNEND lengths.
> +	Sanity check DST__K_SOURCE and DST__K_LINE_NUM elements
> +	before accessing.
> +	(build_module_list): Pass dst_section size to parse_modu
> +
> +Closes: CVE-2023-25584
> +CVE: CVE-2023-25584
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=77c225bdeb410cf60da804879ad41622f5f1aa44]
> +
> +Signed-off-by: Ashish Kumar Mishra <ashish.emailaddress@gmail.com>
> +---
> + bfd/vms-alpha.c | 213 ++++++++++++++++++++++++++++++++++++++----------
> + 1 file changed, 168 insertions(+), 45 deletions(-)
> +
> +diff --git a/bfd/vms-alpha.c b/bfd/vms-alpha.c
> +index 5a867f71..9b0b2a51 100644
> +--- a/bfd/vms-alpha.c
> ++++ b/bfd/vms-alpha.c
> +@@ -4340,7 +4340,7 @@ new_module (bfd *abfd)
> + 
> + static bool
> + parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
> +-	      int length)
> ++	      bfd_size_type length)
> + {
> +   unsigned char *maxptr = ptr + length;
> +   unsigned char *src_ptr, *pcl_ptr;
> +@@ -4361,7 +4361,7 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
> +     return false;
> +   module->line_table = curr_line;
> + 
> +-  while (length == -1 || ptr < maxptr)
> ++  while (ptr + 3 < maxptr)
> +     {
> +       /* The first byte is not counted in the recorded length.  */
> +       int rec_length = bfd_getl16 (ptr) + 1;
> +@@ -4369,15 +4369,19 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
> + 
> +       vms_debug2 ((2, "DST record: leng %d, type %d\n", rec_length, rec_type));
> + 
> +-      if (length == -1 && rec_type == DST__K_MODEND)
> ++      if (rec_length > maxptr - ptr)
> ++	break;
> ++      if (rec_type == DST__K_MODEND)
> + 	break;
> + 
> +       switch (rec_type)
> + 	{
> + 	case DST__K_MODBEG:
> ++	  if (rec_length <= DST_S_B_MODBEG_NAME)
> ++	    break;
> + 	  module->name
> + 	    = _bfd_vms_save_counted_string (abfd, ptr + DST_S_B_MODBEG_NAME,
> +-					    maxptr - (ptr + DST_S_B_MODBEG_NAME));
> ++					    rec_length - DST_S_B_MODBEG_NAME);
> + 
> + 	  curr_pc = 0;
> + 	  prev_pc = 0;
> +@@ -4391,13 +4395,15 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
> + 	  break;
> + 
> + 	case DST__K_RTNBEG:
> ++	  if (rec_length <= DST_S_B_RTNBEG_NAME)
> ++	    break;
> + 	  funcinfo = (struct funcinfo *)
> + 	    bfd_zalloc (abfd, sizeof (struct funcinfo));
> + 	  if (!funcinfo)
> + 	    return false;
> + 	  funcinfo->name
> + 	    = _bfd_vms_save_counted_string (abfd, ptr + DST_S_B_RTNBEG_NAME,
> +-					    maxptr - (ptr + DST_S_B_RTNBEG_NAME));
> ++					    rec_length - DST_S_B_RTNBEG_NAME);
> + 	  funcinfo->low = bfd_getl32 (ptr + DST_S_L_RTNBEG_ADDRESS);
> + 	  funcinfo->next = module->func_table;
> + 	  module->func_table = funcinfo;
> +@@ -4407,6 +4413,8 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
> + 	  break;
> + 
> + 	case DST__K_RTNEND:
> ++	  if (rec_length < DST_S_L_RTNEND_SIZE + 4)
> ++	    break;
> + 	  if (!module->func_table)
> + 	    return false;
> + 	  module->func_table->high = module->func_table->low
> +@@ -4439,10 +4447,63 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
> + 
> + 	  vms_debug2 ((3, "source info\n"));
> + 
> +-	  while (src_ptr < ptr + rec_length)
> ++	  while (src_ptr - ptr < rec_length)
> + 	    {
> + 	      int cmd = src_ptr[0], cmd_length, data;
> + 
> ++	      switch (cmd)
> ++		{
> ++		case DST__K_SRC_DECLFILE:
> ++		  if (src_ptr - ptr + DST_S_B_SRC_DF_LENGTH >= rec_length)
> ++		    cmd_length = 0x10000;
> ++		  else
> ++		    cmd_length = src_ptr[DST_S_B_SRC_DF_LENGTH] + 2;
> ++		  break;
> ++
> ++		case DST__K_SRC_DEFLINES_B:
> ++		  cmd_length = 2;
> ++		  break;
> ++
> ++		case DST__K_SRC_DEFLINES_W:
> ++		  cmd_length = 3;
> ++		  break;
> ++
> ++		case DST__K_SRC_INCRLNUM_B:
> ++		  cmd_length = 2;
> ++		  break;
> ++
> ++		case DST__K_SRC_SETFILE:
> ++		  cmd_length = 3;
> ++		  break;
> ++
> ++		case DST__K_SRC_SETLNUM_L:
> ++		  cmd_length = 5;
> ++		  break;
> ++
> ++		case DST__K_SRC_SETLNUM_W:
> ++		  cmd_length = 3;
> ++		  break;
> ++
> ++		case DST__K_SRC_SETREC_L:
> ++		  cmd_length = 5;
> ++		  break;
> ++
> ++		case DST__K_SRC_SETREC_W:
> ++		  cmd_length = 3;
> ++		  break;
> ++
> ++		case DST__K_SRC_FORMFEED:
> ++		  cmd_length = 1;
> ++		  break;
> ++
> ++		default:
> ++		  cmd_length = 2;
> ++		  break;
> ++		}
> ++
> ++	      if (src_ptr - ptr + cmd_length > rec_length)
> ++		break;
> ++
> + 	      switch (cmd)
> + 		{
> + 		case DST__K_SRC_DECLFILE:
> +@@ -4467,7 +4528,6 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
> + 
> + 		    module->file_table [fileid].name = filename;
> + 		    module->file_table [fileid].srec = 1;
> +-		    cmd_length = src_ptr[DST_S_B_SRC_DF_LENGTH] + 2;
> + 		    vms_debug2 ((4, "DST_S_C_SRC_DECLFILE: %d, %s\n",
> + 				 fileid, module->file_table [fileid].name));
> + 		  }
> +@@ -4484,7 +4544,6 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
> + 		  srec->sfile = curr_srec->sfile;
> + 		  curr_srec->next = srec;
> + 		  curr_srec = srec;
> +-		  cmd_length = 2;
> + 		  vms_debug2 ((4, "DST_S_C_SRC_DEFLINES_B: %d\n", data));
> + 		  break;
> + 
> +@@ -4499,14 +4558,12 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
> + 		  srec->sfile = curr_srec->sfile;
> + 		  curr_srec->next = srec;
> + 		  curr_srec = srec;
> +-		  cmd_length = 3;
> + 		  vms_debug2 ((4, "DST_S_C_SRC_DEFLINES_W: %d\n", data));
> + 		  break;
> + 
> + 		case DST__K_SRC_INCRLNUM_B:
> + 		  data = src_ptr[DST_S_B_SRC_UNSBYTE];
> + 		  curr_srec->line += data;
> +-		  cmd_length = 2;
> + 		  vms_debug2 ((4, "DST_S_C_SRC_INCRLNUM_B: %d\n", data));
> + 		  break;
> + 
> +@@ -4514,21 +4571,18 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
> + 		  data = bfd_getl16 (src_ptr + DST_S_W_SRC_UNSWORD);
> + 		  curr_srec->sfile = data;
> + 		  curr_srec->srec = module->file_table[data].srec;
> +-		  cmd_length = 3;
> + 		  vms_debug2 ((4, "DST_S_C_SRC_SETFILE: %d\n", data));
> + 		  break;
> + 
> + 		case DST__K_SRC_SETLNUM_L:
> + 		  data = bfd_getl32 (src_ptr + DST_S_L_SRC_UNSLONG);
> + 		  curr_srec->line = data;
> +-		  cmd_length = 5;
> + 		  vms_debug2 ((4, "DST_S_C_SRC_SETLNUM_L: %d\n", data));
> + 		  break;
> + 
> + 		case DST__K_SRC_SETLNUM_W:
> + 		  data = bfd_getl16 (src_ptr + DST_S_W_SRC_UNSWORD);
> + 		  curr_srec->line = data;
> +-		  cmd_length = 3;
> + 		  vms_debug2 ((4, "DST_S_C_SRC_SETLNUM_W: %d\n", data));
> + 		  break;
> + 
> +@@ -4536,7 +4590,6 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
> + 		  data = bfd_getl32 (src_ptr + DST_S_L_SRC_UNSLONG);
> + 		  curr_srec->srec = data;
> + 		  module->file_table[curr_srec->sfile].srec = data;
> +-		  cmd_length = 5;
> + 		  vms_debug2 ((4, "DST_S_C_SRC_SETREC_L: %d\n", data));
> + 		  break;
> + 
> +@@ -4544,19 +4597,16 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
> + 		  data = bfd_getl16 (src_ptr + DST_S_W_SRC_UNSWORD);
> + 		  curr_srec->srec = data;
> + 		  module->file_table[curr_srec->sfile].srec = data;
> +-		  cmd_length = 3;
> + 		  vms_debug2 ((4, "DST_S_C_SRC_SETREC_W: %d\n", data));
> + 		  break;
> + 
> + 		case DST__K_SRC_FORMFEED:
> +-		  cmd_length = 1;
> + 		  vms_debug2 ((4, "DST_S_C_SRC_FORMFEED\n"));
> + 		  break;
> + 
> + 		default:
> + 		  _bfd_error_handler (_("unknown source command %d"),
> + 				      cmd);
> +-		  cmd_length = 2;
> + 		  break;
> + 		}
> + 
> +@@ -4569,18 +4619,114 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
> + 
> + 	  vms_debug2 ((3, "line info\n"));
> + 
> +-	  while (pcl_ptr < ptr + rec_length)
> ++	  while (pcl_ptr - ptr < rec_length)
> + 	    {
> + 	      /* The command byte is signed so we must sign-extend it.  */
> + 	      int cmd = ((signed char *)pcl_ptr)[0], cmd_length, data;
> + 
> ++	      switch (cmd)
> ++		{
> ++		case DST__K_DELTA_PC_W:
> ++		  cmd_length = 3;
> ++		  break;
> ++
> ++		case DST__K_DELTA_PC_L:
> ++		  cmd_length = 5;
> ++		  break;
> ++
> ++		case DST__K_INCR_LINUM:
> ++		  cmd_length = 2;
> ++		  break;
> ++
> ++		case DST__K_INCR_LINUM_W:
> ++		  cmd_length = 3;
> ++		  break;
> ++
> ++		case DST__K_INCR_LINUM_L:
> ++		  cmd_length = 5;
> ++		  break;
> ++
> ++		case DST__K_SET_LINUM_INCR:
> ++		  cmd_length = 2;
> ++		  break;
> ++
> ++		case DST__K_SET_LINUM_INCR_W:
> ++		  cmd_length = 3;
> ++		  break;
> ++
> ++		case DST__K_RESET_LINUM_INCR:
> ++		  cmd_length = 1;
> ++		  break;
> ++
> ++		case DST__K_BEG_STMT_MODE:
> ++		  cmd_length = 1;
> ++		  break;
> ++
> ++		case DST__K_END_STMT_MODE:
> ++		  cmd_length = 1;
> ++		  break;
> ++
> ++		case DST__K_SET_LINUM_B:
> ++		  cmd_length = 2;
> ++		  break;
> ++
> ++		case DST__K_SET_LINUM:
> ++		  cmd_length = 3;
> ++		  break;
> ++
> ++		case DST__K_SET_LINUM_L:
> ++		  cmd_length = 5;
> ++		  break;
> ++
> ++		case DST__K_SET_PC:
> ++		  cmd_length = 2;
> ++		  break;
> ++
> ++		case DST__K_SET_PC_W:
> ++		  cmd_length = 3;
> ++		  break;
> ++
> ++		case DST__K_SET_PC_L:
> ++		  cmd_length = 5;
> ++		  break;
> ++
> ++		case DST__K_SET_STMTNUM:
> ++		  cmd_length = 2;
> ++		  break;
> ++
> ++		case DST__K_TERM:
> ++		  cmd_length = 2;
> ++		  break;
> ++
> ++		case DST__K_TERM_W:
> ++		  cmd_length = 3;
> ++		  break;
> ++
> ++		case DST__K_TERM_L:
> ++		  cmd_length = 5;
> ++		  break;
> ++
> ++		case DST__K_SET_ABS_PC:
> ++		  cmd_length = 5;
> ++		  break;
> ++
> ++		default:
> ++		  if (cmd <= 0)
> ++		    cmd_length = 1;
> ++		  else
> ++		    cmd_length = 2;
> ++		  break;
> ++		}
> ++
> ++	      if (pcl_ptr - ptr + cmd_length > rec_length)
> ++		break;
> ++
> + 	      switch (cmd)
> + 		{
> + 		case DST__K_DELTA_PC_W:
> + 		  data = bfd_getl16 (pcl_ptr + DST_S_W_PCLINE_UNSWORD);
> + 		  curr_pc += data;
> + 		  curr_linenum += 1;
> +-		  cmd_length = 3;
> + 		  vms_debug2 ((4, "DST__K_DELTA_PC_W: %d\n", data));
> + 		  break;
> + 
> +@@ -4588,131 +4734,111 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
> + 		  data = bfd_getl32 (pcl_ptr + DST_S_L_PCLINE_UNSLONG);
> + 		  curr_pc += data;
> + 		  curr_linenum += 1;
> +-		  cmd_length = 5;
> + 		  vms_debug2 ((4, "DST__K_DELTA_PC_L: %d\n", data));
> + 		  break;
> + 
> + 		case DST__K_INCR_LINUM:
> + 		  data = pcl_ptr[DST_S_B_PCLINE_UNSBYTE];
> + 		  curr_linenum += data;
> +-		  cmd_length = 2;
> + 		  vms_debug2 ((4, "DST__K_INCR_LINUM: %d\n", data));
> + 		  break;
> + 
> + 		case DST__K_INCR_LINUM_W:
> + 		  data = bfd_getl16 (pcl_ptr + DST_S_W_PCLINE_UNSWORD);
> + 		  curr_linenum += data;
> +-		  cmd_length = 3;
> + 		  vms_debug2 ((4, "DST__K_INCR_LINUM_W: %d\n", data));
> + 		  break;
> + 
> + 		case DST__K_INCR_LINUM_L:
> + 		  data = bfd_getl32 (pcl_ptr + DST_S_L_PCLINE_UNSLONG);
> + 		  curr_linenum += data;
> +-		  cmd_length = 5;
> + 		  vms_debug2 ((4, "DST__K_INCR_LINUM_L: %d\n", data));
> + 		  break;
> + 
> + 		case DST__K_SET_LINUM_INCR:
> + 		  _bfd_error_handler
> + 		    (_("%s not implemented"), "DST__K_SET_LINUM_INCR");
> +-		  cmd_length = 2;
> + 		  break;
> + 
> + 		case DST__K_SET_LINUM_INCR_W:
> + 		  _bfd_error_handler
> + 		    (_("%s not implemented"), "DST__K_SET_LINUM_INCR_W");
> +-		  cmd_length = 3;
> + 		  break;
> + 
> + 		case DST__K_RESET_LINUM_INCR:
> + 		  _bfd_error_handler
> + 		    (_("%s not implemented"), "DST__K_RESET_LINUM_INCR");
> +-		  cmd_length = 1;
> + 		  break;
> + 
> + 		case DST__K_BEG_STMT_MODE:
> + 		  _bfd_error_handler
> + 		    (_("%s not implemented"), "DST__K_BEG_STMT_MODE");
> +-		  cmd_length = 1;
> + 		  break;
> + 
> + 		case DST__K_END_STMT_MODE:
> + 		  _bfd_error_handler
> + 		    (_("%s not implemented"), "DST__K_END_STMT_MODE");
> +-		  cmd_length = 1;
> + 		  break;
> + 
> + 		case DST__K_SET_LINUM_B:
> + 		  data = pcl_ptr[DST_S_B_PCLINE_UNSBYTE];
> + 		  curr_linenum = data;
> +-		  cmd_length = 2;
> + 		  vms_debug2 ((4, "DST__K_SET_LINUM_B: %d\n", data));
> + 		  break;
> + 
> + 		case DST__K_SET_LINUM:
> + 		  data = bfd_getl16 (pcl_ptr + DST_S_W_PCLINE_UNSWORD);
> + 		  curr_linenum = data;
> +-		  cmd_length = 3;
> + 		  vms_debug2 ((4, "DST__K_SET_LINE_NUM: %d\n", data));
> + 		  break;
> + 
> + 		case DST__K_SET_LINUM_L:
> + 		  data = bfd_getl32 (pcl_ptr + DST_S_L_PCLINE_UNSLONG);
> + 		  curr_linenum = data;
> +-		  cmd_length = 5;
> + 		  vms_debug2 ((4, "DST__K_SET_LINUM_L: %d\n", data));
> + 		  break;
> + 
> + 		case DST__K_SET_PC:
> + 		  _bfd_error_handler
> + 		    (_("%s not implemented"), "DST__K_SET_PC");
> +-		  cmd_length = 2;
> + 		  break;
> + 
> + 		case DST__K_SET_PC_W:
> + 		  _bfd_error_handler
> + 		    (_("%s not implemented"), "DST__K_SET_PC_W");
> +-		  cmd_length = 3;
> + 		  break;
> + 
> + 		case DST__K_SET_PC_L:
> + 		  _bfd_error_handler
> + 		    (_("%s not implemented"), "DST__K_SET_PC_L");
> +-		  cmd_length = 5;
> + 		  break;
> + 
> + 		case DST__K_SET_STMTNUM:
> + 		  _bfd_error_handler
> + 		    (_("%s not implemented"), "DST__K_SET_STMTNUM");
> +-		  cmd_length = 2;
> + 		  break;
> + 
> + 		case DST__K_TERM:
> + 		  data = pcl_ptr[DST_S_B_PCLINE_UNSBYTE];
> + 		  curr_pc += data;
> +-		  cmd_length = 2;
> + 		  vms_debug2 ((4, "DST__K_TERM: %d\n", data));
> + 		  break;
> + 
> + 		case DST__K_TERM_W:
> + 		  data = bfd_getl16 (pcl_ptr + DST_S_W_PCLINE_UNSWORD);
> + 		  curr_pc += data;
> +-		  cmd_length = 3;
> + 		  vms_debug2 ((4, "DST__K_TERM_W: %d\n", data));
> + 		  break;
> + 
> + 		case DST__K_TERM_L:
> + 		  data = bfd_getl32 (pcl_ptr + DST_S_L_PCLINE_UNSLONG);
> + 		  curr_pc += data;
> +-		  cmd_length = 5;
> + 		  vms_debug2 ((4, "DST__K_TERM_L: %d\n", data));
> + 		  break;
> + 
> + 		case DST__K_SET_ABS_PC:
> + 		  data = bfd_getl32 (pcl_ptr + DST_S_L_PCLINE_UNSLONG);
> + 		  curr_pc = data;
> +-		  cmd_length = 5;
> + 		  vms_debug2 ((4, "DST__K_SET_ABS_PC: 0x%x\n", data));
> + 		  break;
> + 
> +@@ -4721,15 +4847,11 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
> + 		    {
> + 		      curr_pc -= cmd;
> + 		      curr_linenum += 1;
> +-		      cmd_length = 1;
> + 		      vms_debug2 ((4, "bump pc to 0x%lx and line to %d\n",
> + 				   (unsigned long)curr_pc, curr_linenum));
> + 		    }
> + 		  else
> +-		    {
> +-		      _bfd_error_handler (_("unknown line command %d"), cmd);
> +-		      cmd_length = 2;
> +-		    }
> ++		    _bfd_error_handler (_("unknown line command %d"), cmd);
> + 		  break;
> + 		}
> + 
> +@@ -4859,7 +4981,8 @@ build_module_list (bfd *abfd)
> + 	return NULL;
> + 
> +       module = new_module (abfd);
> +-      if (!parse_module (abfd, module, PRIV (dst_section)->contents, -1))
> ++      if (!parse_module (abfd, module, PRIV (dst_section)->contents,
> ++			 PRIV (dst_section)->size))
> + 	return NULL;
> +       list = module;
> +     }
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194129): https://lists.openembedded.org/g/openembedded-core/message/194129
> Mute This Topic: https://lists.openembedded.org/mt/103882827/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

