Return-Path: <mfe@pengutronix.de>
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id 4577A7D259
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 12:34:51 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1hblPv-0005iJ-RW; Fri, 14 Jun 2019 14:34:51 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
	(envelope-from <mfe@pengutronix.de>)
	id 1hblPv-00084k-DD; Fri, 14 Jun 2019 14:34:51 +0200
Date: Fri, 14 Jun 2019 14:34:51 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: richard.purdie@linuxfoundation.org
Message-ID: <20190614123451.c5idgiizmqnlhob4@pengutronix.de>
References: <20190613175442.26121-1-m.felsch@pengutronix.de>
	<a7a06678f3346863015258fec2ed65e7d8065196.camel@linuxfoundation.org>
	<20190614120448.2wg2523qu67la7mh@pengutronix.de>
	<ee3249ee4f978ee2ee7c74b0af81fe971ca66300.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <ee3249ee4f978ee2ee7c74b0af81fe971ca66300.camel@linuxfoundation.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:25:16 up 27 days, 18:43, 51 users,  load average: 0.03, 0.05, 0.01
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Cc: kernel@pengutronix.de, openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Fri, 14 Jun 2019 12:34:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 19-06-14 13:11, richard.purdie@linuxfoundation.org wrote:
> On Fri, 2019-06-14 at 14:04 +0200, Marco Felsch wrote:
> > On 19-06-14 11:55, Richard Purdie wrote:
> > > On Thu, 2019-06-13 at 19:54 +0200, Marco Felsch wrote:
> > > > Most of the time we are compiling for embedded targets which have
> > > > dedicated hardware combinations. Enabling swrast by default isn't
> > > > a
> > > > good
> > > > solution for such devices because if the hardware render node has
> > > > an
> > > > issue or doesn't support a special format/request Mesa will
> > > > fallback
> > > > to
> > > > the software renderer. This will make it harder to debug
> > > > performance
> > > > issues.
> > > > 
> > > > A better way is to let the user decide if a software renderer is
> > > > needed e.g. if the system has no hardware renderer or to have
> > > > such a
> > > > fallback device. This way the user knows that the software
> > > > renderer
> > > > is
> > > > enabled.
> > > > 
> > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > ---
> > > > v3
> > > > - rebased on current master-next branch
> > > 
> > > I think this breaks the autobuilder:
> > > 
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/694
> > 
> > thanks for covering that. Why didn't I get a email?
> 
> The patchtest emails come from quick tests. This is a test of full
> builds on the autobuilder with batched together patches. The system has
> no real knowledge of which patch causes which failure so its a manual
> process. We don't have the infrastructure to run all patches through
> the full autobuilder tests individually.
> 
> >  Anyway thats
> > interessting. IMHO it isn't a good solution to rely on that fact that
> > the package have some 'random' default enabled drivers. Should we fix
> > the qemu configs or should I add:
> > 
> > PACKAGECONFIG_append_qemuall = " swrast"
> 
> The assumption is that swrast makes a good fallback and would be
> available in most cases.

No I don't think that it is a good fallback, following my patch
description. If you are on a embedded device you want the hw-renderer
and not the sw one. A good example: After I updated my kernel, my
hw-renderer wasn't available anymore and my application didn't start.
Thats a very good indication that something went bad. With the swrast
enabled I wouldn't see that immediately.

> I suspect qemuall might not fix beaglebone-yocto or some of the
> hardware BSPs.

As I discribed in the patch description if you want that fallback you
have to enable it. IMHO this is the better way instead of to be a
'smart' package.

> Its also assumed these packages are shared amongst multiple machines
> which may need different drivers.
> 
> I suspect this means the defaults should be on but I am happy to have
> more PACKAGECONFIG options to control things for people who want to
> customise/micro-optimise.

Optimising wasn't my main motivation. Avoiding 'random' performace
issues after a upgrade (kernel, mesa) was my main motivation. Do you get
me?

Regards,
  Marco

> Cheers,
> 
> Richard
> 
> 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

