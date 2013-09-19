Return-Path: <hans.beckerus@gmail.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 26A3B610F7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 15:24:59 +0000 (UTC)
Received: by mail-ob0-f169.google.com with SMTP id wp4so10224872obc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 08:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=TlvSzhpAG2gOuiapEsUYLm/rOJ1A5+eSkXMwpIjmcjY=;
	b=uqsEO+JYknrqb/Adgd8/eIcv0wbgZO/6E1jPlDHJf12m08cAwUf/iR7UE/3D19sXmk
	u7J1cqCwvbkAc6LQewGanq5ICay3N3WOYOYJHR631OWkEcecUZJGO9BI3IMWDUITkDW1
	L7UiwFuWE3/GgxMJCkA+/D+rlOaDIl7/F6GWW09prhwh9HoYrAsx146FH92LDkjKjtUk
	ZlaeMfXBYl5a4PL2fbNHcoHVPhmcZwgNtK1B3gV73tTImGUp5Fm/smTnqikcVVHWSgUM
	0ODnEuEOBgQmFA8VPL/S+Qu49ujD0/PY3iuwdTwQyv90U0Z7PyT9n/osftjiRITxRlMD
	ka5w==
MIME-Version: 1.0
X-Received: by 10.60.62.101 with SMTP id x5mr1645857oer.24.1379604300302; Thu,
	19 Sep 2013 08:25:00 -0700 (PDT)
Received: by 10.182.44.8 with HTTP; Thu, 19 Sep 2013 08:25:00 -0700 (PDT)
In-Reply-To: <1379597321-5447-3-git-send-email-otavio@ossystems.com.br>
References: <1379597321-5447-1-git-send-email-otavio@ossystems.com.br>
	<1379597321-5447-3-git-send-email-otavio@ossystems.com.br>
Date: Thu, 19 Sep 2013 17:25:00 +0200
Message-ID: <CAFyqS9pDpKoNTk8dgJ5Xkbzmy8YXWX=PZEbbohhotuXr25MYmA@mail.gmail.com>
From: =?ISO-8859-1?Q?Hans_Beck=E9rus?= <hans.beckerus@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] uboot-config.bbclass: Handle UBOOT_MACHINE setting
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
X-List-Received-Date: Thu, 19 Sep 2013 15:25:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Sep 19, 2013 at 3:28 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> The class now consolidate the handle of UBOOT_MACHINE and UBOOT_CONFIG
> variables and handle possible mistakes done by user when using these
> variables.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/classes/uboot-config.bbclass | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.bbclass
> index 44b46ff..b81cc60 100644
> --- a/meta/classes/uboot-config.bbclass
> +++ b/meta/classes/uboot-config.bbclass
> @@ -1,14 +1,30 @@
> -# Allow easy override of U-Boot config for a machine
> +# Handle U-Boot config for a machine
>  #
>  # The format to specify it, in the machine, is:
>  #
>  # UBOOT_CONFIG ??= <default>
>  # UBOOT_CONFIG[foo] = "config,images"
>  #
> +# or
> +#
> +# UBOOT_MACHINE = "config"
> +#
>  # Copyright 2013 (C) O.S. Systems Software LTDA.
>
>  python () {
> +    ubootmachine = d.getVar("UBOOT_MACHINE", True)
>      ubootconfigflags = d.getVarFlags('UBOOT_CONFIG')
> +
> +    if not ubootmachine and not ubootconfigflags:
> +        PN = d.getVar("PN", True)
> +        FILE = os.path.basename(d.getVar("FILE", True))
> +        bb.debug(1, "To build %s, see %s for instructions on \
> +                 setting up your machine config" % (PN, FILE))
> +        raise bb.parse.SkipPackage("Either UBOOT_MACHINE or UBOOT_CONFIG are must be set in the %s machine configuration." % d.getVar("MACHINE", True))
> +
Minor grammar error;  UBOOT_CONFIG are must >  UBOOT_CONFIG must

> +    if ubootmachine and ubootconfigflags:
> +        raise bb.parse.SkipPackage("You cannot use UBOOT_MACHINE and UBOOT_CONFIG at same time.")
> +
Minor grammar error;  at same time -> at the same time

Thanks.
Hans

>      if not ubootconfigflags:
>          return
>
> --
> 1.8.4.rc3
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

