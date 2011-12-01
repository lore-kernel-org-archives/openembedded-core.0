Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RW5mx-0004yt-IW
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 13:30:55 +0100
Received: by bkbzv15 with SMTP id zv15so1615450bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 04:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2cgRjCj2AtQhQjyHwkAIiel+NeeJ6hU6XDkTZl+XniY=;
	b=LFcEY6qC15o7V+VXrcgCeLE/ggaJlNRc0uBmHGOv2upjSi0idD2WmwwFBe5GXgwjwf
	sjui2+x0i2nse7YAgbo4v5W9QjYE3gWSjNT6oCOtmagrIq35RHedN1UifOBGeZh3Qmay
	+vKo9nLQrYn9RXiU3PbzuzT/d8K7o4sW9HB7M=
Received: by 10.204.13.70 with SMTP id b6mr7226678bka.78.1322742250702;
	Thu, 01 Dec 2011 04:24:10 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l5sm10981992bkv.9.2011.12.01.04.24.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 04:24:09 -0800 (PST)
Date: Thu, 1 Dec 2011 13:24:08 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111201122407.GB19917@jama.jama.net>
References: <95547EE2-9E3E-4FB6-AA2A-A9653029F971@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <95547EE2-9E3E-4FB6-AA2A-A9653029F971@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Coordinating inter-layer dependencies
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Dec 2011 12:30:55 -0000
X-Groupsio-MsgNum: 13429
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rJwd6BRFiFCcLxzm"
Content-Disposition: inline

--rJwd6BRFiFCcLxzm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 01, 2011 at 12:23:08PM +0100, Koen Kooi wrote:
> Hi,
>=20
> During the past month there have been a number of updates to OE-core reci=
pes that triggered parsing errors due to bbappend in other layers. A small =
seleciton:
>=20
> * netbase
> * libdrm
> * xserver-xorg
> * clutter
>=20
> My view is that layer maintainers need to keep an eye on potential breaka=
ge and have updates ready when patches land into OE-core. Looking back I ca=
n see that while the situation is improving a bit, it's still not working. =
The problem with slow updates to layers is that (with my angstrom hat on) u=
sers (and with my TI hat on) customers and coworkers can't do builds withou=
t rm'ing the bbappends or disabling the layer.
>=20
> This is bad for a number of reasons:
>=20
> 1) It creates unmanaged local diffs
> 2) it can cause PR to fluctuate back and forth if you rm is a bit overzea=
lous or if you disable the complete layer.
>=20
> My proposal is that OE-core recipe upgrades with known bbappends look lik=
e this:
>=20
> 1) add new version with a warning about bbappends
> 2) wait a N days (2 < N < 7)
> 3) delete old version
>=20
> To avoid stressing out RP and Sau! I would strongly urge layer maintainer=
s to respond to recipe update patches with "I have a bbappend, but my revie=
w process needs time, please use the above proposal" if you need time to te=
st and update  your bbappends.
>=20
> We're all human in the end and timezone differences aren't always helping=
 with these kinds of problems, so let's work together to minimize parsing b=
reakage.

That's exactly the reason why I'm using contrib/shr branches and my
setup scripts are updating only from contrib/shr, so I can push changes
to all related branches almost at once and when they are ready.

Sometimes it means extra patches in contrib/shr which are not yet in
master (and sometimes they are on ML already) sometimes it means that
I'm waiting with pulling newer master to shr branch before I prepare
corresponding changes in meta-smartphone (this was the case ie for last
libdrm upgrade). But to test corresponding changes sometimes takes many
hours to even build it...

A while back I've proposed to make .bbappend without corresponding .bb
only big fat warning, but not fatal to parse. Now you cannot even build
eglibc if there is libdrm bbappend you don't care at all about..

Of course if someone ignores big fat warning and build libdrm without
bbappend and then his mesa build is failing, he has to go back and
cleansstate libdrm to build it again properly.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rJwd6BRFiFCcLxzm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7XcecACgkQN1Ujt2V2gBy3YQCdFPaM2Qg5ZbNDcsbycy/6yjo6
gdYAn32b9hl6XWvdtFz6q0iru9Xr/v9g
=TttU
-----END PGP SIGNATURE-----

--rJwd6BRFiFCcLxzm--
