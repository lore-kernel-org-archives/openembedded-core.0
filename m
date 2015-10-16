Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9ADBE77129
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 06:47:08 +0000 (UTC)
Received: by payp3 with SMTP id p3so64034589pay.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 23:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=k6ElYdK7j++aYBBs8xU4EWVf5OKzWxDGgpu/QKt2A0U=;
	b=Oics5hYzmfbq/BwG8aYHvOpuUZ+L3E8+RjzQT9GeADD+f8l1xAZzCa6fOKs3/FXnLd
	F5tXJzsSqieV8ryzkSMhFxhXegPG/U517gocjRu8WDa3EetKHm9oLJbaACPgNtt7GPfZ
	IapJyi1Oeci01CYd7KkItBnWVKBb9GrwDtruPVY0U69VIJ3eB5EomO5qcByS3e8u1AWq
	VSRCxP1Fs3fAtspbxMCjUUSQQDvjjvEU7lMPnGybC0a0G3o4KGm9+QMI8ukxL0F3/pL0
	C8k3bDxTKvnpPLSBWlH75JYsN7b9qWQTUprWhOTi5s5sW2DrjpU4pAiZ0wp/m+BEOCnq
	kzOA==
X-Received: by 10.69.26.7 with SMTP id iu7mr1345435pbd.27.1444978029213;
	Thu, 15 Oct 2015 23:47:09 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:c84b:e0f3:fc98:e745?
	([2601:646:8601:4580:c84b:e0f3:fc98:e745])
	by smtp.gmail.com with ESMTPSA id
	de4sm19089688pbb.60.2015.10.15.23.47.08
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Oct 2015 23:47:08 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.1 \(3096.4\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20151015212704.77942702@seebs-worktop>
Date: Thu, 15 Oct 2015 23:47:07 -0700
Message-Id: <C0666492-2FE4-4D24-BDBA-835378893BC9@gmail.com>
References: <20151015212704.77942702@seebs-worktop>
To: Peter Seebach <peter.seebach@windriver.com>
X-Mailer: Apple Mail (2.3096.4)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Possible patch for build issue (mostly affects mingw, but see below)
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
X-List-Received-Date: Fri, 16 Oct 2015 06:47:09 -0000
X-Groupsio-MsgNum: 72244
Content-Type: multipart/signed;
	boundary="Apple-Mail=_7FBD2E11-276D-40E2-9562-305BC3FAA420";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_7FBD2E11-276D-40E2-9562-305BC3FAA420
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Oct 15, 2015, at 7:27 PM, Peter Seebach =
<peter.seebach@windriver.com> wrote:
>=20
> I'd like a second opinion on this. Without this, we had very strange =
build
> failures which ended up being using the build system g++ with the =
mingw
> "host" (in cross-canadian land, this would be the machine the compiler =
will
> run on) headers. On study, the issue seems to be that libcpp is now =
being
> built for the build machine, but it's using C++ as of 5.2.0... But
> EXTRA_BUILD_FLAGS does not override CXXFLAGS, only CFLAGS and LDFLAGS, =
so
> you end up with the regular host system CFLAGS, which are the mingw =
ones,
> being used with the build system compiler.
>=20
> Without this, I couldn't build gcc 5.2 for mingw. With this (and =
adding
> libgomp to the RUNTIMETARGET_remove_mingw32 in meta-mingw), I could.
>=20
> However, I don't think this is actually mingw specific. I think that,
> without this fix, *every* build ends up using the host system's =
CXXFLAGS
> to build a build-system libcpp, instead of the build system's. It's =
just
> that, since they're usually compatible-enough for libcpp, no one ever
> noticed.
>=20
> (Sending it out to the list as a plain patch because it's easier to =
read; if
> people want a pretty formatted gcc patch for oe-core, I can do that, =
and I
> think this one should go upstream too.)

this patch is ok.

>=20
> Author: Peter Seebach <peter.seebach@windriver.com>
> Date:   Wed Oct 14 17:10:10 2015 -0500
>=20
>    Makefile.tpl: Also pass CXXFLAGS_FOR_BUILD
>=20
>    When doing a FOR_BUILD thing, you have to override CFLAGS with
>    CFLAGS_FOR_BUILD. And if you use C++, you also have to override
>    CXXFLAGS with CXXFLAGS_FOR_BUILD, or you end up trying to use the
>    mingw headers for a host build.
>=20
>    Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
>=20
> diff --git a/Makefile.in b/Makefile.in
> index 36b4008..b64ef77 100644
> --- a/Makefile.in
> +++ b/Makefile.in
> @@ -169,6 +169,7 @@ BUILD_EXPORTS =3D \
> # built for the build system to override those in BASE_FLAGS_TO_PASS.
> EXTRA_BUILD_FLAGS =3D \
> 	CFLAGS=3D"$(CFLAGS_FOR_BUILD)" \
> +	CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)" \
> 	LDFLAGS=3D"$(LDFLAGS_FOR_BUILD)"
>=20
> # This is the list of directories to built for the host system.
> diff --git a/Makefile.tpl b/Makefile.tpl
> index 1ea1954..4f73d66 100644
> --- a/Makefile.tpl
> +++ b/Makefile.tpl
> @@ -172,6 +172,7 @@ BUILD_EXPORTS =3D \
> # built for the build system to override those in BASE_FLAGS_TO_PASS.
> EXTRA_BUILD_FLAGS =3D \
> 	CFLAGS=3D"$(CFLAGS_FOR_BUILD)" \
> +	CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)" \
> 	LDFLAGS=3D"$(LDFLAGS_FOR_BUILD)"
>=20
> # This is the list of directories to built for the host system.
> --
> Listen, get this.  Nobody with a good compiler needs to be justified.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_7FBD2E11-276D-40E2-9562-305BC3FAA420
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYgnWsACgkQuwUzVZGdMxRNewCdG/zmbCdRdoPx3WOIkauMsO+i
+1EAnijSjzetNbR0zN5ZsfrypzTMPm8h
=b8lw
-----END PGP SIGNATURE-----

--Apple-Mail=_7FBD2E11-276D-40E2-9562-305BC3FAA420--
