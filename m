Return-Path: <Arsalan_Awan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 6A0176C45A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 07:41:19 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=svr-ies-mbx-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
	id 1gcmlj-0004js-3H from Arsalan_Awan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Dec 2018 23:41:19 -0800
Received: from SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) by
	svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) with Microsoft SMTP
	Server (TLS) id 15.0.1320.4; Fri, 28 Dec 2018 07:41:15 +0000
Received: from SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17]) by
	SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17%22]) with
	mapi id 15.00.1320.000; Fri, 28 Dec 2018 07:41:14 +0000
From: "Awan, Arsalan" <Arsalan_Awan@mentor.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] util-linux-fdisk issues regarding auto-remounting of
	partitions
Thread-Index: AQHUnoB8bKjel6GRR0eQAvAgGvOZtQ==
Date: Fri, 28 Dec 2018 07:41:14 +0000
Message-ID: <1545982873773.23940@mentor.com>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
MIME-Version: 1.0
Subject: util-linux-fdisk issues regarding auto-remounting of partitions
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
X-List-Received-Date: Fri, 28 Dec 2018 07:41:19 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_154598287377323940mentorcom_"

--_000_154598287377323940mentorcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all!


I'm seeking some help/comments/fix from the community on the following issu=
e:


Case 1:

I'm facing issues while creating partitions using fdisk from util-linux (v2=
.32.1 from sumo) with regard to auto-mounting of removable/block devices.


After unmounting all the partitions of an attached USB/HDD:


    $ umount /dev/sda*


whenever I run fdisk on the USB/HDD to create partitions i.e.:


    $ fdisk /dev/sda


the kernel generates remove+change+add events on the /dev/sda* devices (see=
 logs at the end), and this is followed by remounting of all the /dev/sda* =
devices by udev automount.rules mount.sh.

So, before I could even create any partitions before writing the changes, t=
he existing partitions got auto-remounted.


Case 2:

On the other hand, I have Busybox (v1.27.2 from sumo) version of fdisk that=
 works perfectly fine! I was able to create partitions and write changes ju=
st fine!


Has anybody else come across such an issue, or is there any known bug-repor=
t/bug-fix for this? If so, we should probably fix it in oe-core as well.


LOGS:

Case 1:

{{{

root@snowyowl:~# opkg list-installed | grep util-linux
util-linux - 2.32.1-r0.0
util-linux-agetty - 2.32.1-r0.0
util-linux-blkid - 2.32.1-r0.0
util-linux-cfdisk - 2.32.1-r0.0
util-linux-fdisk - 2.32.1-r0.0
util-linux-fsck - 2.32.1-r0.0
util-linux-ionice - 2.32.1-r0.0
util-linux-losetup - 2.32.1-r0.0
util-linux-lsblk - 2.32.1-r0.0
util-linux-mkfs - 2.32.1-r0.0
util-linux-mount - 2.32.1-r0.0
util-linux-mountpoint - 2.32.1-r0.0
util-linux-prlimit - 2.32.1-r0.0
util-linux-readprofile - 2.32.1-r0.0
util-linux-sfdisk - 2.32.1-r0.0
util-linux-sulogin - 2.32.1-r0.0
util-linux-swaponoff - 2.32.1-r0.0
util-linux-switch-root - 2.32.1-r0.0
util-linux-umount - 2.32.1-r0.0
root@snowyowl:~#

root@snowyowl:~# fdisk --version
fdisk from util-linux 2.32.1
root@snowyowl:~#

root@snowyowl:~# df
Filesystem           1K-blocks      Used Available Use% Mounted on
devtmpfs              16403380         4  16403376   0% /dev
/dev/sdb1               785648    776980      8668  99% /media/boot-sdb1
/dev/sda3             10255672     23096   9708288   0% /media/sda3
/dev/sda1             10475504         8  10475496   0% /media/sda1
/dev/sda4            275653124     60448 261520648   0% /media/sda4
/dev/sda2             10321208     23028   9773892   0% /media/sda2
/dev/loop0              693348    661460         0 100% /
tmpfs                 16410896         0  16410896   0% /dev/shm
tmpfs                 16410896      9048  16401848   0% /run
tmpfs                 16410896         0  16410896   0% /sys/fs/cgroup
tmpfs                 16410896         0  16410896   0% /tmp
tmpfs                 16410896       156  16410740   0% /var/volatile
tmpfs                 16410896         0  16410896   0% /srv/nfs
root@snowyowl:~#
root@snowyowl:~#
root@snowyowl:~# umount /dev/sda*
umount: /dev/sda: not mounted.
root@snowyowl:~# fdisk /dev/sda

Welcome to fdisk (util-linux 2.32.1).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

 sda: sda1 sda2 sda3 sda4

Command (m for help): EXT4-fs (sda3): mounting ext3 file system using the e=
xt4 subsystem
EXT4-fs (sda3): mounted filesystem with ordered data mode. Opts: (null)
EXT4-fs (sda2): mounting ext2 file system using the ext4 subsystem
EXT4-fs (sda2): warning: mounting unchecked fs, running e2fsck is recommend=
ed
EXT4-fs (sda2): mounted filesystem without journal. Opts: (null)
FAT-fs (sda1): Volume was not properly unmounted. Some data may be corrupt.=
 Please run fsck.
EXT4-fs (sda4): mounted filesystem with ordered data mode. Opts: (null)



Command (m for help): q

root@snowyowl:~# df
Filesystem           1K-blocks      Used Available Use% Mounted on
devtmpfs              16403380         4  16403376   0% /dev
/dev/sdb1               785648    776980      8668  99% /media/boot-sdb1
/dev/loop0              693348    661460         0 100% /
tmpfs                 16410896         0  16410896   0% /dev/shm
tmpfs                 16410896      9056  16401840   0% /run
tmpfs                 16410896         0  16410896   0% /sys/fs/cgroup
tmpfs                 16410896         0  16410896   0% /tmp
tmpfs                 16410896       160  16410736   0% /var/volatile
tmpfs                 16410896         0  16410896   0% /srv/nfs
/dev/sda3             10255672     23096   9708288   0% /run/media/sda3
/dev/sda2             10321208     23028   9773892   0% /run/media/sda2
/dev/sda1             10475504         8  10475496   0% /run/media/sda1
/dev/sda4            275653124     60448 261520648   0% /run/media/sda4
root@snowyowl:~#
root@snowyowl:~#
root@snowyowl:~#
root@snowyowl:~# fdisk /dev/sda

Welcome to fdisk (util-linux 2.32.1).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.


Command (m for help): p
Disk /dev/sda: 298.1 GiB, 320072933376 bytes, 625142448 sectors
Units: sectors of 1 * 512 =3D 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: EB25BC79-F9F4-5B4C-B3B5-C5D820D2041A

Device        Start       End   Sectors   Size Type
/dev/sda1      2048  20973567  20971520    10G Linux filesystem
/dev/sda2  20973568  41945087  20971520    10G Linux filesystem
/dev/sda3  41945088  62916607  20971520    10G Linux filesystem
/dev/sda4  62916608 625142414 562225807 268.1G Linux filesystem

Command (m for help): q

root@snowyowl:~#


-------------------------------------------------------------------
>>> umount /dev/sda*

root@snowyowl:~# udevadm monitor
calling: monitor
monitor will print the received events for:
UDEV - the event which udev sends out after rule processing
KERNEL - the kernel uevent

>>> fdisk started

KERNEL[447.164696] remove   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda1 (block)
KERNEL[447.164756] remove   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda2 (block)
KERNEL[447.164803] remove   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda3 (block)
KERNEL[447.164840] remove   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda4 (block)
KERNEL[447.169275] change   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda (block)
KERNEL[447.169346] add      /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda1 (block)
KERNEL[447.169777] add      /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda2 (block)
KERNEL[447.169873] add      /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda3 (block)
KERNEL[447.169962] add      /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda4 (block)
UDEV  [447.185874] remove   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda1 (block)
UDEV  [447.187145] remove   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda3 (block)
UDEV  [447.187303] remove   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda4 (block)
UDEV  [447.188680] remove   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda2 (block)
UDEV  [447.319973] change   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda (block)
UDEV  [448.594787] add      /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda3 (block)
UDEV  [448.758076] add      /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda2 (block)
UDEV  [449.014413] add      /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda1 (block)
UDEV  [449.040579] add      /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda4 (block)

>>> fdisk closed

KERNEL[453.116231] change   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda (block)
KERNEL[453.116441] change   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda1 (block)
KERNEL[453.116594] change   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda2 (block)
KERNEL[453.116781] change   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda3 (block)
KERNEL[453.116968] change   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda4 (block)
UDEV  [453.124438] change   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda (block)
UDEV  [453.434036] change   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda2 (block)
UDEV  [453.484742] change   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda3 (block)
UDEV  [453.670409] change   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda4 (block)
UDEV  [453.682091] change   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda1 (block)

>>> fdisk started
>>> fdisk closed

KERNEL[491.540790] change   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda (block)
KERNEL[491.540877] change   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda1 (block)
KERNEL[491.540930] change   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda2 (block)
KERNEL[491.540994] change   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda3 (block)
KERNEL[491.541049] change   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda4 (block)
UDEV  [491.547813] change   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda (block)
UDEV  [491.549508] change   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda1 (block)
UDEV  [491.551876] change   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda2 (block)
UDEV  [491.552411] change   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda3 (block)
UDEV  [491.552619] change   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda4 (block)


}}}


Case 2:

{{{

root@snowyowl:~# fdisk --version
fdisk: unrecognized option '--version'
BusyBox v1.27.2 (2018-11-30 17:33:13 UTC) multi-call binary.

Usage: fdisk [-ul] [-C CYLINDERS] [-H HEADS] [-S SECTORS] [-b SSZ] DISK
root@snowyowl:~#
root@snowyowl:~#
root@snowyowl:~# uname -a
Linux snowyowl 4.14.71-yocto-standard #1 SMP PREEMPT Sun Dec 23 12:44:13 UT=
C 2018 x86_64 GNU/Linux
root@snowyowl:~#
root@snowyowl:~# df
Filesystem           1K-blocks      Used Available Use% Mounted on
none                  16403532         4  16403528   0% /dev
/dev/sda3             10255672     23096   9708288   0% /media/sda3
/dev/sda2             10321208     23028   9773892   0% /media/sda2
/dev/sda1             10475504         8  10475496   0% /media/sda1
/dev/sda4            275653124     60448 261520648   0% /media/sda4
/dev/sdb1               417640    407656      9984  98% /media/realroot
/dev/loop0              367315    300955     42876  88% /
tmpfs                 16410988         0  16410988   0% /dev/shm
tmpfs                 16410988      9088  16401900   0% /run
tmpfs                 16410988         0  16410988   0% /sys/fs/cgroup
tmpfs                 16410988         0  16410988   0% /tmp
tmpfs                 16410988        20  16410968   0% /var/volatile
root@snowyowl:~#
root@snowyowl:~# umount /dev/sda*
umount: /dev/sda: not mounted.
root@snowyowl:~#
root@snowyowl:~# df
Filesystem           1K-blocks      Used Available Use% Mounted on
none                  16403532         4  16403528   0% /dev
/dev/sdb1               417640    407656      9984  98% /media/realroot
/dev/loop0              367315    300955     42876  88% /
tmpfs                 16410988         0  16410988   0% /dev/shm
tmpfs                 16410988      9088  16401900   0% /run
tmpfs                 16410988         0  16410988   0% /sys/fs/cgroup
tmpfs                 16410988         0  16410988   0% /tmp
tmpfs                 16410988        20  16410968   0% /var/volatile
root@snowyowl:~#
root@snowyowl:~# fdisk /dev/sda
Found valid GPT with protective MBR; using GPT


Command (m for help): p
Disk /dev/sda: 625142448 sectors, 2141M
Logical sector size: 512
Disk identifier (GUID): eb25bc79-f9f4-5b4c-b3b5-c5d820d2041a
Partition table holds up to 128 entries
First usable sector is 2048, last usable sector is 625142414

Number  Start (sector)    End (sector)  Size Name
     1            2048        20973567 10.0G
     2        20973568        41945087 10.0G
     3        41945088        62916607 10.0G
     4        62916608       625142414  268G

Command (m for help): q

root@snowyowl:~#  sda: sda1 sda2 sda3 sda4
EXT4-fs (sda2): mounting ext2 file system using the ext4 subsystem
EXT4-fs (sda3): mounting ext3 file system using the ext4 subsystem
EXT4-fs (sda2): warning: mounting unchecked fs, running e2fsck is recommend=
ed
EXT4-fs (sda2): mounted filesystem without journal. Opts: (null)
EXT4-fs (sda3): mounted filesystem with ordered data mode. Opts: (null)
FAT-fs (sda1): Volume was not properly unmounted. Some data may be corrupt.=
 Please run fsck.
EXT4-fs (sda4): mounted filesystem with ordered data mode. Opts: (null)

root@snowyowl:~# df
Filesystem           1K-blocks      Used Available Use% Mounted on
none                  16403532         4  16403528   0% /dev
/dev/sdb1               417640    407656      9984  98% /media/realroot
/dev/loop0              367315    300955     42876  88% /
tmpfs                 16410988         0  16410988   0% /dev/shm
tmpfs                 16410988      9096  16401892   0% /run
tmpfs                 16410988         0  16410988   0% /sys/fs/cgroup
tmpfs                 16410988         0  16410988   0% /tmp
tmpfs                 16410988        24  16410964   0% /var/volatile
/dev/sda2             10321208     23028   9773892   0% /run/media/sda2
/dev/sda3             10255672     23096   9708288   0% /run/media/sda3
/dev/sda1             10475504         8  10475496   0% /run/media/sda1
/dev/sda4            275653124     60448 261520648   0% /run/media/sda4
root@snowyowl:~#
root@snowyowl:~# umount /dev/sda*
umount: /dev/sda: not mounted.
root@snowyowl:~#
root@snowyowl:~# fdisk /dev/sda
Found valid GPT with protective MBR; using GPT


Command (m for help): p
Disk /dev/sda: 625142448 sectors, 2141M
Logical sector size: 512
Disk identifier (GUID): eb25bc79-f9f4-5b4c-b3b5-c5d820d2041a
Partition table holds up to 128 entries
First usable sector is 2048, last usable sector is 625142414

Number  Start (sector)    End (sector)  Size Name
     1            2048        20973567 10.0G
     2        20973568        41945087 10.0G
     3        41945088        62916607 10.0G
     4        62916608       625142414  268G

Command (m for help):
Command (m for help): q

root@snowyowl:~#  sda: sda1 sda2 sda3 sda4
EXT4-fs (sda2): mounting ext2 file system using the ext4 subsystem
EXT4-fs (sda3): mounting ext3 file system using the ext4 subsystem
EXT4-fs (sda2): warning: mounting unchecked fs, running e2fsck is recommend=
ed
EXT4-fs (sda2): mounted filesystem without journal. Opts: (null)
EXT4-fs (sda3): mounted filesystem with ordered data mode. Opts: (null)
FAT-fs (sda1): Volume was not properly unmounted. Some data may be corrupt.=
 Please run fsck.
EXT4-fs (sda4): mounted filesystem with ordered data mode. Opts: (null)

root@snowyowl:~# df
Filesystem           1K-blocks      Used Available Use% Mounted on
none                  16403532         4  16403528   0% /dev
/dev/sdb1               417640    407656      9984  98% /media/realroot
/dev/loop0              367315    300955     42876  88% /
tmpfs                 16410988         0  16410988   0% /dev/shm
tmpfs                 16410988      9096  16401892   0% /run
tmpfs                 16410988         0  16410988   0% /sys/fs/cgroup
tmpfs                 16410988         0  16410988   0% /tmp
tmpfs                 16410988        24  16410964   0% /var/volatile
/dev/sda3             10255672     23096   9708288   0% /run/media/sda3
/dev/sda2             10321208     23028   9773892   0% /run/media/sda2
/dev/sda1             10475504         8  10475496   0% /run/media/sda1
/dev/sda4            275653124     60448 261520648   0% /run/media/sda4
root@snowyowl:~#
root@snowyowl:~# fdisk /dev/sda
Found valid GPT with protective MBR; using GPT


Command (m for help): p
Disk /dev/sda: 625142448 sectors, 2141M
Logical sector size: 512
Disk identifier (GUID): eb25bc79-f9f4-5b4c-b3b5-c5d820d2041a
Partition table holds up to 128 entries
First usable sector is 2048, last usable sector is 625142414

Number  Start (sector)    End (sector)  Size Name
     1            2048        20973567 10.0G
     2        20973568        41945087 10.0G
     3        41945088        62916607 10.0G
     4        62916608       625142414  268G

Command (m for help): q

root@snowyowl:~#


----------------------------------------------------------

>>> umount /dev/sda*

root@snowyowl:~# udevadm monitor -k
monitor will print the received events for:
KERNEL - the kernel uevent

>>> fdisk started
>>> fdisk closed

KERNEL[307.038078] remove   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda1 (block)
KERNEL[307.038134] remove   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda2 (block)
KERNEL[307.038178] remove   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda3 (block)
KERNEL[307.038223] remove   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda4 (block)
KERNEL[307.073028] change   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda (block)
KERNEL[307.073608] add      /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda1 (block)
KERNEL[307.073691] add      /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda2 (block)
KERNEL[307.073734] add      /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda3 (block)
KERNEL[307.073784] add      /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda4 (block)

>>> umount /dev/sda*
>>> fdisk started
>>> fdisk closed

KERNEL[344.850456] remove   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda1 (block)
KERNEL[344.850509] remove   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda2 (block)
KERNEL[344.850547] remove   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda3 (block)
KERNEL[344.850662] remove   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda4 (block)
KERNEL[344.885418] change   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda (block)
KERNEL[344.885518] add      /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda1 (block)
KERNEL[344.885577] add      /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda2 (block)
KERNEL[344.885632] add      /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda3 (block)
KERNEL[344.885692] add      /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda4 (block)

>>> fdisk started
>>> fdisk closed

KERNEL[362.515656] change   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda (block)
KERNEL[362.515852] change   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda1 (block)
KERNEL[362.515916] change   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda2 (block)
KERNEL[362.515970] change   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda3 (block)
KERNEL[362.516030] change   /devices/pci0000:00/0000:00:08.1/0000:03:00.2/a=
ta1/host0/target0:0:0/0:0:0:0/block/sda/sda4 (block)

}}}


Thanks


-

Arsalan

--_000_154598287377323940mentorcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none"><!-- p { margin-top: 0px; m=
argin-bottom: 0px; }--></style>
</head>
<body dir=3D"ltr" style=3D"font-size:12pt;color:#000000;background-color:#F=
FFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<p>Hi all!<br>
</p>
<p><br>
</p>
<p>I'm seeking some help/comments/fix from the community&nbsp;on the follow=
ing issue:<br>
</p>
<p><br>
</p>
<p><strong>Case 1:</strong><br>
</p>
<p>I'm facing issues while creating partitions&nbsp;using&nbsp;fdisk from u=
til-linux (v2.32.1&nbsp;from&nbsp;sumo) with regard to auto-mounting of rem=
ovable/block&nbsp;devices.<br>
</p>
<p><span style=3D"font-size: 12pt;"><br>
</span></p>
<p><span style=3D"font-size: 12pt;">A</span><span style=3D"font-size: 12pt;=
">f</span><span style=3D"font-size: 12pt;">ter un</span><span style=3D"font=
-size: 12pt;">mounti</span><span style=3D"font-size: 12pt;">ng all the part=
itions of an attached USB/HDD:</span></p>
<p><span style=3D"font-size: 12pt;"><br>
</span></p>
<p><span style=3D"font-size: 12pt;">&nbsp; &nbsp; $ umount /dev/sda*</span>=
</p>
<p><span style=3D"font-size: 12pt;"><br>
</span></p>
<p><span style=3D"font-size: 12pt;"></span><span style=3D"font-size: 12pt;"=
>whenever I run fdisk on the USB/HDD to create partitions&nbsp;i.e.</span><=
span style=3D"font-size: 12pt;">:</span><br>
</p>
<p><span style=3D"font-size: 12pt;"><br>
</span></p>
<p><span style=3D"font-size: 12pt;">&nbsp; &nbsp;&nbsp;$&nbsp;</span><span =
style=3D"font-size: 12pt;">fdisk /dev/sda</span><span style=3D"font-size: 1=
2pt;">&nbsp;</span><br>
</p>
<p><br>
</p>
<p>the kernel generates remove&#43;change&#43;add events on the /dev/sda* d=
evices (see&nbsp;logs at the end),&nbsp;and this is&nbsp;followed&nbsp;by r=
emounting of all the /dev/sda* devices by&nbsp;udev automount.rules mount.s=
h.<br>
</p>
<p>So, before I could even create any partitions before writing the changes=
, the existing partitions got auto-remounted.<br>
</p>
<p><br>
</p>
<p><strong>Case 2:</strong><br>
</p>
<p>On the other hand, I have Busybox&nbsp;(v1.27.2 from sumo)&nbsp;version =
of fdisk that works perfectly fine! I was able to create partitions and wri=
te changes just fine!<br>
</p>
<p><br>
</p>
<p><strong>Has anybody else come across such an issue, or is there any know=
n bug-report/bug-fix for this? If so, we should probably fix it in oe-core =
as well.</strong><br>
</p>
<p><br>
</p>
<p><strong>LOGS:</strong><br>
</p>
<p><strong>Case 1:</strong><br>
</p>
<p>{{{</p>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~# opkg list-installed
 | grep util-linux</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">util-linux - 2.32.1-r0.0</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">util-linux-agetty - 2.32.1-r0.0</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">util-linux-blkid - 2.32.1-r0.0</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">util-linux-cfdisk - 2.32.1-r0.0</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">util-linux-fdisk - 2.32.1-r0.0</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">util-linux-fsck - 2.32.1-r0.0</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">util-linux-ionice - 2.32.1-r0.0</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">util-linux-losetup - 2.32.1-r0.0</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">util-linux-lsblk - 2.32.1-r0.0</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">util-linux-mkfs - 2.32.1-r0.0</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">util-linux-mount - 2.32.1-r0.0</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">util-linux-mountpoint - 2.32.1-r0.0</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">util-linux-prlimit - 2.32.1-r0.0</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">util-linux-readprofile - 2.32.1-r0.0</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">util-linux-sfdisk - 2.32.1-r0.0</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">util-linux-sulogin - 2.32.1-r0.0</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">util-linux-swaponoff - 2.32.1-r0.0</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">util-linux-switch-root - 2.32.1-r0.0</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">util-linux-umount - 2.32.1-r0.0</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~#&nbsp;</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~# fdisk --version</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">fdisk from util-linux 2.32.1</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~#&nbsp;</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~# df</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Filesystem&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1K-blocks&nbsp;
 &nbsp; &nbsp; Used Available Use% Mounted on</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">devtmpfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 16403380&n=
bsp;
 &nbsp; &nbsp; &nbsp; &nbsp;4&nbsp; 16403376&nbsp; &nbsp;0% /dev</span></sp=
an></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/sdb1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;785=
648&nbsp;
 &nbsp; 776980&nbsp; &nbsp; &nbsp; 8668&nbsp; 99% /media/boot-sdb1</span></=
span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/sda3&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;10255672&n=
bsp;
 &nbsp; &nbsp;23096&nbsp; &nbsp;9708288&nbsp; &nbsp;0% /media/sda3</span></=
span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/sda1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;10475504&n=
bsp;
 &nbsp; &nbsp; &nbsp; &nbsp;8&nbsp; 10475496&nbsp; &nbsp;0% /media/sda1</sp=
an></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/sda4&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 275653124&nbsp;
 &nbsp; &nbsp;60448 261520648&nbsp; &nbsp;0% /media/sda4</span></span></div=
>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/sda2&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;10321208&n=
bsp;
 &nbsp; &nbsp;23028&nbsp; &nbsp;9773892&nbsp; &nbsp;0% /media/sda2</span></=
span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/loop0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 693348&n=
bsp;
 &nbsp; 661460&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 100% /</span></span></div=
>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">tmpfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
16410896&nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp;0&nbsp; 16410896&nbsp; &nbsp;0% /dev/shm</span>=
</span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">tmpfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
16410896&nbsp;
 &nbsp; &nbsp; 9048&nbsp; 16401848&nbsp; &nbsp;0% /run</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">tmpfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
16410896&nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp;0&nbsp; 16410896&nbsp; &nbsp;0% /sys/fs/cgroup<=
/span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">tmpfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
16410896&nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp;0&nbsp; 16410896&nbsp; &nbsp;0% /tmp</span></sp=
an></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">tmpfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
16410896&nbsp;
 &nbsp; &nbsp; &nbsp;156&nbsp; 16410740&nbsp; &nbsp;0% /var/volatile</span>=
</span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">tmpfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
16410896&nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp;0&nbsp; 16410896&nbsp; &nbsp;0% /srv/nfs</span>=
</span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~#&nbsp;</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~#&nbsp;</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~# umount /dev/sda*</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">umount: /dev/sda: not mounted.</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~# fdisk /dev/sda</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Welcome to fdisk (util-linux
 2.32.1).</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Changes will remain in memory
 only, until you decide to write them.</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Be careful before using the
 write command.</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">&nbsp;sda: sda1 sda2 sda3 sda4</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Command (m for help): EXT4-fs
 (sda3): mounting ext3 file system using the ext4 subsystem</span></span></=
div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">EXT4-fs (sda3): mounted filesystem
 with ordered data mode. Opts: (null)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">EXT4-fs (sda2): mounting ext2
 file system using the ext4 subsystem</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">EXT4-fs (sda2): warning: mounting
 unchecked fs, running e2fsck is recommended</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">EXT4-fs (sda2): mounted filesystem
 without journal. Opts: (null)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">FAT-fs (sda1): Volume was not
 properly unmounted. Some data may be corrupt. Please run fsck.</span></spa=
n></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">EXT4-fs (sda4): mounted filesystem
 with ordered data mode. Opts: (null)</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Command (m for help): q</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~# df&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
 &nbsp; &nbsp;&nbsp;</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Filesystem&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1K-blocks&nbsp;
 &nbsp; &nbsp; Used Available Use% Mounted on</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">devtmpfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 16403380&n=
bsp;
 &nbsp; &nbsp; &nbsp; &nbsp;4&nbsp; 16403376&nbsp; &nbsp;0% /dev</span></sp=
an></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/sdb1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;785=
648&nbsp;
 &nbsp; 776980&nbsp; &nbsp; &nbsp; 8668&nbsp; 99% /media/boot-sdb1</span></=
span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/loop0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 693348&n=
bsp;
 &nbsp; 661460&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 100% /</span></span></div=
>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">tmpfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
16410896&nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp;0&nbsp; 16410896&nbsp; &nbsp;0% /dev/shm</span>=
</span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">tmpfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
16410896&nbsp;
 &nbsp; &nbsp; 9056&nbsp; 16401840&nbsp; &nbsp;0% /run</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">tmpfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
16410896&nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp;0&nbsp; 16410896&nbsp; &nbsp;0% /sys/fs/cgroup<=
/span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">tmpfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
16410896&nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp;0&nbsp; 16410896&nbsp; &nbsp;0% /tmp</span></sp=
an></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">tmpfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
16410896&nbsp;
 &nbsp; &nbsp; &nbsp;160&nbsp; 16410736&nbsp; &nbsp;0% /var/volatile</span>=
</span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">tmpfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
16410896&nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp;0&nbsp; 16410896&nbsp; &nbsp;0% /srv/nfs</span>=
</span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/sda3&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;10255672&n=
bsp;
 &nbsp; &nbsp;23096&nbsp; &nbsp;9708288&nbsp; &nbsp;0% /run/media/sda3</spa=
n></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/sda2&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;10321208&n=
bsp;
 &nbsp; &nbsp;23028&nbsp; &nbsp;9773892&nbsp; &nbsp;0% /run/media/sda2</spa=
n></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/sda1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;10475504&n=
bsp;
 &nbsp; &nbsp; &nbsp; &nbsp;8&nbsp; 10475496&nbsp; &nbsp;0% /run/media/sda1=
</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/sda4&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 275653124&nbsp;
 &nbsp; &nbsp;60448 261520648&nbsp; &nbsp;0% /run/media/sda4</span></span><=
/div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~#&nbsp;</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~#&nbsp;</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~#&nbsp;</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~# fdisk /dev/sda</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Welcome to fdisk (util-linux
 2.32.1).</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Changes will remain in memory
 only, until you decide to write them.</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Be careful before using the
 write command.</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Command (m for help): p</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Disk /dev/sda: 298.1 GiB, 320072933376
 bytes, 625142448 sectors</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Units: sectors of 1 * 512 =3D
 512 bytes</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Sector size (logical/physical):
 512 bytes / 512 bytes</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">I/O size (minimum/optimal):
 512 bytes / 512 bytes</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Disklabel type: gpt</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Disk identifier: EB25BC79-F9F4-5B4C-B3B5-C5D820D2041A</span></span>=
</div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Device&nbsp; &nbsp; &nbsp; &nbsp; Start&nbsp; &nbsp; &nbsp; &nbsp;E=
nd&nbsp;
 &nbsp;Sectors&nbsp; &nbsp;Size Type</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/sda1&nbsp; &nbsp; &nbsp; 2048&nbsp; 20973567&nbsp;
 20971520&nbsp; &nbsp; 10G Linux filesystem</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/sda2&nbsp; 20973568&nbsp; 41945087&nbsp;
 20971520&nbsp; &nbsp; 10G Linux filesystem</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/sda3&nbsp; 41945088&nbsp; 62916607&nbsp;
 20971520&nbsp; &nbsp; 10G Linux filesystem</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/sda4&nbsp; 62916608 625142414
 562225807 268.1G Linux filesystem</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Command (m for help): q</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~#&nbsp;</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">-------------------------------------------------------------------=
</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">&gt;&gt;&gt; umount /dev/sda*</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~# udevadm monitor</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">calling: monitor</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">monitor will print the received
 events for:</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">UDEV - the event which udev
 sends out after rule processing</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL - the kernel uevent</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">&gt;&gt;&gt; fdisk started</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[447.164696] remove&nbsp; &nbsp;/devices/pci0000:00/0000:00:0=
8.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda/sda1
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[447.164756] remove&nbsp; &nbsp;/devices/pci0000:00/0000:00:0=
8.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda/sda2
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[447.164803] remove&nbsp; &nbsp;/devices/pci0000:00/0000:00:0=
8.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda/sda3
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[447.164840] remove&nbsp; &nbsp;/devices/pci0000:00/0000:00:0=
8.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda/sda4
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[447.169275] change&nbsp; &nbsp;/devices/pci0000:00/0000:00:0=
8.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[447.169346] add&nbsp; &nbsp; &nbsp;
 /devices/pci0000:00/0000:00:08.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0=
:0/block/sda/sda1 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[447.169777] add&nbsp; &nbsp; &nbsp;
 /devices/pci0000:00/0000:00:08.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0=
:0/block/sda/sda2 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[447.169873] add&nbsp; &nbsp; &nbsp;
 /devices/pci0000:00/0000:00:08.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0=
:0/block/sda/sda3 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[447.169962] add&nbsp; &nbsp; &nbsp;
 /devices/pci0000:00/0000:00:08.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0=
:0/block/sda/sda4 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">UDEV&nbsp; [447.185874] remove&nbsp; &nbsp;/devices/pci0000:00/0000=
:00:08.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda/sda1
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">UDEV&nbsp; [447.187145] remove&nbsp; &nbsp;/devices/pci0000:00/0000=
:00:08.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda/sda3
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">UDEV&nbsp; [447.187303] remove&nbsp; &nbsp;/devices/pci0000:00/0000=
:00:08.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda/sda4
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">UDEV&nbsp; [447.188680] remove&nbsp; &nbsp;/devices/pci0000:00/0000=
:00:08.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda/sda2
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">UDEV&nbsp; [447.319973] change&nbsp; &nbsp;/devices/pci0000:00/0000=
:00:08.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">UDEV&nbsp; [448.594787] add&nbsp; &nbsp; &nbsp;
 /devices/pci0000:00/0000:00:08.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0=
:0/block/sda/sda3 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">UDEV&nbsp; [448.758076] add&nbsp; &nbsp; &nbsp;
 /devices/pci0000:00/0000:00:08.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0=
:0/block/sda/sda2 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">UDEV&nbsp; [449.014413] add&nbsp; &nbsp; &nbsp;
 /devices/pci0000:00/0000:00:08.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0=
:0/block/sda/sda1 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">UDEV&nbsp; [449.040579] add&nbsp; &nbsp; &nbsp;
 /devices/pci0000:00/0000:00:08.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0=
:0/block/sda/sda4 (block)</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">&gt;&gt;&gt; fdisk closed</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[453.116231] change&nbsp; &nbsp;/devices/pci0000:00/0000:00:0=
8.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[453.116441] change&nbsp; &nbsp;/devices/pci0000:00/0000:00:0=
8.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda/sda1
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[453.116594] change&nbsp; &nbsp;/devices/pci0000:00/0000:00:0=
8.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda/sda2
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[453.116781] change&nbsp; &nbsp;/devices/pci0000:00/0000:00:0=
8.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda/sda3
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[453.116968] change&nbsp; &nbsp;/devices/pci0000:00/0000:00:0=
8.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda/sda4
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">UDEV&nbsp; [453.124438] change&nbsp; &nbsp;/devices/pci0000:00/0000=
:00:08.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">UDEV&nbsp; [453.434036] change&nbsp; &nbsp;/devices/pci0000:00/0000=
:00:08.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda/sda2
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">UDEV&nbsp; [453.484742] change&nbsp; &nbsp;/devices/pci0000:00/0000=
:00:08.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda/sda3
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">UDEV&nbsp; [453.670409] change&nbsp; &nbsp;/devices/pci0000:00/0000=
:00:08.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda/sda4
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">UDEV&nbsp; [453.682091] change&nbsp; &nbsp;/devices/pci0000:00/0000=
:00:08.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda/sda1
 (block)</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">&gt;&gt;&gt; fdisk started</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">&gt;&gt;&gt; fdisk closed</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[491.540790] change&nbsp; &nbsp;/devices/pci0000:00/0000:00:0=
8.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[491.540877] change&nbsp; &nbsp;/devices/pci0000:00/0000:00:0=
8.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda/sda1
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[491.540930] change&nbsp; &nbsp;/devices/pci0000:00/0000:00:0=
8.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda/sda2
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[491.540994] change&nbsp; &nbsp;/devices/pci0000:00/0000:00:0=
8.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda/sda3
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[491.541049] change&nbsp; &nbsp;/devices/pci0000:00/0000:00:0=
8.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda/sda4
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">UDEV&nbsp; [491.547813] change&nbsp; &nbsp;/devices/pci0000:00/0000=
:00:08.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">UDEV&nbsp; [491.549508] change&nbsp; &nbsp;/devices/pci0000:00/0000=
:00:08.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda/sda1
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">UDEV&nbsp; [491.551876] change&nbsp; &nbsp;/devices/pci0000:00/0000=
:00:08.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda/sda2
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">UDEV&nbsp; [491.552411] change&nbsp; &nbsp;/devices/pci0000:00/0000=
:00:08.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda/sda3
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">UDEV&nbsp; [491.552619] change&nbsp; &nbsp;/devices/pci0000:00/0000=
:00:08.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda/sda4
 (block)</span></span><br>
</div>
<p><br>
</p>
<p>}}}<br>
</p>
<p><br>
</p>
<p><strong>Case 2:</strong><br>
</p>
<p>{{{<br>
</p>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~# fdisk --version</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">fdisk: unrecognized option '--version'</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">BusyBox v1.27.2 (2018-11-30
 17:33:13 UTC) multi-call binary.</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Usage: fdisk [-ul] [-C CYLINDERS]
 [-H HEADS] [-S SECTORS] [-b SSZ] DISK</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~#&nbsp;</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~#&nbsp;</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~# uname -a</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Linux snowyowl 4.14.71-yocto-standard
 #1 SMP PREEMPT Sun Dec 23 12:44:13 UTC 2018 x86_64 GNU/Linux</span></span>=
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~#&nbsp;</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~# df&nbsp; &nbsp; &nbsp;</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Filesystem&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1K-blocks&nbsp;
 &nbsp; &nbsp; Used Available Use% Mounted on</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">none&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
16403532&nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp;4&nbsp; 16403528&nbsp; &nbsp;0% /dev</span></sp=
an></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/sda3&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;10255672&n=
bsp;
 &nbsp; &nbsp;23096&nbsp; &nbsp;9708288&nbsp; &nbsp;0% /media/sda3</span></=
span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/sda2&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;10321208&n=
bsp;
 &nbsp; &nbsp;23028&nbsp; &nbsp;9773892&nbsp; &nbsp;0% /media/sda2</span></=
span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/sda1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;10475504&n=
bsp;
 &nbsp; &nbsp; &nbsp; &nbsp;8&nbsp; 10475496&nbsp; &nbsp;0% /media/sda1</sp=
an></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/sda4&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 275653124&nbsp;
 &nbsp; &nbsp;60448 261520648&nbsp; &nbsp;0% /media/sda4</span></span></div=
>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/sdb1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;417=
640&nbsp;
 &nbsp; 407656&nbsp; &nbsp; &nbsp; 9984&nbsp; 98% /media/realroot</span></s=
pan></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/loop0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 367315&n=
bsp;
 &nbsp; 300955&nbsp; &nbsp; &nbsp;42876&nbsp; 88% /</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">tmpfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
16410988&nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp;0&nbsp; 16410988&nbsp; &nbsp;0% /dev/shm</span>=
</span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">tmpfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
16410988&nbsp;
 &nbsp; &nbsp; 9088&nbsp; 16401900&nbsp; &nbsp;0% /run</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">tmpfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
16410988&nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp;0&nbsp; 16410988&nbsp; &nbsp;0% /sys/fs/cgroup<=
/span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">tmpfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
16410988&nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp;0&nbsp; 16410988&nbsp; &nbsp;0% /tmp</span></sp=
an></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">tmpfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
16410988&nbsp;
 &nbsp; &nbsp; &nbsp; 20&nbsp; 16410968&nbsp; &nbsp;0% /var/volatile</span>=
</span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~#&nbsp;</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~# umount /dev/sda*</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">umount: /dev/sda: not mounted.</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~#&nbsp;</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~# df</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Filesystem&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1K-blocks&nbsp;
 &nbsp; &nbsp; Used Available Use% Mounted on</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">none&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
16403532&nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp;4&nbsp; 16403528&nbsp; &nbsp;0% /dev</span></sp=
an></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/sdb1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;417=
640&nbsp;
 &nbsp; 407656&nbsp; &nbsp; &nbsp; 9984&nbsp; 98% /media/realroot</span></s=
pan></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/loop0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 367315&n=
bsp;
 &nbsp; 300955&nbsp; &nbsp; &nbsp;42876&nbsp; 88% /</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">tmpfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
16410988&nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp;0&nbsp; 16410988&nbsp; &nbsp;0% /dev/shm</span>=
</span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">tmpfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
16410988&nbsp;
 &nbsp; &nbsp; 9088&nbsp; 16401900&nbsp; &nbsp;0% /run</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">tmpfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
16410988&nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp;0&nbsp; 16410988&nbsp; &nbsp;0% /sys/fs/cgroup<=
/span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">tmpfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
16410988&nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp;0&nbsp; 16410988&nbsp; &nbsp;0% /tmp</span></sp=
an></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">tmpfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
16410988&nbsp;
 &nbsp; &nbsp; &nbsp; 20&nbsp; 16410968&nbsp; &nbsp;0% /var/volatile</span>=
</span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~#&nbsp;</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~# fdisk /dev/sda</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Found valid GPT with protective
 MBR; using GPT</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Command (m for help): p</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Disk /dev/sda: 625142448 sectors,
 2141M</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Logical sector size: 512</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Disk identifier (GUID): eb25bc79-f9f4-5b4c-b3b5-c5d820d2041a</span>=
</span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Partition table holds up to
 128 entries</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">First usable sector is 2048,
 last usable sector is 625142414</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Number&nbsp; Start (sector)&nbsp; &nbsp; End
 (sector)&nbsp; Size Name</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">&nbsp; &nbsp; &nbsp;1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2048=
&nbsp; &nbsp; &nbsp;
 &nbsp; 20973567 10.0G&nbsp;</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">&nbsp; &nbsp; &nbsp;2&nbsp; &nbsp; &nbsp; &nbsp; 20973568&nbsp; &nb=
sp; &nbsp;
 &nbsp; 41945087 10.0G&nbsp;</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">&nbsp; &nbsp; &nbsp;3&nbsp; &nbsp; &nbsp; &nbsp; 41945088&nbsp; &nb=
sp; &nbsp;
 &nbsp; 62916607 10.0G&nbsp;</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">&nbsp; &nbsp; &nbsp;4&nbsp; &nbsp; &nbsp; &nbsp; 62916608&nbsp; &nb=
sp; &nbsp;
 &nbsp;625142414&nbsp; 268G&nbsp;</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Command (m for help): q</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~#&nbsp; sda: sda1
 sda2 sda3 sda4</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">EXT4-fs (sda2): mounting ext2
 file system using the ext4 subsystem</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">EXT4-fs (sda3): mounting ext3
 file system using the ext4 subsystem</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">EXT4-fs (sda2): warning: mounting
 unchecked fs, running e2fsck is recommended</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">EXT4-fs (sda2): mounted filesystem
 without journal. Opts: (null)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">EXT4-fs (sda3): mounted filesystem
 with ordered data mode. Opts: (null)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">FAT-fs (sda1): Volume was not
 properly unmounted. Some data may be corrupt. Please run fsck.</span></spa=
n></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">EXT4-fs (sda4): mounted filesystem
 with ordered data mode. Opts: (null)</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~# df</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Filesystem&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1K-blocks&nbsp;
 &nbsp; &nbsp; Used Available Use% Mounted on</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">none&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
16403532&nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp;4&nbsp; 16403528&nbsp; &nbsp;0% /dev</span></sp=
an></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/sdb1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;417=
640&nbsp;
 &nbsp; 407656&nbsp; &nbsp; &nbsp; 9984&nbsp; 98% /media/realroot</span></s=
pan></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/loop0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 367315&n=
bsp;
 &nbsp; 300955&nbsp; &nbsp; &nbsp;42876&nbsp; 88% /</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">tmpfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
16410988&nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp;0&nbsp; 16410988&nbsp; &nbsp;0% /dev/shm</span>=
</span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">tmpfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
16410988&nbsp;
 &nbsp; &nbsp; 9096&nbsp; 16401892&nbsp; &nbsp;0% /run</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">tmpfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
16410988&nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp;0&nbsp; 16410988&nbsp; &nbsp;0% /sys/fs/cgroup<=
/span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">tmpfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
16410988&nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp;0&nbsp; 16410988&nbsp; &nbsp;0% /tmp</span></sp=
an></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">tmpfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
16410988&nbsp;
 &nbsp; &nbsp; &nbsp; 24&nbsp; 16410964&nbsp; &nbsp;0% /var/volatile</span>=
</span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/sda2&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;10321208&n=
bsp;
 &nbsp; &nbsp;23028&nbsp; &nbsp;9773892&nbsp; &nbsp;0% /run/media/sda2</spa=
n></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/sda3&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;10255672&n=
bsp;
 &nbsp; &nbsp;23096&nbsp; &nbsp;9708288&nbsp; &nbsp;0% /run/media/sda3</spa=
n></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/sda1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;10475504&n=
bsp;
 &nbsp; &nbsp; &nbsp; &nbsp;8&nbsp; 10475496&nbsp; &nbsp;0% /run/media/sda1=
</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/sda4&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 275653124&nbsp;
 &nbsp; &nbsp;60448 261520648&nbsp; &nbsp;0% /run/media/sda4</span></span><=
/div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~#&nbsp;</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~# umount /dev/sda*</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">umount: /dev/sda: not mounted.</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~#&nbsp;</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~# fdisk /dev/sda</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Found valid GPT with protective
 MBR; using GPT</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Command (m for help): p</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Disk /dev/sda: 625142448 sectors,
 2141M</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Logical sector size: 512</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Disk identifier (GUID): eb25bc79-f9f4-5b4c-b3b5-c5d820d2041a</span>=
</span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Partition table holds up to
 128 entries</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">First usable sector is 2048,
 last usable sector is 625142414</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Number&nbsp; Start (sector)&nbsp; &nbsp; End
 (sector)&nbsp; Size Name</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">&nbsp; &nbsp; &nbsp;1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2048=
&nbsp; &nbsp; &nbsp;
 &nbsp; 20973567 10.0G&nbsp;</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">&nbsp; &nbsp; &nbsp;2&nbsp; &nbsp; &nbsp; &nbsp; 20973568&nbsp; &nb=
sp; &nbsp;
 &nbsp; 41945087 10.0G&nbsp;</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">&nbsp; &nbsp; &nbsp;3&nbsp; &nbsp; &nbsp; &nbsp; 41945088&nbsp; &nb=
sp; &nbsp;
 &nbsp; 62916607 10.0G&nbsp;</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">&nbsp; &nbsp; &nbsp;4&nbsp; &nbsp; &nbsp; &nbsp; 62916608&nbsp; &nb=
sp; &nbsp;
 &nbsp;625142414&nbsp; 268G&nbsp;</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Command (m for help):&nbsp;</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Command (m for help): q</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~#&nbsp; sda: sda1
 sda2 sda3 sda4</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">EXT4-fs (sda2): mounting ext2
 file system using the ext4 subsystem</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">EXT4-fs (sda3): mounting ext3
 file system using the ext4 subsystem</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">EXT4-fs (sda2): warning: mounting
 unchecked fs, running e2fsck is recommended</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">EXT4-fs (sda2): mounted filesystem
 without journal. Opts: (null)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">EXT4-fs (sda3): mounted filesystem
 with ordered data mode. Opts: (null)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">FAT-fs (sda1): Volume was not
 properly unmounted. Some data may be corrupt. Please run fsck.</span></spa=
n></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">EXT4-fs (sda4): mounted filesystem
 with ordered data mode. Opts: (null)</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~# df</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Filesystem&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1K-blocks&nbsp;
 &nbsp; &nbsp; Used Available Use% Mounted on</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">none&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
16403532&nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp;4&nbsp; 16403528&nbsp; &nbsp;0% /dev</span></sp=
an></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/sdb1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;417=
640&nbsp;
 &nbsp; 407656&nbsp; &nbsp; &nbsp; 9984&nbsp; 98% /media/realroot</span></s=
pan></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/loop0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 367315&n=
bsp;
 &nbsp; 300955&nbsp; &nbsp; &nbsp;42876&nbsp; 88% /</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">tmpfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
16410988&nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp;0&nbsp; 16410988&nbsp; &nbsp;0% /dev/shm</span>=
</span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">tmpfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
16410988&nbsp;
 &nbsp; &nbsp; 9096&nbsp; 16401892&nbsp; &nbsp;0% /run</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">tmpfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
16410988&nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp;0&nbsp; 16410988&nbsp; &nbsp;0% /sys/fs/cgroup<=
/span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">tmpfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
16410988&nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp;0&nbsp; 16410988&nbsp; &nbsp;0% /tmp</span></sp=
an></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">tmpfs&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
16410988&nbsp;
 &nbsp; &nbsp; &nbsp; 24&nbsp; 16410964&nbsp; &nbsp;0% /var/volatile</span>=
</span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/sda3&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;10255672&n=
bsp;
 &nbsp; &nbsp;23096&nbsp; &nbsp;9708288&nbsp; &nbsp;0% /run/media/sda3</spa=
n></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/sda2&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;10321208&n=
bsp;
 &nbsp; &nbsp;23028&nbsp; &nbsp;9773892&nbsp; &nbsp;0% /run/media/sda2</spa=
n></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/sda1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;10475504&n=
bsp;
 &nbsp; &nbsp; &nbsp; &nbsp;8&nbsp; 10475496&nbsp; &nbsp;0% /run/media/sda1=
</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">/dev/sda4&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 275653124&nbsp;
 &nbsp; &nbsp;60448 261520648&nbsp; &nbsp;0% /run/media/sda4</span></span><=
/div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~#&nbsp;</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~# fdisk /dev/sda</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Found valid GPT with protective
 MBR; using GPT</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Command (m for help): p</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Disk /dev/sda: 625142448 sectors,
 2141M</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Logical sector size: 512</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Disk identifier (GUID): eb25bc79-f9f4-5b4c-b3b5-c5d820d2041a</span>=
</span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Partition table holds up to
 128 entries</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">First usable sector is 2048,
 last usable sector is 625142414</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Number&nbsp; Start (sector)&nbsp; &nbsp; End
 (sector)&nbsp; Size Name</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">&nbsp; &nbsp; &nbsp;1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2048=
&nbsp; &nbsp; &nbsp;
 &nbsp; 20973567 10.0G&nbsp;</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">&nbsp; &nbsp; &nbsp;2&nbsp; &nbsp; &nbsp; &nbsp; 20973568&nbsp; &nb=
sp; &nbsp;
 &nbsp; 41945087 10.0G&nbsp;</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">&nbsp; &nbsp; &nbsp;3&nbsp; &nbsp; &nbsp; &nbsp; 41945088&nbsp; &nb=
sp; &nbsp;
 &nbsp; 62916607 10.0G&nbsp;</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">&nbsp; &nbsp; &nbsp;4&nbsp; &nbsp; &nbsp; &nbsp; 62916608&nbsp; &nb=
sp; &nbsp;
 &nbsp;625142414&nbsp; 268G&nbsp;</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">Command (m for help): q</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~#&nbsp;</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">----------------------------------------------------------</span></=
span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">&gt;&gt;&gt; umount /dev/sda*</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">root@snowyowl:~# udevadm monitor
 -k</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">monitor will print the received
 events for:</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL - the kernel uevent</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">&gt;&gt;&gt; fdisk started</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">&gt;&gt;&gt; fdisk closed</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[307.038078] remove&nbsp; &nbsp;/devices/pci0000:00/0000:00:0=
8.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda/sda1
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[307.038134] remove&nbsp; &nbsp;/devices/pci0000:00/0000:00:0=
8.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda/sda2
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[307.038178] remove&nbsp; &nbsp;/devices/pci0000:00/0000:00:0=
8.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda/sda3
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[307.038223] remove&nbsp; &nbsp;/devices/pci0000:00/0000:00:0=
8.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda/sda4
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[307.073028] change&nbsp; &nbsp;/devices/pci0000:00/0000:00:0=
8.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[307.073608] add&nbsp; &nbsp; &nbsp;
 /devices/pci0000:00/0000:00:08.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0=
:0/block/sda/sda1 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[307.073691] add&nbsp; &nbsp; &nbsp;
 /devices/pci0000:00/0000:00:08.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0=
:0/block/sda/sda2 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[307.073734] add&nbsp; &nbsp; &nbsp;
 /devices/pci0000:00/0000:00:08.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0=
:0/block/sda/sda3 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[307.073784] add&nbsp; &nbsp; &nbsp;
 /devices/pci0000:00/0000:00:08.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0=
:0/block/sda/sda4 (block)</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">&gt;&gt;&gt; umount /dev/sda*</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">&gt;&gt;&gt; fdisk started</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">&gt;&gt;&gt; fdisk closed</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[344.850456] remove&nbsp; &nbsp;/devices/pci0000:00/0000:00:0=
8.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda/sda1
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[344.850509] remove&nbsp; &nbsp;/devices/pci0000:00/0000:00:0=
8.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda/sda2
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[344.850547] remove&nbsp; &nbsp;/devices/pci0000:00/0000:00:0=
8.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda/sda3
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[344.850662] remove&nbsp; &nbsp;/devices/pci0000:00/0000:00:0=
8.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda/sda4
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[344.885418] change&nbsp; &nbsp;/devices/pci0000:00/0000:00:0=
8.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[344.885518] add&nbsp; &nbsp; &nbsp;
 /devices/pci0000:00/0000:00:08.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0=
:0/block/sda/sda1 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[344.885577] add&nbsp; &nbsp; &nbsp;
 /devices/pci0000:00/0000:00:08.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0=
:0/block/sda/sda2 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[344.885632] add&nbsp; &nbsp; &nbsp;
 /devices/pci0000:00/0000:00:08.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0=
:0/block/sda/sda3 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[344.885692] add&nbsp; &nbsp; &nbsp;
 /devices/pci0000:00/0000:00:08.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0=
:0/block/sda/sda4 (block)</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">&gt;&gt;&gt; fdisk started</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">&gt;&gt;&gt; fdisk closed</span></span></div>
<div><br style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);">
</div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[362.515656] change&nbsp; &nbsp;/devices/pci0000:00/0000:00:0=
8.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[362.515852] change&nbsp; &nbsp;/devices/pci0000:00/0000:00:0=
8.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda/sda1
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[362.515916] change&nbsp; &nbsp;/devices/pci0000:00/0000:00:0=
8.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda/sda2
 (block)</span></span></div>
<div><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color=
: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span =
style=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);">KERNEL[362.515970] change&nbsp; &nbsp;/devices/pci0000:00/0000:00:0=
8.1/0000:03:00.2/ata1/host0/target0:0:0/0:0:0:0/block/sda/sda3
 (block)</span></span></div>
<div><span style=3D"font-size: 9pt; color: rgb(114, 50, 173); text-decorati=
on: none solid rgb(114, 50, 173);"><span style=3D"font-family: Consolas, mo=
nospace; color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50,=
 173);"><span style=3D"color: rgb(114, 50, 173); text-decoration: none soli=
d rgb(114, 50, 173);">KERNEL[362.516030]
 change&nbsp; &nbsp;/devices/pci0000:00/0000:00:08.1/0000:03:00.2/ata1/host=
0/target0:0:0/0:0:0:0/block/sda/sda4 (block)</span></span><br style=3D"font=
-family: Consolas, monospace; color: rgb(114, 50, 173); text-decoration: no=
ne solid rgb(114, 50, 173);">
</span></div>
<p><span style=3D"font-family: Consolas, monospace; font-size: 9pt; color: =
rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 173);"><span st=
yle=3D"color: rgb(114, 50, 173); text-decoration: none solid rgb(114, 50, 1=
73);">}}}</span></span><br>
</p>
<p><br>
</p>
<p>Thanks<br>
</p>
<p><br>
</p>
<p>-<br>
</p>
<p>Arsalan<br>
</p>
</body>
</html>

--_000_154598287377323940mentorcom_--
