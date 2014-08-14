Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 15AFE60B05
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 05:32:32 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id l13so12517559iga.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 22:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=sPz6iVyXyVVMfUKwZMHGXyLd4L080FqeE/LO4z4cs94=;
	b=NQyueL3dTWw5Y2UeUCXJrYRXyyBcQ4ofo3KmW1XP787a3g1+jTWe+uU23T/OIqwuKh
	3jB3QbgA8cYJ0L3p2kFibwfxB5QkQc+zlinu2On82gfa11MxvaEZlZ8eKORr2jepxUhH
	vJ5/kHD/ZWpvUtaIBfjG+oP1kQ7R2DFYAbq+Vo4PFMCk5v93hzQNTtTBV1H07tzLqTxZ
	+MKnq8d2CPkNRgHzJijMkEgveV27Uq8BthHQYtMmWDoiyhqwXgGHcRdSnmoutwZI05Ez
	F2sX2O71ebPtvtSufIa25zCEsDvk0mw74JAeZKQNAd6j2fqtqKAWMnLD776QMrXnm+oT
	pd4A==
X-Received: by 10.50.176.202 with SMTP id ck10mr55677788igc.2.1407994352265;
	Wed, 13 Aug 2014 22:32:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.126.103 with HTTP; Wed, 13 Aug 2014 22:32:02 -0700 (PDT)
In-Reply-To: <53EC16FC.8020109@pabigot.com>
References: <53E9134F.7040108@pabigot.com>
	<CAMKF1soHVxmjWW=TBqjh1P0ddPuMkxtmxXdnbLCSMLgQm2=hcQ@mail.gmail.com>
	<53EBD76A.3010401@pabigot.com> <53EBDA75.4040101@pabigot.com>
	<CAMKF1soioSe+U1CkB+PDsZyfDyaEFovugjOr+Tw+rGNjK57cJg@mail.gmail.com>
	<53EBF375.1070701@pabigot.com>
	<CAMKF1srUa9tUqu7bNXZ0g=yCa0e8E2K5XrzTHUUxB6BbTwYZ6g@mail.gmail.com>
	<53EC16FC.8020109@pabigot.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Aug 2014 22:32:02 -0700
Message-ID: <CAMKF1srPpoob-sxfv_OF-5po41tAFZNaparZJ2WOrzMTjB=n2g@mail.gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Yocto development with C++11 threads and gcc
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
X-List-Received-Date: Thu, 14 Aug 2014 05:32:40 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 13, 2014 at 6:55 PM, Peter A. Bigot <pab@pabigot.com> wrote:
>> EXTRA_OECONF += '${@bb.utils.contains("TUNE_FEATURES", "armv7a",
>> "--with-cpu=generic-armv7-a", "", d)}'
>>
>
> Sorry a typo there you   need  --with-arch
>
>
> OK, that works. So do we need to do the same thing for every TUNE_FEATURES
> element that ends up changing the value of -march= in TUNE_CCARGS which ends
> up getting passed into gcc-runtime?

Not really but arm v6+ is an exception here due to reasons explained
earlier. gcc as a target package is a bit
different than rest of them since it has mind of its own when it comes
to configuring it. It encodes certain
defaults into its driver etc. based on the configure parameters.
Ideally when we pass the flags via CFLAGS
it does it for most of packages but not for gcc.

>
> If so would it be better to add a TUNE_ARCH setting to all the tune-foo.inc
> files and use that in both TUNE_CCARGS and the --with-arch= flag passed to
> gcc?  Just to avoid having this stuff hidden inside gcc-target.inc where
> it's pretty obscure.

