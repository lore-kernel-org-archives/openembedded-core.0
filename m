Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f46.google.com (mail-oa0-f46.google.com
	[209.85.219.46])
	by mail.openembedded.org (Postfix) with ESMTP id AE30C6AF5A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Aug 2013 22:32:50 +0000 (UTC)
Received: by mail-oa0-f46.google.com with SMTP id l10so4857790oag.33
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Aug 2013 15:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=AkNAhB1pojH5cWj1ttPkEi6FTPoadd/lXiMhwcBx0r0=;
	b=FE/6wMgkPOXv8JcRa24LxpuMOK9YA4Vh1aVuxkrufnPHclNfpJIJLeSAx5B+T+992i
	hjMZNFBiCwOkSMvSO1O8DaLw+mmRgmzpbra+CXlTL69I1kMAoTEgWeVNChsvmR1qgbtL
	BPzwAkpfAgtBDvl9W2kR0DAmLkskYfa0PSBUhu8IwuNnfsNhB97ErZl2kRarEoeKdcgt
	dSdUG40S/8NLed2uRZTQRM7qYvj2J1KYezJAQ+mWIxaL9JbzWlRo0HuDkaZkM5/5PCEF
	pEXSm4qC58WANDriwnrK0tPWaNY1w1jVvywCD/pK+sD/6cjWe5BDlzgZoiuN+OLE23CJ
	XTWg==
MIME-Version: 1.0
X-Received: by 10.60.43.226 with SMTP id z2mr12487984oel.76.1375655570981;
	Sun, 04 Aug 2013 15:32:50 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Sun, 4 Aug 2013 15:32:50 -0700 (PDT)
In-Reply-To: <1375655116-10659-1-git-send-email-otavio@ossystems.com.br>
References: <1375655116-10659-1-git-send-email-otavio@ossystems.com.br>
Date: Sun, 4 Aug 2013 19:32:50 -0300
X-Google-Sender-Auth: tz8SUickFQyy9SC5SwQgcjpLRCQ
Message-ID: <CAP9ODKpVGTi0v0ojRugaa1U33c5jT1RLV_YJi5DGMtWC8oXcyg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Evan Kotara <evan.kotara@freescale.com>,
	Lauren Post <lauren.post@freescale.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Daiane Angolini <daiane.angolini@freescale.com>
Subject: Re: [RFC PATCH] uboot-config.bbclass: Allow choose of U-Boot config for machine
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
X-List-Received-Date: Sun, 04 Aug 2013 22:32:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Aug 4, 2013 at 7:25 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> Some machines provide several possible configurations and until now
> there was no easy way for user to override the default setting.
>
> This class provides a system similar to PACKAGECONFIG but for
> U-Boot. The format is:
>
> UBOOT_CONFIG ??= <default>
> UBOOT_CONFIG[foo] = "config,images"
>
> There are two possible parameters:
>
>  - config: it is used to set UBOOT_MACHINE
>  - images: it is used to append onto IMAGE_FSTYPES
>
> Below there's an usage example:
>
> ,----[ i.MX6Q SABRE AUTO based example ]
> | UBOOT_CONFIG ??= "sd"
> | UBOOT_CONFIG[sd] = "mx6qsabreauto_config,sdcard"
> | UBOOT_CONFIG[eimnor] = "mx6qsabreauto_eimnor_config"
> | UBOOT_CONFIG[nand] = "mx6qsabreauto_nand_config,ubifs"
> | UBOOT_CONFIG[spinor] = "mx6qsabreauto_spinor_config"
> `----
>
> User can, from local.conf or environment, use UBOOT_CONFIG=nand and
> override the default setting, as:
>
> ,----[ Override example from command line ]
> | MACHINE=imx6qsabreauto UBOOT_CONFIG=nand bitbake core-image-base
> `----
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

This patch is to bring the discussion about the problem I am trying to
solve. Currently we'd need several duplicated machines to allow this
kind of setup.

Do people agree with this approach?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

