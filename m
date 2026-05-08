Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D51E7CD3445
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 14:58:44 +0000 (UTC)
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.327.1778252321261642265
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 07:58:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=Y1sjq6o7;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=rOZD/pcy;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.153, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 42DDC7A0038;
	Fri,  8 May 2026 10:58:40 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 08 May 2026 10:58:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1778252320; x=1778338720; bh=D7QfjXgO53
	/Yd3zwGsfK1vxUdWdi6XOsIuENmqq6Jww=; b=Y1sjq6o7GGCVPs/3oq9qwREBI5
	hABoGDTUulZIfVbvH54MNosLT5fJtIp+N1DHN4EsqWdUV1sWZw8g4oN5uQUPZjNb
	Rr7DOPddkaA2YWvMZm/QqnIsBWydILZGXtYdMUATsG/k2OsyqmUA1xIxSrxkvEz5
	R+GYghQFdfYuh/9a6VuJKQNauqGnvaTnjgkKF9T1JPhpVaaOoJNf+ajYOuHwesF7
	1qpSkFBRD+vpYoRdEXwzKhPyO7X1aUtyWSpF8AEcOpwKWl4XdrymsTeeMv14fTVg
	WTobOjfu2heYWOcsjMDoGBkqY66tLm8+6cygNh3JJN4BngTfiE+CdLqD/aag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1778252320; x=1778338720; bh=D7QfjXgO53/Yd3zwGsfK1vxUdWdi6XOsIuE
	Nmqq6Jww=; b=rOZD/pcy9y5T/4p27jofR0THp2D7mFuRtOjn4PH/gmo1HNHvGjw
	sPNmXbWp8lwxD8kETwSoGzDZju0qx4aoR6K4mkKJZ5CWWllLgI+rpsO8XgPNqeem
	TwPxedBs/dAMJ/JjO7mUzH12HFGNv7einwWEn1h95iN/48UQ+lSX4P2XU6KagGmK
	jETMPJtWxHIBItHvNzW5HRpwWIi/0b03ySIyM8YgWeb6taz4TmviiAgPVDqt1xIN
	+Q2ES/v1fzhstd/ZrpFo3VSwCEzQ4noLP4ohO+plwqve/5/5zq77vu5wdQL1o2zI
	XsLzZQLHoLiZ9t8ubqJ3o8ityi4c2swc3EA==
X-ME-Sender: <xms:H_r9aVvDxSlxXUFNTIF9bZBem4JdCRd9V0sWc2ubGHK8gRBPAMqU0A>
    <xme:H_r9acT9u1FbEXiKDwKPkCqmubqEAOP0FHhShF3ASG4wSdhKW-vle0ZVpnbsgogrZ
    ed9dS9GZoT0nNYITwL9folMAvTMg_Ku39IZFnHYdIlR9xnhBFXH4Q>
X-ME-Received: <xmr:H_r9aTNa-khUrH4hCo_S4geZ20ltSWBS8fDtEStxsyziOp1ZdIRedV_mW_qCaaK_5zNE1ds62oTA1Ruxf6bTm88J-J5fa2k5zAAGGdJuN8fd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduuddtieehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epvdetiefhheetfeevkeevieejkeevtdetieefhfeivedtvdffhfegtdehleehhfehnecu
    ffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdphihotghtohhprhhojhgvtg
    htrdhorhhgpdhgihhthhhusgdrtghomhdptghhmhhougdrrhhsnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrd
    guvghvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pegthhgrnhhgqhhinhhgrdhlihesfihinhgurhhivhgvrhdrtghomhdprhgtphhtthhope
    hrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrghdp
    rhgtphhtthhopehmrghrkhdrhhgrthhlvgeskhgvrhhnvghlrdgtrhgrshhhihhnghdroh
    hrghdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdho
    phgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:H_r9aZaHPK_v-GiqLbCF11iC3Sh7oSnQA3qUTdr_hGP93bezLbOoOg>
    <xmx:H_r9aVySyZhyZ9yxd44dttgfBBUlqvFLcANpX7DTBQQdIuTSsoFNIA>
    <xmx:H_r9acLfTveoSDWE0NqtfspmyWx9UgRARtNfLbdvciPXgu0D3uuRCw>
    <xmx:H_r9aXokiE83J-DVzcnb7_3ehEExIjdahjzXXKnm4uzf_mY-uzpx2A>
    <xmx:IPr9aR3OCnYcH93QeRnfXku-wT9Af9nB9KaGqRWIm5c3Mnt4jxRy4T45>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 May 2026 10:58:38 -0400 (EDT)
Message-ID: <0aa707e8222442434bf9361242653873931b9af3.camel@pbarker.dev>
Subject: Re: [OE-core] Pseudo abort issue on ubuntu 26.04
From: Paul Barker <paul@pbarker.dev>
To: changqing.li@windriver.com, Richard Purdie
	 <richard.purdie@linuxfoundation.org>, "mark.hatle@kernel.crashing.org"
	 <mark.hatle@kernel.crashing.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 08 May 2026 15:58:36 +0100
In-Reply-To: <DS0PR11MB7312D96BD98C4D7FAD8D2BD6823D2@DS0PR11MB7312.namprd11.prod.outlook.com>
References: 
	<DS0PR11MB7312D96BD98C4D7FAD8D2BD6823D2@DS0PR11MB7312.namprd11.prod.outlook.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ODzPZCVZc9C10MM4HCiw"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 14:58:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236725


--=-ODzPZCVZc9C10MM4HCiw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-05-08 at 13:19 +0000, Changqing Li via
lists.openembedded.org wrote:
> Hi,
>=20
> I am trying to build project on ubuntu 26.04.  "bitbake postfix"  failed =
 at do_package since pseudo abort,   after doing  some search, it is caused=
 by ubtunu26.04's new change,  Ubuntu has officially begun transitioning it=
s core system utilities from the traditional GNU Coreutils (written in C) t=
o uutils (a Rust-based rewrite).   I would like to seek some help,  could y=
ou give some advices about how we should handle this?  Thanks.
>=20
> Here is how  it happened:
> * =E2=80=8E  In do_install stage:
> There are  2 files target to installed under ${D}: (there are other files=
 following this pattern)
> ${D}/usr/libexec/postfix/smtp:     which is  mv from file under {S}, and =
then chmod
> ${D}/usr/libexec/postfix/lmtp:      hardlink to ${D}/usr/libexec/postfix/=
smtp
>=20
> With the old gnu coreutils:
> when install smtp,   mv will call renameat2, which will finally calling r=
eal syscall since the oldpath is under {S} which is not in PSEUDO_INCLUDE_P=
ATHS.
> then chmod call fchmodat,   then fchmodat wrapper will save an entry with=
 uid 0 in files.db.   install lmtp will also insert an entry with uid 0 in =
files.db
>=20
> With the new rust coreutils:
> when install smtp,    the behavior of chmod is different,   statx get cur=
rent mode,  rust chmod check the current mode  is the same as the target mo=
de, then
> fchmodat is never called, then smtp is not saved in files.db,  and this w=
ill also make install lmtp insert an entry with real uid like 25610  in fil=
es.db since smtp is not found in files.db
>=20
> * =E2=80=8E  in do_package stage:
>=20
> Exception: subprocess.CalledProcessError: Command 'tar --exclude=3D./sysr=
oot-only -cf - -C /yocto/build/tmp/work/x86-64-v3-oe-linux/postfix/3.10.8/i=
mage -p -S . | tar -xf - -C /yocto/build/tmp/work/x86-64-v3-oe-linux/postfi=
x/3.10.8/package' returned non-zero exit status 2.
>=20
> Subprocess output:
> abort()ing pseudo client by server request. See https://wiki.yoctoproject=
.org/wiki/Pseudo_Abort for more details on this.
> Check logfile: /buildarea1/cli10/yocto/build/tmp/work/x86-64-v3-oe-linux/=
postfix/3.10.8/pseudo//pseudo.log
>=20
> tar command may  call stat  for ${D}/usr/libexec/postfix/smtp,   since th=
e  we have a same inode entry in files.db for lmtp, above error reported.
>=20
>=20
> The key  issue is ${D}/usr/libexec/postfix/smtp is not inserted in files.=
db in do_install stage,  which will cause wrong uid for lmtp and  psedo abo=
rt in do_package stage.
> I think we cannot change behavior of rust coreutils.   I am wondering eve=
n we patch postfix to not use hardlink, the pseudo abort issue may disappea=
r,  but since
> chmod not call fchmodat,   we don't insert entries for these files,   may=
be the uid etc is wrong in final image.
>=20
> [1] https://github.com/uutils/coreutils/blob/main/src/uu/chmod/src/chmod.=
rs
> [2] https://github.com/coreutils/coreutils/blob/master/src/chmod.c
> [3] https://lists.openembedded.org/g/openembedded-devel/topic/119211397  =
  // patch for build postfix with linux kernel 7.x

Hi Changqing,

The tar command failing with exit status 2 should be resolved by recent
changes in pseudo. Which Yocto Project version are you using?

Thanks,

--=20
Paul Barker


--=-ODzPZCVZc9C10MM4HCiw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaf36HBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0brUYAQDZRnwqRRJXJxam/0wGhNUO+92qYE5A5irU
IvYZWArIRQEAo2fh8Ykcp7bp3G37RzNfZh3QoZ+bdfp8V6GC6H/x8AY=
=oA0/
-----END PGP SIGNATURE-----

--=-ODzPZCVZc9C10MM4HCiw--

