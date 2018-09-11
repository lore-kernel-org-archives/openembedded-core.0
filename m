Return-Path: <nathan@nathanrossi.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 314C7797B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 11:34:46 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id j7-v6so27805070qtp.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 04:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=E4thj+NRsmMoNOeyTRH9izmw1evMBGQ6vlzhKDsXMas=;
	b=cltiwKS9o6Xp9xVxQOG4cyLnp4VcBGurcZ/Nb2pPg/oNr5iYTA8YQIYe95b/QzlATC
	ojTfnvsPiA2In3NzpDg3pzpFcm5a1zWDVwXMqBAMhzH088TiJN4DQls6mKhxWxBugoD9
	LYGyV7H3e0lMC3L0RFZ1HlBhFp1U66KfUKemTcIzfEE1hpzbrup1TGBAiKQRTHqUjaKb
	lj02FJW70lTCPzfLN2SrY0CD6RJ2NQMLGPOCe0NiPTnNoq7s96tvMu+2LjrzpqerJRyf
	+rHjnY88aN/5qXmc37JpdQurzgeb0R42uUGyA8W1gcSISwbvp619SA/CEceZrx8/4CX9
	iG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=E4thj+NRsmMoNOeyTRH9izmw1evMBGQ6vlzhKDsXMas=;
	b=myupJ3AC4VdsRNxbbz2PAvN7EY7DE7JObDM9F5xdorDwzZzT8CCzjsAJuhrkFtM9pD
	Akt3LKWJp34APT120qOekYvKHrQMOWN1qgPuOuU3a6RTJEm1RlN5Jm3/UPhw5Gf2liGr
	NNP1dUu+xapBf45X6X1/Klqx3cyVL68udEdSXg9e0LuxHJI8QhffzJhegKmhkIrR4knr
	UL8KlsS5mni8lIlStDQZ0BwXyKjuTCfOWJ8f9r5/9F/c6yAgJuwl1L+BYuBczgkTZY+G
	Spm7ZhhstcReD9D+e3BH857O0dVdFXzAKZ9j0DwDFnVUi5dvwHpjldyFDz2Z+ueCNXuZ
	K9Eg==
X-Gm-Message-State: APzg51BrHb5IciX7PvLM2+qTTeh6Skitg9zfRH3s3Jg5goYMtZxWRmkE
	elFvJJ/OEINxOQNiKI2giVkkbY2nq6WlQIYCuYTVuw==
X-Google-Smtp-Source: ANB0VdbdSRdYmiU47L5XrNK5d+9ySrV7T2piqQUKbjRfEiK5wm4R2k9ZWQRoXFYTi4phtPFl206ii92TFNt8V5SZads=
X-Received: by 2002:ac8:350f:: with SMTP id
	y15-v6mr19703996qtb.241.1536665686953; 
	Tue, 11 Sep 2018 04:34:46 -0700 (PDT)
MIME-Version: 1.0
References: <20180911111359.18053-1-lucaceresoli77@gmail.com>
In-Reply-To: <20180911111359.18053-1-lucaceresoli77@gmail.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Tue, 11 Sep 2018 21:34:35 +1000
Message-ID: <CA+aJhH0+DQMGmfh35L=BQ0_tK7Mv-oQ9eFJ5YnvwW4wawupJMQ@mail.gmail.com>
To: lucaceresoli77@gmail.com
Cc: luca@lucaceresoli.net, openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH RESEND] devicetree.bbclass: don't pad DT overlays
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
X-List-Received-Date: Tue, 11 Sep 2018 11:34:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Sep 2018 at 21:14, <lucaceresoli77@gmail.com> wrote:
>
> From: Luca Ceresoli <luca@lucaceresoli.net>
>
> By default the devicetree class adds padding to the generated .dtb
> files, which can be needed by the bootloader. However it also pads
> .dtbo files, which is not useful.
>
> Don't apply padding to the overlay devicetrees.
>
> To achieve this:
>
>  * move "-p ${DT_PADDING_SIZE}" to a new variable, DTB_BFLAGS (B for
>    "base")
>  * add "-p 0" to DTC_OFLAGS to disable padding for overlays
>
> Cc: Nathan Rossi <nathan@nathanrossi.com>
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

You shouldn't put "[meta-oe]" in the subject for oe-core/meta patches.
But otherwise the change looks good.

Reviewed-by: Nathan Rossi <nathan@nathanrossi.com>

Regards,
Nathan

> ---
>
> Resending from a gmail account due to ongoing issues between my
> provider and lists.openembedded.org.
>
> ---
>  meta/classes/devicetree.bbclass | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/devicetree.bbclass b/meta/classes/devicetree.bbclass
> index dbc83f2a1d98..8fe5a5ed795c 100644
> --- a/meta/classes/devicetree.bbclass
> +++ b/meta/classes/devicetree.bbclass
> @@ -55,9 +55,10 @@ DT_RESERVED_MAP ??= "8"
>  DT_BOOT_CPU[doc] = "The boot cpu, defaults to 0"
>  DT_BOOT_CPU ??= "0"
>
> -DTC_FLAGS ?= "-R ${DT_RESERVED_MAP} -p ${DT_PADDING_SIZE} -b ${DT_BOOT_CPU}"
> +DTC_FLAGS ?= "-R ${DT_RESERVED_MAP} -b ${DT_BOOT_CPU}"
>  DTC_PPFLAGS ?= "-nostdinc -undef -D__DTS__ -x assembler-with-cpp"
> -DTC_OFLAGS ?= "-@ -H epapr"
> +DTC_BFLAGS ?= "-p ${DT_PADDING_SIZE}"
> +DTC_OFLAGS ?= "-p 0 -@ -H epapr"
>
>  python () {
>      if d.getVar("KERNEL_INCLUDE"):
> @@ -106,6 +107,8 @@ def devicetree_compile(dtspath, includes, d):
>      dtcargs = ["dtc"] + (d.getVar("DTC_FLAGS") or "").split()
>      if isoverlay:
>          dtcargs += (d.getVar("DTC_OFLAGS") or "").split()
> +    else:
> +        dtcargs += (d.getVar("DTC_BFLAGS") or "").split()
>      for i in includes:
>          dtcargs += ["-i", i]
>      dtcargs += ["-o", "{0}.{1}".format(dtname, "dtbo" if isoverlay else "dtb")]
> --
> 2.17.1
>

