Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Qgw7d-0006j4-Ar for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 11:52:49 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1Qgw3p-0004QS-Dy
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 11:48:53 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 13 Jul 2011 10:48:52 +0100
In-Reply-To: <1310530784-16538-1-git-send-email-raj.khem@gmail.com>
References: <1310530784-16538-1-git-send-email-raj.khem@gmail.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.0.2- 
Message-ID: <1310550533.6337.236.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] strace: Define own sigmask macro if not defined already in signal.h
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
X-List-Received-Date: Wed, 13 Jul 2011 09:52:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-12 at 21:19 -0700, Khem Raj wrote:
> ++#ifndef sigmask
> ++/* Compute mask for signal SIG.  */
> ++#define sigmask(sig)   __sigmask(sig)
> ++#endif /* sigmask */

That looks a bit dubious to me.  If this is relying on some uclibc
implementation detail then I think it should either be applied for
uclibc only, or guarded with something like "#if defined(__UCLIBC__)
&& !defined(sigmask)".  Otherwise you might end up trying to call
__sigmask() on non-uclibc systems which could have unwanted effects.

p.




