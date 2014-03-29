Return-Path: <joaohf@gmail.com>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 29A8A601AA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 03:12:18 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id hu19so6782136vcb.29
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 20:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=53c1XyS6x6LBaK++qcPo3zct1CAWmP4ll7MJ9+Jl8AE=;
	b=JO4dII/AwKvO7LkzBrhkNlA4dLOX/K4WkE3N4KN8IcGV1pkM+QDEvEyqcQpeFCNOXf
	I6ughcOrdMqdxPHiwwxtIwXPS5IbE99ZZu5gnLCabKoKv3K1jeZO22UJSQzdXe01Z1lF
	TY7j6VPm6Kc/E6UzcyCBbh3mdscqCyYBLVewFuhTAd7uObQhckCO6kMhr8OcFR/moTfg
	OSZDxshpK++e2opWOmtabgoYk/IQeIGf5vlFMThXxy1q0DB2xcx/HQ57Oxbpp19M7CVu
	BZOMfaVNqvC2sJAS30uQC+VyWvgUmy06Jg713//Jy2HNk6xW+LDzEhsNuUo1O44aulQp
	N7jg==
X-Received: by 10.52.90.37 with SMTP id bt5mr8774343vdb.7.1396062739147;
	Fri, 28 Mar 2014 20:12:19 -0700 (PDT)
Received: from localhost.localdomain ([187.106.6.19])
	by mx.google.com with ESMTPSA id
	ha7sm12869708vdb.17.2014.03.28.20.12.17 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Mar 2014 20:12:18 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Mar 2014 00:12:01 -0300
Message-Id: <1396062728-9140-1-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: tom.zanussi@linux.intel.com
Subject: [PATCH v4 0/7] wic: Add --rootfs option to --source param
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
X-List-Received-Date: Sat, 29 Mar 2014 03:12:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, 

These patchs allows the user create the following directdisk-multi-rootfs.wks file:

  part /boot --source bootimg-pcbios --ondisk sda --fstype=msdos \
    --label boot --active --align 1024
  part / --source rootfs --ondisk sda --fstype=ext3 --label primary --align 1024

  part /standby --source rootfs --rootfs-dir=<special rootfs directory> \
    --ondisk sda --fstype=ext3 --label secondary --align 1024

  bootloader  --timeout=0  --append="rootwait rootfstype=ext3 video=vesafb vga=0x318 console=tty0"

The special thing is the /standby partition. Which using rootfs with
a extra '--rootfs' argument instruct the RootfsPlugin what should be
the rootfs directory to be used to create the partition.

Besides that, the user can specify a more generic connection
between wic command-line --rootfs-dir and what is describing in .wks file. Like this:

wic create ... --rootfs-dir rootfs1=/some/rootfs/dir --rootfs-dir rootfs2=/some/other/rootfs/dir

  part / --source rootfs --rootfs-dir="rootfs1" --ondisk sda --fstype=ext3 --label primary --align 1024

  part /standby --source rootfs --rootfs-dir="rootfs2" \
    --ondisk sda --fstype=ext3 --label secondary --align 1024

So no hard-coded path is used in .wks. The connection string could be any string that 
makes a link between the '--rootfs-dir'

It is a very simple features that let users to customize your partition
setup. I thought in the case where we have two rootfs (like active and
standby, e.g used to software update). Or the odd cases when a special
partition need to be create to hold whatever files.

The workflow of wic use remains the same. All the config needs to be done
in .wks file.

To test I used <special rootfs directory> as a rootfs created by 'bitbkae core-image-minimal-dev'
(e.g: /srv/build/yocto/master/tmp/work/genericx86-poky-linux/core-image-minimal-dev/1.0-r0/rootfs).

Use cases and command line:

wic create directdisk-multi-rootfs.wks \
    -e core-image-minimal
    --rootfs-dir /srv/build/yocto/master/tmp/work/genericx86-poky-linux/core-image-minimal/1.0-r0/rootfs \
    --rootfs-dir rootfs2=/srv/build/yocto/master/tmp/work/genericx86-poky-linux/core-image-minimal-dev/1.0-r0/rootfs \
    --rootfs-dir rootfs3=/tmp/fakerootfs

directdisk-multi-rootfs.wks:

  part /boot --source bootimg-pcbios --ondisk sda --fstype=msdos --label boot --active --align 1024
  part / --source rootfs --ondisk sda --fstype=ext3 --label primary --align 1024

  part /standby --source rootfs --rootfs-dir=rootfs2 --ondisk sda --fstype=ext3 --label secondary --align 1024

  part /root --source rootfs --rootfs-dir=rootfs3 --ondisk sda --fstype=ext3 --label root_sec --align 1024

  bootloader  --timeout=0  --append="rootwait rootfstype=ext3 video=vesafb vga=0x318 console=tty0"



wic create directdisk-multi-rootfs-indirect.wks \
    -e core-image-minimal \
    --rootfs-dir rootfs1=/srv/build/yocto/master/tmp/work/genericx86-poky-linux/core-image-minimal/1.0-r0/rootfs \
    --rootfs-dir rootfs2=/srv/build/yocto/master/tmp/work/genericx86-poky-linux/core-image-minimal-dev/1.0-r0/rootfs \
    --rootfs-dir rootfs3=/tmp/fakerootfs

directdisk-multi-rootfs-indirect.wks:

  part /boot --source bootimg-pcbios --ondisk sda --fstype=msdos --label boot --active --align 1024
  part / --source rootfs --rootfs=rootfs1 --ondisk sda --fstype=ext3 --label primary --align 1024

  part /standby --source rootfs --rootfs-dir=rootfs2 --ondisk sda --fstype=ext3 --label secondary --align 1024

  part /root --source rootfs --rootfs-dir=rootfs3 --ondisk sda --fstype=ext3 --label root_sec --align 1024

  bootloader  --timeout=0  --append="rootwait rootfstype=ext3 video=vesafb vga=0x318 console=tty0"


changes since previous version:
 v2: 
  - in .wks syntax change --rootfs to --rootfs-dir
  - reporting all extra partitions in the output
  - use a connection string between --rootfs-dir from wic command-line and .wks
 v3:
  - fix when wic -e command-line param is used and no --rootfs-dir was passed
 v4:
  - fix fstab parser/create when --rootfs-dir connector is used and there was not passed a
    --rootfs-dir param on wic command line
  - fix wic command line param when used without --rootfs-dir and only --rootfs-dir connectors are passed


João Henrique Ferreira de Freitas (7):
  wic: Add RootfsPlugin
  wic: Hook up RootfsPlugin plugin
  wic: Add rootfs_dir argument to do_prepare_partition() method
  wic: Use partition label to be part of rootfs filename
  wic: Add option --rootfs-dir to --source
  wic: Report all ROOTFS_DIR artifacts
  wic: Extend --rootfs-dir to connect rootfs-dirs

 scripts/lib/mic/imager/direct.py                   | 36 +++++++----
 .../lib/mic/kickstart/custom_commands/partition.py | 51 ++++++++++------
 scripts/lib/mic/pluginbase.py                      |  2 +-
 scripts/lib/mic/plugins/imager/direct_plugin.py    | 17 +++++-
 scripts/lib/mic/plugins/source/bootimg-efi.py      |  2 +-
 scripts/lib/mic/plugins/source/bootimg-pcbios.py   |  2 +-
 scripts/lib/mic/plugins/source/rootfs.py           | 71 ++++++++++++++++++++++
 scripts/wic                                        | 40 +++++++++++-
 8 files changed, 185 insertions(+), 36 deletions(-)
 create mode 100644 scripts/lib/mic/plugins/source/rootfs.py

-- 
1.8.3.2


