Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04DE8C5DF94
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 07:26:15 +0000 (UTC)
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11451.1787556368730788856
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 00:26:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=dzNYjyGU;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=eiH9ey8W;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.150, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id DA6611D000D8;
	Mon, 24 Aug 2026 03:26:07 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 24 Aug 2026 03:26:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787556367;
	 x=1787642767; bh=sSWhb56XTk2ZmIr7CH0YLW9/19MXuiK6X2e+SrJdzsE=; b=
	dzNYjyGUmHhrAJSWu+vRU17w/OJQwjc+j2KFRms5gG71Zp6RQ9JXuIMyNNlWsALf
	z+KP2X7GET3fKb0bio/pSFWstcDYF+ySOcGq/5nZxQcZbPZyy0RKS1Qyiq16+7L6
	91maBXv/fZlfsCy9tTe3piOPwDfQLe5udCq1P/UfTnExPIo+/JJBz6p6xBVqwMr/
	Ts0WpaO2El/1Bt95vvprUzbu5g2JuSKd2lBqdX08YzW3S9hb6sTizLMdMG5t/IyN
	vrKEqQMzwBOmd3+UN7fATYzuHd0m+CjLfArzi8TQMc2vvnS7wc7Wmg14lzjYMy9G
	2jVwHs4hH+tK2mnpD1mFmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787556367; x=
	1787642767; bh=sSWhb56XTk2ZmIr7CH0YLW9/19MXuiK6X2e+SrJdzsE=; b=e
	iH9ey8WLqg7cQYPe+tra8Dp29rmWlKjcczjbqsL9pbLb1nnN9zo5s5yD4K+9hObt
	LpZue2UEd9Z4xml1bTOJqnlrKL6LLRS14SBmrkPTcr1LrjydJoMzIsoPoEixoG7Z
	cw3eXOAgG77Wc/vvTjgivGxfqy+4irW1A1DKfo3VouoyzOYQ8efPh4gZBsY5EKV5
	29j9evqEXsnoyDEiPHq5ykpyjfawz1rVncbUMrmw3gq2kgsIc2oRMNcxxRfoJD6V
	N63bUsJ7Hum7wbX4G0oFyA0FpAyE/vIin4AsBDw4t3d9utvlFkNc02Gqv5o5xfo8
	tJLlYP7IYJDjz5fyRJ6lg==
X-ME-Sender: <xms:D_KLakV_HS8fQN2AqdgqFVtu4rh8uUdmumMu-a0ox7LXWGCJl0H3GQ>
    <xme:D_KLaunNFpJsZfVI_O7ugOHW3VqX6q1yltRUqbSYwqVnx8IpzhVMb3B96tYC7P3uw
    qJ24tdxSAIhlj2xygQWIBtCfGYlaCGNsiEWYuNgA3mLLesqCGn5WCtd>
X-ME-Received: <xmr:D_KLamD4ycWMJgd5OHQRGix6IJvo41Ua7QjG4zCbCj_y-bVQ4PqULnfkgaFVPKZxqguvBuUIvJQIkLQDDoBVWcG2KPk8ljkRThFPJQ>
X-ME-Proxy-Cause: dmFkZTGoaB6tNJA5l317N3VKZblJkCKFfUv7FRdFzBM87FOc9A57kLueD6V/6gG2bLwV1I
    CO+2RA1JzqoXpAFjL2zBo8unNOCqHc6f8SYOK54LWOe91dH0ZKEdOM814cZRm8UM0LDy6q
    i8YbNXA09AtcznfjMr8C0UHH83Um6scq5ONTr78QnGOfMjnjtDzZ1IaDcYRW9ocjjDuHZn
    G1gtUIlykeYwdmsIazQ1RGPUYBnGwFaf/VT/BKgCwR53GYbls8huZ6I2bp+/lC+I2nVAVs
    vfldaPOYtcdHSrmBP7mp0vDVCJgc0J4yC7sm+mXiiXi9JFHb0Ide7oHPOZ7R+8ihvUogfc
    4bw7e2L77/NXq1bR8KGF/rPK4h+eTIW+A8TmbS6bN3oRO6JyGFQ4+z92c+3MKJeUDIyE/3
    hCBkyeGpFQmGNMfCHMmaETHXF3ROcuhoL9yiELTkg3Ft2wU9G5A0Gzem7IQZEh4wfsh0VJ
    ZNpoNX9Y7LFf808jawY+d8wonjceAk9OxOT+6sA6fi0NHL1Z3f4VzH6Hn05R1LcBNZpLMT
    YXm8e2FfrAvGeFDCQhKUF8KLAz3ApzJpG5tg6BlORvH4EFlpdYaI0ueJrHhYJS6PnMpq/j
    W75AmZbrYvLruTmWxw8H2JQi4D48ncXWuTupN+5MOghcRx+DLd2a49PRNlQA
X-ME-Proxy: <xmx:D_KLaudJfwyU19KRtQ0OV1O6WbiFYmm0lkm4fxwIVEii4qZKzVT4gQ>
    <xmx:D_KLahJ_UgsnJackRh6o9EdC0SWJj1vU3s9ox8bewvzW57FDDRm8fw>
    <xmx:D_KLahcyek7lBnbgr13Ebs5FWbz4ERtAXXuT_bnaJecl63Z9CsLY5Q>
    <xmx:D_KLao2w0C0btbHn21vSBeyVkTyBSM3CQZAbKaYRT-fuk5qGI2VQ_Q>
    <xmx:D_KLallBuQvabyIeazvrjmN-kDmEXwKWvI_xPWrQP5GP5jOut6clZuNh>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Aug 2026 03:26:07 -0400 (EDT)
Message-ID: <47518fc3e22b1d205dd6b5bb10e0e15af20ee6ee.camel@pbarker.dev>
Subject: Re: [PATCH v2 1/2] oeqa/sdk: update cryptodev to a revision that
 builds on kernel 6.18
From: Paul Barker <paul@pbarker.dev>
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2026 08:26:05 +0100
In-Reply-To: <aom3waDKgP4b5_g1@localhost.localdomain>
References: <20260813030515.1028627-1-twoerner@gmail.com>
	 <20260813030515.1028627-2-twoerner@gmail.com>
	 <7fc0bf78c8046ad9c23e49f80d8ed93103db3317.camel@pbarker.dev>
	 <aom3waDKgP4b5_g1@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 07:26:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244069

On Sat, 2026-08-22 at 10:52 -0400, Trevor Woerner wrote:
> On Sun 2026-08-16 @ 12:12:49 PM, Paul Barker wrote:
> > On Wed, 2026-08-12 at 23:05 -0400, Trevor Woerner wrote:
> > > The out-of-tree kernel module test pins a cryptodev-linux revision fr=
om
> > > before the 1.14 release, which predates the removal of
> > > crypto_ahash_alignmask() from the kernel and so no longer compiles:
> > >=20
> > >   cryptlib.c:384:28: error: implicit declaration of function
> > >   'crypto_ahash_alignmask' [-Wimplicit-function-declaration]
> > >=20
> > > Move to upstream's "Fix build for Linux 6.18-rc1", which is the revis=
ion
> > > that restores compatibility.
> > >=20
> > > AI-Generated: codex/claude-opus 5 (xhigh)
> > > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > > ---
> > > changes in v2:
> > > - none
> > > ---
> > >  meta/lib/oeqa/sdk/cases/kmod.py | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/meta/lib/oeqa/sdk/cases/kmod.py b/meta/lib/oeqa/sdk/case=
s/kmod.py
> > > index 0c4d8ddb543f..1be23e994fd2 100644
> > > --- a/meta/lib/oeqa/sdk/cases/kmod.py
> > > +++ b/meta/lib/oeqa/sdk/cases/kmod.py
> > > @@ -31,8 +31,8 @@ class KernelModuleTest(OESDKTestCase):
> > > =20
> > >          with tempfile.TemporaryDirectory(prefix=3D"cryptodev", dir=
=3Dself.tc.sdk_dir) as testdir:
> > >              git_url =3D "https://github.com/cryptodev-linux/cryptode=
v-linux"
> > > -            # This is a knnown-good commit post-1.13 that builds wit=
h kernel 6.7+
> > > -            git_sha =3D "bb8bc7cf60d2c0b097c8b3b0e807f805b577a53f"
> > > +            # This is a known-good commit post-1.14 that builds with=
 kernel 6.18+
> > > +            git_sha =3D "08644db02d43478f802755903212f5ee506af73b"
> > > =20
> > >              sourcedir =3D os.path.join(testdir, "cryptodev-linux")
> > >              subprocess.check_output(["git", "clone", git_url, source=
dir], stderr=3Dsubprocess.STDOUT)
> >=20
> > Hi Trevor,
> >=20
> > I'm wondering why we haven't spotted this issue previously, we've been
> > using Linux 6.18 for months now. Are we missing a test case?
>=20
> No, the test case is there. It has been skipping, and a skip and a pass
> look the same from the summary line.
>=20
> kmod.KernelModuleTest guards on
>=20
>     self.ensure_target_package("kernel-devsrc")
>=20
> and a standard SDK does not contain kernel-devsrc, so that test has=20
> never run on the SDK the autobuilder actually builds. It only ran here
> because I was building an SDK that carries the kernel source, which is
> also why the cryptodev breakage surfaced now rather than in March.

Good catch!

> I have been down a deep rabbit hole finding and fixing many of these
> things while working on my SDK_FEATURES patchset:
>=20
> - a fix for the pkgconf name above, so the meson case runs again
> - an oeqa/sdk change letting a case name the command it needs and
>   resolve it inside the SDK's own install directory, so "the SDK does
>   not have this" and "I silently used the host's copy" stop being the
>   same outcome. That is what turns the eSDK false pass into either a
>   real pass or an honest skip.

I look forward to the patches!

In the meantime we can merge this patch as we now understand why we
weren't seeing any failures.

Best regards,

--=20
Paul Barker


