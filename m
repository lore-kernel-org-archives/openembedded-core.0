Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EADA6CD5BD1
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 14:46:27 +0000 (UTC)
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.100.1780325180881384639
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 07:46:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=ZCLN3nBx;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=OQUFRU+9;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.152, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 134521400104;
	Mon,  1 Jun 2026 10:46:20 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 01 Jun 2026 10:46:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1780325180; x=1780411580; bh=eJifFEsW1V
	l2UdzHF6O6t9dLIdOuKfzpRlwiL+1EH94=; b=ZCLN3nBxICEnDwJAoNZZNq0BeE
	PM73WUTNspkVCbmHNStp0mfggCBdefCRHmFnfuQS/DTwYAjmFA1FPgxBxaaWP6S7
	4MG9Ru5TW7kb2KGj/uLHIEg/yOtoI4bNVWC82jq3GkLEO7DiVgkGV/QlrKMbGf1d
	LvSDWgFq3xLvZwADMTLx0N4lC2c6UX9dtCZrRUW9RvHbOAvs+Esjv7aIIoS6ejCs
	Kwv4AZVA/CIRTVkEW5E+OV4i4tJsc2rQ68r1OKvNtEwt0KPjQuU3Ld0mdgQzVlrG
	nhTuGb9hpR5EJomIRlQmclYqtQLbSvoZ/oaJVYheiIjBi8IIHAYD8zHQdNvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1780325180; x=1780411580; bh=eJifFEsW1Vl2UdzHF6O6t9dLIdOuKfzpRlw
	iL+1EH94=; b=OQUFRU+9nqX7RyrKBrLitvLJ7r16vSzI/wR/AEbMib2FMpQhbQX
	/F9LsEuehkA7qjqck1vABMAoj/+IeObS08mlah3edSvE5DQS4hW296NnYIJ0JCQM
	uctluP9H2eCAiywsgDZJnhczRNYqrgE+6sk5gw/wfQxhgjuV+devy+B7FXJ+xvuR
	6dJ8V8q914DinW2GbGESnXXkanP6pebGtrCO2SsQa6/hk5RThE+LaraLOT2GgsR2
	TtUpyAZHpq7bvTworquZafafKzOg0osk2Piz9+6oEiQzdZco8eD1GX9Kb2uxH5Ou
	BclHaRR4EpdPuRzgd6gu7cDLbp0oFWDk1MQ==
X-ME-Sender: <xms:O5sdajZ2dJ0Clv0GckvvugVFwWELsiJqml0RGf3k6Mmh4ZcUewhcXQ>
    <xme:O5sdap3QZCzJ4lyA-Ksao0h16GcyNJYSs6gmXWk8XK6b_Je3yYC8175YFHd8ugHAc
    Zc2CvVd1SAhz82a6PyvJajbJ3avwcRmmFJbw_aT_BS9rzTlRlj_2g>
X-ME-Received: <xmr:O5sdajXpkyW44uFrNRr3repUhpBemjQJblWa8HvUAR0vVRM8EUf9Au8_F3cSiDhADe17IWJOrdpZsZwwhM_tsDWxjV5uyxnA_lDrHE5VoHObrMwXd0jsBhcZuEMRDhBo>
X-ME-Proxy-Cause: dmFkZTGRhyA2QI5guCZK/8IZbTSk8Cn3MehQaI4li9E1Ee4/XtfwbB5U8F6Xzc1WXxQES9
    SLJ/mK7ukSNdlosLlnHgIjcvv2br714E2getqovwVdndI8pOfInPkeOE0hvNp3ZeGiIHLy
    xOtu86R7/yKtTEvIR1bhpffmeVKMBARohaZEpToctosptjaXExuPtD5899xqD0Atd7u/KL
    emk8LRbb7mPoc2ugxmt0FZU9N4Nho43qL1AYgdYVUUl22gX1QN1Edf8SIKLdXcoDMXOBNA
    NNPkg5THHMP1kmb+BDvNCxMZAk78wvp3donczvvMXydGgMdDxI/a9v1SX6lG9+URnEUuNq
    8syI06msYSc56YzR1Xp8K5Jn6T3NeJyS5zzIbdFmUKcvEWzYdrVA7BTqd2GSeCmuJ8CQD+
    5n+fj8s1ULAee16Rs/hIE17etnRb1fgA1PIp3eq2+NSpdOUiEyTBJK4jPJGnkC815wcMBX
    0Q5rkm6TG50SYdjiI4cgBH5Ia6FUfLjymRYIz9lgctcpMXwknzEWtENRor2RWnCFfaaDjG
    YsGS/GlT6zP7EOM8j8yQ6GLBmQScQQGyuJPgmNqn7G9saGjahQ6sPP9rcRY6d8YCAROUIv
    KdAfLCOo2Dmk/qsJx83kRe97CQVqRYQhd8EAQN6enflMjlVREjaEqG10azTg
X-ME-Proxy: <xmx:O5sdajVtJr_XcRXkHEWGwmnE7h3x7oG6ebTNyY0ZeRwRJKE8rQu81Q>
    <xmx:O5sdaieZt_bJ1g4ULW4HEFILKP4mTGM7zWLdrlbp4viX3sTBSoKZLw>
    <xmx:O5sdasXASgwh0gSKq3tn0xidex5vXlBLNKVc-DjtoQisOfSGbnkpNQ>
    <xmx:O5sdarcbdF66JPjhbWfQz2uAoABavtbO9tXFr7Iw3CXnOsWvuo4-XA>
    <xmx:PJsdaj8rB6-BHaureS3S_LgArI06X2i0FPiS4qz11ZbM438t523QUgfr>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 1 Jun 2026 10:46:19 -0400 (EDT)
Message-ID: <2030b4435c8bc81bb4452637c0517ac33ab94d20.camel@pbarker.dev>
Subject: Re: [OE-core] [scarthgap][PATCH] expat: patch CVE-2026-41080
From: Paul Barker <paul@pbarker.dev>
To: "Marko, Peter" <Peter.Marko@siemens.com>, Yoann Congal
	 <yoann.congal@smile.fr>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 01 Jun 2026 15:46:13 +0100
In-Reply-To: <AS1PR10MB5697AC29B55DA6A69A54C2A1FD3D2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260505205229.2139449-1-peter.marko@siemens.com>
	 <DICSXNQ2NP29.1E7XEREU8QKR7@smile.fr>
	 <AS1PR10MB5697AC29B55DA6A69A54C2A1FD3D2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-fGn+AzCg7tOR7cxlgAi+"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 14:46:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237838


--=-fGn+AzCg7tOR7cxlgAi+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-05-08 at 07:15 +0000, Marko, Peter wrote:
>=20
> > -----Original Message-----
> > From: Yoann Congal <yoann.congal@smile.fr>
> > Sent: Friday, May 8, 2026 12:36 AM
> > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
> > openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [scarthgap][PATCH] expat: patch CVE-2026-41080
> >=20
> > On Tue May 5, 2026 at 10:52 PM CEST, Peter Marko via lists.openembedded=
.org
> > wrote:
> > > From: Peter Marko <peter.marko@siemens.com>
> > >=20
> > > Pick github PR [1] mentioned in [2].
> > > *
> > 969af8f4654ce50d837bb9199a73d1d02d2c7e16..4ba09dc471b39a78d77e5179d0243
> > 186c0c4ff7a
> > > * dropped code which doesn't exist in 2.6.4 yet (github actions, map
> > >   file)
> > > * resolved minor conflicts (formatting)
> > > * picked 2 additional commits to apply the code cleanly
> > >=20
> > > [1] https://github.com/libexpat/libexpat/pull/1183
> > > [2] https://security-tracker.debian.org/tracker/CVE-2026-41080
> > >=20
> > > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > > ---
> > >  .../expat/expat/CVE-2026-41080-01.patch       |  50 ++
> > >  .../expat/expat/CVE-2026-41080-02.patch       |  29 ++
> > >  .../expat/expat/CVE-2026-41080-03.patch       | 467 ++++++++++++++++=
++
> > >  meta/recipes-core/expat/expat_2.6.4.bb        |   3 +
> > >  4 files changed, 549 insertions(+)
> > >  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-01.p=
atch
> > >  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-02.p=
atch
> > >  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-03.p=
atch
> > >=20
> > > diff --git a/meta/recipes-core/expat/expat/CVE-2026-41080-01.patch
> > b/meta/recipes-core/expat/expat/CVE-2026-41080-01.patch
> > > new file mode 100644
> > > index 00000000000..0c6af75a5de
> > > --- /dev/null
> > > +++ b/meta/recipes-core/expat/expat/CVE-2026-41080-01.patch
> > > @@ -0,0 +1,50 @@
> > > +From fe04a7f0ff8afe57ba33d919f368b1ba23bcda92 Mon Sep 17 00:00:00 20=
01
> > > +From: Sebastian Pipping <sebastian@pipping.org>
> > > +Date: Sun, 30 Mar 2025 19:26:55 +0200
> > > +Subject: [PATCH 1/3] lib/xmlparse.c: Address clang-tidy warning
> > > + misc-no-recursion
> > > +
> > > +CVE: CVE-2026-41080
> > > +Upstream-Status: Backport
> > [https://github.com/libexpat/libexpat/commit/fe04a7f0ff8afe57ba33d919f3=
68b1ba23bcd
> > a92]
> > > +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > > +---
> > > + lib/xmlparse.c | 17 ++++++++++-------
> > > + 1 file changed, 10 insertions(+), 7 deletions(-)
> > > +
> > > +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> > > +index 9bc67f38..cb25c37b 100644
> > > +--- a/lib/xmlparse.c
> > > ++++ b/lib/xmlparse.c
> > > +@@ -1243,9 +1243,10 @@ generate_hash_secret_salt(XML_Parser parser) =
{
> > > +
> > > + static unsigned long
> > > + get_hash_secret_salt(XML_Parser parser) {
> > > +-  if (parser->m_parentParser !=3D NULL)
> > > +-    return get_hash_secret_salt(parser->m_parentParser);
> > > +-  return parser->m_hash_secret_salt;
> > > ++  const XML_Parser rootParser =3D getRootParserOf(parser, NULL);
> > > ++  assert(! rootParser->m_parentParser);
> > > ++
> > > ++  return rootParser->m_hash_secret_salt;
> > > + }
> > > +
> > > + static enum XML_Error
> > > +@@ -2321,12 +2322,14 @@ int XMLCALL
> > > + XML_SetHashSalt(XML_Parser parser, unsigned long hash_salt) {
> > > +   if (parser =3D=3D NULL)
> > > +     return 0;
> > > +-  if (parser->m_parentParser)
> > > +-    return XML_SetHashSalt(parser->m_parentParser, hash_salt);
> > > ++
> > > ++  const XML_Parser rootParser =3D getRootParserOf(parser, NULL);
> > > ++  assert(! rootParser->m_parentParser);
> > > ++
> > > +   /* block after XML_Parse()/XML_ParseBuffer() has been called */
> > > +-  if (parserBusy(parser))
> > > ++  if (parserBusy(rootParser))
> > > +     return 0;
> > > +-  parser->m_hash_secret_salt =3D hash_salt;
> > > ++  rootParser->m_hash_secret_salt =3D hash_salt;
> > > +   return 1;
> > > + }
> > > +
> > > diff --git a/meta/recipes-core/expat/expat/CVE-2026-41080-02.patch
> > b/meta/recipes-core/expat/expat/CVE-2026-41080-02.patch
> > > new file mode 100644
> > > index 00000000000..953f93c68a9
> > > --- /dev/null
> > > +++ b/meta/recipes-core/expat/expat/CVE-2026-41080-02.patch
> > > @@ -0,0 +1,29 @@
> > > +From 7fb2c7a454edc9e2880073a27f899c31d9b078ce Mon Sep 17 00:00:00 20=
01
> > > +From: Atrem Borovik <polzovatellllk@gmail.com>
> > > +Date: Sat, 20 Dec 2025 13:22:16 +0300
> > > +Subject: [PATCH 2/3] WASI: remove getpid
> > > +
> > > +CVE: CVE-2026-41080
> > > +Upstream-Status: Backport
> > [https://github.com/libexpat/libexpat/commit/7fb2c7a454edc9e2880073a27f=
899c31d9b
> > 078ce]
> > > +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > > +---
> > > + lib/xmlparse.c | 5 ++++-
> > > + 1 file changed, 4 insertions(+), 1 deletion(-)
> > > +
> > > +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> > > +index cb25c37b..1bafb948 100644
> > > +--- a/lib/xmlparse.c
> > > ++++ b/lib/xmlparse.c
> > > +@@ -1228,8 +1228,11 @@ generate_hash_secret_salt(XML_Parser parser) =
{
> > > + #  endif /* ! defined(_WIN32) && defined(XML_DEV_URANDOM) */
> > > +   /* .. and self-made low quality for backup: */
> > > +
> > > ++  entropy =3D gather_time_entropy();
> > > ++#  if ! defined(__wasi__)
> > > +   /* Process ID is 0 bits entropy if attacker has local access */
> > > +-  entropy =3D gather_time_entropy() ^ getpid();
> > > ++  entropy ^=3D getpid();
> > > ++#  endif
> > > +
> > > +   /* Factors are 2^31-1 and 2^61-1 (Mersenne primes M31 and M61) */
> > > +   if (sizeof(unsigned long) =3D=3D 4) {
> > > diff --git a/meta/recipes-core/expat/expat/CVE-2026-41080-03.patch
> > b/meta/recipes-core/expat/expat/CVE-2026-41080-03.patch
> > > new file mode 100644
> > > index 00000000000..4d17f1a0b0e
> > > --- /dev/null
> > > +++ b/meta/recipes-core/expat/expat/CVE-2026-41080-03.patch
> > > @@ -0,0 +1,467 @@
> > > +From b77ab600e1893fdcfc3868d0a46efcc87c87943d Mon Sep 17 00:00:00 20=
01
> > > +From: Sebastian Pipping <sebastian@pipping.org>
> > > +Date: Wed, 8 Apr 2026 15:41:54 +0200
> > > +Subject: [PATCH 3/3] [CVE-2026-41080] Improve protection against has=
h flooding
> > > + (fixes #47)
> > > +
> > > +Fixes #47
> > > +
> > > +CVE: CVE-2026-41080
> > > +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull=
/1183]
> > > +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > > +---
> > > + Changes             |  16 ++++++
> > > + doc/reference.html  |  51 ++++++++++++++--
> > > + lib/expat.h         |  12 ++++
> > > + lib/internal.h      |   2 +
> > > + lib/xmlparse.c      | 118 ++++++++++++++++++++++++++------------
> > > + tests/basic_tests.c |  25 ++++++++
> > > + 6 files changed, 181 insertions(+), 43 deletions(-)
> > > +
> > > +diff --git a/Changes b/Changes
> > > +index 4265d608..1d87d6a0 100644
> > > +--- a/Changes
> > > ++++ b/Changes
> > > +@@ -30,6 +30,22 @@
> > > + !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!=
!!!!!!!!!!!!
> > > +
> > > + Patches:
> > > ++        Security fixes:
> > > ++       #47 #1183  CVE-2026-41080 -- The existing hash flooding prot=
ection
> > > ++                    (based on SipHash) only used 4 to 8 bytes of en=
tropy for
> > > ++                    a salt, when 16 bytes of salt are supported by =
the
> > > ++                    implementation of SipHash used by Expat. Now fu=
ll 16 bytes
> > > ++                    of entropy are used to improve protection again=
st hash
> > > ++                    flooding attacks.
> > > ++                      Existing API function XML_SetHashSalt is now =
deprecated
> > > ++                    because of its limitations, and its use should =
be
> > > ++                    considered a vulnerability. Please either use t=
he new API
> > > ++                    function XML_SetHashSalt16Bytes (with known-hig=
h-quality
> > > ++                    entropy input only!) instead, or leave the deri=
vation of
> > > ++                    a 16-bytes hash salt from high quality entropy =
to Expat's
> > > ++                    internal machinery (by *not* calling either of =
the two
> > > ++                    XML_SetHashSalt* functions).
> > > ++
> >=20
> > Hello Peter,
> >=20
> > I don't know if we can consider CVE-2026-41080 "fixed" with this. A cod=
e
> > calling the existing XML_SetHashSalt function will keep be vulnerable
> > even with this patch...
> >=20
> > Maybe we can apply this but leave the CVE applicable to let downstream
> > users review their expat calls?
> >=20
> > This might be one of the rare case to use
> > CVE_STATUS[CVE-2026-41080] =3D "vulnerable-investigating: ..."
> > to grab attention of users?
> >=20
>=20
> Hello Yoann,
>=20
> I don't really like that idea.
> What=E2=80=99s the difference to master where the same patch (included in=
 release upgrade) marks it as patched?

Hi Peter, Yoann,

I took a look at this. The CVE "fix" is to mark the existing API as
deprecated and add a new API. That means that users of the old API will
continue to have insufficient entropy. The patch here is *necessary*,
but not *sufficient* to address CVE-2026-41080.

The fact is that there is no standard definition of what is meant by
"patching" a CVE. The correct thing to do is to chase this up the stack
and ensure that all callers of XML_SetHashSalt() are updated to use the
new API. That is not something that I or Yoann have the bandwidth to do
though.

I think on balance we should take the patch. It's not ideal, but it's
what we've got. We could raise an issue upstream that this is not a
complete fix for existing API users.

Best regards,

--=20
Paul Barker


--=-fGn+AzCg7tOR7cxlgAi+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCah2bNREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bofNAP95H7PJsiF463kOc39yrDzrY2yNSa+DCzRX
cAjUhammkgEA7nGXdiVRXWNTIVu0tOKWe/6kP2gZxB8l6HyIgbj4Hgw=
=s0p2
-----END PGP SIGNATURE-----

--=-fGn+AzCg7tOR7cxlgAi+--

