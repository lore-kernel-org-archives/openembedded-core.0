Return-Path: <joaohf@gmail.com>
Received: from mail-ve0-f182.google.com (mail-ve0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 129746F9AA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 02:43:00 +0000 (UTC)
Received: by mail-ve0-f182.google.com with SMTP id jw12so1641279veb.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 19:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=Q483AP3Yzdo1RrjRSZLUTn9+LmO4RMXhlUV13H5I2SY=;
	b=XHqFI0xriJEqT6uo2ntOYSduS7XobgCAZWVj/2cDGxYWisvUFIz0zHMzi3oSyrBOvX
	h3/onShEtK99OHaVHnTSzjs1aHkre4GHWEuUXFmr39jZVggNfM74nIw4zNbLP5ujAuxP
	6S/sk86kT51JxMCBdUuDhBF6T4oLFDqW+ysm8bLhDPjsbl/vE3KmqLreMkPVtfu30lTH
	+JLDIBSr+MSoBF2IoFzlsiV0W55KG2zAeKrQKi0L06DC4JXSg8xghMp/2JM+tm7tu/Eb
	BVTzhtWm7YfszWPKKWuPCF6T9Pms9KrfO7FdANSUIBtZkIjWvj9me1gMx/8Y1F4IIaXi
	SAPQ==
X-Received: by 10.58.1.97 with SMTP id 1mr9510095vel.23.1395801781282;
	Tue, 25 Mar 2014 19:43:01 -0700 (PDT)
Received: from localhost.localdomain ([187.106.6.19])
	by mx.google.com with ESMTPSA id ay4sm35813974vdc.6.2014.03.25.19.42.59
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 25 Mar 2014 19:43:00 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Mar 2014 23:42:42 -0300
Message-Id: <1395801769-13042-1-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: tom.zanussi@linux.intel.com
Subject: [PATCH v2 0/7] wic: Add --rootfs option to --source param
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
X-List-Received-Date: Wed, 26 Mar 2014 02:43:03 -0000
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

changes since previous version:
 v2: 
  - in .wks syntax change --rootfs to --rootfs-dir
  - reporting all extra partitions in the output
  - use a connection string between --rootfs-dir from wic command-line and .wks

João Henrique Ferreira de Freitas (7):
  wic: Add RootfsPlugin
  wic: Hook up RootfsPlugin plugin
  wic: Add rootfs_dir argument to do_prepare_partition() method
  wic: Use partition label to be part of rootfs filename
  wic: Add option --rootfs-dir to --source
  wic: Report all ROOTFS_DIR artifacts
  wic: Extend --rootfs-dir to connect rootfs-dirs

 scripts/lib/mic/imager/direct.py                   | 20 +++++--
 .../lib/mic/kickstart/custom_commands/partition.py | 51 ++++++++++------
 scripts/lib/mic/pluginbase.py                      |  2 +-
 scripts/lib/mic/plugins/imager/direct_plugin.py    | 17 +++++-
 scripts/lib/mic/plugins/source/bootimg-efi.py      |  2 +-
 scripts/lib/mic/plugins/source/bootimg-pcbios.py   |  2 +-
 scripts/lib/mic/plugins/source/rootfs.py           | 68 ++++++++++++++++++++++
 scripts/wic                                        | 34 ++++++++++-
 8 files changed, 167 insertions(+), 29 deletions(-)
 create mode 100644 scripts/lib/mic/plugins/source/rootfs.py

-- 
1.8.3.2


