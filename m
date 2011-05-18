Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QMj7J-00046J-Cv for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 17:56:57 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QMj4W-0006sI-VO
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 17:54:05 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cc2e6337ae338737455bf63bd43278dee302fb5c.1305665459.git.raj.khem@gmail.com>
References: <cover.1305665459.git.raj.khem@gmail.com>
	<cc2e6337ae338737455bf63bd43278dee302fb5c.1305665459.git.raj.khem@gmail.com>
Date: Wed, 18 May 2011 16:53:58 +0100
Message-ID: <1305734038.18415.108.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 1/1] default-distrovars.inc, task-core-boot.bb: Create distro overridable varibales
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
X-List-Received-Date: Wed, 18 May 2011 15:56:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-17 at 13:57 -0700, Khem Raj wrote:
> With default-setup being pulled in via bitbake.conf and task-core-boot
> being pulled into all images in distros, we need
> to have some variables that distro's can override if need be
> This is a backport from angstrom/OE. It will help distros which
> e.g. would like to use busybox-mdev instead of udev and similarly
> for login manager these variables can be defined in distro policies

I'm not massively convinced that this proliferation of extra switches is
a very good thing.  With each DISTRO now having its own layer, it's
quite straightforward for it to provide its own customised rootfs
recipes which contain exactly the set of packages that it wants.  Trying
to create a sort of "generic" rootfs recipe in which every other
dependency can be tweaked by some obscure variable doesn't seem like an
especially productive way to proceed.

Also, any new variable which is added to default-distrovars.inc will be
included in the parsed metadata for everything and, although the
marginal cost (in memory/performance terms) of adding one extra global
variable is not that great, it's not zero either.  Perhaps more
significantly, there is also a cost in terms of metadata
comprehensibility: one of the common complaints about "classic oe" was
that it was difficult to get your head around the myriad little
variables that you could tweak in some or other configuration file.

So, all in all, I think we should try to keep a lid on the amount of
stuff that goes into default-distrovars and its friends.  If the idea of
a sort of templated rootfs image really seems like a valuable one then
maybe we could put those vars in a dedicated config file which is only
included by the rootfs recipes.

p.




