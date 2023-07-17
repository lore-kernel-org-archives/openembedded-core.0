Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08651EB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 12:46:27 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.7142.1689597984914098070
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 05:46:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=F/1e/syR;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B6E7FF803;
	Mon, 17 Jul 2023 12:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689597983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rmYlxMq3ISCk1YR+qbT0PrPxyu9PLLf8vFPPlmuyTc8=;
	b=F/1e/syRF9W0NoIAKW/rnVurP68xcSUnacMtPWHvRt5x7a4R4VYMazXHg49M/TCjfOpF8G
	yPjXO9fO3YEpPrPlhm/V9N0/H0Rv14RhH9Cmxy1xaZxBDnUlA6wmVDfg+yklNIsw/k9gx9
	VAO85XKU18W6fTsasgzC+/FeFyNTZ53ZwYNLKMlsD4Mc3u2qQa7RjMLH6SvEYXLj3OkMrl
	CWwM4RXVxAvyvnd7eTHcZ24RqjSNM80CYW+BxGNlnWzoKpMO6fP2w+SaLURA9LD3G+j5Yw
	j/OVpvjnLRbf9Q/oT2aaMbCNLksH7tJNWtIU66VYB9Yc6d4Wx0OnMwxYQXwphQ==
Date: Mon, 17 Jul 2023 14:46:21 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org, Ross.Burton@arm.com
Subject: Re: [OE-core] [PATCH v3] qemu: Add qemu-common package
Message-ID: <202307171246212fd06366@mail.local>
References: <E57733DA-39D3-494F-A91D-9AA8306DBDAB@arm.com>
 <20230710103218.3834001-1-mingli.yu@eng.windriver.com>
 <2023071611474165f97b23@mail.local>
 <919cae59-a542-5a51-e70e-164b5306eb41@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <919cae59-a542-5a51-e70e-164b5306eb41@windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 12:46:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184463

On 17/07/2023 15:10:35+0800, Yu, Mingli wrote:
> Hi Alex,
> 
> On 7/16/23 19:47, Alexandre Belloni wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender and know the content is safe.
> > 
> > Hello,
> > 
> > This causes the following meta-mingw error on the AB:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/7501/steps/12/logs/stdio
> 
> I didn't find the core-image-mingw-sdktest recipe which I noticed in the
> above log, so I cannot reproduce the issue as you mentioned.

As stated above, this is part of meta-mingw:

https://git.yoctoproject.org/meta-mingw/tree/recipes-core/images?h=master-next

> 
> Thanks,
> 
> > 
> > This is due to the added native-sdk dependency.
> > 
> > On 10/07/2023 18:32:18+0800, Yu, Mingli wrote:
> > > From: Mingli Yu <mingli.yu@windriver.com>
> > > 
> > > We split the qemu package [1] to add support to make user can install
> > > one qemu arch emulation rpm to ease the concerns who care much about
> > > the rpm size in embedded device.
> > > 
> > > But for the user who only install the qemu-*.rpm can't do anything
> > > except they install the qemu emulation rpm like qemu-system-x86-64-*.rpm
> > > explicitly.
> > > 
> > > So add qemu-common package to package all thing into qemu-common when
> > > not split the package, and package only the basic into qemu-common and
> > > other arch related to each qemu arch emulation rpm when split the package
> > > to fix the backward compatibility.
> > > 
> > > qenu-*.rpm which is meta package rdepends on qemu-common and the available
> > > qemu arch emulation rpm like qemu-system-x86-64-*.rpm and etc.
> > > 
> > > [1] https://git.openembedded.org/openembedded-core/commit/?id=893846ead7ee54d53e9076150cd655e0c8bca5db
> > > 
> > > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > > ---
> > >   meta/recipes-devtools/qemu/qemu.inc      | 23 ++++++++++++-----------
> > >   meta/recipes-devtools/qemu/qemu_8.0.0.bb |  3 ++-
> > >   2 files changed, 14 insertions(+), 12 deletions(-)
> > > 
> > > diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> > > index a5bdeef66d..94624163d0 100644
> > > --- a/meta/recipes-devtools/qemu/qemu.inc
> > > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > > @@ -226,15 +226,18 @@ PACKAGECONFIG[brlapi] = "--enable-brlapi,--disable-brlapi"
> > >   PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack,"
> > >   PACKAGECONFIG[debuginfo] = "--enable-libdw,--disable-libdw,elfutils"
> > > 
> > > -INSANE_SKIP:${PN} = "arch"
> > > +INSANE_SKIP:${PN}-common = "arch"
> > > 
> > >   FILES:${PN} += "${datadir}/icons"
> > > 
> > >   # For user who want to install all arch packages
> > > -PACKAGES =+ "${PN}-system-all ${PN}-user-all"
> > > +PACKAGES =+ "${PN}-common"
> > > +RDEPENDS:${PN} += "${PN}-common"
> > > 
> > > -ALLOW_EMPTY:${PN}-system-all = "1"
> > > -ALLOW_EMPTY:${PN}-user-all = "1"
> > > +ALLOW_EMPTY:${PN} = "1"
> > > +FILES:${PN} = ""
> > > +
> > > +FILES:${PN}-common = "${bindir}/* ${includedir}/* ${libexecdir}/* ${datadir}/* ${localstatedir}"
> > > 
> > >   PACKAGES_DYNAMIC += "^${PN}-user-.*  ^${PN}-system-.*"
> > > 
> > > @@ -242,15 +245,13 @@ PACKAGESPLITFUNCS =+ "split_qemu_packages"
> > > 
> > >   python split_qemu_packages () {
> > >       archdir = d.expand('${bindir}/')
> > > -    syspackages = do_split_packages(d, archdir, r'^qemu-system-(.*)$', '${PN}-system-%s', 'QEMU full system emulation binaries(%s)' , prepend=True)
> > > -    if syspackages:
> > > -        d.setVar('RDEPENDS:' + d.getVar('PN') + '-system-all', ' '.join(syspackages))
> > > +    subpackages = do_split_packages(d, archdir, r'^qemu-system-(.*)$', '${PN}-system-%s', 'QEMU full system emulation binaries(%s)' , prepend=True, extra_depends='${PN}-common')
> > > 
> > > -    userpackages = do_split_packages(d, archdir, r'^qemu-((?!system|edid|ga|img|io|nbd|pr-helper|storage-daemon).*)$', '${PN}-user-%s', 'QEMU full user emulation binaries(%s)' , prepend=True)
> > > -    if userpackages:
> > > -        d.setVar('RDEPENDS:' + d.getVar('PN') + '-user-all', ' '.join(userpackages))
> > > +    subpackages += do_split_packages(d, archdir, r'^qemu-((?!system|edid|ga|img|io|nbd|pr-helper|storage-daemon).*)$', '${PN}-user-%s', 'QEMU full user emulation binaries(%s)' , prepend=True, extra_depends='${PN}-common')
> > > +    if subpackages:
> > > +        d.appendVar('RDEPENDS:' + d.getVar('PN'), ' ' + ' '.join(subpackages))
> > >       mipspackage = d.getVar('PN') + "-user-mips"
> > > -    if mipspackage in ' '.join(userpackages):
> > > +    if mipspackage in ' '.join(subpackages):
> > >           d.appendVar('RDEPENDS:' + mipspackage, ' ' + d.getVar("MLPREFIX") + 'bash')
> > >   }
> > > 
> > > diff --git a/meta/recipes-devtools/qemu/qemu_8.0.0.bb b/meta/recipes-devtools/qemu/qemu_8.0.0.bb
> > > index 42e133967e..412c2bc7f0 100644
> > > --- a/meta/recipes-devtools/qemu/qemu_8.0.0.bb
> > > +++ b/meta/recipes-devtools/qemu/qemu_8.0.0.bb
> > > @@ -8,7 +8,8 @@ DEPENDS:append:libc-musl = " libucontext"
> > > 
> > >   CFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_NO_X11=1', d)}"
> > > 
> > > -RDEPENDS:${PN}:class-target += "bash"
> > > +RDEPENDS:${PN}-common:class-target += "bash"
> > > +RDEPENDS:${PN}-common:class-nativesdk += "bash"
> > > 
> > >   EXTRA_OECONF:append:class-target = " --target-list=${@get_qemu_target_list(d)}"
> > >   EXTRA_OECONF:append:class-target:mipsarcho32 = "${@bb.utils.contains('BBEXTENDCURR', 'multilib', ' --disable-capstone', '', d)}"
> > > --
> > > 2.25.1
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

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184431): https://lists.openembedded.org/g/openembedded-core/message/184431
> Mute This Topic: https://lists.openembedded.org/mt/100054994/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

