Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q37Fy-0008An-Mq; Fri, 25 Mar 2011 14:40:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2PDccCf019465;
	Fri, 25 Mar 2011 13:38:38 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18582-06; Fri, 25 Mar 2011 13:38:34 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2PDcTgi019459
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 25 Mar 2011 13:38:30 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <AB78D48B-B478-47DF-A7CF-94FF96C313AC@dominion.thruhere.net>
References: <4D832AA4.1020701@matrix-vision.de>
	<AB78D48B-B478-47DF-A7CF-94FF96C313AC@dominion.thruhere.net>
Date: Fri, 25 Mar 2011 13:38:22 +0000
Message-ID: <1301060302.3018.129.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Michael Jones <michael.jones@matrix-vision.de>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: staging & using kernel headers
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
X-List-Received-Date: Fri, 25 Mar 2011 13:40:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-03-18 at 10:55 +0100, Koen Kooi wrote:
> CC:ing oe-core since we have kernel.bbclass patches there as well.
> 
> Op 18 mrt 2011, om 10:49 heeft Michael Jones het volgende geschreven:
> 
> > Hello Koen & co.,
> > 
> > I recently bumped into a problem with recipes ti-dmai and gstreamer-ti
> > when they included the kernel headers.  These headers were staged by
> > kernel.bbclass sysroot_stage_all_append() with a lot of manual copying
> > and manipulating links and such, rather than using 'oe_runmake
> > headers_install'.  Back in October Koen explained this
> > (http://article.gmane.org/gmane.comp.handhelds.openembedded/37772) is
> > because some recipes use private kernel API.  The result of this with my
> > 2.6.38 kernel
> 
> DMAI and gst-ti don't really work with anything newer than 2.6.32-psp, we're trying to get that addressed internally.
> 
> > is that I get a warning-turned-error from linux/types.h
> > that "Attempt to use kernel headers from user space".
> > 
> > ti-dmai_svn.bb hacks this (self-admittedly) by defining
> > _EXPORTED_HEADERS_ (commit d0184be13b4879e, also from Koen).  I had to
> > modify the recipe to enable the define to actually get passed as a
> > compile option.  For gstreamer-ti, there was no such hack in place, but
> > it was needed for the same reason.
> > 
> > I would think it is a common requirement for recipes to include kernel
> > headers, and this warning has been around since 2.6.32.  I got around it
> > with gstreamer-ti by installing the headers with headers_install into a
> > subdir of the headers directory set up currently by kernel.bbclass, and
> > pointing the gstreamer-ti recipe at that, but I'm not sure if there's a
> > better way.
> > 
> > If there are some recipes that need internal kernel sources staged for
> > them, then it seems to me that we need both sets of kernel headers: one
> > exported to userspace (with headers_install) and one that is not.
> > Right?  Can we agree on a standard place/manner for this?
> > 
> > Below is my patch to get gstreamer-ti working, for illustration.
> 
> I don't really have a better suggestion, apart from adding a var in e.g. bitbake.conf to point to the userspace stuff.
> 
> We might even do the reverse, stage the full set into
> $kernel_dir/private and the userspace ones in $kernel_dir, that would
> make it more clear which recipes need internal API.

Anything using internal kernel headers is effectively kernel module like
and should be using STAGING_DIR_KERNEL. There should be a complete set
of headers available there, particularly after recent improvemnents to
kernel.bbclass in oecore. Note that using kernel headers like this
effectively makes the package machine specific since the kernel is
machine specific.

Cheers,

Richard



