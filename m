Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4805360589
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Dec 2015 21:34:33 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id ph11so170191096igc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Dec 2015 13:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=jxqGeo0GF3/Sl4vvIg6b97aizLphhvHGu3xQsAL4Rmc=;
	b=tuAVUtk06mk6FHaGPHc9Thse+cwC+M7uGTlirMACZGUfysvF1pMjBWYUJ6MshsVEdq
	N1Vmdg/OppzLFah9p8jTfGHgKdgExx4n7CZjiL1+BM/S+E6I7s/CeXWSr5cqMI3IYWNa
	2a6b9eCCbPu34z47JG9lI+3pHp9f+1LqMIE+HwE9jjgDdv1kwnx8H3SDw034k3gDZgtO
	r/jjuxFO1+1lsmOAtUn992PfMxrH32VJjfZ3T5H4dXMEQrFmmkd4RA5I7uKiHTYCVlSZ
	e6lTIFYzSZi19wZle0rl+GDI4uwBlhLrNjt9OQS7co9arACFmG0MBJgyUleud8Saja2l
	rVPA==
X-Received: by 10.50.155.65 with SMTP id vu1mr60521397igb.11.1451424874566;
	Tue, 29 Dec 2015 13:34:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Tue, 29 Dec 2015 13:34:05 -0800 (PST)
In-Reply-To: <CABcZANmh8C2WDd_=zvZBPuFPvDX8w_tT5u0=Da_RTbSOs8__7A@mail.gmail.com>
References: <CAH=96PH06f+uQqNVed2Tz_z1rNB3-nLO8xgxecq9SmOU4rK=vw@mail.gmail.com>
	<CABcZANmh8C2WDd_=zvZBPuFPvDX8w_tT5u0=Da_RTbSOs8__7A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Dec 2015 13:34:05 -0800
Message-ID: <CAMKF1sp=iZKkSQwHGep7TUCXTnCu-w6SOV8wTxoiK6z_Em0Ojw@mail.gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Multiple recipes sharing the same source
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
X-List-Received-Date: Tue, 29 Dec 2015 21:34:35 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 29, 2015 at 12:40 PM, Christopher Larson
<clarson@kergoth.com> wrote:
>
> On Tue, Dec 29, 2015 at 1:30 PM, Logan Buchy <logan.buchy@gmail.com> wrote:
>>
>> I've got a third-party SDK given to me by our SoC provider.  The SDK
>> contains
>> * Vanilla Linux kernel with a set of patches that adds drivers for SoC
>> peripherals
>> * Proprietary bootloader
>> * Proprietary binary libraries
>> * Proprietary firmware for on-chip peripherals
>> * A build system which compiles everything
>>
>> This SDK comes a a big tarball.  Splitting the tarball into separate
>> tarballs is not desirable since this would need to be done every time the
>> provider issues an update (which comes as another big tarball).
>>
>> What I have now is a recipe that compiles and installs the entire SDK,
>> which works alright but I am looking to split up the SDK into separate
>> packages with associated do_configure/do_compile/do_install tasks.  For
>> example, I would like to split this into packages that provide:
>> * virtual/kernel
>> * proprietary-binary-blob
>> * soc-kernel-drivers
>> * proprietary-firmware-blob
>>
>> What I am wondering about is how would I go about writing multiple recipes
>> that share the same tarball without having bitbake untar it for each recipe.
>> Is this even possible?  Are there any examples of packages that do this?
>>
>> My best guess about how to go about this would be to create a class which
>> defines a do_fetch/do_unpack routine and then for each package, inherit the
>> class and define custom do_configure/do_compile/do_install routines.
>
>
> See the gcc-source recipe and gcc-shared-source.inc.

This comes with one restriction though. All recipes should be able to
work with same sources. in other words
there cant be package/recipe specific patches any more

> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

