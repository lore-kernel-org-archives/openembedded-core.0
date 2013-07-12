Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A05086B03A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 09:29:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6C9TXDE004725
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 02:29:33 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 12 Jul 2013 02:29:32 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Jul 2013 17:29:24 +0800
Message-ID: <cover.1373599041.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/6] fix xuser write to usb storage failed
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
X-List-Received-Date: Fri, 12 Jul 2013 09:29:32 -0000
Content-Type: text/plain

Test Case

* Steps
1) preparation
...
one target: atom-pc
two usb sticks: one for boot and install, another for plug test, they are both vfat filesystem.
...

2) config 
conf/local.conf:
...
MACHINE ?= "atom-pc"
...

3) build image
bitbake core-image-sato

4) load image to atom-pc
Test Case TC-2927: boot and install from usb 

5) open a terminal/ssh of atom-pc
Test Case TC-2955: remote access by ssh 

6) hotplug test: usb stick with vfat filesystem is accessible
Test Case TC-2947: usb mount
Test Case TC-2950: usb write files
Test Case TC-2948: usb read files
Test Case TC-2949: usb umount

7) coldplug test: usb stick with vfat filesystem is accessible
plug usb stick
boot system
create files in usb
view files in usb by file browser

8) use systemd for the main image and use sysvinit for the rescue image
Modify conf/local.conf, and repeat step 3 to 7;
...
DISTRO_FEATURES_append = " systemd"
VIRTUAL-RUNTIME_init_manager = "systemd"
...

9) use systemd exclusively
Modify conf/local.conf, and repeat step 3 to 7;
...
DISTRO_FEATURES_append = " systemd"
VIRTUAL-RUNTIME_init_manager = "systemd"
DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"
...

* Expected Results:
1) build image success

2) the owner of plugin usb stick is `xuser', it will be automatically
mount/umount, and xuser could read files from usb and write files to it.

root@emenlow-noemgd:~# mount
/dev/sdc1 on /media/sdc1 type vfat (rw,nosuid,nodev,noexec,relatime,uid=1000,gid=1000,fmask=0177,dmask=0077,codepage=437,iocharset=iso8859-1,shortname=mixed,quiet,errors=remount-ro,user)
/dev/sdb on /media/realroot type vfat (rw,nosuid,nodev,noexec,relatime,uid=1000,gid=1000,fmask=0177,dmask=0077,codepage=437,iocharset=iso8859-1,shortname=mixed,quiet,errors=remount-ro)

root@emenlow-noemgd:~# ls /media/ -al
drwxr-xr-x    2 root     root         16384 Jan  1  1970 realroot
drwx------    3 xuser    xuser         1024 Jun  9 12:08 sdc1

root@emenlow-noemgd:~# su xuser
xuser@emenlow-noemgd:~$ echo "hello world" > /media/sdc1/test
xuser@emenlow-noemgd:~$ cat /media/sdc1/test 
hello world

//Hongxu


The following changes since commit a63229917a5708de2d161aba0d67168ce0da6365:

  meta-yocto-bsp: update reference board SRCREVs (2013-07-10 09:45:51 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-udev-xuser
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-udev-xuser

Hongxu Jia (6):
  pmount: add version 0.9.23
  atom-pc:fix xuser write to usb storage failed
  udev-extraconf:fix xuser write to usb storage failed
  udev: fix invoking pmount failed based on sysvinit
  pmount: allow users in disk group to perform pmount/pumount
  xuser-account: add xuser to disk group

 meta-yocto-bsp/conf/machine/atom-pc.conf           |   1 +
 meta/recipes-core/udev/udev-extraconf/mount.sh     |  31 +++++-
 meta/recipes-core/udev/udev/init                   |   1 +
 ...-option-f-to-mount-already-mounted-device.patch | 115 +++++++++++++++++++++
 meta/recipes-extended/pmount/pmount_0.9.23.bb      |  34 ++++++
 .../user-creation/xuser-account_0.1.bb             |   2 +-
 6 files changed, 181 insertions(+), 3 deletions(-)
 mode change 100644 => 100755 meta/recipes-core/udev/udev-extraconf/mount.sh
 create mode 100644 meta/recipes-extended/pmount/files/pmount-add-option-f-to-mount-already-mounted-device.patch
 create mode 100644 meta/recipes-extended/pmount/pmount_0.9.23.bb

-- 
1.8.1.2


