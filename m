Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80350CD6E4A
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 12:16:56 +0000 (UTC)
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23860.1780402610267360687
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 05:16:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=VPEFU/gv;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=XlRmVKy7;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 450071400286;
	Tue,  2 Jun 2026 08:16:49 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Tue, 02 Jun 2026 08:16:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1780402609; x=1780489009; bh=iQvWas4nlV
	CKN43KSS/lDU/jGtcBKzlRlHHKIa/sdo8=; b=VPEFU/gv0hHj+dBXz49oGGOhb3
	iX8WtqAaT5DcJxrzpeRaIlQKSXGdSxpFkzZOtBDWrY3AB35ZfyvUzoFbps89ExKo
	6un9hgCpsPVnji6UfK8pUFBzZ3bCQcizjwyD/+SvWD7zTBnnTs+15uRZurtyjxNC
	FIiAmrFjQuE92RCCAU1t3v0PZpMGwhw6dCBHacuaYcJ5g8c0c1EBiSAu3Y1zT/fh
	0ZDdEY4uRUVPwqoldsHaBq+IKMC9njNXkW+/WjcR0O2i7xIur2LL79h9nIABEbau
	KKMB8hQypgRzWGsAnqc0z7E5/6yienoJC2SKGxDN9vzHrCLC00Ntqz1oeRYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1780402609; x=1780489009; bh=iQvWas4nlVCKN43KSS/lDU/jGtcBKzlRlHH
	KIa/sdo8=; b=XlRmVKy708QgFwozbZpOFSFEzOs3g06/4q7Iu0Ujsm086VJ5lY/
	66LmDeH+T4lsgZoy30ATJAHOyVw9cioLSacHE+2LT5SZ5+q40s3PYnHHla6TM+wX
	SIr6Hr3kiZbD0YTdjQCAnaj19i5MAkHXCsGOZG59SFmVmHmGKj081oukPgfPEeDU
	7/FTDsiRQzplau4d/H/tz595bpom69nE+/v8iKdToAovLOe/VpfRnKW8NOUZ9LTS
	hnRkgTmo/6F0i4AdJVj/qHL55ApLvz0wHud4CyLy9+BiMzUXlJKEzzN2WZ0FPWaE
	hid/V7YtriOZkF8cONwkjWj4HugPIFHsYEQ==
X-ME-Sender: <xms:sMkeaoIcSVp9t7vYBzU7D0TpbvR7mROQOfdrI3mOK6K9fM-xn6Uf9Q>
    <xme:sMkear0wBxy6rBWiIC2jQxhvj4UtT-ajk7pra-NTt9n4qd7feT-ZMHkb9EwJPIJjO
    ZnAV0YKQMN_1my6gC4-EnFZudIuFja7XWrqeSUfUxBXL1_JRH5iRrU>
X-ME-Received: <xmr:sMkeaijp2IFJOyHs95QBJLY-PBDFedz4OhNvWHi2qxp74bsvNcODk4Qz9suR2dXPixEtbiVIRmY4Bs9XCLDXuUuOEsJkX1MC2E65zXLf0vFAAOtXvwGeNLg7q5JX5jIy>
X-ME-Proxy-Cause: dmFkZTFBk2FtSMohHJZGTvlAAFvC6E5r5EoQPt+QAXHKu2tk3AdrVCRNEcDpKx5ZxdU5P1
    WFFWtslpDfe0aFEb0t5ZiVLXX9wW12umCSUWkmf9iMaGX9/DmOkdccX1A0swkPe+siVzrr
    YZf1/D1rO7tlwNSFc71zGdlJ9F6m3OF2/Ei8xK4DerH19THwEh8BHGLnmDx/VEo/WK4AFY
    qaCbTS63HBHLQ20mB1zxe6Dd7/XPPp2i3RnuZxJjEPWcZYrf/OmwOoNC5H9IUkTjGOdhSF
    KSaCNOJcivOmpS2zq5BuSPy3JQuyv3+teBtEMEXor9GG+1FjGerG2K6fjDQxE+6Tw3riNU
    fPocWJC38PuUMFXW8PCmtC2erPrviZ11Jm/djl7r/irzJZDyEEVN9pyAvkLsVJK3EXZBKY
    wale8u5wg8+vu5notox5JRbHGvNZ9is7bUOk9yC9HVmhZuU7NIJDagE8iEpy9p9FRttaLG
    UpsYiUXEDAyy+Qhayn58Skuepc1sRRpv2iacy3NGkKMD/Wc8PfJqiNId3oSAqlnQx3hOOd
    a5LFLvcFN92XwJd0lW5TIgchOuu2vinVDDJb3U0PfVkyfqEiXVJgizBHdELj9cnMSF3dus
    zzxZDMFIO1qY9Gf4TFnGAUVEAGG0Rov3+dt2SRiYSjwuYMWRsHXCaJFXgRug
X-ME-Proxy: <xmx:sMkeasWloq8LM73llDoZKNZ89PsHo-_Fj_GEAe3WX1YMez8c5glOsw>
    <xmx:sMkeahViQfe7m0bFquTAPBxWtC997-zE9ttkRPNkLvgP732LsvveXg>
    <xmx:sMkeasi_gTXp7iokgGcqjJKYMSPU92RLzm-vnversNPdacw5kl54Fw>
    <xmx:sMkeasbO9KRG9yiGfk9m16SSMc-fyrS0tzLndZn592sRUShN-7eouw>
    <xmx:sckeaiZ68ZZa1tKO7TafT_53UFkJaAc-RWXCo1WXLy1Aqi6fzI7ZdN6K>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Jun 2026 08:16:47 -0400 (EDT)
Message-ID: <2706d4a0dcf7b8607f562bc72c52be0d9233881b.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v5 1/4] oe/qa.py: add check_uri_srcrev()
 helper for SCM URI SRCREV validation
From: Paul Barker <paul@pbarker.dev>
To: yoann.congal@smile.fr, Sai Sneha <saisneha196@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: corentin.guillevic@smile.fr, martin@geanix.com, 
	mathieu.dubois-briand@bootlin.com
Date: Tue, 02 Jun 2026 13:16:44 +0100
In-Reply-To: <DIYF1E7O5JV0.8F9SHGFX5ZHY@smile.fr>
References: <20260602062940.3107241-1-saisneha196@gmail.com>
	 <20260602062940.3107241-2-saisneha196@gmail.com>
	 <DIYF1E7O5JV0.8F9SHGFX5ZHY@smile.fr>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-CnR4E0uV1AMUY+AHuMKA"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 12:16:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238044


--=-CnR4E0uV1AMUY+AHuMKA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-06-02 at 10:21 +0200, Yoann Congal via
lists.openembedded.org wrote:
> Hello,
>=20
> On Tue Jun 2, 2026 at 8:29 AM CEST, Sai Sneha wrote:
> > Add a shared helper function check_uri_srcrev() that checks whether
> > a single SCM URI has a valid SRCREV set in the datastore.
> >=20
> > The function uses unexpanded getVar() calls (False flag) to safely
> > inspect SRCREV without triggering AUTOREV expansion or live network
> > fetches. It mirrors BitBake's internal SRCREV resolution fallback
> > chain exactly:
> >   SRCREV_<name>:pn-<recipe>, SRCREV_<name>, SRCREV:pn-<recipe>, SRCREV
> That sounds wrong. Bitbake uses the *expanded* value:
> lib/bb/fetch2/__init__.py:
> 1256         srcrev =3D d.getVar(a)
>=20
> It needs the expansion to handle every possible overrides (for example,
> MACHINE or DISTRO, but those are not the only one)

I don't think we should be handling overrides here at all, that's the
job of the bitbake parser.

Best regards,

--=20
Paul Barker


--=-CnR4E0uV1AMUY+AHuMKA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCah7JrBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bgeJAQD5DHsrZqBJAsfPaR9PpWg3jG5WEuiwp4Dm
X0YMQRMvrwEAqZ3fxP/3WkfW7RPngZxspNBKyAkuCBBLx86/rXQ9gQ8=
=mitV
-----END PGP SIGNATURE-----

--=-CnR4E0uV1AMUY+AHuMKA--

