Return-Path: <mfe@pengutronix.de>
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id A35857E7AA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 18:38:15 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1hbUc4-0001fO-3c; Thu, 13 Jun 2019 20:38:16 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
	(envelope-from <mfe@pengutronix.de>)
	id 1hbUc3-00042E-Om; Thu, 13 Jun 2019 20:38:15 +0200
Date: Thu, 13 Jun 2019 20:38:15 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20190613183815.mhc2w5mbpqqfb6va@pengutronix.de>
References: <20190613175442.26121-1-m.felsch@pengutronix.de>
	<CA+chaQcYku6dt_owA-OD2KAm5ZYqyhtFjnZ6EUAR8cRUJLY5Mw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQcYku6dt_owA-OD2KAm5ZYqyhtFjnZ6EUAR8cRUJLY5Mw@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 20:26:36 up 27 days, 44 min, 48 users,  load average: 0.24, 0.10,
	0.02
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Cc: kernel@pengutronix.de, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] mesa: make gallium swrast target optional
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Jun 2019 18:38:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Martin,

On 19-06-13 20:17, Martin Jansa wrote:
> Looks like nice cleanup, but is someone still using llvm 3.2 or older?

I don't know but I learned to avoid breaking changes.

> With PACKAGECONFIG for almost each gallium driver it might be easier to get
> rid
> of GALLIUMDRIVERS_LLVM33, GALLIUMDRIVERS_LLVM33_ENABLED, GALLIUMDRIVERS_LLVM
> variables and use just GALLIUMDRIVERS.

Sure that will increase readability and drops unneeded variables :) But
can we add a follow up patch to address this?

> In worst case scenario people using llvm 3.2 or older will need to redefine
> some of these PACKAGECONFIGs but that shouldn't be big issue considering
> that they probably have different mesa recipe already.

I'm not that deep inside LLVM just googled it and saw that the current
version is 8.0.1 so maybe you are right.

> People can then select right list of drivers with or without
> using gallium-llvm as well.

As I wrote above we should address this by a seperate patch to keep the
diff as small as possible :)

Regards,
  Marco

> 
> 
> On Thu, Jun 13, 2019 at 7:54 PM Marco Felsch <m.felsch@pengutronix.de>
> wrote:
> 
> > Most of the time we are compiling for embedded targets which have
> > dedicated hardware combinations. Enabling swrast by default isn't a good
> > solution for such devices because if the hardware render node has an
> > issue or doesn't support a special format/request Mesa will fallback to
> > the software renderer. This will make it harder to debug performance
> > issues.
> >
> > A better way is to let the user decide if a software renderer is
> > needed e.g. if the system has no hardware renderer or to have such a
> > fallback device. This way the user knows that the software renderer is
> > enabled.
> >
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> > v3
> > - rebased on current master-next branch
> >
> >  meta/recipes-graphics/mesa/mesa.inc | 22 +++++++++++++---------
> >  1 file changed, 13 insertions(+), 9 deletions(-)
> >
> > diff --git a/meta/recipes-graphics/mesa/mesa.inc
> > b/meta/recipes-graphics/mesa/mesa.inc
> > index 3ecfb8506c..a6d36cf21c 100644
> > --- a/meta/recipes-graphics/mesa/mesa.inc
> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > @@ -90,23 +90,27 @@ PACKAGECONFIG[egl] = "-Degl=true, -Degl=false"
> >
> >  PACKAGECONFIG[etnaviv] = ""
> >  PACKAGECONFIG[kmsro] = ""
> > +PACKAGECONFIG[swrast] = ""
> >
> > -GALLIUMDRIVERS = "swrast"
> > -GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'etnaviv',
> > ',etnaviv', '', d)}"
> > -GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'kmsro',
> > ',kmsro', '', d)}"
> > +GALLIUMDRIVERS = ""
> > +GALLIUMDRIVERS +="${@bb.utils.contains('PACKAGECONFIG', 'swrast',
> > 'swrast', '', d)}"
> > +GALLIUMDRIVERS +="${@bb.utils.contains('PACKAGECONFIG', 'etnaviv',
> > 'etnaviv', '', d)}"
> > +GALLIUMDRIVERS +="${@bb.utils.contains('PACKAGECONFIG', 'kmsro', 'kmsro',
> > '', d)}"
> >
> >  # radeonsi requires LLVM
> > -GALLIUMDRIVERS_LLVM33 = "${@bb.utils.contains('PACKAGECONFIG', 'r600',
> > ',radeonsi', '', d)}"
> > +GALLIUMDRIVERS_LLVM33 = "${@bb.utils.contains('PACKAGECONFIG', 'r600',
> > 'radeonsi', '', d)}"
> >  GALLIUMDRIVERS_LLVM33_ENABLED =
> > "${@oe.utils.version_less_or_equal('MESA_LLVM_RELEASE', '3.2', False,
> > len('${GALLIUMDRIVERS_LLVM33}') > 0, d)}"
> > -GALLIUMDRIVERS_LLVM = "r300,svga,nouveau${@',${GALLIUMDRIVERS_LLVM33}' if
> > ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
> > +GALLIUMDRIVERS_LLVM = "r300 svga nouveau ${@'${GALLIUMDRIVERS_LLVM33}' if
> > ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
> >
> >  PACKAGECONFIG[r600] = ""
> >
> > -GALLIUMDRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG',
> > 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
> > -GALLIUMDRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG', 'r600',
> > ',r600', '', d)}"
> > -GALLIUMDRIVERS_append = ",virgl"
> > +GALLIUMDRIVERS += "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm',
> > '${GALLIUMDRIVERS_LLVM}', '', d)}"
> > +GALLIUMDRIVERS += "${@bb.utils.contains('PACKAGECONFIG', 'r600', 'r600',
> > '', d)}"
> > +GALLIUMDRIVERS += "virgl"
> > +GALLIUMDRIVERS_MESON = "${@",".join("${GALLIUMDRIVERS}".split())}"
> > +
> > +PACKAGECONFIG[gallium] = "-Dgallium-drivers=${GALLIUMDRIVERS_MESON},
> > -Dgallium-drivers=''"
> >
> > -PACKAGECONFIG[gallium] = "-Dgallium-drivers=${GALLIUMDRIVERS},
> > -Dgallium-drivers=''"
> >  MESA_LLVM_RELEASE ?= "8.0.0"
> >  PACKAGECONFIG[gallium-llvm] = "-Dllvm=true -Dshared-llvm=true,
> > -Dllvm=false, llvm${MESA_LLVM_RELEASE} llvm-native \
> >                                 ${@'elfutils' if
> > ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
> > --
> > 2.20.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

