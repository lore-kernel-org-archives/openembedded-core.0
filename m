Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D7ABC02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 07:30:59 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.6316.1737617457931560213
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jan 2025 23:30:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=L7La8mec;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B94D9240005;
	Thu, 23 Jan 2025 07:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737617456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sojWs5T6N8xcQy32DS6aRqU3qg/rfjIVyBwmZOcw2wc=;
	b=L7La8mec1WEQJ9UeTnCDih9SgZjhWnYGZHtOTULdV1RGWsW/NcJZ8YbNfIDDKYHkjlT7fl
	W7NcD5cGiSeBf9wGrBMPwwDYqD3DqDZr+hR9G5m3Fku113Vyq81XgZF2FUiviEJRWX/0IR
	hRpR9n5oZpUzmE1wjIYYO6uoVddsRWczaAIDP0c24hFW/34FhNwSJfCr67e+u2siafMDB+
	U4bokA5/4YBrPSRrwGv1WAZwee96wz3Ni5Z6flRjb1OrAvABqVknCw57QMg1mLgfwNgEqz
	ii5CJZAijXWMp1X0HKZzTqF0fMSg9IYIdyzSsqNpzxSs2j/H2pR1aKYfLeUxwA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jan 2025 08:30:55 +0100
Message-Id: <D799ZAYD67PE.206FLJXBMF2B4@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>,
 <enrico.scholz@sigma-chemnitz.de>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] rust-common: add LDFLAGS to 'build-rust-cc'
 wrapper
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250120164504.680234-1-enrico.scholz@sigma-chemnitz.de>
 <D77S4VUB95NS.1KP2EY47KNUJA@bootlin.com>
 <D77VIYCAX4VD.3B883SVMK26Y9@bootlin.com>
In-Reply-To: <D77VIYCAX4VD.3B883SVMK26Y9@bootlin.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 07:30:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210175

On Tue Jan 21, 2025 at 4:58 PM CET, Mathieu Dubois-Briand wrote:
> On Tue Jan 21, 2025 at 2:19 PM CET, Mathieu Dubois-Briand wrote:
> > On Mon Jan 20, 2025 at 5:45 PM CET, Enrico Scholz via lists.openembedde=
d.org wrote:
> > > From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> > >
> > > Although rust differs between compiling (--> 'rust-cc' wrapper) and
> > > linking (--> 'rust-ccld' wrapper), some core crates are using only th=
e
> > > 'rust-cc' wrapper to check for available compiler options [1] and
> > > libraries [2].
> > >
> > > Not having LDFLAGS can break the build in subtle ways.  E.g. 'cargo-n=
ative'
> > > can fail to build with
> > >
> > > |   =3D note: .../hosttools/ld: .../liblibz_sys-....rlib(deflate.o):
> > > |     relocation R_X86_64_32S against hidden symbol `_length_code' ca=
n not be used when making a PIE object
> > >
> > > because it does not find '-lz' (added by "DEPENDS =3D zlib") and buil=
ds
> > > a static libz.a with missing PIC flags.
> > >
> > > Add LDFLAGS to the 'build-rust-cc' wrapper as it is done already for
> > > the target one.
> > >
> > > [1] https://github.com/rust-lang/cc-rs/pull/1322
> > >
> > > [2] https://github.com/rust-lang/libz-sys/blob/12a32798c6bd18986cb5cd=
603359b03c96f0eb4c/build.rs#L228-L234
> > >
> > > Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> > > ---
> >
> > Hi Enrico,
> >
> > Thanks for your patch.
> >
> > I believe it is breaking some of the builds on the autobuilder, with th=
e
> > following error:
> >
> > error: failed to run custom build command for `hello v0.1.0 (/srv/pokyb=
uild/yocto-worker/qemuarmv5/build/build/tmp/work/qemuarmv5-poky-linux-gnuea=
bi/core-image-sato/1.0/testimage-sdk/hello)`
> > Caused by:
> >   could not execute process `/srv/pokybuild/yocto-worker/qemuarmv5/buil=
d/build/tmp/work/qemuarmv5-poky-linux-gnueabi/core-image-sato/1.0/testimage=
-sdk/hello/target/debug/build/hello-1d90539edb14488a/build-script-build` (n=
ever executed)
> >
> > Caused by:
> >   No such file or directory (os error 2)
> >
> >
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/80/builds/775/=
steps/13/logs/stdio
> >
> > Can you have a look at this failure please ?
>
> Ok, after more testing, it might be something else causing this error. I
> will keep you updated.

Hi Enrico,

Sorry for the false alarm, this patch is fine in an autobuilder point of
view. Said error was caused by another patch and I was able to build
with yours without any error.

Best regards,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


