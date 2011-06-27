Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Qb8On-0004NB-Qo for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 11:46:33 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1Qb8LI-0008IR-6L
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 11:42:56 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <48356C52-61A1-42BE-92AA-704FB136D8A3@dominion.thruhere.net>
References: <CFB391EB-D84F-4616-887D-DAFAB036EA42@dominion.thruhere.net>
	<4E0699D1.9090308@gmail.com> <4E074ABB.80405@gmail.com>
	<48356C52-61A1-42BE-92AA-704FB136D8A3@dominion.thruhere.net>
Organization: Phil Blundell Consulting Ltd
Date: Mon, 27 Jun 2011 10:42:54 +0100
Message-ID: <1309167774.21613.264.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: gcc-cross-kernel problems
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
X-List-Received-Date: Mon, 27 Jun 2011 09:46:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-06-27 at 11:32 +0200, Koen Kooi wrote:
> Op 26 jun 2011, om 17:05 heeft Khem Raj het volgende geschreven:
> 
> > On 06/25/2011 07:30 PM, Khem Raj wrote:
> >> so in you kernel recipe somewhere patch the below code
> >> 
> >> PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.gcc-cross-kernel:"
> > 
> > I guess it has 4.2.1 in the path for you as I see so you might need
> > 
> > PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.gcc-cross-kernel-4.2.1:"
> 
> I did it a bit differently and symlinked it into the regular toolchain bin and I not get an 'as' error about '-EL' not being a valid option.It looks like gcc is calling an unprefixed 'as'. Is this due to gcc-cross-kernel being bitrotted, the recipe missing patches or something else?

That usually means that the cross as hasn't been installed/symlinked
into the place where gcc expects to find it.  The way the gcc driver
locates the assembler is by searching for "as" in various different
directories.  In particular, despite what you might expect it doesn't
ever look for $TARGET_SYS-as in $bindir or anywhere else.

Usually it will expect to find as in
$libexecdir/gcc/$TARGET_SYS/4.2.1/as or some such path.  The symlinks in
that directory are created as part of the gcc installation process.  You
can strace gcc to find out where it's actually looking.

p.




