Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S0CQ1-0001AX-D7 for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 14:39:41 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1MDVMS5028481
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 13:31:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27266-10 for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 13:31:17 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1MDVFSS028475
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 13:31:15 GMT
Message-ID: <1329917474.20261.142.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 22 Feb 2012 13:31:14 +0000
In-Reply-To: <1329910007-8441-1-git-send-email-obi@opendreambox.org>
References: <1329910007-8441-1-git-send-email-obi@opendreambox.org>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC][PATCH 0/5] drop dependency on GNOME if x11 is disabled
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
X-List-Received-Date: Wed, 22 Feb 2012 13:39:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-02-22 at 12:26 +0100, Andreas Oberritter wrote:
> I'd like to stop various GNOME packages from being built in a
> distro which doesn't use x11. For me, this fixes many unwanted
> dependencies, e.g. librsvg -> gconf -> polkit -> systemd -> udev-systemd
> on a system with an old kernel (2.6.18), which cannot use a recent
> udev. Of course, it saves some build time, too.

That dependency doesn't exist in OE-Core FWIW.

> I guess, additional PR bumps for all users of gconf, gnomebase and
> gtk-icon-cache bbclasses are required in order to pick up this change,
> right?

This is one of the few cases I'm tempted to say no, its not required.

>  Does someone already have a script to automatically generate
> a list of affected recipes? Is the PR bump required, considering that
> this change mainly reduces build-time dependencies?

The plan is to rely on sstate's hash changes and the OEBasicHash
signature generator for this in future.

>  It also disables
> some preinst and postrm hooks, but they don't really hurt on existing
> images.

I'd suggest for these we modify them to only run if the appropriate
executables are present. If not present, then it won't hurt anything.

>  I suppose there aren't many images using GNOME packages
> without x11. Any opinions?
> 
> Is it OK to use the 'x11' flag for this purpose? Is anybody using
> GNOME with a different backend? Would it be better to introduce
> a 'gnome' (and 'gconf'?) distro feature flag?

I looked at these patches and my conclusion was no, the x11 flag is not
appropriate in this context.

Why? It would break gtk+ compiled against directfb for example. In the
future we'll likely have a similar issue if gtk+ is compiled against
something like wayland.

I also don't like "gnome" since you are using some gnome packages.
Specifically, you seem to want to avoid gtk and gconf. So all things
considered this needs a bit more discussion...

Cheers,

Richard



