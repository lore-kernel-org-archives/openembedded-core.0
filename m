Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 192ADC47074
	for <webhook@archiver.kernel.org>; Sun,  7 Jan 2024 20:09:14 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.23434.1704658153237661707
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Jan 2024 12:09:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eKzw7ZX2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 08C601C0005;
	Sun,  7 Jan 2024 20:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704658151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sMUKA5hZk869GgP7GAqKt35OhNKpt6Pz76gfo75r9mo=;
	b=eKzw7ZX2wBKMpl6kU/wVVOIVLBei439SjzFJjFmU3AeMYntCnkS/l7IfxxVciOuyokRPpl
	GNaBLpMQs5DfMN7DW5UKP5p1LFGknqVjkcfAsF+8NvN3bl6D9llLcj56XuvVgPk20OPbk9
	llehFhvpkdxFbTY09LXiimNeB61tdo6uSd9No8ypXBX79k/aVPnABqCJcJCIDIgqbUWcLw
	Cs7OrArFkeeUiKKXStyhYSyr0eQV0UOLU0wqBOtNcpn7t8AavIV8HkLVJ9L5bvG2xXCkOC
	RCjDznypQURX3fTIIY1clCdSuWCn9DYorYGtCkucCpoAxoBgSzhuA1PUb88/Mw==
Date: Sun, 7 Jan 2024 21:09:10 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 3/3] python3-cython: update 0.29.36 -> 3.0.7
Message-ID: <2024010720091071083c76@mail.local>
References: <20240105133543.3017997-1-alex@linutronix.de>
 <20240105133543.3017997-3-alex@linutronix.de>
 <20240107195418f0ae009a@mail.local>
 <CANNYZj_6afrVd3n=pYkmpGRugmkW43a9qf39du-hdpg7AUPGrw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj_6afrVd3n=pYkmpGRugmkW43a9qf39du-hdpg7AUPGrw@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Jan 2024 20:09:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193392

On 07/01/2024 21:05:45+0100, Alexander Kanavin wrote:
> 2024-01-07 15:06:26,597 - oe-selftest - INFO - FAIL:
> devtool.DevtoolAddTests.test_devtool_add_fetch_simple
> (subunit.RemotedTestCase)
> ERROR: Nothing PROVIDES 'pv'
> 
> 2024-01-07 06:40:56,859 - oe-selftest - INFO - FAIL:
> devtool.DevtoolAddTests.test_devtool_add_git_style1
> (subunit.RemotedTestCase)
> ERROR: Nothing PROVIDES 'mbedtls'
> 
> I'm totally puzzled. Why do you suspect cython?

I didn't have much else to suspect and I ran the same branch without
this patch successfully (but on fedora38-ty-3). Apart from this, I guess
I'm as puzzled as you are.

> 
> Alex
> 
> On Sun, 7 Jan 2024 at 20:54, Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > Hello,
> >
> > I believe this causes those failures on fedora, oe-selftest passed on
> > the other hosts:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6287/steps/14/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6288/steps/14/logs/stdio
> >
> > Or maybe fedora38-ty-4 is the issue, I've started a build without the
> > patch on this worker now.
> >
> >
> > On 05/01/2024 14:35:43+0100, Alexander Kanavin wrote:
> > > pep517 build backends require cython 3.x when
> > > python is at 3.12, so we can't hold this update any
> > > longer. There are only a few things in meta-oe
> > > and meta that break anymore, and fixes for them
> > > are provided at the same time as this patch.
> > >
> > > License-update: http -> https
> > >
> > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > ---
> > >  meta/recipes-devtools/python/python-cython.inc             | 7 +++++--
> > >  .../{python3-cython_0.29.36.bb => python3-cython_3.0.7.bb} | 0
> > >  2 files changed, 5 insertions(+), 2 deletions(-)
> > >  rename meta/recipes-devtools/python/{python3-cython_0.29.36.bb => python3-cython_3.0.7.bb} (100%)
> > >
> > > diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
> > > index 6aec6b012f1..bc1953c5045 100644
> > > --- a/meta/recipes-devtools/python/python-cython.inc
> > > +++ b/meta/recipes-devtools/python/python-cython.inc
> > > @@ -5,11 +5,11 @@ It's designed to bridge the gap between the nice, high-level, easy-to-use world
> > >  and the messy, low-level world of C."
> > >  SECTION = "devel/python"
> > >  LICENSE = "Apache-2.0"
> > > -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
> > > +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
> > >  PYPI_PACKAGE = "Cython"
> > >  BBCLASSEXTEND = "native nativesdk"
> > >
> > > -SRC_URI[sha256sum] = "41c0cfd2d754e383c9eeb95effc9aa4ab847d0c9747077ddd7c0dcb68c3bc01f"
> > > +SRC_URI[sha256sum] = "fb299acf3a578573c190c858d49e0cf9d75f4bc49c3f24c5a63804997ef09213"
> > >  UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
> > >
> > >  inherit pypi
> > > @@ -39,4 +39,7 @@ do_install:append() {
> > >       for PYTHSCRIPT in `grep -rIl '^#!.*python' ${D}`; do
> > >               sed -i -e '1s|^#!.*|#!/usr/bin/env ${PYTHON_PN}|' $PYTHSCRIPT
> > >       done
> > > +
> > > +        # remove build paths from generated sources
> > > +        sed -i -e 's|${WORKDIR}||' ${S}/Cython/*.c ${S}/Cython/Compiler/*.c ${S}/Cython/Plex/*.c
> > >  }
> > > diff --git a/meta/recipes-devtools/python/python3-cython_0.29.36.bb b/meta/recipes-devtools/python/python3-cython_3.0.7.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/python/python3-cython_0.29.36.bb
> > > rename to meta/recipes-devtools/python/python3-cython_3.0.7.bb
> > > --
> > > 2.39.2
> > >
> >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#193357): https://lists.openembedded.org/g/openembedded-core/message/193357
> > > Mute This Topic: https://lists.openembedded.org/mt/103542146/3617179
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

