Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80B90C001DC
	for <webhook@archiver.kernel.org>; Sun, 23 Jul 2023 22:23:57 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.35905.1690151028130879359
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jul 2023 15:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HLf9WaGL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF82F1BF203;
	Sun, 23 Jul 2023 22:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690151025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5hbToqkb80uTyJFDq39j6c6zWrfjC6q51XcA4mzkegg=;
	b=HLf9WaGLv60L5Gc7OhC+3lZPViSMnbxi2uMqCYd8O9g0FKEgJn4d85NmmKW01oWLOTuXfJ
	E5kIwJNbh7CwQdByFEW51VPS4gTiOuH/p3oFCL6fZazo/UjrZdB+BkomqBhZ75VqaJJjOG
	PBw2nMoDm8i3LkPmbngNvKez4R2kIIjDpVY2ga8ADcV+iSK9ixUUEbsd7xgFPAP7xegC6S
	XMUh3CPHzicBiL2jq0ap4J7b/y6jeFfvVX7M821hwkOBBrLtPw1Y7ou4Ivb7fxbS24M2H+
	xgOfYs0ySsT7drfgBix9/HnZd70sdZowWe0jzdTSHvvISUIozjmbjmPjaizUkw==
Date: Mon, 24 Jul 2023 00:23:44 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Piotr =?utf-8?Q?=C5=81obacz?= <p.lobacz@welotec.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: ODP: ODP: [OE-Core][PATCH v8][master-next 1/5]
 package_ipk.bbclass: add support for ACLs and xattr
Message-ID: <20230723222344c0de9eca@mail.local>
References: <17744C0B55ADA271.25264@lists.openembedded.org>
 <AM6PR04MB5368ED123188D5223D0F14B7913CA@AM6PR04MB5368.eurprd04.prod.outlook.com>
 <202307231504286d15f3bc@mail.local>
 <17748A1F3FBBC488.4774@lists.openembedded.org>
 <VI1PR04MB5373D3FCD62C630268F512BD913DA@VI1PR04MB5373.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI1PR04MB5373D3FCD62C630268F512BD913DA@VI1PR04MB5373.eurprd04.prod.outlook.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 22:23:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184766

On 23/07/2023 16:32:55+0000, Piotr Łobacz wrote:
> OK, I got it, but correct me if I'm wrong, namely packages differs between builds?
> 
> I have found this link https://docs.yoctoproject.org/dev/test-manual/reproducible-builds.html for it with instructions
> on how to reproduce it. I'll give it a try and In case of problems will try to ask.
> 

You will find the packages that differ in reproducibleA and
reproducibleB so you can compare them yourself.

> Cheers,
> Piotr
> 
> Od: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> w imieniu użytkownika Piotr Łobacz via lists.openembedded.org <p.lobacz=welotec.com@lists.openembedded.org>
> Wysłane: niedziela, 23 lipca 2023 17:53
> Do: Alexandre Belloni <alexandre.belloni@bootlin.com>
> DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
> Temat: ODP: ODP: [OE-Core][PATCH v8][master-next 1/5] package_ipk.bbclass: add support for ACLs and xattr
> 
> Hi,
> 
> > Hello,
> >
> > On 22/07/2023 21:03:43+0000, Piotr Łobacz wrote:
> > > Hello Alexadre,
> > > this time everything should be fixed and working :D I have tested it thrice:P
> > >
> > > Additionally I've discovered that somehow, during all these patchsets, an extra param "--numeric-owner" has gone from opkg-build script,
> > > which is important to store uid(s)/gid(s) as numbers instead of names in tar archive. An updated patch has been already pushed to opkg-utils
> > > upstream.
> > >
> > > You can run it and tell if everything is OK.
> > >
> >
> > This ran and mostly worked. The remaining issue is the reproducibility
> > issue:
> 
> I'm glad that we went further in this problem, but
> > https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230722-1a1a_7s6/
> 
> > Unfortunately, diffoscope is not running on that large set.
> 
> unfortunately I don't have knowledge what's this link about. Can you explain me a little bit and how is this being run from cli?
> 
> > BR
> > Piotr
> >
> >
> > Od: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> w imieniu użytkownika Piotr Łobacz via lists.openembedded.org <p.lobacz=welotec.com@lists.openembedded.org>
> > Wysłane: sobota, 22 lipca 2023 22:55
> > Do: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
> > DW: Piotr Łobacz <p.lobacz@welotec.com>
> > Temat: [OE-Core][PATCH v8][master-next 1/5] package_ipk.bbclass: add support for ACLs and xattr
> >
> > Extend OPKGBUILDCMD variable, with additional parameters, depending
> > on target distro features, in order to support ACLs and xattr.
> >
> > With fix pushed to the opkg-devel:
> > https://groups.google.com/g/opkg-devel/c/dYNHrLjDwg8
> > opkg-build is able to create tar archives with ACLs and xattr.
> >
> > Signed-off-by: Piotr Łobacz <p.lobacz@welotec.com>
> > ---
> >  meta/classes-global/package_ipk.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-global/package_ipk.bbclass
> > index b4b7bc9ac2..a0f106e4ad 100644
> > --- a/meta/classes-global/package_ipk.bbclass
> > +++ b/meta/classes-global/package_ipk.bbclass
> > @@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET = "${WORKDIR}/opkg-sdk-target.conf"
> >  PKGWRITEDIRIPK = "${WORKDIR}/deploy-ipks"
> >
> >  # Program to be used to build opkg packages
> > -OPKGBUILDCMD ??= 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
> > +OPKGBUILDCMD ??= 'opkg-build -Z xz -a "${XZ_DEFAULTS}" ${@bb.utils.contains('DISTRO_FEATURES', 'acl', '-A', '', d)} ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', '-X', '', d)}'
> >
> >  OPKG_ARGS += "--force_postinstall --prefer-arch-to-version"
> >  OPKG_ARGS += "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS") == "1"]}"
> > --
> > 2.34.1
> 
> >
> >
> >
> 
> 
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com/

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184761): https://lists.openembedded.org/g/openembedded-core/message/184761
> Mute This Topic: https://lists.openembedded.org/mt/100313731/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

