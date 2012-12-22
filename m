Received: from mail-ee0-f48.google.com ([74.125.83.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TmVgz-00020z-Cn
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Dec 2012 21:29:09 +0100
Received: by mail-ee0-f48.google.com with SMTP id b57so3057414eek.35
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Dec 2012 12:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jtzT2YoVydbbkFMPVO1T4mRCRD7JHXJovfya13FEDJ8=;
	b=HPFkiHPNRblOv3T3FtJhB+JIQVuXfcPfSQ1BADO5fLOE/XPpIXMykW9CE4fUPG0VOO
	FYtPYjhBwYUdUF2RFS9cyedUsXlkfSDziijmPAQnBZUz+I+Tj2LuZsX7xL4WnBq0Lb5n
	5HNOOHUP5gQ7WNjA9pXIvttAP5V2aZrH6UjmrlH42K7nxz6nUOBiH67KDCOPkGyUoArr
	7dtc6RtGmP4luq7D33XcejHW85WLOxgjvURU14P9OEecmNs3sHaCD1aq+VHWU3HkKtip
	NalUSSwGmVVEw4vDpirj5YdbTIl6CPH07tIJH6UDdPpFp1rLN/jnZyLdBd/M7fUqKtkR
	v/ig==
X-Received: by 10.14.203.2 with SMTP id e2mr42277267eeo.20.1356207262002;
	Sat, 22 Dec 2012 12:14:22 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id b49sm30254770eem.16.2012.12.22.12.14.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Dec 2012 12:14:21 -0800 (PST)
Date: Sat, 22 Dec 2012 21:14:18 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20121222201418.GE8988@jama.palm1.palmone.com>
References: <1356206329-12627-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1356206329-12627-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] gtk-icon-cache: don't call gtk-update-icon-cache on files
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
X-List-Received-Date: Sat, 22 Dec 2012 20:29:09 -0000
X-Groupsio-MsgNum: 33025
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="idY8LE8SD6/8DnRI"
Content-Disposition: inline

--idY8LE8SD6/8DnRI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 22, 2012 at 08:58:49PM +0100, Martin Jansa wrote:
> * check if icondir is directory before calling gtk-update-icon-cache, lik=
e all other calls do
> * fixes:
>   | > Executing update_icon_cache
>   | + chmod +x update_icon_cache
>   | + ./update_icon_cache
>   | gtk-update-icon-cache.real: Failed to open file /tmp-eglibc/work/qemu=
arm-oe-linux-gnueabi/shr-image-all/2.0-r20/rootfs/usr/share/icons/enjoy.png=
/.icon-theme.cache : Not a directory
>   | gtk-update-icon-cache.real: Failed to open file /tmp-eglibc/work/qemu=
arm-oe-linux-gnueabi/shr-image-all/2.0-r20/rootfs/usr/share/icons/monav.png=
/.icon-theme.cache : Not a directory
>   | gtk-update-icon-cache.real: Failed to open file /tmp-eglibc/work/qemu=
arm-oe-linux-gnueabi/shr-image-all/2.0-r20/rootfs/usr/share/icons/orrery.pn=
g/.icon-theme.cache : Not a directory

Be aware that you need to manually remove
$INTERCEPT_DIR/update_icon_cache
otherwise such broken script is kept forever

gtk_icon_cache_postinst() {
if [ "x$D" !=3D "x" ]; then
    if [ ! -f $INTERCEPT_DIR/update_icon_cache ]; then
        cat << "EOF" > $INTERCEPT_DIR/update_icon_cache

>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/gtk-icon-cache.bbclass | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-=
cache.bbclass
> index f87a30f..7c7dd78 100644
> --- a/meta/classes/gtk-icon-cache.bbclass
> +++ b/meta/classes/gtk-icon-cache.bbclass
> @@ -12,7 +12,9 @@ if [ "x$D" !=3D "x" ]; then
>  gdk-pixbuf-query-loaders --update-cache
> =20
>  for icondir in $D/usr/share/icons/*/ ; do
> -	gtk-update-icon-cache -fqt  $icondir
> +    if [ -d $icondir ] ; then
> +        gtk-update-icon-cache -fqt  $icondir
> +    fi
>  done
>  EOF
>      fi
> --=20
> 1.8.0.2
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--idY8LE8SD6/8DnRI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDWFJoACgkQN1Ujt2V2gBwNWQCguRSZ63VJMZrhjN/7YkUZpCxj
IjEAn1GyfzzCAPWnr99KaRUW5Rf8y3rs
=KwrF
-----END PGP SIGNATURE-----

--idY8LE8SD6/8DnRI--
