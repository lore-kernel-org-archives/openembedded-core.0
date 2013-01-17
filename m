Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TvlzQ-0001jH-3w
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 10:42:29 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so1024063dak.34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2013 01:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=7QqwykdzkFKNavbKGhmiCSkgaoESsLnDO8Fp7MeiG4A=;
	b=KvfiVIkzEftVJTZne/fkwd8OT3TIxpTJJkBbSB/FBaLF0bHBadkwBtZUiu/uhnDjZO
	A2YMxYQ9g43vvaPvsKDgPnSDePAPqDYPz7JCQWn4XtcucRTud895NXlKWlFJ/oSmFsHt
	fVWHeJ03WlUG53EydJM3b62RZh71sVKjdGZcUe9xWS/B80LigmDSqBoXaW+0LEHPsroy
	CWTVsU9yFOstAtitHYGNGMkMPs7rHjoBkTJoE7GEfJTNHsHX/APNzl3HSVpagaqBDKkF
	CHwq8kfXEe879kU7xWpclnbcS6aCBGExKexZ1zNof9W90LLWzwMcHzg1uI79ZoCgCK0V
	63xg==
X-Received: by 10.66.84.195 with SMTP id b3mr12054120paz.30.1358414824459;
	Thu, 17 Jan 2013 01:27:04 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ho4sm747916pbc.54.2013.01.17.01.27.02
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 17 Jan 2013 01:27:03 -0800 (PST)
Date: Thu, 17 Jan 2013 10:26:58 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20130117092658.GA3067@jama>
References: <cover.1358406049.git.hongxu.jia@windriver.com>
	<4dc1347ed4057656a542263878aeeadf768dd2e9.1358406049.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <4dc1347ed4057656a542263878aeeadf768dd2e9.1358406049.git.hongxu.jia@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] gtk-icon-cache.bbclass:fix support postrm at image creation time
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
X-List-Received-Date: Thu, 17 Jan 2013 09:42:30 -0000
X-Groupsio-MsgNum: 33934
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Content-Disposition: inline

--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 17, 2013 at 03:07:19PM +0800, Hongxu Jia wrote:
> The gtk_icon_cache_postrm failed at image creation time because ${D} is n=
ot
> assigned as the prefix of icondir.

Some packages are removed at image creation time? Why is postrm
executed?

And why don't use use $D in both cases (when empty and not empty) those
2 for cycles look the same.
=20
Cheers,

> [YOCTO #3633]
>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/classes/gtk-icon-cache.bbclass |    9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-=
cache.bbclass
> index 7c7dd78..4499782 100644
> --- a/meta/classes/gtk-icon-cache.bbclass
> +++ b/meta/classes/gtk-icon-cache.bbclass
> @@ -32,6 +32,15 @@ done
>  }
> =20
>  gtk_icon_cache_postrm() {
> +if [ "$D" !=3D "" ]; then
> +    for icondir in $D/usr/share/icons/* ; do
> +        if [ -d $icondir ] ; then
> +            gtk-update-icon-cache -qt  $icondir
> +        fi
> +    done
> +    exit 0
> +fi
> +
>  for icondir in /usr/share/icons/* ; do
>      if [ -d $icondir ] ; then
>          gtk-update-icon-cache -qt  $icondir
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD3w+IACgkQN1Ujt2V2gBx8qQCeKbX1Ufd9KUrMvFKhZVPP/DGf
or4An0C5v5wK8Wq/eJ+MRGkkCL+vpmn6
=oO6R
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
