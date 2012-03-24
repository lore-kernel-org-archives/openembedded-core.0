Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SBPG3-0002lK-5u for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 12:35:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2OBQjFo005592;
	Sat, 24 Mar 2012 11:26:45 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03056-05; Sat, 24 Mar 2012 11:26:39 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2OBQYSh005586
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 24 Mar 2012 11:26:35 GMT
Message-ID: <1332588396.9740.518.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 24 Mar 2012 11:26:36 +0000
In-Reply-To: <alpine.DEB.2.02.1203240558370.23984@oneiric>
References: <alpine.DEB.2.02.1203240436510.20052@oneiric>
	<1332582359.9740.489.camel@ted>
	<alpine.DEB.2.02.1203240558370.23984@oneiric>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "Rifenbark, Scott M" <scott.m.rifenbark@intel.com>
Subject: Re: "${bindir}" versus "${bindir}/*" ??
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
X-List-Received-Date: Sat, 24 Mar 2012 11:35:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-03-24 at 06:01 -0400, Robert P. J. Day wrote:
> On Sat, 24 Mar 2012, Richard Purdie wrote:
> 
> > On Sat, 2012-03-24 at 04:40 -0400, Robert P. J. Day wrote:
> > > in bitbake.conf, numerous variables like "FILES_${PN}" are
> > > initialized with a combination of directory variables, with two
> > > different forms:
> > >
> > >   * ${bindir}
> > >   * ${bindir}/*
> > >
> > > is there a functional difference between those two?  my wildly
> > > speculative guess is that if "*" works as it does in the shell, it
> > > would simply skip any hidden objects.  is that the difference?  since
> > > i don't see that clarified anywhere.
> >
> > The former is recursive and the latter is not and will just match files
> > in the directory (unhidden ones at that).
> 
>   ah, that clears up so much.  i'm actually embarrassed to ask such
> obvious questions -- is that written up somewhere that i should have
> run across it before asking about it?
> 
> rday
> 
> p.s.  By "unhidden ones at that," i'm assuming you mean *only*
> unhidden ones?  so that its behaviour is entirely consistent with what
> people would expect?

I'm not passing judgement on that :).

Keep in mind that the whole system grew fairly organically more so at
some times that others and there are a ton on inconsistencies,
particularly when you get deeply into the system. I think OE-Core has
fixed a lot of details and has concentrated on the most user visible
ones but there are more things that could be cleaned up. I doubt we ever
will have a totally consistent system and I suspect if we did we'd hurt
the power and flexibility which are some of the bigger assets of the
project.

FWIW, the behaviour of the FILES_* variables uses python's globbing
functionality behind the scenes. If you know that it helps to understand
it:

http://docs.python.org/library/glob.html
(which in turn refers you to shell expansion which is something most
people are familiar with).

I think what I'd ask is where you find these things, ask questions and
get answers (such as the info about python glob above), can you please
try and document it somewhere?

Even if this is in the form of a Q&A type document it would perhaps save
the information and someone like Scott Rifenbark could then go through
this when he was time and integrate it into the manuals (assuming you
don't want to send him direct patches for that). This particular change
would make a good addition to:

http://www.yoctoproject.org/docs/latest/poky-ref-manual/poky-ref-manual.html#var-FILES

I'd also add that I sometimes hate the fact we use glob for FILES since
it does limit some of the things you can do. .debug directories are a
pet hate of mine in that regard.

Cheers,

Richard




