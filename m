Return-Path: <clopez@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 12FA471BD4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 00:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:Cc:References:To:Subject;
	bh=QDML9zz7qN/GrgMD3tK1jC3xRNo9TPPN7nam9QdkVtg=; 
	b=VuZSj43TFiddLSlWX41HODSf80z17pJuOar+2klCmzvmljNrFpnSuV9w68uvhJihgLBqBPhPxrBdlTu64LeORwT+xNwQE6rBHG4YjwnVN8lj81kFc8uxJtCJce9sfM94bDzIP14TJSfoflMMvtnQZeaRZYyLjQ4TB+nuTP6FvO60XycGGmN6GXV5eh4wTFKQ83toom4XW5IddCvtousZjubU7yXfojup/67wf6SpgwCKA8rwONVOLXX5HaDm7B8oFEASii17FYWNl78DbzK352JDmTvWq4GTEg66w1FlnvwfYjsZsTcjOC8AYlJMyRKnYSNIoobQ2qxuKZ07Hldhfw==;
Received: from 1.14.117.91.dynamic.reverse-mundo-r.com ([91.117.14.1]
	helo=[192.168.0.23]) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1djxHv-0004YX-5Q; Tue, 22 Aug 2017 02:43:23 +0200
To: openembedded-core@lists.openembedded.org
References: <20170821190501.19909-1-clopez@igalia.com>
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
Openpgp: id=B5D2B50BC48EC7F1EE90D9AB965089CE6B95F882;
	url=http://key.neutrino.es
Organization: Igalia S.L.
Mail-Followup-To: openembedded-core@lists.openembedded.org,
	Christopher Larson <chris_larson@mentor.com>
Message-ID: <b1beb393-07fa-7061-eb8f-1cb4e51475fd@igalia.com>
Date: Tue, 22 Aug 2017 02:43:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170821190501.19909-1-clopez@igalia.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] systemd: don't symlink /etc/resolv.conf if resolved is disabled
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
X-List-Received-Date: Tue, 22 Aug 2017 00:43:23 -0000
X-Groupsio-MsgNum: 101776
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="BKSMD7hRLXTLgNQpx83CPUwbBpJIHaUHl"

--BKSMD7hRLXTLgNQpx83CPUwbBpJIHaUHl
Content-Type: multipart/mixed; boundary="bHBifKIloex0gcQPitKB8Mu6Jo2Gi1pMV";
 protected-headers="v1"
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-core@lists.openembedded.org
Cc: Christopher Larson <chris_larson@mentor.com>
Message-ID: <b1beb393-07fa-7061-eb8f-1cb4e51475fd@igalia.com>
Subject: Re: [OE-core] [PATCH] systemd: don't symlink /etc/resolv.conf if
 resolved is disabled
References: <20170821190501.19909-1-clopez@igalia.com>
In-Reply-To: <20170821190501.19909-1-clopez@igalia.com>

--bHBifKIloex0gcQPitKB8Mu6Jo2Gi1pMV
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 21/08/17 21:05, Carlos Alberto Lopez Perez wrote:
>  * symlinking /etc/resolv.conf to /run/systemd/resolve/resolv.conf
>    when resolved is not enabled is wrong, as this prevents network
>    manager from handling the resolv.conf file itself and breaking
>    DNS resolution.
>=20
>    See: NetworkManager.conf manpage or https://git.io/v5UJQ
>=20
> Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
> ---
>  meta/recipes-core/systemd/systemd_234.bb | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-co=
re/systemd/systemd_234.bb
> index 4560cf4175..dddad62941 100644
> --- a/meta/recipes-core/systemd/systemd_234.bb
> +++ b/meta/recipes-core/systemd/systemd_234.bb
> @@ -235,12 +235,7 @@ do_install() {
>  	if [ -s ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf ]; then
>  		${@bb.utils.contains('PACKAGECONFIG', 'networkd', ':', 'sed -i -e "\=
$ad /run/systemd/netif/links 0755 root root -" ${D}${exec_prefix}/lib/tmp=
files.d/systemd.conf', d)}
>  	fi
> -	if ! ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true', 'false=
', d)}; then
> -		echo 'L! ${sysconfdir}/resolv.conf - - - - ../run/systemd/resolve/re=
solv.conf' >>${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
> -		echo 'd /run/systemd/resolve 0755 root root -' >>${D}${exec_prefix}/=
lib/tmpfiles.d/systemd.conf
> -		echo 'f /run/systemd/resolve/resolv.conf 0644 root root' >>${D}${exe=
c_prefix}/lib/tmpfiles.d/systemd.conf
> -		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-co=
nf.systemd
> -	else
> +	if ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true', 'false',=
 d)}; then
>  		sed -i -e "s%^L! /etc/resolv.conf.*$%L! /etc/resolv.conf - - - - ../=
run/systemd/resolve/resolv.conf%g" ${D}${exec_prefix}/lib/tmpfiles.d/etc.=
conf
>  		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-co=
nf.systemd
>  	fi
>=20

Looking at the previous history it seems symlinking /etc/resolv.conf
when not enabling resolved was done originally to allow updating
resolv.conf on read-only-rootfs filesystems ( commit 7f087f161e ).

So the above patch is not right, as it will break that.

An idea is to symlink /etc/resolv.conf to a different filename in /run
when resolved is not enabled.


--bHBifKIloex0gcQPitKB8Mu6Jo2Gi1pMV--

--BKSMD7hRLXTLgNQpx83CPUwbBpJIHaUHl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: You can fetch my GnuPG key from http://key.neutrino.es

iQIzBAEBCgAdFiEEtdK1C8SOx/HukNmrllCJzmuV+IIFAlmbfiEACgkQllCJzmuV
+IIMLxAArU1WAfiRN5p9g1xX5a8i7X5kG2yMGO3uLEo5M7WdMyV6Gof9Ou/8htVk
Z2RBmrspl7HimfiQYFPtgW7xb9NZWmw2BF4FXH1+srl8eQITQ5VseEAqnsJtqmEd
A8L/9y0zAIgg6ekyWj+ZAK5NUjNxNLASXB9wCaqyZ/EXMlP2d/UDGwP5tZGaIPXh
sa1dXqmW/Qkczpzxq0XqKTownLqXfhOIYithCi3AIlilzOouDaCW9hro591x0LPJ
efs6mW3huH5i2QCsUUz/JY4F3J5K/j7UE+M04iMtyzaGwXNdgShy/r9jTe2JEKFY
BNssPVd60m/X+PhSyjhk+CAItGlZ3oNJH7wDQBYN4a4kwys7s9duv1ZQV78wav6x
i06O1R7UoNzD0LmXR6YV1xNMINWyoYuxMFVS2DKI+H9LQq50JDe4I0yaiaNag5ba
xT5c/r32tXwo6xHM+0dOXYAwiX/hRe1VAgscZ5mCUXjTsc+HBID4PkEtlYI4//qY
eIOxDVox4s+3VtPs5hm72x1ndJmWHDny+4AfQ4Fw0IPPkrfUad2rHUDbfB3aDiYz
1oFav/SuCbRAmEUqpHhDqe1A8p2LRcCJBC+wwhuX/iKCUYIfJyihBW38dNGztYXL
+0uZ9sdbOaH18rImpdOIOyTYoBkMGNd2eUrfAR7Ukrc7gDFanI8=
=qTRw
-----END PGP SIGNATURE-----

--BKSMD7hRLXTLgNQpx83CPUwbBpJIHaUHl--
