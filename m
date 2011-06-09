Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QUaoP-0002pC-8Z
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 10:41:57 +0200
Received: by bwz5 with SMTP id 5so1310146bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2011 01:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=LMWY0M0REFbBir9ijhh2if8M0cy7P9blMsMx7a85pSU=;
	b=w+5OnHf7MQKs0OTTfHfmPpgQgQoGqxU5zlrg4zCiJpca/nILcRBdTDlEsnAr74Ykzj
	8AXlf9PyUX+fFxPnLpnA0zzNiuDeSHDiPGeeJtQR/BN3/Z3M/G59lzwga2eCxepONiZL
	ce1DKSsSchol0SRuG8Cytf9XIaQxSeGP3LIzI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=G3m4dNHy6BgQr8PeTEKqNMBiV5oGzEMf/9HFSUzBX35+obX8ij9bzLtJkUk0Dhglfm
	KkB1RK6ws3SC1ooGI86I6S5d24sUBK4N1K6JaFVnMR57Zacr4B50TyeLAciVGXBn9Vy0
	2K+b8rURlmHBwMJ9r4yIPlIEQ1XNVDVaqdEgw=
Received: by 10.204.7.213 with SMTP id e21mr405172bke.209.1307608717770;
	Thu, 09 Jun 2011 01:38:37 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id ek1sm1329342bkb.21.2011.06.09.01.38.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Jun 2011 01:38:36 -0700 (PDT)
Date: Thu, 9 Jun 2011 10:38:34 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110609083834.GJ23137@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: LOCALCOUNT increased twice when there are 2 layers with same git recipe
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
X-List-Received-Date: Thu, 09 Jun 2011 08:41:57 -0000
X-Groupsio-MsgNum: 3792
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3CAnR4CLEnEWqRMR"
Content-Disposition: inline

--3CAnR4CLEnEWqRMR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I was wondering why I see gobject-introspection built on every image
build and it's because LOCALCOUNT is changing all the time.

OE om-gta02@shr ~/shr-core $ find openembedded-core/ -name gobject-introspe=
ction\*
openembedded-core/meta/recipes-gnome/gnome/gobject-introspection_git.bb
SRCREV =3D "efa7266bcf78478ce62e8dd778a4f0417bfd4d15"
PV =3D "0.10.8+git${SRCPV}"

OE om-gta02@shr ~/shr-core $ find meta-openembedded/ -name gobject-introspe=
ction\*
meta-openembedded/meta-oe/recipes-gnome/gnome/gobject-introspection_0.9.10.=
bb
meta-openembedded/meta-oe/recipes-gnome/gnome/gobject-introspection_git.bb
SRCREV =3D "8d64bc23d2b837421ecf9c7b0e4b8d5d95ca0d21"
PV =3D "1.29.0+gitr${SRCPV}"

I had to add gobject-introspection_git.bb to meta-oe, because we're
using newer glib with gdbus-codegen included (instead separate
gdbus-binding-tool we were using before)
meta-openembedded/meta-oe/recipes-core/glib-2.0/glib-2.0_git.bb with
SRCREV =3D "d97cbc6731deab137770bc0fe9c69b06f689f5b4"
PV =3D "2.29.3+gitr${SRCPV}"
and default gobject-introspection version is not compatible with it.

Problem is that with 2 _git recipes LOCALCOUNT is incremented twice
because there are 2 different SRCREVs found during parsing.

I wanted to use gobject-introspection_git.bbappend, but it looks like
changing PV/SRCREV from .bbappend is not supported (bitbake-layers also
reported that it cannot find right gobject-introspection version to my
bbappend. And I also cannot blacklist gobject-introspection_git.bb from
oe-core, because Angstrom blacklister uses only PN. So in the end I've
removed that recipe from my oe-core-contrib/shr branch which is used for
SHR builds..

Is there better way to resolve this? With more layers enabled this could
happen more often imho.. Maybe we could add unexpanded -PV to LOCALCOUNT
persistent db key with sideeffect of reseting LOCALCOUNT on every PV
change (upgrade to newer version).

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3CAnR4CLEnEWqRMR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3whooACgkQN1Ujt2V2gBxLJwCfY1fMxdT82hpy4DNahSIwKFMx
VuwAn0RtfBAwZDudn39qpOaF+PTz716Y
=sxgY
-----END PGP SIGNATURE-----

--3CAnR4CLEnEWqRMR--
