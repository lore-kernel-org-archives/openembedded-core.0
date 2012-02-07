Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RupJ7-0003ZB-5Z
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 18:58:21 +0100
Received: by wgbdr13 with SMTP id dr13so6795191wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 09:50:18 -0800 (PST)
Received: by 10.180.86.9 with SMTP id l9mr35788067wiz.15.1328637018813;
	Tue, 07 Feb 2012 09:50:18 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ho4sm33621603wib.3.2012.02.07.09.50.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 09:50:18 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <fce0db04f4b95798f3bdf6c925f1707faf14f2ed.1328631790.git.paul.eggleton@linux.intel.com>
Date: Tue, 7 Feb 2012 18:50:09 +0100
Message-Id: <8E617E89-2373-4DEB-A3B1-C5D7E31ED4A4@dominion.thruhere.net>
References: <cover.1328631790.git.paul.eggleton@linux.intel.com>
	<fce0db04f4b95798f3bdf6c925f1707faf14f2ed.1328631790.git.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 2/2] classes/buildhistory: sort list fields in package info
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
X-List-Received-Date: Tue, 07 Feb 2012 17:58:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 7 feb. 2012, om 17:25 heeft Paul Eggleton het volgende geschreven:

> Sort DEPENDS, PACKAGES, RDEPENDS, and RRECOMMENDS in package info =
files
> so that any changes in order (which are not important) are smoothed =
out
> in the change history.
>=20
> Fixes [YOCTO #1961]
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
> meta/classes/buildhistory.bbclass |   19 +++++++++++++++----
> 1 files changed, 15 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/classes/buildhistory.bbclass =
b/meta/classes/buildhistory.bbclass
>=20
> -	packages =3D squashspaces(d.getVar('PACKAGES', True))
> +	packages =3D sortlist(squashspaces(d.getVar('PACKAGES', True)))

Sorting PACKAGES is a bad idea, since order does matter in there.

>=20
> 	rcpinfo =3D RecipeInfo(pn)
> 	rcpinfo.pe =3D pe
> 	rcpinfo.pv =3D pv
> 	rcpinfo.pr =3D pr
> -	rcpinfo.depends =3D squashspaces(d.getVar('DEPENDS', True) or =
"")
> +	rcpinfo.depends =3D sortlist(squashspaces(d.getVar('DEPENDS', =
True) or ""))
> 	rcpinfo.packages =3D packages
> 	write_recipehistory(rcpinfo, d)
> 	write_latestlink(None, pe, pv, pr, d)
> @@ -164,8 +175,8 @@ python buildhistory_emit_pkghistory() {
> 		pkginfo.pe =3D pe
> 		pkginfo.pv =3D pv
> 		pkginfo.pr =3D pr
> -		pkginfo.rdepends =3D squashspaces(getpkgvar(pkg, =
'RDEPENDS') or "")
> -		pkginfo.rrecommends =3D squashspaces(getpkgvar(pkg, =
'RRECOMMENDS') or "")
> +		pkginfo.rdepends =3D =
sortpkglist(squashspaces(getpkgvar(pkg, 'RDEPENDS') or ""))
> +		pkginfo.rrecommends =3D =
sortpkglist(squashspaces(getpkgvar(pkg, 'RRECOMMENDS') or ""))

Not sure what went wrong, but R* didn't seem to get sorted after these =
patches: =
https://github.com/Angstrom-distribution/buildhistory/commit/7a9f2f9308b46=
8706799be18b3f400410ee1f664

regards,

Koen=


