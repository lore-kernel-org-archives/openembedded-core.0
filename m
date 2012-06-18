Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SgciR-0005mg-Oj; Mon, 18 Jun 2012 16:14:03 +0200
Received: by wgbdr1 with SMTP id dr1so4795216wgb.24
	for <multiple recipients>; Mon, 18 Jun 2012 07:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ozSwv+E4zrTmk6GVSur5yVncz/Y7yXBzHMm+X2uY3gs=;
	b=tWGA3TCC/goSB2frpNfxcMGsQMtRfmO3q8Y6kCDGPntRzG7G4RCXSRxHcqIAxv4r/N
	yNltUVCxY+FaGkbn2lglmPwoznTMiGkfl0XQFEZU+lKoxYS5leLX41Upx7F7n8o2BkZq
	ALyoYN0unYiI0eye+WsywtAk6nUtgpvjxDjttjoJWOrpVEQnk02hST/hSgNkm0M0YGxC
	zunVGQw6q9O5DBW4pSXDyZljkfHbh+k9HxY/cgzjwbbk3MjVdipBdtMJbMXBABH/nvVj
	K5UGhGBcrJ+QVKDU5YDdSG5ML2Hs7ql1uzxBWr0RuR6jgr9NeuacCzEvfGKET8emvonL
	3BnA==
Received: by 10.180.78.197 with SMTP id d5mr24476010wix.7.1340028201529;
	Mon, 18 Jun 2012 07:03:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id hv7sm45007853wib.0.2012.06.18.07.03.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jun 2012 07:03:19 -0700 (PDT)
Date: Mon, 18 Jun 2012 16:03:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120618140320.GK3178@jama.jama.net>
References: <20120615141252.7DBDA10339@opal>
MIME-Version: 1.0
In-Reply-To: <20120615141252.7DBDA10339@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Saul Wold : busybox: Add check for wifi/bluetooth to enable rfkill
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
X-List-Received-Date: Mon, 18 Jun 2012 14:14:04 -0000
X-Groupsio-MsgNum: 23727
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kswDJesP0akhmDn8"
Content-Disposition: inline

--kswDJesP0akhmDn8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 15, 2012 at 02:12:52PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: f71258f0ef96802e714b6f12ecc8c17842d6cf87
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Df71258f0ef96802e714b6f12ecc8c17842d6cf87
>=20
> Author: Saul Wold <sgw@linux.intel.com>
> Date:   Wed Jun  6 00:27:14 2012 -0700
>=20
> busybox: Add check for wifi/bluetooth to enable rfkill
>=20
> rfkill is a usefull tool when you have a device with bluetooth and wifi e=
nabled

this breaks opkg upgrade if standalone rfkill is already installed:

Configuring busybox.
ln: /usr/sbin/rfkill: File exists
=2E..
update-alternatives: Error: not linking //usr/sbin/rfkill to
=2E./../bin/busybox since //usr/sbin/rfkill exists and is not a link

so rfkill recipe in meta-oe
=2E/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb
needs to be updated to use u-a too.

Cheers,

>=20
> [YOCTO #2494]
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>=20
> ---
>=20
>  meta/recipes-core/busybox/busybox.inc |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/bu=
sybox/busybox.inc
> index 5b83d32..db337ad 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -57,6 +57,8 @@ def features_to_busybox_settings(d):
>  	busybox_cfg('nls',  distro_features, 'CONFIG_LOCALE_SUPPORT', cnf, rem)
>  	busybox_cfg('ipv4', distro_features, 'CONFIG_FEATURE_IFUPDOWN_IPV4', cn=
f, rem)
>  	busybox_cfg('ipv6', distro_features, 'CONFIG_FEATURE_IFUPDOWN_IPV6', cn=
f, rem)
> +	busybox_cfg('wifi', distro_features, 'CONFIG_RFKILL', cnf, rem)
> +	busybox_cfg('bluetooth', distro_features, 'CONFIG_RFKILL', cnf, rem)
>  	return "\n".join(cnf), "\n".join(rem)
> =20
>  # X, Y =3D ${@features_to_uclibc_settings(d)}
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kswDJesP0akhmDn8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/fNSgACgkQN1Ujt2V2gByELgCfYeS2V6DzXqy3W6bkoANjJuQT
UeIAniq/zhjWoA5aHQDxv7wfCbbEcjk9
=YPqQ
-----END PGP SIGNATURE-----

--kswDJesP0akhmDn8--
