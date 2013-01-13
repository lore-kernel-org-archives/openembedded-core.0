Received: from mail-pb0-f45.google.com ([209.85.160.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang2003@gmail.com>) id 1TuM0Z-0003t8-5m
	for openembedded-core@lists.openembedded.org;
	Sun, 13 Jan 2013 12:46:03 +0100
Received: by mail-pb0-f45.google.com with SMTP id mc8so1684220pbc.32
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Jan 2013 03:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:user-agent:mime-version
	:content-transfer-encoding:content-type;
	bh=TYbrOd+c0PUlkh0x3r1IY/voEpnMt40WII3ANTahx/M=;
	b=EHUbB81veDUSxiJql8XbCl8WWiAc+4N2Qdhg7MOjPhCJcRu9DadqNtNPTUuNhnS4XD
	ZXBr7cJzQLisD1+/FMhmXH7l3aE6hvk9JvZQemEX7S3nvG/7wKG1oRGk0fHZW4pD3f8A
	sAbAwOirEZqbzf5U3c4z/KxiAVX3NkByLR+IuqdTMIH6vlCxA0yfi5+Q/qFvP3FaOh4z
	SKKVG7mS6hy+GpWknWkBYJ6ajqmQXsUXBQ5t1I4ptRlAfmfgI50AWmoxnCxFLfbmr4VW
	3BqVgoEftBB2d6gPUGwgFhPGDMSwMF4jXR6sOV85xpQ9e9M/hns/2/Gk2Kw3bfE2XJYX
	BzbA==
X-Received: by 10.66.89.199 with SMTP id bq7mr222909689pab.26.1358076628865;
	Sun, 13 Jan 2013 03:30:28 -0800 (PST)
Received: from ll-pc.localnet ([183.209.41.151])
	by mx.google.com with ESMTPS id mn4sm6215339pbc.12.2013.01.13.03.30.26
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 13 Jan 2013 03:30:27 -0800 (PST)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Sun, 13 Jan 2013 19:29:52 +0800
Message-ID: <10956581.fOyYazISSg@ll-pc>
User-Agent: KMail/4.9.5 (Linux/3.6.11-1-ARCH; KDE/4.9.5; x86_64; ; )
MIME-Version: 1.0
Subject: core-image-minimal boot problem
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
X-List-Received-Date: Sun, 13 Jan 2013 11:46:03 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

I have compiled a core-image-minimal running on my s3c2442 board.
both the kernel and barebox are compiled based on mini2440.

the fs is ubifs.

after set rtc, stop several seconds.
and the continue mount rootfs.
when execute sysvinit,
after print "INIT:", stop long time, and then print " version 2.88 booting".
stop long time, print a newline.
stop long time, continue.
and finally, no shell prompt occur.

I have checked sysvinit code, the "INIT:" and "version 2.88 booting" are only 
continuous print, it should not pause between them.

I have changed ubifs to cramfs, no luck.
and if I uncheck the s3c nand debug option in kernel configuration,
I can get shell prompt, and login the system, and only that, the boot time no 
change.

is there someone can help me?



=====================ATTACHE FILE=================


the serial output is:

booting kernel from /dev/nand0.kernel.bb
commandline: console=ttySAC0,115200 mini2440=0tbc LANG=en_US.UTF-8 ip=dhcp 
root=ubi0:arm9plf-rootfs ubi.mtd=3 rootfstype=ubifs noinit
rd mtdparts=nand:768k(barebox),256k(bareboxenv),5M(kernel),-(fs)
arch_number: 1999
Uncompressing Linux... done, booting the kernel.
Booting Linux on physical CPU 0
Linux version 3.7.2 (ll@ll-pc) (gcc version 4.7.2 (GCC) ) #23 Sun Jan 13 
19:14:52 CST 2013
CPU: ARM920T [41129200] revision 0 (ARMv4T), cr=c0007177
CPU: VIVT data cache, VIVT instruction cache
Machine: NJJL2442
Memory policy: ECC disabled, Data cache writeback
CPU S3C2442B (id 0x32440aab)
S3C24XX Clocks, Copyright 2004 Simtec Electronics
S3C244X: core 405.000 MHz, memory 101.250 MHz, peripheral 50.625 MHz
CLOCK: Slow mode (1.500 MHz), fast, MPLL on, UPLL on
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 16256
Kernel command line: console=ttySAC0,115200 mini2440=0tbc LANG=en_US.UTF-8 
ip=dhcp root=ubi0:arm9plf-rootfs ubi.mtd=3 rootfstype=ubif
s noinitrd mtdparts=nand:768k(barebox),256k(bareboxenv),5M(kernel),-(fs)
PID hash table entries: 256 (order: -2, 1024 bytes)
Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
Memory: 64MB = 64MB total
Memory: 60440k/60440k available, 5096k reserved, 0K highmem
Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
    vmalloc : 0xc4800000 - 0xff000000   ( 936 MB)
    lowmem  : 0xc0000000 - 0xc4000000   (  64 MB)
    modules : 0xbf000000 - 0xc0000000   (  16 MB)
      .text : 0xc0008000 - 0xc03f57dc   (4022 kB)
      .init : 0xc03f6000 - 0xc04170dc   ( 133 kB)
      .data : 0xc0418000 - 0xc043d720   ( 150 kB)
       .bss : 0xc043d744 - 0xc046299c   ( 149 kB)
NR_IRQS:85
irq: clearing subpending status 00000002
sched_clock: 32 bits at 200 Hz, resolution 5000000ns, wraps every 4294967291ms
Console: colour dummy device 80x30
Calibrating delay loop... 201.52 BogoMIPS (lpj=503808)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
Setting up static identity map for 0x3030ab68 - 0x3030abc0
devtmpfs: initialized
NET: Registered protocol family 16
DMA: preallocated 256 KiB pool for atomic coherent allocations
MINI2440: Option string mini2440=0tbc
MINI2440: 't' ignored, touchscreen not compiled in
MINI2440: LCD [0:240x320] 1:800x480 2:1024x768 3:320x240
S3C2442: Initialising architecture
S3C24XX DMA Driver, Copyright 2003-2006 Simtec Electronics
DMA channel 0 at c4846000, irq 33
DMA channel 1 at c4846040, irq 34
DMA channel 2 at c4846080, irq 35
DMA channel 3 at c48460c0, irq 36
S3C244X: Clock Support, DVS off
bio: create slab <bio-0> at 0
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
NET: Registered protocol family 2
TCP established hash table entries: 2048 (order: 2, 16384 bytes)
TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
TCP: Hash tables configured (established 2048 bind 2048)
TCP: reno registered
UDP hash table entries: 256 (order: 0, 4096 bytes)
UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
NET: Registered protocol family 1
NetWinder Floating Point Emulator V0.97 (extended precision)
NTFS driver 2.1.30 [Flags: R/O].
fuse init (API version 7.20)
msgmni has been set to 118
io scheduler noop registered
io scheduler deadline registered
io scheduler cfq registered (default)
Console: switching to colour frame buffer device 30x40
s3c2410-lcd s3c2410-lcd: fb0: s3c2410fb frame buffer device
s3c2440-uart.0: ttySAC0 at MMIO 0x50000000 (irq = 70) is a S3C2440
console [ttySAC0] enabled
s3c2440-uart.1: ttySAC1 at MMIO 0x50004000 (irq = 73) is a S3C2440
s3c2440-uart.2: ttySAC2 at MMIO 0x50008000 (irq = 76) is a S3C2440
brd: module loaded
loop: module loaded
s3c24xx-nand s3c2440-nand: Tacls=1, 9ns Twrph0=3 29ns, Twrph1=2 19ns
s3c24xx-nand s3c2440-nand: NAND hardware ECC
NAND device: Manufacturer ID: 0xec, Chip ID: 0xa1 (Samsung NAND 128MiB 1,8V 8-
bit), page size: 2048, OOB size: 64
Scanning device for bad blocks
4 cmdlinepart partitions found on MTD device nand
Creating 4 MTD partitions on "nand":
0x000000000000-0x0000000c0000 : "barebox"
0x0000000c0000-0x000000100000 : "bareboxenv"
0x000000100000-0x000000600000 : "kernel"
0x000000600000-0x000008000000 : "fs"
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
mousedev: PS/2 mouse device common for all mice
s3c-rtc s3c2410-rtc: rtc disabled, re-enabling
s3c-rtc s3c2410-rtc: rtc core: registered s3c as rtc0
s3c-rtc s3c2410-rtc: warning: invalid RTC value so initializing it
i2c /dev entries driver
sdhci: Secure Digital Host Controller Interface driver
sdhci: Copyright(c) Pierre Ossman
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
TCP: cubic registered
NET: Registered protocol family 17
UBI: attaching mtd3 to ubi0
UBI: scanning is finished
UBI warning: print_rsvd_warning: cannot reserve enough PEBs for bad PEB 
handling, reserved 9, need 20
UBI: attached mtd3 (name "fs", size 122 MiB) to ubi0
UBI: PEB size: 131072 bytes (128 KiB), LEB size: 129024 bytes
UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 512
UBI: VID header offset: 512 (aligned 512), data offset: 2048
UBI: good PEBs: 976, bad PEBs: 0, corrupted PEBs: 0
UBI: user volume: 1, internal volumes: 1, max. volumes count: 128
UBI: max/mean erase counter: 4/1, WL threshold: 4096, image sequence number: 0
UBI: available PEBs: 0, total reserved PEBs: 976, PEBs reserved for bad PEB 
handling: 9
UBI: background thread "ubi_bgt0d" started, PID 883
s3c-rtc s3c2410-rtc: setting system clock to 2000-01-01 00:00:00 UTC 
(946684800)

<<<<<<<<<<<<<<<<<<< stop some time <<<<<<<<<<<<<<

UBIFS: background thread "ubifs_bgt0_0" started, PID 886
UBIFS: recovery needed
UBIFS: recovery completed
UBIFS: mounted UBI device 0, volume 0, name "arm9plf-rootfs"(null)
UBIFS: LEB size: 129024 bytes (126 KiB), min./max. I/O unit sizes: 2048 
bytes/2048 bytes
UBIFS: FS size: 8773632 bytes (8 MiB, 68 LEBs), journal size 1548288 bytes (1 
MiB, 12 LEBs)
UBIFS: reserved for root: 0 bytes (0 KiB)
UBIFS: media format: w4/r0 (latest is w4/r0), UUID 0D0C24B9-21D9-4769-
B340-93B91C783DC3, small LPT model
VFS: Mounted root (ubifs filesystem) on device 0:10.
devtmpfs: mounted
Freeing init memory: 132K
INIT: 
<<<<<<<<<<<<<<<<<<< pause long time <<<<<<<<<<<<<<
version 2.88 booting
<<<<<<<<<<<<<<<<<<< pause long time <<<<<<<<<<<<<<

INIT: Running /etc/rcS.d/S02banner.sh start...
INIT: Running /etc/rcS.d/S02sysfs.sh start...
INIT: Running /etc/rcS.d/S03udev start...
Starting udev
udevd[904]: starting version 182
INIT: Running /etc/rcS.d/S04modutils.sh start...
INIT: Running /etc/rcS.d/S06alignment.sh start...
INIT: Running /etc/rcS.d/S07bootlogd start...
Starting Bootlog daemon: bootlogd.
INIT: Running /etc/rcS.d/S10checkroot.sh start...
Activating swap
INIT: Running /etc/rcS.d/S35mountall.sh start...
Mounting local filesystems...
INIT: Running /etc/rcS.d/S37populate-volatile.sh start...
Populating volatile Filesystems.
INIT: Running /etc/rcS.d/S38devpts.sh start...
INIT: Running /etc/rcS.d/S39hostname.sh start...
INIT: Running /etc/rcS.d/S40networking start...
Configuring network interfaces... ifconfig: SIOCGIFFLAGS: No such device
INIT: Running /etc/rcS.d/S45mountnfs.sh start...
INIT: Running /etc/rcS.d/S55bootmisc.sh start...
System time was Sat Jan  1 00:01:54 UTC 2000.
Setting the System Clock using the Hardware Clock as reference...
System Clock set. System local time is now Sat Jan  1 00:01:54 UTC 2000.
Sun Jan 13 10:42:00 UTC 2013
Saving the System Clock time to the Hardware Clock...
Hardware Clock updated to Sun Jan 13 10:42:00 UTC 2013.
INIT: Entering runlevel: 5
INIT: Running /etc/rc5.d/S20hwclock.sh start...
System time was Sun Jan 13 10:42:00 UTC 2013.
Setting the System Clock using the Hardware Clock as reference...
System Clock set. System local time is now Sun Jan 13 10:42:00 UTC 2013.
INIT: Running /etc/rc5.d/S20syslog start...
Starting syslogd/klogd: done
INIT: Running /etc/rc5.d/S99rmnologin.sh start...
INIT: Running /etc/rc5.d/S99stop-bootlogd start...
Stopping Bootlog daemon: bootlogd.

PANGU (Built by optimus 1.0) 1.3+snapshot-20130113 arm9plf ttySAC0

<<<<<<<<<<<<<<<< no shell prompt <<<<<<<<<<<<<<<<<



