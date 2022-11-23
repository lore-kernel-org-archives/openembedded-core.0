Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D62C4332F
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 05:15:02 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.13320.1669180495178510026
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 21:14:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=D3EgXpYz;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1669180495;
  x=1700716495;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=T36bnp+TnUjqUZtby62r3l3w544Db88K3nL37+8l27o=;
  b=D3EgXpYzs1C4nWQOx8JqsaTNZUwh2saVR0TLWrLAApKS5VKR+FZ5VVkN
   ILo+f1scMSQ2+FPqfGq7ypeObz5SwjdX7NMQEU0gFSXYOcl5ZGn3Jyyu6
   Tdjuw9CRZLD7NqBup6OmFzfUL41/keQOOLr8pK1b3ArxJxQGZi95jEk3o
   qTBGAGSImQ1URdKLGVf8KNhVpxtNYPblkO+XCQaSGOR9Ma6r/Q8nAn+uP
   QxEDzDBXk9axb4q1WDNFu/4Y5p1aF1Js0PvfW0SUIwqIucc1CRZ+SC3iO
   8LKFTLNNUBRPmb9W93piirHICaTLeYYz2lUvyX5A7W387fnSYQJFzVxQP
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"Alexander Kanavin" <alex.kanavin@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton
	<Ross.Burton@arm.com>, Khem Raj <raj.khem@gmail.com>, Markus Volk
	<f_l_k@t-online.de>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [oe-core][PATCH] python3: add ${bindir}/python symlink
Thread-Topic: [oe-core][PATCH] python3: add ${bindir}/python symlink
Thread-Index: AQHY/Qjw/89ZxQ3F3ka/MCHwFtGvqq5IYbGAgAAK04CAAQE0gIAAOx9sgACmF4CAANmBAIAABlKAgAAC04CAAAUVgIAAQhSAgAB/DQA=
Date: Wed, 23 Nov 2022 05:14:52 +0000
Message-ID: <f1d3154d376141a180cb92fd134b91b7@axis.com>
References: <CAMKF1spErHg3JX+DFRLcW4EthTGBMm4A24XsyAVOO3RNr6Wgfw@mail.gmail.com>
 <CANNYZj-UTuxW0-Rr7FhgjwE007Gr28Pc5ZCo=cnrDcaNsuZStw@mail.gmail.com>
 <CAMKF1srs_tmRRNqWQAmBKOkJkfysJt=OZjefq_mPd4htPGi6VA@mail.gmail.com>
 <1729A925BA1D06C8.25787@lists.openembedded.org>
 <CANNYZj-mhM6FzQY4Lv2BckodcLtPSUV29GG4TCUb_Tp003SAbw@mail.gmail.com>
 <HRFQLR.NFABK2KMZ9XR2@t-online.de>
 <4BF25A91-3F02-49A2-A546-A9CF7881E0ED@arm.com>
 <CANNYZj9uxKov0vrox7N3kv-HdQJ9VDbLu7Jsn_SuVUTz_Nbrzw@mail.gmail.com>
 <d945c2d89848932cd437ab8ae0a4f41a6f76ef19.camel@linuxfoundation.org>
 <CANNYZj9ukvo3YE5Aj+cCPUR-ut6ZCKyNK77TRk_bytsV2ArgwA@mail.gmail.com>
 <Y31NH+sqmDNMVZPl@mail.local>
In-Reply-To: <Y31NH+sqmDNMVZPl@mail.local>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 05:15:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173707

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Alexandre Belloni via
> lists.openembedded.org
> Sent: den 22 november 2022 23:29
> To: Alexander Kanavin <alex.kanavin@gmail.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>; Ross Burton
> <Ross.Burton@arm.com>; Khem Raj <raj.khem@gmail.com>; Markus Volk
> <f_l_k@t-online.de>; openembedded-core@lists.openembedded.org
> Subject: Re: [oe-core][PATCH] python3: add ${bindir}/python symlink
>=20
> On 22/11/2022 19:32:17+0100, Alexander Kanavin wrote:
> > On Tue, 22 Nov 2022 at 19:14, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > Rightly or wrongly, this patch will cause large amounts of pain for
> > > some portion of our userbase and I'm not sure we have enough
> > > justification to do that. That pain wouldn't likely be realised for
> > > some time either :/.
> >
> > I have to point out that meta-python2 hasn't even received a
> > compatibility update for langsdale:
> > https://git.openembedded.org/meta-python2
> >
> > While this might be 'too soon' to conclude that python2 is truly dead,
> > maybe a year (or two, or three) from now it won't be. Fedora has
> > already made the switch, Debian will follow, and honestly, I just
> > can't muster any sympathy for python2 users anymore. You can't push
> > back paying off technical debt forever and expect others to
> > accommodate you.
> >
> > Let me propose this: a PACKAGECONFIG for the python recipe that adds
> > and installs the symlink in a dedicated package. We can keep it off
> > for now, but somewhere down the line we could revisit that against
> > established practice and what PEPs say then.
> >
>=20
> I actually like the idea of having a python-is-python3 package so that
> affected recipes could simply add it to their dependencies. That would
> make it explicit that python is not python2.

Please not that in the Debian case, nothing depends on python-is-python3.=20
It is only provided so that users can manually install it if they have=20
a Python script not provided by Debian that requires it.

And note that Debian also provides a python-is-python2 package, and=20
obviously things would eventually fail if packages actually were to=20
depend on either as this would open up for conflicts.

Thus all Python scripts in packages provided by Debian are required to=20
explicitly specify either python2 or python3 on the shebang line.

> > Alex

//Peter


