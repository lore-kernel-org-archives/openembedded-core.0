Return-Path: <mikko.rapeli@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A4FCC433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 08:00:38 +0000 (UTC)
Received: from esa8.hc324-48.eu.iphmx.com (esa8.hc324-48.eu.iphmx.com
 [207.54.65.242])
 by mx.groups.io with SMTP id smtpd.web10.8287.1645171233463070813
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 00:00:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1
 header.b=KGstVexC;
 spf=pass (domain: bmw.de, ip: 207.54.65.242,
 mailfrom: prvs=041686c5e=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1645171233; x=1676707233;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=fx/l9o/ICKpHLESGIdVMHudVDb947GyhuyDX7W7TeXI=;
  b=KGstVexC3tHogwnatO+WlNH8TsRnnrmHXa72ERBGJhkIdNFgPhHpWhJ8
   UVHKD8htA2ua1W+4dqaNAtSXrxl31dUeBtaedxOQc9ARM/B4is1tm+D+T
   RroK0B8qlJdJRwzlIfiz041sRS2U4bTT4AMhB5yYiHWmnkuz3CGyInjZ0
   k=;
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa8.hc324-48.eu.iphmx.com with ESMTP/TLS; 18 Feb 2022 09:00:30 +0100
Received: from esabb5.muc ([160.50.100.47])  by esagw2.muc with ESMTP/TLS;
 18 Feb 2022 09:00:30 +0100
Received: from smucm33j.bmwgroup.net (HELO smucm33j.europe.bmw.corp)
 ([160.46.167.66])
 by esabb5.muc with ESMTP/TLS; 18 Feb 2022 09:00:29 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by
 smucm33j.europe.bmw.corp
 (160.46.167.66) with Microsoft SMTP Server (TLS;
 Fri, 18 Feb 2022 09:00:29 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.026; Fri,
 18 Feb 2022 09:00:28 +0100
From: <Mikko.Rapeli@bmw.de>
To: <armccurdy@gmail.com>
CC: <Saul.Wold@windriver.com>,
	<openembedded-architecture@lists.openembedded.org>,
	<openembedded-core@lists.openembedded.org>,
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] [oe] INCOMPATIBLE_LICENSES and
 WHITELIST_<license> usage
Thread-Topic: [Openembedded-architecture] [oe] INCOMPATIBLE_LICENSES and
 WHITELIST_<license> usage
Thread-Index: AQHYJFJIMBbHPIrqo02bAwte8TOHNayYYSGAgACAowA=
Date: Fri, 18 Feb 2022 08:00:28 +0000
Message-ID: <Yg9SGkkOMwoPVcP1@korppu>
References: <7d187920-92f0-a0fe-22b9-a77a1c98fd7d@windriver.com>
 <CAJ86T=VF+6J3UBJ-=rYt=rODkdP=H73cWFXyE0YfJCaYJfb1oQ@mail.gmail.com>
In-Reply-To: 
 <CAJ86T=VF+6J3UBJ-=rYt=rODkdP=H73cWFXyE0YfJCaYJfb1oQ@mail.gmail.com>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9B5995C37EDFA94EA64FC26B23445C95@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 08:00:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161884

Hi,

On Thu, Feb 17, 2022 at 04:20:01PM -0800, Andre McCurdy wrote:
> On Thu, Feb 17, 2022 at 3:01 PM Saul Wold <Saul.Wold@windriver.com> wrote=
:
> >
> > Folks,
> >
> > I am working on a proposal to re-write how INCOMPATIBLE_LICENSES is use=
d
> > and processed to possibly include a COMPATIBLE_LICENSES variable as
> > well, see PeterK's email [0]
> >
> > I am trying to determine the usage of WHITELIST_<license> which would b=
e
> > used to override a license that might be listed in INCOMPATIBLE_LICENSE=
S
> > variable.
> >
> > Randy and I have done a quick and dirty survey of a 100 or so layers
> > (thanks Randy) and could not find any real usage other than what's
> > currently in OE-Core for WHITELIST_GPL-3.0.
> >
> > If you are using WHITELIST_<license>, please let me reply with your usa=
ge.
>=20
> Common case seems to be allowing gdb in debug builds of distros which
> are otherwise free of GPLv3 etc, e.g.
>=20
>   https://github.com/MentorEmbedded/meta-mentor/blob/master/meta-mel/conf=
/distro/include/gdbserver-gplv3.inc
>   https://github.com/lgirdk/meta-mng/blob/ofw-2112.6/conf/distro/mng.conf

Exactly, I'm using this in a lot of projects.

Basically distro config has:

INCOMPATIBLE_LICENSE_append +=3D " GPLv3 GPLv3+ LGPLv3 LGPLv3+"

and then various GPLv3 tools are allowed in build but not allowed to be
part of images:

WHITELIST_GPL-3.0 +=3D "binutils"
PACKAGE_EXCLUDE +=3D "binutils-dbg binutils-staticdev binutils-dev binutils=
-doc binutils-locale libbfd binutils"

WHITELIST_GPL-3.0 +=3D "gdb"
PACKAGE_EXCLUDE +=3D "gdb-sdktests-dbg gdb-sdktests gdbserver gdb-dbg gdb-s=
taticdev gdb-dev gdb-doc gdb-locale gdb"

WHITELIST_GPL-3.0 +=3D "rsync"
PACKAGE_EXCLUDE +=3D "rsync-dbg rsync-staticdev rsync-dev rsync-doc rsync-l=
ocale rsync"

etc etc.

Use case is that developers can install additional GPLv3 licensed tooling i=
f they
need to debug something, but product images don't include them by default.

Cheers,

-Mikko=

