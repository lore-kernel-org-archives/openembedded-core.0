Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CEF5C4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 21:24:01 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web09.151.1668029038399450670
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 13:23:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ajFJ64bg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2CADE1C0002;
	Wed,  9 Nov 2022 21:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668029036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QbwYV7efjZRqkotOrftpkBeZYuHuQDJGusIZwpMW1NE=;
	b=ajFJ64bgsrlUTJf52G9awRCw9OOQ1WZ5QJ6iY4+0oJ0Vz/Kq7rcLC+DpGE6XOAiphQxAZ6
	YDmi1zx/mbg16d+mbBhVIHR/57tMTcKVnozQEa+qCZj9JaLwiWPkaZe6aMHkIzMGYRYYXY
	Z9YNeSNSGfPFK6nQNmxQyGLMQIv+Otf5J8M161tZ65Frl3JeOMWs4F6QZHCByRePpkrYTq
	cg9wK8JtF7bhKuws4+oivYyyaYK+NCoQT4SRUjl5TsNTGvGiAjQANRMlAYNYk+9sxoGjv6
	8ZeP0QUE4JE0Jr/FkY3OjauD+3SEAkeriz2qiHasdHDMiMh8Og+8ty9jI3HicA==
Date: Wed, 9 Nov 2022 22:23:55 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Maxime =?iso-8859-1?Q?Roussin-B=E9langer?= <maxime.roussinbelanger@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] mesa: fix runpath with native llvm-config in
 target sysroot
Message-ID: <Y2waa1aWSsc5z82P@mail.local>
References: <20221109030444.2414546-1-maxime.roussinbelanger@gmail.com>
 <Y2wSG33M67Rgxf/s@mail.local>
 <CAE=T-s6tviRYp8CdVmnHyRLbx3UK2EzdMfkcxLJ7si5obc-bXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAE=T-s6tviRYp8CdVmnHyRLbx3UK2EzdMfkcxLJ7si5obc-bXA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 21:24:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173059

On 09/11/2022 16:04:11-0500, Maxime Roussin-B�langer wrote:
> Hi, (sorry for 2nd message Alex, forgot to cc the list)
> 
> On Wed, Nov 9, 2022 at 3:48 PM Alexandre Belloni <
> alexandre.belloni@bootlin.com> wrote:
> 
> > Hello,
> >
> > On 08/11/2022 22:04:44-0500, Maxime Roussin-B�langer wrote:
> > > From: Maxime Roussin-B�langer <maxime.roussinbelanger@gmail.com>
> > >
> > > llvm-config is copied from native to target sysroot, it shouldn't be
> > > allowed to use target shared libraries when it loads.
> > >
> > > Remove all runpath so it uses shared library from host system since
> > > native llvm-config is compiled with hosttools compiler.
> > >
> >
> > I believe this is the cause of:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/6139/steps/32/logs/stdio
> 
> 
> The patch does fix that problem on my end.
> 

Well, it doesn't seem to be the cause but it doesn't fix it either...
I'm going to run it again using the same worker.

> 
> >
> >
> > I'm currently checking
> >
> > > Signed-off-by: Maxime Roussin-B�langer <maxime.roussinbelanger@gmail.com
> > >
> > > ---
> > >  meta/recipes-graphics/mesa/mesa.inc | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/meta/recipes-graphics/mesa/mesa.inc
> > b/meta/recipes-graphics/mesa/mesa.inc
> > > index 67cfb4f6c1..abc2c3f4c4 100644
> > > --- a/meta/recipes-graphics/mesa/mesa.inc
> > > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > > @@ -61,6 +61,7 @@ do_configure:prepend () {
> > >       if [ -e ${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE}
> > ]; then
> > >               cp
> > ${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE} ${STAGING_BINDIR}
> > >               cp ${STAGING_BINDIR_NATIVE}/llvm-config ${STAGING_BINDIR}
> > > +             chrpath -d ${STAGING_BINDIR}/llvm-config
> > >       fi
> > >  }
> > >
> > > --
> > > 2.36.0
> > >
> >
> > >
> > > 
> > >
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> >

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173058): https://lists.openembedded.org/g/openembedded-core/message/173058
> Mute This Topic: https://lists.openembedded.org/mt/94906155/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

