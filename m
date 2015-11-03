Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id A77C960124
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Nov 2015 23:29:23 +0000 (UTC)
Received: by igpw7 with SMTP id w7so92360816igp.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Nov 2015 15:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=CXb36sNgb8ZYOp+TINVzmMLBwOoG58wRImm8HiBS8+c=;
	b=IcMpQOTiPIx8WbVDSf+eyO+EMJHkHIwEF5rWUQ4d1Ovaf4nlR4jdi6oJv3Sm6ku+n2
	2mydfbGLL+2vHeBn4tQ/N2j6IbP9+8tW/pnNAzRyzRtTcjEgzs0LXDqsW9rYkTMV3XKN
	mlB1qzxnfTwQ+mUN+E+bOVi58C1+QrVISmRC1I+xxUl6UaEczoJqHDH6Uf9jt7tpP8Ng
	ZctQM98tBpYkBzG6ae1fuEtxmy2y6/DG4vjgZg/WAcbQqbw6HteslCSKJws4F365BCG/
	xHrAbX7MK2d8Ai9eTzgWVwxQzhYN5ft7KOShT9/07nONWNXu3MK/HUyODTAye07S+ghl
	Yywg==
X-Received: by 10.50.156.103 with SMTP id wd7mr18052137igb.75.1446593362597;
	Tue, 03 Nov 2015 15:29:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.38.133 with HTTP; Tue, 3 Nov 2015 15:28:53 -0800 (PST)
In-Reply-To: <1446589273-23317-2-git-send-email-mark.hatle@windriver.com>
References: <1446589273-23317-1-git-send-email-mark.hatle@windriver.com>
	<1446589273-23317-2-git-send-email-mark.hatle@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Nov 2015 15:28:53 -0800
Message-ID: <CAMKF1soDd-GpSYetT-mv-PeXiwS3iwtA8=MyD8ntutiD+f84ow@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] binutils: Fix XLP / Octeon 3 instruction clash
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
X-List-Received-Date: Tue, 03 Nov 2015 23:29:27 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 3, 2015 at 2:21 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> Use the value 0x00000080 for INSN_XLP, as the value 0x00000040 has already
> been assigned to INSN_OCTEON3 by the binutils project.
>
> Without this change, invalid instructions can be generated for both INSN_XLP
> and INSN_OCTEON3.
>

this is ok. is octeon3 sent upstream yet ?

> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  .../binutils/binutils/0012-Add-XLP-instructions-support.patch     | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/binutils/binutils/0012-Add-XLP-instructions-support.patch b/meta/recipes-devtools/binutils/binutils/0012-Add-XLP-instructions-support.patch
> index c56ff91..ecc37cc 100644
> --- a/meta/recipes-devtools/binutils/binutils/0012-Add-XLP-instructions-support.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0012-Add-XLP-instructions-support.patch
> @@ -31,6 +31,12 @@ Netlogic. Also, update vendor name to NLM wherever applicable.
>  Upstream-Status: Pending
>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Use 0x00000080 for INSN_XLP, the value 0x00000040 has already been assigned
> +to INSN_OCTEON3
> +
> +Signed-off-by: Baoshan Pang <baoshan.pang@windriver.com>
> +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>  ---
>   bfd/aoutx.h           |  1 +
>   bfd/archures.c        |  1 +
> @@ -251,7 +257,7 @@ index ef26167..ef53ec6 100644
>  +/* Netlogic Xlr instruction */
>  +#define INSN_XLR              0x00000020
>  +/* Netlogic XlP instruction */
> -+#define INSN_XLP              0x00000040
> ++#define INSN_XLP              0x00000080
>
>   /* DSP ASE */
>   #define ASE_DSP                       0x00000001
> --
> 1.9.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

