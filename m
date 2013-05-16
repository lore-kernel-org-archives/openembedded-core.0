Received: from mail-pa0-f42.google.com ([209.85.220.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UcuNJ-0008PP-Lz
	for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 11:21:27 +0200
Received: by mail-pa0-f42.google.com with SMTP id bj3so2332674pad.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2013 02:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=3jAsK3RZFNu8L8HYAAQEQVoehIta2DzjXontDcp+XLo=;
	b=q1/jl/39eusG2Z+vc21y8cIhS/EF0dxqmptMuAnvVbohJdjGQyJOIYstLY7cl8g2uR
	O5tk2Fendv16w+/6v7GVIpnDfUcxw8IAFVzl9WGcdBWu6zcMq6Bti3qIfMbYlXWUO6Tf
	TnDKAkooagfQg05wG4Zw8Y22bpvrrrcturm2luiEavh5QKGuzEBvFtRaIciGDTbimFAF
	GZ8E7XD/0NQy9YeYNmi2ZizT/SXa/f2kT80vbl5jfrErsgD7twBCHRR7xUL8K807cAHm
	h85WPKWg/UH2XGu+w4voVA48D1N4+79aI+k4nHXJQl0Qbblreg4PFs7FjWeA2ZrkDm53
	+r7Q==
X-Received: by 10.68.12.98 with SMTP id x2mr3452911pbb.92.1368694991043;
	Thu, 16 May 2013 02:03:11 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	vu10sm6044135pbc.27.2013.05.16.02.03.08 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 16 May 2013 02:03:10 -0700 (PDT)
Date: Thu, 16 May 2013 11:03:11 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Qi.Chen@windriver.com
Message-ID: <20130516090311.GD24809@jama.dyndns-home.com>
References: <cover.1368690819.git.Qi.Chen@windriver.com>
	<d978543b3558dc8cc14379cd10506c3f0c6f2953.1368690819.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <d978543b3558dc8cc14379cd10506c3f0c6f2953.1368690819.git.Qi.Chen@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] image.bbclass: add postinst_enable_logging
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 May 2013 09:21:33 -0000
X-Groupsio-MsgNum: 39324
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GyRA7555PLgSTuth"
Content-Disposition: inline

--GyRA7555PLgSTuth
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2013 at 03:56:14PM +0800, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> Add a function postinst_enable_logging, so that when 'debug-tweaks'
> is in IMAGE_FEATURES, we create .enable_postinst_logging under /etc,
> which is used by run-postinst scripts to determine whether to log or
> not.
>=20
> [YOCTO #4262]
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/image.bbclass |    7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 2b42e12..fc5e23c 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -175,6 +175,8 @@ MACHINE_POSTPROCESS_COMMAND ?=3D ""
>  ROOTFS_POSTPROCESS_COMMAND_prepend =3D "run_intercept_scriptlets; "
>  # Allow dropbear/openssh to accept logins from accounts with an empty pa=
ssword string if debug-tweaks is enabled
>  ROOTFS_POSTPROCESS_COMMAND +=3D '${@base_contains("IMAGE_FEATURES", "deb=
ug-tweaks", "ssh_allow_empty_password; ", "",d)}'
> +# Enable postinst logging if debug-tweaks is enabled
> +ROOTFS_POSTPROCESS_COMMAND +=3D '${@base_contains("IMAGE_FEATURES", "deb=
ug-tweaks", "postinst_enable_logging; ", "",d)}'
> =20
>  # some default locales
>  IMAGE_LINGUAS ?=3D "de-de fr-fr en-gb"
> @@ -484,6 +486,11 @@ ssh_allow_empty_password () {
>  	fi
>  }
> =20
> +# Enable postinst logging if debug-tweaks is enabled
> +postinst_enable_logging () {

cannot we use better file for this? it will be first hidden file in /etc

> +	touch ${IMAGE_ROOTFS}/etc/.enable_postinst_logging
> +}
> +
>  # Turn any symbolic /sbin/init link into a file
>  remove_init_link () {
>  	if [ -h ${IMAGE_ROOTFS}/sbin/init ]; then
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GyRA7555PLgSTuth
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGUoM8ACgkQN1Ujt2V2gBzP0ACfbluvtT/IJsY0DG4veZlKh1G+
PGIAoIhMlq///zhLFvqsXUNybj0pOAYB
=mgB3
-----END PGP SIGNATURE-----

--GyRA7555PLgSTuth--
