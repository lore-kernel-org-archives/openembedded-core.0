Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id B645E75A52
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 20:21:29 +0000 (UTC)
Received: by wmww144 with SMTP id w144so2940580wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 12:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=UlcSl+We2Sn/dYNQhPq1mVhZcD6FbDxAZzNhmPUi/I4=;
	b=zI0naxPst1pCUIZCRV3mfcu/Nw98n/v8+hvzZw9QubjjeLZjj6+9CoG5KjV1utzKye
	XXAf+EBNhBGkFfCLSLYstbEwM0Ac6LfSbBOWJVewG0llzQW1y+xqPebXNuXsAgZwryVw
	BirRnA3BpdP50dOlI1N2iQ3asPa1wvEfTYitFaP44ZQZfLqySYxJd/3W+EQJCfSbFU+D
	4S4T3CufMxrTht5WF79pNc5PLHXvo9atCImFFDWmunj0AzDkdjW2awF8sj9GMsoxe82g
	esiRm7pDrwg11siN1aepvTy0wS30AjNYhoXrr+Bf49YWT/1UF9blHmKiDFIchtTT5hvS
	8DQQ==
MIME-Version: 1.0
X-Received: by 10.28.46.137 with SMTP id u131mr18971233wmu.61.1447359689084;
	Thu, 12 Nov 2015 12:21:29 -0800 (PST)
Received: by 10.194.140.38 with HTTP; Thu, 12 Nov 2015 12:21:29 -0800 (PST)
In-Reply-To: <20151112121048.GA13777@mcrowe.com>
References: <1446734821-6011-1-git-send-email-mac@mcrowe.com>
	<CAJ86T=WxqbJ83S4RESL_oKX9gYNg6-aAPGUYR3btSQBhKQo-1g@mail.gmail.com>
	<20151106103004.GA7454@mcrowe.com>
	<20151112121048.GA13777@mcrowe.com>
Date: Thu, 12 Nov 2015 12:21:29 -0800
Message-ID: <CAJ86T=XZ4meizhB1-m-2UhNoFAkTsq4M8VyBzbxs4QrSG2G_=g@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf, module.bbclass: Support opting out of legacy EXTRA_OEMAKE
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
X-List-Received-Date: Thu, 12 Nov 2015 20:21:33 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 12, 2015 at 4:10 AM, Mike Crowe <mac@mcrowe.com> wrote:
> On Friday 06 November 2015 at 10:30:04 +0000, Mike Crowe wrote:
>> It would be great to get to the point that EXTRA_OEMAKE is empty by default
>> but I imagine that the experts are already aware of the difficulties with
>> doing this which is why the current value has lasted so long.
>
> I had a go at this. Fewer recipes than I expected seem to be affected.
>
> With bitbake.conf containing EXTRA_OEMAKE = "", the following recipes
> needed to be changed to explicitly set EXTRA_OEMAKE = "-e MAKEFLAGS=":
>
>  meta/recipes-bsp/pciutils/pciutils_3.3.1.bb
>  meta/recipes-connectivity/openssl/openssl.inc
>  meta/recipes-core/busybox/busybox.inc

Busybox doesn't need make -e if you have my busybox cleanup patches
(posted to the list recently, but not merged to master or mut yet).

>  meta/recipes-devtools/perl/perl_5.22.0.bb
>
> for core-image-minimal to build successfully[1].
>
> I tried core-image-sato but got stuck when apr-util-native wouldn't compile
> for me[2], even with stock master.
>
> So, perhaps the situation isn't quite as bad as I feared and it might be
> possible to change the default value of EXTRA_OEMAKE.
>
> Mike.
>
> [1] I suspect that perl isn't required by core-image-minimal. That list is
>     my complete set of changes from trying to get core-image-sato to build.
>
> [2] x86_64-linux-libtool: compile: unable to infer tagged configuration
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

