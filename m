Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D04CC02182
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 15:58:44 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.19317.1737475121147024764
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 07:58:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=F5/W7rO/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7482FF80F;
	Tue, 21 Jan 2025 15:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737475119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=46iiYPQ8Ui0lXQ2B+kJPbDWz/cbLj3YlWqC+PVUFEwo=;
	b=F5/W7rO//rFFNcPF/JtTKMLTgtgmaqQiqqBpIcVTvHPI0J6pYaNNAdAKSsyxKcYbd8kqBN
	dQXzh3Zq55xGbxzIfyelQt697YQz453oPPInPs36e4irm7DsEzfT0C1odvp0NvVOWpkJk3
	oYULqtcVrzAggJ9E3gBDVXwYqV/aP+jxBU6r78d27hllOQM8CEGYQoA5JEr2TwrEVCzfhX
	KwXS+6+NEJgmeuSz6NnM08m6pkxvWNr4w0VgT37NnQjHFFsAy82yq8hBj9obCfwlekuQJE
	mDosrr8FmeMrbLw5UJlshm+UC67W83KRD6fO+MLiGZ2m+37h7FfU/MXZJh9HLw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Jan 2025 16:58:38 +0100
Message-Id: <D77VIYCAX4VD.3B883SVMK26Y9@bootlin.com>
Subject: Re: [OE-core] [PATCH] rust-common: add LDFLAGS to 'build-rust-cc'
 wrapper
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>,
 <enrico.scholz@sigma-chemnitz.de>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250120164504.680234-1-enrico.scholz@sigma-chemnitz.de>
 <D77S4VUB95NS.1KP2EY47KNUJA@bootlin.com>
In-Reply-To: <D77S4VUB95NS.1KP2EY47KNUJA@bootlin.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 15:58:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210103

On Tue Jan 21, 2025 at 2:19 PM CET, Mathieu Dubois-Briand wrote:
> On Mon Jan 20, 2025 at 5:45 PM CET, Enrico Scholz via lists.openembedded.=
org wrote:
> > From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> >
> > Although rust differs between compiling (--> 'rust-cc' wrapper) and
> > linking (--> 'rust-ccld' wrapper), some core crates are using only the
> > 'rust-cc' wrapper to check for available compiler options [1] and
> > libraries [2].
> >
> > Not having LDFLAGS can break the build in subtle ways.  E.g. 'cargo-nat=
ive'
> > can fail to build with
> >
> > |   =3D note: .../hosttools/ld: .../liblibz_sys-....rlib(deflate.o):
> > |     relocation R_X86_64_32S against hidden symbol `_length_code' can =
not be used when making a PIE object
> >
> > because it does not find '-lz' (added by "DEPENDS =3D zlib") and builds
> > a static libz.a with missing PIC flags.
> >
> > Add LDFLAGS to the 'build-rust-cc' wrapper as it is done already for
> > the target one.
> >
> > [1] https://github.com/rust-lang/cc-rs/pull/1322
> >
> > [2] https://github.com/rust-lang/libz-sys/blob/12a32798c6bd18986cb5cd60=
3359b03c96f0eb4c/build.rs#L228-L234
> >
> > Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> > ---
>
> Hi Enrico,
>
> Thanks for your patch.
>
> I believe it is breaking some of the builds on the autobuilder, with the
> following error:
>
> error: failed to run custom build command for `hello v0.1.0 (/srv/pokybui=
ld/yocto-worker/qemuarmv5/build/build/tmp/work/qemuarmv5-poky-linux-gnueabi=
/core-image-sato/1.0/testimage-sdk/hello)`
> Caused by:
>   could not execute process `/srv/pokybuild/yocto-worker/qemuarmv5/build/=
build/tmp/work/qemuarmv5-poky-linux-gnueabi/core-image-sato/1.0/testimage-s=
dk/hello/target/debug/build/hello-1d90539edb14488a/build-script-build` (nev=
er executed)
>
> Caused by:
>   No such file or directory (os error 2)
>
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/80/builds/775/st=
eps/13/logs/stdio
>
> Can you have a look at this failure please ?

Ok, after more testing, it might be something else causing this error. I
will keep you updated.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


