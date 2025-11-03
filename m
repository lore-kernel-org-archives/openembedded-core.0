Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5568CCCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 19:46:17 +0000 (UTC)
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.583.1762199171557481108
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 11:46:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=fnZhw583;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=N8IqRYhR;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.151, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id CF07F1D0043C;
	Mon,  3 Nov 2025 14:46:10 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 03 Nov 2025 14:46:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1762199170; x=1762285570; bh=uYdixVXIXz
	5/VU5WU7LQSxchNiWxuwkGdsV6Rk6T/IE=; b=fnZhw583WWxyOKdrMLyXuJENsa
	m9FLV+41ZNF0/1ljFkeCY1VSqbovLd4ww2e/3Qt2n8wPXm23QGYKsqtDxRGvyIqa
	LPib7sGPI1pK6xp/CRmr2d43iwBw1eyxT3TsEV2dVSeZsjxp4LWF+h4nZzSrNe+5
	fE0uFJpmQx7MDfe12dyxSvbDEdKImQIUiZCB41Qckgf6Hd1TOusE30IDkFAIJPNz
	g0lgd6oIJrC+lGE6svNQwcD2Mk91jpVT8dpzeJcDXu1sPYYid+18Jr+3XScbjmmr
	Bk1wz632iLqxU/udhZuHFkGCLazAvjYbhcIY3DdBhJHqa6TE2S1YVeuDUX8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1762199170; x=1762285570; bh=uYdixVXIXz5/VU5WU7LQSxchNiWxuwkGdsV
	6Rk6T/IE=; b=N8IqRYhRDA6Qo2NWgPLQGa/GL0klXCSN/El7iflX3SRpO1P5f8h
	zJbuQ1I2JEvDHXiI0YqCFQFMI8/35WfO5hDYS9JfJmNrYjAvwjv3MnW318YUva8F
	JegaaqWBmhmD+jHTF0iR1bLgwXvHbLgA/dn71tEpP8zMdSWtJpGwumtU8coWCOpC
	TFRnBgg4Dyat7m4QvGKFBwzjGGakDuqMwg0/tXFTgfRxvCZLmMA0egTr56Xdaf8J
	EyHe9RhkoQQY3g5UtjK694XYKA9MUWyXpichF0eQwwUB7HgYLffksGqE73DuD/Z2
	MZ2YLragTSYSAkkHcz1Acc6vnW1gVvdEL9Q==
X-ME-Sender: <xms:ggYJaZiBZJVh9OLD-g2TSKUM6yzs4jmIS7QCZFEf9q82a5ccoI_POQ>
    <xme:ggYJaVe1K-ITI1tC66RXPjM10Qa93Qu7fEapza-J1kqVX7iGyq-5KFRfSB9o7sIYk
    H_7-ewL0exop0r3nCe9-4sIfd38dOaBSSGFKTPNo2p4SWncHNAbkm8>
X-ME-Received: <xmr:ggYJaWdoOmRGjppkIkjxUIRw63sLRcXzd0MBQUesGf-ZNDpMd7lH9SBurC18INZNnBrLVUc4UpZ20MeMJIR8XSLV93Z-_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddujeeltdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epfeejuedugeffkeegffdvtdeigfeltdfhveeiieejgffggeffvdefleffteeffedvnecu
    ffhomhgrihhnpegssggtlhgrshhsrdhsohenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghr
    tghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepohhpvghnvghmsg
    gvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhr
    tghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhioh
    hnrdhorhhgpdhrtghpthhtoheprghlvgigrdhkrghnrghvihhnsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:ggYJaX-BaaAndIqLZAaA7zHWAnrG25ogCiAaGj_jI0Fzo5gjdHQlXA>
    <xmx:ggYJaam4uQQQJZzvpIhkWgsdJbTZqwkP0gL1w0sdB9FBQaEHYf-9eg>
    <xmx:ggYJaR_3WLPbM8-bXhDtjM5l0ShAVmKK2svtw3uaCP7UOVg1gN855Q>
    <xmx:ggYJaQkcTmvF2cU7iehF_TIH7KoxE4p7UTTqljAMJr_Z1e8wLyk1gA>
    <xmx:ggYJaSZP5N-cusS0Ud363lmiypgRPvTuoyddcQbNBMQKjCG_6l20v4MD>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Nov 2025 14:46:09 -0500 (EST)
Message-ID: <91e68f9f8747154b3754d7a5156c5cf8f1b6b5db.camel@pbarker.dev>
Subject: Re: [PATCH] pseudo: Add hard sstate dependencies for pseudo-native
From: Paul Barker <paul@pbarker.dev>
To: openembedded-core@lists.openembedded.org, Richard Purdie
	 <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 03 Nov 2025 19:46:05 +0000
In-Reply-To: <20251016-fix-pseudo-native-v1-1-7c42af094122@pbarker.dev>
References: <20251016-fix-pseudo-native-v1-1-7c42af094122@pbarker.dev>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-bYcpzz0xwE/RRiiRkb7q"
User-Agent: Evolution 3.56.1-1+deb13u1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 19:46:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225694


--=-bYcpzz0xwE/RRiiRkb7q
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2025-10-16 at 20:11 +0100, Paul Barker wrote:
> Where a task (such as do_package) runs under fakeroot, the corresponding
> setscene task (do_package_setscene) will also run under fakeroot when
> restoring from sstate. Assuming pseudo is used as the fakeroot
> implementation, we need pseudo-native and all its runtime dependencies
> to be available in the sysroot before running any setscene tasks under
> fakeroot.
>=20
> We already add a hard dependency from all do_package_setscene tasks to
> virtual/fakeroot-native:do_populate_sysroot in base.bbclass, but this
> does not cover transitive dependencies. So, extend the dependencies of
> pseudo-native:do_populate_sysroot_setscene to ensure that the sqlite3
> library and attr binaries are also available in the sysroot before
> running fakeroot setscene tasks.
>=20
> [YOCTO #15963]
>=20
> Signed-off-by: Paul Barker <paul@pbarker.dev>
> ---
>  meta/recipes-devtools/pseudo/pseudo.inc | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devto=
ols/pseudo/pseudo.inc
> index 22c934977d9b..82499cdd74da 100644
> --- a/meta/recipes-devtools/pseudo/pseudo.inc
> +++ b/meta/recipes-devtools/pseudo/pseudo.inc
> @@ -155,3 +155,10 @@ do_install:append:class-nativesdk () {
>  }
> =20
>  BBCLASSEXTEND =3D "native nativesdk"
> +
> +# Setscene tasks which run under fakeroot must not be executed before
> +# pseudo-native and *all* its runtime dependencies are available in the
> +# sysroot.
> +PSEUDO_SETSCENE_DEPS =3D ""
> +PSEUDO_SETSCENE_DEPS:class-native =3D "sqlite3-native:do_populate_sysroo=
t attr-native:do_populate_sysroot"
> +do_populate_sysroot_setscene[depends] +=3D "${PSEUDO_SETSCENE_DEPS}"

Richard,

I've spent some time looking at this. I can't find a good reason for the
hard setscene dependency on attr-native, this appears to be a build time
dependency only. I thought I saw invocation of the setfattr command, but
looking again that's just in the configure script.

I think setting the hard setscene dependency here in the pseudo recipe
is good. Placing it here as a dependency of pseudo-native gives us the
following dependency graph for the test case of gcc-runtime:do_package:

  gcc-runtime:do_package_setscene -> pseudo-native:do_populate_sysroot_sets=
cene -> sqlite3-native:do_populate_sysroot_setscene

The extra hop there doesn't really cause us any build performance
issues. It prevents us from running do_populate_sysroot_setscene in
parallel for pseudo-native and sqlite3-native, but neither of those are
large sstate archives and they're very quick to unpack.

I'd be concerned if the graph of hard dependencies got complicated, but
one level of indirection for a single dependency is ok.

It's good to keep the dependency in the pseudo recipe where it can be
easily understood, rather than moving it to a new variable named
something like FAKEROOT_SETSCENE_DEPENDS in base.bbclass.

So, I plan to send a v2 which drops the attr-native:do_populate_sysroot
dependency but is otherwise the same.

Thanks,

--=20
Paul Barker

--=-bYcpzz0xwE/RRiiRkb7q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaQkGfREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0biQhAP46tp1ULKZEVRnAln7WoEFOtx2jqROVebWN
HVQxdH+a0QEA9AmKlmZ9JsgEulkES1Yh/zYeXQWi6Rle3DAtnjazgAk=
=59a9
-----END PGP SIGNATURE-----

--=-bYcpzz0xwE/RRiiRkb7q--

