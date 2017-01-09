Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7C01B71AE4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 18:48:29 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id 96so44312973uaq.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2017 10:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=r+9tAdMov/+rUjAOmwQMnOUVnjt2P5/QeGdMc+hSyF0=;
	b=Dl+ZM5W4TU7E5ua2NL3WbfOpZoeqXzQV5FSsBtB3Aap2LTLStMUTpalKGnHDOM00mN
	9s1J4hb/sofRkhdBV5kf6+wx3K179sCvzeqVh1dCeKrRFPd85giQgMQ6+JMlBhS3E6Gg
	Q3osZy+EUAFn5m3v6KnZ5HKBiAExCtHdxCUb0+Tg4km5BPW8xqRnmfyyZjNOV2XDGGGf
	YC6uJszRrovm/n41d+F/w2M77V29bUI6Di+nCTlbcUMFlNWHVoc+CwD5G0KCLQtDJ1Po
	euhkMSVB68xcChisWwB1lQE/LaR2wiJGkLBAF5oP+NIFgl4+RmLOd9CfNFkbxYVTQG+o
	u7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=r+9tAdMov/+rUjAOmwQMnOUVnjt2P5/QeGdMc+hSyF0=;
	b=HT221W5c8S1XxsVGj6VAQx62MQDYiiU1QQ2qhOjw65C1mijMng5EY6Nt2jVCaKnCkc
	aBjIjxkd/lDPTG8JoxyQkRCYRQe5XjrupHvp3+7K76UiGYq2riPhVz8/3HXM09luP+pe
	qTVn3+XtlNloSqEqlfJhAxg/tchTf2htqqRfHirpoB/xEJNuHj3diqDbKPoB/sgUl4cV
	AQd8WigHIfyISvq2yApKcBjuQpXOC82w2TE5+C6iDmEkdoehSRjCNsDL0NwN5dVapE3o
	Sdo9UXq4eR6blVGnRsdG82hpXoDcq8SaAJXJSmSwBoztxWaXKtalPQsMc2KzXPeXWZId
	pfWA==
X-Gm-Message-State: AIkVDXLCvNJ341AzrwF9mQcQWa/4s7aKs5Ol6Ww5pAb7nWI2iVVnTbHOsELmEqYWMJm4dMB5hrjv1aS4BMoYSQ==
X-Received: by 10.176.0.197 with SMTP id 63mr61058882uaj.32.1483987710214;
	Mon, 09 Jan 2017 10:48:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Mon, 9 Jan 2017 10:47:59 -0800 (PST)
In-Reply-To: <8494f0f17ad63777d29ddec1eb1c553dd83da01d.1483696378.git.patrick.ohly@intel.com>
References: <cover.1483696378.git.patrick.ohly@intel.com>
	<8494f0f17ad63777d29ddec1eb1c553dd83da01d.1483696378.git.patrick.ohly@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Jan 2017 10:47:59 -0800
Message-ID: <CAMKF1srmDwvmPHzv9HzYnQneLQxxNDFd_jK1LLU3=x7bO_MAaw@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] gcc-source.inc: cleanly disable do_rm_work
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
X-List-Received-Date: Mon, 09 Jan 2017 18:48:30 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 6, 2017 at 1:55 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> Using "deltask" assumes that do_rm_work has been added already, which
> won't be the case anymore in the upcoming improved rm_work.bbclass,
> because then an anonymous python method will add do_rm_work.
>
> Setting RM_WORK_EXCLUDE works with the current and upcoming
> rm_work.bbclass and is the API that is meant to be used for excluding
> recipes from cleaning, so use that.
> ---
>  meta/recipes-devtools/gcc/gcc-source.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-source.inc b/meta/recipes-devtools/gcc/gcc-source.inc
> index 49bde92..0d0edb5 100644
> --- a/meta/recipes-devtools/gcc/gcc-source.inc
> +++ b/meta/recipes-devtools/gcc/gcc-source.inc
> @@ -3,7 +3,7 @@ deltask do_compile
>  deltask do_install
>  deltask do_populate_sysroot
>  deltask do_populate_lic
> -deltask do_rm_work
> +RM_WORK_EXCLUDE += "${PN}"

seems ok

>
>  inherit nopackages
>
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

