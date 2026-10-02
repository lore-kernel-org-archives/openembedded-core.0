Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 974E0CA5FC4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 09:05:20 +0000 (UTC)
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7079.1790931916694148137
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 02:05:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=MBM66TRk;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=u3Hd8B7D;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 073FB1D00106
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Oct 2026 05:05:16 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 02 Oct 2026 05:05:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790931915;
	 x=1791018315; bh=+DYpiVA27Yz76+EqV4yhiM0IgVZroLTd8WBQuupUXew=; b=
	MBM66TRkrvxETdYTFF13LdtO7AdvSbHyZ6jrF+rqKbcO7sl7pqB6tbWhnJ3YHVp5
	mf0KAyMRE6kJJLwjd/x2E3aRSFOUeUkRm5W6Jcqmu3ci8SG46AK0Wsv6e+7BzK/l
	Dvoe+rfQViiEyeB0lVgXdcqPlKdI2O1qMA/ILSosQqQjc+RP4ILGskpGwU5iWJ97
	cSREebm5LnQj6ubfIApoP8mNIXle0ckRrExgXG2c/wMRl/mshMtVKEB2cwLpjwOh
	t4CT7fCXCQng03E4kUtQmm/WMjz5oWy+yXKTM+GfOzncSFpqxUosm4W0l3C0Vtjb
	VyPSw8JR26SDSg0RcHJwuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790931915; x=
	1791018315; bh=+DYpiVA27Yz76+EqV4yhiM0IgVZroLTd8WBQuupUXew=; b=u
	3Hd8B7DoPEdprQcWM/HHiWP68FLcp0o85bk1WYokOMxvEhjbvXHdEY/G+5cjfdvQ
	IbGoIeIWkWO+b81hx7JB2zzmAtmqIzKwNGXB9/4Vi0ZKw+fuNttuF1CttfoitLnH
	2UxCmKVAlzcBXBvVazG88nn7suZGiW+DwHu8OndGM2otJQkZ+vGnfsG3EhtvxTGB
	Yp8tnoy+Mo4xT7wk7to3DCFU1a3/d05GqNcdQbwrKHvJnelaHWMeRmQTdPBg+4W2
	WVZ38SOfTlq4gT2wE9a61Wnh3ThzexPXXaqMWOh24ixz7MM4iSfXZjU8YKyeDUO3
	n0fOw7YlOHkKRtVVj3ciw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1790931915; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm3:rsa-sha256:bRnufuIYMFeMLEDIJ9eE2R+99ppjHalshvSSRsA2zqYIG6R
	bKFOQcI1WflNIY9qIGX+xbFzP0QctQN//P87WhuAJ7i7U0/Wiz8WvoJVaNKkWrTO
	AH/TU13Hrvc8s2nDh0cmWZuXncWR+FnUNUiQWh0wX0RSKLHlBadLGwafgW6iptv/
	nr+Lq4SpYBxZDuOeaq0UGgAVSVljORvdv5oQEO+5aPV3dAMtexzrgay6z/XWo16e
	r081jiONb+PKpRs0aSTb5jZ8WqKuUoxWb5fQRJfKf0HX/5dzdqhrONGxtMXYfQb4
	B4G/xa5SVfR2MeFf47tNeFnG5Z3FVNOxS6Al0Bw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to,
	user-agent;
Message-Instance: m=1; h=sha256:q25rlwE7ltccncaZjG8PbLS3JzJSnRRpok7g447XVeY=:Z9WTU3DwRsSGrP7D+MWtHdoDgrW641rIYcaKmKOdTVY=;
X-ME-Sender: <xms:y3O_alc1VA9_Xox6TOk2XF5Tdj8PSIu-GbIQssubSRox5uO3qf_YXQ>
    <xme:y3O_aqOgKTDXUD3lTmjtlUcCN59WzeOzn-DJ7Xex6YJvu9KTX47KrNjZVZfA_IAZW
    rXpa8q6o0ue66y0ki95_rbLiqAj7QEejDDLqUgX3FIWHhBN-bBCVsDN>
X-ME-Received: <xmr:y3O_ajjlOcZ_B2sVei1rmsgkpArZFHK-s_p5L928L6dJbu2gD2ctyZ5xP6q0z_eXOfY>
X-ME-Proxy-Cause: dmFkZTE6WR7M2m/DidpJSJ756L4H9ap6dwCfEDWlJxfBsmY2ANNOHIUDgYfHftqEgEm0Fc
    SCmuuPCFUl9KOJ2zUVzRjD3vowwH0gPcz53/7lpf5vc3O4gQReQig3ko3/6PW2/4iKUj2M
    f+kD7AcNAd34aqilzik7bmimDzCv0SXeloQW/iXjqTmN8W67xhZCPiY6bOaEXBoo5xkoOk
    ZQJ4cBWxQoEJeAHsWfhyYcQQVV3bCwtxgpq2+vbGlS7Xtl7LGFtsvPltVLJHH89y3/NmUI
    Tx/oi4XaP4sNOESGOHlzW6H0oX2/l2hidbIclkhM9KebE6ag7m62RJNh7IW8wOvvuYPRD2
    RpvLmvCoKZ8b3NHSlDBWOVRQCPppLohJ/AHLQKcPQ+JSrAb8/feAUnkGEq7tWNy++IvzI5
    F05kC2RCbvGNHpC6OlqTc4sw7MeL2+RiVtkh+UZOKv5E9eRa1B3R+9ZryXrub3aHsvU5QG
    rd0hAqZL8tHEvb/ArAi3x2xAVw1QEUkIcc9SaATZo9Vdt96qKpb/t81Q0iSyst57V5jCU5
    c+FPDdzW1Wtag8rLlyvLfmUQiD8BMhiakqDjis20jmBLfIwZ3SafWIRbS/CSGQfYQVBwu1
    kMRuwfGWQt4XVkKphde8PwnrvW5fl5lhaGGdu+RZ443+KxTI3WztpQ0SvW5w
X-ME-Proxy: <xmx:y3O_at32ViM-YBAfPu4VuG2IyiXzzUWXYz0mYdWUsR4ulQ8D_07KxQ>
    <xmx:y3O_atjfzhSPmE3vvxK9FjcElr-_vLo1eB4AejvCetIc6829jdNYPg>
    <xmx:y3O_ates57JDBy_eZ8jFcgI3DzDIOE95bqZsG-Q2FvPQuVHU1U9AVQ>
    <xmx:y3O_agnVDKJMqLGbBJasnRbd4WzytL2lqrvHTfnk9hv7mGhvTr7R-w>
    <xmx:y3O_alSoFqSUq82HV7Ziko2DpGddugdtEE2QT02hevStMF21YN13lvmZ>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Oct 2026 05:05:13 -0400 (EDT)
Message-ID: <91fb8d9886d06181a0a1ecc63b30652b1002509d.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH 0/2] rust: add rust-analyzer support
From: Paul Barker <paul@pbarker.dev>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Benhur T
	 <benhur.tessele@est.tech>, openembedded-core@lists.openembedded.org
Cc: Randy MacLeod <Randy.MacLeod@windriver.com>
Date: Fri, 02 Oct 2026 10:05:08 +0100
In-Reply-To: <DLTK70W1LZPD.1WPEJTEXRP8Q1@bootlin.com>
References: <20261001125630.760962-1-benhur.tessele@est.tech>
	 <DLTK70W1LZPD.1WPEJTEXRP8Q1@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 09:05:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247093

On Thu, 2026-10-01 at 16:08 +0200, Mathieu Dubois-Briand wrote:
> On Thu Oct 1, 2026 at 2:56 PM CEST, Benhur T wrote:
> > rust-analyzer is built as part of the Rust tools but was neither
> > installed nor packaged. This series packages it and wires it into the
> > Rust SDK next to clippy and rustfmt.
> >=20
> > Patch 1 adds a rust-tools-analyzer package for the target and nativesdk
> > variants. Beyond the frontend binary it also ships the proc-macro serve=
r
> > and depends on the standard library sources, both of which are required
> > for rust-analyzer to actually function.
> >=20
> > Patch 2 adds it to the cross-canadian toolchain so that an SDK built wi=
th
> > SDK_FEATURES =3D "rust" provides rust-analyzer out of the box.
> >=20
> > Testing:
> >  - Patches validated with patchset.
> >  - Built an SDK with SDK_FEATURES =3D "rust", installed it in a contain=
er,
> >    and confirmed rust-analyzer resolves the standard library and expand=
s
> >    proc-macros end to end: diagnostics/analysis-stats on a crate using =
a
> >    derive macro succeed, with the proc-macro server started from
> >    <sysroot>/libexec.
> >  - Built core-image-minimal with rust-tools-analyzer installed, booted =
it
> >    under qemu, and confirmed the rust-analyzer frontend and the
> >    rust-analyzer-proc-macro-srv binary are present with their libraries
> >    resolving.
> >=20
> > Benhur Tessele (2):
> >   rust: package rust-analyzer as rust-tools-analyzer
> >   packagegroup-rust-cross-canadian: add rust-analyzer to the SDK
> >=20
> >  .../packagegroup-rust-cross-canadian.bb       |  1 +
> >  meta/recipes-devtools/rust/rust_1.98.1.bb     | 19 ++++++++++++++++---
> >  2 files changed, 17 insertions(+), 3 deletions(-)
>=20
> Hi Benhur,
>=20
> Thanks for your patch.
>=20
> I believe this is breaking build on some platforms. Maybe all ARM 32
> bits?
>=20
> ERROR: rust-1.98.1-r0 do_install: Execution of '/srv/pokybuild/yocto-work=
er/beaglebone-alt/build/build/tmp/work/cortexa8t2hf-neon-poky-linux-gnueabi=
/rust/1.98.1/temp/run.do_install.3194208' failed with exit code 1
> ...
> > error[E0658]: use of unstable library feature `stdarch_arm_neon_intrins=
ics`
> >   --> /rust/deps/simd-adler32-0.3.9/src/imp/neon.rs:23:7
> >    |
> > 23 |   use core::arch::arm::*;
> >    |       ^^^^^^^^^^^^^^^
> >    |
> >    =3D note: see issue #111800 <https://github.com/rust-lang/rust/issue=
s/111800> for more information
> >    =3D help: add `#![feature(stdarch_arm_neon_intrinsics)]` to the crat=
e attributes to enable
> >    =3D note: this compiler was built on 2026-09-01; consider upgrading =
it if it is out of date
> ...
> > -------------
> > error: could not compile `simd-adler32` (lib) due to 67 previous errors
> > warning: build failed, waiting for other jobs to finish...
> ...
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/10/builds/4734
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/4706
>=20
> Can you have a look at the issue?

One thing that's concerning here: We're seeing a compiler error message
during do_install. That suggests we're missing a build step in
do_compile, as things should already be built by the time we get to
do_install.

That may be a pre-existing issue for the rust recipe, if it is then we
should make sure there is a bug filed for it.

Best regards,

--=20
Paul Barker


