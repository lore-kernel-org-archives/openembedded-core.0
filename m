Return-Path: <prvs=31872cab3=Mikko.Rapeli@bmw.de>
Received: from esa5.bmw.c3s2.iphmx.com (esa5.bmw.c3s2.iphmx.com
	[68.232.139.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3F0A777D42
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 12:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1496321434; x=1527857434;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=ph6k6zP4EcM4DeLErPdw6hxkM3P84OtHpMMm0y0Zw54=;
	b=kspfRqsUNaVoTlPok5apzBJEhxuR4K/1Kc32yqvmBNTn59V572RE8Xev
	12fQ3wmrtPzVcbscdov5EpxQfHAIfH1pZ1czoTz7f+N1DfQDuSTbe0W7Y
	GK8sZU9rTiiquj4je9G0gGBur8nSSEUdwko9iuYa5WVzZYK2IltgMNqcA c=;
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
	esa5.bmw.c3s2.iphmx.com with ESMTP/TLS; 01 Jun 2017 14:50:31 +0200
Received: from esabb5.muc ([160.50.100.47])  by esagw2.muc with ESMTP/TLS;
	01 Jun 2017 14:50:30 +0200
Received: from smucm10m.bmwgroup.net (HELO smucm10m.europe.bmw.corp)
	([160.48.96.49])
	by esabb5.muc with ESMTP/TLS; 01 Jun 2017 14:50:30 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10m.europe.bmw.corp
	(160.48.96.49) with Microsoft SMTP Server (TLS;
	Thu, 1 Jun 2017 14:50:30 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1263.000;
	Thu, 1 Jun 2017 14:50:30 +0200
From: <Mikko.Rapeli@bmw.de>
To: <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] Fix return value checks from
	subprocess.call()'s
Thread-Index: AQHS0G/7wjrREpahp0apkdMg+WxVPaIP5gIAgAAC4oA=
Date: Thu, 1 Jun 2017 12:50:30 +0000
Message-ID: <20170601125029.wli6reydiovo7xjk@hiutale>
References: <1495178237-22689-1-git-send-email-mikko.rapeli@bmw.de>
	<CAJTo0LYvce=ZnTyYmT+_3b9-VD35t9yZES8wNin+xM-Xdj2ALQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYvce=ZnTyYmT+_3b9-VD35t9yZES8wNin+xM-Xdj2ALQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.44.101]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Fix return value checks from subprocess.call()'s
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
X-List-Received-Date: Thu, 01 Jun 2017 12:50:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4BD997CC66606444BEE4220BC6A873BC@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 01, 2017 at 01:40:10PM +0100, Burton, Ross wrote:
> On 19 May 2017 at 08:17, Mikko Rapeli <mikko.rapeli@bmw.de> wrote:
>=20
> >  bitbake/lib/bb/ui/ncurses.py             | 2 +-
> >  bitbake/lib/bb/utils.py                  | 2 +-
> >  meta/classes/archiver.bbclass            | 2 +-
> >  meta/classes/cml1.bbclass                | 2 +-
> >  meta/classes/kernel-module-split.bbclass | 2 +-
> >  meta/classes/sstate.bbclass              | 4 ++--
> >  meta/lib/oeqa/utils/buildproject.py      | 2 +-
> >  meta/lib/oeqa/utils/targetbuild.py       | 4 ++--
> >  meta/recipes-extended/cups/cups.inc      | 2 +-
> >  scripts/runqemu                          | 8 ++++----
> >
>=20
> Poky is a generated repository and you've patches that touch two upstream
> repositories, can you split this into bitbake/ (for the bitbake repo) and
> meta/ scripts/ (for the openembedded-core repository).

Yes, I can do that.

> I presume the transformation wasn't automated and you checked that throwi=
ng
> exceptions was the right thing to do?

I did the changes manually and to me throwing an exception in those places
is the right thing to do instead of ignoring all errors.

I will send a v2.

-Mikko=

