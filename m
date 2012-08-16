Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1T1vpk-0000tJ-9k
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 10:53:40 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1T1ve7-0005KH-IM
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 10:41:39 +0200
Message-ID: <1345106385.7750.76.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 16 Aug 2012 09:39:45 +0100
In-Reply-To: <1345070782-4518-2-git-send-email-andy.ross@windriver.com>
References: <1345070782-4518-1-git-send-email-andy.ross@windriver.com>
	<1345070782-4518-2-git-send-email-andy.ross@windriver.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH] insane.bbclass: Fix RPATH warning in the face of funny path strings
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
X-List-Received-Date: Thu, 16 Aug 2012 08:53:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-08-15 at 15:46 -0700, Andy Ross wrote:
> In toolchain edge cases it's possible for the RPATH of a library to be
> set to something like "/usr/lib/../lib".  This should be detected as
> "/usr/lib" and generate a warning.  Also clarify the warning text to
> indicate potential link-time pollution from the host libraries.

If these RPATHs are causing host pollution then that sounds like there
is another bug elsewhere.  They ought to be resolved relative to the
sysroot during link edit.

It's also tempting to say that we should, unconditionally, normalise any
RPATHs which contain .. or . components before insane.bbclass runs.
Having extra, redundant, components in the pathname will just cause
extra work for ld.so (and hence run-time slowness) and bring no benefit.
Doing that would mean that the existing check would catch things like
the case you mentioned automatically.

p.




