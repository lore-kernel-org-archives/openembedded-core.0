Return-Path: <mikko.rapeli@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B3F1C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 13:35:08 +0000 (UTC)
Received: from esa7.hc324-48.eu.iphmx.com (esa7.hc324-48.eu.iphmx.com
 [207.54.71.126])
 by mx.groups.io with SMTP id smtpd.web12.11099.1644327306699179251
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 05:35:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1
 header.b=qig+2oe7;
 spf=pass (domain: bmw.de, ip: 207.54.71.126,
 mailfrom: prvs=031a76740=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1644327306; x=1675863306;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=k17z5P2hCCvOe/8q3EBFUiAlu9fIgex5jc0aXIhH/m0=;
  b=qig+2oe7QAfadZ2Oy3RaUnudtNsY/eCJncu9JQpOpvQWIiTiuSBKhZTg
   ClU/cFNLdfsSZ0IzZ4aJ6PxipfA7HjdLBrtmMgQ2fAyd76YWjb/MiW/WU
   wG9Llylbx+0GpKUAR92hD9OEEqeAafUaWfa7jwI9FWp226c/acHYxq4yy
   0=;
IronPort-SDR: 
 bdIgMQmtaxb9LmnC1c/M77oHUIxmkriC7rTNn7RcSSdw3A4LIROuSt2jbgodb8YU8oHs6u2XwJ
 K51BvBebyvZyHzUuRBnd/Y4t3bJVzeJccMssjiDtOeUagpHx0uc+3H0BgHSkL1HeedVMYYxqER
 9uSFucZ2zdCzbPE3v3PA+N9rFOXrGuN23GEguel0AOAWtpleOFhv/VBp89XlLHV/k0QB4oJa/P
 MBPofwezQIibxdASEVsT8v7fAdnqlJBgJLGS67wAhzHlgi03nxjSR+QBhP/RudldD5k9JgCPAZ
 Pwy/rNpYPDXFvvm68HIKFrCe
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa7.hc324-48.eu.iphmx.com with ESMTP/TLS; 08 Feb 2022 14:35:03 +0100
Received: from esabb2.muc ([160.50.100.34])  by esagw6.muc with ESMTP/TLS;
 08 Feb 2022 14:35:02 +0100
Received: from smucm33k.bmwgroup.net (HELO smucm33k.europe.bmw.corp)
 ([160.46.167.67])
 by esabb2.muc with ESMTP/TLS; 08 Feb 2022 14:35:02 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by
 smucm33k.europe.bmw.corp
 (160.46.167.67) with Microsoft SMTP Server (TLS;
 Tue, 8 Feb 2022 14:35:01 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.026; Tue,
 8 Feb 2022 14:35:01 +0100
From: <Mikko.Rapeli@bmw.de>
To: <dl9pf@gmx.de>
CC: <openembedded-core@lists.openembedded.org>, <jpew.hacker@gmail.com>,
	<scott.murray@konsulko.com>
Subject: Re: [OE-core] [PATCH v2] create-spdx: Get SPDX-License-Identifier
 from source
Thread-Topic: [OE-core] [PATCH v2] create-spdx: Get SPDX-License-Identifier
 from source
Thread-Index: AQHYHFkf3G/nj2q2P0O6oEPhrjIqO6yIemyAgAAAroCAAAbCAIABEcmAgAAEOwA=
Date: Tue, 8 Feb 2022 13:35:01 +0000
Message-ID: <YgJxhJCQZLrkpgON@korppu>
References: <20220207192915.70095-1-saul.wold@windriver.com>
 <2e636f2e-dba9-e336-8060-9e8cce40cedb@gmail.com>
 <dc177cfd-50c2-33e2-bd3c-b33d65ee35@spiteful.org>
 <2518421.NRruQZ00Rg@monster>
In-Reply-To: <2518421.NRruQZ00Rg@monster>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <9FA9CCC290A744408503C21CE7147550@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 13:35:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161508

Hi,

On Tue, Feb 08, 2022 at 02:19:51PM +0100, Jan-Simon M=F6ller wrote:
> Hi all
>=20
> > > Can you given an overview of what meta-spdxscanner does? I'm not quit=
e
> > > clear what extra processing would be required here.
> >
> > Jan-Simon can talk to it better, as he's done some dev work on the laye=
r
> > and done tests with it against AGL (and the subsequent Fossology instan=
ce
> > experimentation), but AFAIK for the actual scanning scancode-toolkit
> > does pattern matching based license detection, so in theory it'll catch
> > excerpts of or slightly modified versions of the licenses in its
> > database, as opposed to just searching for SPDX-License-Identifier
> > declarations.  If everyone else is happy with the latter, I'm willing t=
o
> > believe I'm offbase in my concerns, but either way I do think the
> > limitations are going to need to be documented so users (and their
> > lawyers) are aware of them.
>=20
> TLDR: meta-spdxscanner integrates with scanning tools. Either with fossol=
ogy
> or scancode-tk. An upload to blackduck is also possible meanwhile.
>=20
> Let's focus on fossology and scancode-tk.
>=20
> a) fossology
>=20
> Here we essentially integrate in the task chain and archive the sources a=
fter
> patching to upload them to a fossology instance. All the scanning/process=
ing
> happens then on the server and after some time (a lot ! ;) ) we get a SPD=
X
> report back that we store alongside the package. This is a result of a sc=
an,
> so it might catch licenses of files deep in the source tree that may not =
be
> declared in the recipe and so on.
>=20
> Also, fossology offers then a webinterface for manual inspection and revi=
ew.
> So this is a thorough but quite manual process. More for release work tha=
n
> daily or occasional stuff.
>=20
>=20
> b) scancode-tk
> scancode on the contrary will run on your host during the build and gathe=
r the
> data.  It will write the spdx file out as well.
>=20
>=20
> I think for us the interesting part would be to compare e.g. the scancode=
-tk
> scan from b) with what we have declared in the recipe.

I guess reports from both will be a superset of used licenses (and possibly=
 copyright
statements too) since the list of source files which are actually compiled =
is not
known to these services.

Currently the source recipes which have multiple licenses including problem=
atic ones,
are not cleaned up for license compliance scan. E.g. GPLv3 licensed source =
code are not
deleted at do_patch() time. Thus reports need to be manually adjusted.

Cheers,

-Mikko=

