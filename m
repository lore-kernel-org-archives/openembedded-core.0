Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QbrTx-0007VQ-0A for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 11:54:53 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QbrQO-000115-VQ
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 11:51:13 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1309340549.20015.335.camel@rex>
References: <BANLkTim9UBhi90OLd7UVxiRnxcWdkP=mqg@mail.gmail.com>
	<AFF7B511-46CF-4CDF-96CA-763678BF57C7@dominion.thruhere.net>
	<BANLkTi=3_0NHcyWydFjp7a3sBr00u-54YA@mail.gmail.com>
	<7848FD2A-860F-48C3-BE1D-739C6D9AB0A8@dominion.thruhere.net>
	<1309338485.15156.188.camel@phil-desktop>
	<1309340549.20015.335.camel@rex>
Organization: Phil Blundell Consulting Ltd
Date: Wed, 29 Jun 2011 10:51:00 +0100
Message-ID: <1309341061.15156.227.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
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
X-List-Received-Date: Wed, 29 Jun 2011 09:54:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-29 at 10:42 +0100, Richard Purdie wrote:
> Speaking as the person who likely added this code in the first place,
> its not quite this simple. There are two problem cases:
> 
> a) When we have several recipes like external-toolchain, glibc, eglibc
> and uclibc all of which provide virtual/libc. If something else in the
> build wants say eglibc-locale-foo but the preferred provider of
> virtual/libc is uclibc then what bitbake is trying to warn about is that
> it the user isn't going to get what they expect as both uclibc and
> eglibc could end up being built.

In the particular case of uclibc vs eglibc, this isn't going to happen
because the COMPATIBLE_HOST logic will only ever admit one or the other
to the set of allowed recipes.  And, in the general case of arbitrary
packages, the point I was trying to make earlier is that the user might
actually _want_ to build two things which happen to both provide the
same virtual, and shouldn't be prevented (or even necessarily
discouraged) from doing so.

If there are other cases like the eglibc/uclibc thing which aren't
"intrinsically safe" in the same way then I guess the right way to solve
that is via some kind of (R)CONFLICTS declaration and smarter dependency
processing within bitbake.

> b) There is also the case where two recipes might generate the same
> package. There is also some code in bitbake which at least tries to flag
> problems like that from the point of view of multiple runtime providers.

As with the sysroot thing, I think the place to detect and diagnose that
is at the point where the packages are generated.  Or, alternatively
(but slightly less robustly) you could just scan PACKAGES for all the
recipes in the runqueue and look for collisions there, which would allow
you to detect at least some problems sooner.  I don't think the list of
PROVIDES is sufficiently reliable to use for this purpose since you can
easily have both false positives and false negatives.

p.




