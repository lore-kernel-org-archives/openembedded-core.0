Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f182.google.com (mail-yk0-f182.google.com
	[209.85.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id 26F3565D4F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 13:36:39 +0000 (UTC)
Received: by mail-yk0-f182.google.com with SMTP id 131so1261171ykp.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 05:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=AH6mKm5h0w5as8+PzRcOm73eYZyIGLLMzryyzW/TIGc=;
	b=jL5TkPNm8ixpU4C3e6IEIb2vC3gW+Cy5GkI9gpl1PnKkpljMeKA4B6zgt8sB5tHa5m
	EiJZTpRuOwmf73vG2osZsh20cJHOXFPWvNdivTeOuxGwxRzfFPTvAQBg9lVHLg0l5Od3
	yETXtK/rU76oD2YsDRFIMcNTyg4K3KatNWjfq8O3oLdkVfw92DsHg+m9Z3V/WRzuu7VZ
	tkw0JiWvswWXRUlavpVimy0c3tq+7t44gOwrnYS9KntlShL/Wwe0hCidVkzoGjYgf80H
	pTY9fTECvoQ3ltALNDRi+ghT6P9BN7T/vUBFejyoJVsSP8G1FApVwQg0PvQ6RaVdZZlY
	J8Wg==
MIME-Version: 1.0
X-Received: by 10.236.15.68 with SMTP id e44mr43519823yhe.37.1416490600054;
	Thu, 20 Nov 2014 05:36:40 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.8 with HTTP; Thu, 20 Nov 2014 05:36:39 -0800 (PST)
In-Reply-To: <1416477982-13153-1-git-send-email-B40290@freescale.com>
References: <1416477982-13153-1-git-send-email-B40290@freescale.com>
Date: Thu, 20 Nov 2014 11:36:39 -0200
X-Google-Sender-Auth: _gQr99pbIftRx2IfrbirmxZkCOg
Message-ID: <CAP9ODKpUiJkTNzn+vKH8X70eC_-4mQ2FAms5ATZT_v_xPy7hgw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chunrong Guo <B40290@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] uboot-config.bbclass: Allow multiple U-Boot config for machine
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
X-List-Received-Date: Thu, 20 Nov 2014 13:36:43 -0000
Content-Type: text/plain; charset=UTF-8

Hello Chunrong,

On Thu, Nov 20, 2014 at 8:06 AM, Chunrong Guo <B40290@freescale.com> wrote:
>      *This class provides a system similar to PACKAGECONFIG but for U-Boot.
>       The format is: UBOOT_CONFIG ??= <default> UBOOT_CONFIG[foo] = "config,images"
>       Below there's an usage example: ,----[ i.MX6Q SABRE AUTO based example ]
>      | UBOOT_CONFIG ??= "sd eimnor nand"
>      | UBOOT_CONFIG[sd] = "mx6qsabreauto_config,sdcard"
>      | UBOOT_CONFIG[eimnor] = "mx6qsabreauto_eimnor_config"
>      | UBOOT_CONFIG[nand] = "mx6qsabreauto_nand_config,ubifs"
>      | UBOOT_CONFIG[spinor] = "mx6qsabreauto_spinor_config"
>
> Signed-off-by: Chunrong Guo <B40290@freescale.com>

I would prefer if you explain what this patch "adds" on top of the
original class; the commit log is very close of the initial commit log
when I included the class on the OE-Core.

Maybe something in like as:

...
This adds support to build multiple U-Boot configs for a machine; this
is useful when we have support for different media boots which require
different U-Boot configuration (e.g: eMMC and NAND).
...

> ---
>  meta/classes/uboot-config.bbclass | 40 ++++++++++++++-------------------------
>  1 file changed, 14 insertions(+), 26 deletions(-)
>
> diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.bbclass
> index 8ac1b71..f02ca58 100644
> --- a/meta/classes/uboot-config.bbclass
> +++ b/meta/classes/uboot-config.bbclass
> @@ -31,31 +31,19 @@ python () {
>          return
>
>      ubootconfig = (d.getVar('UBOOT_CONFIG', True) or "").split()
> -    if len(ubootconfig) > 1:
> -        raise bb.parse.SkipPackage('You can only have a single default for UBOOT_CONFIG.')
> +    if len(ubootconfig) > 0:
> +        for config in ubootconfig:
> +            for f, v in ubootconfigflags.items():
> +                if f == 'defaultval':
> +                    continue
> +                if config == f:
> +                    flag =  f.split(' ')

This is new and I fail to see why you are using the split here.

> +                    items = v.split(',')
> +                    if items[0] and len(items) > 2:
> +                        raise bb.parse.SkipPackage('Only config,images can be specified!')
> +                    d.appendVar('UBOOT_MACHINE', ' ' + items[0])
> +                    d.appendVar('IMAGE_FSTYPES', ' ' + flag[0])

This should be items[1] as previous code or you will break backward
compatibility.

> +                    break
>      elif len(ubootconfig) == 0:
> -        raise bb.parse.SkipPackage('You must set a default in UBOOT_CONFIG.')
> -    ubootconfig = ubootconfig[0]
> -
> -    for f, v in ubootconfigflags.items():
> -        if f == 'defaultval':
> -            continue
> -
> -        items = v.split(',')
> -        if items[0] and len(items) > 2:
> -            raise bb.parse.SkipPackage('Only config,images can be specified!')
> -
> -        if ubootconfig == f:
> -            bb.debug(1, "Setting UBOOT_MACHINE to %s." % items[0])
> -            d.setVar('UBOOT_MACHINE', items[0])
> -
> -            # IMAGE_FSTYPES appending
> -            if len(items) > 1 and items[1]:
> -                bb.debug(1, "Appending '%s' to IMAGE_FSTYPES." % items[1])
> -                d.appendVar('IMAGE_FSTYPES', ' ' + items[1])
> -
> -            # Go out as we found a match!
> -            break
> -    else:
> -        raise bb.parse.SkipPackage("UBOOT_CONFIG %s is not supported" % ubootconfig)
> +       raise bb.parse.SkipPackage('You must set a default in UBOOT_CONFIG.')
>  }
> --
> 1.9.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

