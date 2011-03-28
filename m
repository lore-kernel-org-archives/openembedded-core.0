Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q4Bo5-0002uc-HJ; Mon, 28 Mar 2011 14:44:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2SCgRW0028786;
	Mon, 28 Mar 2011 13:42:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28592-04; Mon, 28 Mar 2011 13:42:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2SCgJZF028780
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 28 Mar 2011 13:42:20 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D8CBCA4.2070603@matrix-vision.de>
References: <4D832AA4.1020701@matrix-vision.de>
	<AB78D48B-B478-47DF-A7CF-94FF96C313AC@dominion.thruhere.net>
	<1301060302.3018.129.camel@rex> <4D8CA329.10407@matrix-vision.de>
	<1301064949.3018.147.camel@rex>  <4D8CBCA4.2070603@matrix-vision.de>
Date: Mon, 28 Mar 2011 13:42:16 +0100
Message-ID: <1301316136.3018.189.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: koen@dominion.thruhere.net, Patches,
	layer <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] staging & using kernel headers
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
X-List-Received-Date: Mon, 28 Mar 2011 12:44:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-03-25 at 17:02 +0100, Michael Jones wrote:
> On 03/25/2011 03:55 PM, Richard Purdie wrote:
> > On Fri, 2011-03-25 at 15:14 +0100, Michael Jones wrote:
> > Ok, so you only really have the options of:
> > 
> > a) Use a specific patched kernel for linux-libc-headers which has these
> > headers in it (see below for why this is ugly)
> > b) Install some extra headers in "libc-headers-extras" type recipe
> > c) Ship default versions of the headers with your userspace and use
> > those if shared versions don't exist. This assumes the API is stable and
> > on its way to mainline.
> > 
> > I don't think this is as common a requirement as you think as most
> > people get this kind of thing merged into the mainline kernel to try and
> > reduce this kind of problem.
> 
> To clarify, it's not that I have a custom patched kernel I need to use.
>  I am following V4L2 development, so I am using a new kernel from those
> developers.  V4L2 changes do of course move upstream.

Ok, sorry, I was lacking context here.
 
> > The ugliness is where you have two different arm boards you want to
> > build, with a common optimisation/toolchain and each wants to redirect
> > linux-libc-headers to its own "special" version. The question is then,
> > why aren't the "special" bits in mainline.
> 
> OK, so here's what I'm realizing, please correct me if I'm wrong:
> What I did unconventionally (ie. wrong) was to use a kernel version
> newer than my linux-libc-headers were.  I should create a new
> linux-libc-headers recipe, as I had done with the kernel recipe, and
> build glibc and linux-libc-headers using my 2.6.38 kernel.

We should *always* be using linux-libc-headers >= to the kernel version
being used.

> I only stumbled upon this because the gstreamer-ti recipes were pointing
> at internal kernel headers, but because these are user-space apps, they
> should actually be using the linux-libc-headers.  Right?

Ideally, yes. I know under some circumstances, they might want to poke
into internal kernel headers but that is really a design issue that
needs fixing.

Cheers,

Richard



