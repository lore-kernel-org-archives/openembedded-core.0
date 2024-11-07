Return-Path: <paul.barker.ct@bp.renesas.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E878ED5D681
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 18:03:36 +0000 (UTC)
Received: from relmlie6.idc.renesas.com (relmlie6.idc.renesas.com [210.160.252.172])
 by mx.groups.io with SMTP id smtpd.web11.78933.1731002608350179189
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Nov 2024 10:03:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: bp.renesas.com, ip: 210.160.252.172, mailfrom: paul.barker.ct@bp.renesas.com)
X-IronPort-AV: E=Sophos;i="6.12,135,1728918000"; 
   d="asc'?scan'208";a="228160153"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 08 Nov 2024 03:03:26 +0900
Received: from [10.226.92.131] (unknown [10.226.92.131])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id A70D3400964C;
	Fri,  8 Nov 2024 03:03:18 +0900 (JST)
Message-ID: <f2cae49d-a05d-49c4-89e1-fa4ce9b0d5f0@bp.renesas.com>
Date: Thu, 7 Nov 2024 18:03:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] classes-recipe/core-image: drop debug-tweaks
 IMAGE_FEATURE
To: Ross Burton <ross.burton@arm.com>,
 openembedded-core@lists.openembedded.org
References: <20241107134752.2071720-1-ross.burton@arm.com>
Content-Language: en-GB
From: Paul Barker <paul.barker.ct@bp.renesas.com>
In-Reply-To: <20241107134752.2071720-1-ross.burton@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YUbS0ZhFGnf3q0X2GO1DMujz"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 18:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206850

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YUbS0ZhFGnf3q0X2GO1DMujz
Content-Type: multipart/mixed; boundary="------------0kw917XV0bhKIvI2ofRevhwU";
 protected-headers="v1"
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Ross Burton <ross.burton@arm.com>,
 openembedded-core@lists.openembedded.org
Message-ID: <f2cae49d-a05d-49c4-89e1-fa4ce9b0d5f0@bp.renesas.com>
Subject: Re: [PATCH] classes-recipe/core-image: drop debug-tweaks
 IMAGE_FEATURE
References: <20241107134752.2071720-1-ross.burton@arm.com>
In-Reply-To: <20241107134752.2071720-1-ross.burton@arm.com>

--------------0kw917XV0bhKIvI2ofRevhwU
Content-Type: multipart/mixed; boundary="------------Qv4j0YbnkTFvTVnq4rEyj62G"

--------------Qv4j0YbnkTFvTVnq4rEyj62G
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 07/11/2024 13:47, Ross Burton wrote:
> Remove the 'debug-tweaks' IMAGE_FEATURE. It sounds friendly and kind to=

> developers, but it results primarily in an image which root can login
> remotely without a password.  This is incredibly useful for local
> development and testing purposes, but we really want to be explicit tha=
t
> this is what is happening instead of hiding it behind a vague "debug
> tweaks" statement.
>=20
> To preserve the eixsting behaviour, debug-tweaks should be replaced wit=
h
> these features:
>=20
>   allow-empty-password empty-root-password allow-root-login post-instal=
l-logging
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes-recipe/core-image.bbclass          | 11 ++++++-----
>  meta/classes-recipe/image.bbclass               |  2 +-
>  meta/classes-recipe/rootfs-postcommands.bbclass | 16 ++++++++--------
>  3 files changed, 15 insertions(+), 14 deletions(-)
>=20
> diff --git a/meta/classes-recipe/core-image.bbclass b/meta/classes-reci=
pe/core-image.bbclass
> index 40fc15cb04f..4072e420c58 100644
> --- a/meta/classes-recipe/core-image.bbclass
> +++ b/meta/classes-recipe/core-image.bbclass
> @@ -26,11 +26,6 @@
>  # - ssh-server-openssh  - SSH server (openssh)
>  # - hwcodecs            - Install hardware acceleration codecs
>  # - package-management  - installs package management tools and preser=
ves the package manager database
> -# - debug-tweaks        - makes an image suitable for development, e.g=
=2E allowing passwordless root logins
> -#   - empty-root-password
> -#   - allow-empty-password
> -#   - allow-root-login
> -#   - post-install-logging
>  # - serial-autologin-root - with 'empty-root-password': autologin 'roo=
t' on the serial console
>  # - dev-pkgs            - development packages (headers, etc.) for all=
 installed packages in the rootfs
>  # - dbg-pkgs            - debug symbol packages for all installed pack=
ages in the rootfs
> @@ -43,6 +38,12 @@
>  # - stateless-rootfs    - systemctl-native not run, image populated by=
 systemd at runtime
>  # - splash              - bootup splash screen
>  #
> +# Features for development purposes (previously part of debug-tweaks):=

> +# - empty-root-password  - the root user has no password set
> +# - allow-empty-password - users can have an empty password
> +# - allow-root-login     - the root user can login

We should clarify that this means allow root to login via SSH, login via
the console doesn't depend on this feature.

Other than that, this is a definite improvement. Ship it!

Thanks,

--=20
Paul Barker
--------------Qv4j0YbnkTFvTVnq4rEyj62G
Content-Type: application/pgp-keys; name="OpenPGP_0x27F4B3459F002257.asc"
Content-Disposition: attachment; filename="OpenPGP_0x27F4B3459F002257.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D
=3DsIIN
-----END PGP PUBLIC KEY BLOCK-----

--------------Qv4j0YbnkTFvTVnq4rEyj62G--

--------------0kw917XV0bhKIvI2ofRevhwU--

--------------YUbS0ZhFGnf3q0X2GO1DMujz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSiu8gv1Xr0fIw/aoLbaV4Vf/JGvQUCZy0A5QUDAAAAAAAKCRDbaV4Vf/JGvXTJ
AQCOhMKzRY8oq8ljUYU4pYmM3G6iY0p+J361odTHb8mmtAD+MFlGIVJwvyFu2WBODxGfr+98hP6a
cHv9u6VPgjtL7Q0=
=v5QU
-----END PGP SIGNATURE-----

--------------YUbS0ZhFGnf3q0X2GO1DMujz--

