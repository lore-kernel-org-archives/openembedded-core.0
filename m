Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6415E606D1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 08:18:43 +0000 (UTC)
Received: by ioc74 with SMTP id 74so1404566ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Dec 2015 00:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=y5+lQNgikqzmbXrkUDbFno0tSZuyJd6oObDKvYNZuTo=;
	b=W9d7BoxgozZJKz+Z1JI2AvMANWvpL8GZqfp5OBL1BY962ehdUXdB7zkHIIIQqYrYOl
	4cmi7MQaGr8gDeOUoZZgrOMDQsk3D/80SPOAfqv7RytzYS9A2/j5P4Ei7fCJj2L3DVgX
	2KwQTTuGHlsOFLFehAojEK2fInXgEfErf3AW/9KpxgL6ci6ThwnN8i1hf5HK6jmCRSiG
	39JPBKIu8uTkcMG1Ms8VJQIF0uWFm83nMoT2RDOm0Q4LsNwDH1ashsGepjnoJC+MYSEi
	H7KAZzeZWLAuHXgrIB/w/b8Pgec/c/D1p0CguzZnPrO2LWVlsNfnfrkiRMFGE4/kdVaL
	UMkg==
X-Received: by 10.107.4.213 with SMTP id 204mr71351725ioe.195.1448957924597;
	Tue, 01 Dec 2015 00:18:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.12.205 with HTTP; Tue, 1 Dec 2015 00:18:15 -0800 (PST)
In-Reply-To: <1448556053-15960-2-git-send-email-dbaryshkov@gmail.com>
References: <1448556053-15960-1-git-send-email-dbaryshkov@gmail.com>
	<1448556053-15960-2-git-send-email-dbaryshkov@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Dec 2015 00:18:15 -0800
Message-ID: <CAMKF1spW+4fqeQY1krhwAKfXT=Vi5NX4oEH5m=wgij3cKvBefA@mail.gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gcc-4.9: import patch fixing compilation in thumb mode
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
X-List-Received-Date: Tue, 01 Dec 2015 08:18:44 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 26, 2015 at 8:40 AM, Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com> wrote:
> Import patch fixing a bug that caused ICE when compiling some packages
> (e.g. ICU) in Thumb-1 model.
>

This is ok

> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-4.9.inc              |  1 +
>  .../gcc/gcc-4.9/0067-fix-arm-thumb.patch           | 39 ++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0067-fix-arm-thumb.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
> index 6ac3685..d62e801 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.9.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
> @@ -82,6 +82,7 @@ SRC_URI = "\
>      file://0064-handle-target-sysroot-multilib.patch \
>      file://0065-gcc-483-universal-initializer-no-warning.patch \
>      file://0066-cxxflags-for-build.patch \
> +    file://0067-fix-arm-thumb.patch \
>  "
>  SRC_URI[md5sum] = "6f831b4d251872736e8e9cc09746f327"
>  SRC_URI[sha256sum] = "2332b2a5a321b57508b9031354a8503af6fdfb868b8c1748d33028d100a8b67e"
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0067-fix-arm-thumb.patch b/meta/recipes-devtools/gcc/gcc-4.9/0067-fix-arm-thumb.patch
> new file mode 100644
> index 0000000..2f262e3
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.9/0067-fix-arm-thumb.patch
> @@ -0,0 +1,39 @@
> +Upstream-Status: Accepted
> +
> +Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> +---
> +
> +2015-11-25  Vladimir Makarov  <vmakarov@redhat.com>
> +
> +       PR rtl-optimization/67954
> +       * lra-constraints.c (curr_insn_transform): Add check on scratch
> +       pseudo when change class to NO_REGS.  Add an assert.
> +
> +
> +
> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@230894 138bc75d-0d04-0410-961f-82ee72b054a4
> +---
> +
> +diff --git a/gcc/lra-constraints.c b/gcc/lra-constraints.c
> +index 4670e81..c62bf6a 100644
> +--- a/gcc/lra-constraints.c
> ++++ b/gcc/lra-constraints.c
> +@@ -3725,7 +3725,8 @@ curr_insn_transform (bool check_only_p)
> +                assigment pass and the scratch pseudo will be
> +                spilled.  Spilled scratch pseudos are transformed
> +                back to scratches at the LRA end.  */
> +-            && lra_former_scratch_operand_p (curr_insn, i))
> ++            && lra_former_scratch_operand_p (curr_insn, i)
> ++            && lra_former_scratch_p (REGNO (op)))
> +           {
> +             int regno = REGNO (op);
> +             lra_change_class (regno, NO_REGS, "      Change to", true);
> +@@ -3734,6 +3735,8 @@ curr_insn_transform (bool check_only_p)
> +                  spilled pseudo as there is only one such insn, the
> +                  current one.  */
> +               reg_renumber[regno] = -1;
> ++            lra_assert (bitmap_single_bit_set_p
> ++                        (&lra_reg_info[REGNO (op)].insn_bitmap));
> +           }
> +         /* We can do an optional reload.  If the pseudo got a hard
> +            reg, we might improve the code through inheritance.  If
> --
> 2.6.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

