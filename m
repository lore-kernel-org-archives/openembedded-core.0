Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8FF1173E3B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 22:08:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5HM8KQJ005896
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 15:08:21 -0700 (PDT)
Received: from seebs-worktop (172.25.40.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 17 Jun 2015 15:08:21 -0700
Date: Wed, 17 Jun 2015 17:08:19 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20150617170819.12ca4c30@seebs-worktop>
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.23; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: RFC: meta-bootlace (bootloader management layer)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Jun 2015 22:08:25 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

If a system is up for a while, you might want to issue kernel patches. For
desktop distributions, this is pretty easy and reasonably well-understood;
there's a grub config file somewhere, you modify that, you reboot, everything
is good.

For embedded systems with bootloaders that aren't grub, or are grub but in a
configuration where the partition it loads kernels from isn't usually mounted,
it's not quite so easy. Worse, if you support a range of embedded boards, you
don't even have a specific single bootloader in mind; you have a large range
of bootloaders that you might need to deal with.

Bootlace is an attempt to provide a reasonably simple and fairly minimal
abstraction layer over the most commonly-used functionality: "I have a new
kernel, I want the next boot to use it." The idea is that a BSP can select a
backend that suits its design or configuration, and then that backend does
the actual heavy lifting, but everything else (such as a kernel postinst
script) just sees a fairly generic interface that doesn't require any specific
knowledge of the BSP.

I've put up the current tree in contrib:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=seebs/meta-bootlace

The only actually-working backend right now is specific to the way one of our
default install targets uses grub-efi, where the system boots from the kernel
installed as "vmlinuz" on a separate FAT32 partition that isn't normally
mounted while the system is running. The default backend just helpfully
prints a diagnostic saying that it can't actually change what kernel gets
selected.

We'd like to see this considered for inclusion in oe-core, once it has some
more backends. (In particular, once it has a grub backend, it could in
principle replace the existing kernel-grub bbclass.)

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

