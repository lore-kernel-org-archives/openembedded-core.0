Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D34F57E8D2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 19:55:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45SzN15mV4z4h;
	Tue, 18 Jun 2019 21:55:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560887746;
	bh=7McKauaol0h1IfjJI63EoEO98A3MRjmvbWa+NFOznmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IvxU0k5ihHoYyyweCd8kIax9eNHP63+u+s5zEkD2dNuvwUXRt+ONiQCpuojcRXiSF
	KY878N7LU+GENIomlrG2rxKJL3wb4J0HuHeR8QwmDMKfF97EEfVrfsEysGhz+VG5NG
	hxWsF0dgr8idbS7PsWb+ixNBNbaMzB21vlwjMayRfKVu2f4fh0lIaYuO21/cY67Eoq
	AuH/fluJOnhkZ6/5FVvHLHRfPe4fLsavNvUfk0CWlaHvkuJxK3cetQG/wIxGO831Q2
	eBCH5D5cYDjjd7aiiUPN93RZp+14K9c8xHkjfh0xIHTgt35zWisI2Z81orACA316Ng
	HxC/83YM2nnkUQzQSYjFAvYQ0Dl6u/yJGVs7VyP+s/4V8g/LkFM0FZtW+ULYLGYa08
	8UZ4vpc2wCIzj8z/0CXHRfrQkul5/fIzaFJFWgco0WTiM3+EO6LCCRuAkzoXZYiFzi
	Fsrk+N7CsysYnx+fcyH3eemYgwTwGgdilfxq3mlJvtw3KXglLHsgZ8V2HpaZL0cRfZ
	HfOuslm+BG8hNjVoSljIc2Y4NvA1ORQiFcFJyxuCMKihvEfFoBKY/kdMOvz3Dviy+2
	/m1S5omsSkDAKQc9qj+WQ4hlMYa1wMXwvQGUAq3/BleHFipafbMG/UM3PpLTwMIY3I
	zLtIFA3EGoGEdWVOx4rs227k=
Date: Tue, 18 Jun 2019 22:55:42 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190618195542.GA28282@localhost>
References: <20190618061128.17422-1-bunk@stusta.de>
	<bb0334d27a1ec6cb25e6eb5b994a89c56f311c7d.camel@linuxfoundation.org>
	<37c9cc258cd2b9b257607a5bfa4d783496430e35.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <37c9cc258cd2b9b257607a5bfa4d783496430e35.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wireless-regdb: Add recipe
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
X-List-Received-Date: Tue, 18 Jun 2019 19:55:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Jun 18, 2019 at 02:22:31PM +0100, Richard Purdie wrote:
> On Tue, 2019-06-18 at 13:34 +0100, Richard Purdie wrote:
> > On Tue, 2019-06-18 at 09:11 +0300, Adrian Bunk wrote:
> > > Since wpa-supplicant is provided,
> > > the database of permitted frequencies should also be provided.
> > > 
> > > wireless-regdb-static should be used with kernel >= 4.15.
> > > wireless-regdb can be used with older kernels and is mostly
> > > irrelevant here, but keeping it in meta-networking would
> > > create needless recipe duplication.
> > > 
> > > This package was previously in meta-networking.
> > > 
> > > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > > ---
> > >  meta/conf/distro/include/maintainers.inc      |  1 +
> > >  .../packagegroups/packagegroup-base.bb        |  1 +
> > >  .../wireless-regdb_2019.06.03.bb              | 44
> > > +++++++++++++++++++
> > >  3 files changed, 46 insertions(+)
> > >  create mode 100644 meta/recipes-kernel/wireless-regdb/wireless-
> > > regdb_2019.06.03.bb
> > 
> > This seems to break deb rootfs construction:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/712
> 
> opkg as well:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/716
> 
> basically nothing provides wireless-regdb but wireless-regdb depends on
> it.

The root problem is that the empty wireless-regdb-dev exists at all,
I'll send a v2 removing it.

> Cheers,
> 
> Richard

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


