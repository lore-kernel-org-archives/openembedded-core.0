Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UW1eB-0003tu-S4 for openembedded-core@lists.openembedded.org;
	Sat, 27 Apr 2013 11:42:25 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UW1N1-0007Y9-Qu; Sat, 27 Apr 2013 11:24:39 +0200
Message-ID: <1367054670.25055.7.camel@pb-ThinkPad-R50e>
From: Phil Blundell <pb@pbcl.net>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Sat, 27 Apr 2013 10:24:30 +0100
In-Reply-To: <6907890.oTRpLvAECS@helios>
References: <1366975838.14512.99.camel@phil-desktop.brightsign>
	<6907890.oTRpLvAECS@helios>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image.bbclass: Don't mark do_rootfs and do_build as nostamp
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 27 Apr 2013 09:42:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2013-04-27 at 09:34 +0100, Paul Eggleton wrote:
> On Friday 26 April 2013 12:30:38 Phil Blundell wrote:
> > -do_rootfs[nostamp] = "1"
> >  do_rootfs[dirs] = "${TOPDIR} ${WORKDIR}/intercept_scripts"
> >  do_rootfs[lockfiles] += "${IMAGE_ROOTFS}.lock"
> >  do_rootfs[cleandirs] += "${S} ${WORKDIR}/intercept_scripts"
> > -do_build[nostamp] = "1"
>
> I have to say I'm not in favour of this. AFAIK these tasks have always been 
> nostamp, and I'm not sure making do_build is going to help for the case you 
> cite because the dependency on INITRD_IMAGE is on do_rootfs.

You're right that they've always been this way but that alone doesn't
seem like a convincing argument for keeping it so.  I think the original
reason they were nostamp is that bitbake didn't originally have enough
dependency tracking to work out when the rootfs did actually need to be
regenerated, and the only choices were "always" or "never".  Nowadays I
don't think there are any situations where you'd want the rootfs to
rebuild that won't already be detected by the task dependency logic.

I've had this change in my tree for at least six months or so and I've
certainly never noticed any failure to rebuild the rootfs when I would
have wanted it to.  What's the specific scenario you're concerned about?

> If you're concerned about your initramfs image rebuilding when building the 
> main image, what happens if you specify do_rootfs[nostamp] = "0" ?

That probably would work, yeah.

p.




