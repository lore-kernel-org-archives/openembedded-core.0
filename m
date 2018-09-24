Return-Path: <prvs=7981aab84=Mikko.Rapeli@bmw.de>
Received: from esa2.bmw.c3s2.iphmx.com (esa2.bmw.c3s2.iphmx.com
	[68.232.133.169])
	by mail.openembedded.org (Postfix) with ESMTP id A368E745A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 13:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1537795249; x=1569331249;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=+WwyFgtVTHQAxkKcSiSt4RG5B900YfpZ7fNFTc9nXSU=;
	b=LnI903BkkBbHr4XLviUiL2d1rAAxwU6YbehK9x+v5hWnuhaYx0j7kUCa
	6GuqRCKYc6Us61MvHGG+eQDRmAa2AqAgBRcRaAAMtlys7y6m2PAYyqveQ
	PALYmH4MF/BZ6KxeAj2RMSozua7zSpl9qy3bW+Eku/zvqNM5mY9H3H6sR Q=;
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
	esa2.bmw.c3s2.iphmx.com with ESMTP/TLS; 24 Sep 2018 15:20:48 +0200
Received: from esabb4.muc ([160.50.100.33])  by esagw6.muc with ESMTP/TLS;
	24 Sep 2018 15:20:20 +0200
Received: from smucm10k.bmwgroup.net (HELO smucm10k.europe.bmw.corp)
	([160.48.96.47])
	by esabb4.muc with ESMTP/TLS; 24 Sep 2018 15:20:13 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10k.europe.bmw.corp
	(160.48.96.47) with Microsoft SMTP Server (TLS;
	Mon, 24 Sep 2018 15:20:13 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1367.000;
	Mon, 24 Sep 2018 15:20:13 +0200
From: <Mikko.Rapeli@bmw.de>
To: <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] kernel.bbclass: allow exporting files from
	kernel recipes to sysroot
Thread-Index: AQHUUaE9h/4Az64dPkO/QKSNq++KT6T+6syAgABQQYCAAAHVgIAADneAgAAChIA=
Date: Mon, 24 Sep 2018 13:20:13 +0000
Message-ID: <20180924132013.GJ9430@hiutale>
References: <1537530567-8604-1-git-send-email-mikko.rapeli@bmw.de>
	<20180924072539.GE9430@hiutale>
	<CADkTA4MBwLt_7AHDqVfh79KNB_sG58+gGWLz=4KqMg1Qpk1Ngg@mail.gmail.com>
	<20180924121927.GI9430@hiutale>
	<045ad825c6999fe4876a7aa90cb427ca2d0d8c87.camel@linuxfoundation.org>
In-Reply-To: <045ad825c6999fe4876a7aa90cb427ca2d0d8c87.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.36]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel.bbclass: allow exporting files from kernel recipes to sysroot
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
X-List-Received-Date: Mon, 24 Sep 2018 13:20:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <126678578D70BA4C916E34C3CA36D4FD@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 24, 2018 at 02:11:13PM +0100, Richard Purdie wrote:
> On Mon, 2018-09-24 at 12:19 +0000, Mikko.Rapeli@bmw.de wrote:
> > > That was one old way, but not the only. And not for exposing non
> > > uapi
> > > headers.
> >=20
> > What other ways exist?
> >=20
> > I don't care how, but I must export custom kernel specific headers
> > and
> > other files to other recipes in a build in ways which are compatible
> > with
> > yocto upstream.
> >=20
> > I have not seen any documented ways for this.
>=20
> It may not be documented, perhaps because its actually very simple.
>=20
> Any recipe can expose headers into the recipe sysroot, they simply
> install them where needed in do_install as normal.
>=20
> So all you need is a recipe which installs the right headers and then
> you DEPEND on that recipe. Where that recipe gets the headers isn't
> relevant.

No, this does not work on sumo. My patch is needed for this to work.

Without my patch, users of kernel.bbclass have zero files in
tmp/sysroot-components even if they install extra files and extra header
only binary packages.

A generated image or SDK will have the files if the binary package is insta=
lled
but sysroot not.

-Mikko=

