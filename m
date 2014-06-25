Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by mail.openembedded.org (Postfix) with ESMTP id 5D8E860E07
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 00:53:12 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7P00JCK947IZ30@vms173023.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 24 Jun 2014 19:53:11 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 6F22F2054F; Tue,
	24 Jun 2014 20:52:55 -0400 (EDT)
Date: Tue, 24 Jun 2014 20:52:55 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-id: <20140625005255.GB1580@denix.org>
References: <1403218403-3303-1-git-send-email-denis@denix.org>
	<20140620171338.GX27324@denix.org>
MIME-version: 1.0
In-reply-to: <20140620171338.GX27324@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH 1/2] udev: update init script for conditional probing of platform bus
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
X-List-Received-Date: Wed, 25 Jun 2014 00:53:20 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Ping? Any comments? Any better suggestions?


On Fri, Jun 20, 2014 at 01:13:38PM -0400, Denys Dmytriyenko wrote:
> On Thu, Jun 19, 2014 at 06:53:22PM -0400, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Make probing of "platform" bus conditional based on PROBE_PLATFORM_BUS
> > variable from /etc/default/udev-cache on subsequent boots when udev
> > cache is used. PROBE_PLATFORM_BUS has to be set to "yes" in order to
> > force probing on every boot, otherwise it uses the old default behaviour
> > of probing it just the first time.
> > 
> > This is helpful on modern SoCs where most of the low level peripheral
> > drivers are registered on the platform bus and need to be probed to load
> > the necessary modules and enable the connected buses and subsystems.
> 
> Any questions, comments? I would like to keep a dialog open on this one. 
> Thanks.
> 
> 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  meta/recipes-core/udev/udev/init | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
> > index 410a650..f2c84d5 100644
> > --- a/meta/recipes-core/udev/udev/init
> > +++ b/meta/recipes-core/udev/udev/init
> > @@ -102,7 +102,12 @@ case "$1" in
> >  
> >      udevadm control --env=STARTUP=1
> >      if [ "$not_first_boot" != "" ];then
> > -            udevadm trigger --action=add --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics	 --subsystem-nomatch=backlight --subsystem-nomatch=video4linux	--subsystem-nomatch=platform
> > +            if [ "$PROBE_PLATFORM_BUS" != "yes" ]; then
> > +                PLATFORM_BUS_NOMATCH="--subsystem-nomatch=platform"
> > +            else
> > +                PLATFORM_BUS_NOMATCH=""
> > +            fi
> > +            udevadm trigger --action=add --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus --subsystem-nomatch=graphics --subsystem-nomatch=backlight --subsystem-nomatch=video4linux $PLATFORM_BUS_NOMATCH
> >              (udevadm settle --timeout=3; udevadm control --env=STARTUP=)&
> >      else
> >              udevadm trigger --action=add
> > -- 
> > 2.0.0
> > 
> > -- 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

