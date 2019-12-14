Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2BC336C4CE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Dec 2019 01:22:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47ZVCH1PM0z3D;
	Sat, 14 Dec 2019 02:22:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1576286571;
	bh=8Tf6NxDD/K+xDvhAUQQMcujd1tRmOSuWkuXqvr1jbnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DAsmUL7Lv9taHC3M0DXUxrA/+iSq2ZxSValE87P2xBld19IiVL0jRrFC1W2IhFCve
	FR7sfXMvTfhuWYmOQC0UUNBcCgbC56LXr2gKhe0PCLsP9SQBKj9iL5wEQWRYjGm7Oz
	eTZEK4GdfETVEqFe4+2iYQdrerNuuErQdmtFruwphE1YZRqep4NEn2NdD3qTKSrl1z
	G8qThCp7zcMdb2ZnQu9rubuWdjq2Gu2WVYlSxiPHtN7kKimPx8b23d9z4gLvk2Ty5V
	1M+3sV5omG9piIWDYXrHHmdNITdeAjDh6AgNkh7Pk4FCFCfXbcMjC5UwDGmh+/XuzD
	/zzRywGnVdmcO+mAoS8rM8csIIgJhJ6S2m0q9mx5z2s9jASProw2xXo6ohvVEsd6i4
	dYvgeMA7b1ADguBpPWlqWJp74XVWgCOxUAgv/k8rmLVpnEJhxEMe65dUbehY02DkIw
	HFJ+HQIIBytSUolR0cnOkVQiJ5u9XkgZ5ayYdFw0caWWB17o/uRgTKC66nQYKiWmu7
	qxMsq9Kl60nbl2rCnE1io8yFrNBtt/iZo68BwyhJ/wxDxaSiqJV+GnbcL7p8CwiWCK
	Jx0vh+8I2yFRjXMrGQySmfr6dAbq17loxHxPSil8+mrndZkkGAFCNh1JMfaiOCTw3/
	eTDGRRn4DdiIWXnJTYV3+2KA=
Date: Sat, 14 Dec 2019 03:22:49 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Joshua Watt <jpewhacker@gmail.com>
Message-ID: <20191214012249.GC8776@localhost>
References: <20191213220309.3964324-1-JPEWhacker@gmail.com>
	<20191213231042.GB8776@localhost>
	<CAJdd5GY4Ld9t1fo1sC2mK7nXuBCi=T39DwstZ5ZnTNFrEp226A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJdd5GY4Ld9t1fo1sC2mK7nXuBCi=T39DwstZ5ZnTNFrEp226A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tune-cortexa72-cortexa53: Add tune
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
X-List-Received-Date: Sat, 14 Dec 2019 01:22:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Dec 13, 2019 at 06:47:33PM -0600, Joshua Watt wrote:
> On Fri, Dec 13, 2019 at 5:10 PM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Fri, Dec 13, 2019 at 04:03:09PM -0600, Joshua Watt wrote:
> > > Adds a tune for Cortex-A72 Cortex-A53 big.LITTLE SoCs, e.g.  Rockchip
> > > RK3399
> > >...
> > > +TUNE_FEATURES_tune-cortexa72-cortexa53 = "${TUNE_FEATURES_tune-aarch64} cortexa72-cortexa53"
> > >...
> >
> > Looking at the gcc sources cortexa72-cortexa53 defaults to crc enabled,
> > so TUNE_FEATURES_tune-cortexa72-cortexa53 must contain crc.
> 
> I think that's armv8.1-a, the cortex A72 is only armv8-a (at least
> AFAICT), so I think crc would still be an optional feature.
>...

It is optional for armv8-a, but not for Cortex A53 or A72.

What matters in practice is that gcc automatically enables it for 
cortex-a72.cortex-a53, so the resulting code might not run on
armv8-a hardware without support for crc - things will break
if the tune features are not 100% aligned with whatever gcc
is doing.

cu
Adrian

