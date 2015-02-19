Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6FD336B6B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 16:16:57 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id z12so8275227wgg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 08:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=eZilj80opE9x2gd00VHWGTpRQb5T/+R6LvW7uCcDSko=;
	b=S52dSySMzo9E7Ev4wFl6ie8OmzVfWtOyEZ3J8nsbvnfvePznp2P3HEYe2n4O9BTg/I
	jkkIur0Em8RDY70S5n1o+R33PUCxPWMyGP3lJ/uK5L/YhF4Rt+BoPkAbwCQz7/pDpNKe
	gliL4OfDOURNczCrtz2XdKQ3bG5V6flX51nyoNRcb6r/RUN9qizlwEO6jf/q8XoZKabq
	/vhr/1bGmS53DMj5RMTegrG2InqDEUoIL1n494B/S16nMu5AaBHJDPl51vawFQqfXjhJ
	ncpnHolMjsk5tLf93Ac2OdXUgoLB/Hm9fW7kl8nA1DUZY8ZKQpUwfOt2Jo/JhEsvD5t7
	8hvg==
X-Received: by 10.194.201.103 with SMTP id jz7mr11113360wjc.14.1424362618681; 
	Thu, 19 Feb 2015 08:16:58 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fo15sm34844402wic.19.2015.02.19.08.16.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Feb 2015 08:16:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 19 Feb 2015 17:17:01 +0100
To: brendan.le.foll@intel.com
Message-ID: <20150219161701.GE2311@jama>
References: <1424360710-29501-1-git-send-email-brendan.le.foll@intel.com>
	<1424360710-29501-2-git-send-email-brendan.le.foll@intel.com>
MIME-Version: 1.0
In-Reply-To: <1424360710-29501-2-git-send-email-brendan.le.foll@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] openssl: disable SSLv3 by default
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
X-List-Received-Date: Thu, 19 Feb 2015 16:16:58 -0000
X-Groupsio-MsgNum: 62545
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YkJPYEFdoxh/AXLE"
Content-Disposition: inline

--YkJPYEFdoxh/AXLE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 19, 2015 at 03:45:10PM +0000, brendan.le.foll@intel.com wrote:
> From: Brendan Le Foll <brendan.le.foll@intel.com>
>=20
> Because of the SSLv3 POODLE vulnerability, it's preferred to simply disab=
le
> SSLv3 even if patched with the TLS_FALLBACK_SCSV

Please rebase on corrent master, because v1 was already merged (so you
should remove EXTRA_OECONF now).

>=20
> Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com>
> ---
>  meta/recipes-connectivity/openssl/openssl.inc | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes=
-connectivity/openssl/openssl.inc
> index 6eb1b5e..f42b1ea 100644
> --- a/meta/recipes-connectivity/openssl/openssl.inc
> +++ b/meta/recipes-connectivity/openssl/openssl.inc
> @@ -16,6 +16,9 @@ SRC_URI =3D "http://www.openssl.org/source/openssl-${PV=
}.tar.gz \
>  S =3D "${WORKDIR}/openssl-${PV}"
> =20
>  PACKAGECONFIG[perl] =3D ",,,"
> +# Remove this to enable SSLv3. SSLv3 is defaulted to disabled due to the=
 POODLE
> +# vulnerability
> +PACKAGECONFIG[ssl3] =3D "--enable-ssl3, --no-ssl3,,"
> =20
>  AR_append =3D " r"
>  # Avoid binaries being marked as requiring an executable stack since it=
=20
> --=20
> 2.2.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--YkJPYEFdoxh/AXLE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTmDH0ACgkQN1Ujt2V2gBz7AwCfbQFFKhApPeP9EtXy/G1EFVBK
dL8AnjPa4F4uq+IoEqA0Bjy4pSerBk6c
=e37n
-----END PGP SIGNATURE-----

--YkJPYEFdoxh/AXLE--
