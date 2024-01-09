Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E4B7C4707B
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 21:50:23 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.30106.1704837019385723092
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 13:50:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BkJLjVb2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 396EC24000B;
	Tue,  9 Jan 2024 21:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704837017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=29vaZZI3zY31jld06Csf2nfUTSKlYLk5RnU1zkvxZ7o=;
	b=BkJLjVb2QVl7niWDhuQ8MKKti7aZvMaHBlj8GMVNEu8Yk+9QfIXnl+tguGTf55luKcdE+o
	exO4pY7gKEGMQLOuXRKMMzaL8fXHuakE3IMOjv6mu+sOHzETSzCYeb+6fKgZiNB+T78reD
	WJSwbwtvAQZR3PlMngVAHO17OxbqBcoVLnAg3KewUT8kWBluuF5lu5LTl6XoMirX4BPfBt
	NqqDA7u4p8gKUIjEl3AT3O1uv13FUnKehDI5Y7dZ+jMPLON8Oo7MY8Vd+q9ZlyGjWkwg37
	L4sSrsJcFCOKGARpYXE0z06HBMXeHhy0FaZIDM7WJHxcDVvLzEkRArgL4zS/XA==
Date: Tue, 9 Jan 2024 22:50:17 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 3/3] python3-cython: update 0.29.36 -> 3.0.7
Message-ID: <20240109215016bbe22b62@mail.local>
References: <20240105133543.3017997-1-alex@linutronix.de>
 <20240105133543.3017997-3-alex@linutronix.de>
 <17A828BF39EB0275.11644@lists.openembedded.org>
 <20240108073957f097fbdb@mail.local>
 <CANNYZj_n98oA_9mxbQLQim6J398=zECm8h9E5pRAcvafZ537Hg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj_n98oA_9mxbQLQim6J398=zECm8h9E5pRAcvafZ537Hg@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 21:50:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193484

On 08/01/2024 09:10:14+0100, Alexander Kanavin wrote:
> I suspect this might have been a transient network issue. Both tests
> fetch stuff from 3rd party servers.

This is super weird but I added the cython upgrade and got this one, on
fedora38-ty-4 again:
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6296/steps/14/logs/stdio

I'll try to reproduce without the other patches I'm carrying.

> 
> Alex
> 
> On Mon, 8 Jan 2024 at 08:39, Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > On 07/01/2024 20:54:18+0100, Alexandre Belloni via lists.openembedded.org wrote:
> > > Hello,
> > >
> > > I believe this causes those failures on fedora, oe-selftest passed on
> > > the other hosts:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6287/steps/14/logs/stdio
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6288/steps/14/logs/stdio
> > >
> > > Or maybe fedora38-ty-4 is the issue, I've started a build without the
> > > patch on this worker now.
> > >
> >
> > Amazingly, I can't reproduce anymore...
> >
> > >
> > > On 05/01/2024 14:35:43+0100, Alexander Kanavin wrote:
> > > > pep517 build backends require cython 3.x when
> > > > python is at 3.12, so we can't hold this update any
> > > > longer. There are only a few things in meta-oe
> > > > and meta that break anymore, and fixes for them
> > > > are provided at the same time as this patch.
> > > >
> > > > License-update: http -> https
> > > >
> > > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > > ---
> > > >  meta/recipes-devtools/python/python-cython.inc             | 7 +++++--
> > > >  .../{python3-cython_0.29.36.bb => python3-cython_3.0.7.bb} | 0
> > > >  2 files changed, 5 insertions(+), 2 deletions(-)
> > > >  rename meta/recipes-devtools/python/{python3-cython_0.29.36.bb => python3-cython_3.0.7.bb} (100%)
> > > >
> > > > diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
> > > > index 6aec6b012f1..bc1953c5045 100644
> > > > --- a/meta/recipes-devtools/python/python-cython.inc
> > > > +++ b/meta/recipes-devtools/python/python-cython.inc
> > > > @@ -5,11 +5,11 @@ It's designed to bridge the gap between the nice, high-level, easy-to-use world
> > > >  and the messy, low-level world of C."
> > > >  SECTION = "devel/python"
> > > >  LICENSE = "Apache-2.0"
> > > > -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
> > > > +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
> > > >  PYPI_PACKAGE = "Cython"
> > > >  BBCLASSEXTEND = "native nativesdk"
> > > >
> > > > -SRC_URI[sha256sum] = "41c0cfd2d754e383c9eeb95effc9aa4ab847d0c9747077ddd7c0dcb68c3bc01f"
> > > > +SRC_URI[sha256sum] = "fb299acf3a578573c190c858d49e0cf9d75f4bc49c3f24c5a63804997ef09213"
> > > >  UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
> > > >
> > > >  inherit pypi
> > > > @@ -39,4 +39,7 @@ do_install:append() {
> > > >     for PYTHSCRIPT in `grep -rIl '^#!.*python' ${D}`; do
> > > >             sed -i -e '1s|^#!.*|#!/usr/bin/env ${PYTHON_PN}|' $PYTHSCRIPT
> > > >     done
> > > > +
> > > > +        # remove build paths from generated sources
> > > > +        sed -i -e 's|${WORKDIR}||' ${S}/Cython/*.c ${S}/Cython/Compiler/*.c ${S}/Cython/Plex/*.c
> > > >  }
> > > > diff --git a/meta/recipes-devtools/python/python3-cython_0.29.36.bb b/meta/recipes-devtools/python/python3-cython_3.0.7.bb
> > > > similarity index 100%
> > > > rename from meta/recipes-devtools/python/python3-cython_0.29.36.bb
> > > > rename to meta/recipes-devtools/python/python3-cython_3.0.7.bb
> > > > --
> > > > 2.39.2
> > > >
> > >
> > > >
> > > >
> > > >
> > >
> > >
> > > --
> > > Alexandre Belloni, co-owner and COO, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
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

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193396): https://lists.openembedded.org/g/openembedded-core/message/193396
> Mute This Topic: https://lists.openembedded.org/mt/103542146/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

