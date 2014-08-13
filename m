Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1B51660196
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 14:58:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7DEwI7n014061
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 07:58:18 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.234) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Wed, 13 Aug 2014 07:58:17 -0700
Message-ID: <53EB7D09.8090202@windriver.com>
Date: Wed, 13 Aug 2014 09:58:17 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1407914400-50293-1-git-send-email-yasir_khan@mentor.com>
In-Reply-To: <1407914400-50293-1-git-send-email-yasir_khan@mentor.com>
Subject: Re: [PATCH] prelink: apply patch for ARM IFUNC support
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
X-List-Received-Date: Wed, 13 Aug 2014 14:58:21 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Just an FYI, this does not apply with the top of the tree cross-prelink.  (I 
have attempted to apply it to the staging tree, but I'm unclear who the original 
author is of this..)

The change has been made to the cross_prelink_staging branch, see:

http://git.yoctoproject.org/cgit/cgit.cgi/prelink-cross/commit/?h=cross_prelink_staging&id=3b381e6595be052baa7705ddb318ea3bf9b95cf2

If this is not correct (especially the patch author or other attributions, 
please let me know...)

Also if you could verify the problem being fixed/new feature, I would appreciate 
it..

On 8/13/14, 2:20 AM, Yasir Khan wrote:
> From: Yasir-Khan <yasir_khan@mentor.com>
>
>  From Julian Brown, see
> http://sourcery.sje.mentorg.com/pipermail/gnu-arm-releases/2014-April/015072.html.

Also the above appears to be an internal to Mentor address.  Since we can't read 
this, it would be helpful to quote the relevant information into the commit 
message, as I can only guess [based on what this is doing] as to why the change 
is needed.

--Mark

> Signed-off-by: Christopher Larson <kergoth@gmail.com>
> Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
> ---
>   .../prelink/prelink/arm-ifunc.patch                |  264 ++++++++++++++++++++
>   meta/recipes-devtools/prelink/prelink_git.bb       |    4 +-
>   2 files changed, 267 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-devtools/prelink/prelink/arm-ifunc.patch
>
> diff --git a/meta/recipes-devtools/prelink/prelink/arm-ifunc.patch b/meta/recipes-devtools/prelink/prelink/arm-ifunc.patch
> new file mode 100644
> index 0000000..b63affc
> --- /dev/null
> +++ b/meta/recipes-devtools/prelink/prelink/arm-ifunc.patch
> @@ -0,0 +1,264 @@
> +Kyle McMartin  <kmcmartin@redhat.com>
> +Jakub Jelinek  <jakub@redhat.com>
> +Julian Brown  <julian@codesourcery.com>
> +
> +* testsuite/ifunc.h: Add ARM support.
> +* src/prelink.h (R_ARM_IRELATIVE): Define.
> +* src/arch-arm.c (arm_adjust_rel, arm_adjust_rela)
> +(arm_prelink_rel, arm_prelink_rela, arm_apply_conflict_rela)
> +(arm_rela_to_rel, arm_rel_to_rela, arm_undo_prelink_rel):
> +Handle R_ARM_IRELATIVE.
> +(arm_prelink_conflict_rel, arm_prelink_conflict_rela): Handle
> +R_ARM_IRELATIVE, ifunc conflicts.
> +
> +Upstream-Status: Pending [This is applied to the CodeBench toolchain, but not to upstream prelink, nor to prelink-cross]
> +
> +Index: trunk/src/arch-arm.c
> +===================================================================
> +--- trunk.orig/src/arch-arm.c	2014-04-25 16:07:02.190843841 -0700
> ++++ trunk/src/arch-arm.c	2014-04-25 16:08:12.211355745 -0700
> +@@ -1,4 +1,4 @@
> +-/* Copyright (C) 2001, 2002, 2004, 2009, 2011 Red Hat, Inc.
> ++/* Copyright (C) 2001, 2002, 2004, 2009, 2011, 2013 Red Hat, Inc.
> +    Written by Jakub Jelinek <jakub@redhat.com>, 2001.
> +
> +    This program is free software; you can redistribute it and/or modify
> +@@ -80,6 +80,7 @@
> +     {
> +     case R_ARM_RELATIVE:
> +     case R_ARM_JUMP_SLOT:
> ++    case R_ARM_IRELATIVE:
> +       data = read_une32 (dso, rel->r_offset);
> +       if (data >= start)
> + 	write_ne32 (dso, rel->r_offset, data + adjust);
> +@@ -97,6 +98,7 @@
> +   switch (GELF_R_TYPE (rela->r_info))
> +     {
> +     case R_ARM_RELATIVE:
> ++    case R_ARM_IRELATIVE:
> +       if ((Elf32_Addr) rela->r_addend >= start)
> + 	{
> + 	  rela->r_addend += (Elf32_Sword) adjust;
> +@@ -123,6 +125,7 @@
> +   Elf32_Sword val;
> +
> +   if (GELF_R_TYPE (rel->r_info) == R_ARM_RELATIVE
> ++      || GELF_R_TYPE (rel->r_info) == R_ARM_IRELATIVE
> +       || GELF_R_TYPE (rel->r_info) == R_ARM_NONE)
> +     /* Fast path: nothing to do.  */
> +     return 0;
> +@@ -212,6 +215,7 @@
> +   Elf32_Sword val;
> +
> +   if (GELF_R_TYPE (rela->r_info) == R_ARM_RELATIVE
> ++      || GELF_R_TYPE (rela->r_info) == R_ARM_IRELATIVE
> +       || GELF_R_TYPE (rela->r_info) == R_ARM_NONE)
> +     /* Fast path: nothing to do.  */
> +     return 0;
> +@@ -293,6 +297,8 @@
> + arm_apply_conflict_rela (struct prelink_info *info, GElf_Rela *rela,
> + 			 char *buf, GElf_Addr dest_addr)
> + {
> ++  GElf_Rela *ret;
> ++
> +   switch (GELF_R_TYPE (rela->r_info))
> +     {
> +     case R_ARM_GLOB_DAT:
> +@@ -300,6 +306,16 @@
> +     case R_ARM_ABS32:
> +       buf_write_ne32 (info->dso, buf, rela->r_addend);
> +       break;
> ++    case R_ARM_IRELATIVE:
> ++      if (dest_addr == 0)
> ++	return 5;
> ++      ret = prelink_conflict_add_rela (info);
> ++      if (ret == NULL)
> ++	return 1;
> ++      ret->r_offset = dest_addr;
> ++      ret->r_info = GELF_R_INFO (0, R_ARM_IRELATIVE);
> ++      ret->r_addend = rela->r_addend;
> ++      break;
> +     default:
> +       abort ();
> +     }
> +@@ -399,35 +415,31 @@
> +   GElf_Rela *ret;
> +
> +   if (GELF_R_TYPE (rel->r_info) == R_ARM_RELATIVE
> +-      || GELF_R_TYPE (rel->r_info) == R_ARM_NONE
> +-      || info->dso == dso)
> ++      || GELF_R_TYPE (rel->r_info) == R_ARM_NONE)
> +     /* Fast path: nothing to do.  */
> +     return 0;
> +   conflict = prelink_conflict (info, GELF_R_SYM (rel->r_info),
> + 			       GELF_R_TYPE (rel->r_info));
> +   if (conflict == NULL)
> +     {
> +-      if (info->curtls == NULL)
> +-	return 0;
> +-
> +       switch (GELF_R_TYPE (rel->r_info))
> + 	{
> + 	/* Even local DTPMOD and TPOFF relocs need conflicts.  */
> + 	case R_ARM_TLS_DTPMOD32:
> + 	case R_ARM_TLS_TPOFF32:
> ++	  if (info->curtls == NULL || info->dso == dso)
> ++	    return 0;
> ++	  break;
> ++	/* Similarly IRELATIVE relocations always need conflicts.  */
> ++	case R_ARM_IRELATIVE:
> + 	  break;
> +-
> + 	default:
> + 	  return 0;
> + 	}
> +       value = 0;
> +     }
> +-  else if (conflict->ifunc)
> +-    {
> +-      error (0, 0, "%s: STT_GNU_IFUNC not handled on ARM yet",
> +-	     dso->filename);
> +-      return 1;
> +-    }
> ++  else if (info->dso == dso && !conflict->ifunc)
> ++    return 0;
> +   else
> +     {
> +       /* DTPOFF32 wants to see only real conflicts, not lookups
> +@@ -450,6 +462,11 @@
> +     case R_ARM_GLOB_DAT:
> +     case R_ARM_JUMP_SLOT:
> +       ret->r_addend = (Elf32_Sword) value;
> ++      if (conflict != NULL && conflict->ifunc)
> ++	ret->r_info = GELF_R_INFO (0, R_ARM_IRELATIVE);
> ++      break;
> ++    case R_ARM_IRELATIVE:
> ++      ret->r_addend = (Elf32_Sword) read_une32 (dso, rel->r_offset);
> +       break;
> +     case R_ARM_ABS32:
> +     case R_ARM_PC24:
> +@@ -508,8 +525,7 @@
> +   Elf32_Sword val;
> +
> +   if (GELF_R_TYPE (rela->r_info) == R_ARM_RELATIVE
> +-      || GELF_R_TYPE (rela->r_info) == R_ARM_NONE
> +-      || info->dso == dso)
> ++      || GELF_R_TYPE (rela->r_info) == R_ARM_NONE)
> +     /* Fast path: nothing to do.  */
> +     return 0;
> +   conflict = prelink_conflict (info, GELF_R_SYM (rela->r_info),
> +@@ -517,27 +533,24 @@
> +
> +   if (conflict == NULL)
> +     {
> +-      if (info->curtls == NULL)
> +-	return 0;
> +-
> +       switch (GELF_R_TYPE (rela->r_info))
> + 	{
> + 	/* Even local DTPMOD and TPOFF relocs need conflicts.  */
> + 	case R_ARM_TLS_DTPMOD32:
> + 	case R_ARM_TLS_TPOFF32:
> ++	  if (info->curtls == NULL || info->dso == dso)
> ++	    return 0;
> ++	  break;
> ++	/* Similarly IRELATIVE relocations always need conflicts.  */
> ++	case R_ARM_IRELATIVE:
> + 	  break;
> +-
> + 	default:
> + 	  return 0;
> + 	}
> +       value = 0;
> +     }
> +-  else if (conflict->ifunc)
> +-    {
> +-      error (0, 0, "%s: STT_GNU_IFUNC not handled on ARM yet",
> +-	     dso->filename);
> +-      return 1;
> +-    }
> ++  else if (info->dso == dso && !conflict->ifunc)
> ++    return 0;
> +   else
> +     {
> +       /* DTPOFF32 wants to see only real conflicts, not lookups
> +@@ -560,7 +573,10 @@
> +     case R_ARM_GLOB_DAT:
> +     case R_ARM_JUMP_SLOT:
> +     case R_ARM_ABS32:
> ++    case R_ARM_IRELATIVE:
> +       ret->r_addend = (Elf32_Sword) (value + rela->r_addend);
> ++      if (conflict && conflict->ifunc)
> ++	ret->r_info = GELF_R_INFO (0, R_ARM_IRELATIVE);
> +       break;
> +     case R_ARM_PC24:
> +       val = value + rela->r_addend - rela->r_offset;
> +@@ -625,6 +641,7 @@
> +       /* We should be never converting .rel.plt into .rela.plt.  */
> +       abort ();
> +     case R_ARM_RELATIVE:
> ++    case R_ARM_IRELATIVE:
> +     case R_ARM_ABS32:
> +     case R_ARM_TLS_TPOFF32:
> +     case R_ARM_TLS_DTPOFF32:
> +@@ -656,6 +673,7 @@
> + 	 and thus never .rela.plt back to .rel.plt.  */
> +       abort ();
> +     case R_ARM_RELATIVE:
> ++    case R_ARM_IRELATIVE:
> +     case R_ARM_ABS32:
> +     case R_ARM_TLS_TPOFF32:
> +     case R_ARM_TLS_DTPOFF32:
> +@@ -794,6 +812,7 @@
> +   switch (GELF_R_TYPE (rel->r_info))
> +     {
> +     case R_ARM_RELATIVE:
> ++    case R_ARM_IRELATIVE:
> +     case R_ARM_NONE:
> +       break;
> +     case R_ARM_JUMP_SLOT:
> +Index: trunk/src/prelink.h
> +===================================================================
> +--- trunk.orig/src/prelink.h	2014-04-25 16:07:02.000000000 -0700
> ++++ trunk/src/prelink.h	2014-04-25 16:08:12.235355916 -0700
> +@@ -145,6 +145,10 @@
> + #define R_390_IRELATIVE		61
> + #endif
> +
> ++#ifndef R_ARM_IRELATIVE
> ++#define R_ARM_IRELATIVE		160
> ++#endif
> ++
> + struct prelink_entry;
> + struct prelink_info;
> + struct PLArch;
> +Index: trunk/testsuite/ifunc.h
> +===================================================================
> +--- trunk.orig/testsuite/ifunc.h	2014-04-25 16:07:02.000000000 -0700
> ++++ trunk/testsuite/ifunc.h	2014-04-25 16:08:43.831585698 -0700
> +@@ -35,6 +35,25 @@
> +      IFUNC_ASM (PICK (fn1, fn2))			\
> +      "\t.size " #name ", .-.L" #name "\n")
> + # endif
> ++#elif defined __arm__
> ++# ifdef __thumb__
> ++#  define PIPE_OFFSET "4"
> ++# else
> ++#  define PIPE_OFFSET "8"
> ++# endif
> ++# define IFUNC_ASM(fn)					\
> ++     "\tldr r0, .L" fn "\n"				\
> ++   "1:\tadd r0, pc, r0\n"				\
> ++     "\tmov pc, lr\n"					\
> ++     ".L" fn ": .long " fn " - 1b - " PIPE_OFFSET "\n"
> ++# define IFUNC_DECL(name, hidden, fn1, fn2)		\
> ++asm (".text\n"						\
> ++     "\t.globl " #name "\n"				\
> ++     "\t" hidden " " #name "\n"				\
> ++     "\t.type " #name ", %gnu_indirect_function\n"	\
> ++     #name ":\n"					\
> ++     IFUNC_ASM (PICK (fn1, fn2))			\
> ++     "\t.size " #name ", .-" #name "\n")
> + #else
> + # error Architecture not supported
> + #endif
> diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
> index 3288822..5aa850d 100644
> --- a/meta/recipes-devtools/prelink/prelink_git.bb
> +++ b/meta/recipes-devtools/prelink/prelink_git.bb
> @@ -30,7 +30,9 @@ SRC_URI = "git://git.yoctoproject.org/prelink-cross.git;branch=cross_prelink \
>              file://prelink.conf \
>              file://prelink.cron.daily \
>              file://prelink.default \
> -	   file://macros.prelink"
> +	   file://macros.prelink \
> +           file://arm-ifunc.patch \
> +"
>
>   TARGET_OS_ORIG := "${TARGET_OS}"
>   OVERRIDES_append = ":${TARGET_OS_ORIG}"
>


