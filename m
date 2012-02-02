Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RssSl-0005ZN-HX
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 09:56:15 +0100
Received: by eekd41 with SMTP id d41so567809eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2012 00:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AIkHMTfHJkj2z8cDnsQ99c6V3XNaGg8gA8xjceR2y3s=;
	b=pR/u4ID9PSPsfMq5FV/57XGw4EW1wHA+VqMqWhD9BSB2BEvKkGuoQ4850uvAskB85r
	qcoO0yWV5lVAmxqoeoffCN5L2+tOxddyK41nDVcV2pkQSHc0pcG/B2LFuJfmoOcQdM8R
	ni3uLiXHvotUJkQelEBVtLnNXCsFT+lF87xFQ=
Received: by 10.14.48.7 with SMTP id u7mr591954eeb.89.1328172499393;
	Thu, 02 Feb 2012 00:48:19 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a58sm6822803eeb.8.2012.02.02.00.48.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Feb 2012 00:48:18 -0800 (PST)
Date: Thu, 2 Feb 2012 09:48:16 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120202084816.GE3697@jama.jama.net>
References: <cover.1328127940.git.otavio@ossystems.com.br>
	<cc36eb9f3e699b9c4478e4de0939e50eb317446f.1328127940.git.otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <cc36eb9f3e699b9c4478e4de0939e50eb317446f.1328127940.git.otavio@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 3/3] rootfs_ipk.bbclass: fix detection of script runtime requirement
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
X-List-Received-Date: Thu, 02 Feb 2012 08:56:15 -0000
X-Groupsio-MsgNum: 16903
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="N1GIdlSm9i+YlY4t"
Content-Disposition: inline

--N1GIdlSm9i+YlY4t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 01, 2012 at 08:27:45PM +0000, Otavio Salvador wrote:
> The code has been broken by 2feba313c991170747381c7cf821a45c2cd04632
> that changed the way this detection has being done.

Wasn't this fixed by=20
http://git.openembedded.org/openembedded-core/commit/?id=3D6d3eac57bdba8e25=
82c210a2f82a3a4546f68581
?

>=20
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/classes/rootfs_ipk.bbclass |   10 ++++++++--
>  1 files changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bb=
class
> index 48fb2fb..0881089 100644
> --- a/meta/classes/rootfs_ipk.bbclass
> +++ b/meta/classes/rootfs_ipk.bbclass
> @@ -74,9 +74,15 @@ fakeroot rootfs_ipk_do_rootfs () {
> =20
>  	${OPKG_POSTPROCESS_COMMANDS}
>  	${ROOTFS_POSTINSTALL_COMMAND}
> -=09
> +
> +	if grep -q Status:.install.ok.unpacked ${IMAGE_ROOTFS}${opkglibdir}stat=
us; then
> +		runtime_script_required=3D1
> +	else
> +		runtime_script_required=3D0
> +	fi
> +
>  	if ${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "true", "fals=
e" ,d)}; then
> -		if grep Status:.install.ok.unpacked ${IMAGE_ROOTFS}${opkglibdir}status=
; then
> +		if [ $runtime_script_required -eq 1 ]; then
>  			echo "Some packages could not be configured offline and rootfs is rea=
d-only."
>  			exit 1
>  		fi
> --=20
> 1.7.2.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--N1GIdlSm9i+YlY4t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8qTdAACgkQN1Ujt2V2gBw3ZQCdE0Bn8BhYFUmUQ9vrHL3hyv/k
2RQAnjfK00qT9T9cYfls+UBhOgd4XhkD
=w5Dh
-----END PGP SIGNATURE-----

--N1GIdlSm9i+YlY4t--
