Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6F2D376FF2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 18:42:06 +0000 (UTC)
Received: by iofh134 with SMTP id h134so69134190iof.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Sep 2015 11:42:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to;
	bh=ZThGyfEPScCAUuvxetG18ZGiSnvVEqXth/iAvpY16WE=;
	b=Q5f9CRVhBFg85/cD8r1yGtSaAopFE0mqOIbAojNRQhU6KAtP6URgPnJVmathbix5ZC
	iu2shhveQ966Geym9K12jsvOVGjvAdD0uBZxk3Fo0Jn9YbLfDTRhKUgZLEt4IYSVVbhU
	iaN/RadCrgU/zhcdSSkEYcUpyn9mBDj4llKqmdrH8BHAY1/uGtLToHDqr955APhXV950
	P/StjOnAx4kCdagGmH2pIglMzO2OFw0R1dS+SbfYfdGUtCbEkSa24ExDyYP/32gn7gyj
	eXQdvlnrj4iEWDSjYbwyVYNAk4lJ+s/doJcY/2YMOLavgEgqPCezcEOHq3q7Bqg1hBvE
	4Z0Q==
X-Gm-Message-State: ALoCoQlkdbRqTyyZoAWoaQf7MMkA3gO+821TDBfjj/7DND/n95nYm+LSbWS8eiO4yj/FQ/ULJK5t
X-Received: by 10.107.10.224 with SMTP id 93mr1018680iok.25.1441305726539;
	Thu, 03 Sep 2015 11:42:06 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A5686C.dip0.t-ipconnect.de.
	[87.165.104.108])
	by smtp.gmail.com with ESMTPSA id x3sm5073948igl.2.2015.09.03.11.42.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Sep 2015 11:42:05 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Sep 2015 20:42:28 +0200
Message-Id: <cover.1441305437.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441207840.git.patrick.ohly@intel.com>
Subject: [PATCH 0/8] enhancing images, booting and runqemu, simplified version
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
X-List-Received-Date: Thu, 03 Sep 2015 18:42:09 -0000

These are the same patches as in the previous patch series, minus the
ones related to initramfs-framework which will need further
discussion. I split up the /dev/console change into two commits as
suggested by Otavio.

The usage of FS UUID is still turned on by default, see the last
patch. If that's too aggressive, feel free to drop that one. It's a
change that can also be done easily in a local.conf or distro conf.

The following changes since commit aba3ef50d65e0dc8659a48bf98d0fb00dd44a6fc:

  debianutils: create package for run-parts (2015-09-02 23:51:16 +0100)

are available in the git repository at:

  git://github.com/pohly/openembedded-core booting-simplified
  https://github.com/pohly/openembedded-core/tree/booting-simplified

Patrick Ohly (8):
  runqemu: support full-disk images
  initramfs-framework: create /dev/console
  initramfs-live-boot: create /dev/console
  initramfs-framework: handle kernel parameters with . inside
  image-vm.bbclass: avoid duplicating syslinux default values
  image-vm.bbclass: support specifying an initramfs
  boot loader: support root=UUID
  boot-directdisk.bbclass: use rootfs UUID by default

 meta/classes/boot-directdisk.bbclass               |  2 +-
 meta/classes/fs-uuid.bbclass                       | 24 ++++++++++++++++++++++
 meta/classes/grub-efi.bbclass                      |  4 ++++
 meta/classes/gummiboot.bbclass                     |  4 ++++
 meta/classes/image-vm.bbclass                      |  7 +++++--
 meta/classes/syslinux.bbclass                      |  5 ++++-
 .../initrdscripts/initramfs-framework/init         |  3 ++-
 .../initrdscripts/initramfs-framework_1.0.bb       |  7 ++++++-
 .../initrdscripts/initramfs-live-boot_1.0.bb       |  4 +++-
 scripts/runqemu                                    | 24 +++++++++++++---------
 scripts/runqemu-internal                           | 10 ++++-----
 11 files changed, 72 insertions(+), 22 deletions(-)
 create mode 100644 meta/classes/fs-uuid.bbclass

-- 
2.1.4


