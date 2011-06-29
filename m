Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QbrLs-0006Kl-3R for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 11:46:32 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5T9goGO002412
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 10:42:50 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01875-09 for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 10:42:46 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5T9gjDk002406
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 10:42:45 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1309338485.15156.188.camel@phil-desktop>
References: <BANLkTim9UBhi90OLd7UVxiRnxcWdkP=mqg@mail.gmail.com>
	<AFF7B511-46CF-4CDF-96CA-763678BF57C7@dominion.thruhere.net>
	<BANLkTi=3_0NHcyWydFjp7a3sBr00u-54YA@mail.gmail.com>
	<7848FD2A-860F-48C3-BE1D-739C6D9AB0A8@dominion.thruhere.net>
	<1309338485.15156.188.camel@phil-desktop>
Date: Wed, 29 Jun 2011 10:42:29 +0100
Message-ID: <1309340549.20015.335.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Conflicting providers for ssh/sshd (dropbear and openssh)
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
X-List-Received-Date: Wed, 29 Jun 2011 09:46:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-29 at 10:08 +0100, Phil Blundell wrote:
> On Wed, 2011-06-29 at 10:56 +0200, Koen Kooi wrote:
> > That's already the case now. The problem is the PROVIDES overlap since
> > the Poky people decided a distro could only have one true ssh
> > implementation instead of choosing it per image. So if your distro
> > doesn't set the PREFERRED_PROVIDER_sshd you get those nagging messages
> > during parsing that scare users and make consultants rich.
> > 
> > OE .dev isn't a lot better with the misguided DISTRO_SSH_DAEMON, but
> > at least it doesn't show those nag messages.
> 
> Fundamentally I think it is just a bug in bitbake that it makes such a
> fuss about overlapping PROVIDES.  It's not unreasonable for both openssh
> and dropbear to be PROVIDEing something like virtual/ssh-daemon (and
> indeed RPROVIDEing an equivalent) but, as you say, any given distro is
> perfectly entitled to want to build both of them and ship them in
> different images and/or feeds.
> 
> I guess what bitbake is really trying to warn about is recipes which
> will install conflicting files into the sysroot.  Obviously in a future
> utopia of per-recipe sysroot construction this would be a non-issue, but
> even with today's level of technology I think it would be fairly easy
> for us to detect when a collision actually happens and issue a sensible
> diagnostic at that point.  That would allow the offending ERROR to be
> removed without causing any real regression.

Speaking as the person who likely added this code in the first place,
its not quite this simple. There are two problem cases:

a) When we have several recipes like external-toolchain, glibc, eglibc
and uclibc all of which provide virtual/libc. If something else in the
build wants say eglibc-locale-foo but the preferred provider of
virtual/libc is uclibc then what bitbake is trying to warn about is that
it the user isn't going to get what they expect as both uclibc and
eglibc could end up being built.

We used to end up in a mess where bitbake could build the
external-toolchain recipe and some other libcs in parallel resulting an
a what could only be described as a mess. These days this doesn't happen
so much due to bitbake spitting out its dummy earlier on. It is actually
quite hard to detect this problem generically.

b) There is also the case where two recipes might generate the same
package. There is also some code in bitbake which at least tries to flag
problems like that from the point of view of multiple runtime providers.


So the code does actually stop some pretty nasty breakage from happening
but it isn't perfect and if we can find better ways, by all means...

Cheers,

Richard





