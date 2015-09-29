Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id E930777035
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 17:07:04 +0000 (UTC)
Received: by pablk4 with SMTP id lk4so11121859pab.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 10:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=cqYBUKTql+rszDjP+/PoKsQ4ng3q4MSoTEmIkyaItTw=;
	b=Mgl40tq38HfPRJDflerc/8OGBT3LTX7M9gN+PC38qbeOqt3jB4w96K4ZN6kI8HkqDT
	FiydkcRSyWG0hffYc8VI97qjmo08extUPMq/FtM/M8+IRF+OBbxkZYmez7W/R+80g9nY
	pNzYU8cxF90mNHSF7kLQwXNJUD6drygqJKGd9CA1xH17WFLyDC7f6pnKrqEjgTJw/VGD
	xMMNaLqj2nHMwDdrclOedrXi1SKgi85evuVsYBsp0ibqNvsy57jo6BtRQBZxKmiCOitE
	bgN5CtCyw3Nh6c8wOO6KxAtOJ6MFLKC9XGo51YvzqOzdfgMXdeP3bn9rtqS2K22pi1uL
	0euA==
X-Received: by 10.68.242.130 with SMTP id wq2mr33768665pbc.117.1443546424784; 
	Tue, 29 Sep 2015 10:07:04 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:f90b:6fa0:21f7:85bc?
	([2601:646:8601:4580:f90b:6fa0:21f7:85bc])
	by smtp.gmail.com with ESMTPSA id
	of1sm26602384pbc.11.2015.09.29.10.07.04
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 29 Sep 2015 10:07:04 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <6b281d94cd5d112840fc39b017be201a41e65658.1443536748.git.bruce.ashfield@windriver.com>
Date: Tue, 29 Sep 2015 10:07:03 -0700
Message-Id: <CBC9858A-0875-463A-A0C0-0C34EEF752F0@gmail.com>
References: <cover.1443536748.git.bruce.ashfield@windriver.com>
	<6b281d94cd5d112840fc39b017be201a41e65658.1443536748.git.bruce.ashfield@windriver.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
X-Mailer: Apple Mail (2.3094)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] kern-tools: fix multi-layer patch application
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
X-List-Received-Date: Tue, 29 Sep 2015 17:07:05 -0000
X-Groupsio-MsgNum: 71751
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E0088582-FA72-4524-94D1-2A143E2A1E27";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_E0088582-FA72-4524-94D1-2A143E2A1E27
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Sep 29, 2015, at 7:31 AM, Bruce Ashfield =
<bruce.ashfield@windriver.com> wrote:
>=20
> Updating the kern-tools SRCREV to import the following fix:
>=20
>    kgit-meta: resume after last applied patch
>=20
>    When the auto-resume (resume point detection) was removed from the
>    processing of a meta-series, it ignored the fact that a single =
patch
>    series may in fact be processed a number of times.
>=20
>    Two layers patching a kernel will generate two different runs on =
the
>    same branch, which always start at patch one. This will obviously
>    break with duplicate patches.
>=20
>    To avoid this, we simply track the last patch applied, and
>    explicitly
>    tell the patch scripts where to start. This gets us resume
>    functionality, without the overhead of resume point detection.
>=20
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
> meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb =
b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> index 27df02ab7a44..18be4ad61598 100644
> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D =
"file://git/tools/kgit;beginline=3D5;endline=3D9;md5=3Dd8d1d729a70c
>=20
> DEPENDS =3D "git-native"
>=20
> -SRCREV =3D "b7642a7c3f685850ffbb961313e6a593adb05370"
> +SRCREV =3D =E2=80=9C1fb91c2965193df894089fbcbcafe3bf775c21fd"

this works well now.

> PR =3D "r12"
> PV =3D "0.2+git${SRCPV}"
>=20
> --
> 2.1.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_E0088582-FA72-4524-94D1-2A143E2A1E27
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYKxTcACgkQuwUzVZGdMxQvOgCfemFlfQWXXZrWoodxQdj8PIdM
ulkAoInlBcgJVr3XDZ2rGUjg0TYzVIFQ
=W0dB
-----END PGP SIGNATURE-----

--Apple-Mail=_E0088582-FA72-4524-94D1-2A143E2A1E27--
