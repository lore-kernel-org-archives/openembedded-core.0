Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SSD5f-0004rU-7Y for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 22:02:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q49JqZ1p025692
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 May 2012 20:52:35 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23717-09 for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2012 20:52:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q49JqJIo025675
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 May 2012 20:52:20 +0100
Message-ID: <1336593138.2494.72.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 09 May 2012 20:52:18 +0100
In-Reply-To: <4FAAAEB6.2060703@palm.com>
References: <4FA17B2A.5060903@palm.com> <4FA17FA7.9030805@windriver.com>
	<4FA187F4.9040003@palm.com> <4FA18DA7.6010205@windriver.com>
	<4FA18EC8.5040504@palm.com> <4FA18F9D.5090805@windriver.com>
	<1335999994.30113.39.camel@ted> <4FA6B6AC.60301@palm.com>
	<1336480442.25084.74.camel@ted> <4FAAAEB6.2060703@palm.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: SetScene tasks hang forever?
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
X-List-Received-Date: Wed, 09 May 2012 20:02:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-05-09 at 10:51 -0700, Rich Pixley wrote:
> On 5/8/12 05:34 , Richard Purdie wrote:
> > On Sun, 2012-05-06 at 10:36 -0700, Rich Pixley wrote:
> >> Any other ideas?
> > Well, this clearly doesn't happen with master or in any combination of
> > the layers most users are using. The logical conclusion would be that
> > there is something in your layer that is somehow triggering this.
> No private layer involved.
> 
> I do have a makefile which encapsulates the environment stuff, but 
> that's it.
> > Of course since that layer is secret and you can't show us it, we have a
> > bit of a problem. Can you reproduce the bug against public code?
> Done.  (Our layer is becoming open, we're committed to it, but it's a 
> long process internally).
> > Are you by any chance setting BB_STAMP_POLICY somewhere?
> Yes.  BB_STAMP_POLICY = "full".
> 
> I'll attach a copy of my local.conf and bblayers.conf.

I'm 95% sure its BB_STAMP_POLICY = "full" causing the problems. The idea
is really that sstate and other recent developments obsolete the "full"
stamp code. I'm not sure it actually gets on with the setscene stamps
the sstate code generates, as I suspect you're discovering.

We could try and fix the "full" policy, or we could just remove it.
Looking at the code for the function that deals with this in
runqueue.py, I can see where problems could occur.

So I guess I'm asking if we should fix that or can we remove it?

Cheers,

Richard




