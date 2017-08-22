Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 67ECF7827F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 16:00:06 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7MG063K009627
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 22 Aug 2017 17:00:07 +0100
Message-ID: <1503417606.32591.115.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Tue, 22 Aug 2017 17:00:06 +0100
In-Reply-To: <7462b13d-0fa2-7a9f-c6d9-49c5a3f6abb0@windriver.com>
References: <cover.1503283308.git.bruce.ashfield@windriver.com>
	<1503330934.32591.64.camel@linuxfoundation.org>
	<74bfd0a2-59a7-c98b-690d-8749ca7a989a@windriver.com>
	<1503411893.32591.108.camel@linuxfoundation.org>
	<7f1c93bd-0d0d-b4c4-d084-2a75d7362481@windriver.com>
	<1503415737.32591.112.camel@linuxfoundation.org>
	<7462b13d-0fa2-7a9f-c6d9-49c5a3f6abb0@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 22 Aug 2017 17:00:07 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/9] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Tue, 22 Aug 2017 16:00:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-08-22 at 11:34 -0400, Bruce Ashfield wrote:
> I can send you a v4 of the 4.12 patch in the next half an hour,
> that's easiest for me to do.
> 
> .. but if it isn't for you, go ahead and do the merge and I'll
> sort it out in a follow up.

The above works, I'm still trying to get to the bottom of the other
issues that are going on.

> > I can take care of the mips issue but we have one final problem:
> > 
> > "oe-selftest -r runqemu.RunqemuTests.test_boot_machine_iso"
> > 
> > is failing, it works with 4.10, fails with 4.12. Did some key
> > config
> > option for booting isos go missing?
> Not that I'm aware of, but I admit that I've never done any ISO
> booting of the images so wouldn't see it.
> 
> I'll diff the configs here and see if anything jumps out. Otherwise,
> I'll do a boot test myself and debug from there.

After running the failing test case, I was able to manually boot with:

tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin//qemu-system-x86_64 -device virtio-net-pci,netdev=net0,mac=52:54:00:12:34:02 -netdev tap,id=net0,ifname=tap0,script=no,downscript=no -cdrom tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64-20170822154904.iso -no-reboot -vga vmware -show-cursor -usb -device usb-tablet -device virtio-rng-pci  -nographic   -cpu core2duo -m 256

and then quickly "down, enter" to select the serial console option
which gave me this:

[    4.980303] netconsole: network logging started
[    4.980981] rtc_cmos 00:00: setting system clock to 2017-08-22 15:56:12 UTC (1503417372)
[    5.036130] Freeing unused kernel memory: 1440K
[    5.036320] Write protecting the kernel read-only data: 14336k
[    5.039206] Freeing unused kernel memory: 864K
[    5.072281] Freeing unused kernel memory: 1232K
[    5.173842] usb 1-1: new full-speed USB device number 2 using uhci_hcd
starting version 234
[    5.349596] input: QEMU QEMU USB Tablet as /devices/pci0000:00/0000:00:01.2/usb1/1-1/1-1:1.0/0003:0627:0001.0001/input/input4
[    5.361353] hid-generic 0003:0627:0001.0001: input: USB HID v0.01 Mouse [QEMU QEMU USB Tablet] on usb-0000:00:01.2-1/input0
[    5.504201] input: ImExPS/2 Generic Explorer Mouse as /devices/platform/i8042/serio1/input/input3
[    6.408140] BUG: unable to handle kernel NULL pointer dereference at           (null)
[    6.408651] IP: ide_cdrom_prep_fn+0x63/0x180
[    6.408802] PGD beed067 
[    6.408834] P4D beed067 
[    6.408935] PUD 0 
[    6.409028] 
[    6.409251] Oops: 0002 [#1] PREEMPT SMP
[    6.409524] Modules linked in:
[    6.409811] CPU: 0 PID: 117 Comm: udevd Not tainted 4.12.7-yocto-standard #4
[    6.410012] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.10.2-0-g5f4c7b1-prebuilt.qemu-project.org 04/01/2014
[    6.410399] task: ffff9366cbd87080 task.stack: ffff9778c0304000
[    6.410613] RIP: 0010:ide_cdrom_prep_fn+0x63/0x180
[    6.410749] RSP: 0018:ffff9778c0307ad8 EFLAGS: 00000002
[    6.410902] RAX: 0000000000000002 RBX: ffff9366cc3ef800 RCX: 0000000000000000
[    6.411089] RDX: 0000000000000000 RSI: ffff9366cbf1ec00 RDI: 000000000000a1fc
[    6.411318] RBP: ffff9778c0307ad8 R08: 0000000000000000 R09: 0000000000000001
[    6.411510] R10: 0000000000000020 R11: 0000000020112a00 R12: ffff9366cbf1ec00
[    6.411717] R13: 00000000ffffff87 R14: 00000000fffffffb R15: 0000000000000000
[    6.411938] FS:  00007fd6fa79e300(0000) GS:ffff9366cf200000(0000) knlGS:0000000000000000
[    6.412153] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    6.412351] CR2: 0000000000000000 CR3: 000000000beec000 CR4: 00000000000006f0
[    6.412686] Call Trace:
[    6.413793]  blk_peek_request+0x189/0x2d0
[    6.414010]  blk_fetch_request+0x12/0x30
[    6.414142]  ? _raw_spin_unlock_irq+0x23/0x30
[    6.414276]  do_ide_request+0x37d/0x660
[    6.414382]  ? cfq_group_service_tree_add+0x94/0xc0
[    6.414559]  ? cfq_service_tree_add+0x258/0x300
[    6.414695]  ? ktime_get+0x40/0xa0
[    6.414800]  __blk_run_queue+0x33/0x40
[    6.414908]  queue_unplugged+0x2f/0xc0
[    6.415017]  blk_flush_plug_list+0x1f9/0x240
[    6.415138]  blk_finish_plug+0x2c/0x40
[    6.415255]  __do_page_cache_readahead+0x1bd/0x260
[    6.415408]  force_page_cache_readahead+0xb5/0x110
[    6.415550]  ? force_page_cache_readahead+0xb5/0x110
[    6.415687]  page_cache_sync_readahead+0x3f/0x50
[    6.415815]  generic_file_read_iter+0x54b/0x700
[    6.415965]  blkdev_read_iter+0x35/0x40
[    6.416085]  __vfs_read+0xbf/0x110
[    6.416182]  vfs_read+0x8e/0x110
[    6.416279]  SyS_read+0x46/0xb0
[    6.416369]  ? SyS_lseek+0x87/0xb0
[    6.416469]  entry_SYSCALL_64_fastpath+0x1a/0xa5
[    6.416747] RIP: 0033:0x7fd6f9b06891
[    6.416854] RSP: 002b:00007fff59e50a08 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
[    6.417057] RAX: ffffffffffffffda RBX: 00007fff59e4f950 RCX: 00007fd6f9b06891
[    6.417248] RDX: 0000000000000200 RSI: 00007fff59e50ac0 RDI: 000000000000000c
[    6.417439] RBP: 00007fff59e4f950 R08: 0000000000000000 R09: 00007fd6f98751c0
[    6.417643] R10: 000000000000006d R11: 0000000000000246 R12: 00007fff59e509d8
[    6.417832] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[    6.418057] Code: 2f 01 00 00 b9 01 00 00 00 bf 01 00 00 00 48 8b 46 60 48 99 48 f7 ff 48 89 c7 8b 46 58 31 d2 c1 e8 09 f7 f1 48 8b 8e 50 01 00 00 <48> c7 01 00 00 00 00 48 c7 41 08 00 00 00 00 f6 46 44 01 48 8b 
[    6.418825] RIP: ide_cdrom_prep_fn+0x63/0x180 RSP: ffff9778c0307ad8
[    6.419017] CR2: 0000000000000000
[    6.419324] ---[ end trace dd02c5282d34fc7b ]---
[    6.419558] note: udevd[117] exited with preempt_count 1
Waiting for removable media...

Something in the IDE CDROM driver?

Cheers,

Richard

