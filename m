Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwT03-0002Vb-8n
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 09:05:43 +0200
Received: by wgbdr1 with SMTP id dr1so5854456wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 23:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wWl4Goi2BO1Oaej3ntXkmdPxgePdBIPUEHcGGXfr3ps=;
	b=qAradAit2Mbl9jX1O80OhGL7XFUMjFqKaz1RXLfjC03DBwqa2PXWQSS61L7+XlEhoO
	/TQowrG7JkWpv58xfE/2MvVWl8j+MCvdcef/tCRdCMmT3OvAbzVjKP3CJ4eSE3a0SC3f
	TnynxQrDVHKgiVK+WJHGHPGXPtWjk98i93JPxZYiFEadwOMvvmilDe9+0B+kQ3UwFL6g
	3UEGFnu4wIS/I9HJIqABpCgUSFDkgdOpVVibnmKvWVG66Zjm+yzaPyMXJmPWHtY5yNTv
	EP3T2kpQ0VgM43gTUTPNZjU5I/EwH+8j7MBFIHPnKjgmikHub8Vma8n+4YPUShubV6bj
	9Teg==
Received: by 10.180.104.200 with SMTP id gg8mr13896446wib.14.1343804045351;
	Tue, 31 Jul 2012 23:54:05 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t8sm26398797wiy.3.2012.07.31.23.54.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 Jul 2012 23:54:04 -0700 (PDT)
Date: Wed, 1 Aug 2012 08:54:01 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120801065401.GD15199@jama.jama.net>
References: <20120801065021.GC15199@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120801065021.GC15199@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: u-boot do_compile should be reentrant even with ld-is-gold
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
X-List-Received-Date: Wed, 01 Aug 2012 07:05:43 -0000
X-Groupsio-MsgNum: 26601
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tEFtbjk+mNEviIIX"
Content-Disposition: inline

--tEFtbjk+mNEviIIX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 01, 2012 at 08:50:21AM +0200, Martin Jansa wrote:
> Hi,
>=20
> this commit:
>=20
> reexecuting do_compile in u-boot causes .bfd being appended multiple=20
> times and resulting in errors like:
> /bin/bash: arm-oe-linux-gnueabi-ld.bfd.bfd.bfd: command not found
>=20
> Regex should be updated or patch like this:
> http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dblob;f=3Dmeta=
-nokia/recipes-bsp/u-boot/u-boot/0001-config-Always-use-GNU-ld.patch;h=3D25=
64d1d456d46651778aec9113cb2515f035ba90;hb=3DHEAD
> applied instead of sed, especially if someone sends it upstream=20
> (maybe it's already resolved there - I haven't checked)

well not exactly like this one as this is causing
/bin/sh: 1: Syntax error: Bad fd number
probably from ">&" in dash

> commit 2e79fcd673dadeab6358fe22d47c8534c14de03e
> Author: Otavio Salvador <otavio@ossystems.com.br>
> Date:   Sun Apr 22 15:01:32 2012 -0300
>=20
>     u-boot.inc: fix compilation when using 'gold' as linker
>=20
>     Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>=20
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot=
/u-boot.inc
> index 0445c34..a13eddc 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -36,6 +36,10 @@ SPL_IMAGE ?=3D "${SPL_BINARY}-${MACHINE}-${PV}-${PR}"
>  SPL_SYMLINK ?=3D "${SPL_BINARY}-${MACHINE}"
>=20
>  do_compile () {
> +       if [ "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', 'ld-is-go=
ld', '', d)}" =3D "ld-is-gold" ] ; then
> +               sed -i 's/$(CROSS_COMPILE)ld/$(CROSS_COMPILE)ld.bfd/g' co=
nfig.mk
> +       fi
>=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tEFtbjk+mNEviIIX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAY0okACgkQN1Ujt2V2gByDXwCgkD3bNwdgOYuMwJSUX3aOg/oS
dsAAmwQhrYKUI1m05J1ljjwfKwWDE8nE
=+Rg5
-----END PGP SIGNATURE-----

--tEFtbjk+mNEviIIX--
