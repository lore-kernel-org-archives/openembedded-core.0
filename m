Received: from vms173021pub.verizon.net ([206.46.173.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SAry1-0002dY-QL
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 01:02:54 +0100
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M1B00MU491JHDT2@vms173021.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 18:53:43 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 1FC9F202A6; Thu,
	22 Mar 2012 19:53:42 -0400 (EDT)
Date: Thu, 22 Mar 2012 19:53:42 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-id: <20120322235342.GC13495@denix.org>
References: <CA+M6bXkMdv_bg9bDOYCS=Ng0sSB+2Yu6xRN4V0tKDV9RCJMy+A@mail.gmail.com>
	<1332458784.9740.371.camel@ted>
MIME-version: 1.0
In-reply-to: <1332458784.9740.371.camel@ted>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Consistency and use cases for IMAGE_FSTYPES
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
X-List-Received-Date: Fri, 23 Mar 2012 00:02:54 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Mar 22, 2012 at 11:26:24PM +0000, Richard Purdie wrote:
> On Fri, 2012-03-09 at 14:39 -0700, Tom Rini wrote:
> > Hey all,
> > 
> > Over in meta-ti I kicked off a discussion
> > (https://lists.yoctoproject.org/pipermail/meta-ti/2012-March/000779.html)
> > about if we should be using '?=' or '+=' with IMAGE_FSTYPES in the
> > machine conf files.  This has been discussed a little bit before
> > (http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/2060/focus=2061).
> >  The problem is we have the following and I believe ultimately
> > conflicting use cases:
> 
> I've been under the impression that we decided upon:
> 
> > - The machine needs to say 'I need or support the following formats'
> 
> so the machine starts and sets:
> 
> IMAGE_FSTYPES = "xxxx"
> 
> > - The distro needs to say 'I always want format X'
> 
> so the distro can do:
> 
> IMAGE_FSTYPES += " yyy"
> 
> > - The user needs to say 'I know best, give me only format X'
> 
> So the user can do:
> 
> IMAGE_FSTYPES = "X"

Richard,

Since local.conf gets parsed before machine.conf and distro.conf, the user 
needs to do this override:

IMAGE_FSTYPES_local = "X"

Otherwise machine.conf will always overwrite it with "xxxx" with its 
unconditional assignment.

-- 
Denys


> > - The user needs to say 'I know best, give me what you support + X'
> 
> IMAGE_FSTYPES += " X"
> 
> > We achieve this today, but not very nicely.  For the last one you need
> > to start playing order of operations games and that's just not nice.
> > My suggestion is that we need to change what the machine.conf sets to
> > another variable (SOMETHING_IMAGE_FSTYPES), and a default
> > IMAGE_FSTYPES becomes ?= ${SOMETHING_IMAGE_FSTYPES}.  Distros, and
> > users can then work more easily with their use cases.  Comments?
> 
> I think this is overcomplicating things. Yes the order is important but
> lets just document the above?


