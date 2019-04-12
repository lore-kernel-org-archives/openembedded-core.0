Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 738CC7D420
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 17:19:16 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id p14so9549457ljg.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 10:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KUGXQpHjVhSLlc2kCjeNGKqjwKJj+3DMHquF4oBoz00=;
	b=WbyJjjQzZAARuXsZy5XJU/DE9hXpvMtA0cYK+2H3IS3ku3a8pePMcv+O9Byn/J5PlW
	xwEVc7tzaPPF6A/NKQPtrykpl00RsuI3k8sFfGogHL2BeNG6pdd1/YCVtj+gZ/PbjrDm
	ijE97UVMMV4coZK1agcUuFymBYP7IfUatxjC90ulOuAN95tQ7T/KxMperrIGJXQzeWg5
	wPzMOc1Va256usJQLTEY4rzSQ4zL5ivjIlgNutny7QCL9VZhaRkiYeoVV5Kna8xEZXca
	DWyU0pCnSE1lruRE+fVTN8HqsG4cNVB3czx5h7E3FhO+c99Q2A1Hu2UVsOlzaaU96XPF
	kzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KUGXQpHjVhSLlc2kCjeNGKqjwKJj+3DMHquF4oBoz00=;
	b=TQejNDKVg4/RKl/65XWfIlx55g8e1utN16GI+HwHp+LaZz5Rcn6rBykHu2ZJQroW8o
	r6Vf9ZR2vwvZPkVAft3MfO4aae3yCYR+RNW79N88VHqmLGpXlx//3+BHaFVuneTQbF3+
	4CNAt+Gge9WCtA6pGVl8aV0etzNp1ylTz64rbQRKXgZkn9QQo+4ArVfVNfDS/fTROQmp
	wpI2hcsG3ZGrMsm8GyPBJwUuhA9xx7LtuexIwpRyxJIQ9U5ipk33BQDoDyRAPWJ3V8W4
	a75UMPN/YZsuT674rvh8AP2n+0dN3/1eZ4d0KreiEfyOwuyGGUtdBYq1e7kpKWviOBpj
	/2+w==
X-Gm-Message-State: APjAAAXKZeFX7Om52xu1nJi6Jxn2t+A5iZNYtzImgx8QR/Fs2W6vtT6y
	AOFBTYCMuWTJa4iVpWBxiWz3OoexR7ylJlZ95Ts=
X-Google-Smtp-Source: APXvYqz173ZvrNjefiSz9Jdd26bVU5laI/ib8DnvOlxP8UL53HVWjAODMGnRJ6Z/ru3BeudCzKuMGqHbZw/sDOFjFn4=
X-Received: by 2002:a2e:89c8:: with SMTP id c8mr31029991ljk.73.1555089557040; 
	Fri, 12 Apr 2019 10:19:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190412054625.9447-1-mike@foundries.io>
In-Reply-To: <20190412054625.9447-1-mike@foundries.io>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Apr 2019 10:17:41 -0700
Message-ID: <CAKmqyKPW93Z5ovf3kLe3VteXNEr0Z45YUNShakwcCN7bJvnG9Q@mail.gmail.com>
To: Michael Scott <mike@foundries.io>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-fitimage: support RISC-V
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
X-List-Received-Date: Fri, 12 Apr 2019 17:19:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 11, 2019 at 10:46 PM Michael Scott <mike@foundries.io> wrote:
>
> Support RISC-V kernel image, using the "Image" target.
>
> This change allows RISC-V support for fitImage via the following
> flow: OpenSBI -> u-boot (as payload) -> Linux kernel (as fitImage
> with ramdisk and dtb).
>
> This was tested using QEMU RISC-V 64-bit.

Do you mind sharing how you tested this? I would be interested in
trying this as well.

Alistair

>
> Signed-off-by: Michael Scott <mike@foundries.io>
> ---
>  meta/classes/kernel-fitimage.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 2517d75746..2820ff9689 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -10,6 +10,8 @@ python __anonymous () {
>          uarch = d.getVar("UBOOT_ARCH")
>          if uarch == "arm64":
>              replacementtype = "Image"
> +        elif uarch == "riscv":
> +            replacementtype = "Image"
>          elif uarch == "mips":
>              replacementtype = "vmlinuz.bin"
>          elif uarch == "x86":
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

