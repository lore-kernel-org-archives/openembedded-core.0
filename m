Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michel.thebeau@windriver.com>) id 1UPIkh-0004xI-Sk
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 22:33:21 +0200
Received: from yow-mthebeau-lx2.wrs.com (yow-mthebeau-lx2.wrs.com
	[128.224.146.159])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r38KFvri011251;
	Mon, 8 Apr 2013 13:15:57 -0700 (PDT)
From: michel.thebeau@windriver.com
To: richard.purdie@linuxfoundation.org
Date: Mon,  8 Apr 2013 16:15:50 -0400
Message-Id: <1365452153-21650-1-git-send-email-michel.thebeau@windriver.com>
X-Mailer: git-send-email 1.7.9.7
Cc: Bruce.Ashfield@windriver.com, Michel.Thebeau@windriver.com,
	openembedded-core@lists.openembedded.org
Subject: [RFC] [PATCH 0/2] Routerstation Pro: kernel.bbclass: do_sizecheck, do_strip
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
X-List-Received-Date: Mon, 08 Apr 2013 20:33:23 -0000

Hi Richard,

Here is request for comment, v2 of fixes to kernel.bbclass for 3514 and
3514 bugs (and now bug 4220).  

For the first patch you had asked that KERNEL_OUTPUT be used
consistently for the kernel.

The second patch is new, and what I'm especially looking for comments
on.  It is to get back to what 3515 original said, to strip the elf
image, and what Bruce said: finding the right place to strip the image.

Commit 9cd3816e4db97c8fd093a120a75a2b5d193afcdd didn't quite work,
which made vmlinux.bin (binary format) the default kernel image.  See
also bug 4220.

FYI, the binary vmlinux.bin does boot when you know how.  0x806a5430
comes from copying the entry address of the elf.
RedBoot> load -v -m tftp -h 128.224.149.6 -b 0x80060000 -r mthebeau/vmlinux.bin
RedBoot> exec -b 0x80060000 -c "console=ttyS0,115200 root=/dev/sda1 rw rootdelay=2 board=UBNT-RSPRO" 0x806a5430

I have a version of this patch that strips the kernel in place
instead of carrying a copy.  One reason to carry a seperate copy could
be the following build warning, which is issued when stripping the
image in place:

WARNING: File '/usr/src/kernel/arch/mips/boot/vmlinux.stripped' from
linux-yocto was already stripped, this will prevent future debugging!

A third patch here for your reference only; will resend it to the poky
list if you like this approach.

Thanks,

M





