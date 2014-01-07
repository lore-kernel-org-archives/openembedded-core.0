Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id DE4A96B872
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2014 14:35:50 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id o10so245546eaj.32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jan 2014 06:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PUkUl9vsTgU0Sf+/ZqnsMTkkgyvkvj7cpqr1XWamWOs=;
	b=DwuigXrUWkx20CcZ6V+effSuXwlOABzmmNKYWp3rk2uHcA8GvsyN5uNhbcHtHJzLC1
	q3j2e4YNp0wkjm23vUUnyB1g/0bE0pNSq1M/dgi8B2G408NDBvg8FQqXXJEEOEQhUhx/
	SZPqg+WeNFLWE0aR9jBdbYsO95LtizXsVlqk73TIM61ABBK+EKFLwU2x7v9yPQu617wL
	KES8R0D0yK6tNa2/KjNDK7qbF/5CdJE+WpFf403DHZBQaOyBD1YPq0GlL/aKhHNB7VmY
	nKIsNMAKGdbP/vQs2Fky2zmRJqFZ5BRB5Xj2tJiG28GyVU6l1d0Dg/x0V6vngVQP+AUs
	qYxQ==
X-Received: by 10.15.111.201 with SMTP id cj49mr40393593eeb.56.1389105351298; 
	Tue, 07 Jan 2014 06:35:51 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	o1sm180539695eea.10.2014.01.07.06.35.49 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Jan 2014 06:35:50 -0800 (PST)
Date: Tue, 7 Jan 2014 15:35:58 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Message-ID: <20140107143558.GQ3709@jama>
References: <1389104317-11042-1-git-send-email-alexandre.belloni@free-electrons.com>
MIME-Version: 1.0
In-Reply-To: <1389104317-11042-1-git-send-email-alexandre.belloni@free-electrons.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: darren.hart@intel.com, Darren Hart <dvhart@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel: use oldnoconfig instead of yes '' | make oldconfig
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
X-List-Received-Date: Tue, 07 Jan 2014 14:35:51 -0000
X-Groupsio-MsgNum: 48657
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aH/0uqREc1VzwMkO"
Content-Disposition: inline

--aH/0uqREc1VzwMkO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 07, 2014 at 03:18:37PM +0100, Alexandre Belloni wrote:
> When using a defconfig, using yes '' | make oldconfig may not result in
> the correct configuration being set. For example:

>  $ grep USB_ETH .config
>  CONFIG_USB_ETH=3Dy
>  CONFIG_USB_ETH_RNDIS=3Dy
>  CONFIG_USB_ETH_EEM=3Dy
>  $ make savedefconfig
>  scripts/kconfig/conf --savedefconfig=3Ddefconfig Kconfig
>  $ cp defconfig .config
>  =E2=80=98defconfig=E2=80=99 -> =E2=80=98.config=E2=80=99
>  $ yes '' | make oldconfig
>  [...]
>  #
>  # configuration written to .config
>  #
>  $ grep USB_ETH .config
>  CONFIG_USB_ETH=3Dm
>  CONFIG_USB_ETH_RNDIS=3Dy
>  CONFIG_USB_ETH_EEM=3Dy
>=20
> Using make olddefconfig solves that but we'll use oldnoconfig for
> backward compatibility with older kernels.

Looks good, I have few kernel recipes where I had to fixup resulting
=2Econfig after "make savedefconfig", "yes '' | make oldconfig" combo
exactly because of some =3Dy changing to -m.

1) Do you know since when oldnoconfig is supported?

IIRC oldest kernel I've in BSPs is 2.6.24.=20

2) Could you send similar patch for
meta-openembedded/meta-oe/recipes-kernel/linux/linux.inc
?

>  $ cp defconfig .config
>  =E2=80=98defconfig=E2=80=99 -> =E2=80=98.config=E2=80=99
>  $ make oldnoconfig
>  scripts/kconfig/conf --olddefconfig Kconfig
>  #
>  # configuration written to .config
>  #
>  $ grep USB_ETH .config
>  CONFIG_USB_ETH=3Dy
>  CONFIG_USB_ETH_RNDIS=3Dy
>  CONFIG_USB_ETH_EEM=3Dy
>=20
> For more information, please refer to:
> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=
=3Dfbe98bb9ed3dae23e320c6b113e35f129538d14a
>=20
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>  meta/classes/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 61a6d102d7a8..644d7937923d 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -313,7 +313,7 @@ kernel_do_configure() {
>  	if [ -f "${WORKDIR}/defconfig" ] && [ ! -f "${B}/.config" ]; then
>  		cp "${WORKDIR}/defconfig" "${B}/.config"
>  	fi
> -	yes '' | oe_runmake oldconfig
> +	oe_runmake oldnoconfig
>  }
> =20
>  do_savedefconfig() {
> --=20
> 1.8.3.2
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aH/0uqREc1VzwMkO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLMEM4ACgkQN1Ujt2V2gBwbVACfUc0I4QmWWUg0lQsEqrSotKE7
D8gAni8bgmSYo+UBlrGMS41vpwH0r8WZ
=k9Z+
-----END PGP SIGNATURE-----

--aH/0uqREc1VzwMkO--
