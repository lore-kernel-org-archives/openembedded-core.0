Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id C771D6FF76
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 08:19:06 +0000 (UTC)
Received: by iouu10 with SMTP id u10so1540499iou.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Dec 2015 00:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=rMRAmGj4hJT6+lG8L2UTYPXqMNkPIDOoIFZauBPSXnk=;
	b=Jtd9aNdAFuzbyN2mnIM3qB+nA2dCBwIKM90A33ZLPXYBOJeSEzDOL3zJ4DJxbBSYE/
	WQFlo/n/yXAeGF4OovtRhmE7fBYivkuM/FPcpeSZ3ret7zG0lKpeFXp7o64FiJ+6NV7d
	FSBKj3PcbJOfJuBGPuxV53s7bHxZCSmNjyPStGX/e9rtr/GZ9sWh1dMiB0JTPOMeT3AG
	bWkNOc/j6vRqCefZ/aly1cCNtm8T3pAHq++h6Yq0fZXIuq1XhInv7uu5f3WsC6FSE1Qq
	1uvlS9uIwGifFcU9PBpOTFbW8F19KalXsCy2c/hmajR9FIcTf+hyGHe7UYdnZawJjNNc
	HTyQ==
X-Received: by 10.107.9.152 with SMTP id 24mr59463819ioj.112.1448957947292;
	Tue, 01 Dec 2015 00:19:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.12.205 with HTTP; Tue, 1 Dec 2015 00:18:37 -0800 (PST)
In-Reply-To: <1448556053-15960-1-git-send-email-dbaryshkov@gmail.com>
References: <1448556053-15960-1-git-send-email-dbaryshkov@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Dec 2015 00:18:37 -0800
Message-ID: <CAMKF1spwObPx-WH8v3XKKxDGVHjPOVn4FF5Dr7FZWZBWgPOrUQ@mail.gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gcc-5.2: import patch fixing compilation in thumb mode
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
X-List-Received-Date: Tue, 01 Dec 2015 08:19:07 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 26, 2015 at 8:40 AM, Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com> wrote:
> Import patch fixing a bug that caused ICE when compiling some packages
> (e.g. ICU) in Thumb-1 model.

This is ok

>
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-5.2.inc              |  1 +
>  .../gcc/gcc-5.2/0043-fix-arm-thumb.patch           | 39 ++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0043-fix-arm-thumb.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-5.2.inc b/meta/recipes-devtools/gcc/gcc-5.2.inc
> index a6b385a..e5e92e9 100644
> --- a/meta/recipes-devtools/gcc/gcc-5.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-5.2.inc
> @@ -74,6 +74,7 @@ SRC_URI = "\
>             file://0040-nativesdk-gcc-support.patch \
>             file://0041-handle-target-sysroot-multilib.patch \
>             file://0042-cxxflags-for-build.patch \
> +           file://0043-fix-arm-thumb.patch \
>            "
>
>  BACKPORTS = ""
> diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0043-fix-arm-thumb.patch b/meta/recipes-devtools/gcc/gcc-5.2/0043-fix-arm-thumb.patch
> new file mode 100644
> index 0000000..2f262e3
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-5.2/0043-fix-arm-thumb.patch
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

