Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qsym3-00039i-3a
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 17:08:19 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qsyhd-0004uC-0g
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 17:03:45 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 15 Aug 2011 16:03:44 +0100
In-Reply-To: <201108142050.37352.paul.eggleton@linux.intel.com>
References: <201108142050.37352.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1313420625.6733.182.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: Machine specific sysroot issue
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
X-List-Received-Date: Mon, 15 Aug 2011 15:08:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-08-14 at 20:50 +0100, Paul Eggleton wrote:
> libopie2, a non-machine specific package, among other things installs a file 
> called include.pro into ${OPIEDIR}, which is configured to be 
> ${STAGING_DIR_HOST}. In OE-classic ${STAGING_DIR_HOST} is not machine-specific, 
> so if you build libopie2 for machine A then build some other package that 
> needs include.pro for machine B, then everything is fine. In the OE-core case 
> with machine-specific sysroots it's looking for the file in the sysroot for the 
> current machine, which if you've been building for several different machines 
> may not be where it has actually been installed.

I can't immediately think why this should be behaving differently to any
other library (eglibc for example).  It's quite normal for those
packages to be architecture-specific and not machine-specific.

What I think is meant to happen when you change MACHINE is that
populate_sysroot will rerun (because ${MACHINE} is factored into the
stamp for that task) but it will use all the previously cached build
artifacts from sstate and hence you won't end up having to rebuild
everything.  It sounds as if that isn't happening in this case for some
reason, though I can't immediately think what libopie2 might be doing to
defeat it.

Is it just include.pro that goes wrong, or does the whole of libopie2 go
missing from the sysroot when you change MACHINE?

p.




