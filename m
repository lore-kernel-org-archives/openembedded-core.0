Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 182D2F46456
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 11:33:33 +0000 (UTC)
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48182.1773660811798057304
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 04:33:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=K/yLUt2D;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=MQE9fNyG;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id E1F39EC0536;
	Mon, 16 Mar 2026 07:33:30 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 16 Mar 2026 07:33:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1773660810; x=1773747210; bh=hb946NcYsX
	OSYo/CPGXZ7vjnokoxQbWTQcawJUtYRws=; b=K/yLUt2D24boznm2u84kj4lR0N
	4fXPtkwnCnBwer55ZUaUxUkNBdgeei1W4NEbcNKCzV953kbe7yXkxv27nmpIcfRu
	ZuRMBGyeBCcEppCK9bcb7kdsmbe7zLLK8e8lXKrGp/jxBHUcRgEBCWnKwuBlofSv
	Q8tfAlUOD68wwz1DP0utRsY00geCU4JRTU16dT64+6GvxaP5jTjmzMXfDwW90jAt
	4SFjbKtQctMN6g23/ZJscAxtQywy+qyFCXI3zyeCI9vLxtA9tjS5OFYcNlAzWkST
	GZo+uUDWr0A5cMCImFLDfS28uccZhCFF4+CRXfOxNVxHvvg9aw5PKKYnGgfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1773660810; x=1773747210; bh=hb946NcYsXOSYo/CPGXZ7vjnokoxQbWTQca
	wJUtYRws=; b=MQE9fNyG/uM6ZfrtpOs9o1Dxn+n7N/IDBA0tARy4JcTm2XheRpz
	ZoqHLHu0ovwlcuttpB3BcytgRcNJur6Ggi6jG9zrF5Rysk0up6VwKV8NU+KmZYY9
	GF8KWuGI+9uUzenuMNXDKlEU13497NpxqAhB9r6MYKpyeoXd9Wd3tYU+24BasF/h
	1Fr6P2/dlExaKhZM13Min0wi7wYXunspKraZJxLIwZsPLvl4RD1gZzXoJNHkOOU8
	eLOPWt+R7Pu7VkxrmtxPstaFtqyND77DWfxC7jYI+z6t3jSFz72ZuEC28PP+zpnc
	b9kkOhgQq6gZqFl2YVocuw2oQ2mcJtugUGg==
X-ME-Sender: <xms:iuq3aYZvPyKzHBJrX62yhoddtPVgRjcu0kTbarw70AWCBV1I20cBNg>
    <xme:iuq3aaTG6bEo4FjJoO45laBvipVDJZm6vdvMyGtl0u3OEA2Tmy6yAWrRQcnwwqsPT
    _MTxOatYMDhuvlUIpc2wV0WTA4G6a2PVXdnv6ymVzULMGAgtg9umyY>
X-ME-Received: <xmr:iuq3abR-Q8P6RLBkSuHX5k676TCYy1t45lJz-DVGDYyIA2JnKwJVSnO3WzQSqDonEB05m5azlNdxmHmxxUovgmhMRJ2Bc_wQBGsN8evcHr3_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvleekvdejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epvdehkeegtdffuefhvefggfffffehleettddtgfegfeevvedvfedttdfgkefffeefnecu
    ffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpghhithhhuhgsrdgtohhmpd
    hrvgguhhgrthdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohephe
    dpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggvvghrrghthhhosegtihhstgho
    rdgtohhmpdhrtghpthhtohephihorghnnhdrtghonhhgrghlsehsmhhilhgvrdhfrhdprh
    gtphhtthhopehpvghtvghrrdhmrghrkhhosehsihgvmhgvnhhsrdgtohhmpdhrtghpthht
    ohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvug
    guvggurdhorhhgpdhrtghpthhtohepvhgthhgrvhgurgestghishgtohdrtghomh
X-ME-Proxy: <xmx:iuq3aeTUIzPn4dYh9bNKdTg-k_hveGTeckXwzsY1G9H5iRd1CRLZlw>
    <xmx:iuq3aQ46zCYPm0oiRa38bzO1dEMPRyMWXwUCljpjoq9LvzKajfCi0Q>
    <xmx:iuq3aa2lAa5Fl5sXTA-jlwyziab60yJG4TV1H_QrErOdEi8eP0I80Q>
    <xmx:iuq3abBAQqkERq4rft0Rfv6TPBNgyJkwbLY5UBJNtBHJXV0bMxAwmg>
    <xmx:iuq3acXD2QTjXZwaHZTrZsdwOugD1Cvg-koa074ETw2hD_EOBcI9AKcv>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Mar 2026 07:33:29 -0400 (EDT)
Message-ID: <7f14eab634720f52fb274b0972c4745c35e5f031.camel@pbarker.dev>
Subject: Re: [OE-core] Inquiry Regarding Package Upgrade Approach vs. Manual
 CVE Fixes in LTS Releases
From: Paul Barker <paul@pbarker.dev>
To: deeratho@cisco.com, Yoann Congal <yoann.congal@smile.fr>, "Marko, Peter"
	 <Peter.Marko@siemens.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "Viral Chavda (vchavda)" <vchavda@cisco.com>
Date: Mon, 16 Mar 2026 11:33:25 +0000
In-Reply-To: <DM4PR11MB61897AD50E39921242338DEEC440A@DM4PR11MB6189.namprd11.prod.outlook.com>
References: 
	<DM4PR11MB61899D3F758D2B3C7BAA9361C444A@DM4PR11MB6189.namprd11.prod.outlook.com>
	 <AS1PR10MB56975F5D6969FA7DA67B247DFD44A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
	 <DH0UAYG0BSHQ.1ZJE32LWQ4ECN@smile.fr>
	 <DM4PR11MB61897AD50E39921242338DEEC440A@DM4PR11MB6189.namprd11.prod.outlook.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-4GEn9yrLIyoml+e1Ay64"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 11:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233249


--=-4GEn9yrLIyoml+e1Ay64
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-03-16 at 09:39 +0000, Deepak Rathore via
lists.openembedded.org wrote:
> Hi Yoann, Peter,
> Thank you for the detailed explanation. I=E2=80=99d like to share a few a=
dditional observations from our experience handling CVE remediation across =
multiple LTS branches. These examples illustrate why the scope for allowing=
 package upgrades should not be restricted only to the recipes already list=
ed.
> Key Points & Use Cases
> Use Case 1: When manual CVE backports effectively become full package upg=
rades:
>=20
>   *   For several packages, fixing a single CVE requires cherry=E2=80=91p=
icking a long chain of dependent commits.
>   *   This often means pulling in new files, refactored logic, and signif=
icant code from a newer upstream release.
>   *   Although the version number remains unchanged, the resulting codeba=
se becomes much closer to a newer upstream version=E2=80=94without the tran=
sparency of an actual upgrade.
>   *   Such heavy backporting adds complexity and goes beyond the intended=
 scope of stable/LTS maintenance.
>=20
> Challenges with CVE detection on heavily modified codebases:
>=20
>   *   When large portions of newer code are backported, CVE scanning tool=
s still reference the old version number.
>   *   This leads to scenarios where newly introduced upstream code may co=
ntain vulnerabilities that scanners cannot detect, because the version line=
age no longer matches the real codebase.

Hi Deepak,

You mention that this is based on your experience handling CVE
remediation. Could you share a specific case where this has happened?

> Use Case 2: Vim  =E2=80=93 Patch application blocked by binary test files=
:
>=20
>   *
> Consider another case of vim package, where package community increase mi=
nor version when they add one commit and increment the major version number=
 where minor version number go beyond 2000.
>   *
> We also should do package upgrade for vim package to fix security issues =
because  it is kind of applying commits from vim package upstream
>   *
> There is one another example of vim package CVE: CVE=E2=80=912026=E2=80=
=9128421
>      *
> Fixed commit: https://github.com/vim/vim/commit/65c1a143c331c886dc28888dd=
632708f953b4eb3
>      *   The commit includes two .swp binary files used for updated tests=
 (test_recover.vim).
>      *   When cherry=E2=80=91picking into LTS/stable, quilt fails in do_p=
atch because binary artifacts cannot be applied cleanly.
>      *   Dropping the test changes reduces coverage and weakens verificat=
ion of the fix.
>      *   In such cases, performing a package upgrade provides a cleaner, =
more reliable solution.

Please share the error message generated by quilt, this may be something
we need to look in to so that we can support patches that add such
binary test data. If this doesn't work, we may be able to add the new
.swp files to layer itself (under meta/recipes-support/vim/files/) and
to SRC_URI so that the patch file does not need to include them.

> Use Case 3: When upstream provides no standalone fix=E2=80=94only a versi=
on upgrade:
>=20
>   *   Some CVEs are fixed only via upstream package updates, with no stan=
dalone patch available.
>   *   Example: MariaDB (CVE=E2=80=912026=E2=80=913494)
>      *   Fix reference: https://github.com/microsoft/azurelinux/pull/1614=
3
>      *   The resolution involves upgrading MariaDB to version 10.11.16.
>   *   When the upstream fix exists only in an updated version, upgrading =
the package is the only viable approach

Some CVEs are difficult to fix, and distributions may choose not to take
invasive patches for them if the severity is low. For example in RHEL,
the fix for this issue is currently deferred
(https://access.redhat.com/security/cve/cve-2026-3494).

If you are concerned about this particular CVE, then you need to discuss
this on the openembedded-devel mailing list as the mariadb recipe is in
the meta-oe layer.

> Please share your thoughts on this.

This email has characteristics that suggest to me that it might be
generated by AI/LLM. If that is the case, please remember to reduce the
verbosity of the LLM output so that it is easier to read, and to confirm
that its responses are accurate.

Thanks,

--=20
Paul Barker


--=-4GEn9yrLIyoml+e1Ay64
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCabfqhREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0brfrAP9HYcQ6Ha/KVU8apckXZahm43MxIYI0YSkX
5Y26Ycn6bgD/axaoydcy2PHF3bSfgaQP4DZxY67gli6S2/sfRkKvCQQ=
=q7rP
-----END PGP SIGNATURE-----

--=-4GEn9yrLIyoml+e1Ay64--

