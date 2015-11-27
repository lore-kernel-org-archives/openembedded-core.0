Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8E4D06012C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 09:06:39 +0000 (UTC)
Received: by wmec201 with SMTP id c201so49882445wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 01:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8fS35up8prRGQRUm/dyJa56Yv7DxcgdDEvSAXRJcfeo=;
	b=cDAdjVPmQNC5utfUNr8r4TT4i9Ixm7KsAGaYRCur0mXrkW8Nm5GJRgrHiUhwN3oaJs
	Fg/y8zUuMB/RKp7bdq/LBxX/lSCFguk1bSzziN2ndTFbMLkzG+t6C+EFGHlyzHrsRmS5
	O6yTSWieB6O0eqr0B0PLa8+cx1z8BwOWvHBRsLSNL2Uridqy1ABEz423wh+m7JULsfk4
	mGHbXUKS0Lu21Sbx0kQMVdjFSwJmxF+E5l11oMfqCjJLGd9i9bH9FlnA74TQIirH1M4y
	F/V879DoYSMliFRva0Q5shT6LXHbiVMDpYfHJu+NAPDOP2UtJ75Nt9wOkB7VCv38dYPY
	gD/A==
X-Received: by 10.194.94.100 with SMTP id db4mr10384713wjb.85.1448615199408;
	Fri, 27 Nov 2015 01:06:39 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id u4sm31699279wjz.4.2015.11.27.01.06.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Nov 2015 01:06:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 27 Nov 2015 10:07:14 +0100
To: Yuanjie Huang <Yuanjie.Huang@windriver.com>
Message-ID: <20151127090714.GA17303@jama>
References: <1448614232-18411-1-git-send-email-Yuanjie.Huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1448614232-18411-1-git-send-email-Yuanjie.Huang@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] gcc-cross-initial: make dependency on gnu-config-native and autoconf-native explicit
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
X-List-Received-Date: Fri, 27 Nov 2015 09:06:40 -0000
X-Groupsio-MsgNum: 74071
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="m4E4Spob7u7JiHeu"
Content-Disposition: inline

--m4E4Spob7u7JiHeu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2015 at 04:50:32PM +0800, Yuanjie Huang wrote:
> From: Yuanjie Huang <yuanjie.huang@windriver.com>
>=20
> When a project is configure to use sstate cache and has the host tool sys=
root
> cleaned, gcc-cross-initial may fail to be configured due to lack of
> gnu-configize tool.
>=20
> gcc-cross-initial recipe has autotools dependency inhibited, and the same=
 flag
> variable also excludes the gnu-config-native.  Though there is an indirect
> dependency through libmpc-native, it's not safe with sstate cache being u=
sed.
>=20
> Moreover, gnu-config-native requires a perl package from autoconf-native =
to
> run, otherwise it will fail with "Can't locate Autom4te/ChannelDefs.pm in=
 @INC"
> message.
>=20
> This patch makes both dependencies explicit for gcc-cross-initial's
> configuration.
>=20
> Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-cross-initial.inc | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recip=
es-devtools/gcc/gcc-cross-initial.inc
> index 7197447..1cb341b 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
> @@ -5,6 +5,9 @@ PACKAGES =3D ""
>  INHIBIT_AUTOTOOLS_DEPS =3D "1"
>  INHIBIT_DEFAULT_DEPS =3D "1"
> =20
> +# We still need gnu-config-native
> +DEPENDS_prepend =3D " gnu-config-native autoconf-native"

Trailing space not leading space..

> +
>  PN =3D "gcc-cross-initial-${TARGET_ARCH}"
> =20
>  CROSS_TARGET_SYS_DIR_append =3D ".${PN}"
> --=20
> 2.6.2
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--m4E4Spob7u7JiHeu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZYHUEACgkQN1Ujt2V2gBxZlACfbPf+WXXbep213y2CDaTANa9S
wAIAn1hxEtcBJBpCYflNQqXRTM24ZX7i
=5aE/
-----END PGP SIGNATURE-----

--m4E4Spob7u7JiHeu--
