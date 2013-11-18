Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 024B86D1F6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 15:10:17 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g15so1742878eak.18
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 07:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/Wst17+EpWOMUn5vjSOnfvbDv3zregJrU3NXxZIEwNc=;
	b=orxikfwCnF6jFfFzzaMEhL/7XYn+uhexoixB3dN0JW2a8Zckys2Eh/TA/cSQmH7ANF
	VfOlAE4H4WdzR0itit5ArrGuVcjxxl/eAzG7pI4IroVKXNMAQs10F2NgG5DkPT91jJND
	Mz4qpNfwn2ebHSYKdeGyAAUIMWn1MCEymwKfozdu9pukRwayCTv8CW8wcIk/D53HGr9M
	zetqPeQWIGA+5w+xpIofF0ckuJ1DA0AhV+pC5vnvKnwr+RVovhkkk9sUCGLWf5g1T03p
	GbtXx2GgC1R1t7HGwa+0P72OMVRVHPeDpc3jjmoMKEFJ52k/vIhGLR7wCecTT5DNCloi
	249A==
X-Received: by 10.15.101.13 with SMTP id bo13mr2673827eeb.77.1384787419434;
	Mon, 18 Nov 2013 07:10:19 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id o45sm20682922eep.2.2013.11.18.07.10.18
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Nov 2013 07:10:18 -0800 (PST)
Date: Mon, 18 Nov 2013 16:10:19 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "yanjun.zhu" <yanjun.zhu@windriver.com>
Message-ID: <20131118151019.GC3727@jama>
References: <1384770701-30455-1-git-send-email-yanjun.zhu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1384770701-30455-1-git-send-email-yanjun.zhu@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pr-util: insert appropriate parameter to adapt libtool
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
X-List-Received-Date: Mon, 18 Nov 2013 15:10:18 -0000
X-Groupsio-MsgNum: 47219
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FFoLq8A0u+X9iRU8"
Content-Disposition: inline

--FFoLq8A0u+X9iRU8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2013 at 06:31:41PM +0800, yanjun.zhu wrote:
> When ccache is enabled, a parameter "ccache" is inserted.
> libtool can not handle this parameter correctly. So "--tag=3DCC"
> is introduced to help libtool handle it.

Typo in subject.

> ---
>  meta/recipes-support/apr/apr-util_1.5.2.bb |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/recipes-support/apr/apr-util_1.5.2.bb b/meta/recipes-su=
pport/apr/apr-util_1.5.2.bb
> index ea0f7fb..d6ae394 100644
> --- a/meta/recipes-support/apr/apr-util_1.5.2.bb
> +++ b/meta/recipes-support/apr/apr-util_1.5.2.bb
> @@ -34,6 +34,11 @@ do_configure_append() {
>  	if [ "${CLASSOVERRIDE}" =3D "class-target" ]; then
>  		cp ${STAGING_DATADIR}/apr/apr_rules.mk ${S}/build/rules.mk
>  	fi
> +
> +	# When ccache is enabled, libtool needs --tag=3DCC to choose correct ha=
ndle methods.
> +	if [ -f ${S}/build/rules.mk ]; then
> +		sed -i "s,^LTFLAGS,LTFLAGS      =3D --silent --tag=3DCC\n#LTFLAGS,g" $=
{S}/build/rules.mk
> +	fi
>  }
>  do_configure_prepend_class-native() {
>  	cp ${STAGING_DATADIR_NATIVE}/apr/apr_rules.mk ${S}/build/rules.mk
> --=20
> 1.7.3.5
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FFoLq8A0u+X9iRU8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKKLdsACgkQN1Ujt2V2gBzanwCfQTb1m2WEFdg+2rK1FaosaGRC
sPEAnixCu1NvtL//1vWnnPk6fEiUvjVm
=ep6L
-----END PGP SIGNATURE-----

--FFoLq8A0u+X9iRU8--
