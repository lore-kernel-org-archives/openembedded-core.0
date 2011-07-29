Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qmhea-00036y-DK
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 09:38:40 +0200
Received: by fxg11 with SMTP id 11so2267573fxg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2011 00:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PXgm9MGArpyPft6TK1bC3oV9jmLmvI2R0VIsQjy4W2o=;
	b=DpChfaJDznRaOFAOyVdH5SMNepILEB11EpDcDUqXsTbr47oT1yG3lKTjY/uZ6Qi5IO
	PTqhlEyzSQX+wy1w+JArZWzxcEe9j7AwEztzEPW9doUHGQ8ik4Iha8tWJF3xwmDTtH6i
	3KUrX8iXcg6psD4kgItsyREu12hggok7IS9dI=
Received: by 10.223.127.215 with SMTP id h23mr1308941fas.126.1311924864017;
	Fri, 29 Jul 2011 00:34:24 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 12sm926763faz.8.2011.07.29.00.34.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 29 Jul 2011 00:34:22 -0700 (PDT)
Date: Fri, 29 Jul 2011 09:34:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20110729073415.GM15286@jama.jama.net>
References: <1311923851-6341-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1311923851-6341-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] eglibc: unify eglibc-utils/${PN}-utils and remove PACKAGES from eglibc.inc
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
X-List-Received-Date: Fri, 29 Jul 2011 07:38:40 -0000
X-Groupsio-MsgNum: 7057
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C01fF7hLGvN0zd9s"
Content-Disposition: inline

--C01fF7hLGvN0zd9s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 29, 2011 at 09:17:31AM +0200, Martin Jansa wrote:
> * PACKAGES were defined in eglibc.inc as well as eglibc-package.inc, defi=
nition
>   from eglibc.inc was overriden from recipes including eglibc.inc only
> * 37ff0fea8f7180b1a9d91d24dfe1735730427497 changed RPROVIDES_eglibc-utils,
>   but ie FILES_ were still using eglibc-utils instead of ${PN}-utils, uni=
fy
>   all eglibc-utils

BTW: there is still problem with ie
RPROVIDES_${PN}-utils =3D "glibc-utils"
leading to
ERROR: Trying to resolve runtime dependency glibc-utils resulted in conflic=
ting PREFERRED_PROVIDER entries being found.
The providers found were: ['virtual:nativesdk:/OE/shr-core/openembedded-cor=
e/meta/recipes-core/eglibc/eglibc_2.13.bb', '/OE/shr-core/openembedded-core=
/meta/recipes-core/eglibc/eglibc_2.13.bb']
The PREFERRED_PROVIDER entries resulting in this conflict were: ['PREFERRED=
_PROVIDER_virtual/libc-nativesdk =3D eglibc-nativesdk', 'PREFERRED_PROVIDER=
_virtual/libc =3D eglibc']
NOTE: multiple providers are available for runtime glibc-utils (eglibc, egl=
ibc-nativesdk, external-csl-toolchain, external-poky-toolchain)
NOTE: consider defining a PREFERRED_PROVIDER entry to match glibc-utils

now with glibc recipes removed, do we need to RPROVIDE this or can we fix r=
ecipes=20
RDEPENDing on glibc-utils to use eglibc-utils directly?

otherwise we should fix right side to use ${PN/eglibc/glibc} to keep
eglibc-nativesdk from providing glibc-utils (glibc-nativesdk-utils only).

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--C01fF7hLGvN0zd9s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk4yYncACgkQN1Ujt2V2gBxdPACeNUCwn3Yf/I69b/ClDXVI7N+5
tFgAoLNSQSbNlJ0wI5oDGQKdRP0P4wbR
=0pWX
-----END PGP SIGNATURE-----

--C01fF7hLGvN0zd9s--
