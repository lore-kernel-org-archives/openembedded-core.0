Received: from mail-vb0-f54.google.com ([209.85.212.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang2003@gmail.com>) id 1TuxIZ-0005Pj-01
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 04:34:57 +0100
Received: by mail-vb0-f54.google.com with SMTP id l1so4254991vba.41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2013 19:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=tTnwprCtpENnN2HAONfPL74vf/tKEMfdFcx65pHG3ck=;
	b=dXoFO7yUyVczDKiHFjE8wQ3nEF+SOijGNDCEP0BV7hpIpnZ0xnYrMxFQwFwLfqPu6t
	qHsg41Di2zbZxjoKWOxWg3LTijRd3vhtO/ieKMhUHQdJ+imT0ZtBRNOdF21mID3vFKcV
	Rbml7UT4Zu00viUWrIgC4jPkakz/eaiZOCJY7Lpct9ZgBal6MSC0EWFIIzz1TzelIh9o
	0KjQZawgvyA3AoWBSLi+n+krb/NEb+dF2dRPIGvYIK1J92hcRwcJsWOBUHldcVAabLtz
	J3tbWwqx+qXP8Lr3Tbt4H8LkB2GbNlJLFlPlYHxSW2lvnQ6owUeXFnPXv5neWmaLFRRg
	Vo9w==
MIME-Version: 1.0
Received: by 10.58.12.200 with SMTP id a8mr105918963vec.52.1358219970823; Mon,
	14 Jan 2013 19:19:30 -0800 (PST)
Received: by 10.220.58.2 with HTTP; Mon, 14 Jan 2013 19:19:30 -0800 (PST)
In-Reply-To: <CADwFkYc2W4u8DZRPDL0vZ44LD-aK8TOtgc-+0uLcTuaQm2W97g@mail.gmail.com>
References: <10956581.fOyYazISSg@ll-pc> <11519600.2rXqV1jsdJ@ll-pc>
	<CADwFkYc2W4u8DZRPDL0vZ44LD-aK8TOtgc-+0uLcTuaQm2W97g@mail.gmail.com>
Date: Tue, 15 Jan 2013 03:19:30 +0000
Message-ID: <CADwFkYc31npoSedn5c46VRxSAE4KhFzjxpeOhoH5rCQs15Pz_w@mail.gmail.com>
From: Yi Qingliang <niqingliang2003@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: core-image-minimal boot problem
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
X-List-Received-Date: Tue, 15 Jan 2013 03:34:58 -0000
Content-Type: multipart/alternative; boundary=047d7b2e0cabe3462504d34b3ac2

--047d7b2e0cabe3462504d34b3ac2
Content-Type: text/plain; charset=ISO-8859-1

I have debugged the sysvinit, found that:
the 30seconds is about close(fd) in function:
void print(char *s)                             (src/init.c)

and the "close" return 0.
why close will hang for 30seconds?
I asked in sysvinit-devel email list, no response.

anyone can give some suggestion?
THANKS

Nanjing Jilong
Yi Qingliang


On Mon, Jan 14, 2013 at 7:23 AM, Yi Qingliang <niqingliang2003@gmail.com>wrote:

> I have got something,
> after change the "DEBUG" to "1" in sysvinit/src/init.h, the pause between
> and after INIT: version 2.88 booting missed.
> add -i to the /sbin/agetty line in /etc/inittab, I got the login prompt,
> (it mean do not display issue).
> but, but, what's the problem.
>
>
> On Sun, Jan 13, 2013 at 4:29 PM, Yi Qingliang <niqingliang2003@gmail.com>wrote:
>
>> can you give some suggestions?
>> I have struggled on it for 4days with a big headache.:(
>>
>> On Sunday, January 13, 2013 07:29:52 PM Yi Qingliang wrote:
>> > I have compiled a core-image-minimal running on my s3c2442 board.
>> > both the kernel and barebox are compiled based on mini2440.
>> >
>> > the fs is ubifs.
>> >
>> > after set rtc, stop several seconds.
>> > and the continue mount rootfs.
>> > when execute sysvinit,
>> > after print "INIT:", stop long time, and then print " version 2.88
>> booting".
>> > stop long time, print a newline.
>> > stop long time, continue.
>> > and finally, no shell prompt occur.
>> >
>> > I have checked sysvinit code, the "INIT:" and "version 2.88 booting" are
>> > only continuous print, it should not pause between them.
>> >
>> > I have changed ubifs to cramfs, no luck.
>> > and if I uncheck the s3c nand debug option in kernel configuration,
>> > I can get shell prompt, and login the system, and only that, the boot
>> time
>> > no change.
>> >
>> > is there someone can help me?
>> >
>> >
>> >
>> > =====================ATTACHE FILE=================
>> >
>> >
>> > the serial output is:
>> >
>> > booting kernel from /dev/nand0.kernel.bb
>> > commandline: console=ttySAC0,115200 mini2440=0tbc LANG=en_US.UTF-8
>> ip=dhcp
>> > root=ubi0:arm9plf-rootfs ubi.mtd=3 rootfstype=ubifs noinit
>> > rd mtdparts=nand:768k(barebox),256k(bareboxenv),5M(kernel),-(fs)
>> > arch_number: 1999
>> > Uncompressing Linux... done, booting the kernel.
>> > Booting Linux on physical CPU 0
>> > Linux version 3.7.2 (ll@ll-pc) (gcc version 4.7.2 (GCC) ) #23 Sun Jan
>> 13
>> > 19:14:52 CST 2013
>> > CPU: ARM920T [41129200] revision 0 (ARMv4T), cr=c0007177
>> > CPU: VIVT data cache, VIVT instruction cache
>> > Machine: NJJL2442
>> > Memory policy: ECC disabled, Data cache writeback
>> > CPU S3C2442B (id 0x32440aab)
>> > S3C24XX Clocks, Copyright 2004 Simtec Electronics
>> > S3C244X: core 405.000 MHz, memory 101.250 MHz, peripheral 50.625 MHz
>> > CLOCK: Slow mode (1.500 MHz), fast, MPLL on, UPLL on
>> > Built 1 zonelists in Zone order, mobility grouping on.  Total pages:
>> 16256
>> > Kernel command line: console=ttySAC0,115200 mini2440=0tbc
>> LANG=en_US.UTF-8
>> > ip=dhcp root=ubi0:arm9plf-rootfs ubi.mtd=3 rootfstype=ubif
>> > s noinitrd mtdparts=nand:768k(barebox),256k(bareboxenv),5M(kernel),-(fs)
>> > PID hash table entries: 256 (order: -2, 1024 bytes)
>> > Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
>> > Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
>> > Memory: 64MB = 64MB total
>> > Memory: 60440k/60440k available, 5096k reserved, 0K highmem
>> > Virtual kernel memory layout:
>> >     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
>> >     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
>> >     vmalloc : 0xc4800000 - 0xff000000   ( 936 MB)
>> >     lowmem  : 0xc0000000 - 0xc4000000   (  64 MB)
>> >     modules : 0xbf000000 - 0xc0000000   (  16 MB)
>> >       .text : 0xc0008000 - 0xc03f57dc   (4022 kB)
>> >       .init : 0xc03f6000 - 0xc04170dc   ( 133 kB)
>> >       .data : 0xc0418000 - 0xc043d720   ( 150 kB)
>> >        .bss : 0xc043d744 - 0xc046299c   ( 149 kB)
>> > NR_IRQS:85
>> > irq: clearing subpending status 00000002
>> > sched_clock: 32 bits at 200 Hz, resolution 5000000ns, wraps every
>> > 4294967291ms Console: colour dummy device 80x30
>> > Calibrating delay loop... 201.52 BogoMIPS (lpj=503808)
>> > pid_max: default: 32768 minimum: 301
>> > Mount-cache hash table entries: 512
>> > CPU: Testing write buffer coherency: ok
>> > Setting up static identity map for 0x3030ab68 - 0x3030abc0
>> > devtmpfs: initialized
>> > NET: Registered protocol family 16
>> > DMA: preallocated 256 KiB pool for atomic coherent allocations
>> > MINI2440: Option string mini2440=0tbc
>> > MINI2440: 't' ignored, touchscreen not compiled in
>> > MINI2440: LCD [0:240x320] 1:800x480 2:1024x768 3:320x240
>> > S3C2442: Initialising architecture
>> > S3C24XX DMA Driver, Copyright 2003-2006 Simtec Electronics
>> > DMA channel 0 at c4846000, irq 33
>> > DMA channel 1 at c4846040, irq 34
>> > DMA channel 2 at c4846080, irq 35
>> > DMA channel 3 at c48460c0, irq 36
>> > S3C244X: Clock Support, DVS off
>> > bio: create slab <bio-0> at 0
>> > SCSI subsystem initialized
>> > usbcore: registered new interface driver usbfs
>> > usbcore: registered new interface driver hub
>> > usbcore: registered new device driver usb
>> > NET: Registered protocol family 2
>> > TCP established hash table entries: 2048 (order: 2, 16384 bytes)
>> > TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
>> > TCP: Hash tables configured (established 2048 bind 2048)
>> > TCP: reno registered
>> > UDP hash table entries: 256 (order: 0, 4096 bytes)
>> > UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
>> > NET: Registered protocol family 1
>> > NetWinder Floating Point Emulator V0.97 (extended precision)
>> > NTFS driver 2.1.30 [Flags: R/O].
>> > fuse init (API version 7.20)
>> > msgmni has been set to 118
>> > io scheduler noop registered
>> > io scheduler deadline registered
>> > io scheduler cfq registered (default)
>> > Console: switching to colour frame buffer device 30x40
>> > s3c2410-lcd s3c2410-lcd: fb0: s3c2410fb frame buffer device
>> > s3c2440-uart.0: ttySAC0 at MMIO 0x50000000 (irq = 70) is a S3C2440
>> > console [ttySAC0] enabled
>> > s3c2440-uart.1: ttySAC1 at MMIO 0x50004000 (irq = 73) is a S3C2440
>> > s3c2440-uart.2: ttySAC2 at MMIO 0x50008000 (irq = 76) is a S3C2440
>> > brd: module loaded
>> > loop: module loaded
>> > s3c24xx-nand s3c2440-nand: Tacls=1, 9ns Twrph0=3 29ns, Twrph1=2 19ns
>> > s3c24xx-nand s3c2440-nand: NAND hardware ECC
>> > NAND device: Manufacturer ID: 0xec, Chip ID: 0xa1 (Samsung NAND 128MiB
>> 1,8V
>> > 8- bit), page size: 2048, OOB size: 64
>> > Scanning device for bad blocks
>> > 4 cmdlinepart partitions found on MTD device nand
>> > Creating 4 MTD partitions on "nand":
>> > 0x000000000000-0x0000000c0000 : "barebox"
>> > 0x0000000c0000-0x000000100000 : "bareboxenv"
>> > 0x000000100000-0x000000600000 : "kernel"
>> > 0x000000600000-0x000008000000 : "fs"
>> > ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
>> > mousedev: PS/2 mouse device common for all mice
>> > s3c-rtc s3c2410-rtc: rtc disabled, re-enabling
>> > s3c-rtc s3c2410-rtc: rtc core: registered s3c as rtc0
>> > s3c-rtc s3c2410-rtc: warning: invalid RTC value so initializing it
>> > i2c /dev entries driver
>> > sdhci: Secure Digital Host Controller Interface driver
>> > sdhci: Copyright(c) Pierre Ossman
>> > usbcore: registered new interface driver usbhid
>> > usbhid: USB HID core driver
>> > TCP: cubic registered
>> > NET: Registered protocol family 17
>> > UBI: attaching mtd3 to ubi0
>> > UBI: scanning is finished
>> > UBI warning: print_rsvd_warning: cannot reserve enough PEBs for bad PEB
>> > handling, reserved 9, need 20
>> > UBI: attached mtd3 (name "fs", size 122 MiB) to ubi0
>> > UBI: PEB size: 131072 bytes (128 KiB), LEB size: 129024 bytes
>> > UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 512
>> > UBI: VID header offset: 512 (aligned 512), data offset: 2048
>> > UBI: good PEBs: 976, bad PEBs: 0, corrupted PEBs: 0
>> > UBI: user volume: 1, internal volumes: 1, max. volumes count: 128
>> > UBI: max/mean erase counter: 4/1, WL threshold: 4096, image sequence
>> number:
>> > 0 UBI: available PEBs: 0, total reserved PEBs: 976, PEBs reserved for
>> bad
>> > PEB handling: 9
>> > UBI: background thread "ubi_bgt0d" started, PID 883
>> > s3c-rtc s3c2410-rtc: setting system clock to 2000-01-01 00:00:00 UTC
>> > (946684800)
>> >
>> > <<<<<<<<<<<<<<<<<<< stop some time <<<<<<<<<<<<<<
>> >
>> > UBIFS: background thread "ubifs_bgt0_0" started, PID 886
>> > UBIFS: recovery needed
>> > UBIFS: recovery completed
>> > UBIFS: mounted UBI device 0, volume 0, name "arm9plf-rootfs"(null)
>> > UBIFS: LEB size: 129024 bytes (126 KiB), min./max. I/O unit sizes: 2048
>> > bytes/2048 bytes
>> > UBIFS: FS size: 8773632 bytes (8 MiB, 68 LEBs), journal size 1548288
>> bytes
>> > (1 MiB, 12 LEBs)
>> > UBIFS: reserved for root: 0 bytes (0 KiB)
>> > UBIFS: media format: w4/r0 (latest is w4/r0), UUID 0D0C24B9-21D9-4769-
>> > B340-93B91C783DC3, small LPT model
>> > VFS: Mounted root (ubifs filesystem) on device 0:10.
>> > devtmpfs: mounted
>> > Freeing init memory: 132K
>> > INIT:
>> > <<<<<<<<<<<<<<<<<<< pause long time <<<<<<<<<<<<<<
>> > version 2.88 booting
>> > <<<<<<<<<<<<<<<<<<< pause long time <<<<<<<<<<<<<<
>> >
>> > INIT: Running /etc/rcS.d/S02banner.sh start...
>> > INIT: Running /etc/rcS.d/S02sysfs.sh start...
>> > INIT: Running /etc/rcS.d/S03udev start...
>> > Starting udev
>> > udevd[904]: starting version 182
>> > INIT: Running /etc/rcS.d/S04modutils.sh start...
>> > INIT: Running /etc/rcS.d/S06alignment.sh start...
>> > INIT: Running /etc/rcS.d/S07bootlogd start...
>> > Starting Bootlog daemon: bootlogd.
>> > INIT: Running /etc/rcS.d/S10checkroot.sh start...
>> > Activating swap
>> > INIT: Running /etc/rcS.d/S35mountall.sh start...
>> > Mounting local filesystems...
>> > INIT: Running /etc/rcS.d/S37populate-volatile.sh start...
>> > Populating volatile Filesystems.
>> > INIT: Running /etc/rcS.d/S38devpts.sh start...
>> > INIT: Running /etc/rcS.d/S39hostname.sh start...
>> > INIT: Running /etc/rcS.d/S40networking start...
>> > Configuring network interfaces... ifconfig: SIOCGIFFLAGS: No such device
>> > INIT: Running /etc/rcS.d/S45mountnfs.sh start...
>> > INIT: Running /etc/rcS.d/S55bootmisc.sh start...
>> > System time was Sat Jan  1 00:01:54 UTC 2000.
>> > Setting the System Clock using the Hardware Clock as reference...
>> > System Clock set. System local time is now Sat Jan  1 00:01:54 UTC 2000.
>> > Sun Jan 13 10:42:00 UTC 2013
>> > Saving the System Clock time to the Hardware Clock...
>> > Hardware Clock updated to Sun Jan 13 10:42:00 UTC 2013.
>> > INIT: Entering runlevel: 5
>> > INIT: Running /etc/rc5.d/S20hwclock.sh start...
>> > System time was Sun Jan 13 10:42:00 UTC 2013.
>> > Setting the System Clock using the Hardware Clock as reference...
>> > System Clock set. System local time is now Sun Jan 13 10:42:00 UTC 2013.
>> > INIT: Running /etc/rc5.d/S20syslog start...
>> > Starting syslogd/klogd: done
>> > INIT: Running /etc/rc5.d/S99rmnologin.sh start...
>> > INIT: Running /etc/rc5.d/S99stop-bootlogd start...
>> > Stopping Bootlog daemon: bootlogd.
>> >
>> > PANGU (Built by optimus 1.0) 1.3+snapshot-20130113 arm9plf ttySAC0
>> >
>> > <<<<<<<<<<<<<<<< no shell prompt <<<<<<<<<<<<<<<<<
>>
>
>

--047d7b2e0cabe3462504d34b3ac2
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-family:arial,sans-serif;font-size:13px=
">I have debugged the sysvinit, found that:</span><br><span style=3D"font-f=
amily:arial,sans-serif;font-size:13px">the 30seconds is about close(fd) in =
function:</span><br style=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">void print(char=
 *s) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (src/init.c)</=
span><div><br></div><div>and the &quot;close&quot; return 0.</div><div>why =
close will hang for 30seconds?</div>
<div>I asked in sysvinit-devel email list, no response.<br><br><span style=
=3D"font-family:arial,sans-serif;font-size:13px">anyone can give some sugge=
stion?</span><br style=3D"font-family:arial,sans-serif;font-size:13px"><spa=
n style=3D"font-family:arial,sans-serif;font-size:13px">THANKS</span><br st=
yle=3D"font-family:arial,sans-serif;font-size:13px">
<br style=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"fo=
nt-family:arial,sans-serif;font-size:13px">Nanjing Jilong</span><br style=
=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"font-family=
:arial,sans-serif;font-size:13px">Yi Qingliang</span><br>
</div></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">O=
n Mon, Jan 14, 2013 at 7:23 AM, Yi Qingliang <span dir=3D"ltr">&lt;<a href=
=3D"mailto:niqingliang2003@gmail.com" target=3D"_blank">niqingliang2003@gma=
il.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr">I have got something,<div>a=
fter change the &quot;DEBUG&quot; to &quot;1&quot; in sysvinit/src/init.h, =
the pause between and after INIT: version 2.88 booting missed.</div>
<div>add -i to the /sbin/agetty line in /etc/inittab, I got the login promp=
t, (it mean do not display issue).</div>
<div>but, but, what&#39;s the problem.</div></div><div class=3D"HOEnZb"><di=
v class=3D"h5"><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote=
">On Sun, Jan 13, 2013 at 4:29 PM, Yi Qingliang <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:niqingliang2003@gmail.com" target=3D"_blank">niqingliang2003@g=
mail.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">can you give some suggestions?<br>
I have struggled on it for 4days with a big headache.:(<br>
<div><div><br>
On Sunday, January 13, 2013 07:29:52 PM Yi Qingliang wrote:<br>
&gt; I have compiled a core-image-minimal running on my s3c2442 board.<br>
&gt; both the kernel and barebox are compiled based on mini2440.<br>
&gt;<br>
&gt; the fs is ubifs.<br>
&gt;<br>
&gt; after set rtc, stop several seconds.<br>
&gt; and the continue mount rootfs.<br>
&gt; when execute sysvinit,<br>
&gt; after print &quot;INIT:&quot;, stop long time, and then print &quot; v=
ersion 2.88 booting&quot;.<br>
&gt; stop long time, print a newline.<br>
&gt; stop long time, continue.<br>
&gt; and finally, no shell prompt occur.<br>
&gt;<br>
&gt; I have checked sysvinit code, the &quot;INIT:&quot; and &quot;version =
2.88 booting&quot; are<br>
&gt; only continuous print, it should not pause between them.<br>
&gt;<br>
&gt; I have changed ubifs to cramfs, no luck.<br>
&gt; and if I uncheck the s3c nand debug option in kernel configuration,<br=
>
&gt; I can get shell prompt, and login the system, and only that, the boot =
time<br>
&gt; no change.<br>
&gt;<br>
&gt; is there someone can help me?<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3DATTACHE=
 FILE=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;<br>
&gt;<br>
&gt; the serial output is:<br>
&gt;<br>
&gt; booting kernel from /dev/<a href=3D"http://nand0.kernel.bb" target=3D"=
_blank">nand0.kernel.bb</a><br>
&gt; commandline: console=3DttySAC0,115200 mini2440=3D0tbc LANG=3Den_US.UTF=
-8 ip=3Ddhcp<br>
&gt; root=3Dubi0:arm9plf-rootfs ubi.mtd=3D3 rootfstype=3Dubifs noinit<br>
&gt; rd mtdparts=3Dnand:768k(barebox),256k(bareboxenv),5M(kernel),-(fs)<br>
&gt; arch_number: 1999<br>
&gt; Uncompressing Linux... done, booting the kernel.<br>
&gt; Booting Linux on physical CPU 0<br>
&gt; Linux version 3.7.2 (ll@ll-pc) (gcc version 4.7.2 (GCC) ) #23 Sun Jan =
13<br>
&gt; 19:14:52 CST 2013<br>
&gt; CPU: ARM920T [41129200] revision 0 (ARMv4T), cr=3Dc0007177<br>
&gt; CPU: VIVT data cache, VIVT instruction cache<br>
&gt; Machine: NJJL2442<br>
&gt; Memory policy: ECC disabled, Data cache writeback<br>
&gt; CPU S3C2442B (id 0x32440aab)<br>
&gt; S3C24XX Clocks, Copyright 2004 Simtec Electronics<br>
&gt; S3C244X: core 405.000 MHz, memory 101.250 MHz, peripheral 50.625 MHz<b=
r>
&gt; CLOCK: Slow mode (1.500 MHz), fast, MPLL on, UPLL on<br>
&gt; Built 1 zonelists in Zone order, mobility grouping on. =A0Total pages:=
 16256<br>
&gt; Kernel command line: console=3DttySAC0,115200 mini2440=3D0tbc LANG=3De=
n_US.UTF-8<br>
&gt; ip=3Ddhcp root=3Dubi0:arm9plf-rootfs ubi.mtd=3D3 rootfstype=3Dubif<br>
&gt; s noinitrd mtdparts=3Dnand:768k(barebox),256k(bareboxenv),5M(kernel),-=
(fs)<br>
&gt; PID hash table entries: 256 (order: -2, 1024 bytes)<br>
&gt; Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)<br>
&gt; Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)<br>
&gt; Memory: 64MB =3D 64MB total<br>
&gt; Memory: 60440k/60440k available, 5096k reserved, 0K highmem<br>
&gt; Virtual kernel memory layout:<br>
&gt; =A0 =A0 vector =A0: 0xffff0000 - 0xffff1000 =A0 ( =A0 4 kB)<br>
&gt; =A0 =A0 fixmap =A0: 0xfff00000 - 0xfffe0000 =A0 ( 896 kB)<br>
&gt; =A0 =A0 vmalloc : 0xc4800000 - 0xff000000 =A0 ( 936 MB)<br>
&gt; =A0 =A0 lowmem =A0: 0xc0000000 - 0xc4000000 =A0 ( =A064 MB)<br>
&gt; =A0 =A0 modules : 0xbf000000 - 0xc0000000 =A0 ( =A016 MB)<br>
&gt; =A0 =A0 =A0 .text : 0xc0008000 - 0xc03f57dc =A0 (4022 kB)<br>
&gt; =A0 =A0 =A0 .init : 0xc03f6000 - 0xc04170dc =A0 ( 133 kB)<br>
&gt; =A0 =A0 =A0 .data : 0xc0418000 - 0xc043d720 =A0 ( 150 kB)<br>
&gt; =A0 =A0 =A0 =A0.bss : 0xc043d744 - 0xc046299c =A0 ( 149 kB)<br>
&gt; NR_IRQS:85<br>
&gt; irq: clearing subpending status 00000002<br>
&gt; sched_clock: 32 bits at 200 Hz, resolution 5000000ns, wraps every<br>
&gt; 4294967291ms Console: colour dummy device 80x30<br>
&gt; Calibrating delay loop... 201.52 BogoMIPS (lpj=3D503808)<br>
&gt; pid_max: default: 32768 minimum: 301<br>
&gt; Mount-cache hash table entries: 512<br>
&gt; CPU: Testing write buffer coherency: ok<br>
&gt; Setting up static identity map for 0x3030ab68 - 0x3030abc0<br>
&gt; devtmpfs: initialized<br>
&gt; NET: Registered protocol family 16<br>
&gt; DMA: preallocated 256 KiB pool for atomic coherent allocations<br>
&gt; MINI2440: Option string mini2440=3D0tbc<br>
&gt; MINI2440: &#39;t&#39; ignored, touchscreen not compiled in<br>
&gt; MINI2440: LCD [0:240x320] 1:800x480 2:1024x768 3:320x240<br>
&gt; S3C2442: Initialising architecture<br>
&gt; S3C24XX DMA Driver, Copyright 2003-2006 Simtec Electronics<br>
&gt; DMA channel 0 at c4846000, irq 33<br>
&gt; DMA channel 1 at c4846040, irq 34<br>
&gt; DMA channel 2 at c4846080, irq 35<br>
&gt; DMA channel 3 at c48460c0, irq 36<br>
&gt; S3C244X: Clock Support, DVS off<br>
&gt; bio: create slab &lt;bio-0&gt; at 0<br>
&gt; SCSI subsystem initialized<br>
&gt; usbcore: registered new interface driver usbfs<br>
&gt; usbcore: registered new interface driver hub<br>
&gt; usbcore: registered new device driver usb<br>
&gt; NET: Registered protocol family 2<br>
&gt; TCP established hash table entries: 2048 (order: 2, 16384 bytes)<br>
&gt; TCP bind hash table entries: 2048 (order: 1, 8192 bytes)<br>
&gt; TCP: Hash tables configured (established 2048 bind 2048)<br>
&gt; TCP: reno registered<br>
&gt; UDP hash table entries: 256 (order: 0, 4096 bytes)<br>
&gt; UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)<br>
&gt; NET: Registered protocol family 1<br>
&gt; NetWinder Floating Point Emulator V0.97 (extended precision)<br>
&gt; NTFS driver 2.1.30 [Flags: R/O].<br>
&gt; fuse init (API version 7.20)<br>
&gt; msgmni has been set to 118<br>
&gt; io scheduler noop registered<br>
&gt; io scheduler deadline registered<br>
&gt; io scheduler cfq registered (default)<br>
&gt; Console: switching to colour frame buffer device 30x40<br>
&gt; s3c2410-lcd s3c2410-lcd: fb0: s3c2410fb frame buffer device<br>
&gt; s3c2440-uart.0: ttySAC0 at MMIO 0x50000000 (irq =3D 70) is a S3C2440<b=
r>
&gt; console [ttySAC0] enabled<br>
&gt; s3c2440-uart.1: ttySAC1 at MMIO 0x50004000 (irq =3D 73) is a S3C2440<b=
r>
&gt; s3c2440-uart.2: ttySAC2 at MMIO 0x50008000 (irq =3D 76) is a S3C2440<b=
r>
&gt; brd: module loaded<br>
&gt; loop: module loaded<br>
&gt; s3c24xx-nand s3c2440-nand: Tacls=3D1, 9ns Twrph0=3D3 29ns, Twrph1=3D2 =
19ns<br>
&gt; s3c24xx-nand s3c2440-nand: NAND hardware ECC<br>
&gt; NAND device: Manufacturer ID: 0xec, Chip ID: 0xa1 (Samsung NAND 128MiB=
 1,8V<br>
&gt; 8- bit), page size: 2048, OOB size: 64<br>
&gt; Scanning device for bad blocks<br>
&gt; 4 cmdlinepart partitions found on MTD device nand<br>
&gt; Creating 4 MTD partitions on &quot;nand&quot;:<br>
&gt; 0x000000000000-0x0000000c0000 : &quot;barebox&quot;<br>
&gt; 0x0000000c0000-0x000000100000 : &quot;bareboxenv&quot;<br>
&gt; 0x000000100000-0x000000600000 : &quot;kernel&quot;<br>
&gt; 0x000000600000-0x000008000000 : &quot;fs&quot;<br>
&gt; ohci_hcd: USB 1.1 &#39;Open&#39; Host Controller (OHCI) Driver<br>
&gt; mousedev: PS/2 mouse device common for all mice<br>
&gt; s3c-rtc s3c2410-rtc: rtc disabled, re-enabling<br>
&gt; s3c-rtc s3c2410-rtc: rtc core: registered s3c as rtc0<br>
&gt; s3c-rtc s3c2410-rtc: warning: invalid RTC value so initializing it<br>
&gt; i2c /dev entries driver<br>
&gt; sdhci: Secure Digital Host Controller Interface driver<br>
&gt; sdhci: Copyright(c) Pierre Ossman<br>
&gt; usbcore: registered new interface driver usbhid<br>
&gt; usbhid: USB HID core driver<br>
&gt; TCP: cubic registered<br>
&gt; NET: Registered protocol family 17<br>
&gt; UBI: attaching mtd3 to ubi0<br>
&gt; UBI: scanning is finished<br>
&gt; UBI warning: print_rsvd_warning: cannot reserve enough PEBs for bad PE=
B<br>
&gt; handling, reserved 9, need 20<br>
&gt; UBI: attached mtd3 (name &quot;fs&quot;, size 122 MiB) to ubi0<br>
&gt; UBI: PEB size: 131072 bytes (128 KiB), LEB size: 129024 bytes<br>
&gt; UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 512<br>
&gt; UBI: VID header offset: 512 (aligned 512), data offset: 2048<br>
&gt; UBI: good PEBs: 976, bad PEBs: 0, corrupted PEBs: 0<br>
&gt; UBI: user volume: 1, internal volumes: 1, max. volumes count: 128<br>
&gt; UBI: max/mean erase counter: 4/1, WL threshold: 4096, image sequence n=
umber:<br>
&gt; 0 UBI: available PEBs: 0, total reserved PEBs: 976, PEBs reserved for =
bad<br>
&gt; PEB handling: 9<br>
&gt; UBI: background thread &quot;ubi_bgt0d&quot; started, PID 883<br>
&gt; s3c-rtc s3c2410-rtc: setting system clock to 2000-01-01 00:00:00 UTC<b=
r>
&gt; (946684800)<br>
&gt;<br>
&gt; &lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&l=
t;&lt; stop some time &lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&=
lt;<br>
&gt;<br>
&gt; UBIFS: background thread &quot;ubifs_bgt0_0&quot; started, PID 886<br>
&gt; UBIFS: recovery needed<br>
&gt; UBIFS: recovery completed<br>
&gt; UBIFS: mounted UBI device 0, volume 0, name &quot;arm9plf-rootfs&quot;=
(null)<br>
&gt; UBIFS: LEB size: 129024 bytes (126 KiB), min./max. I/O unit sizes: 204=
8<br>
&gt; bytes/2048 bytes<br>
&gt; UBIFS: FS size: 8773632 bytes (8 MiB, 68 LEBs), journal size 1548288 b=
ytes<br>
&gt; (1 MiB, 12 LEBs)<br>
&gt; UBIFS: reserved for root: 0 bytes (0 KiB)<br>
&gt; UBIFS: media format: w4/r0 (latest is w4/r0), UUID 0D0C24B9-21D9-4769-=
<br>
&gt; B340-93B91C783DC3, small LPT model<br>
&gt; VFS: Mounted root (ubifs filesystem) on device 0:10.<br>
&gt; devtmpfs: mounted<br>
&gt; Freeing init memory: 132K<br>
&gt; INIT:<br>
&gt; &lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&l=
t;&lt; pause long time &lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;=
&lt;<br>
&gt; version 2.88 booting<br>
&gt; &lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&l=
t;&lt; pause long time &lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;=
&lt;<br>
&gt;<br>
&gt; INIT: Running /etc/rcS.d/S02banner.sh start...<br>
&gt; INIT: Running /etc/rcS.d/S02sysfs.sh start...<br>
&gt; INIT: Running /etc/rcS.d/S03udev start...<br>
&gt; Starting udev<br>
&gt; udevd[904]: starting version 182<br>
&gt; INIT: Running /etc/rcS.d/S04modutils.sh start...<br>
&gt; INIT: Running /etc/rcS.d/S06alignment.sh start...<br>
&gt; INIT: Running /etc/rcS.d/S07bootlogd start...<br>
&gt; Starting Bootlog daemon: bootlogd.<br>
&gt; INIT: Running /etc/rcS.d/S10checkroot.sh start...<br>
&gt; Activating swap<br>
&gt; INIT: Running /etc/rcS.d/S35mountall.sh start...<br>
&gt; Mounting local filesystems...<br>
&gt; INIT: Running /etc/rcS.d/S37populate-volatile.sh start...<br>
&gt; Populating volatile Filesystems.<br>
&gt; INIT: Running /etc/rcS.d/S38devpts.sh start...<br>
&gt; INIT: Running /etc/rcS.d/S39hostname.sh start...<br>
&gt; INIT: Running /etc/rcS.d/S40networking start...<br>
&gt; Configuring network interfaces... ifconfig: SIOCGIFFLAGS: No such devi=
ce<br>
&gt; INIT: Running /etc/rcS.d/S45mountnfs.sh start...<br>
&gt; INIT: Running /etc/rcS.d/S55bootmisc.sh start...<br>
&gt; System time was Sat Jan =A01 00:01:54 UTC 2000.<br>
&gt; Setting the System Clock using the Hardware Clock as reference...<br>
&gt; System Clock set. System local time is now Sat Jan =A01 00:01:54 UTC 2=
000.<br>
&gt; Sun Jan 13 10:42:00 UTC 2013<br>
&gt; Saving the System Clock time to the Hardware Clock...<br>
&gt; Hardware Clock updated to Sun Jan 13 10:42:00 UTC 2013.<br>
&gt; INIT: Entering runlevel: 5<br>
&gt; INIT: Running /etc/rc5.d/S20hwclock.sh start...<br>
&gt; System time was Sun Jan 13 10:42:00 UTC 2013.<br>
&gt; Setting the System Clock using the Hardware Clock as reference...<br>
&gt; System Clock set. System local time is now Sun Jan 13 10:42:00 UTC 201=
3.<br>
&gt; INIT: Running /etc/rc5.d/S20syslog start...<br>
&gt; Starting syslogd/klogd: done<br>
&gt; INIT: Running /etc/rc5.d/S99rmnologin.sh start...<br>
&gt; INIT: Running /etc/rc5.d/S99stop-bootlogd start...<br>
&gt; Stopping Bootlog daemon: bootlogd.<br>
&gt;<br>
&gt; PANGU (Built by optimus 1.0) 1.3+snapshot-20130113 arm9plf ttySAC0<br>
&gt;<br>
&gt; &lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt; no sh=
ell prompt &lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;=
&lt;<br>
</div></div></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--047d7b2e0cabe3462504d34b3ac2--
