Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qod81-0007xJ-Tx
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 17:13:01 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qod3p-0003wD-M2
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 17:08:41 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 03 Aug 2011 16:08:40 +0100
In-Reply-To: <1D9491FE-2F9E-4AE5-B176-117DDD21BAE0@kernel.crashing.org>
References: <1D9491FE-2F9E-4AE5-B176-117DDD21BAE0@kernel.crashing.org>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1312384121.4325.90.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: redundant RPATH warning?
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
X-List-Received-Date: Wed, 03 Aug 2011 15:13:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-03 at 10:00 -0500, Kumar Gala wrote:
> What causes warnings like the following:
> 
> WARNING: QA Issue: gthumb: /work/ppce5500-poky-linux/gthumb-2.12.3-r1/packages-split/gthumb/usr/lib64/gthumb/extensions/libexport_tools.so contains probably-redundant RPATH /usr/lib64

Pretty much what it says.  That DSO contains an RPATH record pointing to
a directory which (in insane.bbclass's view) the dynamic linker would
have searched anyway without being told to.  In most cases this means
that the RPATH isn't serving any useful purpose and is just wasting time
and space.

Obviously insane.bbclass is not infallible though.  In particular, there
is no portable way to find out what paths ld.so will actually search on
its own initiative, so insane.bbclass assumes that the list consists of
${base_libdir} and ${libdir}.  If that assumption isn't valid in your
particular configuration then you will get spurious warnings.

> Is this something we should by trying to clean up?

Ideally, yes.  I think libtool is the main offender in this respect and,
if it could be fixed somehow, the majority of those warnings would
probably go away.

p.




