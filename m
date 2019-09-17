Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7811B7F8E9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 08:16:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46XbXq3FgZz3S;
	Tue, 17 Sep 2019 10:16:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1568708171;
	bh=3vIOD1ezhjNzKDs5dqRShGcbeto4EPdtx5ga7WZLTvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a/0X3FRumhaMxrm68w/QbkwFJSZW1amuZsJJ7xNnHLeH5Dzbn1og3YLlYj+eZef2z
	jlv+EBJbj/xa2p1oQbS9Ki43CSMRnUSdNvoHRRVwMOLHpBRiJGRIK4nrtbnrWJgjvZ
	Zahzxbc8fyYc3PmS2HT5G9wennAKP/c95UOoggfS5Pa4Ns/i3O1bKMajR6aqXk4JkI
	q5Bd9ihwlRO+EE8gyB4+JhvFEsKZSZHcq2U1SWMVGjkKjNBWQPKSC3hKs9/1jFAV7Q
	6os5GAQyjzNs9D+JxexP3G0Fk4/I1/pjMICXlg9MD5HasUTwkrl+7m1x2tkuTWzMMd
	89H8VSYEAw5Jp2bG69wlN7+4pbjI8GxxC9QEXLaYUzoFcDAFoEhUJUwGQKft2tweub
	Ou3YzeZRSMZb52GSWGN3z/luPlqMhjC5gzVNp2raqwCn+1G+IYBofnjNenHrHncjuF
	pEcPqgddA1mj6SRYP3bzkPk+VywGac+a+JNRNMVly1NoPRpWESXBw2LPBlaMowUPeq
	7L1Ru1bcFeETUm72lCJLACQs0k7W/L3YYRQ24yIPlXqBzIeEVcRGgdlrhO0GBhnpma
	IqWUxOVrW0ln4YwcSiU1IKiIZmTRsS+6C4sVegb47iLfpK0xtmOA6M1Is3Xj3iPDrY
	lxL++F0oaxP/Ehpq2Uyfn+Ns=
Date: Tue, 17 Sep 2019 11:16:09 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20190917081609.GA11168@localhost>
References: <20190916192429.27294-1-armccurdy@gmail.com>
	<20190916192429.27294-4-armccurdy@gmail.com>
	<0a559d39-3699-4504-addc-89fe7252fbea@Spark>
	<CAJ86T=UOKYMh-r1kmO2xjyu6aKDe1E3x8MVOd6J96qCfUNo_yA@mail.gmail.com>
	<20190916223454.GA27980@localhost>
	<CAJ86T=WeoZJsHqTusGmi=M7Qb7MgW1o7UUM4aO7D8wjx8qZp=A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WeoZJsHqTusGmi=M7Qb7MgW1o7UUM4aO7D8wjx8qZp=A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] ffmpeg: don't rely on configure to correctly detect ARM vfp or neon
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
X-List-Received-Date: Tue, 17 Sep 2019 08:16:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Sep 16, 2019 at 03:43:42PM -0700, Andre McCurdy wrote:
> On Mon, Sep 16, 2019 at 3:34 PM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Mon, Sep 16, 2019 at 03:08:01PM -0700, Andre McCurdy wrote:
> > > On Mon, Sep 16, 2019 at 2:33 PM Christopher Larson <kergoth@gmail.com> wrote:
> > > >
> > > > This seems like something that could do with a ‘why’ in the commit message and/or comments, to me.
> > >
> > > To be consistent with:
> > >
> > >   https://git.openembedded.org/openembedded-core/commit/?id=1a563214caf6bd5b3a026ebe953f8c692ebd640a
> > >...
> >
> > libwebp sets -mfpu=neon when autodetecting,
> > is there a similar problem with ffmpeg?
> >
> > > > +# Do not trust configure to determine if ARM vfp or neon are available.
> > > > +#
> > > > +EXTRA_OECONF_ARM = " \
> > > > + ${@bb.utils.contains('TUNE_FEATURES','vfp','--enable-vfp','--disable-vfp', d)} \
> > > > + ${@bb.utils.contains("TUNE_FEATURES",'neon','--enable-neon','--disable-neon',d)} \
> > >...
> >
> > If we cannot trust the vfp autodetection, why can we trust that the
> > autodetection of the vfp variant (vfpv2, vfpv3 or vfpv3-d16) and
> > the exact architecture (e.g. armv5te, armv6, armv6k or armv6t2)
> > are correct?
> 
> In general we can't. However these are all corner cases which are
> rarely (if ever) tested.
> 
> For ffmpeg configuring with --enable-runtime-cpudetect (which I think
> we effectively do by default) probably hides a lot of the configure
> time misdetection too.
>...

Building with --disable-runtime-cpudetect for qemuarmv5 gives:

ARCH                      arm (armv5te)
big-endian                no
runtime cpu detection     no
ARMv5TE enabled           yes
ARMv6 enabled             yes
ARMv6T2 enabled           yes
VFP enabled               yes
NEON enabled              yes


These 4 misdetections are all affecting a certain range of CPUs,
ARMv6T2 misdetection should affect more CPUs than VFP misdetection.

There likely is a common root cause that should be fixed,
instead of manually specifying every autodetected feature.


cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


