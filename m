Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4DA4F731AC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 05:16:12 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id jx14so25557593pad.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 21:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=c5k0bwvQoK7Ug4by9c5/IEFwriRPzNE1zG14q6Pgq2Q=;
	b=AdR2/bTKdhQ0lIA37Sfz8J5he9Iw5Znd753RTRO86tpLF2vNauRcjcKZUvN2+fMMno
	E7rF2WFwaH9Uktwicffjs2kRLFEcqBbcdmwhqOYcddW1A5dqAjJYJcO5hqJxckaFgcGZ
	V/OFQ5slAMKID8ktr/3EW6WF7q2/0Rq68aE7YBte32rRK/npcnCCdphazcFnG2rhqId6
	GG1Y0KPUG+hczbeFbQ7n0LP7zzw1Qd0mBN6EFpeDUXRuAerSm30flUszqtRSIWgS+A5U
	zfAd3ub9U0nZLPkcX5FuW1A4ulzgCb2uCNDaHyvxZdkgLu9w0/cyprH3d36BjsLTIBqK
	u8qw==
X-Received: by 10.66.161.133 with SMTP id xs5mr2409849pab.70.1450415773067;
	Thu, 17 Dec 2015 21:16:13 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:3df1:6e85:f350:aa60?
	([2601:646:8802:5d5c:3df1:6e85:f350:aa60])
	by smtp.gmail.com with ESMTPSA id
	87sm14725617pfp.38.2015.12.17.21.16.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Dec 2015 21:16:11 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1450413723-22208-3-git-send-email-armccurdy@gmail.com>
Date: Thu, 17 Dec 2015 21:16:07 -0800
Message-Id: <B851FF48-5C89-4537-A03D-DA4AA4C1AB73@gmail.com>
References: <1450413723-22208-1-git-send-email-armccurdy@gmail.com>
	<1450413723-22208-3-git-send-email-armccurdy@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4 v3] security_flags.inc: disable -fstack-protector-XXX for valgrind
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
X-List-Received-Date: Fri, 18 Dec 2015 05:16:12 -0000
X-Groupsio-MsgNum: 74967
Content-Type: multipart/signed;
	boundary="Apple-Mail=_CA892D74-095D-4F0F-A2B9-608CB9A2B739";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_CA892D74-095D-4F0F-A2B9-608CB9A2B739
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Dec 17, 2015, at 8:42 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
> Valgrind (v3.11.0) expects to build with stack protection disabled
> and includes -fno-stack-protector in its default CFLAGS. However, the
> CFLAGS provided by OE are included on the compiler command line after
> the defaults so any -fstack-protector-all / -fstack-protector-strong
> option provided by security_flags.inc will cause problems.
>=20
> | =
.../build-bcm97425vms/tmp/work/mips32el-rdk-linux/valgrind/3.11.0-r0/valgr=
ind-3.11.0/coregrind/m_mallocfree.c:892: undefined reference to =
`__stack_chk_guard'
> | =
.../build-bcm97425vms/tmp/work/mips32el-rdk-linux/valgrind/3.11.0-r0/valgr=
ind-3.11.0/coregrind/m_mallocfree.c:947: undefined reference to =
`__stack_chk_fail'
>=20
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
> meta/conf/distro/include/security_flags.inc | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/distro/include/security_flags.inc =
b/meta/conf/distro/include/security_flags.inc
> index 14ac0bf..1795750 100644
> --- a/meta/conf/distro/include/security_flags.inc
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -84,7 +84,7 @@ SECURITY_CFLAGS_pn-python-numpy =3D =
"${SECURITY_NO_PIE_CFLAGS}"
> SECURITY_CFLAGS_pn-python3 =3D "${SECURITY_NO_PIE_CFLAGS}"
> SECURITY_CFLAGS_pn-tcl =3D "${SECURITY_NO_PIE_CFLAGS}"
> SECURITY_CFLAGS_pn-tiff =3D "${SECURITY_NO_PIE_CFLAGS}"
> -SECURITY_CFLAGS_pn-valgrind =3D "${SECURITY_NO_PIE_CFLAGS}"
> +SECURITY_CFLAGS_pn-valgrind =3D =E2=80=9C"

Can we instead add -lssp to LDFLAGS ?

> SECURITY_CFLAGS_pn-zlib =3D "${SECURITY_NO_PIE_CFLAGS}"
>=20
> # These 2 have text relco errors with the pie options enabled
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_CA892D74-095D-4F0F-A2B9-608CB9A2B739
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlZzlpoACgkQuwUzVZGdMxRRvQCghQwDTkx1v5Lq3KARVd3btvdx
NfYAn2MmVbnpnX0CI4v1iorkYYple/hn
=G2t4
-----END PGP SIGNATURE-----

--Apple-Mail=_CA892D74-095D-4F0F-A2B9-608CB9A2B739--
