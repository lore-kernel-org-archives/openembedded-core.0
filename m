Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qnv5a-00079D-39
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 18:11:34 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1Qnv1P-0001yQ-Fc; Mon, 01 Aug 2011 18:07:15 +0200
From: Phil Blundell <philb@gnu.org>
To: Kumar Gala <galak@kernel.crashing.org>
Date: Mon, 01 Aug 2011 17:07:14 +0100
In-Reply-To: <4727DFCB-0AA2-43D1-A0CA-58717D815FE8@kernel.crashing.org>
References: <1312208500-13381-1-git-send-email-galak@kernel.crashing.org>
	<1312209045.30326.515.camel@phil-desktop>
	<4727DFCB-0AA2-43D1-A0CA-58717D815FE8@kernel.crashing.org>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1312214835.30326.528.camel@phil-desktop>
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: Add ability for tune files to pass in configure options to gcc
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
X-List-Received-Date: Mon, 01 Aug 2011 16:11:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-01 at 09:37 -0500, Kumar Gala wrote:
> Not sure I understand the statement about disambiguate the resulting compilers, on PPC where I intend to utilize this we'd have the toolchains already named something like:

The thing about disambiguating was that, if you're going to modify the
configure opts for gcc-cross based (indirectly) on ${MACHINE} you need
to consider what happens if you have a single build directory that's
being used for multiple MACHINEs.

From what you've described as the usecase for this feature it sounds as
though the easiest answer to that is simply to stop your extra flags
from being used by gcc-cross and ensure that they're only used by gcc.
Then you'd just need to make sure that the PACKAGE_ARCH for gcc always
reflects the options being used, which sounds lke it might already be
true for ppc but possibly is not in general.  (The target gcc package
isn't buildable for me at the moment but a bit of poking around with
bitbake -e suggests that it's just getting the generic architecture
PACKAGE_ARCH on i586 at least.)

I'm not familiar enough with the sdk code to know whether there are
going to be any issues around that or not.

p.



