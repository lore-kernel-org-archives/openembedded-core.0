Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C9CCCA462
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 13:40:12 +0000 (UTC)
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21963.1792158006157738903
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 06:40:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=N4ikvh+q;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=a/CsoqLR;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.145, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 5A4391D00150
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 09:40:05 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 16 Oct 2026 09:40:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1792158004;
	 x=1792244404; bh=Se5UtrYm5Rs4yfO+p+RjF/8bYZrsI0vqjiUyXpPSzzs=; b=
	N4ikvh+q1K+MbERIrb9vd8buHX2yfrYn7EjA9XGUKZz/yAzqQoAtsU9EXMC31jxQ
	GwvNOZjXxpBGe/kerF5fEv7gUPM4y/D1HWr1GlBiTF5X6HUgT0hj3+Xem9owQ4aA
	sfb/9uY/zLDWCCjcmdhl5Zrkrtbcc5La3C80DArKZgzMcK7xw6lnswBBbBZiqN+I
	LQwln0dOACbTjVAcJN3OF13IPSF+5ckOsjiYNX3OhW3pnTHoFpi+1vxaViUd39WT
	SF+f8Dk2sy5M+lIwIX8MPLTHhks+QNh8hkm35Rd8+QVHIBys3AFIcprScuIWH6hD
	3Eemf+8bth73Pj4j95ur9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792158004; x=
	1792244404; bh=Se5UtrYm5Rs4yfO+p+RjF/8bYZrsI0vqjiUyXpPSzzs=; b=a
	/CsoqLRGfU9EAZsdUDnY3uUGVTrLGCR0lZqC5B7+zng0y1Y5b/bWGm3ez7NoRXdg
	mQ28JwHgIq9Rkt5+yr+t9G4EApQDrQIa8sxjp/HYVxToWJcznhg+8sh8A6xQhWvu
	uJx7IRpTRAB0rH1sxR6FwXW0t4dSrJegcTFA9sOiDsCjvjjHYx0vc28Uq/e1y0i7
	1W5rksrRoKFNonoKApbmfviRXg09HLTT8E2LnlfFdttiTmh9RwDnXyIRgiqGGhuZ
	TgSBq/FIcX659s2EgZfjJkNvs4UAIVdVty5jJWguVtRJHEKQjDQS+g5L/7rRjBZ9
	lZoxqFXdZ7sfVXkjgOUng==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792158004; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm3:rsa-sha256:TfXiDo+S76mcEzCWnICLSYju1uHeNhWQB32gH7h4Pmuxu6K
	z1CoY5GjXW5ZS6uzm48DT1eFUZmm/hBtkDjZUo6FIvxt8xutBpuyd36AKmiu2mwh
	3mV2TUWo8dHpJYOtdtHy7JIzy8zYiJvKKQDMQ0FQytKars29xwFJuEpgfuE9gbOq
	mOppyiLOYvDWG772mKXzHRSse9VRV6xGtcgJdQxR8TZPzCAxVsYSvnSZj2hmUqZ6
	7h5Rm4+EVp64ub+Dusl7T4nRengI+5eoCku8146PiaJsILVck1PYJcvxwW0uwUcU
	qE4lDHV14kY04RV4tYJ8cCsPz2wIzoKaNtp0OVg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to,
	user-agent;
Message-Instance: m=1; h=sha256:EdLwVr7XwGezvxDm8DWXRZHycdx0Wl3JRJPKlNl2FE0=:nra4miG0sto0X6y7aeQMM2xpfZlx6b4BOh46sOFbhck=;
X-ME-Sender: <xms:NCnSan-O21RWdFi9s034akU_qzdv46ym0v5dzpn8PCae_DgijrcWQg>
    <xme:NCnSaqmswv2owtYTjrPFi5xSnEDzXywZ-q895KOpPWTDU5Wg6sAA0ii1Jh449utFq
    hbgyknFLF0t-uA0rKuBA-hQCy1475NB9kKT_DcdCOaQ22L7Xb1xNTM>
X-ME-Received: <xmr:NCnSatXs4U-N_eATfOOtzxz8j7VUzeciEbtEqV4Z2kDMvS6-gXbrKkWGjFhg2WFgtFN2t_j3iRUjzn08OCOvpxJMjQd0IGJnLyOR>
X-ME-Proxy-Cause: dmFkZTFETPz1ZitGudAR3jpSYBb3A95EQWYE+KGatOtGjf+y5TWHRdzNgdPTmGI+o/H7yG
    yMb0Y6SdW9GuYx7yyPqRI4zDfOo81Ue5uDrqdotQzMwPxKvuFCZZq0tZzC30ZdU/6AOFmG
    oYIE/kKUDvwfI0PrWtutLvy2mwgoUOV5OFezB5eAk4u4gSCBYmpSsKp/74D5zWDGJxgQHV
    fyH7pfApXNu5kTLC2l+qHkI2VU4rFEWhjdQq/xzAJ4VFlx25ROwvbUm8hH/aGauk5dczls
    Wgq+Q7s7dok4SAknhNkH+9h/XxMvsjnY8J5SC6bV0pe3/Mnao0QK2ChstczefsIwDgVASx
    j0c7U577C7IrhSvFKtmQm52khqmUGhT8RE66aJMkUn3lzfD68zAuHcIFVZAFCkBWBtEWfg
    1tiwf4/FXigR9zTDfcEoiI6eFRhZSNbb52lb44J3bkpd9er7m1dKiQnuhKt+eJy3bXsjr5
    Un4XHxOFUKVquMAGI/ekDxGVr4O/ITinb9hXgXZyeo5Zb/baD+Tj3JmA5jk7FLYDeq0zoP
    xrrbJrEaJf7SbWtegIryeM6E8/1gp/wnUOCHT2ziGF+4GKvgjur6oIc+AgPbbIty3Rehse
    sL3/ITrZbp0U7+ZcEaCnhe9o/PeTywGDF+Sj7I6GHZ6ABnSY1sEpZomjExZg
X-ME-Proxy: <xmx:NCnSavFe9o39RiudzptKzj8T5QbTc403ctTTSdeqylPfP50hOoqijw>
    <xmx:NCnSapevdIR-bscPJgje9yvthOye5RAvrBYTZOyAzl8vI2TzKL-Fww>
    <xmx:NCnSagLHoBDRdMIj1LwJ0G-3OcbOFRLUbnzH53ns9WRHX1C1f8T4_A>
    <xmx:NCnSauHPUQ8bBC758S__-gG9Y2HkoBlsH93hXomt7jrgqlMhB7zNMA>
    <xmx:NCnSas_eNfSrmhzroVsGInK3ivT7Aiah61zeGcLdbGSmvIfpIodx3Gw3>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Oct 2026 09:40:03 -0400 (EDT)
Message-ID: <8de4149b86177076217c3f815f2f93b6bb731277.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v2 RESEND] classes/archiver: fix tarball
 content in "original" mode
From: Paul Barker <paul@pbarker.dev>
To: Joao Marcos Costa <joaomarcos.costa@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com, yoann.congal@smile.fr, Richard Purdie
	 <richard.purdie@linuxfoundation.org>
Date: Fri, 16 Oct 2026 14:40:00 +0100
In-Reply-To: <0c085fe9-05c8-42c3-a2e3-295b5bdc6e99@bootlin.com>
References: <20260918092711.471982-1-joaomarcos.costa@bootlin.com>
	 <84b5b50f-c507-4e35-8090-2a13b79fd4e3@bootlin.com>
	 <b398788ff33f7042add03b695235d157ab2bb3b3.camel@pbarker.dev>
	 <0c085fe9-05c8-42c3-a2e3-295b5bdc6e99@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 13:40:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248024

On Fri, 2026-10-16 at 10:08 +0200, Joao Marcos Costa wrote:
> Hello, Paul
>=20
> Thanks for your reply.
>=20
> On 10/15/26 10:04 PM, Paul Barker wrote:
> > On Thu, 2026-10-15 at 20:53 +0200, Joao Marcos Costa wrote:
> > > Hello,
> > >=20
> > > On 9/18/26 11:27 AM, Jo=C3=A3o Marcos Costa wrote:
> > > > When ARCHIVER_MODE[src] is set to "original", a tarball is generate=
d with
> > > > the unpacked sources of a given recipe. Prior to it, a tmpdir
> > > > (i.e. from tempfile.mkdtemp()) is created and the sources are unpac=
ked inside:
> > > >=20
> > > > (...)/vim/9.2.0340/archiver-work/tmp8pu2nsck
> > > > `-- vim-9.2.0340
> > > >       |-- READMEdir
> > > >       |-- ci
> > > >       |-- lang
> > > >=20
> > > > This tmpdir, however, ends up being shipped in the deployed tarball=
:
> > > >=20
> > > > $ tar -tf vim-9.2.0340-r0.tar.xz
> > > > (...)
> > > > tmp8pu2nsck/vim-9.2.0340/ci/config.mk.clang-12.sed
> > > > tmp8pu2nsck/vim-9.2.0340/LICENSE
> > > > tmp8pu2nsck/vim-9.2.0340/.git-blame-ignore-revs
> > > > (...)
> > > >=20
> > > > This can be avoided by pointing to the subdir where the sources are
> > > > unpacked, rather than to tmpdir, when calling create_tarball().
> > > >=20
> > > > The subdir's name can be inferred from 'BP', so we will use
> > > > 'tmp8pu2nsck/vim-9.2.0340/.' instead of 'tmp8pu2nsck/.' as input.
> > > >=20
> > > > e.g. and in the result:
> > > >=20
> > > > ./
> > > > ./vim-9.2.0304/
> > > > ./vim-9.2.0304/SECURITY.md
> > > > ./vim-9.2.0304/.codecov.yml
> > > > (...)
> > > >=20
> > > > Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com=
>
> > > > ---
> > > >    meta/classes/archiver.bbclass | 2 +-
> > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.=
bbclass
> > > > index b274c53e79..c824718a1d 100644
> > > > --- a/meta/classes/archiver.bbclass
> > > > +++ b/meta/classes/archiver.bbclass
> > > > @@ -230,7 +230,7 @@ python do_ar_original() {
> > > >                        else:
> > > >                            bb.fatal("Cannot determine archive names=
 for original source because 'name=3D' URL parameter '%s' is used twice. Ma=
ke it unique in: %s %s" % (tarball_suffix[name], url))
> > > >                tarball_suffix[name] =3D url
> > > > -            create_tarball(d, tmpdir + '/.', name, ar_outdir)
> > > > +            create_tarball(d, os.path.join(tmpdir, d.getVar('BP'),=
 '.'), name, ar_outdir)
> > > >   =20
> > > >        # Emit patch series files for 'original'
> > > >        bb.note('Writing patch series files...')
> > >=20
> > > Gentle ping: would there be any updates on this one? Thanks!
> >=20
> > Hi Jo=C3=A3o,
> >=20
> > In my reply to the v1 patch [1], I asked why we're creating a tmpdir
> > under ${ARCHIVER_WORKDIR}, why not just unpack the source directly unde=
r
> > the archiver workdir?
> >=20
> > The archiver already works in an `archiver-work` subdirectory, so there
> > isn't any risk of the unpacked sources clashing with ${S} used by other
> > recipe tasks. We may be able to change the code so it doesn't use an
> > additional directory layer.
> >=20
> > [1]: https://lore.kernel.org/all/6fc3dd417116cb61641a293fd9a4256774e708=
b4.camel@pbarker.dev/
> >=20
> > Best regards,
>=20
> There could be something off with my mailer, Idk, but I replied to your=
=20
> comment(s) back then:
>=20
> "I do believe that tmpdir was created to handle the case where multiple=
=20
> source controlled URLs are used in SRC_URI. If I fake a second git for=
=20
> Vim, the result will be a couple of tmpdirs, then 2 separate tarballs,=
=20
> each ending with the suffix defined in SRCREV_FORMAT."
>=20
> So I believe the tmpdir is needed, and the cleaner way to handle this is=
=20
> to change the call site in do_ar_original() as you suggested, thus my=20
> v2. What do you think?

Hi Jo=C3=A3o,

This does explain the tmpdir a little more. In which case v2 is probably
good, I'll see if we can move this forward in the next patch review call.

Thanks,

--=20
Paul Barker


