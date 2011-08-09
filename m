Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QqsqS-0002NX-Ud
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 22:24:13 +0200
Received: by ewy5 with SMTP id 5so266195ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2011 13:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	bh=dAEsPcJwsbyma/NfA5sYG8QeZa3wqPioeTQUZCtD12Q=;
	b=MA5Cm3ad7Fb7qweeMQX3RE+ME0M9asDSAawVf0yC3Yxiov/BVwnwJQD6AAO9QEO90R
	yiGsWp45sje2n+bIa1gC8itD/KUOupJbLg9n/glOkN5VEOHBm1IYG+2TmihilC5vOFXf
	mPhSWPAD6QlyNLNqOnLHg0vgbGJvjC8SdQWvw=
MIME-Version: 1.0
Received: by 10.213.20.19 with SMTP id d19mr1650679ebb.53.1312921183489; Tue,
	09 Aug 2011 13:19:43 -0700 (PDT)
Received: by 10.213.114.20 with HTTP; Tue, 9 Aug 2011 13:19:43 -0700 (PDT)
Date: Tue, 9 Aug 2011 15:19:43 -0500
Message-ID: <CAD=GYpYwTkfShO4KhzDfH=xpka3t9SDtqZaunsTN7vi5ESm3Zg@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "Kridner, Jason" <jdk@ti.com>, "Kooi, Koen" <k-kooi@ti.com>
Subject: [meta-ti] Kernel 3.0 meta-ti recipe
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
X-List-Received-Date: Tue, 09 Aug 2011 20:24:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

I am seeing some very erratic memory corruption issues all morning,
both with NFS and MMC cards. The traces are at the end of this email.

I have narrowed down the issue to one of the 13 Sakoman patches:
            file://sakoman/0001-mmc-don-t-display-single-block-read-console-messages.patch
\
            file://sakoman/0002-omap-Change-omap_device-activate-dectivate-latency-m.patch
\
            file://sakoman/0003-OMAP-DSS2-add-bootarg-for-selecting-svideo-or-compos.patch
\
            file://sakoman/0004-mtd-nand-Eliminate-noisey-uncorrectable-error-messag.patch
\
            file://sakoman/0005-video-add-timings-for-hd720.patch \
            file://sakoman/0006-drivers-net-smsc911x-return-ENODEV-if-device-is-not-.patch
\
            file://sakoman/0007-drivers-input-touchscreen-ads7846-return-ENODEV-if-d.patch
\
            file://sakoman/0008-Revert-omap2_mcspi-Flush-posted-writes.patch \
            file://sakoman/0009-rtc-twl-Switch-to-using-threaded-irq.patch \
            file://sakoman/0010-rtc-twl-add-support-for-backup-battery-recharge.patch
\
            file://sakoman/0011-soc-codecs-Enable-audio-capture-by-default-for-twl40.patch
\
            file://sakoman/0012-soc-codecs-twl4030-Turn-on-mic-bias-by-default.patch
\
            file://sakoman/0013-omap-mmc-twl4030-move-clock-input-selection-prior-to.patch
\

Not applying any of them makes the corruptions go away.

The recipe is at:
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstruments/tree/recipes-kernel/linux/linux_3.0.bb

Any comments?

Trace with Stable kernel 3.0.1 + all meta-ti patches:

During mounting nfs-rootfs:

   4.746459] Sending DHCP requests .
[    6.229125] smsc95xx 1-2.1:1.0: eth0: link up, 100Mbps,
full-duplex, lpa 0x45E1
[    7.707366] .
[    8.074584] Internal error: Oops - undefined instruction: 0 [#1]
[    8.081024] Modules linked in:
[    8.084228] CPU: 0    Not tainted  (3.0.1+ #1)
[    8.088867] PC is at 0xdec2ded0
[    8.092163] LR is at run_timer_softirq+0x15c/0x1f8
[    8.097167] pc : [<dec2ded0>]    lr : [<c007a338>]    psr: 60000153
[    8.097167] sp : c064dea8  ip : 00000000  fp : c06b8624
[    8.109161] r10: c064dea0  r9 : 00000000  r8 : dec2dec8
[    8.114624] r7 : c0677bdc  r6 : 00000025  r5 : c007a338  r4 : c06b87a0
[    8.121429] r3 : 00200200  r2 : 00000000  r1 : 00000001  r0 : deed4dac
[    8.128265] Flags: nZCv  IRQs on  FIQs off  Mode SVC_32  ISA ARM
Segment kernel
[    8.135986] Control: 10c5387d  Table: 80004019  DAC: 00000015
[    8.141998] Process swapper (pid: 0, stack limit = 0xc064c2f0)
[    8.148071] Stack: (0xc064dea8 to 0xc064e000)
[    8.152618] dea0:                   c0677bdc 00000001 c06b8628
c064c000 00000100 c06b8600
[    8.161163] dec0: 0000000a c0075e24 0000067d c0677bdc 00000000
00000001 00000003 00000025
[    8.169708] dee0: 00000000 c0654258 00000003 00000003 413fc082
00000000 00000000 c00761f4
[    8.178283] df00: 00000025 c0040064 60000053 ffffffff fa200000
c0044ff8 00773593 00000000
[    8.186828] df20: 00773593 00000000 c06a662c c0654258 c0654258
00000003 00000003 413fc082
[    8.195373] df40: 00000000 00000000 00000000 c064df60 c0054dcc
c0054dd8 60000053 ffffffff
[    8.203918] df60: 00000000 00773593 00000008 0433ad78 00000008
03bc77e5 00000000 00000000
[    8.212463] df80: c0654248 c0654378 00000000 c0054f78 00000001
00000000 c0654248 c0654378
[    8.221008] dfa0: c06d7a6c 413fc082 00000000 c0377854 c064c000
c0652254 c06a5d04 c065224c
[    8.229553] dfc0: 80004059 c0045f40 c064e9b4 c003341c c0ae11c0
c0008868 c00082c8 0000060a
[    8.238098] dfe0: 80000100 c003341c 10c53c7d c064e060 c0033418
8000803c 00000000 00000000
[    8.246643] [<c007a338>] (run_timer_softirq+0x15c/0x1f8) from
[<00000001>] (0x1)
[    8.254394] Code: c003eb28 c04905b4 c064dea0 c064dea0 (ffff6e09)
[    8.261322] ---[ end trace 621a051040b8870a ]---


and sometimes after mounting nfsroot:

[   15.672424] [00000110] *pgd=9d9ce831, *pte=00000000, *ppte=00000000
[   15.678985] Internal error: Oops: 17 [#1]
[   15.683166] Modules linked in: ipv6
[   15.686828] CPU: 0    Not tainted  (3.0.1+ #1)
[   15.691467] PC is at rcu_bh_qs+0x20/0x40
[   15.695587] LR is at __do_softirq+0xd8/0x10c
[   15.700042] pc : [<c00a918c>]    lr : [<c0075e80>]    psr: 60000193
[   15.700042] sp : dd9edd70  ip : 00000000  fp : c06b8624
[   15.712036] r10: 0000000a  r9 : 00000000  r8 : c06b8600
[   15.717498] r7 : 00000100  r6 : dd9ec000  r5 : c06b863c  r4 : 00000001
[   15.724334] r3 : 00000100  r2 : 00000000  r1 : 00000006  r0 : 00000000
[   15.731140] Flags: nZCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM
Segment user
[   15.738708] Control: 10c5387d  Table: 9d9f0019  DAC: 00000015
[   15.744720] Process udevd (pid: 107, stack limit = 0xdd9ec2f0)
[   15.750793] Stack: (0xdd9edd70 to 0xdd9ee000)
[   15.755371] dd60:                                     000035ea
c0678adc 00000000 00000006
[   15.763916] dd80: 00000000 0000004d 00000000 00000001 00000000
fffffff6 00001051 00000000
[   15.772460] dda0: 0000000b c00761f4 0000004d c0040064 20000013
ffffffff fa200000 c0044ff8
[   15.781005] ddc0: 00000000 00000000 00000000 00000001 00000001
de89adb8 00000001 00000000
[   15.789550] dde0: fffffff6 00001051 00000000 0000000b 00000000
dd9ede08 c00ef36c c01a0600
[   15.798126] de00: 20000013 ffffffff de89adb8 00000001 00000000
dd9edec0 ded0a001 dd9ec000
[   15.806671] de20: ffffff9c c00f12f0 00028c80 defd7920 def2002a
c042798c 0000bd03 00000002
[   15.815216] de40: c064ff38 a0000193 dd9edec0 00000041 ded0a000
ffffff9c 00000001 dd9ec000
[   15.823760] de60: 00000000 c00f1abc dd9ede84 306df780 defd7920
defd7920 c06d8da0 c04e6cc0
[   15.832305] de80: 00000000 00000000 0000000b 00000001 dd9edec0
ded0a000 ffffff9c 00000001
[   15.840881] dea0: 00000000 c00f20a0 ded0a000 01181090 dd9edf38
ffffff9c 00000001 c00f23b8
[   15.849426] dec0: dec10ee0 de898b38 00051f4d 00000000 00000008
dec10ee0 de898b38 de89adb8
[   15.857971] dee0: 00001015 00000000 00000001 00000000 c0040bb0
ddbf4000 00000002 c008aca8
[   15.866516] df00: ddbf401c dd9c00a0 dd9c8120 dd9ec000 dd9c00a0
c06738c8 dd9c8120 dd9ec000
[   15.875091] df20: dd9edf50 01181090 01181148 000000c3 c0045644
c00eadd0 ffffff9c be851278
[   15.883636] df40: dd9edf50 be851678 01181090 c00eafa4 00000000
00000009 00000001 c0075e60
[   15.892181] df60: 000035e9 c0678adc 00000000 00000003 0002c41c
0000004d 00000000 01183f10
[   15.900726] df80: 0002c41c 01187b2a c0680910 ffffffff fa200000
01183f10 0002c41c 00000000
[   15.909271] dfa0: 4024a7c4 c00454c0 4024a7c4 01181090 be851278
be851678 be851678 00000000
[   15.917846] dfc0: 4024a7c4 01181090 01181148 000000c3 be850e78
4024a7b8 00000000 0000000b
[   15.926391] dfe0: 0002c304 be84ca34 00012a40 401c2e04 60000010
be851278 00000000 00000000
[   15.934936] [<c00a918c>] (rcu_bh_qs+0x20/0x40) from [<c0678adc>] (0xc0678adc)
[   15.942413] Code: e593200c e3520000 0a000005 e5932014 (e5931010)
[   15.949432] ---[ end trace 2884a8555340fa89 ]---
[   15.954254] Kernel panic - not syncing: Fatal exception in interrupt


Saw this trace atleast once during bootup with MMC cards

[    5.260284] systemd-vconsole-setup[57]: cannot open file us
[    5.318725] Unable to handle kernel NULL pointer dereference at
virtual address 00000000
[    5.327453] pgd = dd800000
[    5.330322] [00000000] *pgd=9ef8e831, *pte=00000000, *ppte=00000000
[    5.336914] Internal error: Oops: 17 [#1]
[    5.341094] Modules linked in: ipv6
[    5.344757] CPU: 0    Not tainted  (3.0.1+ #4)
[    5.349426] PC is at cache_alloc_refill+0x31c/0x4e4
[    5.354522] LR is at 0x0
[    5.357177] pc : [<c00dda38>]    lr : [<00000000>]    psr: 40000013
[    5.357177] sp : deffbe98  ip : 00000001  fp : 00000020
[    5.369171] r10: 00000010  r9 : 00000000  r8 : dec00ae0
[    5.374633] r7 : dec029e0  r6 : dec09000  r5 : c06af494  r4 : 000000d0
[    5.381469] r3 : 00000000  r2 : c0a9e200  r1 : 00000000  r0 : c0a9e200
[    5.388305] Flags: nZcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
[    5.395751] Control: 10c5387d  Table: 9d800019  DAC: 00000015
[    5.401763] Process udevd (pid: 52, stack limit = 0xdeffa2f0)
[    5.407775] Stack: (0xdeffbe98 to 0xdeffc000)
[    5.412322] be80:
    dec00ae0 000000d0
[    5.420898] bea0: deffa000 dda830d0 60000013 000000d0 dec00ae0
c06b1ba0 dda830f0 def09960
[    5.429443] bec0: deffa000 c00ddd34 dda830d0 dda8cde0 def36968
00000001 c06b1ba0 c006c338
[    5.438018] bee0: dda0d788 dda830ec dda830dc dda8ce14 def09994
dda830d0 00000000 dda54300
[    5.446563] bf00: c06b1ba0 dda847f8 dda847cc dda84560 deffa000
01200011 00000000 c006ccb4
[    5.455108] bf20: deffbf58 de9bfca0 00000000 00000000 deffbfb0
beb31cc8 dda84754 00000000
[    5.463684] bf40: 00080800 00000000 de9bfca0 deffbfb0 01200011
00000000 00000000 00000000
[    5.472229] bf60: deffa000 00000000 beb31d0c c006d4a8 400e3438
00000000 00000000 c03ddfac
[    5.480804] bf80: 00000004 00000001 00000000 00000000 400e3438
beb31cc8 00000034 00000078
[    5.489349] bfa0: c00418c4 c0041740 00000000 400e3438 01200011
00000000 00000000 00000000
[    5.497894] bfc0: 400e3438 beb31cc8 00000034 00000078 40285000
400e33d0 00000002 beb31d0c
[    5.506469] bfe0: 400e3890 beb31cc8 00000034 401f0f98 60000010
01200011 00000000 00000000
[    5.515045] [<c00dda38>] (cache_alloc_refill+0x31c/0x4e4) from
[<c00ddd34>] (kmem_cache_alloc+0x60/0x9c)
[    5.524963] [<c00ddd34>] (kmem_cache_alloc+0x60/0x9c) from
[<c006c338>] (dup_mm+0x184/0x3d8)
[    5.533813] [<c006c338>] (dup_mm+0x184/0x3d8) from [<c006ccb4>]
(copy_process+0x6e4/0xddc)
[    5.542449] [<c006ccb4>] (copy_process+0x6e4/0xddc) from
[<c006d4a8>] (do_fork+0xfc/0x278)
[    5.551116] [<c006d4a8>] (do_fork+0xfc/0x278) from [<c0041740>]
(ret_fast_syscall+0x0/0x30)
[    5.559875] Code: e151000c e2811001 bafffff9 e59f31c0 (e5933000)
[    5.566680] ---[ end trace 184195d3f9f3e40f ]---


