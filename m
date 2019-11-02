Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 263F07F841
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Nov 2019 21:10:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 475BY96cbKz44;
	Sat,  2 Nov 2019 22:10:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572729038;
	bh=z3IJrblyr7Z2aht6NVG01CDmo+2K9Vk2Yt8Ld/UHJto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hd0+YAyjpf01r558wBjXUX8JU2j9pRGdjlrnWzCblsJwxkWa0FrAH3tH4PtPIw0sy
	L52wC+pbNsjY64GiyMBG7IOdqGBnsNh2yLtrnuyXunxApPY2Ms4LNSnOxhrB8k/y/h
	bq3XgtGehi42PWaa6iL7Cw6UssB8HuaYP3ESHOpltosr0SuXoB47pXAhFCBI/5J095
	hfKXlLzVJ3U8FFCaV651FIUOacOd6BzQ0V/cI8nQNj5eOXuqrL7K1KseiLxUCb9hVp
	WfIJX+kK2SifEyV4rJ531YoBC8hwKAGx5/lR/FwBitpqcrN09xICOoLmJ5+Gs1kYFz
	u/pESmj4BEewxRP0G1k300TNDhwFtx03GeRDq2yEhcP73mgKeXBWZ3XIGapkf0PFeD
	pi7ngxwQo5SEgg3ezzM8xN0glCJz5glStKNW8EKdrEVXL8oVmfj6Z7Y9JGJwzwhPjd
	9gBfo9SxqleT7Or0VXRDy/CujCXHfnCkXMM4e0tP5DhRFODU/bVH67ikzORWH6uQkh
	DFnyuBqFu4cvMr49UyqznHRbYUpe6I3DPee9uVMHkruZj+0spiYDiao4Hl7bYjxW8u
	qwHMHxoWyNGokXoiEAzuRC/XTnD6dPSdLRzR1qh3xslO/7giPmkCDwZZ8gQKf7W3Vr
	48OKws6uR75XdK8cKsHy9+r4=
Date: Sat, 2 Nov 2019 23:10:30 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20191102211030.GA9897@localhost>
References: <20191101184638.31898-1-ruslan.bilovol@gmail.com>
	<20191101201225.GA1826@localhost>
	<CANNYZj_qZedAe6dm-7=Lj1kfv1z_NHEfrfXQPVDH3yxTQBbNzA@mail.gmail.com>
	<20191102153021.GA31590@localhost>
	<CANNYZj9aCEVwuPqvk=Uz4Jabjwtueo6fd=ksY24PmmK8FvT8aw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj9aCEVwuPqvk=Uz4Jabjwtueo6fd=ksY24PmmK8FvT8aw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] [PATCH] Provide users with project support status
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
X-List-Received-Date: Sat, 02 Nov 2019 21:10:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Nov 02, 2019 at 04:54:37PM +0100, Alexander Kanavin wrote:
> On Sat, 2 Nov 2019 at 16:30, Adrian Bunk <bunk@stusta.de> wrote:
> 
> > The easiest way to get long-term security support in such a situation
> > is often to take the required parts from the BSP layer, and use them
> > to build the product on top of Ubuntu LTS (or Debian).
> 
> There is an alternative: engineer the product in such a way that it can be
> updated from one Yocto release to a newer Yocto release.
> This is what I will be pushing for where I work (Daimler).

This is surely desirable but it can only reduce the pain when upgrading,
not make upgrading painless.

Don't let anyone use the gpsd client libraries directly or use the gpsd
functionality to send data over the network - these often bring breaking
changes in new Yocto versions.

"async" becoming a keyword in Python 3.7 broke plenty existing code and
similar breakages might happen in the future, so Python cannot be made
available in such a product.

Do not use glibc in your product, it can happen that some obscure 
cornercase was made more standards-compliant - and one of your
users was relying on exactly the old behaviour.

These are just some of the real-life examples I have seen in the
past 12 months, and these are only cases of intentional upstream
changes - there is also some amount of regressions that are just bugs.

> > The core question should really be how to increase the time of upstream
> > support that is usually left when a Yocto-based distibution reaches the
> > user, not just how to tell users that they are screwed.
> 
> I'd say information about YP support windows should be more widely known,
> both because it is useful in itself, and because maybe the users will talk
> with their company management and with the project, and figure out 
> ways to improve the situation.

What is actually the minimum investment for that?

Six digit sums are small change for companies like Daimler,
but that's a huge amount of money for all the small companies
with a two digit number of employees making embedded products
that just happen to use Yocto.

Yocto lacks a setup where small companies could contribute with
four digit amounts to shared efforts like 5 years of LTS support.

Otherwise the only improvement available is often "don't use Yocto".

> Alex

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


