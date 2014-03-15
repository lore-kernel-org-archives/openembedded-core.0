Return-Path: <joaohf@gmail.com>
Received: from mail-ve0-f177.google.com (mail-ve0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id DE3766E757
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Mar 2014 21:18:12 +0000 (UTC)
Received: by mail-ve0-f177.google.com with SMTP id sa20so4119960veb.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Mar 2014 14:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=Re5BoZKmrRS8KFyAsCOAuYAXLZkW3xDcsPNxggvJSLk=;
	b=TQociGIXXmZ0Y1KwyhO7jwNh4/sZwggbcEg7NppoTaz3GhC1f1cYXyKGMaXZhP/HlO
	OuXetrmyC/H9A8SgavhrLWpp7ybV7OMdSW4LUMLBfvhXIxS55dNh+7DvCWWyf8xX/4jW
	bbqD5cND7Xzh+A+i94gwLo+rBICXU2zGj+ZGPKc5rZcXk3O5aiPA5OfxaTj639sBuPxa
	3idO8M3wvCCp/Lwo+g+KCLmpUcvpVORyGW/boGfyKdDSgCKjKLQ8mZN53Cfc4pCOxq54
	wkucMYMMUZmKa9UDwBdzZxAVhqDCKi089+zDntSyCjeJKGtpc4r3qrGJ4BdRAaBHWGfM
	kmMw==
X-Received: by 10.58.220.161 with SMTP id px1mr12996068vec.13.1394918293239;
	Sat, 15 Mar 2014 14:18:13 -0700 (PDT)
Received: from localhost.localdomain ([187.106.6.19])
	by mx.google.com with ESMTPSA id am5sm4382714vdc.15.2014.03.15.14.18.11
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 15 Mar 2014 14:18:12 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Mar 2014 18:17:46 -0300
Message-Id: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Cc: tom.zanussi@linux.intel.com
Subject: [PATCH 0/5] wic: Add --rootfs option to --source param
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
X-List-Received-Date: Sat, 15 Mar 2014 21:18:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, 

These patchs allows the user create the following directdisk-multi-rootfs.wks file:

  part /boot --source bootimg-pcbios --ondisk sda --fstype=msdos \
    --label boot --active --align 1024
  part / --source rootfs --ondisk sda --fstype=ext3 --label primary --align 1024

  part /standby --source rootfs --rootfs=<special rootfs directory> \
    --ondisk sda --fstype=ext3 --label secondary --align 1024

  bootloader  --timeout=0  --append="rootwait rootfstype=ext3 video=vesafb vga=0x318 console=tty0"

The special thing is the /standby partition. Which using rootfs with
a extra '--rootfs' argument instruct the RootfsPlugin what should be
the rootfs directory to be used to create the partition.

It is a very simple features that let users to customize your partition
setup. I thought in the case where we have two rootfs (like active and
standby, e.g used to software update). Or the odd cases when a special
partition need to be create to hold whatever files.

The workflow of wic use remains the same. All the config needs to be done
in .wks file.

To test I used <special rootfs directory> as a rootfs created by 'bitbkae core-image-minimal-dev'
(e.g: /srv/build/yocto/master/tmp/work/genericx86-poky-linux/core-image-minimal-dev/1.0-r0/rootfs).

Thanks.

João Henrique Ferreira de Freitas (5):
  wic: Add RootfsPlugin
  wic: Hook up RootfsPlugin plugin
  wic: Add rootfs_dir argument to do_prepare_partition() method
  wic: Use partition label to be part of rootfs filename
  wic: Add option --rootfs to --source

 .../lib/mic/kickstart/custom_commands/partition.py | 38 +++++++-------
 scripts/lib/mic/pluginbase.py                      |  2 +-
 scripts/lib/mic/plugins/source/bootimg-efi.py      |  2 +-
 scripts/lib/mic/plugins/source/bootimg-pcbios.py   |  2 +-
 scripts/lib/mic/plugins/source/rootfs.py           | 58 ++++++++++++++++++++++
 5 files changed, 81 insertions(+), 21 deletions(-)
 create mode 100644 scripts/lib/mic/plugins/source/rootfs.py

-- 
1.8.3.2


