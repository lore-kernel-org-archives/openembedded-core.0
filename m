Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0596C001B0
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 20:25:51 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.1878.1691612748329671101
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Aug 2023 13:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=P4JSSqW4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BA00960003;
	Wed,  9 Aug 2023 20:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691612746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7hKaDYamHl1S4sq3+lKvDsFcBtnLr709oyJF/4u0Se8=;
	b=P4JSSqW4HyxmlwrUUSS8TAQe41WWB4D3SyAC1bJ6rmoqPO7V6LhkLrDt5rYhXJovprrqt4
	0LISgBm3IU+X6mWIQvTh7aTUjX9/uKJXfYAUSuurfnWTcg66ycWjoVCht8AT73DPRw8zDj
	7qUZOfOleFWegQnhWuJJ2+C5ASO+LzaPqREGEL/qlIpYkHAOf2kLj4Pw2iLtK5tudXzkxS
	ECHa3Bi7883O3VdM0pB4EG1rg9evGA+3WBz2nZoF/cu5pNb2buPW9UiTN8vBUHTHUuQPh3
	aP1YVRhbQO9QXuDhxaIsrAIAyCW40pWi9zbb44RV4mqmwLrgaPUPhJflvjOjeA==
Date: Wed, 9 Aug 2023 22:25:45 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: Re: [OE-core][PATCH] systemd: fix efi dependency
Message-ID: <20230809202545e0e3244d@mail.local>
References: <1779200FA9E646B9.10230@lists.openembedded.org>
 <CANPvuR=Z0GVLXWLLm2LciS2FumJFRRCyAdovQHeTPjod3VS==g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANPvuR=Z0GVLXWLLm2LciS2FumJFRRCyAdovQHeTPjod3VS==g@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 20:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185715

Hello,

On 09/08/2023 00:02:08+0100, Jose Quaresma wrote:
> Ping!

We developed the same patch at the same time, I confirm yours is working
but it was not enough to solve all the systemd v254 related issues. I've
just sent the hopefully last patch to fix the remaining issue.

> 
> Jose Quaresma via lists.openembedded.org <quaresma.jose=
> gmail.com@lists.openembedded.org> escreveu no dia segunda, 7/08/2023 �(s)
> 15:26:
> 
> > Last version of systemd dpends now on pyelftools to build the efi support
> > but the required tool is the native ones and not the target.
> > The systemd-boot has the corrected dependencie so fix this in the main
> > recipe.
> >
> > | Program python3 (jinja2) found: YES
> > (/build/tmp-lmp/work/corei7-64-lmp-linux/systemd/1_254-r0/recipe-sysroot-native/usr/bin/python3-native/python3)
> > modules: jinja2
> > | Checking if "32bit build possible" : links: NO
> > | Program python3 (elftools) found: NO
> > |
> > | ../git/meson.build:2147:8: ERROR: Problem encountered: EFI bootloader
> > support requires pyelftools.
> > |
> > | A full log can be found at
> > /build/tmp-lmp/work/corei7-64-lmp-linux/systemd/1_254-r0/build/meson-logs/meson-log.txt
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >  meta/recipes-core/systemd/systemd_254.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/systemd/systemd_254.bb
> > b/meta/recipes-core/systemd/systemd_254.bb
> > index ea1a4f02f0..cd2a021da2 100644
> > --- a/meta/recipes-core/systemd/systemd_254.bb
> > +++ b/meta/recipes-core/systemd/systemd_254.bb
> > @@ -142,7 +142,7 @@ PACKAGECONFIG[default-compression-lz4] = "-Dlz4=true
> > -Ddefault-compression=lz4,,
> >  PACKAGECONFIG[default-compression-xz] = "-Dxz=true
> > -Ddefault-compression=xz,,xz"
> >  PACKAGECONFIG[default-compression-zstd] = "-Dzstd=true
> > -Ddefault-compression=zstd,,zstd"
> >  PACKAGECONFIG[dbus] = "-Ddbus=true,-Ddbus=false,dbus"
> > -PACKAGECONFIG[efi] = "-Defi=true -Dbootloader=true,-Defi=false
> > -Dbootloader=false,python3-pyelftools"
> > +PACKAGECONFIG[efi] = "-Defi=true -Dbootloader=true,-Defi=false
> > -Dbootloader=false,python3-pyelftools-native"
> >  PACKAGECONFIG[elfutils] = "-Delfutils=true,-Delfutils=false,elfutils"
> >  PACKAGECONFIG[firstboot] = "-Dfirstboot=true,-Dfirstboot=false"
> >  PACKAGECONFIG[repart] = "-Drepart=true,-Drepart=false"
> > --
> > 2.34.1
> >
> >
> > 
> >
> >
> 
> -- 
> Best regards,
> 
> Jos� Quaresma

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185679): https://lists.openembedded.org/g/openembedded-core/message/185679
> Mute This Topic: https://lists.openembedded.org/mt/100600508/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

