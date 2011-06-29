Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QbqoG-0006rS-9m for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 11:11:48 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1Qbqki-00010P-9A
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 11:08:08 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <7848FD2A-860F-48C3-BE1D-739C6D9AB0A8@dominion.thruhere.net>
References: <BANLkTim9UBhi90OLd7UVxiRnxcWdkP=mqg@mail.gmail.com>
	<AFF7B511-46CF-4CDF-96CA-763678BF57C7@dominion.thruhere.net>
	<BANLkTi=3_0NHcyWydFjp7a3sBr00u-54YA@mail.gmail.com>
	<7848FD2A-860F-48C3-BE1D-739C6D9AB0A8@dominion.thruhere.net>
Organization: Phil Blundell Consulting Ltd
Date: Wed, 29 Jun 2011 10:08:05 +0100
Message-ID: <1309338485.15156.188.camel@phil-desktop>
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
X-List-Received-Date: Wed, 29 Jun 2011 09:11:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-29 at 10:56 +0200, Koen Kooi wrote:
> That's already the case now. The problem is the PROVIDES overlap since
> the Poky people decided a distro could only have one true ssh
> implementation instead of choosing it per image. So if your distro
> doesn't set the PREFERRED_PROVIDER_sshd you get those nagging messages
> during parsing that scare users and make consultants rich.
> 
> OE .dev isn't a lot better with the misguided DISTRO_SSH_DAEMON, but
> at least it doesn't show those nag messages.

Fundamentally I think it is just a bug in bitbake that it makes such a
fuss about overlapping PROVIDES.  It's not unreasonable for both openssh
and dropbear to be PROVIDEing something like virtual/ssh-daemon (and
indeed RPROVIDEing an equivalent) but, as you say, any given distro is
perfectly entitled to want to build both of them and ship them in
different images and/or feeds.

I guess what bitbake is really trying to warn about is recipes which
will install conflicting files into the sysroot.  Obviously in a future
utopia of per-recipe sysroot construction this would be a non-issue, but
even with today's level of technology I think it would be fairly easy
for us to detect when a collision actually happens and issue a sensible
diagnostic at that point.  That would allow the offending ERROR to be
removed without causing any real regression.

p.




