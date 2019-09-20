Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D0C1A7FA79
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 14:03:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46Zb5z6pttz4S;
	Fri, 20 Sep 2019 16:03:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1568988200;
	bh=EvV1afw06jZyWVDsL/HOiPn10umQ7snpQnyNtUKd6v0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OgAkhjydOSYpLbcMYxp42d8YQiEmQ/UZNWyhV8pFsDzCqDPtMpxMvQF4CwiQ8JxUj
	hps7HDGem4aXIvc4XY+kC2Podv644ftkXUA0io6NADY8KIIBXzKL//Lop3UBw8D8FR
	l1zS/72ySn3296CCna7x36yZmU1/il4FPwxM+BNp2u/SX8fjLiHFRFLUQtPTBfWkME
	+Ig+Fa8ac4NZ9spGrrBhZPaMKhFvwoFTCmwR1FxAnHC74kVKALySqmKZ9ij3Uff2Sw
	NGjdCURcm48q50NS5uZY1Ii/eHbyjRGlZ+K0+AqMvhbCbjIyYVomofWxbgnST/xMbJ
	hs/FNwcSKw23DfxLpdlddnerYGHy5VMNoMMcVZSFFz3mbHJ/PxV/NxQWFvqZBYHHUI
	3lD+yoljrstygwiU/HCFfu2YtD2fYDEbIj6/KZRG9P4GMDH5a66jeVIM5PWm5xlqAJ
	8VdeNCZW88OWpuIiOPC6SfwwKQ7BsRHPmMsql8uQ1zrAVyxNJcBk6N9EMB3zt9xFOO
	Fdo79C8Pc8AxLDS5yi+ZA3PPJkc4gaqpOAClSAbhMhuJf6AdR/k9zwZw8Xr/zmZr8H
	psMRkD03B63EcrppGfyBbuCqWmXUQncnHAl0xCNMdWMYEDPBqo6zHr+zIK8+Cb9seW
	/2HE/MLWVr5BWHhxgUt/Tr4Y=
Date: Fri, 20 Sep 2019 17:03:17 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Mikko.Rapeli@bmw.de
Message-ID: <20190920140317.GA10364@localhost>
References: <20190917184947.2244823-1-raj.khem@gmail.com>
	<CAHtQpK4svi46b06dzCfCX7R-i6uiooQ0hi0mmdcOuoY+Ccm+MQ@mail.gmail.com>
	<20190920133829.GW6154@hiutale>
MIME-Version: 1.0
In-Reply-To: <20190920133829.GW6154@hiutale>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssl: Enable os option for with-rand-seed as well
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
X-List-Received-Date: Fri, 20 Sep 2019 14:03:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Sep 20, 2019 at 01:38:29PM +0000, Mikko.Rapeli@bmw.de wrote:
> On Fri, Sep 20, 2019 at 03:13:44PM +0200, Andrey Zhizhikin wrote:
> > Hello Raj,
> > 
> > On Tue, Sep 17, 2019 at 8:50 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > with openSSL 1.1.1d we start seeing errors like
> > >
> > > Error Generating Key
> > > 139979727451584:error:2406C06E:random number generator:RAND_DRBG_instantiate:error retrieving entropy:../openssl-1.1.1d/crypto/rand/drbg_lib.c:342:
> > >
> > > when using openssl from openssl-native on build hosts, this is due to
> > > limiting the random seed to devrandom, to support older hosts, since the
> > > option allows to have a comma separated list of methods to try, we can
> > > try the default first and if that fails then fallback to devrandom, this
> > > will ensure that it keeps working with build systems which dont support
> > > getrandom()
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > Cc: Adrian Bunk <bunk@stusta.de>
> > > Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> > > ---
> > 
> > Just as a test report for this patch:
> > 
> > I've tested this patch on the HW (i.MX8M Mini EVK) and unfortunately
> > my sshd given up with a message: PRNG is not seeded
> 
> > Reverting commits (effectively rolling back to openssl 1.1.1c) made
> > sshd operable again.:
> > 53b5654d6e openssl: Enable os option for with-rand-seed as well
> > 2c6b9b918c openssl: Upgrade 1.1.1c -> 1.1.1d
> 
> Do you have rng-tools on the image? That helped me with the kernel random pool
> initialization for sshd in iMX8 and openssl 1.1.1x.
> 
> I don't see how 53b5654d6e could change this behavior for target openssl.
> 2c6b9b918c could change the behavior and would be suprise.
>...

OpenSSL is full of surprises...

CHANGES says:
    Linux kernels 4.8 and later, don't have a reliable way to detect 
    that /dev/urandom has been properly seeded, so a failure is raised 
    for this case (i.e. the getentropy(2) call has already failed).

It seems to be correct to give an error here, and lack of rng-tools 
and/or kernel support for the iMX8 RNG is something that should be
fixed by the user.

OTOH, this kind of changes make it hard to justify upgrading openssl
in stable branches.

> -Mikko

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


