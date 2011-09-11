Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1R2s7V-0003Ng-6S
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Sep 2011 00:03:21 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1R2s2Z-00012f-VV
	for openembedded-core@lists.openembedded.org;
	Sun, 11 Sep 2011 23:58:16 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1315646891.4368.13.camel@lenovo.internal.reciva.com>
References: <1314804932.19905.169.camel@phil-desktop>
	<4E6A82F8.5020508@linux.intel.com>  <1315643085.1986.24.camel@ted>
	<1315646891.4368.13.camel@lenovo.internal.reciva.com>
Date: Sun, 11 Sep 2011 22:33:20 +0100
Message-ID: <1315776800.8535.2.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH] pango: use qemu to generate pango.modules during rootfs construction
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
X-List-Received-Date: Sun, 11 Sep 2011 22:03:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-09-10 at 10:28 +0100, Phil Blundell wrote: 
> The other odd thing is that, from a quick look at the qemu source code,
> it does seem as though sys_futex (which is syscall 240 on i386 and
> syscall 202 on x86-64) ought to be supported if qemu was built with NPTL
> on.  However, in my x86-64 test I did see the "unsupported syscall 202"
> syscall although the binary still seemed to run fine.

This part turns out not (quite) to be so mysterious.  For some reason,
qemu's configure script doesn't set target_nptl=yes for i386 or x86-64,
though it does for the majority of other arches.  So it will indeed be
the case that sys_futex will show up as an "unsupported syscall" on
those two architectures.

I'm not quite sure why qemu would be deciding not to do futexes on those
two architectures specifically.  I guess there must be some
functionality missing from the x86 emulation backend though I am not
sure exactly what that would be or how hard it would be to add.

p.




