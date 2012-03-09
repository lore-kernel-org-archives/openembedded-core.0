Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S5vKv-0000vw-Ge
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Mar 2012 09:38:05 +0100
Received: by wgbdr12 with SMTP id dr12so1164006wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Mar 2012 00:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TUBuKN8I6It5nNDCmdJRG4+pwHp8emC7kY2V/HuAyEM=;
	b=SSjepucm8MQG/prcAQHfVgtm/WAdfo0t7R8o/Ecnrd0DHOpbPSLcYEpknUE0Rlr4Rw
	s1lNi7AtmIYfFlg8yb/qEDHW1VB+3SPJu7koETTv0Z4WQP/S0GnIVmX5uZFDoufxuHQ7
	mBr3OKek4E+i+fL7He631Fm0IgLeHI/WavFnYheoZIY1GsrLoh28InZm27eLKoObISbJ
	f16pRspp41bgI+igHC6JM7peNONKLgXW5IvtCx8Jv0DsdtDOZhil5kCEhiNMizr18SCN
	ucNWjZ5C/w2TcV0fV6C4B7QXbyilTinKS6boE4E1U4YhQsJjhnTamtlrxyLpTwXUPz0H
	ecyg==
Received: by 10.180.98.8 with SMTP id ee8mr2557165wib.14.1331281766409;
	Fri, 09 Mar 2012 00:29:26 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fw5sm3333847wib.0.2012.03.09.00.29.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Mar 2012 00:29:25 -0800 (PST)
Date: Fri, 9 Mar 2012 09:29:23 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120309082923.GC3813@jama.jama.net>
References: <20120229104508.GA3844@jama.jama.net>
	<1330512429-29934-1-git-send-email-Martin.Jansa@gmail.com>
	<1330521852.24508.42.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1330521852.24508.42.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] layer.conf: exclude meta-environment with SIGGEN_EXCLUDERECIPES_ABISAFE
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
X-List-Received-Date: Fri, 09 Mar 2012 08:38:05 -0000
X-Groupsio-MsgNum: 18553
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oJ71EGRlYNjSvfq7"
Content-Disposition: inline

--oJ71EGRlYNjSvfq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 29, 2012 at 01:24:12PM +0000, Richard Purdie wrote:
> On Wed, 2012-02-29 at 11:47 +0100, Martin Jansa wrote:
> > * it's machine specific and depends on TIME
> >   basehash changed from 30e97f9eeed1df8488b62b4fb47a3a0c to 72ea9a277e6=
599ae9052b169b9a94f1b
> >   Variable TOOLCHAIN_CONFIGSITE_SYSROOTCACHE value changed from
> >   /OE/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/share/x86_64-oe-linux_=
config_site.d
> >   to
> >   /OE/oe-core/tmp-eglibc/sysroots/qemux86-64copy/usr/share/x86_64-oe-li=
nux_config_site.d
> >   Variable TIME value changed from 084543 to 085638
> > * causes task-cross-canadian to be also machine specific
>=20
> I think a better way to fix this might be:

Agreed, please push your patch instead.

Cheers,

>=20
> diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolch=
ain-scripts.bbclass
> index 6fc9c13..6ca85d9 100644
> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -127,6 +127,8 @@ toolchain_create_sdk_siteconfig () {
>                 fi
>         done
>  }
> +# The immediate expansion above can result in unwanted path dependencies=
 here
> +toolchain_create_sdk_siteconfig[vardepsexclude] =3D "TOOLCHAIN_CONFIGSIT=
E_SYSROOTCACHE"
> =20
>  #This function create a version information file
>  toolchain_create_sdk_version () {
> @@ -138,6 +140,7 @@ toolchain_create_sdk_version () {
>         echo 'Metadata Revision: ${METADATA_REVISION}' >> $versionfile
>         echo 'Timestamp: ${DATETIME}' >> $versionfile
>  }
> +toolchain_create_sdk_version[vardepsexclude] =3D "DATETIME"
> =20
>  python __anonymous () {
>      deps =3D d.getVarFlag('do_configure', 'depends') or ""
>=20
> Cheers,
>=20
> Richard
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oJ71EGRlYNjSvfq7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9Zv2MACgkQN1Ujt2V2gBxOgQCfcqfJR4ZqFe/f0O7mfX50q1tf
010AnjVL5ZVAdZxoslMKvskWHV75SNAl
=1LHv
-----END PGP SIGNATURE-----

--oJ71EGRlYNjSvfq7--
