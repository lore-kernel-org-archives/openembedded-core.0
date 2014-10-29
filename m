Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id E37E365D3C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 03:41:40 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id hl2so1428600igb.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Oct 2014 20:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=lPjImBTfntchgzxXQHtZdET//pexaVHwPhwjzFg4/FY=;
	b=DwBhJ3ByqpoZO3+NtdEUubGB44ldVQaB5ulfBYI12haCfUf2tBCK6GGbqfjHwk205K
	wybOjNRlaTBNoqSK91DHPco/NDxPsS0KVR9n/+57pm6cHsqp+CybAqnexc/lnR8iPgjN
	CnuDIXiOb2Zkp2ucHG1CC2XZQzK6UNUGEL0Mw+L5GBhU7skroDg876OmZqwRvyuXDsu9
	e/wA3Fp+9hr9iVbmIqygX9eUXLJG5JVLCJKu/ZlW2v0HiUuBApppn71LgfHKkORqkRG2
	RpdqOSl3HmmBENX5h3gyejQGFH/lQC91lPBEF5bMVmwsi67E4GHWNh452fBy3P1oax6b
	VCEw==
X-Received: by 10.107.171.66 with SMTP id u63mr8436885ioe.35.1414554100503;
	Tue, 28 Oct 2014 20:41:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.169.2 with HTTP; Tue, 28 Oct 2014 20:41:09 -0700 (PDT)
In-Reply-To: <1414550044-1427-1-git-send-email-jackie.huang@windriver.com>
References: <1414550044-1427-1-git-send-email-jackie.huang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Oct 2014 20:41:09 -0700
Message-ID: <CAMKF1sqH9mGSoXaZkbSBy0rpFoDDHp2UhaFW-G53ogx3VueHEg@mail.gmail.com>
To: jhuang0 <jackie.huang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: fix ICE in dwarf2out_var_location
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
X-List-Received-Date: Wed, 29 Oct 2014 03:41:41 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 28, 2014 at 7:34 PM,  <jackie.huang@windriver.com> wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> Fixed the ICE:
> internal compiler error: in dwarf2out_var_location, at dwarf2out.c:21261
>

this looks ok. but we need the test case too. and a nit more documentation

> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-4.9.inc              |  1 +
>  .../0058-gcc-ice-dwarf2out_var_location.patch      | 31 ++++++++++++++++++++++
>  2 files changed, 32 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0058-gcc-ice-dwarf2out_var_location.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
> index 9a66cd2..89c405a 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.9.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
> @@ -71,6 +71,7 @@ SRC_URI = "\
>      file://0054-gcc-Makefile.in-fix-parallel-building-failure.patch \
>      file://0055-PR-rtl-optimization-61801.patch \
>      file://0056-top-level-reorder_gcc-bug-61144.patch \
> +    file://0058-gcc-ice-dwarf2out_var_location.patch \
>  "
>  SRC_URI[md5sum] = "fddf71348546af523353bd43d34919c1"
>  SRC_URI[sha256sum] = "d334781a124ada6f38e63b545e2a3b8c2183049515a1abab6d513f109f1d717e"
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0058-gcc-ice-dwarf2out_var_location.patch b/meta/recipes-devtools/gcc/gcc-4.9/0058-gcc-ice-dwarf2out_var_location.patch
> new file mode 100644
> index 0000000..28e7756
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.9/0058-gcc-ice-dwarf2out_var_location.patch
> @@ -0,0 +1,31 @@
> +From d358f8ba2e530850795adce19bd00b57139d9397 Mon Sep 17 00:00:00 2001
> +From: Baoshan Pang <baoshan.pang@windriver.com>
> +Date: Tue, 16 Sep 2014 13:32:13 -0700
> +Subject: [PATCH] Fix ICE in dwarf2out_var_location
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Baoshan Pang <baoshan.pang@windriver.com>
> +---
> + gcc/dwarf2out.c |    5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/gcc/dwarf2out.c b/gcc/dwarf2out.c
> +index 1df565b..0e1557d 100644
> +--- a/gcc/dwarf2out.c
> ++++ b/gcc/dwarf2out.c
> +@@ -21255,6 +21255,11 @@ dwarf2out_var_location (rtx loc_note)
> +       ca_loc->call_arg_loc_note = loc_note;
> +       ca_loc->next = NULL;
> +       ca_loc->label = last_label;
> ++      while(prev && !CALL_P(prev) && !(GET_CODE (PATTERN (prev)) == SEQUENCE
> ++                                     && CALL_P (XVECEXP (PATTERN (prev), 0, 0)))){
> ++      gcc_assert(NONJUMP_INSN_P (prev));
> ++      prev = prev_real_insn (prev);
> ++      }
> +       gcc_assert (prev
> +                 && (CALL_P (prev)
> +                     || (NONJUMP_INSN_P (prev)
> +--
> +1.7.9.5
> +
> --
> 2.0.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

