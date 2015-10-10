Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 291E27703E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Oct 2015 00:25:59 +0000 (UTC)
Received: by pacex6 with SMTP id ex6so100369739pac.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Oct 2015 17:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=86HkjcqnHpRC5BIsA+BcG6msWlxPF8Ncufm5p2muBew=;
	b=lRWasih8dZpJmDSPLjtYXhGXuRX/CPckpfO/xQzRXnqOERZa44tuDxpMEPraWLEwFG
	56wAXBV5a1Gd0jkMGVAsgyWi5/Qxy/JdCMy7kpb84StgVskZ4invWTdRNP7Yn8Vnn4Gi
	KV0aprC6HBs6jOY3RGIAp7R+umiW4Y3xG8iu2UHlPJMr5biXejB360loAQRFWMhTpWMz
	18P7jnT6r9HZWOZlsdvlejMAubjYrMXjx1KqedDPVI9J14cRX+lI5DDGnoEmxLxVE6jo
	6XWo7vo5UbY8nkp/acCh62OJOYfDcR74QB+RwTyrxS/pOKdVPKja8duW4VtcUy1UTe5+
	uuRg==
X-Received: by 10.68.132.234 with SMTP id ox10mr18261467pbb.128.1444436760016; 
	Fri, 09 Oct 2015 17:26:00 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:f4d2:7f63:c7f:85bc?
	([2601:646:8601:4580:f4d2:7f63:c7f:85bc])
	by smtp.gmail.com with ESMTPSA id
	uc1sm4698881pab.20.2015.10.09.17.25.59
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 09 Oct 2015 17:25:59 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3096.1\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1444429304-22379-1-git-send-email-anibal.limon@linux.intel.com>
Date: Fri, 9 Oct 2015 17:25:50 -0700
Message-Id: <2F03AA60-9509-44F3-83E1-F4DC89EFFE29@gmail.com>
References: <1444429304-22379-1-git-send-email-anibal.limon@linux.intel.com>
To: =?utf-8?Q?An=C3=ADbal_Lim=C3=B3n?= <anibal.limon@linux.intel.com>
X-Mailer: Apple Mail (2.3096.1)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bash: Disable custom memory allocator
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
X-List-Received-Date: Sat, 10 Oct 2015 00:26:00 -0000
X-Groupsio-MsgNum: 72061
Content-Type: multipart/signed;
	boundary="Apple-Mail=_4754807F-BED3-4BE9-9B22-F2724111B8E8";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_4754807F-BED3-4BE9-9B22-F2724111B8E8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 9, 2015, at 3:21 PM, An=C3=ADbal Lim=C3=B3n =
<anibal.limon@linux.intel.com> wrote:
>=20
> Bash is failing trying to allocate memory [1] using the custom
> memory allocator if we disable it the issue is fixed.
>=20
> The major distributions also disabled by default [2], so we
> don't have a good reason to use it.

The fix is OK but commit message needs improvement. The underlying issue =
is due to bash=E2=80=99s malloc using brk() calls
to allocate memory, which fail when address randomization is enabled in =
kernel. sbrk() based custom allocators are obsolete
on the downside we will lose a bit of performance but correctness is =
more important here.

>=20
> [YOCTO #8452]
>=20
> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D8452#c0
> [2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D8452#c5
>=20
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
> ---
> meta/recipes-extended/bash/bash.inc | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-extended/bash/bash.inc =
b/meta/recipes-extended/bash/bash.inc
> index c06f157..020409f 100644
> --- a/meta/recipes-extended/bash/bash.inc
> +++ b/meta/recipes-extended/bash/bash.inc
> @@ -7,7 +7,7 @@ DEPENDS =3D "ncurses bison-native"
> inherit autotools gettext texinfo update-alternatives ptest
>=20
> EXTRA_AUTORECONF +=3D "--exclude=3Dautoheader"
> -EXTRA_OECONF =3D "--enable-job-control"
> +EXTRA_OECONF =3D "--enable-job-control --without-bash-malloc"
>=20
> # If NON_INTERACTIVE_LOGIN_SHELLS is defined, all login shells read =
the
> # startup files, even if they are not interactive.
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_4754807F-BED3-4BE9-9B22-F2724111B8E8
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYYWxYACgkQuwUzVZGdMxTiVgCfW8MW5FmFqNbCgbEXtI8/NGuk
9SAAn2RPD4JREK4C8iOzIE1QQoLM1+IY
=P3ym
-----END PGP SIGNATURE-----

--Apple-Mail=_4754807F-BED3-4BE9-9B22-F2724111B8E8--
