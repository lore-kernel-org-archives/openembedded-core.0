Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3CFB06B05F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 12:48:32 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id z12so1386804wgg.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 04:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=f+osi+pyaJbYU6UpWwN3Z1e0SogjD3eB13LJ/t/d5gw=;
	b=Gmf/C8CNCwvp6179soaCzey1PRmK93AzBxxZZa1zMHNvn/ZAppDES7HaudsCdz7LPk
	SZWtPDzrYbVI23V+neQas1HVFMYC577ngFe3KB2xllbtO4l9LKJKdkE79ZUcsN28i/A1
	o/urGENYgj+Yzd4YB2HWlxJdofWouR2tQ5JkYt+reuMhQ3+ldwfHP/0emaSsxLS/ZPUm
	dtYJ4hxlao35QxTE0ES4rn7QUIj/TMefGoV2cfGDovpwiGFNUl+XSVLIaJKO4Gy3s7pD
	igJLa/8HWcy4g56X9HpkIah5VRx67MtQf4pK4PeeBnhT7H+xXXs6DbrWHQvF96otS154
	zY9w==
X-Received: by 10.180.7.227 with SMTP id m3mr7549029wia.59.1390481312311;
	Thu, 23 Jan 2014 04:48:32 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	bj3sm22082571wjb.14.2014.01.23.04.48.30 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jan 2014 04:48:31 -0800 (PST)
Date: Thu, 23 Jan 2014 13:48:33 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140123124833.GE3704@jama>
References: <1390479566.17424.99.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1390479566.17424.99.camel@ted>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libtool-cross/native: Force usage of bash due to sstate inconsistencies
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
X-List-Received-Date: Thu, 23 Jan 2014 12:48:32 -0000
X-Groupsio-MsgNum: 49458
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kbCYTQG2MZjuOjyn"
Content-Disposition: inline

--kbCYTQG2MZjuOjyn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2014 at 12:19:26PM +0000, Richard Purdie wrote:
> Scenario:
> a) libtool script is built on system with bash as /bin/sh
> b) machine B installs sstate from build a)
> c) machine B has dash as /bin/sh
>=20
> In this scenario, the script fails to work properly since its expecting
> /bin/sh to have bash like syntax and it no longer does have it.
>=20
> This patch forces the configure process to use /bin/bash, not /bin/sh
> and hence allows the scripts to work correctly when used from sstate.

Shouldn't oe-core commit 367a19aaf31bcf997f10d045e7954cc800189052 fix
that already? I don't see this issue on our builders since
367a19aaf31bcf997f10d045e7954cc800189052 was merged.

> (From OE-Core rev: 2c66aa0fc98b092ebb37baee94e92d1965afd76b)

This is sent from poky repo, right?

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb b/meta/=
recipes-devtools/libtool/libtool-cross_2.4.2.bb
> index 34aae0b..72fad37 100644
> --- a/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb
> +++ b/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb
> @@ -39,3 +39,5 @@ libtoolcross_sysroot_preprocess () {
>  }
> =20
>  SSTATE_SCAN_FILES +=3D "libtoolize *-libtool"
> +
> +export CONFIG_SHELL=3D"/bin/bash"
> diff --git a/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb b/meta=
/recipes-devtools/libtool/libtool-native_2.4.2.bb
> index df73f08..f1051d8 100644
> --- a/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
> +++ b/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
> @@ -22,3 +22,4 @@ do_install () {
>  	install -m 0755 ${HOST_SYS}-libtool ${D}${bindir}/${HOST_SYS}-libtool
>  }
> =20
> +export CONFIG_SHELL=3D"/bin/bash"
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kbCYTQG2MZjuOjyn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLhD6EACgkQN1Ujt2V2gBwmuwCgkQGrovqb641upU1BlxNju3wY
H3sAn1VtCQsfflqTKKnqhrmKUmNtbBHi
=OCep
-----END PGP SIGNATURE-----

--kbCYTQG2MZjuOjyn--
