Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1R2Jw8-0000Vj-Om
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Sep 2011 11:33:20 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1R2JrF-00005t-DI
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Sep 2011 11:28:17 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1315643085.1986.24.camel@ted>
References: <1314804932.19905.169.camel@phil-desktop>
	<4E6A82F8.5020508@linux.intel.com>  <1315643085.1986.24.camel@ted>
Date: Sat, 10 Sep 2011 10:28:11 +0100
Message-ID: <1315646891.4368.13.camel@lenovo.internal.reciva.com>
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
X-List-Received-Date: Sat, 10 Sep 2011 09:33:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-09-10 at 09:24 +0100, Richard Purdie wrote:
> For what its worth, even on plain qemux86 I'm seeing:
> 
> qemu: Unsupported syscall: 240
> inb: port=0x0000
> qemu: uncaught target signal 11 (Segmentation fault) - core dumped
> /media/data1/build1/poky/build/tmp/work/qemux86-poky-linux/core-image-sato-1.0-r0/rootfs/etc/rpm-postinsts/pango-module-basic-fc.sh: line 8: 11084 Segmentation fault      PSEUDO_RELOADED=YES qemu-i386 -L $D $D/usr/bin/pango-querymodules > "$D/etc/pango/pango.modules"
> 
> in the rootfs logs. Which reading things online suggests that qemu
> doesn't support multithreading under qemu user emulation on i386.

That is rather strange.  It does work ok for me on mips, and I wasn't
able to make it go wrong on x86-64 either in a quick test.

The other odd thing is that, from a quick look at the qemu source code,
it does seem as though sys_futex (which is syscall 240 on i386 and
syscall 202 on x86-64) ought to be supported if qemu was built with NPTL
on.  However, in my x86-64 test I did see the "unsupported syscall 202"
syscall although the binary still seemed to run fine.

And, well, the third weird thing is that your log message above implies
that pango-querymodules is trying to do inb(0) which clearly is not
going to work if you're not root.  I've no idea why it would be wanting
to do that.

p.




