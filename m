Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Slk79-00057B-CA
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 19:08:43 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:53577 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SljwV-0002wk-UG for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 12:57:44 -0400
Date: Mon, 2 Jul 2012 12:57:39 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CABcZANkvCek+Zg82a1aQK1XA1_jPB6EgrUEzqF8aOJYW0OLXaw@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1207021253400.25384@oneiric>
References: <alpine.DEB.2.02.1207020939420.22071@oneiric>
	<CABcZANkvCek+Zg82a1aQK1XA1_jPB6EgrUEzqF8aOJYW0OLXaw@mail.gmail.com>
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
Subject: Re: can i use bitbake to run an arbitrary python routine in a class file?
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
X-List-Received-Date: Mon, 02 Jul 2012 17:08:43 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 2 Jul 2012, Chris Larson wrote:

> On Mon, Jul 2, 2012 at 6:40 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >   i'm not even remotely a python expert (working on that, though) so
> > there may be a trivial and documented answer to this -- can i use
> > bitbake to run an arbitrary python routine to see what the output
> > would be?
> >
> >   for example, here's qemu.bbclass:
> >
> > def qemu_target_binary(data):
> >         import bb
> >
> >         target_arch = data.getVar("TARGET_ARCH", True)
> >         if target_arch in ("i486", "i586", "i686"):
> >                 target_arch = "i386"
> >         elif target_arch == "powerpc":
> >                 target_arch = "ppc"
> >
> >         return "qemu-" + target_arch
> >
> > what if i wanted to see what that would return given a current build?
> > can i do that?  does that question even make sense?

... snip ...

> Alternatively, just do:
>
> FOO = "${@qemu_target_binary(d)}"
>
> And then: bitbake -e | grep \^FOO=

  i tried this with a "qemux86" MACHINE selection and got:

# expansion of FOO threw ExpansionError: Failure expanding variable
FOO, expression was ${@qemu_target_binary(d)} which triggered
exception NameError: name 'qemu_target_binary' is not defined

that seemed a bit weird since i was just assuming a qemu-based build
would automatically inherit that class file.  so i added:

INHERIT += "qemu"

to my local.conf and that fixed it.  i was a bit surprised that that
class file wasn't part of a qemu build.  the only class file that
inherits it:

meta/classes/libc-package.bbclass:inherit qemu

  i'm just surprised i picked what looked like a good test case, and
it turned out to not work the way i thought.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


