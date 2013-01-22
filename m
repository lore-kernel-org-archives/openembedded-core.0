Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Txmai-0004Gd-As for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 23:45:18 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0MMXaCk020135; Tue, 22 Jan 2013 22:33:36 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5UH9Sy2JyMzG; Tue, 22 Jan 2013 22:33:36 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0MMXUbp020127
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 22 Jan 2013 22:33:33 GMT
Message-ID: <1358893764.6356.28.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ciprian Ciubotariu <cheepeero@gmx.net>
Date: Tue, 22 Jan 2013 22:29:24 +0000
In-Reply-To: <2738897.RqdcWyXQgT@pink>
References: <cover.1358635193.git.ross.burton@intel.com>
	<1358739008.2945.29.camel@jethro.cheepee.homedns.org>
	<CAJTo0LarPUYHTJBWqi3ze3=aN5+HvizyVvw3V-V+YmxtS4786g@mail.gmail.com>
	<2738897.RqdcWyXQgT@pink>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/10] Initial systemd integration
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
X-List-Received-Date: Tue, 22 Jan 2013 22:45:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-01-23 at 00:04 +0200, Ciprian Ciubotariu wrote:
> On Monday 21 January 2013 12:12:14 Burton, Ross wrote:
> > On 21 January 2013 03:30, Ciprian Ciubotariu <cheepeero@gmx.net> wrote:
> > > However, with oe-core/meta providing a default embedded policy, higher
> > > layers need to remove sysvinit or systemd stuff from base recipes, which
> > > is
> > > against bitbake's additive language design (only append/prepend functions,
> > > no -= operator) and against separating concerns.
> > 
> > If you don't do a systemd build, you won't get any of the systemd
> > files.  Ditto, sysvinit (well, that's the goal - as it was an
> > assumption until now that needs work still).
> > 
> 
> Does that mean that I can disable the default init manager somehow, and 
> provide my own?

Its always been possible to provide your own init manager. The initramfs
filesystems do this, as does poky-tiny, you simply provide your own init
system dependencies and pull them in instead of sysvinit or systemd.

On more complex images, init systems are a little more complex than that
though.

> > An oe-core without *any* init system will be very cumbersome - every
> > service will need a bbappend to actually work, with the subsequent
> > maintenance costs.
> > 
> 
> I fail to see the overhead of maintaining a feature in one file, and the init-
> manager part of the same feature in another file. The actual complexity is the 
> same as when adding an use-flag like configuration variable in a single-file 
> recipe; perhaps one avoids hitting "Open..." on the editor.
> 
> However, if I understand correctly, one can disable the default OE policy for 
> an init manager, though not by choice of different layers, but via having 
> systemd or not in DISTRO_FEATURES. 
> 
> Does this means that 
> 
> - having DISTRO_FEATURES += "systemd" we get a system with systemd;
> - DISTRO_FEATURES += "sysvinit" makes a system with sysvinit, and 
> - leaving DISTRO_FEATURES blank leaves us with a system with no init manager, 
> to which we can add our own?

Those flags control the way some recipes build. Those recipes have
source code which does different things depending on whether sysvinit or
systemd is configured. This is not our code, its upstream. You can
control the way any package builds using the usual overrides mechanism.
The system is about as configurable and customisable as you can get.

> I guess the most important aspect I am trying to communicate is: please do not 
> provide any by default.

By default users expect the system to boot and to work. They don't
expect to have to add in layers just to get the system to initialise. We
need to support a sensible core offering of init features. We support
minimal configurations like tiny and the initramfs scripts, we now also
support a choice between systemd and clasic sysvinit. This doesn't mean
you have to use them, you're free to override and configure the system
as you wish, as you have always been able to do.

The request for no default simply does not make any sense. The fact we
have a default doesn't stop you adding your own (as the meta-systemd
layer has demonstrated).

Cheers,

Richard




