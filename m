Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7CD156BC44
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 08:00:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44Zb3S4Zlpz3h;
	Thu,  4 Apr 2019 10:00:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1554364837;
	bh=9RVUiZ78Iwq/h8YBDwQ0QaQTN3lQ8Aeycb5TVvhExJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fcojGa67JqmpiaIIOZlwAU1bjkpp0LBRvrFL7MPV8u6sURebs5oumjPNv35uGatLj
	Qa2qmzAiz735qBSjpC6cocFndJi7KagvmJZPerUyUq5ZUAdI+ZsY/cNYY/ESTPIiyX
	CmWkO9Hmb406FFKDpUr5iLgQQuQQXizqRmxmvKRIdmV9fY/CMvt97lY2VfjxnsnL8n
	l7M91FtyS7KVpyk71pAOXZtfGGYzMWf//122mafYZnzadO54I0ODlarwm7hOwWF8nD
	nAU3wlqzG6C1XvKQXwHO9SOo74SLIlVvqtQP/ZVWTOJsdNXwQgldO9VIKFSpoG7HvY
	ZtvA1Y9Smzmxb2EULjhhhxs8TuOZgRcvHvCn0S3N4TPPytFLmZwrx5RTR2f23e5aie
	3O0gojqZH33I46n2bYCOim+k7bdsEJT3COXH9bdN6w5M1nkjsCnNdvXiDiqQ5iZwS6
	bsVYHW4WrnHLfucVKG94DmBSXyYNJMZM7BCDtJrROiVtLL4RtNrhmEVoN3jwj3X63z
	4JqxJW0uzgNX3Pxe9OFip/ucujK+UUp8to7FlIzjekkG4n14qY3C/QUMjh+6NqgzUD
	mY/ph4PXOfP42WtTMGIA76YridPYap2NMXT0IpmLU2fh63/nomHtNdFy7ccemHLpdl
	KCCEN1SpM6tU1yIQGBSZ4aoo=
Date: Thu, 4 Apr 2019 11:00:34 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20190404080034.GA13624@localhost>
References: <cover.1554233389.git.pkj@axis.com>
	<8694f4c6a289db1fe45c24bc1ee9139458e09521.camel@linuxfoundation.org>
	<20190403062249.GB1281@localhost>
	<CAJ86T=Wfp+1mrgWZCOG5VrhONADi08yZXd4Fm3L2Txb1euyUuA@mail.gmail.com>
	<20190403202448.GA7131@localhost>
	<CAJ86T=Xs2z7yTeF20NWT31KGGyzEtibxj3zJWKTBWUE_18btow@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=Xs2z7yTeF20NWT31KGGyzEtibxj3zJWKTBWUE_18btow@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] Correct and improve the ARM tunings
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
X-List-Received-Date: Thu, 04 Apr 2019 08:00:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Apr 03, 2019 at 01:48:04PM -0700, Andre McCurdy wrote:
>...
> If we let the user pass an arbitrary string to -march then we lose the
> ability to determine that (for example) it's safe for a
> "armv7athf-vfpv3" machine to pull from a "armv7athf-vfpv3d16" package
> feed.

For ARM <= v7 this is possible, except for bugs like the mentioned 
around thumb.

With ARMv8 you end up duplicating everything gcc knows about 
architecture and feature flags for a cpu, and about all the
interdependencies between features flags.

It will also have to tell whether a cpu contains the optional
support for the old ARMv7 32bit ABI, or only for the ILP32 variant
of the ARMv8 ABI.

> Whether or not anyone in the real world actually maintains a generic
> package feed and pulls from it from multiple machine specific builds
> (verses setting up separate package feeds for each DEFAULTTUNE they
> care about) would be an interesting question...

It would be good to look at what exactly has to be supported here,
and the complexity involved.

The simplest "generic" would be armv8.0 with no feature flags.

If a generic "is tune A a superset of tune B" is required,
you end up duplicating a lot of hardware information from gcc.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


