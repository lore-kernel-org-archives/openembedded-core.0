Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7310AC7EE2F
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 15:50:39 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.16941.1686325830912300845
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 08:50:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GjRfwtZ/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686325829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DhDh4Pc3YnD/mWhqjqxNAybjeAmNaHXpoEtahwKreoc=;
	b=GjRfwtZ/Cb8uRUcuc3QR6HXThIvZ3iX3PpH19xiVpvKkBZenjRkSityaU3WAvU74RWMh6M
	vzPt1kJequDtXZUBqShOT3shatGN13atFfm90Xxv+P8S8wMalr2+c649H4sW6+/xNT4Huh
	wVHY2WjInEgrnWQI+ce/LOPmmg04fVgpLvm0BcKefhLZbcKMKrXlem96Jpv/3vl1HWTzIY
	WR6v/MWUc8ZFqxhUfSfXBZ9iKZJCDbz6zIdCPb15RK22x4Xvl8Xtpz7tyuvOgAAZoCg/to
	2PbahiVyg1XXxxAMMiz4JdF0mpGfSDV0KK2szobiEOr4dGpM9aa3LtebXN959g==
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 763454000E;
	Fri,  9 Jun 2023 15:50:28 +0000 (UTC)
Date: Fri, 9 Jun 2023 17:50:27 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ross Burton <ross.burton@arm.com>
Cc: "ecordonnier@snap.com" <ecordonnier@snap.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] libxcrypt: fix hard-coded ".so" extension
Message-ID: <2023060915502700eeb2a1@mail.local>
References: <20230526115155.1953481-1-ecordonnier@snap.com>
 <CAHUKmYbZdJ3kws3ujidWy89pZSM_siGYBbcLzMJtWKbT_6A5dQ@mail.gmail.com>
 <B5654344-F58D-4A5D-8AD7-668A866E9CD4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <B5654344-F58D-4A5D-8AD7-668A866E9CD4@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 15:50:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182564

On 09/06/2023 15:19:12+0000, Ross Burton wrote:
> Probably just fell through a crack, I’ve queued it locally for testing.
> 

It didn't apply cleanly on my master-next and I was waiting for things
to calm down to get back to it.

> Sorry about that!
> 
> Ross
> 
> > On 9 Jun 2023, at 10:37, Etienne Cordonnier via lists.openembedded.org <ecordonnier=snap.com@lists.openembedded.org> wrote:
> > 
> > Hello,
> > is everything OK with the patch? Is there anything blocking a merge?
> > 
> > On Fri, May 26, 2023 at 1:52 PM <ecordonnier@snap.com> wrote:
> > From: Etienne Cordonnier <ecordonnier@snap.com>
> > 
> > 2 issues:
> > - the .so extension is hard-coded, and therefore the libxcryt package compiled with
> >   meta-darwin is empty, because the dylib files are not contained in FILES_${PN}
> > - nothing actually produces a file libcrypt-*.so (the symlink file is libcrypt.so, without dash), thus
> >   defining FILES:${PN} manually to contain libcrypt-*.so has no effect.
> > 
> > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> > ---
> >  meta/recipes-core/libxcrypt/libxcrypt.inc | 6 ------
> >  1 file changed, 6 deletions(-)
> > 
> > diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
> > index 61b0381076..454a55d73d 100644
> > --- a/meta/recipes-core/libxcrypt/libxcrypt.inc
> > +++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
> > @@ -17,12 +17,6 @@ SRC_URI += "file://fix_cflags_handling.patch"
> > 
> >  PROVIDES = "virtual/crypt"
> > 
> > -FILES:${PN} = "${libdir}/libcrypt*.so.* \
> > -               ${libdir}/libcrypt-*.so \
> > -               ${libdir}/libowcrypt*.so.* \
> > -               ${libdir}/libowcrypt-*.so \
> > -"
> > -
> >  S = "${WORKDIR}/git"
> > 
> >  BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
> > -- 
> > 2.36.1.vfs.0.0
> > 
> > 
> > 
> > 
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182559): https://lists.openembedded.org/g/openembedded-core/message/182559
> Mute This Topic: https://lists.openembedded.org/mt/99149665/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

