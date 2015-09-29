Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id ED7347680E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 15:50:19 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so156845698wic.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 08:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vrIPViaIXWc/aeUUzZCldalZ8PHQcUowk3yKJvJ8CC0=;
	b=vgySOkR/1TUhv+vhwnhQY4urv5GyVYjpsvtWz6ppmOanZCv7hGVeChJ6yoWP8ZGPVF
	J5cGs2kDebJq9HlpbBJKLl2S+E/yN9GNTDdoUIQftKxde6jD6RHZk2MRcWdeDjFspDJz
	nGj13OLiJU7EL/+slU1OCvY7ozscvdTUxNBVjp2IFCwgKmJtJFfEMztwboqbXvGSNztR
	NJAEI+5nNHLydlD/wCrUIzd9wubpKOaGcw7eiTBE0m7tj39X1xW+v/wijZAdrHLkhm37
	NEWAgN5RI+SSdsncwGhX9L8BLkGh8z6esi+cxU+9hrIrdvA64vu7rdpUJPzQgKP1k+1J
	i+Eg==
X-Received: by 10.180.93.168 with SMTP id cv8mr19457903wib.54.1443541818991;
	Tue, 29 Sep 2015 08:50:18 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ej5sm24578398wjd.22.2015.09.29.08.50.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Sep 2015 08:50:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 29 Sep 2015 17:50:55 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20150929155055.GA14440@jama>
References: <1441369348-32182-3-git-send-email-Martin.Jansa@gmail.com>
	<1441895486-26145-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1441895486-26145-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCHv2] fontcache: allow to pass extra parameters and environment to fc-cache
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
X-List-Received-Date: Tue, 29 Sep 2015 15:50:20 -0000
X-Groupsio-MsgNum: 71750
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline

--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2015 at 04:31:26PM +0200, Martin Jansa wrote:
> * this can be useful for passing extra parameters, pass
>   -v by default to see what's going on in do_rootfs
> * we need to use this for extra parameter we implemented
>   in fontconfig:
>   --ignore-mtime always use cache file regardless of font directory mtime
>   because the checksum of fontcache generated in do_rootfs
>   doesn't match with /usr/share/fonts directory as seen on
>   target device causing fontconfig to re-create the cache
>   when fontconfig is used for first time or worse create
>   new cache in every user's home directory when /usr/
>   filesystem is read only and cache cannot be updated.
>=20
>   Running FC_DEBUG=3D16 fc-cache -v on such device shows:
>   FcCacheTimeValid dir "/usr/share/fonts" cache checksum 1441207803 dir c=
hecksum 1441206149
> * my guess is that the checksum is different, because pseudo
>   (which is unloaded when running qemuwrapper) or because some
>   influence of running the rootfs under qemu.

ping

was this postponed to 2.0? Any feedback would be nice.

But thanks for applying the other 2, now we were able to implement this in =
our
layer with overlayed fontcache.bbclass and intercepts scripts.

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/fontcache.bbclass                | 19 +++++++++++++++----
>  scripts/postinst-intercepts/update_font_cache |  4 ++--
>  2 files changed, 17 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/classes/fontcache.bbclass b/meta/classes/fontcache.bbcl=
ass
> index d122387..8ebdfc4 100644
> --- a/meta/classes/fontcache.bbclass
> +++ b/meta/classes/fontcache.bbclass
> @@ -9,12 +9,23 @@ inherit qemu
>  FONT_PACKAGES ??=3D "${PN}"
>  FONT_EXTRA_RDEPENDS ?=3D "fontconfig-utils"
>  FONTCONFIG_CACHE_DIR ?=3D "${localstatedir}/cache/fontconfig"
> +FONTCONFIG_CACHE_PARAMS ?=3D "-v"
> +# You can change this to e.g. FC_DEBUG=3D16 to debug fc-cache issues,
> +# something has to be set, because qemuwrapper is using this variable af=
ter -E
> +# multiple variables aren't allowed because for qemu they are separated
> +# by comma and in -n "$D" case they should be separated by space
> +FONTCONFIG_CACHE_ENV ?=3D "FC_DEBUG=3D1"
>  fontcache_common() {
> -if [ "x$D" !=3D "x" ] ; then
> -	$INTERCEPT_DIR/postinst_intercept update_font_cache ${PKG} mlprefix=3D$=
{MLPREFIX} bindir=3D${bindir} \
> -		libdir=3D${libdir} base_libdir=3D${base_libdir} fontconfigcachedir=3D$=
{FONTCONFIG_CACHE_DIR}
> +if [ -n "$D" ] ; then
> +	$INTERCEPT_DIR/postinst_intercept update_font_cache ${PKG} mlprefix=3D$=
{MLPREFIX} \
> +		'bindir=3D"${bindir}"' \
> +		'libdir=3D"${libdir}"' \
> +		'base_libdir=3D"${base_libdir}"' \
> +		'fontconfigcachedir=3D"${FONTCONFIG_CACHE_DIR}"' \
> +		'fontconfigcacheparams=3D"${FONTCONFIG_CACHE_PARAMS}"' \
> +		'fontconfigcacheenv=3D"${FONTCONFIG_CACHE_ENV}"'
>  else
> -	fc-cache
> +	${FONTCONFIG_CACHE_ENV} fc-cache ${FONTCONFIG_CACHE_PARAMS}
>  fi
>  }
> =20
> diff --git a/scripts/postinst-intercepts/update_font_cache b/scripts/post=
inst-intercepts/update_font_cache
> index c8c6018..0deab3c 100644
> --- a/scripts/postinst-intercepts/update_font_cache
> +++ b/scripts/postinst-intercepts/update_font_cache
> @@ -1,5 +1,5 @@
>  #!/bin/sh
> =20
> -PSEUDO_UNLOAD=3D1 qemuwrapper -L $D -E LD_LIBRARY_PATH=3D$D/${libdir}:$D=
/${base_libdir}\
> -					$D${bindir}/fc-cache --sysroot=3D$D
> +PSEUDO_UNLOAD=3D1 qemuwrapper -L $D -E LD_LIBRARY_PATH=3D$D/${libdir}:$D=
/${base_libdir} \
> +					-E ${fontconfigcacheenv} $D${bindir}/fc-cache --sysroot=3D$D ${font=
configcacheparams}
>  chown -R root:root $D${fontconfigcachedir}
> --=20
> 2.5.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYKs18ACgkQN1Ujt2V2gBzruACdELQG0oriRHlrWonph3HC3CaF
+XAAniRwzI2kzeSI/2fl8fVaxN2mJz55
=ZXH8
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
