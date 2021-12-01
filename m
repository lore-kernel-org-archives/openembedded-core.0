Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF80C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 18:06:15 +0000 (UTC)
Received: from avasout-ptp-003.plus.net (avasout-ptp-003.plus.net
 [84.93.230.244])
 by mx.groups.io with SMTP id smtpd.web12.550.1638381972657246021
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 10:06:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=poe9gsxx;
 spf=pass (domain: mcrowe.com, ip: 84.93.230.244, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id sTzUmw0SVQVJ6sTzVmt4VS; Wed, 01 Dec 2021 18:06:07 +0000
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.4 cv=L7x+/8f8 c=1 sm=1 tr=0 ts=61a7b98f
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=kj9zAlcOel0A:10 a=IOMw9HtfNCkA:10 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8
 a=raqDDGH8x54uOjInfosA:9 a=CjuIK1q_8ugA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=QHAXwQvF+J0cTd8RYywKEzhXPkUIJ/EO2G8SDtTQ7FI=; b=poe9g
	sxxTogdTL0Nfd1/sz0hsdeEaMJ5jPpZ28qC79uU/kvya1crefiVjXpW6uF22PhNuHBaShF2xv9z9W
	qYHeEaznZcGsBAX/xlFXoO5brWEgHOAA6sZhDIgcb0oe0xmTK0XfAz5Kv0dG7lcWJuckaO7ZUDT8O
	mRvqM231AVnnYDn+oKMf9HEiNDEVKca7N7k3/qXJwkxXlVobF2DaJw+esPAQ35lmcTfaOIqSs1dbj
	M+GV2aajoZlElW6d9j1APGRR5bVdJHjqvEUc/oh3pZQo3KLjL+4z8O8HL6bicsRFbUjMkMKCXUJsI
	sPMiUL+qpj+/fMOnCnioonk9b+VHQ==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.94.2)
	(envelope-from <mac@mcrowe.com>)
	id 1msTzT-007Hdd-UR; Wed, 01 Dec 2021 18:05:59 +0000
Date: Wed, 1 Dec 2021 18:05:59 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Correct way to set DRIDRIVERS and GALLIUMDRIVERS from
 mesa bbappend
Message-ID: <Yae5h9EsXqA0ycqU@mcrowe.com>
References: <YaemRcD22hUhkQrq@mcrowe.com>
 <CANNYZj-7YLRwgbCDusZv98B0RSkzVbKPZWJm6r=akEXysLGT0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CANNYZj-7YLRwgbCDusZv98B0RSkzVbKPZWJm6r=akEXysLGT0g@mail.gmail.com>
X-CMAE-Envelope: 
 MS4xfJkWddgA3jRjBNhY1LTV6uttC7YEbPRoC0EouHeEvV4L3LDmdlEJkax/6Sy95BbecqTXzpRO6w4QSJU/TzHYCT+O04sonaYPGFqdxagogr11TnmQZlbE
 DIE0Hjhshfc7X7DJgnUeSlxn0mHQsGztCWhPgi7PA3Z4JCbS93ztByVRYI9rZIZYq38Ch242GFRznj8yWpJ53SlwEYzhFGW0LEE=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 18:06:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159055

Hi Alex,

Thanks for responding.

Just to make sure I understand, you think that I should add something like:

 PACKAGECONFIG[i915] = ""
 PACKAGECONFIG[iris] = ""
 PACKAGECONFIG[crocus] = ""
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'i915', ',i915', '', d)}"
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'iris', ',iris', '', d)}"
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'crocus', ',crocus', '', d)}"

But then I need to find a way to get "i915 iris crocus" into PACKAGECONFIG
for x86 and x86-64 whilst still letting others override that. The best I
can come up with is to modify the existing default PACKAGECONFIG to be
something like:

 PACKAGECONFIG_DEFAULT_FOR_TARGET:x86 = "i915 iris crocus"
 PACKAGECONFIG_DEFAULT_FOR_TARGET:x86-64 = "i915 iris crocus"
 PACKAGECONFIG:class-target ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland vulkan', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm dri gallium virgl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11 dri3', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
                    elf-tls \
                    ${PACKAGECONFIG_DEFAULT_FOR_TARGET} \
                    "

This will probably break anyone who currently sets their own PACKAGECONFIG
for x86 and x86-64 until they add the drivers they require. This would seem
to be worse than my GALLIUMDRIVERS_DEFAULT suggestion. :(

Have I misunderstood you, or is there a better way?

Thanks.

Mike.

On Wednesday 01 December 2021 at 18:21:44 +0100, Alexander Kanavin wrote:
> I think you do need to modify oe-core unfortunately, like is done for other
> drivers:
> 
> PACKAGECONFIG[etnaviv] = ""
> GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'etnaviv',
> ',etnaviv', '', d)}"
> 
> Alex
> 
> On Wed, 1 Dec 2021 at 17:44, Mike Crowe via lists.openembedded.org <mac=
> mcrowe.com@lists.openembedded.org> wrote:
> 
> > I'm building for a specific chip and therefore don't wish to waste time and
> > electricity building and disk space on the target installing unwanted mesa
> > drivers. However, mesa.inc contains:
> >
> >  GALLIUMDRIVERS = "swrast"
> >  GALLIUMDRIVERS:x86-x32 = ""
> >  GALLIUMDRIVERS:append:x86:class-target = ",i915,iris,crocus"
> >  GALLIUMDRIVERS:append:x86-64:class-target = ",i915,iris,crocus"
> >
> > and mesa_21.3.0.bb contains:
> >
> >  DRIDRIVERS ??= ""
> >  DRIDRIVERS:append:x86:class-target = ",r100,r200,nouveau,i965"
> >  DRIDRIVERS:append:x86-64:class-target = ",r100,r200,nouveau,i965"
> >
> > I'm unable to find a way to override these values. Using (for example):
> >
> >  DRIDRIVERS:forcevariable = ""
> >  GALLIUMDRIVERS:forcevariable = "swrast"
> >
> > doesn't work because the append still happens after the forcevariable
> > override takes effect. :(
> >
> > Is there a way that I can override GALLIUMDRIVERS and DRIDRIVERS with my
> > own values for x86 and x86-64 without modifying oe-core itself?
> >
> > If not, should the oe-core recipe being using something like:
> >
> >  GALLIUMDRIVERS_DEFAULT = "swrast"
> >  GALLIUMDRIVERS_DEFAULT:x86-x32 = ""
> >  GALLIUMDRIVERS_DEFAULT:append:x86:class-target = ",i915,iris,crocus"
> >  GALLIUMDRIVERS_DEFAULT:append:x86-64:class-target = ",i915,iris,crocus"
> >  GALLIUMDRIVERS ?= "${GALLIUMDRIVERS_DEFAULT}"
> >
> > and similar for DRIDRIVERS to support this?
> >
> > Thanks.
> >
> > Mike.
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#159048):
> > https://lists.openembedded.org/g/openembedded-core/message/159048
> > Mute This Topic: https://lists.openembedded.org/mt/87432435/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> > alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
> >

