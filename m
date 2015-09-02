Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 08A4B7702B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 15:48:19 +0000 (UTC)
Received: by ioii196 with SMTP id i196so24833701ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 08:48:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=30hDULE2r87PqhPDtKxUy2Tfrk9Iz+pVn8tHVyjREsU=;
	b=PKhBb8COQZwmzReUhS9ppKPB6j9WkamkZFNYHV4EjUFujWcJArNJ3PLQqbcGYnIkK7
	+JJSM3gczgt0UF9Hpy6LUJtz4SqZCGOe2tX411W2A6QSxyWVPIidQE62YpMyLtJoSntF
	6JM8trP5swHEGhzmhRLm531c/8viBBeGqp7rFq7ZzgBx7L/2t9R/Nzje2PuwzXY4zWt/
	OVC0L478JOLwtMbzpQ16PtY9nscVzre8NCuZCQyyCb1N/zhPs2UR3aanDzLYhJe62ER+
	bVJ9q+iKQA4jSxCZ8W1EQWMCR27LmurTVE+FaC8xA9Ey+Ao/w5SIwdRSMm6FrUjpkOHd
	OuUA==
X-Gm-Message-State: ALoCoQkUF81EYOlJ6dECv6+2cHlgogxMFSRi60Y/w9JmH47vvU+OSMmfk+9d67+dvwSszF8f18Qb
X-Received: by 10.107.29.74 with SMTP id d71mr12254228iod.27.1441208899852;
	Wed, 02 Sep 2015 08:48:19 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FD7A.dip0.t-ipconnect.de.
	[93.232.253.122])
	by smtp.gmail.com with ESMTPSA id v3sm2479094igb.3.2015.09.02.08.48.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Sep 2015 08:48:18 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Sep 2015 17:48:39 +0200
Message-Id: <cover.1441207840.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/10] enhancing images, booting and runqemu
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
X-List-Received-Date: Wed, 02 Sep 2015 15:48:23 -0000

I've spent some time lately on building custom full-disk images with a
custom initramfs based on the initramfs-framework. The ultimate goal
is to initialize IMA in a initramfs-framework module.

As part of that work, I enhanced runqemu such that it can boot
full-disk images more easily, made those images more versatile (no
more hard-coded root=/dev/sda2), and solved a kernel panic that only
seems to appear under qemu (the /dev/console issue).

Only a few patches are really important (because I'd probably not be
able to achieve the same effect with setting variables elsewhere):
   boot loader: support root=UUID
   initramfs-framework: handle kernel parameters with . inside
   initramfs-framework: add separate init_verbose log level parameter
   initramfs-framework: support mounting rootfs in modules
   runqemu: support full-disk images

But I think the rest might also be relevant for others and thus
worthwile including.

Note that the mechanism for root=UUID is separated from actually
making that default. Changing the default this late in the development
cycle might be a bit risky, so I'd be fine with leaving out the last
patch which changes the default. On the other hand, it solves one
potential snag for users of these images, so it might be better to
include it - your choice.

The following changes since commit bdeb32b4cdbe316f17c2fd854d59e05e8f2e8ffc:

  rt-tests: drop unnecessary added-missing-dependencies.patch (2015-09-01 11:43:38 +0100)

are available in the git repository at:

  git://github.com/pohly/openembedded-core booting
  https://github.com/pohly/openembedded-core/tree/booting

Patrick Ohly (10):
  runqemu: support full-disk images
  initrdscripts: create /dev/console
  initramfs-framework: handle kernel parameters with . inside
  initramfs-framework: add separate init_verbose log level parameter
  initramfs-framework: support mounting rootfs in modules
  initramfs-framework: support live images
  image-vm.bbclass: avoid duplicating syslinux default values
  image-vm.bbclass: support specifying an initramfs
  boot loader: support root=UUID
  boot-directdisk.bbclass: use rootfs UUID by default

 meta/classes/boot-directdisk.bbclass               |   2 +-
 meta/classes/fs-uuid.bbclass                       |  24 ++++
 meta/classes/grub-efi.bbclass                      |   4 +
 meta/classes/gummiboot.bbclass                     |   4 +
 meta/classes/image-vm.bbclass                      |   7 +-
 meta/classes/syslinux.bbclass                      |   5 +-
 .../initrdscripts/initramfs-framework/finish       |  33 +++---
 .../initrdscripts/initramfs-framework/init         |  19 ++-
 .../initrdscripts/initramfs-framework/live         | 131 +++++++++++++++++++++
 .../initrdscripts/initramfs-framework_1.0.bb       |  16 ++-
 .../initrdscripts/initramfs-live-boot_1.0.bb       |   4 +-
 scripts/runqemu                                    |  24 ++--
 scripts/runqemu-internal                           |  10 +-
 13 files changed, 245 insertions(+), 38 deletions(-)
 create mode 100644 meta/classes/fs-uuid.bbclass
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/live

-- 
2.1.4


