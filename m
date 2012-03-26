Received: from vms173021pub.verizon.net ([206.46.173.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SCFms-0005MC-Gw
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 21:41:06 +0200
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M1I002SVBL2JQO0@vms173021.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 14:31:50 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id E18FA201CB; Mon,
	26 Mar 2012 15:31:49 -0400 (EDT)
Date: Mon, 26 Mar 2012 15:31:49 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-id: <20120326193149.GA3368@denix.org>
References: <1332524132-24689-1-git-send-email-trini@ti.com>
	<1332753313.28414.91.camel@ted> <20120326162531.GD21518@bill-the-cat>
	<1332780976.28414.130.camel@ted> <20120326171359.GE21518@bill-the-cat>
MIME-version: 1.0
In-reply-to: <20120326171359.GE21518@bill-the-cat>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] qemu.inc: Use '=' for IMAGE_FSTYPES
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
X-List-Received-Date: Mon, 26 Mar 2012 19:41:06 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Mar 26, 2012 at 10:13:59AM -0700, Tom Rini wrote:
> On Mon, Mar 26, 2012 at 05:56:16PM +0100, Richard Purdie wrote:
> > On Mon, 2012-03-26 at 09:25 -0700, Tom Rini wrote:
> > > On Mon, Mar 26, 2012 at 10:15:13AM +0100, Richard Purdie wrote:
> > > > On Fri, 2012-03-23 at 10:35 -0700, Tom Rini wrote:
> > > > > As per
> > > > > http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/019772.html
> > > > > a machine conf file should use '=' to set IMAGE_FSTYPES.
> > > > > 
> > > > > Signed-off-by: Tom Rini <trini@ti.com>
> > > > > ---
> > > > >  meta/conf/machine/include/qemu.inc |    2 +-
> > > > >  1 files changed, 1 insertions(+), 1 deletions(-)
> > > > 
> > > > As someone pointed out, what I mentioned in that email sadly doesn't
> > > > work although it would be nice if they did. I suspect this is why we're
> > > > using += since:
> > > 
> > > We aren't using += today.  We (openembedded-core) use ?=.  meta-intel
> > > uses += and meta-ti is mixed (and I don't have meta-fsl-* handy).
> > > 
> > > > > - The machine needs to say 'I need or support the following formats'
> > > > 
> > > > so the machine ensures those formats exist at a minimum:
> > > > 
> > > > IMAGE_FSTYPES += "xxxx"
> > > > 
> > > > > - The distro needs to say 'I always want format X'
> > > > 
> > > > so the distro can do:
> > > > 
> > > > IMAGE_FSTYPES += " yyy"
> > > > 
> > > > > - The user needs to say 'I know best, give me only format X'
> > > > 
> > > > This one is the problem case so the user has to use overrides:
> > > > 
> > > > IMAGE_FSTYPES_override = "X"
> > > > 
> > > > (where override can be MACHINE or forcevariable)
> > > > 
> > > > > - The user needs to say 'I know best, give me what you support + X'
> > > > 
> > > > IMAGE_FSTYPES += " X"
> > > > 
> > > > 
> > > > Whilst I think that is less than ideal since it forces use of overrides
> > > > in local.conf to override, changing the += in machine conf files doesn't
> > > > gain us much, it just breaks += in local.conf.
> > > > 
> > > > I'm open to other feedback though...
> > > 
> > > Well, I suggested ??= / ?= and posted some results from bitbake -e...
> > 
> > Ok. += plays out as above. I realise its not what is in qemu.inc, it is
> > used in meta-intel though which I looked at after qemu.inc and I guess
> > has confused me.
> > 
> > With ?= in machine.conf:
> > 
> > The user defined IMAGE_FSTYPES would override the machine ones. Distro
> > can still append to it. The downside is a user append would not work out
> > as expected.
> > 
> > So the question is which is the more user expected behaviour?
> > 
> > =+ makes overwriting IMAGE_FSTYPES hard
> > 
> > ?= makes appending IMAGE_FSTYPES hard
> > 
> > I suspect a user is more likely to want to append than overwrite.
> > Getting an append to work with ?= is extremely non-obvious, even worse
> > syntax than the =+ overwriting case with overrides.
> > 
> > So bottom line, I'm tempted to recommend we use =+.
> 
> I think for the upcoming release, =+ is good enough and we can talk
> about adding further variables after if it's still too complicated.  So,
> now where's the repo that documenting these examples should go in?

So, did we come full circle on this? :) Started here:
https://lists.yoctoproject.org/pipermail/meta-ti/2012-March/000779.html

I'm fine changing it for meta-ti, if we agree on a unified solution. Having an 
EXTRA/MACHINE var for that in the future might simplify things...

-- 
Denys


