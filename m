Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S0JoP-0008Qa-Qf for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 22:33:22 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1MLP154001652
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 21:25:01 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32559-10 for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 21:24:57 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1MLOtjc001646
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 21:24:55 GMT
Message-ID: <1329945895.32110.21.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 22 Feb 2012 21:24:55 +0000
In-Reply-To: <4F450191.20609@opendreambox.org>
References: <1329910007-8441-1-git-send-email-obi@opendreambox.org>
	<1329917474.20261.142.camel@ted> <4F450191.20609@opendreambox.org>
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
X-List-Received-Date: Wed, 22 Feb 2012 21:33:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-02-22 at 15:54 +0100, Andreas Oberritter wrote:
> On 22.02.2012 14:31, Richard Purdie wrote:
> > On Wed, 2012-02-22 at 12:26 +0100, Andreas Oberritter wrote:
> >>  It also disables
> >> some preinst and postrm hooks, but they don't really hurt on existing
> >> images.
> > 
> > I'd suggest for these we modify them to only run if the appropriate
> > executables are present. If not present, then it won't hurt anything.
> 
> OK. The small downside is that those hooks can't run at rootfs creation
> time. Is there a "best practice" to check the existence of an executable
> in $PATH from such a hook?

"which xxx"?

> >>  I suppose there aren't many images using GNOME packages
> >> without x11. Any opinions?
> >>
> >> Is it OK to use the 'x11' flag for this purpose? Is anybody using
> >> GNOME with a different backend? Would it be better to introduce
> >> a 'gnome' (and 'gconf'?) distro feature flag?
> > 
> > I looked at these patches and my conclusion was no, the x11 flag is not
> > appropriate in this context.
> > 
> > Why? It would break gtk+ compiled against directfb for example. In the
> > future we'll likely have a similar issue if gtk+ is compiled against
> > something like wayland.
> 
> Gtk+ on directfb still built fine with these patches. Does it need
> hicolor-icon-theme to run? In this case, RDEPENDS should be added to
> gtk+, I guess. I don't see anything else possibly causing breakage.

I was thinking gtk+ would use the gnome classes too which upon
inspection it does not.

> Nevertheless, I understand that 'x11' isn't appropriate. The upside of
> using 'x11' was that it wouldn't break distributions, like new flags
> would do.

Paul has a patch out to help with this problem.

> > I also don't like "gnome" since you are using some gnome packages.
> > Specifically, you seem to want to avoid gtk and gconf. So all things
> > considered this needs a bit more discussion...
> 
> Actually, I don't really need gtk+ either, but I'd still like to make it
> available to our customers on the online feed.
> 
> To be more specific, I'd like to disable GNOME infrastructure, not
> necessarily all GNOME libraries. In other words, I'd like to keep those
> libs that, though being hosted on gnome.org as part of the GNOME
> project, don't depend on other GNOME (UI) libraries etc.). For example,
> I'd like to use gstreamer, which depends on libsoup and librsvg, without
> introducing unnecessary dependencies on gconf, gconf-native,
> gnome-common, hicolor-icon-theme and libgnome-keyring and all of their
> own dependencies.
> 
> So how about 'gconf' and 'gnome-ui' as new distro features? Actually I
> proposed 'gnome', because all modified bbclasses get inherited by
> gnome.bbclass.

What is really worrying me here is this is very specific to your
projects usecase. There will be others who'd expect gtk+ to be excluded
from "gnome-ui" for example. This is just the simplest case I can find
but there are other issues and we need generic code for oe-core.

I'm starting to wonder if these shouldn't be PACKAGECONFIG options for
the individual packages which you as a distro would then override the
defaults for.

You could also put some of these exclusions in your distro config. You
can check for recipes which inherit gnomebase
(bb.data.inherits("gnomebase", d)) and then run your skip package there
if the PN list doesn't match.

The main problem is I can't come up with a good flag that describes the
package set you want to exlcude, it really is rather custom to what
you're doing.

Cheers,

Richard





