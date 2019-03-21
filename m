Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 864AE7CDA7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 20:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4A7A640B37;
	Thu, 21 Mar 2019 20:35:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id CQNKwz2d05-p; Thu, 21 Mar 2019 20:35:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-81-231.washdc.fios.verizon.net
	[100.15.81.231])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2A93C40ADE;
	Thu, 21 Mar 2019 20:35:30 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7FAAB16D02E; Thu, 21 Mar 2019 16:35:29 -0400 (EDT)
Date: Thu, 21 Mar 2019 16:35:29 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: richard.purdie@linuxfoundation.org
Message-ID: <20190321203529.GB16294@denix.org>
References: <20190311031230.21497-1-richard.purdie@linuxfoundation.org>
	<20190320002240.GF11946@denix.org>
	<fd87289ca64fd8c35bcb2b70ea7cbf78cce8e131.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <fd87289ca64fd8c35bcb2b70ea7cbf78cce8e131.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] qemuarm: Swap for an arm7ve (A15) configuration
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
X-List-Received-Date: Thu, 21 Mar 2019 20:35:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 20, 2019 at 12:25:02AM +0000, richard.purdie@linuxfoundation.org wrote:
> On Tue, 2019-03-19 at 20:22 -0400, Denys Dmytriyenko wrote:
> > On Mon, Mar 11, 2019 at 03:12:26AM +0000, Richard Purdie wrote:
> > > From: Jon Mason <jdmason@kudzu.us>
> > > 
> > > Add new QEMU BSP for a Arm Cortex-A15 system and use this as
> > > qemuarm,
> > > moving the old armv5te Versatile PB based machine to qemuarmv5.
> > > 
> > > The new machine uses the QEMU virt machine type, which should be
> > > faster to emulate and updates the qemuarm support to a modern
> > > architecture.
> > > 
> > > Signed-off-by: Jon Mason <jdmason@kudzu.us>
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > >  meta/conf/machine/qemuarm.conf                | 34 +++++++++++++
> > > ------
> > >  meta/conf/machine/qemuarmv5.conf              | 23 +++++++++++++
> > >  .../linux/linux-yocto-rt_4.19.bb              |  2 +-
> > >  .../linux/linux-yocto-rt_5.0.bb               |  2 +-
> > >  .../linux/linux-yocto-tiny_4.19.bb            |  2 +-
> > >  .../linux/linux-yocto-tiny_5.0.bb             |  2 +-
> > >  meta/recipes-kernel/linux/linux-yocto_4.19.bb |  2 +-
> > >  meta/recipes-kernel/linux/linux-yocto_5.0.bb  |  2 +-
> > >  8 files changed, 52 insertions(+), 17 deletions(-)
> > >  create mode 100644 meta/conf/machine/qemuarmv5.conf
> > > 
> > > diff --git a/meta/conf/machine/qemuarm.conf
> > > b/meta/conf/machine/qemuarm.conf
> > > index a5443126273..95550461899 100644
> > > --- a/meta/conf/machine/qemuarm.conf
> > > +++ b/meta/conf/machine/qemuarm.conf
> > ...
> > > +KMACHINE_qemuarmv5 = "qemuarm"
> > > \ No newline at end of file
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> > > b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> > > index 07dc5b77a14..36761b99437 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> > > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> > > @@ -31,7 +31,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
> > >  
> > >  LINUX_KERNEL_TYPE = "preempt-rt"
> > >  
> > > -COMPATIBLE_MACHINE = "(qemux86|qemux86-
> > > 64|qemuarm|qemuarm64|qemuppc|qemumips)"
> > > +COMPATIBLE_MACHINE = "(qemux86|qemux86-
> > > 64|qemuarm|qemuarma15|qemuarm64|qemuppc|qemumips)"
> > 
> > Did you mean to list here "qemuarmv5" instead of "qemuarma15"?
> 
> Yes!
> 
> > > @@ -40,7 +40,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
> > >  
> > >  KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
> > >  
> > > -COMPATIBLE_MACHINE =
> > > "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
> > > +COMPATIBLE_MACHINE =
> > > "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qe
> > > mux86-64"
> > 
> > Ok, "qemuarmv5" - I see a pattern here! Was it a challenge? :)
> 
> It definitely was a challenge, perhaps not the way you mean it though!
> :)
> 
> Patches to fix up the mess I made of this gratefully received, or I'll
> sort it out tomorrow, thanks for highlighting it.

Submitted a patch last night:
http://lists.openembedded.org/pipermail/openembedded-core/2019-March/280345.html

Not sure if you got to it sooner and fixed it yourself (don't see it in git 
yet). Either way is fine. Let me know if you need anything else. Thanks.

-- 
Denys

