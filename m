Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5541973CC5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 16:31:50 +0000 (UTC)
Received: by iedfl3 with SMTP id fl3so24429359ied.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 09:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=1I2Myn/6QBhWcXh7qNCHm/Tjef2qdzzfSBp5H0nUkb8=;
	b=mXTL1V/LBKtUiKAdrDaMtbArKLGT/0oWzJ20BH4B410MqIdObnq4gyLcyNneBBRsNc
	Y6DifSDY6OKdIt7F2lkm/ErlD6S87eqpSSOt63HCQkm9yGUX075XYsoRLcauoWUKxZyv
	SY/hVQT8OwJzS07GqiNByH4Ub7aAmtDehGtPMf31Zt9beuTLuWDWVKv7ma2CgOPIDElM
	+MZGHWgnyRGFTox6m66b1MkhgGo6VkJpxdlBLspFW/FZDTd5U17tR+9k919qN9flr72T
	SSv3VpK1TBIiyymQsdRPTbPxsFMLY1LYGLf2mUlRTAgvxPgYhxjC2LzKAi24s8yahPwq
	pIQw==
X-Received: by 10.43.89.133 with SMTP id be5mr4863029icc.2.1428683511256; Fri,
	10 Apr 2015 09:31:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Fri, 10 Apr 2015 09:31:21 -0700 (PDT)
In-Reply-To: <1428665669-16128-1-git-send-email-Martin.Jansa@gmail.com>
References: <1428665669-16128-1-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 10 Apr 2015 09:31:21 -0700
Message-ID: <CAMKF1sqCztevLCan33RfnsasdYiibApKuidN1PMaxB-AHFogLA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [dylan][PATCH 1/2] binutils: Fix building nativesdk binutils with gcc 4.9
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
X-List-Received-Date: Fri, 10 Apr 2015 16:31:50 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 10, 2015 at 4:34 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> From: Khem Raj <raj.khem@gmail.com>
>
> Patches explain the issue in detail but this is exposed
> with gcc 4.9 in binutils 2.23.2
>
> (From OE-Core rev: fc5c467b680fc5aef4b0f689e6988e17a9322ae0)
>
> (From OE-Core rev: 4dfb8847ebf8aab90ad8888933468e2899c96998)
>
> (From OE-Core rev: af347d3298e15552d502d5b2ce497bbda9705bc7)
>


this is ok


> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/binutils/binutils-2.23.1.inc |   2 +
>  ...ild-breakage-from-bfd_set_section_vma-cha.patch |  31 ++++
>  .../replace_macros_with_static_inline.patch        | 188 +++++++++++++++++++++
>  3 files changed, 221 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0001-Fix-MMIX-build-breakage-from-bfd_set_section_vma-cha.patch
>  create mode 100644 meta/recipes-devtools/binutils/binutils/replace_macros_with_static_inline.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.23.1.inc b/meta/recipes-devtools/binutils/binutils-2.23.1.inc
> index 667ad0b..7b3366a 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.23.1.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.23.1.inc
> @@ -29,6 +29,8 @@ SRC_URI = "\
>       file://mips64-default-ld-emulation.patch \
>       ${BACKPORT} \
>       file://binutils-fix-over-array-bounds-issue.patch \
> +     file://replace_macros_with_static_inline.patch \
> +     file://0001-Fix-MMIX-build-breakage-from-bfd_set_section_vma-cha.patch \
>       "
>
>  BACKPORT = "\
> diff --git a/meta/recipes-devtools/binutils/binutils/0001-Fix-MMIX-build-breakage-from-bfd_set_section_vma-cha.patch b/meta/recipes-devtools/binutils/binutils/0001-Fix-MMIX-build-breakage-from-bfd_set_section_vma-cha.patch
> new file mode 100644
> index 0000000..f786b17
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0001-Fix-MMIX-build-breakage-from-bfd_set_section_vma-cha.patch
> @@ -0,0 +1,31 @@
> +Upstream-Status: Backport
> +
> +From 0a09fb4a09e80c36fa3ef763ae276fd13d272a36 Mon Sep 17 00:00:00 2001
> +From: Hans-Peter Nilsson <hp@bitrange.com>
> +Date: Sat, 1 Feb 2014 01:11:28 +0100
> +Subject: [PATCH] Fix MMIX build breakage from bfd_set_section_vma change.
> +
> +       * emultempl/mmix-elfnmmo.em (mmix_after_allocation): Fix typo in
> +       call to bfd_set_section_vma exposed by recent bfd_set_section_vma
> +       change.
> +---
> + ld/ChangeLog                 |    6 ++++++
> + ld/emultempl/mmix-elfnmmo.em |    2 +-
> + 2 files changed, 7 insertions(+), 1 deletion(-)
> +
> +diff --git a/ld/emultempl/mmix-elfnmmo.em b/ld/emultempl/mmix-elfnmmo.em
> +index 0059792..5e9781a 100644
> +--- a/ld/emultempl/mmix-elfnmmo.em
> ++++ b/ld/emultempl/mmix-elfnmmo.em
> +@@ -102,7 +102,7 @@ mmix_after_allocation (void)
> +      This section is only present when there are register symbols.  */
> +   sec = bfd_get_section_by_name (link_info.output_bfd, MMIX_REG_SECTION_NAME);
> +   if (sec != NULL)
> +-    bfd_set_section_vma (abfd, sec, 0);
> ++    bfd_set_section_vma (sec->owner, sec, 0);
> +
> +   if (!_bfd_mmix_after_linker_allocation (link_info.output_bfd, &link_info))
> +     {
> +--
> +1.7.10.4
> +
> diff --git a/meta/recipes-devtools/binutils/binutils/replace_macros_with_static_inline.patch b/meta/recipes-devtools/binutils/binutils/replace_macros_with_static_inline.patch
> new file mode 100644
> index 0000000..834f55c
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/replace_macros_with_static_inline.patch
> @@ -0,0 +1,188 @@
> +Upstream-Status: Backport
> +
> +From 27b829ee701e29804216b3803fbaeb629be27491 Mon Sep 17 00:00:00 2001
> +From: Nick Clifton <nickc@redhat.com>
> +Date: Wed, 29 Jan 2014 13:46:39 +0000
> +Subject: [PATCH 1/1] Following up on Tom's suggestion I am checking in a patch to replace the various
> + bfd_xxx_set macros with static inline functions, so that we can avoid compile time
> + warnings about comma expressions with unused values.
> +
> +       * bfd-in.h (bfd_set_section_vma): Delete.
> +       (bfd_set_section_alignment): Delete.
> +       (bfd_set_section_userdata): Delete.
> +       (bfd_set_cacheable): Delete.
> +       * bfd.c (bfd_set_cacheable): New static inline function.
> +       * section.c (bfd_set_section_userdata): Likewise.
> +       (bfd_set_section_vma): Likewise.
> +       (bfd_set_section_alignment): Likewise.
> +       * bfd-in2.h: Regenerate.
> +---
> + bfd/ChangeLog |   12 ++++++++++++
> + bfd/bfd-in.h  |    5 -----
> + bfd/bfd-in2.h |   41 +++++++++++++++++++++++++++++++++++------
> + bfd/bfd.c     |    8 ++++++++
> + bfd/section.c |   26 ++++++++++++++++++++++++++
> + 5 files changed, 81 insertions(+), 11 deletions(-)
> +
> +diff --git a/bfd/bfd-in.h b/bfd/bfd-in.h
> +index 3afd71b..c7c5a7d 100644
> +--- a/bfd/bfd-in.h
> ++++ b/bfd/bfd-in.h
> +@@ -292,9 +292,6 @@ typedef struct bfd_section *sec_ptr;
> +
> + #define bfd_is_com_section(ptr) (((ptr)->flags & SEC_IS_COMMON) != 0)
> +
> +-#define bfd_set_section_vma(bfd, ptr, val) (((ptr)->vma = (ptr)->lma = (val)), ((ptr)->user_set_vma = TRUE), TRUE)
> +-#define bfd_set_section_alignment(bfd, ptr, val) (((ptr)->alignment_power = (val)),TRUE)
> +-#define bfd_set_section_userdata(bfd, ptr, val) (((ptr)->userdata = (val)),TRUE)
> + /* Find the address one past the end of SEC.  */
> + #define bfd_get_section_limit(bfd, sec) \
> +   (((bfd)->direction != write_direction && (sec)->rawsize != 0        \
> +@@ -517,8 +514,6 @@ extern void warn_deprecated (const char *, const char *, int, const char *);
> +
> + #define bfd_get_symbol_leading_char(abfd) ((abfd)->xvec->symbol_leading_char)
> +
> +-#define bfd_set_cacheable(abfd,bool) (((abfd)->cacheable = bool), TRUE)
> +-
> + extern bfd_boolean bfd_cache_close
> +   (bfd *abfd);
> + /* NB: This declaration should match the autogenerated one in libbfd.h.  */
> +diff --git a/bfd/bfd-in2.h b/bfd/bfd-in2.h
> +index 71996db..b5aeb40 100644
> +--- a/bfd/bfd-in2.h
> ++++ b/bfd/bfd-in2.h
> +@@ -299,9 +299,6 @@ typedef struct bfd_section *sec_ptr;
> +
> + #define bfd_is_com_section(ptr) (((ptr)->flags & SEC_IS_COMMON) != 0)
> +
> +-#define bfd_set_section_vma(bfd, ptr, val) (((ptr)->vma = (ptr)->lma = (val)), ((ptr)->user_set_vma = TRUE), TRUE)
> +-#define bfd_set_section_alignment(bfd, ptr, val) (((ptr)->alignment_power = (val)),TRUE)
> +-#define bfd_set_section_userdata(bfd, ptr, val) (((ptr)->userdata = (val)),TRUE)
> + /* Find the address one past the end of SEC.  */
> + #define bfd_get_section_limit(bfd, sec) \
> +   (((bfd)->direction != write_direction && (sec)->rawsize != 0        \
> +@@ -524,8 +521,6 @@ extern void warn_deprecated (const char *, const char *, int, const char *);
> +
> + #define bfd_get_symbol_leading_char(abfd) ((abfd)->xvec->symbol_leading_char)
> +
> +-#define bfd_set_cacheable(abfd,bool) (((abfd)->cacheable = bool), TRUE)
> +-
> + extern bfd_boolean bfd_cache_close
> +   (bfd *abfd);
> + /* NB: This declaration should match the autogenerated one in libbfd.h.  */
> +@@ -1029,7 +1024,7 @@ bfd *bfd_openr (const char *filename, const char *target);
> +
> + bfd *bfd_fdopenr (const char *filename, const char *target, int fd);
> +
> +-bfd *bfd_openstreamr (const char *, const char *, void *);
> ++bfd *bfd_openstreamr (const char * filename, const char * target, void * stream);
> +
> + bfd *bfd_openr_iovec (const char *filename, const char *target,
> +     void *(*open_func) (struct bfd *nbfd,
> +@@ -1596,6 +1591,32 @@ struct relax_table {
> +   int size;
> + };
> +
> ++/* Note: the following are provided as inline functions rather than macros
> ++   because not all callers use the return value.  A macro implementation
> ++   would use a comma expression, eg: "((ptr)->foo = val, TRUE)" and some
> ++   compilers will complain about comma expressions that have no effect.  */
> ++static inline bfd_boolean
> ++bfd_set_section_userdata (bfd * abfd ATTRIBUTE_UNUSED, asection * ptr, void * val)
> ++{
> ++  ptr->userdata = val;
> ++  return TRUE;
> ++}
> ++
> ++static inline bfd_boolean
> ++bfd_set_section_vma (bfd * abfd ATTRIBUTE_UNUSED, asection * ptr, bfd_vma val)
> ++{
> ++  ptr->vma = ptr->lma = val;
> ++  ptr->user_set_vma = TRUE;
> ++  return TRUE;
> ++}
> ++
> ++static inline bfd_boolean
> ++bfd_set_section_alignment (bfd * abfd ATTRIBUTE_UNUSED, asection * ptr, unsigned int val)
> ++{
> ++  ptr->alignment_power = val;
> ++  return TRUE;
> ++}
> ++
> + /* These sections are global, and are managed by BFD.  The application
> +    and target back end are not permitted to change the values in
> +    these sections.  */
> +@@ -6415,6 +6436,14 @@ struct bfd
> +   unsigned int selective_search : 1;
> + };
> +
> ++/* See note beside bfd_set_section_userdata.  */
> ++static inline bfd_boolean
> ++bfd_set_cacheable (bfd * abfd, bfd_boolean val)
> ++{
> ++  abfd->cacheable = val;
> ++  return TRUE;
> ++}
> ++
> + typedef enum bfd_error
> + {
> +   bfd_error_no_error = 0,
> +diff --git a/bfd/bfd.c b/bfd/bfd.c
> +index 8d0580c..2d174f3 100644
> +--- a/bfd/bfd.c
> ++++ b/bfd/bfd.c
> +@@ -311,6 +311,14 @@ CODE_FRAGMENT
> + .  unsigned int selective_search : 1;
> + .};
> + .
> ++.{* See note beside bfd_set_section_userdata.  *}
> ++.static inline bfd_boolean
> ++.bfd_set_cacheable (bfd * abfd, bfd_boolean val)
> ++.{
> ++.  abfd->cacheable = val;
> ++.  return TRUE;
> ++.}
> ++.
> + */
> +
> + #include "sysdep.h"
> +diff --git a/bfd/section.c b/bfd/section.c
> +index fb19d8c..a661228 100644
> +--- a/bfd/section.c
> ++++ b/bfd/section.c
> +@@ -542,6 +542,32 @@ CODE_FRAGMENT
> + .  int size;
> + .};
> + .
> ++.{* Note: the following are provided as inline functions rather than macros
> ++.   because not all callers use the return value.  A macro implementation
> ++.   would use a comma expression, eg: "((ptr)->foo = val, TRUE)" and some
> ++.   compilers will complain about comma expressions that have no effect.  *}
> ++.static inline bfd_boolean
> ++.bfd_set_section_userdata (bfd * abfd ATTRIBUTE_UNUSED, asection * ptr, void * val)
> ++.{
> ++.  ptr->userdata = val;
> ++.  return TRUE;
> ++.}
> ++.
> ++.static inline bfd_boolean
> ++.bfd_set_section_vma (bfd * abfd ATTRIBUTE_UNUSED, asection * ptr, bfd_vma val)
> ++.{
> ++.  ptr->vma = ptr->lma = val;
> ++.  ptr->user_set_vma = TRUE;
> ++.  return TRUE;
> ++.}
> ++.
> ++.static inline bfd_boolean
> ++.bfd_set_section_alignment (bfd * abfd ATTRIBUTE_UNUSED, asection * ptr, unsigned int val)
> ++.{
> ++.  ptr->alignment_power = val;
> ++.  return TRUE;
> ++.}
> ++.
> + .{* These sections are global, and are managed by BFD.  The application
> + .   and target back end are not permitted to change the values in
> + .   these sections.  *}
> +--
> +1.7.1
> +
> --
> 2.3.5
>

