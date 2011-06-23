Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QZpwF-0005qw-B5 for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 21:51:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5NJm53h022450;
	Thu, 23 Jun 2011 20:48:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22095-06; Thu, 23 Jun 2011 20:48:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5NJlumv022444
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 23 Jun 2011 20:47:57 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E036F1C.1080609@mentor.com>
References: <4E0286CD.50700@mentor.com> <1308842954.20015.126.camel@rex>
	<4E036696.1010905@mentor.com>  <4E036F1C.1080609@mentor.com>
Date: Thu, 23 Jun 2011 20:47:54 +0100
Message-ID: <1308858474.20015.141.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: sstate skips STAGING_DIR_KERNEL?
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
X-List-Received-Date: Thu, 23 Jun 2011 19:51:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-23 at 09:51 -0700, Tom Rini wrote:
> On 06/23/2011 09:15 AM, Tom Rini wrote:
> > On 06/23/2011 08:29 AM, Richard Purdie wrote:
> >> On Wed, 2011-06-22 at 17:20 -0700, Tom Rini wrote:
> >>> As part of looking into the problem I had that I just posted a patch for
> >>> I was going "why isn't -c clean (or cleanall or cleansstate) knocking
> >>> out STAGING_DIR_KERNEL contents?  Answer, sstate is totally skipping
> >>> that out.  Is there some variable we need to be setting somewhere to add
> >>> this in?  Or are we going to have to take in the various bits of OE.dev
> >>> kernel.bbclass instead here?
> >>
> >> I think there is a bug in kernel.bbclass. This should fix it:
> >>
> >> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> >> index aaf341b..9f09107 100644
> >> --- a/meta/classes/kernel.bbclass
> >> +++ b/meta/classes/kernel.bbclass
> >> @@ -119,7 +119,7 @@ kernel_do_install() {
> >>         # Support for external module building - create a minimal copy of the
> >>         # kernel source tree.
> >>         #
> >> -       kerneldir=${STAGING_KERNEL_DIR}
> >> +       kerneldir=${D}/kernel
> >>         install -d $kerneldir
> >>  
> >>         #
> >>
> >> I'll merge something like this is nobody objects.
> > 
> > That makes sense, testing this now.
> 
> Yeah, that does it.
> 
> Tested-by: Tom Rini <tom_rini@mentor.com>
> 
> Koen, once this is in oe-core need a request to bring it over too or
> just want to come grab it?

I've merged it into OE-Core.

Cheers,

Richard



