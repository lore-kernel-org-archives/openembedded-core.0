Return-Path: <pbarker@betafive.co.uk>
Received: from crash.betafive.co.uk (crash.betafive.co.uk [37.187.124.48])
	by mail.openembedded.org (Postfix) with ESMTP id C706C60017
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Feb 2015 11:54:28 +0000 (UTC)
Received: by crash.betafive.co.uk (Postfix, from userid 1000)
	id 695FF3E05D9; Sat,  7 Feb 2015 11:55:59 +0000 (GMT)
Date: Sat, 7 Feb 2015 11:55:59 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: Peter Urbanec <openembedded-devel@urbanec.net>
Message-ID: <20150207115559.GA7478@crash.betafive.co.uk>
References: <1421446529-24888-1-git-send-email-paul@paulbarker.me.uk>
	<54D5ED44.90002@urbanec.net>
MIME-Version: 1.0
In-Reply-To: <54D5ED44.90002@urbanec.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: opkg refactoring
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
X-List-Received-Date: Sat, 07 Feb 2015 11:54:35 -0000
X-Groupsio-MsgNum: 62173
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline

--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 07, 2015 at 09:47:32PM +1100, Peter Urbanec wrote:
> On 17/01/15 09:15, Paul Barker wrote:
> >      All these changes work locally in qemuarm and the on-target upgrad=
e path is
> >      mostly clean. opkg-collateral does get left behind on the target f=
ilesystem
> >      after an upgrade but it's effectively an empty package. I don't th=
ink this
> >      poses any problems.
> >=20
> > V2 changes:
> >    - Add RCONFLICTS and RPROVIDES where RREPLACES is specified
> >=20
> >    - opkg-collateral is no longer left behind on the target filesystem =
after an
> >      upgrade.
>=20
> I'm running into problems on a few thousand deployed systems where opkg u=
pgrades are "stuck".
>=20
> I see this:
>=20
> root@beyonwizt4:~# opkg list-upgradable
> opkg-collateral - 1.0-r2 - 1:0.2.4-r0
>=20
> root@beyonwizt4:~# opkg upgrade
> Multiple replacers for opkg-config-base, using first one (opkg-arch-confi=
g).
> Multiple replacers for opkg-config-base, using first one (opkg-arch-confi=
g).
> Package opkg is already installed on root.
>=20
> root@beyonwizt4:~# opkg status opkg-config-base
>=20
> root@beyonwizt4:~# opkg status opkg-arch-config
> Package: opkg-arch-config
> Version: 1.0-r1
> Provides: opkg-config-base
> Replaces: opkg-config-base
> Conflicts: opkg-config-base
> Status: install ok installed
> Architecture: beyonwizt4
> Conffiles:
>  /etc/opkg/arch.conf 913f790674d06e2bd0c2a45971fe7002
> Installed-Time: 1423281805
>=20
> root@beyonwizt4:~# opkg status opkg
> Package: opkg
> Version: 1:0.2.4-r0
> Depends: opkg-config-base, update-alternatives-opkg, libopkg1 (>=3D 0.2.4=
), run-postinsts, libc6 (>=3D 2.20)
> Provides: opkg-collateral
> Replaces: opkg-nogpg
> Conflicts: opkg-collateral
> Status: install user installed
> Architecture: mips32el
> Installed-Time: 1422327765
>=20
> Unfortunately the user visible interface to opkg is limited to an option =
that will run "opkg update ; opkg upgrade".
>=20
> I know I can clean up manually by running "opkg remove opkg-collateral". =
Any ideas on how to get this cleaned up automatically?
>=20
> Thanks,
>=20
> 	Peter
>=20

I didn't realise people were following oe-core master on deployments of a f=
ew
thousand systems! This is definitely a use-case for the stable branches.

Are you just seeing opkg-collateral left behind or are you seeing some other
upgrades "stuck"?

"opkg status opkg" should show that opkg now replaces opkg-collateral. As i=
t is
it's only showing provides and conflicts. In commit e8879cd, RREPLACES is
modified to include opkg-collateral but that doesn't seem to have been
propagated to the opkg package on your devices. If we can fix this you shou=
ld be
able to 'opkg upgrade' again and have the replacement properly handled.

Could you check whether "Replaces" for opkg includes opkg-collateral in your
"Packages" file? And could you also check whether RREPLACES in
"meta/recipes-devtools/opkg/opkg_0.2.4.bb" includes opkg-collateral? That s=
hould
narrow down where the error is introduced.

I'm also surprised your opkg version is "1:0.2.4-r0". Are you using the PR
Service to ensure that version numbers increase each time a package is rebu=
ilt?
If not, this could contribute to the issue you're seeing.

Thanks,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJU1f1PAAoJEBwoJlo7UPQDzkkH/A7sRbRwpLhCUH4vbQhKq/tE
xFZRfbHDkbDfJBLi4mQPa4/TGki8C1mf+knvkMOSM/x/uJK2OVUMMxNmnB30NQlV
4OMF26SAKZbZ35MU2ny4KcGm8JOcg3d9nFbdAn9+QntkkiaSIoAgHe6ZEPddevYw
os7FASde57zXbK+12kq4jK7AWVAtXbeSoi1/hNtjGuZ7OHjOgdIXTs3e0AX26Snz
4ut0vX2/lFBpuFszPp1ccytf3u55/G8oYl6qHtfKQ/9gUevcqJLVvGpywSQxwReJ
eZBWvXlAYHymMbIoD3U8q7seyLihYmHOcxvHoMxa6KFlbW83U+hA/PvBoCN+NLI=
=rdxM
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
