Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SC7pn-0001EB-LP for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 13:11:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2QB2aLI024544
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 12:02:36 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17410-09 for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 12:02:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2QB2Tog024537
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 12:02:30 +0100
Message-ID: <1332759748.28414.105.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 26 Mar 2012 12:02:28 +0100
In-Reply-To: <20120326092613.GA3941@jama.jama.net>
References: <1332618407-30816-1-git-send-email-obi@opendreambox.org>
	<20120326092613.GA3941@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] busybox: move watch to /usr/bin for compatibility with procps
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Mar 2012 11:11:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-03-26 at 11:26 +0200, Martin Jansa wrote:
> On Sat, Mar 24, 2012 at 08:46:47PM +0100, Andreas Oberritter wrote:
> > Commit 68dc2a3fa30c03a196d650de34d0c657a7b85454 broke opkg upgrade:
> > 
> > | update-alternatives: Error: cannot register alternative watch to
> > | /usr/bin/watch since it is already registered to /bin/watch
> > 
> > Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> > ---
> > * Martin, can you please verify whether this really helps? I've built a
> >   rootfs with both busybox watch and procps installed. I didn't actually
> >   do an opkg upgrade.
> 
> Maybe it does for 2nd and later upgrades, but for some reason I now get
> the same error from busybox upgrade too, probably because old u-a for
> watch is removed only in busybox's prerm and not during upgrade.
> 
> SHR root@Nokia-N900 / $ ll /usr/bin/watch*
> lrwxrwxrwx 1 root root   17 Mar 26 09:13 /usr/bin/watch ->
> ../../bin/busybox
> -r-xr-xr-x 1 root root 9508 Mar 26 08:48 /usr/bin/watch.procps
> SHR root@Nokia-N900 / $ ls -l /bin/watch
> lrwxrwxrwx 1 root root 7 Mar 23 16:06 /bin/watch -> busybox
> 
> SHR root@Nokia-N900 / $ cat /etc/busybox.links  | grep watch
> /usr/bin/watch
> SHR root@Nokia-N900 / $ cat /var/lib/opkg/alternatives/watch
> /bin/watch
> busybox 50
> 
> And also busybox is upgraded after procps so even with old alternative
> removed it would take 2 opkg upgrades to get it sorted.. but that's
> quite common issue :/. e.g. u-a for runlevel causes many postinst issues
> because update-rc.d assumes that runlevel is available during upgrade,
> but if sysvinit (as runlevel provider) is configured after e.g. dbus you
> get:
> 
> Configuring dbus-1.
> Cannot create link over existing -/etc/resolv.conf-.
> /usr/sbin/update-rc.d: line 173: runlevel: not found
> Unable to determine current runlevel
> ...
> Configuring busybox-syslog.
> update-alternatives: Linking //etc/init.d/syslog to syslog.busybox
> update-alternatives: Linking //etc/syslog-startup.conf to syslog-startup.conf.busybox
> /usr/sbin/update-rc.d: line 173: runlevel: not found
> Unable to determine current runlevel
> ...
> Configuring busybox-udhcpc.
> /usr/sbin/update-rc.d: line 173: runlevel: not found
> Unable to determine current runlevel
> ...
> Configuring sysvinit.
> update-alternatives: Linking //bin/mountpoint to mountpoint.sysvinit
> update-alternatives: Linking //sbin/halt to halt.sysvinit
> update-alternatives: Linking //sbin/reboot to reboot.sysvinit
> update-alternatives: Linking //sbin/runlevel to runlevel.sysvinit
> update-alternatives: Linking //sbin/shutdown to shutdown.sysvinit
> update-alternatives: Linking //sbin/poweroff to poweroff.sysvinit
> update-alternatives: Linking //usr/bin/last to last.sysvinit
> update-alternatives: Linking //usr/bin/mesg to mesg.sysvinit
> update-alternatives: Linking //usr/bin/wall to wall.sysvinit
> update-alternatives: Linking //sbin/init to /sbin/init.sysvinit
> 
> And dbus-1. busybox-syslog. busybox-udhcpc. postinsts are fine on 2nd run.
> 
> So this patch looks good, but there are still issues with u-a calls in postinst.

I'll merge the patch but we should probably open a bug about these u-a
issues so we can properly fix it at some point.

Cheers,

Richard



