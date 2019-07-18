Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7FE937EEA1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 06:19:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45q3rk2DtSz4q;
	Thu, 18 Jul 2019 08:19:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563430791;
	bh=Km3xyrH+q9+bDf5Wrkgj9i2JDu4OFFUEyP7/3smdboQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pf1Fnzi7nXjg1OYU1m1zcV06wZwgcytgdUOVW+imFLDLa23AsRozaOTNQrKY6Inw8
	pvuZjQV5zng6f7ZnMyTfvDeC1STUIwXKmYSwnc3DWLdUDLBxHGSLpKaWma+rHe9gd4
	qyvWjYqTDey4StaDshOpwuOvt7wufG78ijAs58s537P/DQ4UzaFdg9w10wrCW914R2
	FZL9RPg/xVIDkDnMDcDPkK2/2HPkCXQbUjRW6Lvf4xjVFt1+/Rw/uYz9o/sCI2iHI3
	ee5r4wivH3rdQBpRowvLjPVs6SNXYsrmadvNtXD3q7q7KpyStNMRcAVhaOMtGAmNL2
	KZTLYlQLKhJpL7c3YI1IsgauX5f1vh9w/GAQR7nv5nnydBe4JbzT/4FK0K2clRN/TY
	IXqMKF8pAWJAr2PJXaHo20OGYFAiBkmMGZEEQuECM7TW1j2bfl8DQ2Cjh7hu/5+4cn
	07lMJyV7c9PWK3C+30Vzui96aUgpJbVIt0afnhP9pIGmYH7FJmxMxjrH16cNH65wfP
	iNiiIQmBR9uGW1c7V+DzzbvxTxQthFyA6pW421Dc3BhfmggUoGsZSfgQ/Qwbrla9Ob
	N1I48/lI3jsXpae8M3zBWVJQetNMHhEq2Kc20o9IN28pbdvYfQzzijcf+ojsnI1pG5
	6TBMLYqz9d5cKmIr5rSAnvWA=
Date: Thu, 18 Jul 2019 09:19:48 +0300
From: Adrian Bunk <bunk@stusta.de>
To: richard.purdie@linuxfoundation.org
Message-ID: <20190718061948.GB27459@localhost>
References: <20190716135444.12057-1-u.oelmann@pengutronix.de>
	<09978b11aded8890d37f2a64f7833f7a028e2577.camel@linuxfoundation.org>
	<6rlfwx2atq.fsf@pengutronix.de>
	<5fc8a130cfb17be80c146dec31ab5ffd71eea247.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <5fc8a130cfb17be80c146dec31ab5ffd71eea247.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org,
	=?utf-8?B?U8O4cmVu?= Andersen <san@skov.dk>
Subject: Re: [PATCH] squashfs-tools: upgrade to commit f95864afe883
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
X-List-Received-Date: Thu, 18 Jul 2019 06:19:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Jul 17, 2019 at 11:57:42AM +0100, richard.purdie@linuxfoundation.org wrote:
> On Wed, 2019-07-17 at 12:51 +0200, Ulrich Ölmann wrote:
> > Hi Richard,
> > 
> > On Wed, Jul 17 2019 at 11:19 +0200, Richard Purdie <
> > richard.purdie@linuxfoundation.org> wrote:
> > > On Tue, 2019-07-16 at 15:54 +0200, Ulrich Ölmann wrote:  
> > > > [...] 
> > > > -PACKAGECONFIG ??= "gzip xz lzo lz4 lzma xattr"
> > > > +PACKAGECONFIG ??= "gzip xz lzo lz4 lzma xattr zstd reproducible"
> > > > [...] 
> > > > +PACKAGECONFIG[zstd] = "ZSTD_SUPPORT=1,ZSTD_SUPPORT=0,zstd"
> > > > +PACKAGECONFIG[reproducible] =
> > > > "REPRODUCIBLE_DEFAULT=1,REPRODUCIBLE_DEFAULT=0,"
> > > 
> > > This fails in OE-Core since zstd isn't present and you've enabled
> > > that
> > > by default:
> > > 
> > > e.g.:
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/827
> > > 
> > > (but many other similar failures).
> > > 
> > > Adding the PACKAGECONFIG[zstd] is good, we just can't enable it by
> > > default.
> > 
> > see my reply to Adrian: what do you think of transplanting the zstd
> > recipe from meta-rauc to OE-core?
> 
> I think right now that zstd is not common enough to be something for
> oe-core. If multiple people reply and disagree I'm willing to reasses
> that but that's my feeling right now...

zstd not even being in meta-oe is a surprise that should be corrected.

btrfs-tools would be the only user that comes immediately into my mind,
but zstd support in the kernel btrfs driver is relatively new and not
yet widely used.

zstd has already gotten a lot of traction in the Open Source world,
but regarding adding it to oe-core right now one could argue either way.

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


