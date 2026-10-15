Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E44B4CCA464
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 20:04:55 +0000 (UTC)
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6546.1792094691204252812
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 13:04:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=QC3qdvy8;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=UNIFXmCk;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.148, mailfrom: paul@pbarker.dev)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 7A65B1D000AC
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 16:04:50 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Thu, 15 Oct 2026 16:04:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1792094690;
	 x=1792181090; bh=erLYbuMzExaK2YrC8e2VG3W7502JWcdt8YezH10DweQ=; b=
	QC3qdvy8wAKBo1m5tBk5jTqRCqMbv3KXJAK+P/+kdi3s+m+2PjautDds2M0ALMiQ
	Uo1M8FYSVyXQdUHJYRRnKA3Tama1B9fIP2MlnUFQfBJQQRW43nZkXokBPQt7UYpc
	v/ndUBRhYVDNu1qZEruW3dZRhiTW84aRMWGX4TVc4zDvtV1IYhUir18qte6GyRxA
	r+HQ9InsTKhxRwWTZrQ/kuR+ZDyYwEP+Gl45nskcPbO2bSYX9AFcVYu9KOw2TVL6
	2tm+hRFDT+U9uJV5UdlcSoPoLo8NA89BV+H1KIES9dWF0jZN3xQEnOx/Ja/xQQ3m
	bmfguCsgoMAmgKTJXWLB8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792094690; x=
	1792181090; bh=erLYbuMzExaK2YrC8e2VG3W7502JWcdt8YezH10DweQ=; b=U
	NIFXmCk0UcC/KmXW1pkxsBUdsAv1Lyvs9V4iPlIxRspHotUr/D0FdnzUujyaLoZ2
	HiETnISYD736QNvqjSNe9mv4AF4dl2ObTJVI6ie5gtbt3+5+JOpWUeR3Jhjm8lFy
	zEpa8UgFTY+hGIHakDIDsk1QotulNcviLi+XHEWsA8kwAwhIH5B7mSntWFSoxRv+
	pmuAFBr6GjQkTFbl82kZ3AsP7osK5TvJLDoaOyeLZPGDPxAIseuLGxBNWi5yTnkK
	KYjotPgn7iFS7+OCF7CZqBRYj2OecatsLIxoTnp2Es5OinScn40j4bD2E0fglfyD
	n3lpvpjjC14z/nT6MCZaA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792094690; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm3:rsa-sha256:wgkH797vbgEzLqmoKHNv3IKpTPejSPa+kyYBWNYeIWY8ely
	59+kaXhbFkilyqOaCPNHDas1OvNNnonoI75IjeBFbueeE+suyi61Rt2B92w/boLV
	paLkDwK8cg9ExekEE8h4CxZZYJQZGiK7ed4AiS3v/OeWQ+md+dQd6y5hZ64Nb0Bx
	q3xzojkMHtHskYobE2LSQj2WgFron+o5SgmFRlhHjqHd3ziwjJ3BDk/EurK8xDJi
	VliiE3RyZUScvQktez98T0lDBqbNFc7Z2XsbmUeCol1054cxWncctZ+3lSkaR01f
	R4JnvZGg1E93gnzVxSAoDSHOxxzNoqHMfYzmX2g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to,
	user-agent;
Message-Instance: m=1; h=sha256:Jwnjzht+0/IwgwEOdGkyOptDd2kA49kCgkzIHw8hlvM=:VQA+TErx9loWWsQFyzYTSpeTj/OByxSpdlweAfLAaY4=;
X-ME-Sender: <xms:4THRas0hP0_XdEsS-LD7z35E6b3H76BPpi9BzZf_2uVB4u-w2PLhJg>
    <xme:4THRat94aIBkmqGnAgEkdQMgOA79ymfjw0mEg8qS-KJLkvSBZST6V8oCLSaWldIOU
    y9lmBa4U0b_b9hiSlQRzkhiJp0OEbKGnmYwn10h-cLIL_481jp-IRAe>
X-ME-Received: <xmr:4THRatNjuvsUiRfonTtya3Id0s3q3wvPaK1xBgXHN2Kob2ztwkmCXxznNBIaihiqKdRDL0cvdiAdOLoAOJOqSZaEP8n0d-4fT9ss>
X-ME-Proxy-Cause: dmFkZTEE+iIpXZ94rKbfmfciHZhakrf3x6r0zqA8DWpOyOZrwahYJThfd8DmYBAUZSmvqm
    ff/Uwvy+AjlnmJjsx5jCqmv2YPLXS7EBuORkxtOEp/quHZOn2WGPiDfyF0fwZHvBCGGEig
    n+klPa0VT466xgQmE7omU3OOZuf9+ZG/CWW0EBCV6Q3+U/Shwf+HYHw+HMMjrPZ/YJ5SAv
    Es5iQli+ap8Ii++grakPi3QFHEQaOM6M8wxnHeRbSxJFlMLmErOPYlOqfAbKTM5+8L87VL
    BmDtfepUqokuCQcaRuHfXs3dEJ/tf2KuAcpsl4yj3KzMyjSQGGxn1VjKNFFAAp0Ks3LSWD
    iRaEu286Lo7fN0elFEP8N1jhFgbCXaMDXlzFOwRWf/2eIS7B2NJ9VIHA76Bl+9OKCkJBuA
    NiN0fRY0IuCyD0Hcc7u+QDTD7HpQh/aI2ajVAs++2QVL1JgHr0DuQdbZo5JH92rKhiym4e
    3JOeEpRr1bG8sTkVhFQVD8SaZQGTNH1xzaQL4x21E3NZ3u56lvmp/JrBf7F3egZlLxtawE
    T8DyA/0xWEQZ8u+wlBslTHvzi7CnCZihr34tFRUGRxN9DLVD43dsskr5NNi394B7DqU8/C
    8MIrUbQgB9eJb1Y+XMiJhkx8ahr3YCnoeEObfyYZBv0OZ45sR15GEZ+lOVBQ
X-ME-Proxy: <xmx:4THRahc9MSoGfLiFPY8xOFwt85QJHG9uNJckopXwA8Tvivuf_RzLBw>
    <xmx:4THRasVpI6xkgjRW-kzov7HwBH0bnOnKAeWJJ1y5ERTBwShyWj7V7g>
    <xmx:4THRaphgs3eCJPJt1d7dQQpG-Fljn-PaAP1JH8ZO-aao5O4st7X1bg>
    <xmx:4THRar_4gVIo87wCfI4Qgv0ys_pea59CI7mZgojCBZ1OcG2bIovvVw>
    <xmx:4jHRaiX-_eyDolL3irB2X8ve7cbh78Df8hoKzBasq84vyUtKh5bvImpf>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Oct 2026 16:04:48 -0400 (EDT)
Message-ID: <b398788ff33f7042add03b695235d157ab2bb3b3.camel@pbarker.dev>
Subject: Re: [PATCH v2 RESEND] classes/archiver: fix tarball content in
 "original" mode
From: Paul Barker <paul@pbarker.dev>
To: Joao Marcos Costa <joaomarcos.costa@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com, yoann.congal@smile.fr, Richard Purdie
	 <richard.purdie@linuxfoundation.org>
Date: Thu, 15 Oct 2026 21:04:47 +0100
In-Reply-To: <84b5b50f-c507-4e35-8090-2a13b79fd4e3@bootlin.com>
References: <20260918092711.471982-1-joaomarcos.costa@bootlin.com>
	 <84b5b50f-c507-4e35-8090-2a13b79fd4e3@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 20:04:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247894

On Thu, 2026-10-15 at 20:53 +0200, Joao Marcos Costa wrote:
> Hello,
>=20
> On 9/18/26 11:27 AM, Jo=C3=A3o Marcos Costa wrote:
> > When ARCHIVER_MODE[src] is set to "original", a tarball is generated wi=
th
> > the unpacked sources of a given recipe. Prior to it, a tmpdir
> > (i.e. from tempfile.mkdtemp()) is created and the sources are unpacked =
inside:
> >=20
> > (...)/vim/9.2.0340/archiver-work/tmp8pu2nsck
> > `-- vim-9.2.0340
> >      |-- READMEdir
> >      |-- ci
> >      |-- lang
> >=20
> > This tmpdir, however, ends up being shipped in the deployed tarball:
> >=20
> > $ tar -tf vim-9.2.0340-r0.tar.xz
> > (...)
> > tmp8pu2nsck/vim-9.2.0340/ci/config.mk.clang-12.sed
> > tmp8pu2nsck/vim-9.2.0340/LICENSE
> > tmp8pu2nsck/vim-9.2.0340/.git-blame-ignore-revs
> > (...)
> >=20
> > This can be avoided by pointing to the subdir where the sources are
> > unpacked, rather than to tmpdir, when calling create_tarball().
> >=20
> > The subdir's name can be inferred from 'BP', so we will use
> > 'tmp8pu2nsck/vim-9.2.0340/.' instead of 'tmp8pu2nsck/.' as input.
> >=20
> > e.g. and in the result:
> >=20
> > ./
> > ./vim-9.2.0304/
> > ./vim-9.2.0304/SECURITY.md
> > ./vim-9.2.0304/.codecov.yml
> > (...)
> >=20
> > Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
> > ---
> >   meta/classes/archiver.bbclass | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbcl=
ass
> > index b274c53e79..c824718a1d 100644
> > --- a/meta/classes/archiver.bbclass
> > +++ b/meta/classes/archiver.bbclass
> > @@ -230,7 +230,7 @@ python do_ar_original() {
> >                       else:
> >                           bb.fatal("Cannot determine archive names for =
original source because 'name=3D' URL parameter '%s' is used twice. Make it=
 unique in: %s %s" % (tarball_suffix[name], url))
> >               tarball_suffix[name] =3D url
> > -            create_tarball(d, tmpdir + '/.', name, ar_outdir)
> > +            create_tarball(d, os.path.join(tmpdir, d.getVar('BP'), '.'=
), name, ar_outdir)
> >  =20
> >       # Emit patch series files for 'original'
> >       bb.note('Writing patch series files...')
>=20
> Gentle ping: would there be any updates on this one? Thanks!

Hi Jo=C3=A3o,

In my reply to the v1 patch [1], I asked why we're creating a tmpdir
under ${ARCHIVER_WORKDIR}, why not just unpack the source directly under
the archiver workdir?

The archiver already works in an `archiver-work` subdirectory, so there
isn't any risk of the unpacked sources clashing with ${S} used by other
recipe tasks. We may be able to change the code so it doesn't use an
additional directory layer.

[1]: https://lore.kernel.org/all/6fc3dd417116cb61641a293fd9a4256774e708b4.c=
amel@pbarker.dev/

Best regards,

--=20
Paul Barker


