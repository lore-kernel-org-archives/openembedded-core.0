Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C19FFC5B572
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 11:37:55 +0000 (UTC)
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8616.1786880268075219392
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 04:37:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=dQM0ec7y;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=ArxrMXq3;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.147, mailfrom: paul@pbarker.dev)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id 19ABC1D000B1;
	Sun, 16 Aug 2026 07:37:47 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Sun, 16 Aug 2026 07:37:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786880266;
	 x=1786966666; bh=qzdEhkHBzSjUhEnf27svVPQ5Qhl1ogwrS30sO/BNZx0=; b=
	dQM0ec7yp/LcNahU1FhEtE+LmPdl4/6RPsK+jena4MygcvG0Tpe5ZugqCqaMgUB2
	YIah/u+Ezv25UClHgSBBH+okvk/WYr8qaMoGkvNui3dRpsKLcfppGXZasXKcssOw
	R8FBwyp6J0GIfR6ltPG+F27X0XisVdSvRKjuBV8GQNDFFOMOti9SaGeEVkk8UMUn
	tXB52J8i7ww6pJu28Hg7DR7GEp0E92musbCOm8ns4avm8XHxC+v3N/88eIX3zBb/
	bZXjmcOWnPPaF75n3LYov7trcDpMeIDFHxDjy5UherGCmsySbZCp0mdz1tEOG5TC
	Ml4y/nFgSHlnx57tq8vgAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786880266; x=
	1786966666; bh=qzdEhkHBzSjUhEnf27svVPQ5Qhl1ogwrS30sO/BNZx0=; b=A
	rxrMXq3IDpOnhQWKTtdTakYlRJm4gw5p4Fmw8CJWgOIPUVjIowKxT83+uWr6Mlug
	uDIMaC+q5JUCVhEPdYi3a5azZnVxJQ8Lr2G+nRpvzk1hNNd2/6LSGkPLboeq4SHk
	PV/GRl3t5Fc1UWXWTDZLad/oG0tcky3aRqDFHfwjPlG3g6RTpALCjzOHEE42VeRN
	37Qltm75kBuphhBcfyxLEU6GcB3pAhqcDPrSiEZnB6+uoxY/mH32qskvjmRk3u5Y
	i2hi/a1asSSomE1Ljx2S4qyr4c6b59HkuK4Bz4c5FdUdUY/Ji5Tk3nOtVwiuUaLf
	nKqMOYtxrHp6icvkb3biA==
X-ME-Sender: <xms:CqGBalSlCW25l2gfk93CuBTDgq2HuUJp8RtZJ5s8UVT3In-YRZH9lw>
    <xme:CqGBahDh4lcpa_tBN6tlgcWe29xGYvGAK6T3wJgLOjKHhOxaaO-8zA3YU8gbqymmz
    FHs4L1AYk5okX9JBaqEup1kq-zQEuqRdS39p5vyxp50fRsOr1i76H1x>
X-ME-Received: <xmr:CqGBatEP0ofob5AYPRBE_tATI2a7vg1FoIWg7UuNgValeGe7d6ir8UEHNLR3VJNOcI1_9MprPUYaLmJu1RU5fUITPgJXSnLzvuE8y00i-frR>
X-ME-Proxy-Cause: dmFkZTFCYtUJ4Jb6XDl3XwHevVl+S+yaHP0Xv4wT5CPmhsp/tT6iHRD5E47MHwDUuaFESp
    GTMk6CaQ6HAdHnWZbWFZOKUH58wYkV7Gi3SSHeASF2vJPpXFanMT8IP30lYLE76R/n2tlj
    PgBK8kZdXvaktb5Pd7Ddp+bFvN0YG4B4OoCQWCc0W1/zSvv9WSrLNbcLfWj42GJfTIZr84
    qxcqStTrspQ4FVoEYO2pPvzPwL1wsqEibz3XD7GgARx4Yg01J9cSccIP1fbCfmmxgO7exV
    MYw890Q1Xarml6DrOeZorx20aWTyZFbD9czxM635JM8uUfxKr8z7dP1ffiIJ5raz7bHpMX
    qU79gLBgOC32ELkncHjQF2DSUwvTNv5r0Iqq8lvLLQGj+uO1XcGKwDBCQDC3pkrUhGLgjM
    +ZNv8mPhPBOlmmMwwbxq7kon24fnSjk7REggr2hxKPHo/KvLdq4S2BSWDjcA99QvlxosYy
    MQUUTtC0QVOPeRoaDGwaNY3hRZ/5ayXIEslqNIrC51QJf9nIm1U+z6mlYmM6kJBQiy7P1y
    WyQLRE3fCEltEaEr6p/krIHJl60+gKTxY8jLgkVyaWYBW63ITBtSbwJ0lRNeAgNEPkzOse
    wlsRyQXu2+glusIXnt1iBo8+PCG1bBc7UMLdxIoD4HaRGuOXF7xnj0N6apRQ
X-ME-Proxy: <xmx:CqGBajDwAfCFTlfVtKhPoE3rGyOGEGbvnuvImjyMa1qYsz6zlepMBg>
    <xmx:CqGBatU4k0IXyBlnK1R3xvqnN3Jxegc7k7PDBd3_EotNbkFVmGEC5g>
    <xmx:CqGBanrwZwpO4cHIJdpDVVbNEDyjvgIxvCzspkpfeOSBSMBXOd1mBg>
    <xmx:CqGBapRbocAIrxSoNFkJcCFCWi0vCMo0tupffhmybZpTaJ7X0xlUXQ>
    <xmx:CqGBav5mMqvNWKqs4fvHc9AdTT7_eBUlZL9TmNvpAh1wyzIuED8bFu25>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Aug 2026 07:37:45 -0400 (EDT)
Message-ID: <31833741ed68de2878234d906c2a1cfe680c4508.camel@pbarker.dev>
Subject: Re: [PATCH 2/2] package: fix source path in save_debugsources_info()
From: Paul Barker <paul@pbarker.dev>
To: Benjamin Robin <benjamin.robin@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Cc: jpewhacker@gmail.com, antonin.godard@bootlin.com, 
	mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com, 
	daniel.turull@ericsson.com
Date: Sun, 16 Aug 2026 12:37:44 +0100
In-Reply-To: <6mKnVq77T3qmNmVG0TaWpg@bootlin.com>
References: 
	<20260810-fix-save-debugsources-info-v1-0-2e83131bcf01@bootlin.com>
	 <96d72ef99f426d380cd090740ff636df1512ba2f.camel@pbarker.dev>
	 <foNKo7xSSzG14aIsBMYQlA@bootlin.com> <6mKnVq77T3qmNmVG0TaWpg@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 11:37:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243526

On Sun, 2026-08-16 at 13:25 +0200, Benjamin Robin wrote:
> On Sunday, August 16, 2026 at 1:12=E2=80=AFPM, Benjamin Robin wrote:
> > On Sunday, August 16, 2026 at 12:46=E2=80=AFPM, Paul Barker wrote:
> > > On Mon, 2026-08-10 at 09:11 +0200, Benjamin Robin wrote:
> > > > Previously, except for a kernel recipe, the source file paths were =
never
> > > > "resolved" since the KERNEL_SRC_PATH variable is always defined. So=
 in
> > > > the ${PN}-debugsources.json.zstd file the source file paths always =
started
> > > > with /usr/src/debug/${PN}/${PV} (which is the value of TARGET_DBGSR=
C_DIR).
> > > >=20
> > > > Currently the debugsources.json file is only used by the spdx gener=
ation.
> > > > - In `get_patched_src()` the sources of the recipe are extracted (a=
gain).
> > > >   The unpack task is executed from a modified local context with UN=
PACKDIR
> > > >   set to the value of `${SPDXWORK}`. So in summary the sources are
> > > >   extracted in a sub-directory of `${SPDXWORK}`.
> > > > - In `add_package_files()`, with topdir equal to `${SPDXWORK}`, all=
 the
> > > >   files (recursively) found in topdir are listed. For each source f=
ile,
> > > >   if the file path (relative to topdir) is in the list of source fi=
les
> > > >   retrieved by save_debugsources_info, then the file is added to th=
e SPDX
> > > >   SBoM.
> > > >=20
> > > > So try to handle that by replacing ${TARGET_DBGSRC_DIR} by the rela=
tive
> > > > path of ${S} relative to ${UNPACKDIR}. If ${S} is not relative to
> > > > ${UNPACKDIR}, do nothing.
> > > >=20
> > > > Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
> > >=20
> > > The paths in ${PN}-debugsources.json currently match where the files
> > > will be installed on the target. If we change these to be relative
> > > paths within ${UNPACKDIR} then we would break other ways that the
> > > debugsources json files may be used.
> >=20
> > Hello Paul,
> >=20
> > This was never the purpose of ${PN}-debugsources.json if I am not mista=
ken.
> > If you look at the code (before my patches) the path should have been
> > modified to be somewhat relative to WORKDIR. But the code had a bug, an=
d
> > the paths were never modified.
> >=20
> > Also, for the kernel, the kernel sources paths were already modified to=
 be
> > the same as the path in SPDX, so starting with ${BP}. This part was
> > mostly working for the "main" use case. In a previous RFC series that w=
as
> > merged, I fix that to be working for any kernel recipe.
> > =20
> > > What is currently broken?=20
> >=20
> > SPDX_INCLUDE_COMPILED_SOURCES for a normal recipe (not the kernel) is n=
ot
> > working.
> >=20
> > > Can this be fixed at the point where the
> > > debugsources json file is parsed instead of where it is generated?
>=20
> Yes, I guess we could modify how oe.spdx_common.get_compiled_sources() is
> implemented. In that case I would recommend to no longer modify the paths
> of kernel sources in save_debugsources_info(). We would keep the paths as=
 is,
> we would only filter for "<internal>", "<built-in>", ...
>=20
> In any cases, this is kind of a breaking change since the
> ${PN}-debugsources.json is not going to contain the same paths as before.
>=20
> But what you are "proposing" (modifying get_compiled_sources()) is a bit
> cleaner from my point of view. This is a bit more work, that is why I did
> not do that.
> Joshua do you have an option on that?
>=20
> > > Sorry if I'm missing some context here.
> >=20
> > For the full context see:
> > https://lore.kernel.org/all/20260727-fix-get-patched-src-v1-0-f5054ca10=
e14@bootlin.com/
> > https://github.com/bootlin/yocto-kiss/pull/26#discussion_r3626224833

Hi Benjamin,

Yes, I was missing some context! I was replying based off discussions we
had on the patch review call on Thursday.

If the paths in debugsources.json files are currently inconsistent
between kernel and non-kernel recipes then we should fix that. So
perhaps your patch is correct after all. I'll let Joshua give an
opinion.

Best regards,

--=20
Paul Barker


