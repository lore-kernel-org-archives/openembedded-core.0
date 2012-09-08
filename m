Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TARYt-0007JY-Gr
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Sep 2012 22:23:27 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TARMr-00076g-IQ; Sat, 08 Sep 2012 22:11:01 +0200
Message-ID: <1347134935.4396.235.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Sat, 08 Sep 2012 21:08:55 +0100
In-Reply-To: <4a36b4005fc384ac817023873b2febc854c4415d.1346837268.git.liezhi.yang@windriver.com>
References: <cover.1346837268.git.liezhi.yang@windriver.com>
	<4a36b4005fc384ac817023873b2febc854c4415d.1346837268.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 1/2] opkg svn: Add the --force-arch option
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 08 Sep 2012 20:23:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-09-05 at 17:31 +0800, Robert Yang wrote:
> If there are more than one candidate which has the same pkg name in the
> candidate list, for example, the same pkg with different versions, then
> it will use the last one which is the highest version in the list
> 
> Add the "--force-arch" (just like the --force-downgrade) option to let
> it use the higher arch priority package when enabled. the default is no.

This seems like a reasonable feature to add to opkg, though I don't
think "--force-arch" is a very good name for the switch.  (That name
implies to me "allow the package to be installed even if the
architecture seems to be incompatible", which is quite different to what
your option does.) 

However, regarding the underlying problem:

a) for people who are not using O_P_M, it's becoming apparent that the
whole concept of using opkg (or rpm, or any other external package
manager) for rootfs construction is more of a liability than an asset
because bitbake has more knowledge about which particular binaries ought
to be installed.  For those use-cases, it might be better to think in
terms of abolishing opkg altogether which would solve this problem and a
variety of others.

b) for people who _are_ using O_P_M, specifying --force-arch during
rootfs construction is all very well but they might still lose during a
subsequent "opkg upgrade".  So for these use cases, it seems as though
something a bit more sticky might be required.

p.




