Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 21BD973E11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Aug 2015 07:19:40 +0000 (UTC)
Received: by pdbmi9 with SMTP id mi9so4128744pdb.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Aug 2015 00:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=WR14orle1F9PLrdEDPds6MacSL3+zwtExDW67B8fnxM=;
	b=tnVtpwPRMUlA3rkMPdwxaJGPhUNqQ/c2HblBf6b7unKdZj4LxNQElUYl7nBW64jt96
	CcqqUiDDDs/uXpvBQewfwgtXJ4g7uxAUbK+FcoCRDLIUTfrRTv0o8CuI19jdhDK4upEG
	H/QfTbYVzqB57Mk3CxtaG5eOtYzzH5cDzmxqtStEXSlDI8pN3mSmKRbRvRX39EFkTUPy
	0YFop982Xwe0crygmOm+AzoPIk0PauaymBpCVozu6//+ktdQGDgakxUyxzxh7CbkrBjO
	rnMM2fSjAhOiYx12Cmo2l+ier4FkcfutHP5xrdyZChAjSwqiOWpdOSo6chJL4v3A0tTy
	emrA==
X-Received: by 10.70.65.99 with SMTP id w3mr106051070pds.132.1439709581014;
	Sun, 16 Aug 2015 00:19:41 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:f5b7:823c:7f00:1ba7?
	([2601:646:8601:4580:f5b7:823c:7f00:1ba7])
	by smtp.gmail.com with ESMTPSA id
	tt8sm10616146pbc.49.2015.08.16.00.19.39
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 16 Aug 2015 00:19:40 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1435282205-21586-1-git-send-email-rongqing.li@windriver.com>
Date: Sun, 16 Aug 2015 00:19:35 -0700
Message-Id: <4340E4E3-8643-492E-BE12-84592E1007CD@gmail.com>
References: <1435282205-21586-1-git-send-email-rongqing.li@windriver.com>
To: rongqing.li@windriver.com
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][v5] mmc-utils: fix the building failure when DEBUG_BUILD is 1
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
X-List-Received-Date: Sun, 16 Aug 2015 07:19:42 -0000
X-Groupsio-MsgNum: 69482
Content-Type: multipart/signed;
	boundary="Apple-Mail=_45EB6B5A-D65D-4B1C-BA44-B9E35400BD3E";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_45EB6B5A-D65D-4B1C-BA44-B9E35400BD3E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jun 25, 2015, at 6:30 PM, rongqing.li@windriver.com wrote:
>=20
> From: Roy Li <rongqing.li@windriver.com>
>=20
> Remove -Werror, since it is suitable to develop only; otherwise when
> gcc adds -O0 option to compile codes, the error will be generated
> since the warning:
>  //#  warning _FORTIFY_SOURCE requires compiling with optimization =
(-O)
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
> meta/recipes-devtools/mmc/mmc-utils_git.bb | 4 ++++
> 1 file changed, 4 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb =
b/meta/recipes-devtools/mmc/mmc-utils_git.bb
> index bdb4fed..8950360 100644
> --- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
> +++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
> @@ -13,6 +13,10 @@ SRC_URI =3D =
"git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branc
>=20
> S =3D "${WORKDIR}/git"
>=20
> +do_configure_prepend() {
> +    sed -i "s:-Werror::g" ${S}/Makefile
> +}
> +

this should be only down when DEBUG_BUILD is set not unconditionally =
like this.

> do_install() {
>     install -d ${D}${bindir}
>     install -m 0755 mmc ${D}${bindir}
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_45EB6B5A-D65D-4B1C-BA44-B9E35400BD3E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXQOYsACgkQuwUzVZGdMxQhXACeN3xJbWhNkK2rBnABLyODskey
Lb8AnRt0EVYEJww/wxksaeAVQW9V9h8I
=w+2D
-----END PGP SIGNATURE-----

--Apple-Mail=_45EB6B5A-D65D-4B1C-BA44-B9E35400BD3E--
