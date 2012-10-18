Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TOn8i-0001H6-Fu
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 12:15:49 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TOmvr-00036V-5Q; Thu, 18 Oct 2012 12:02:27 +0200
From: Phil Blundell <philb@gnu.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Thu, 18 Oct 2012 11:02:26 +0100
In-Reply-To: <1350554381.2185.169.camel@ted>
References: <1348577801.31293.71.camel@phil-desktop>
	<50785717.8000606@linux.intel.com>
	<1350294414.3259.128.camel@phil-desktop>
	<507E2722.9020904@linux.intel.com>
	<1350514593.4470.175.camel@x121e.pbcl.net>
	<1350554381.2185.169.camel@ted>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1350554547.3259.222.camel@phil-desktop>
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] eglibc: Move perl- and bash-using scripts to separate recipes
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
X-List-Received-Date: Thu, 18 Oct 2012 10:16:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-10-18 at 10:59 +0100, Richard Purdie wrote:
> Its basically the same problem, the mulitlib libc-initial needs to be
> set too. The reproducer would be something like:
> 
> local.conf:
> MACHINE = qemux86
> require conf/multilib.conf
> MULTILIBS = "multilib:lib32"
> DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
> baselib_virtclass-multilib-lib32 = "lib32"
> 
> $ bitbake eglibc
> 
> The easiest solution is probably to change the do_evacuate_scripts
> function to check for "-initial" in PN.

Ah, right, got it.  Maybe it would be better to declare a dummy
do_evacuate_scripts() in eglibc-initial.inc instead.  I'll give that a
try and see what happens.

p.




