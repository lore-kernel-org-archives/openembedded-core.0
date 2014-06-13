Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3BA746B8D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 16:06:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5DG6OrP027307
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 09:06:25 -0700 (PDT)
Received: from msp-dhcp39.wrs.com (172.25.34.39) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Fri, 13 Jun 2014 09:06:23 -0700
Message-ID: <539B217F.4060603@windriver.com>
Date: Fri, 13 Jun 2014 11:06:23 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1402646310.12440.471.camel@ted>
In-Reply-To: <1402646310.12440.471.camel@ted>
Subject: Re: [PATCH] elfutils: Fix debugedit failure in grub
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
X-List-Received-Date: Fri, 13 Jun 2014 16:06:25 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 6/13/14, 2:58 AM, Richard Purdie wrote:
> We've seeing occasional debugedit failures in grub during do_package
> which in turn are coming from section alignment failures from libelf.
> The failures occur when gold is used to link grub instead of ld.bfd.
>
> "readelf -e uhci.module" shows:
>
> Section Headers:
>    [Nr] Name              Type            Addr     Off    Size   ES Flg Lk Inf Al
>    [12] .note.GNU-stack   PROGBITS        00000000 0010ce 000000 00      0   0  1
>
> in a good build and:
>
> Section Headers:
>    [Nr] Name              Type            Addr     Off    Size   ES Flg Lk Inf Al
>    [24] .note.GNU-stack   PROGBITS        00000000 009180 000000 00      0   0  0
>
> in a bad build. The problem is the "Al" (alignment) change from 1 to 0.
> If its 0, debugedit complains.
>
> As far as I can tell, the alignment of a zero length section is not
> an issue and the check in libelf should check the section size and only
> give alignment errors if there is some data to align.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

While I haven't tried the fix, I agree, this is my understanding of what should 
be happening as well.  A zero size section should not complain.

--Mark

> diff --git a/meta/recipes-devtools/elfutils/elfutils-0.158/fixheadercheck.patch b/meta/recipes-devtools/elfutils/elfutils-0.158/fixheadercheck.patch
> new file mode 100644
> index 0000000..8796e9a
> --- /dev/null
> +++ b/meta/recipes-devtools/elfutils/elfutils-0.158/fixheadercheck.patch
> @@ -0,0 +1,24 @@
> +For some binaries we can get a invalid section alignment, for example if
> +sh_align = 1 and sh_addralign is 0. In the case of a zero size section like
> +".note.GNU-stack", this is irrelavent as far as I can tell and we shouldn't
> +error in this case.
> +
> +RP 2014/6/11
> +
> +Upstream-Status: Pending
> +
> +Index: elfutils-0.158/libelf/elf32_updatenull.c
> +===================================================================
> +--- elfutils-0.158.orig/libelf/elf32_updatenull.c	2012-12-14 22:40:48.000000000 +0000
> ++++ elfutils-0.158/libelf/elf32_updatenull.c	2014-06-11 16:35:43.417386291 +0000
> +@@ -327,8 +327,8 @@
> + 		     we test for the alignment of the section being large
> + 		     enough for the largest alignment required by a data
> + 		     block.  */
> +-		  if (unlikely (! powerof2 (shdr->sh_addralign))
> +-		      || unlikely (shdr->sh_addralign < sh_align))
> ++		  if (shdr->sh_size && (unlikely (! powerof2 (shdr->sh_addralign))
> ++		      || unlikely (shdr->sh_addralign < sh_align)))
> + 		    {
> + 		      __libelf_seterrno (ELF_E_INVALID_ALIGN);
> + 		      return -1;
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.158.bb b/meta/recipes-devtools/elfutils/elfutils_0.158.bb
> index e425364..ef3dd0b 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.158.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.158.bb
> @@ -25,13 +25,11 @@ SRC_URI += "\
>           file://core_filename.patch \
>           file://CVE-2014-0172.patch \
>           file://unwind_non_linux.patch \
> -"
> -
> -SRC_URI += " \
> -	file://elf_additions.diff \
> -	file://mempcpy.patch \
> -	file://dso-link-change.patch \
> -	file://m4-biarch.m4-tweak-AC_RUN_IFELSE-for-cross-compiling.patch \
> +        file://elf_additions.diff \
> +        file://mempcpy.patch \
> +        file://dso-link-change.patch \
> +        file://m4-biarch.m4-tweak-AC_RUN_IFELSE-for-cross-compiling.patch \
> +        file://fixheadercheck.patch \
>   "
>
>   # Only apply when building uclibc based target recipe
>
>


