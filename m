Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SqAjg-0003Yh-CV
	for openembedded-core@lists.openembedded.org;
	Sun, 15 Jul 2012 00:22:48 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:41676 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SqAYn-00089Y-BR for openembedded-core@lists.openembedded.org;
	Sat, 14 Jul 2012 18:11:33 -0400
Date: Sat, 14 Jul 2012 18:11:29 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <5001EAB7.4080106@gmail.com>
Message-ID: <alpine.DEB.2.02.1207141804270.28153@oneiric>
References: <alpine.DEB.2.02.1207141456190.13961@oneiric>
	<CADkTA4Nah089oYXaHo3JDF_kmV-LQKz+hm8T6U9PBjtBvVDtxg@mail.gmail.com>
	<5001EAB7.4080106@gmail.com>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
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
Subject: Re: is "LINUX_VERSION" actually needed for a kernel checkout?
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
X-List-Received-Date: Sat, 14 Jul 2012 22:22:48 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sat, 14 Jul 2012, Khem Raj wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 7/14/2012 2:26 PM, Bruce Ashfield wrote:
> > On Sat, Jul 14, 2012 at 3:07 PM, Robert P. J. Day
> > <rpjday@crashcourse.ca> wrote:
> >>
> >> pawing my way through the kernel recipe file and checkout code so
> >> i understand it once and for all, and i'm curious about the
> >> setting of:
> >>
> >> LINUX_VERSION ?= "3.4.4"
> >>
> >> in linux-yocto_3.4.bb.
> >>
> >> for my example, i'm testing with straight oe-core and building
> >> for qemuarm, so i can see the following relevant lines from the
> >> kernel recipe file that will affect my kernel checkout:
> >>
> >> KBRANCH_qemuarm  = "standard/arm-versatile-926ejs"
> >> SRCREV_machine_qemuarm ?=
> >> "9aca8fec49787efbe44d0f137f31ee59edd94c49" SRCREV_meta ?=
> >> "a8cf77018b0faa0d29f1483ff4e5a2034dc8edd5"
> >>
> >> SRC_URI =
> >> "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
> >>
> >>
> >>
> LINUX_VERSION ?= "3.4.4"
> >>
> >> as i read the docs (and i could be totally off-base), the
> >> KBRANCH variable identifies the branch i want for my checkout,
> >> while the SRCREV_machine variable identifies the particular
> >> commit on that branch that i want (typically, it's a merge of
> >> standard/base into that branch).  and of course, SRCREV_meta is
> >> the state of the meta branch i want for further configuration.
> >>
> >> but at no time did i need to know the tagged kernel version that
> >> my machine branch was based on, did i?  so for the purposes of
> >> what happened above, i didn't *require* the value of
> >> LINUX_VERSION, did i?
> >>
> >> i can see that it will be handy in, say, creating meaningful
> >> directory names for building.  but beyond that, what else is it
> >> used for?  (i haven't got to the meta/ directory processing yet,
> >> so i have no idea whether it's suddenly necessary there.)
> >
> > The kernel itself doesn't care .. but the rest of the system does,
> > since that is used for setting PV.
> >
>
> I think we only have 1 recipe per release e.g. 3.2, 3.4 and so on so
> adding an additional minor is confusing there may be it can be avoided
> and when we say 3.4 it means 3.4 release branch of kernel.
>
> unless we plan to have it selectable for users to use 3.4.1 and 3.4.2
> it probably loses the significance

  ok, that nicely summarizes the puzzlement i was having with this.
in the example i was playing with (qemuarm), i could follow the git
commits back in june that represented (for the yocto linux 3.4
kernel),  the steps:

  * official 3.4.4 release
  * merge v3.4.4 into standard/base
  * merge standard/base into standard/arm-versatile-926ejs

and, sure, what we now had was a tree that was "based" on 3.4.4, but i
couldn't figure out why i should care about that level of precision.
as khem points out, what do you need beyond knowing that it's the
current version of the 3.4 kernel supported by yocto?

  on the other hand, i can see the local tarball created by the fetch
of that kernel source tree:

  git2_git.yoctoproject.org.linux-yocto-3.4.git.tar.gz

if you were being consistent, should that also have a "3.4.4" naming
convention?  it seems only fair, no?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


