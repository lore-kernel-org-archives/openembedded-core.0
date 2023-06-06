Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D2CC77B73
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 13:33:06 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.158.1686058376000558043
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jun 2023 06:32:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ha1Het4n;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686058373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zno9xgBUYKdijFuXNOXCZzLs5ZpovdLos9LSLhkG3wI=;
	b=ha1Het4n1/7BM2oI0IENzXbf6mz6ldsMltBlwPBSsrVJb496wGFmsJz4DrDjIwLuNBt1h6
	dosgLcRqo3mnodsMmOR+XKS4Uyqc/KQc79L8jj83DwQmvHAAES0eMd8zCO4zWgKHum6sqI
	KkHPTuOeAS3OTehK5uOeBdlyZqqdjEJjzR2yL08LPhKA24t5EYK/aaYNRnQBJFtKJQJBjL
	WqzBBKcr2SICk0cE5KWwTHGt9PEUraUgjI3VfsDBHMmHwyOoNrYTG/GIM4+S1gDLQbAP19
	kZBjMqYLBSWrgfY767CwEMatfMV4zAsLrA+hd1gUeaine+D3YO0WTGhja/61dg==
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0550C20004;
	Tue,  6 Jun 2023 13:32:52 +0000 (UTC)
Date: Tue, 6 Jun 2023 15:32:52 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] meta: introduce
 KCONFIG_CONFIG_ENABLE_MENUCONFIG
Message-ID: <20230606133252942651c1@mail.local>
References: <20230513160509.17634-1-liu.ming50@gmail.com>
 <CALatG=6D1zVnhUL3jhvJvdevt=QAowzaBNpJSdmE867EEfqCjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALatG=6D1zVnhUL3jhvJvdevt=QAowzaBNpJSdmE867EEfqCjg@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 13:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182438

On 06/06/2023 13:17:14+0200, Ming Liu wrote:
> Hi, Dear maintainers:
> 
> Ping, could you please review this at your convenient time? It's blocking
> our uboot do_menuconfig task.
> 

This is in my testing queue but other patches have proven difficult and
I didn't have any green builds since.

> the best,
> thank you
> 
> <liu.ming50@gmail.com> 於 2023年5月13日 週六 下午6:05寫道：
> 
> > From: Ming Liu <liu.ming50@gmail.com>
> >
> > Currently, uboot do_menuconfig task is breaking when UBOOT_CONFIG is
> > chosen rather than UBOOT_MACHINE, it simply fails with the following
> > errors:
> > | make: *** No rule to make target 'menuconfig'. Stio.
> > | Command failed.
> > | Press any key to continue...
> >
> > this is due to the work directory of do_menuconfig is set to ${B} but
> > not ${B}/$config.
> >
> > We should distinguish two situations:
> > 1) When there is only one config item in UBOOT_CONFIG, do_menuconfig
> >    should work just like how it works for UBOOT_MACHINE.
> > 2) When there are multiple config items in UBOOT_CONFIG, do_menuconfig
> >    should print out some information saying it's not supported other
> >    than just failing.
> >
> > This patch mainly aims to fix that by introducing a extra variable
> > KCONFIG_CONFIG_ENABLE_MENUCONFIG, it would be set to 'false' for
> > situation 2), and when it's set to 'true', then set
> > KCONFIG_CONFIG_ROOTDIR correctly in uboot-config.bbclass to let
> > do_menuconfig task work.
> >
> > DEVTOOL_DISABLE_MENUCONFIG could be replaced by this new variable
> > KCONFIG_CONFIG_ENABLE_MENUCONFIG.
> >
> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> > ---
> >  meta/classes-recipe/cml1.bbclass             | 5 +++++
> >  meta/classes-recipe/uboot-config.bbclass     | 6 ++++++
> >  meta/recipes-bsp/u-boot/u-boot-configure.inc | 1 -
> >  scripts/lib/devtool/standard.py              | 6 +++---
> >  4 files changed, 14 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/classes-recipe/cml1.bbclass
> > b/meta/classes-recipe/cml1.bbclass
> > index a09a042c3f..d87d8204e4 100644
> > --- a/meta/classes-recipe/cml1.bbclass
> > +++ b/meta/classes-recipe/cml1.bbclass
> > @@ -32,10 +32,15 @@ CROSS_CURSES_INC = '-DCURSES_LOC="<curses.h>"'
> >  TERMINFO = "${STAGING_DATADIR_NATIVE}/terminfo"
> >
> >  KCONFIG_CONFIG_COMMAND ??= "menuconfig"
> > +KCONFIG_CONFIG_ENABLE_MENUCONFIG ??= "true"
> >  KCONFIG_CONFIG_ROOTDIR ??= "${B}"
> >  python do_menuconfig() {
> >      import shutil
> >
> > +    if not
> > bb.utils.to_boolean(d.getVar("KCONFIG_CONFIG_ENABLE_MENUCONFIG")):
> > +        bb.fatal("do_menuconfig is disabled, please check
> > KCONFIG_CONFIG_ENABLE_MENUCONFIG variable.")
> > +        return
> > +
> >      config = os.path.join(d.getVar('KCONFIG_CONFIG_ROOTDIR'), ".config")
> >      configorig = os.path.join(d.getVar('KCONFIG_CONFIG_ROOTDIR'),
> > ".config.orig")
> >
> > diff --git a/meta/classes-recipe/uboot-config.bbclass
> > b/meta/classes-recipe/uboot-config.bbclass
> > index fb7a4bc498..9be1d64d3e 100644
> > --- a/meta/classes-recipe/uboot-config.bbclass
> > +++ b/meta/classes-recipe/uboot-config.bbclass
> > @@ -140,4 +140,10 @@ python () {
> >
> >              if not found:
> >                  raise bb.parse.SkipRecipe("The selected UBOOT_CONFIG key
> > %s has no match in %s." % (ubootconfig, ubootconfigflags.keys()))
> > +
> > +            if len(ubootconfig) == 1:
> > +                d.setVar('KCONFIG_CONFIG_ROOTDIR',
> > os.path.join(d.getVar("B"), d.getVar("UBOOT_MACHINE").strip()))
> > +            else:
> > +                # Disable menuconfig for multiple configs
> > +                d.setVar('KCONFIG_CONFIG_ENABLE_MENUCONFIG', "false")
> >  }
> > diff --git a/meta/recipes-bsp/u-boot/u-boot-configure.inc
> > b/meta/recipes-bsp/u-boot/u-boot-configure.inc
> > index 04e0894752..235623d25a 100644
> > --- a/meta/recipes-bsp/u-boot/u-boot-configure.inc
> > +++ b/meta/recipes-bsp/u-boot/u-boot-configure.inc
> > @@ -26,7 +26,6 @@ do_configure () {
> >              unset j
> >          done
> >          unset i
> > -        DEVTOOL_DISABLE_MENUCONFIG=true
> >      else
> >          if [ -n "${UBOOT_MACHINE}" ]; then
> >              oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE}
> > diff --git a/scripts/lib/devtool/standard.py
> > b/scripts/lib/devtool/standard.py
> > index 0339d12763..852672810a 100644
> > --- a/scripts/lib/devtool/standard.py
> > +++ b/scripts/lib/devtool/standard.py
> > @@ -968,9 +968,9 @@ def modify(args, config, basepath, workspace):
> >                          '}\n')
> >              if rd.getVarFlag('do_menuconfig','task'):
> >                  f.write('\ndo_configure:append() {\n'
> > -                '    if [ ! ${DEVTOOL_DISABLE_MENUCONFIG} ]; then\n'
> > -                '        cp ${B}/.config ${S}/.config.baseline\n'
> > -                '        ln -sfT ${B}/.config ${S}/.config.new\n'
> > +                '    if [ ${@
> > oe.types.boolean(\'${KCONFIG_CONFIG_ENABLE_MENUCONFIG}\') } = True ];
> > then\n'
> > +                '        cp ${KCONFIG_CONFIG_ROOTDIR}/.config
> > ${S}/.config.baseline\n'
> > +                '        ln -sfT ${KCONFIG_CONFIG_ROOTDIR}/.config
> > ${S}/.config.new\n'
> >                  '    fi\n'
> >                  '}\n')
> >              if initial_rev:
> > --
> > 2.25.1
> >
> >

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182425): https://lists.openembedded.org/g/openembedded-core/message/182425
> Mute This Topic: https://lists.openembedded.org/mt/98870753/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

