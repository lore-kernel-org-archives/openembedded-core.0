Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C421D7F8BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 22:34:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46XLf93Z1tz2J;
	Tue, 17 Sep 2019 00:34:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1568673297;
	bh=TwIjHLIDKJV5r+kJ4j9jZtQI0MBoHKgEzKVfjV2m3go=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KIwKwMRhNXeuikzuknxqsxzT1TXtNMC7mJVJfq36U0X+5NkQUaFD8ojUPR2jD1AOu
	ITowqi+Bv4Gni2lmyvt0ZsF0UHi/Gp3Ls8Bz0P/z2jPGizVZ/oongvLPsboGcr31wN
	PYjlcD+H1nc0zLulfQzcQCjayu/uzaNNZ1YgWTl9QF4BNAQ3b/V5h4jn/7vvanhi/I
	30FHWE7EqW7cDR3i2/18w46aYBQDsboKpNXAW6oEo9OvYqputeKVzYRnpa+tGWvsBR
	GZrH137/ZCghTlZqn7Dajebzn2HMe7JTqDIN73rC7DXiqtQzUSeCFUGn05APtmKjd4
	GLatZL4fU6lrlLwUUYVdgiZE8s3TvPtFQ1ZRk2K4krUgxtwYAwRqJl2s6kj0Rwn9Ci
	OJpWScP3P7qZFZBsDiDmlnm2taWzZnW15bzd6jblw1WAA2Cv7oVZxTrfKKX5+JMSxC
	Knhr0I3aEdnsTx8mrDm0qRVAbJR+B2euT9gzImhtis1VZSpCtgx7KI+BZicgiU6dfJ
	7tf+31u45dzm1HjHVDSpr/xwsTDKXLxcXpeCyhMYAcapXQ6aExuS8TGukh/ZWUInwg
	zWzY9etzHlv2gOVO/lbe3++GZ3RajeP9ESEyf5qTEEUHmYDzYJ4QM6Kdg0vYlvoHFn
	MEHvxpNvDz5UvJrRTHWE+ADw=
Date: Tue, 17 Sep 2019 01:34:54 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20190916223454.GA27980@localhost>
References: <20190916192429.27294-1-armccurdy@gmail.com>
	<20190916192429.27294-4-armccurdy@gmail.com>
	<0a559d39-3699-4504-addc-89fe7252fbea@Spark>
	<CAJ86T=UOKYMh-r1kmO2xjyu6aKDe1E3x8MVOd6J96qCfUNo_yA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=UOKYMh-r1kmO2xjyu6aKDe1E3x8MVOd6J96qCfUNo_yA@mail.gmail.com>
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
X-List-Received-Date: Mon, 16 Sep 2019 22:34:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Sep 16, 2019 at 03:08:01PM -0700, Andre McCurdy wrote:
> On Mon, Sep 16, 2019 at 2:33 PM Christopher Larson <kergoth@gmail.com> wrote:
> >
> > This seems like something that could do with a ‘why’ in the commit message and/or comments, to me.
> 
> To be consistent with:
> 
>   https://git.openembedded.org/openembedded-core/commit/?id=1a563214caf6bd5b3a026ebe953f8c692ebd640a
>...

libwebp sets -mfpu=neon when autodetecting,
is there a similar problem with ffmpeg?

> > +# Do not trust configure to determine if ARM vfp or neon are available.
> > +#
> > +EXTRA_OECONF_ARM = " \
> > + ${@bb.utils.contains('TUNE_FEATURES','vfp','--enable-vfp','--disable-vfp', d)} \
> > + ${@bb.utils.contains("TUNE_FEATURES",'neon','--enable-neon','--disable-neon',d)} \
>...

If we cannot trust the vfp autodetection, why can we trust that the 
autodetection of the vfp variant (vfpv2, vfpv3 or vfpv3-d16) and
the exact architecture (e.g. armv5te, armv6, armv6k or armv6t2)
are correct?

Which brings us back to the problem what the actual problem is (if any).

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


