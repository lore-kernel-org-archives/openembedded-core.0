Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29ACACF6ABF
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 14:12:42 +0000 (UTC)
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7144.1767881553095467470
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 06:12:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=fgh5W8XL;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=ut5ChaB8;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.144, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 6FE9C1D00114;
	Thu,  8 Jan 2026 09:12:32 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 08 Jan 2026 09:12:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1767881552; x=1767967952; bh=ARTArmJvF/
	wY5wODmwJQNh9dz07NFQ/WGyNhqlN+Uhg=; b=fgh5W8XLdiMyR9BHHu4/L+SwCG
	fb/3dy2ken/3UhaX9Z03WryfQ1dn6TIHx1eVFs2qhZH62/CCnFia7N3P3azW0Pz3
	L724gLE2EDZT+0JA37iDNK2cK45CnztRPhjk+j3p8QBIiTzKTFoodAoLNTsu8AeJ
	oajtcKoQOJgfdEmsJ8YeV57OmMDHhBW32Pe0B+DKD5/2VufSi0TX+FWcdfdR3sm+
	fs4bfic5IrqDLD3HANzxSDQ1utSMaojwkgz5CAxYIE5maX8xokElu1jen7Y6pd5h
	b5U3sS99MNAMddlPdYjtJnPF59uGzFzneyFTv0njD3K9YlxXcPCjFueD+33g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1767881552; x=1767967952; bh=ARTArmJvF/wY5wODmwJQNh9dz07NFQ/WGyN
	hqlN+Uhg=; b=ut5ChaB8WA9403R0e6JgED/qVFx7kXNy7aSjkffujtKPCgyzPP/
	eq7YoeWEkMFgHViQfPgqWUnVH2Wlg4zn3X4ZqquklMcd7CqWisbdF8MDESQrwMJP
	m7h/p9c4FqDHH5wF6+cwhS0POttN0+22qZm4FaUEgRtp9ApiikAcg4VHxCDJVkE5
	5XbkHx3GgK9rxfj8X16WCRXHqYa7fdMNBpsaRSl/mBGqPV4lbUgaXgvW6QjDUBje
	M1XWAVDT6QTtDl69q7L94P3lVt3LGqwq91q/9SjsN/eixht263VaL57Zl2AKy/Xv
	iceOHgCjkctsz2G26KkuZlQpG2wUyUkkm8g==
X-ME-Sender: <xms:ULtfaadtwwWdx1oAQ70HQeLteoyCeP_rVEom_zR5MQIBLAZMiX1UTw>
    <xme:ULtfaaNZQcl7C6d4lBYuA5Q32BIKAKf98g3SmachuxZo-xowj_EzHLDpouc3DzMMa
    TU9NQjxFcJ6kYl61GtA9I7wcD6xjOPPryz-T1SOgzlIlPEYcsSOt50>
X-ME-Received: <xmr:ULtfaZKS6JcxhUdHoCmneddF7FxKBWYtidlHrzzkQ7JjeqOqeFit-Dwl7tPbWIERpkjyMr7lb6HbaUG3OkETM1DhK0TTdl-LXOpoODwEI_oz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdeiudeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggesghdtreertd
    erjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepfffggeeuhffhffeuteduieejvddtgfetvdegve
    ejleffjedtgfejfffgtdejieeunecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdr
    ohhrghdpfidurdhfihenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepvddp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepvhhishhhrghlrdhguhhpthgrpgduse
    hphhhilhhiphhsrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhr
    vgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-ME-Proxy: <xmx:ULtfaTHdJ4SZPC5CIInmGc2YO0xmzHlsWxCMizikzTOWyUv1aX7oYA>
    <xmx:ULtfaZSxpWYlPrkt9re7Buycivu3U2-6FSshs8jhfbDmPveUvl6-mQ>
    <xmx:ULtfaXF_Hzxt3taqZ8ARZKQIQVcygmmBw05Fn-ssP6Mu0gM4C0TOqw>
    <xmx:ULtfad97qTsQupnJX8uacZGP8htfyjC_6eM7xAvAGLgIUOpsumZMJw>
    <xmx:ULtfaUGt9mhe8DhAH_DVDYTBPsPvnIZN0TusnLCmuaodt03sz6l_Eave>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jan 2026 09:12:31 -0500 (EST)
Message-ID: <421adaf51e6bd83585166b0e3292402bcb319650.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH 1/1] wpa-supplicant: fix sed expression
From: Paul Barker <paul@pbarker.dev>
To: vishal.gupta_1@philips.com, openembedded-core@lists.openembedded.org
Date: Thu, 08 Jan 2026 14:12:28 +0000
In-Reply-To: <250823.1766152615641090465@lists.openembedded.org>
References: <20251219124928.1474117-1-vishal.gupta_1@bbl.philips.com>
	 <CANNYZj-xn-KQUFor=QFG_OBq0MF1tuBacUYyQJUDwF2gqnZA9Q@mail.gmail.com>
	 <250823.1766152615641090465@lists.openembedded.org>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-2xthEWwlODs2Go+lZ54Y"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 14:12:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229075


--=-2xthEWwlODs2Go+lZ54Y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2025-12-19 at 05:56 -0800, vishal.gupta_1 via
lists.openembedded.org wrote:
> Hi Alexander,
>=20
> In the do_configure function current intention of implementation is to fi=
rst delete it when we copying and then depending on the PACKAGECONFIG assig=
n it with correct value.
> As delete is failed because the line start with "#" we will have two CONF=
IG_TLS value in final ".config" file
>=20
> one, at some where middle of the file
> #CONFIG_TLS=3Dopenssl
>=20
> second, depending on package config, at the end of file as it's an append=
 operation.
> CONFIG_TLS=3Dopenssl / gnutls
>=20
> do_configure () {
> ${MAKE} -C wpa_supplicant clean
> sed -e '/^#\?CONFIG_TLS=3D/d' <wpa_supplicant/defconfig >wpa_supplicant/.=
config
> if ${@ bb.utils.contains('PACKAGECONFIG', 'openssl', 'true', 'false', d) =
}; then
> echo 'CONFIG_TLS=3Dopenssl' >>wpa_supplicant/.config
> elif ${@ bb.utils.contains('PACKAGECONFIG', 'gnutls', 'true', 'false', d)=
 }; then
> echo 'CONFIG_TLS=3Dgnutls' >>wpa_supplicant/.config
> sed -i -e 's/\(^CONFIG_DPP=3D\)/#\1/' \
> -e 's/\(^CONFIG_EAP_PWD=3D\)/#\1/' \
> -e 's/\(^CONFIG_SAE=3D\)/#\1/' wpa_supplicant/.config
> fi
>=20
> So with this change there will be only one "CONFIG_TLS=3D<value>" option.

Looking at the wpa_supplicant README file [1]:

  Configuration options are text lines using following
  format: CONFIG_<option>=3Dy. Lines starting with # are considered
  comments and are ignored.

[1]: https://git.w1.fi/cgit/hostap/tree/wpa_supplicant/README

So, leaving the comment line with the default CONFIG_TLS value isn't a
problem.

Best regards,

--=20
Paul Barker


--=-2xthEWwlODs2Go+lZ54Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaV+7TBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bqJEAQDBGLYRFmv6mU9cHCH142eVeoOX2yeXyEWt
+hFDVgzvugD/VorziUxsIxPF8XGWpZ8mM3WArHbvcfjtqIXKh0dkWg8=
=TGew
-----END PGP SIGNATURE-----

--=-2xthEWwlODs2Go+lZ54Y--

