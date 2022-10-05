Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0472FC433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 16:51:07 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web08.143.1664988656880385893
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 09:50:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=c0v7Thbp;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8EFA6C000C;
	Wed,  5 Oct 2022 16:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1664988655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+avkx/myG28EnaNjQImfnjJ6jGGSHgenddvqytrH4MU=;
	b=c0v7ThbpGxgfKbv55WCV4EqtHNjnTMgtNOqNuCZNNdVTh8wGCPG1NXKfcOweGnrwZjSQOH
	6rkSBqEdbxogSmR9ywvN6DhdsB8su2BUJAnCkrJxI2Jd/F49pkp9YbqIX24HELu5qtJXlB
	biTcWmEiD7Aktuhdt0tsEAmM4nix8AM7RdywLxxtE/Kw8JSFnbgohOiHxfcZlmX7v3iwOQ
	81MjwdzGUKSeth1IdsBwJ6lgHnZyJZv9+4HPXYMKvNeEscwH2idJ+mgBBeGAjvdbXvCUqX
	mDQwabNGCkw4hU2B1tXBjc3sK6FrzK2GT/dFOdOnzGdPRfnB80MXOYYuEz4Wtw==
Date: Wed, 5 Oct 2022 18:50:53 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Mikko Rapeli" <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 3/5] u-boot: use openssl-native.bbclass
Message-ID: <20221005185053.2db8e10e@booty>
In-Reply-To: <Yz0d2F1PygnDspnK@nuoska>
References: <20221004152807.987313-1-mikko.rapeli@linaro.org>
	<20221004235719.0e2bd17b@booty>
	<Yz0d2F1PygnDspnK@nuoska>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 16:51:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171467

On Wed, 5 Oct 2022 09:02:00 +0300
"Mikko Rapeli" <mikko.rapeli@linaro.org> wrote:

> Hi,
> 
> On Tue, Oct 04, 2022 at 11:57:19PM +0200, Luca Ceresoli wrote:
> > Hello Mikko,
> > 
> > On Tue,  4 Oct 2022 18:28:07 +0300
> > "Mikko Rapeli" <mikko.rapeli@linaro.org> wrote:
> >   
> > > It sets all environment variables correctly for openssl-native.
> > > 
> > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>  
> > 
> > I'm taking this patch for testing, however I have a question, see below.
> >   
> > > ---
> > >  meta/recipes-bsp/u-boot/u-boot.inc | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> > > index f022aed732..cd9c578962 100644
> > > --- a/meta/recipes-bsp/u-boot/u-boot.inc
> > > +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> > > @@ -17,7 +17,8 @@ PACKAGECONFIG ??= "openssl"
> > >  # u-boot will compile its own tools during the build, with specific
> > >  # configurations (aka when CONFIG_FIT_SIGNATURE is enabled) openssl is needed as
> > >  # a host build dependency.
> > > -PACKAGECONFIG[openssl] = ",,openssl-native"
> > > +OPENSSL_INHERIT .= "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'openssl-native', '', d)}"  
> > 
> > What is the reason to use '.=' and not just '=' here?  
> 
> Hehe, it was in another example which was using conditional inheritance.
> 
> meta/recipes-support/gpgme/gpgme_1.18.0.bb
> 
> PYTHON_INHERIT .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native python3targetconfig', '', d)}"
> 
> I guess normal = assignment would work too. If that's preferred I can
> send a v3.

In this case a '=' seems the correct choice.

There is another issue with this patch. During AB testing we have this
new warning:

WARNING: u-boot-1_2022.07-r0 do_configure: QA Issue: u-boot: invalid PACKAGECONFIG: openssl [invalid-packageconfig]

I don't know which layer has the u-boot-1 recipe, but by grepping I
noticed the 'openssl' PACKAGECONFIG appears in oe-core elsewhere, and
it should be removed from there too.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

