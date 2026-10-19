Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2257BCCF2DA
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 10:01:40 +0000 (UTC)
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31066.1792404098591378898
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 03:01:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=FTeVIsiE;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=WNmqQpbq;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.147, mailfrom: paul@pbarker.dev)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id D5EFC1D00073
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 06:01:37 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Mon, 19 Oct 2026 06:01:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792404097;
	 x=1792490497; bh=0Ow8hb15SID+B9ihw95YBzoeAfI6A29kWDgkpCZnk5I=; b=
	FTeVIsiERVuhof+t0atKZM/UNYAXqJHZxr2nJJV/l4sk11/1NXeOgUp2ABCJ1a/h
	fIkiLidlUfQr3X1/XpQ6qNzrKSF46k7J+F5lEOuyWx9YWdlS3WIFZ6oAVWwBgwDy
	eCDq8CbbsMCEWP1jKRJ7UxMtM+MzLqphKhsVt0YmFn9m5ZPWBeZ9UXM805/ujdgg
	vrrzlOYUyyUwQ/TiWEdXTs96eQW7vb0ZQKualsNDhNRZfOFaL6WKaiLdRK1xQpVW
	cOCB64H8lAbxj4yxzu26QOG6Gu02dARbcOicE81ufU4VHpRNQzJDtUAlO/bmNVbe
	eI8dBugXCqVgPmk2eai0ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792404097; x=
	1792490497; bh=0Ow8hb15SID+B9ihw95YBzoeAfI6A29kWDgkpCZnk5I=; b=W
	NmqQpbqH8U7/BwsZVGxnIKCiEd0HYYky1/YNhGEP/6U5n5A+4gV+Oort02cSKNo8
	QBl1tEQgg0InLIId+fZhyiHbmWZeUDkdR2NT0wlJI+vZBVd3AT4L5i7f/2E4JJ1N
	27oj0BtzqrC5pRhy+zdyolsp83lWmX39a1NCpVxlWCd8umuyJd09oVO+/jlQC32p
	aq13ppxDNHhphWdwtRsLKeypYaKrdSOe7sf41qdYSNZyeUpQn2053agu94dPzUWl
	+DQTK6xmOvnXUoKOBLqU9gNorVy9h0QbG9OActds86c5L4qSN3/y9J6CeL7nVe7r
	4k0uii60A9nWxfNQsWQyg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792404097; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:hOOIW4EoNq1qlSTestsjjQtmgxK/9ePllfk5OsQovs5/RFi
	TGxLwEacftojY5Ob7qLxXsnxZzP4U5eFmJBXMQZOPXjaj9z/1ouupgS5IRlE80Ik
	QfPoh+J489KJgKQgFpiMTvG7Fs0IcGdDZWHKgJFdr8dUSPqfXVFqamp+Q8fDMqWi
	zIiPnQXp6jb1itH1LVY7BGLQpTKT+VIGV79kEB6LO7UtKj2cSDUQRMqSEkFkAPhI
	Ac6yJiDc0W4NvpfD2mat2Kq9UBunRtzxZC5j0RsDYOZ4aX39S1sWNKfgjnLDr44p
	icF5PkwpbhdMH9XqexcdAQ3KEmBqyQtv+8nFq9w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to,
	user-agent;
Message-Instance: m=1; h=sha256:EncKePdM0YfNKF0gkpeabGdw5to38hcCJNodNYcX1vg=:wbJVtpUUDgLQEjL0n7D7sMUkDQvJm6ygiEPpwHSdypA=;
X-ME-Sender: <xms:gerVajTbyIW7YJv4KJ6tlGhR6q66cGVEvFHyw0yTOqk-ZpDxhQuMgw>
    <xme:gerVak6O96H6SD7LOTI2ktyI9csKm5tOGYYzCV2BZNOSvgarwRYs3HW4H1wvjB3mz
    HOi9e5oCTTEX8efUm04Y2Q_CGJVycJLkuYkEgbGlwAPrsmek9TcDipITw>
X-ME-Received: <xmr:gerVagy1_KHNI6u8RK7vfjBqfoSEvL8uq2suLA_BNND4CKvSmkLAiqXQLqFDkPpZ3mHheE3_4BBB4QJwrTOxskrXN9sgLt7GlSWi>
X-ME-Proxy-Cause: dmFkZTF2+33GmmsX56IYRV3yQWfb+15Yy0p/UgNf1oiPDjMg+Bj3BmAxWjKI7AIC/yY1VZ
    jyCx8vzY9VPoh1CpcivCKg43BkhWpivKLcOCW4AdSVAkEffqZ513Mc2yr1j61jhL60yk6+
    F9u/eRRWMahJgLnYqwNJtN6SQKsayV1DtaD0mdc7EiDomqj/+D7qzRHeynme53UGTR1gTr
    3Qya5vEMdrQQfUw3vbICocaMmjscJyTlnhnRIj0isEJeXoqWCLXgI+YPvDr7PdUIQT75Jn
    VfJ6xaASw5pVZyDdA9Kj0kKmahWzxyjnS6gOQDN2IVO1/fnJLPaGYRfSykUINOFGA63/ZN
    TcoRRYAdW0AS9m2hObu+iQVrpkobetgiS7qZiv5lbl2ZfnrfblmaEAz5z0jW9Rl7pPlqlY
    mshKFrMRdTRi+c8V3rDTAElNqZJYCoSB1W4rIYwC9tiVoa0Hs6Wvk9saEX7aKijaMReZs6
    U76Okzav68V0OXoGilua/5EDlSOMO5akTL6nZfqNdNcJHojy1AO0vg/MspZ49W7tqqVpxI
    /vekd+rcj4DZvEFZUhEA21R7OKxEleARXZJhrhDMzVkXJo0b2ww38j5c4sAUZ3U8bl8eB0
    5K1B4AMwTJayuctwmtWR0G7ykc/sT+D/9gFASNEXXWOqxWwGwJKwEKQBndMw
X-ME-Proxy: <xmx:gerVarSegLV-JI6uXgJkNEplvCAZXzJPLVd8blQ_PwIhbsSQJGHGTg>
    <xmx:gerVanVYM6rSZ6EDD9XqvZPNWF-fnF8AQ2Ou3uFa2vTvss2XO1fG9w>
    <xmx:gerVatbVUXSqm9dhe20jn-52kEzMmiZgvQTZwpkVO6yzvwy6zioDxg>
    <xmx:gerVat2Ff298ldrsiBAhgBBTk2ZwIF-va8WCqMwmTzmQhfwfagdwdQ>
    <xmx:gerVasWPMQkqCP8O_feeYQtzsZvxoz3M-QIcEU-hdxNzSiZu9LkNVt5p>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Oct 2026 06:01:36 -0400 (EDT)
Message-ID: <9e6351239603c2e47c1c907fb9f6e3d52bd9cab2.camel@pbarker.dev>
Subject: Re: [PATCH 3/3] checklayer: Reuse signatures of an identical
 successful world dump
From: Paul Barker <paul@pbarker.dev>
To: Otavio Salvador <otavio@ossystems.com.br>, 
	openembedded-core@lists.openembedded.org
Cc: Luciano Dittgen <luciano.dittgen@ossystems.com.br>
Date: Mon, 19 Oct 2026 11:01:35 +0100
In-Reply-To: <9d881ab052f16c456def4f644c6783dcaa276512.camel@pbarker.dev>
References: <20261017225656.680168-1-otavio@ossystems.com.br>
	 <20261017225656.680168-4-otavio@ossystems.com.br>
	 <9d881ab052f16c456def4f644c6783dcaa276512.camel@pbarker.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 10:01:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248155

On Mon, 2026-10-19 at 10:04 +0100, Paul Barker wrote:
> On Sat, 2026-10-17 at 19:56 -0300, Otavio Salvador wrote:
> > test_signatures and test_world dump the same world signatures, with and
> > without -k, and so do test_machine_signatures and test_machine_world fo=
r
> > each machine; when the dump succeeds, the second only repeats a world
> > parse. Keep the signatures of each successful dump, keyed by the layers=
 in
> > bblayers.conf, MACHINE and extra variables, and return them when the
> > same dump is asked for again. A failed dump is not kept, so the world
> > tests still run it and report the failure.
> >=20
> > Tested on meta-freescale with two machines: 5 world dumps instead of 8,
> > same results; a recipe breaking world on one machine still fails
> > test_machine_world for that machine only.
> >=20
> > Suggested-by: Luciano Dittgen <luciano.dittgen@ossystems.com.br>
> > AI-Generated: Uses Claude Code (Claude Opus 5.5)
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > ---
> >  scripts/lib/checklayer/__init__.py | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklaye=
r/__init__.py
> > index aa19a8e2ae..8838a7df48 100644
> > --- a/scripts/lib/checklayer/__init__.py
> > +++ b/scripts/lib/checklayer/__init__.py
> > @@ -287,9 +287,18 @@ def check_command(error_msg, cmd, cwd=3DNone):
> >          raise RuntimeError(msg)
> >      return output
> > =20
> > +# The world signatures of each dump that succeeded: the tests ask for =
the
> > +# same dump with and without -k, which only differ when it fails
> > +signatures_cache =3D {}
> > +
> >  def get_signatures(builddir, failsafe=3DFalse, machine=3DNone, extrava=
rs=3DNone):
> >      import re
> > =20
> > +    with open(os.path.join(builddir, 'conf', 'bblayers.conf')) as f:
> > +        key =3D (f.read(), machine, extravars)
> > +    if key in signatures_cache:
> > +        return signatures_cache[key]
> > +
> >      # some recipes needs to be excluded like meta-world-pkgdata
> >      # because a layer can add recipes to a world build so signature
> >      # will be change
> > @@ -320,7 +329,7 @@ def get_signatures(builddir, failsafe=3DFalse, mach=
ine=3DNone, extravars=3DNone):
> >              # in a world build lack some dependencies. There is a
> >              # separate test_machine_world_build which exposes the
> >              # failure.
> > -            pass
> > +            key =3D None
> >          else:
> >              raise
> > =20
> > @@ -362,6 +371,8 @@ def get_signatures(builddir, failsafe=3DFalse, mach=
ine=3DNone, extravars=3DNone):
> >      if not sigs:
> >          raise RuntimeError('Can\'t load signatures from %s' % sigs_fil=
e)
> > =20
> > +    if key:
> > +        signatures_cache[key] =3D (sigs, tune2tasks)
> >      return (sigs, tune2tasks)
> > =20
> >  def get_depgraph(targets=3D['world'], failsafe=3DFalse):
>=20
> I can see this caching causing issues in the future if we change the
> test cases but forget to update the way we determine `key` above.
>=20
> I would prefer to modify the tests to call get_signatures() once,
> possibly in a setUp() function for the CommonCheckLayer class, storing
> the result so it can be used in multiple test cases. That may need a
> change to get_signatures() so it always runs bitbake with `-k` and
> returns the success/fail state to the caller. Then test_world() would
> check the stored success/fail state and test_signatures() would ignore
> it.

Sorry, I mean setUpClass(), not setUp().

Best regards,

--=20
Paul Barker


