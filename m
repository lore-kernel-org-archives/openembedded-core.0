Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SDZQK-0001Sz-Qi
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 12:51:16 +0200
Received: by wgbdr12 with SMTP id dr12so390942wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 03:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0vlaPeZqLwb5EbTnhZRBoHG5t8nler2vNZUF57Glsbk=;
	b=aCUuXoZ4qoXByz1aDkndV7HqJ0hTHnoEt4ZksJ5qroPWosyp07sskqmxsJiTaK/COa
	lYLclJJZVHW+itli9/yoD2d9XWpA9dPKYRw1jY9rUKeLDqtEqyZ/vqRMRZhmgblQpfxG
	zwjwLvFKhRRn30PnQSiVz3w1yUjGDdZgYOwzP2tr5Z7KTrtoDhZALhZuGGFeNVdVOX/x
	dLDwOZfZUZmde9wsJKgE5wlljQc4FH038x3+fjr/U2Sy9vpUX1Z0Ryhj5HCD4JXLHP06
	dY4g1b+DUEO74VgJjZG88QKN7CHPB24p8ZDec/h/hbNWSTmMyfkRnP+0TuU8DkkRNo38
	1SwA==
Received: by 10.180.102.129 with SMTP id fo1mr5196886wib.6.1333104132518;
	Fri, 30 Mar 2012 03:42:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ex2sm8641931wib.8.2012.03.30.03.42.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Mar 2012 03:42:11 -0700 (PDT)
Date: Fri, 30 Mar 2012 12:42:14 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120330104214.GQ25815@jama.jama.net>
References: <1333101001-13652-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1333101001-13652-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] rootfs_ipk: don't echo opkg-cl output to log.do_rootfs
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
X-List-Received-Date: Fri, 30 Mar 2012 10:51:17 -0000
X-Groupsio-MsgNum: 20025
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cnBsrynPgIOyCJkL"
Content-Disposition: inline

--cnBsrynPgIOyCJkL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 30, 2012 at 11:50:01AM +0200, Martin Jansa wrote:
> * log_check can find some files with ERR or Fail substring e.g. in "Sourc=
e: " field
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/rootfs_ipk.bbclass |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bb=
class
> index 13bd4bf..8685fa3 100644
> --- a/meta/classes/rootfs_ipk.bbclass
> +++ b/meta/classes/rootfs_ipk.bbclass
> @@ -128,9 +128,11 @@ list_installed_packages() {
> =20
>  get_package_filename() {
>  	info=3D`opkg-cl ${IPKG_ARGS} info $1 | grep -B 7 -A 7 "^Status.* \(\(in=
stalled\)\|\(unpacked\)\)" || true`
> +	set +x

This needs to be before opkg-cl call as set -x prints info assignment
too.

Will resend v2 after someone confirms it's fine now (I don't have test
case for this here).

>  	name=3D`echo "${info}" | awk '/^Package/ {printf $2"_"}'`
>  	name=3D$name`echo "${info}" | awk -F: '/^Version/ {printf $NF"_"}' | se=
d 's/^\s*//g'`
>  	name=3D$name`echo "${info}" | awk '/^Archi/ {print $2".ipk"}'`
> +	set -x
> =20
>  	fullname=3D`find ${DEPLOY_DIR_IPK} -name "$name" || true`
>  	if [ "$fullname" =3D "" ] ; then
> --=20
> 1.7.8.5
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cnBsrynPgIOyCJkL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk91jgYACgkQN1Ujt2V2gByiXgCguIXiZvfUk/gxfqQ5QH8rua4c
/88AnROLiI5e5PJ4hrl2KZhMJ+Yh1Hkx
=bxKZ
-----END PGP SIGNATURE-----

--cnBsrynPgIOyCJkL--
