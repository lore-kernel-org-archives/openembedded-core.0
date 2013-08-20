Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 42A3E6B5B1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 10:23:24 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so119504eek.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 03:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=aJfFU4iUA9+0DNiLUARb7gV87Dn1PMnizTbCDJjFX98=;
	b=04rTNss/ChIBUcSl5N8xGDuk7i+bNV+sB+lP8L79nhPvJTneOlmM56CNbTbLqjfrMR
	tBZDa69RxRG03kc0rt9gDQMz3z20N3fNN3LYCINRumA4VuwVQjcN+1uwjIlA21cf8fVC
	lkqRd07FUl3GXnu32zfj6THiC2CY4Pjduncemc+KYkIWh5YcgnLKKai7STuHolD/5m+O
	nVvaECyOLizw+bBLKRfE76nXv+ZvhuReNWEapIQltm5xR6kjH3LVsn+Faq4ndlfyEjYC
	w2csa0NtwmOIqAq/IxpkZqF6xlGQdy6mRf8s+gN5ZZ5dnAOBnRz2Nna4V5BZZReVlIti
	jyxw==
X-Received: by 10.15.42.206 with SMTP id u54mr134203eev.94.1376994203661;
	Tue, 20 Aug 2013 03:23:23 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m54sm1384703eex.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 20 Aug 2013 03:23:23 -0700 (PDT)
Date: Tue, 20 Aug 2013 12:24:27 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Jonathan Liu <net147@gmail.com>
Message-ID: <20130820102427.GE522@jama>
References: <1376993441-15007-1-git-send-email-net147@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1376993441-15007-1-git-send-email-net147@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mesa: enable additional drivers for gallium-llvm x86/x86-64
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
X-List-Received-Date: Tue, 20 Aug 2013 10:23:25 -0000
X-Groupsio-MsgNum: 43564
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tVmo9FyGdCe4F4YN"
Content-Disposition: inline

--tVmo9FyGdCe4F4YN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2013 at 08:10:41PM +1000, Jonathan Liu wrote:
> The additional Gallium drivers are needed for open source ATI Radeon
> and NVIDIA graphics drivers.
>=20
> The radeonsi and r600 drivers require LLVM 3.3 built with r600
> PACKAGECONFIG so they must be explicitly enabled by adding r600 to the
> mesa PACKAGECONFIG.

BTW: I just got interesting question about egl_gallium:

libEGL warning: Could not open driver /usr/lib/egl/egl_gallium.so
(libLLVM-3.3.so: cannot open shared object file: No such file or
directory)
Could not initialize egl display

EGL error
Aborted
root@qemux86:~# ls -alh /usr/lib/llvm3.3/
drwxr-xr-x    2 root     root        1.0K Aug 20 02:47 .
drwxr-xr-x   35 root     root       10.0K Aug 20 02:47 ..
-rwxr-xr-x    1 root     root       15.8M Aug 19 14:02 libLLVM-3.3.so
-rwxr-xr-x    1 root     root       78.2K Aug 19 14:02 libLTO.so
-rwxr-xr-x    1 root     root       10.1K Aug 19 14:02 libprofile_rt.so

I don't know yet why it worked in my tests when I was updating mesa and
llvm, but it's true that we need to make sure that mesa finds
libLLVM-3.3.so in versioned subdirectory in runtime.

>=20
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index 447e186..e985d67 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -50,6 +50,10 @@ PACKAGECONFIG[egl] =3D "--enable-egl --with-egl-platfo=
rms=3D${EGL_PLATFORMS}, --disa
>  PACKAGECONFIG[openvg] =3D "--enable-openvg, --disable-openvg"
> =20
>  GALLIUMDRIVERS =3D "swrast"
> +GALLIUMDRIVERS_LLVM33 =3D "${@base_contains('PACKAGECONFIG', 'r600', 'ra=
deonsi,r600', '', d)}"
> +GALLIUMDRIVERS_LLVM =3D "r300,svga,nouveau${@base_version_less_or_equal(=
'MESA_LLVM_RELEASE', '3.2', '', ',${GALLIUMDRIVERS_LLVM33}', d)}"
> +GALLIUMDRIVERS_append_x86 =3D "${@base_contains('PACKAGECONFIG', 'galliu=
m-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
> +GALLIUMDRIVERS_append_x86-64 =3D "${@base_contains('PACKAGECONFIG', 'gal=
lium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
>  # keep --with-gallium-drivers separate, because when only one of gallium=
 versions is enabled, other 2 were adding --without-gallium-drivers
>  PACKAGECONFIG[gallium]      =3D "--with-gallium-drivers=3D${GALLIUMDRIVE=
RS}, --without-gallium-drivers"
>  PACKAGECONFIG[gallium-egl]  =3D "--enable-gallium-egl, --disable-gallium=
-egl"
> --=20
> 1.8.3.4
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tVmo9FyGdCe4F4YN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlITQ9sACgkQN1Ujt2V2gBzyfwCePtMqbZmnoQilJUcdyATwYPR9
mKcAnRYbtq0xFi2ton7JE782f78ckC6s
=+X5z
-----END PGP SIGNATURE-----

--tVmo9FyGdCe4F4YN--
