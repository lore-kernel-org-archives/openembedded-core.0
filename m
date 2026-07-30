Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33DD1C55162
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 13:46:17 +0000 (UTC)
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12019.1785419174197185226
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 06:46:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=Nt7IcvNA;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=ed5d/r/M;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.157, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4A4547A00D7;
	Thu, 30 Jul 2026 09:46:13 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 30 Jul 2026 09:46:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1785419173; x=1785505573; bh=BW27rqjF6f
	lHD8GkQRCI/PopFyE1tnZALD38/XEmdys=; b=Nt7IcvNA3oqK92jQePSi8ZqqLD
	c82GdwhqIen6jTV0pfdMnFxEUPi5/xaWahbaLqdB11oiziJH/lDQkb9twou1/5Q+
	faezcZZAuTGZi+rcYIObykbxkUqs8rGdIO/a676uAokqC/RV0/8SwITxPFj0kgcv
	mbfyjv91N2jQZSVJ9JFbUK0LvexBJtmybcLMNMsBx0ieKkbd6m7TNY8ydqpIf4kG
	8EzWELxqhhdWCO9KbBAmsvKWCklwZKVxKpGIVhxJ9yYrgdsoIvICjHx3Y/+pVrqN
	FbiudVWBGo1r5IjQkkD2uV1wPaEYGjPVGflkCsOdTk+DQyBNQPaj2nNRyusA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1785419173; x=1785505573; bh=BW27rqjF6flHD8GkQRCI/PopFyE1tnZALD3
	8/XEmdys=; b=ed5d/r/MWQct4diPk//a4SMWY4DjdOuHKrEOe2LLqIzOJJ4i+lL
	Pj7ex86EMtSOD/f2iNXXpo/nMsYGB6KrVpaWr1tDlQcvxwH4kngQ3zd/9IXpdu2O
	4LlaGsqtEAY3QqaIvxEvSIASekxutHJj4iwy+O69uokTkUaoL8kUzZlOak0jyVxT
	ZC00Oh37UwHLzklpG2KHJNTuclA5pVnK/9E9rHa1RhJDKKf8Hi2k4gdy1opkaiV+
	5a6oyhzEvlxvsbF+YKY31ANUwWd42oP2+paITWU5kd9QkgeTOAKrScTkhRfLYKWm
	XDlet7N/+dSL5WVac7T9kiHgT9RmP5YGZ3w==
X-ME-Sender: <xms:pFVrat70AFEw1ESxYNO5XRGLjkk-Fd5ILSwtnRIF4EP5ioOeDN_Jlg>
    <xme:pFVrag5Wo3IUxy1Se9NKZPNptxMEDjJ94YOgA6-z0Ag4ph29EBXGMi9UL0JcPk0Px
    kVgyVpSSVbAbGSCLwcZo-MdBv0Km4e73wJ4BscKTikZ23YOXqiUBNt5>
X-ME-Received: <xmr:pFVraiEuDTxWmBXYLck_RQ297YvgdkrFY7MgljMO6HJfulb73059WSr-PT4UjosyqAHnFYSWXpsMW9q6ijtFZCNO5kVUTNlc3-WFWkQCD3rr>
X-ME-Proxy-Cause: dmFkZTEJro9Om4xRPafKSBW4mRSoLzvq4GhZwqkPEB3+BLp1xI4LHD0UcoGlUNPOtFICGH
    dOwb+QOW4Z9g+DnlkJD26VovpaVACEfp0mrMS+wVc9Lr7Xo2i62kYijuUP0S6yzKmkZWtS
    q/Djw0Ambl94QIrqKVD7QOmu8hJlYNhGYUitI4tXz1tm9dExNsyoqXfLiZ6Hqqu1k9uNIP
    2sxg00leSnNnYAOOPks+cnyvu0NUnCqtOmweifQrTTk5O5pPQ/YHNlkS2MfQzSTWa0jkvr
    xXpBOH4fk5rc9mTF0qLfY4d5cbvb9zXcpU7yDj00n4jzUT1dL7nUwUsudXs0uTcziklTEQ
    8NxOViaUIzPn7M27lkPzmBtHMP3TX6FHQrINEcnwX/oBkGCNu3Wctco8rjQbSN1glaM1CY
    PzO1ZmYEbqpwkpgMJjnd8MEHVU8OARUHIRT867NLVqiWswWRGPC04r/bCbbkBjkbDApl4x
    3gKt6yieeUH7Gz21uv9FvTYPhGlyqcoPevVlvSsiwA+rhGYAXtnxYLtmzPtJwsx+ILEcLB
    M+Pq95yS9XJj5v9QoZ6SiTggwbT5z1+MwermEm3brlBXcNO3YHOXMxlj4N4QLJj3uu8P+k
    zdtk5dB3xA+DLvUi80tg7rZlLYw02rpCbgBRXAxEdT5A3PAwyqlxc+jcgDHA
X-ME-Proxy: <xmx:pFVrahSTVLXE6YM2tF79jN9W455sYZEY7xWrYLymCQrFswIzTiptMw>
    <xmx:pFVrajsVXQkaCsVZYUgv4d1wvAdzCFxaG5xtCNTW-cwPHiqme1p_Pg>
    <xmx:pFVraoz3sPf1TTjfPoBmFVaTtYDUlVa-XZ4PzPUDZbZ6HC_B7u69AA>
    <xmx:pFVral7hZe0ZqSFQlTMUyc8juA4Yy33baVriYKsLkl4zMODeVbShUg>
    <xmx:pVVrahJS0xOCElx8WIw8R5tr2INLX0w9v24wCiggyY-8BuYtx3nReCUU>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jul 2026 09:46:12 -0400 (EDT)
Message-ID: <65336158366f4c89deb371942df7058cbf1a14ca.camel@pbarker.dev>
Subject: Re: [PATCH 1/1] rm_work: fix recipe self-exclusion lost when
 RM_WORK_EXCLUDE is conditional
From: Paul Barker <paul@pbarker.dev>
To: Zk47T <zizuzacker@gmail.com>, openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2026 14:46:09 +0100
In-Reply-To: <20260725143015.23804-2-zizuzacker@gmail.com>
References: <20260725143015.23804-1-zizuzacker@gmail.com>
	 <20260725143015.23804-2-zizuzacker@gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-hT2H74lMJ+kn9HAP2ZLP"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 13:46:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242358


--=-hT2H74lMJ+kn9HAP2ZLP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2026-07-25 at 21:30 +0700, Zk47T wrote:
> A recipe keeps its WORKDIR by adding itself to the exclusion list:
>=20
>     RM_WORK_EXCLUDE +=3D "${PN}"
>=20
> +=3D is evaluated at parse time against the unoverridden variable, so it
> appends to the base value. As soon as configuration sets an override such
> as RM_WORK_EXCLUDE:qemuarm64, that override takes precedence at lookup
> time and the recipe's own entry is hidden from both the python guard in
> inject_rm_work() and the shell guard in do_rm_work.
>=20
> The WORKDIR is then removed even though it was meant to be kept. For
> gcc-source that is the shared source tree the other gcc recipes build
> from, 1.4G here, so the next build needing it fetches, unpacks and
> patches it again, and anything still using it while do_rm_work runs can
> fail outright. The report has gcc-source do_patch failing.
>=20
> Use :append, which is applied on top of whichever override wins. With no
> override involved both operators produce the same string, so task
> signatures and sstate are unaffected.
>=20
> gcc-source used deltask, which had no such failure mode, until
> 1f2a3cdadac1 switched it to this idiom; the other three recipes adopted
> the idiom afterwards.
>=20
> Fixes: 1f2a3cdadac1 ("gcc-source.inc: cleanly disable do_rm_work")
> [YOCTO #16157]
>=20
> Signed-off-by: Nguyen Minh Tien <zizuzacker@gmail.com>

Hi,

We try to avoid replacing +=3D with append in recipes unless we really
have to.

The difficulty here is that RM_WORK_EXCLUDE has two use cases:
- It can be set in local.conf or similar to list recipes you are
  debugging/developing and need to keep work directories for.
- It can be set in a recipe to indicate that removing the work directory
  can break subsequent tasks.

Discussing this on the patch review call, we had the idea that we could
split these use cases into two different variables so we're no longer
worried about :append in conf files overwriting +=3D in a recipe. I
suggest we keep RM_WORK_EXCLUDE for the conf file use case and add a new
variable that can be set in a recipe to self-exclude. Perhaps something
like `NO_RM_WORK =3D "1"`?

Some discussion may be needed to find a variable name people are happy
with but the implementation should be straightforward. do_rm_work() can
check both the RM_WORK_EXCLUDE and the new variable.

So, please send a v2. And make sure you use the AI-Generated tag in the
commit message if it is needed as per our contribution guidelines [1].

[1]: https://docs.yoctoproject.org/contributor-guide/submit-changes.html#ac=
ceptance-of-ai-generated-code

Best regards,

--=20
Paul Barker


--=-hT2H74lMJ+kn9HAP2ZLP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCamtVoREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0boYdAQCUXSLiEI63c2NIW/7DQFqT7uhbjULtJr2B
urChjZcMhwD/Q/nb+gMebudpjYYiPZ9xpgXYjz2ojPpARP079ERH/AA=
=7nL2
-----END PGP SIGNATURE-----

--=-hT2H74lMJ+kn9HAP2ZLP--

