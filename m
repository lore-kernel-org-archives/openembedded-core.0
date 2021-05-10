Received: from esa9.hc324-48.eu.iphmx.com (esa9.hc324-48.eu.iphmx.com [207.54.69.27])
 by mx.groups.io with SMTP id smtpd.web11.31607.1620653644512481558
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 06:34:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=AwrFkn7k;
 spf=pass (domain: bmw.de, ip: 207.54.69.27, mailfrom: prvs=75725d379=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1620653644; x=1652189644;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=jfzh+tk3YV35SJhBoD1lbkQ7M9tkRa9Z9ONOCZ7gk6g=;
  b=AwrFkn7k4nSxiAW30N1QTSmNfuxh+lRkP8WsM1Z5j0y9alJ4BPEpBTi8
   5gsUn8NtfL2bD1riw8ztvavAOZ0XM1JXqbMBW5ECCugdrucDkn/YoCeZ5
   a7XSiPMe2dWlXNg19En80LJ7B63UCip1ArZTQfi7jjLFlKLnLPMsdkcLi
   o=;
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa9.hc324-48.eu.iphmx.com with ESMTP/TLS; 10 May 2021 15:34:02 +0200
Received: from esabb4.muc ([160.50.100.33])  by esagw2.muc with ESMTP/TLS;
 10 May 2021 15:34:01 +0200
Received: from smucm33k.bmwgroup.net (HELO smucm33k.europe.bmw.corp) ([160.46.167.67])
 by esabb4.muc with ESMTP/TLS; 10 May 2021 15:34:01 +0200
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33k.europe.bmw.corp
 (160.46.167.67) with Microsoft SMTP Server (TLS;
 Mon, 10 May 2021 15:34:01 +0200
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.015; Mon,
 10 May 2021 15:34:01 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <ml@embed.me.uk>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] rng-tools: disable the CPU affinity mask
Thread-Topic: [OE-core] [PATCH] rng-tools: disable the CPU affinity mask
Thread-Index: AQHXRUUAOpDviTbsd0iv49+h2ZESF6rcVyeAgAA7/ACAAAMQAA==
Date: Mon, 10 May 2021 13:34:01 +0000
Message-ID: <YJk2SH7uPrbP5ZbS@korppu>
References: <20210510023310.5516-1-mingli.yu@windriver.com>
 <5aa52a186119be3add2555d6dbc89f348699aae8.camel@linuxfoundation.org>
 <fac5bcb3-fa84-5b3d-20be-779b6b55781a@embed.me.uk>
In-Reply-To: <fac5bcb3-fa84-5b3d-20be-779b6b55781a@embed.me.uk>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <07C2BB2B25EDBE46A21662C4ECD246F7@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, May 10, 2021 at 02:23:02PM +0100, Jack Mitchell wrote:
> On 10/05/2021 10:48, Richard Purdie wrote:
> > On Mon, 2021-05-10 at 10:33 +0800, Yu, Mingli wrote:
> >> From: Mingli Yu <mingli.yu@windriver.com>
> >>
> >> For the jitter entropy source, each task thread will create an interna=
l
> >> counter timer thread when the system clock resolution is under 5MHz.
> >>
> >> But it will introduce high cpu usage for a long time and also make ran=
dom
> >> data generate too slow if sets the CPU affinity mask of the internal c=
ounter
> >> timer thread.
> >>
> >> There is no solution until now and the Upstream recommends to disable
> >> the internal timer and think Jitter RNG will not work due to the coars=
e
> >> timer. Check [1] and [2] for more details.
> >>
> >> So disable the CPU affinity mask as a workaround to avoid lots of cont=
ext
> >> switch and too high cpu load for a long time.
> >>
> >> [1] https://github.com/smuellerDD/jitterentropy-library/issues/37
> >> [2] https://github.com/nhorman/rng-tools/pull/123
> >>
> >> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >> ---
> >> =A0...tter.c-disable-the-CPU-affinity-mask.patch | 48 ++++++++++++++++=
+++
> >> =A0.../rng-tools/rng-tools_6.11.bb               |  1 +
> >> =A02 files changed, 49 insertions(+)
> >> =A0create mode 100644 meta/recipes-support/rng-tools/rng-tools/0001-rn=
gd_jitter.c-disable-the-CPU-affinity-mask.patch
> >=20
> > Thanks for investigating this upstream. From an OE-Core perspective, I'=
ve very
> > reluctant to take what looks like a very board specific change which th=
e upstream
> > is advising against. The issue is that this will affect all hardware, n=
ot just
> > the hardware which has the issue. I think we need to find a better solu=
tion.
> >=20
> > Cheers,
> >=20
> > Richard
> >=20
>=20
> FWIW I forcefully have to ensure nothing pulls in rng-tools in my builds
> which are for two different Rockchip chipsets (armv7 and armv8) as the
> rng-tools binary pegs the CPU at 100% for minutes after boot, every
> boot. It's particularly annoying as openssh brings it in by default
> which I've unsuccessfully argued is wrong before. I believe the problem
> is probably fairly widespread but just unnoticed.

Unfortunately this is better than not having ssh, TLS etc encrypted access
at all to/from the target HW since openssl and kernel refuse to proceed
due to lack of entropy.

If your HW has random number generators and driver support is in place,
then rng-tools isn't needed.

Cheers,

-Mikko=
