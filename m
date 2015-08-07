Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id BF4D676737
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 07:09:23 +0000 (UTC)
Received: by pacrr5 with SMTP id rr5so46176696pac.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Aug 2015 00:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=CgehFDvhVrCfSf+hrKS6+szJp+3GFMp2kmnWiOBznVc=;
	b=vKXUxe2LP7/k9Q7dv0QKEN/Sd6ZGIm1kNif2Dtyze2l5RQ0+PtzIF2Rmw6XK4f0QIO
	h3Y3MjKcttjquu+8qV+8vLwDUUGtFOqbItNDdGqxeJUjmuDP5fnUVRvKX0+9HpW9q1AO
	sZ5K2jYUTQAOzn5+2zJ/H+fInBzQJrF3p0sUMVqZgwSkPesvys4fnEBmZ08hbbhVl6xs
	v7FzQtwMBTQi4gAMb9243pcEC6Oq04XIYCzgtrMZx0vUPH5433RwVhKuJn7JarylTfZq
	PDQ1KPS8tAnU4xgv3iFvtb3v1OzdQmc32yWMyYgtu6+gzunzSstjozyK2QOF1cIA52Yf
	17lQ==
X-Received: by 10.66.138.40 with SMTP id qn8mr11598743pab.19.1438931363506;
	Fri, 07 Aug 2015 00:09:23 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:4ec:fbce:7a8:43c9?
	([2601:646:8601:4580:4ec:fbce:7a8:43c9])
	by smtp.gmail.com with ESMTPSA id s1sm8873508pda.54.2015.08.07.00.09.22
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 07 Aug 2015 00:09:22 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1438320085-5543-1-git-send-email-kexin.hao@windriver.com>
Date: Fri, 7 Aug 2015 00:09:17 -0700
Message-Id: <C7649730-0FF2-4EEE-9C71-7ECA461B7180@gmail.com>
References: <1438320085-5543-1-git-send-email-kexin.hao@windriver.com>
To: Kevin Hao <kexin.hao@windriver.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot: fix extern inline build errors for gcc 5
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
X-List-Received-Date: Fri, 07 Aug 2015 07:09:25 -0000
X-Groupsio-MsgNum: 69102
Content-Type: multipart/signed;
	boundary="Apple-Mail=_11335938-15A7-4B7F-9B45-FDB5559AA7E9";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_11335938-15A7-4B7F-9B45-FDB5559AA7E9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jul 30, 2015, at 10:21 PM, Kevin Hao <kexin.hao@windriver.com> =
wrote:
>=20
> The gcc 5 change its default standard from gnu89 to gnu11. These two
> standards do have different semantics for inline functions. And the
> gcc 5 will emit the following errors on the "extern inline" functions:
>    arch/powerpc/cpu/mpc8xxx/fsl_lbc.o: In function `ld_le16':
>    ./arch/powerpc/include/asm/byteorder.h:12: multiple definition of =
`ld_le16'
>    =
arch/powerpc/cpu/mpc8xxx/fdt.o:./arch/powerpc/include/asm/byteorder.h:12: =
first defined here
>=20
> Fix these build errors by using "-fgnu89-inline" to enforce the gnu89
> inline semantics as suggested in [1].
>=20
> [1] https://gcc.gnu.org/gcc-5/porting_to.html
>=20
> Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
> ---
> meta/recipes-bsp/u-boot/u-boot_2015.07.bb | 2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2015.07.bb =
b/meta/recipes-bsp/u-boot/u-boot_2015.07.bb
> index 3ba2f44eaa20..4746c33ec25e 100644
> --- a/meta/recipes-bsp/u-boot/u-boot_2015.07.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot_2015.07.bb
> @@ -10,3 +10,5 @@ SRCREV =3D =
"33711bdd4a4dce942fb5ae85a68899a8357bdd94"
> SRC_URI +=3D =
"file://0001-u-boot-mpc85xx-u-boot-.lds-remove-_GLOBAL_OFFSET_TAB.patch"
>=20
> PV =3D "v2015.07+git${SRCPV}"
> +
> +EXTRA_OEMAKE_append =3D " KCFLAGS=3D-fgnu89-inline=E2=80=9D

can you please test this patch to u-boot instead

https://gist.github.com/kraj/93794ad61a29d0a5e442


> --
> 2.1.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_11335938-15A7-4B7F-9B45-FDB5559AA7E9
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXEWaEACgkQuwUzVZGdMxSVkwCeMTxGRdp9HN4U0aJra2MVubuT
TwoAmwSJLK+xB3pyHI+1QlVSuqwRVy9D
=bKNv
-----END PGP SIGNATURE-----

--Apple-Mail=_11335938-15A7-4B7F-9B45-FDB5559AA7E9--
