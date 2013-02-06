Received: from mail-pa0-f41.google.com ([209.85.220.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U36FK-0001ST-NK
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 15:45:15 +0100
Received: by mail-pa0-f41.google.com with SMTP id fb11so840393pad.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Feb 2013 06:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zwHvmfe8FKGzzClByiUwSx5T1zoVLZuC7i0pE/PvOUM=;
	b=c5voEoKUXWzdQ6NHVelxpxys7Dpcs5Wy0bsMW4CYNKlXcB2SQiHreS3igcHCkqz67i
	JADoMKoon5QsTeFHRxxxDN5aI+XEiNxAOLpV+smhYU/tcBA68WDByYfaM9bwgzohrR7m
	ypFFSBx9PmFoHREoQLlsA3RzRGqr+3cozYCYJ8w1TqYqdaIhfPG2kz/jxxZGZmKd230a
	rdjU6C+3YCOZsPpGCzOHNA8jxvs+Difu7MowGhfKdIGvYJH2wq6//vvRiPBLfQh7w7Qo
	mXupSNbfuWt8apCie8ECcw9V/yej0HnD/u16kGoH7UbbqBKQ8kH7grRvn5kFjPz3Y0fO
	esrA==
X-Received: by 10.66.74.2 with SMTP id p2mr76592856pav.55.1360160958836;
	Wed, 06 Feb 2013 06:29:18 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id d8sm38156485pax.23.2013.02.06.06.29.16
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 06 Feb 2013 06:29:17 -0800 (PST)
Date: Wed, 6 Feb 2013 15:29:10 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130206142910.GY3271@jama>
References: <1360160618-13505-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1360160618-13505-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] bitbake-prserv-tool: show error when export file does not exist
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
X-List-Received-Date: Wed, 06 Feb 2013 14:45:18 -0000
X-Groupsio-MsgNum: 35106
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6h64vBu9tReNbGLX"
Content-Disposition: inline

--6h64vBu9tReNbGLX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 06, 2013 at 03:23:38PM +0100, Martin Jansa wrote:
> * otherwise it shows error about failing import

It fails like this e.g. when someone tries to migrate_localcount without
any entries in cache/bb_persist_data.sqlite3

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  scripts/bitbake-prserv-tool | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/scripts/bitbake-prserv-tool b/scripts/bitbake-prserv-tool
> index 4654e6d..96a3470 100755
> --- a/scripts/bitbake-prserv-tool
> +++ b/scripts/bitbake-prserv-tool
> @@ -61,8 +61,16 @@ do_migrate_localcount ()
>      clean_cache
>      echo "Exporting LOCALCOUNT to AUTOINCs..."
>      bitbake -R conf/migrate_localcount.conf -p
> -    [ ! $? -eq 0 ] && echo "Exporting failed!" && exit 1
> +    [ ! $? -eq 0 ] && echo "Exporting to file $df failed!" && exit 1
> =20
> +    if [ -e $df ];
> +    then
> +        echo "Exporting to file $df succeeded!"
> +    else
> +        echo "Exporting to file $df failed!"
> +        exit 1
> +    fi
> +   =20
>      echo "Importing generated AUTOINC entries..."
>      [ -e $df ] && do_import $df
> =20
> --=20
> 1.8.1.2
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6h64vBu9tReNbGLX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlESaLYACgkQN1Ujt2V2gByZYQCglLVtYXjFon11eOSSYFZOIQaf
XcAAn2vvwWcDEXvExxUqK8s+JySSJKYC
=HEUI
-----END PGP SIGNATURE-----

--6h64vBu9tReNbGLX--
