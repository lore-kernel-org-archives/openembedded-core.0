Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 06A0173B41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 07:52:27 +0000 (UTC)
Received: from [99.240.204.5] (port=46438 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1YVxuw-00071Z-LT; Thu, 12 Mar 2015 03:52:30 -0400
Date: Thu, 12 Mar 2015 03:52:24 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1426096622.9114.48.camel@linuxfoundation.org>
Message-ID: <alpine.LFD.2.11.1503120340500.12180@localhost>
References: <alpine.LFD.2.11.1503111228420.5897@localhost>
	<550079EA.7030500@windriver.com>
	<1426096622.9114.48.camel@linuxfoundation.org>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: openembedded-core@lists.openembedded.org
Subject: Re: how many ways to delete/de-activate a recipe's task?
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
X-List-Received-Date: Thu, 12 Mar 2015 07:52:29 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 11 Mar 2015, Richard Purdie wrote:

> On Wed, 2015-03-11 at 12:22 -0500, Mark Hatle wrote:
> > On 3/11/15 11:30 AM, Robert P. J. Day wrote:
> > >
> > >   i recall that richard purdie might have explained this once but i
> > > have no idea where that post is and i need to add something to it,
> > > anyway ... how many ways are there to "delete" a task from a recipe,
> > > and what are the differences?
> > >
> > >   so far, i've seen:
> > >
> > > 1) bitbake supports a "deltask" directive
> >
> > The task and all it's dependencies go away.  So anything dependent on it and the
> > things it depends on, are no longer dependent.
> >
> > > 2) you can use the [noexec] task flag
> >
> > The task and it's dependencies remain, but nothing is executed.
> >
> > > 3) i've also seen redefining the task with a no-op ":" command
> >
> > The task is executed and does nothing.  (I believe this dumps a stamp file and
> > the noexec does not.. but I may be wrong.)
>
> What Mark said. 3) is the old way of doing 2), we added 2) to make
> it more efficient since there is no task execution overhead (which
> at one point was measurable, it may be less so now).

  so that first part -- that 2) is a newer, tidier(?) way of doing 3)
-- is pretty much what i remember from once upon a time. good.

  as for 1), i'm still confused by that explanation. say we have the
dependency chain A -> B -> C ... A depends on B which depends on C. if
i "deltask B", then any dependency links which involve B will
disappear, both incoming and outgoing in the DAG. but will A be
adjusted to now depend on C? (i'm guessing not, just want to be sure.)

  finally, is it just a matter of personal taste whether one deletes a
task using "deltask" or uses [noexec]? i'm looking at examples under
OE and here are a couple.

  clearly, for image.bbclass, there are a *pile* of tasks that are not
relevant, so the following makes sense:

meta/classes/image.bbclass:do_fetch[noexec] = "1"
meta/classes/image.bbclass:do_unpack[noexec] = "1"
meta/classes/image.bbclass:do_patch[noexec] = "1"
meta/classes/image.bbclass:do_configure[noexec] = "1"
meta/classes/image.bbclass:do_compile[noexec] = "1"
meta/classes/image.bbclass:do_install[noexec] = "1"
meta/classes/image.bbclass:do_populate_sysroot[noexec] = "1"
meta/classes/image.bbclass:do_package[noexec] = "1"
meta/classes/image.bbclass:do_package_qa[noexec] = "1"
meta/classes/image.bbclass:do_packagedata[noexec] = "1"
meta/classes/image.bbclass:do_package_write_ipk[noexec] = "1"
meta/classes/image.bbclass:do_package_write_deb[noexec] = "1"
meta/classes/image.bbclass:do_package_write_rpm[noexec] = "1"
meta/classes/image.bbclass:do_bundle_initramfs[noexec] = "1"

  similarly, for native.bbclass, the following also makes sense, but
uses "deltask":

meta/classes/native.bbclass:deltask package
meta/classes/native.bbclass:deltask packagedata
meta/classes/native.bbclass:deltask package_qa
meta/classes/native.bbclass:deltask package_write_ipk
meta/classes/native.bbclass:deltask package_write_deb
meta/classes/native.bbclass:deltask package_write_rpm
meta/classes/native.bbclass:deltask package_write

  so why does the first use [noexec] and the second use deltask? is
there a functional difference?

rday

p.s. i believe i appreciate the difference in *mechanics* of the
above. [noexec] doesn't affect the DAG of task dependencies, it simply
turns off the execution of that recipe-specific task, while "deltask"
affects the actual underlying task DAG.

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

