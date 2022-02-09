Return-Path: <mikko.rapeli@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EEFDC433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 14:27:59 +0000 (UTC)
Received: from esa12.hc324-48.eu.iphmx.com (esa12.hc324-48.eu.iphmx.com
 [207.54.72.34])
 by mx.groups.io with SMTP id smtpd.web10.26945.1644416877702721587
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 06:27:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1
 header.b=kCiNSK0e;
 spf=pass (domain: bmw.de, ip: 207.54.72.34,
 mailfrom: prvs=03290f32f=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1644416877; x=1675952877;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=m08SMwqY6I2yjrRJGmxgBGYRWpFm+uUYocRK/5UjUsM=;
  b=kCiNSK0etMUTeXolB0TYC/Yt2dl5EO4hs/mklQ/I4+nznHZ6/HtKwCo1
   GBgtYgLn2z2GXaE94o0ZAkRKBfsD0Lf2xXMYd1tcuhyA9tnFj4rPM7IOm
   r3Su3twnTiYWSl+CRzyaHOttnrzEGGoVCGQUhL2RoDi4pmOjI5nK6gD1v
   A=;
IronPort-SDR: 
 ZMdKiMlqPK3VijP0SgXAioI8d3X1O6iLZvEcaCCXeznZR52Xzm9YY+UfltU9eebEM3VUJGjSrQ
 dRw8Qx33ueaPc/zyZhJS+cNEAiuUCrXQE1DJUeOfbc9g7TuFUx8hpD5pBAn5dYIWzNCSSsUOiR
 bzheop39I79oYhZi97ZgQEDGngX+Qp4Fu9l6HtodA7b0tkpI/u8a06eRhCabP/arJqpBfcK5rs
 oI83ic3lT9DJimwbCUkZaWfKI4XU+kd8R1c522M3vG2gjCCcbjmrb9nqXUEQYu6yACJ1kvBF6O
 36ScTQaerqdqdWRN4NZxW65/
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
 esa12.hc324-48.eu.iphmx.com with ESMTP/TLS; 09 Feb 2022 15:27:54 +0100
Received: from esabb5.muc ([160.50.100.47])  by esagw5.muc with ESMTP/TLS;
 09 Feb 2022 15:27:55 +0100
Received: from smucm33l.bmwgroup.net (HELO smucm33l.europe.bmw.corp)
 ([160.46.167.68])
 by esabb5.muc with ESMTP/TLS; 09 Feb 2022 15:27:55 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by
 smucm33l.europe.bmw.corp
 (160.46.167.68) with Microsoft SMTP Server (TLS;
 Wed, 9 Feb 2022 15:27:54 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.026; Wed,
 9 Feb 2022 15:27:54 +0100
From: <Mikko.Rapeli@bmw.de>
To: <richard.purdie@linuxfoundation.org>
CC: <sanakazisk19@gmail.com>, <openembedded-core@lists.openembedded.org>,
	<ranjitsinh.rathod@kpit.com>
Subject: Re: [OE-core] [poky][master][PATCHv2] buildhistory.bbclass: Enable
 exporting more recipe and package data
Thread-Topic: [OE-core] [poky][master][PATCHv2] buildhistory.bbclass: Enable
 exporting more recipe and package data
Thread-Index: AQHYHZe441HnQYeLLEqDuYqPBGkeZayLE8mAgAAR5wCAAAOIAIAADUeA
Date: Wed, 9 Feb 2022 14:27:54 +0000
Message-ID: <YgPPaRecZGTG2MF9@korppu>
References: <20220209092947.25677-1-sanakazisk19@gmail.com>
 <c2d76693b74d961e97ef38470dad1f60c425f889.camel@linuxfoundation.org>
 <YgPBUKU8qutnuI8I@korppu>
 <3909a8bd81a99f80cbcafa66b68c2601b4a2235e.camel@linuxfoundation.org>
In-Reply-To: 
 <3909a8bd81a99f80cbcafa66b68c2601b4a2235e.camel@linuxfoundation.org>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <B93C6BE72FE02043B2320BC3720B0B56@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 14:27:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161563

On Wed, Feb 09, 2022 at 01:40:22PM +0000, Richard Purdie wrote:
> On Wed, 2022-02-09 at 13:27 +0000, Mikko.Rapeli@bmw.de wrote:
> > Hi,
> >=20
> > On Wed, Feb 09, 2022 at 12:23:39PM +0000, Richard Purdie wrote:
> > > People have requested changes like this before and I rejected it as I=
'm worried
> > > that allowing people to customise this code will just fork the projec=
t into many
> > > different directions.=A0
> >=20
> > It's the other way round. There are a lot of needs to extract metadata =
from
> > build system into something where reports can be generated.
>=20
> I don't doubt that however buildhistory was written for a specific purpos=
e and
> if we start adding the ability to customise it heavily we lose the abilit=
y for
> comparisions to be made, or sstate reuse and so on.
>=20
> I'm partly channelling the original author's views on this since they had=
 some
> very specific thoughts on this change. I do sometimes wonder if I should
> continue doing that though :/.

Then how should yocto users export CVE_NAME, LICENSE, PN, PV, SRC_URI etc f=
rom
the build system to generate SW bill of materials (BOM) for their product
and track progress?

Yes, SPDX can be the other answer but I don't find that human readable or w=
orking
out of the box atm.

> >  I'd prefer this to be buildhistory as it also tracks progress across r=
eleases and=A0
> > versions and custom builds if the setup has been done correctly. If thi=
s change isn't=A0
> > going to be accepted, projects need to continue with their custom patch=
es on top of=A0
> > current buildhistory bbclass in poky.
> >=20
> > > The elif block above illustrates part of my concern since it still is=
n't scaling
> > > well and just potentially makes every buildhistory output difference =
(even with
> > > different ordering). There are reasons the data is taken from pkginfo=
 rather
> > > than getVar too and I think this could introduce subtle bugs in the f=
uture.
> >=20
> > The elif block is just for backwards compatibility. Changing the order =
of fields would
> > be annoying in buildhistory. The new ones will be in alphabetical order=
 so I don't
> > think this is so bad. It is possibly to completely rewrite and simplify=
 buildhistory
> > but this would be annoying for users who actually track the changes.
> >
> > > Which variables are you actually interested in when changing this?
> >=20
> > LICENSE, CVE_PRODUCT, SRC_URI, MAINTAINER and some project specific var=
iables too.
> > It is very useful to have these tracked in buildhistory git repo where =
differences
> > between releases can easily be seen.
>=20
> The trouble is this turns it into a "metadata difference" tool rather tha=
n a
> build output difference tool which is different to the design. It also ma=
kes it
> much harder to write the buildhistory analysis tool since all of a sudden=
 we're
> dealing with any variable rather than package specific ones and we can no=
 longer
> assume any particular output would be present (and it is no longer just b=
ased
> upon packagedata).

What tool or feature from yocto should we use then?

> I guess we can see what others think, but I am concerned about letting pe=
ople
> remove existing output from it too.

Well buildhistory can have defaults. It can be extended. I don't see your r=
easons
for limiting the output to a few variables which you care about.

I frequently debug issues by looking at buildhistory data about images, bin=
ary
packages and recipes. It is a very useful tool.

-Mikko=

