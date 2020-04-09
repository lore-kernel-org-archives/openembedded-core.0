Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.4594.1586417751959378309
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 00:35:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eBQ2BG+O;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id j4so3011265qkc.11
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2020 00:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=4oMATjf7xuJdx2xVaeUmIFNyfKV8C5pRdzJQIWpwVtE=;
        b=eBQ2BG+ONthtAFJXjToLYTjFK/RFen9TN5Dtge8oLUrdxGBfP7py9y0/NxVHWeSOQr
         i88ZPrVtsKoEaOVKjDyp7xsu/4ci0l1T70dRX4XkdDk+tcgwX1BpQfxG8W0RvSa+FrmV
         4/70gtmBwFE92WlKYoBfaTSH3kmGK5dF7kuewzjYkQHzfGIvj8WCYtdPX+z3kTSERPb3
         2PNz8Xazhu82jgE+ttkYapLpRzgiVuUEtSQKV7nfbVDc2C2M+flehDHddnZckSRS3kJN
         prd3PPmArV/CwsMTdeY8a61fstTMEhFV3EbAtQB44dvBT6Q6KdfIdbhynurhkE8+Lrn0
         luPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=4oMATjf7xuJdx2xVaeUmIFNyfKV8C5pRdzJQIWpwVtE=;
        b=J14C0rKGqrJqfVjgOXjcfDbd088L3z2IBC9rrpCt5+E8eNFSnYIfy4skm+B2h4uwr2
         GDP3X/EC6DZ+R8zxes3GdlPBfZAvN1+mB0V8SrLkzskNAp4vmIrmWyQyvjBHJKUSmWiQ
         C0udGuTOn5OT+aYpDorjj4Z5GLmghslLoeH5aJ5sdUhGsMzjcSJhUSCZi5yPzfXUAhJS
         inYfWFN8H4snNUU1Zv9hrI87jxETDUsOB1FDJYg9cuux/CjGIFssjp/mN+XXr4RUG9T9
         sP/6RsXeP3Da4JfgPQSx6HjeJoLwvuMMQfBFUoEeACgAoSvneuqnEQo7LtAVA1dvwfcA
         9f0g==
X-Gm-Message-State: AGi0PuZzaz15Dqy3q8nkB0dhcw8WVMipY6wszmANvWda1XQCNtJExgZo
	T5J/oW0h67HYsFCMcP9ZA2WztzCvZqvyI+0HDjCKBNk6DVA=
X-Google-Smtp-Source: APiQypL9tuErNkFJaxye6GHzPDn2IMk5JkxOeY+YUVVDtlhpfGkIrfMwba/CDU2gsmSMmzW3tOPtIjNhP6ZjvtJJTIM=
X-Received: by 2002:a37:8d81:: with SMTP id p123mr10808262qkd.17.1586417750806;
 Thu, 09 Apr 2020 00:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200409010853.3775270-1-raj.khem@gmail.com>
In-Reply-To: <20200409010853.3775270-1-raj.khem@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 9 Apr 2020 00:35:24 -0700
Message-ID: <CAMKF1sqiPae5iSzW-Acw1D-wO_Y2Fp0WEOYS==qS5DkPDFwHuA@mail.gmail.com>
Subject: Re: [PATCH] multilib: Enable multilib headers for musl
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I just realized that this patch is not enough for multilib to work on
musl, we also need to make sure needed musl headers are also generated
using oe_multilib_header I can cook up a patch in a day or so.

On Wed, Apr 8, 2020 at 6:08 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> This is no longer needed as we can build multilibbed images with musl
> now
>
> [YOCTO #13122]
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/multilib_header.bbclass | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/meta/classes/multilib_header.bbclass b/meta/classes/multilib_header.bbclass
> index e03f5b13b2..48f231eed0 100644
> --- a/meta/classes/multilib_header.bbclass
> +++ b/meta/classes/multilib_header.bbclass
> @@ -6,13 +6,6 @@ inherit siteinfo
>  # all of the ABI variants for that given architecture.
>  #
>  oe_multilib_header() {
> -
> -       case ${HOST_OS} in
> -       *-musl*)
> -               return
> -               ;;
> -       *)
> -       esac
>          # For MIPS: "n32" is a special case, which needs to be
>          # distinct from both 64-bit and 32-bit.
>          case ${TARGET_ARCH} in
> --
> 2.26.0
>
