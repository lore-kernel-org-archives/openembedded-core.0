Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QcCL3-0001RO-7Q
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 10:11:08 +0200
Received: by iwn4 with SMTP id 4so1886628iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 01:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=C/99fxFtP7VcckiQ+zDzcJu09l7lrVH95iN22qrQzSs=;
	b=n8lHyVPAKNFj5zLazZ0G0mg7WQtTB14xPh9zv0VCp3TOwJUGk1FG6OtPcjC7UV/+I4
	74/a9Qdpn4TsLHnzC1eoZ07v7Oy0RVw+GreFCU9HFv3SsqgaQaxXMr2ofbCtPtrCJS9e
	op2KCvjJIFkZ0g5vJLFr8RDShdlZJrGT3nUUU=
Received: by 10.231.83.133 with SMTP id f5mr1439926ibl.114.1309421234690;
	Thu, 30 Jun 2011 01:07:14 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id f13sm1092379ibe.10.2011.06.30.01.07.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Jun 2011 01:07:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jun 2011 01:06:57 -0700
Message-Id: <cover.1309420894.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/6] uclibc config cleanup
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
X-List-Received-Date: Thu, 30 Jun 2011 08:11:11 -0000

We do not need machine configs or even arch configs since we construct the bits
in .inc files. Once anamoly is mips where we do not use default ARCH for o32
which is mips1 but we use mips32 so thats the reason we have a separate config
for mips.

Additionally fix boot issue found on mips which were exposed by udev 171

These patches have been tested with builds from scratch for all supported qemu machines 
and incrmental too (for qemumips)
and angstrom/console-image is booted on all supported qemu machines

The following changes since commit ae4c2b8834dc4d88be7207ea5c45c596bb46fded:

  uclibc: Fix bug exposed by udev 168+ for mips architecture (2011-06-30 00:52:32 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/uclibc-cleanup
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/uclibc-cleanup

Khem Raj (6):
  uclibc: Remove redundant machine/arch configs
  uclibc-config.inc: Fix regexp to determine big-endian arm
  uclibc.inc: Use ARCH_WANTS_{LITTLE|BIG}_ENDIAN to denote endian
  uclibc_git.bb: Untether UCLIBC_HAS_FPU from UCLIBC_HAS_FLOATS
  uclibc: Add UCLIBC_HAS_FLOATS=y to uClibc.distro
  uclibc: Fix bug exposed by udev 168+ for mips architecture

 meta/recipes-core/uclibc/uClibc.distro             |  157 --------------------
 meta/recipes-core/uclibc/uclibc-config.inc         |    2 +-
 ...rch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch |   29 ++++
 ...fd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch |   33 ++++
 .../uclibc/uclibc-git/arm/uClibc.machine           |   70 ---------
 .../uclibc/uclibc-git/armeb/uClibc.machine         |   53 -------
 .../uclibc/uclibc-git/armv5te/uClibc.machine       |   77 ----------
 .../uclibc/uclibc-git/armv5teb/uClibc.machine      |   74 ---------
 .../uclibc/uclibc-git/i386/uClibc.machine          |   59 --------
 .../uclibc/uclibc-git/i486/uClibc.machine          |   62 --------
 .../uclibc/uclibc-git/i586/uClibc.machine          |   62 --------
 .../uclibc/uclibc-git/i686/uClibc.machine          |   59 --------
 .../uclibc/uclibc-git/mips/uClibc.machine          |   61 +-------
 .../uclibc/uclibc-git/mips64/uClibc.machine        |   63 --------
 .../uclibc/uclibc-git/mipsel/uClibc.machine        |   63 --------
 .../uclibc/uclibc-git/powerpc/uClibc.machine       |   46 ------
 .../uclibc/uclibc-git/sh4/uClibc.machine           |   48 ------
 meta/recipes-core/uclibc/uclibc-git/uClibc.distro  |    1 +
 meta/recipes-core/uclibc/uclibc-git/uClibc.machine |   14 ++
 .../uclibc/uclibc-git/x86_64/uClibc.machine        |   41 -----
 meta/recipes-core/uclibc/uclibc.inc                |    2 +-
 meta/recipes-core/uclibc/uclibc_git.bb             |    4 +-
 22 files changed, 89 insertions(+), 991 deletions(-)
 delete mode 100644 meta/recipes-core/uclibc/uClibc.distro
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-Config.in.arch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-mips-signalfd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/arm/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/armeb/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/armv5te/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/armv5teb/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/i386/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/i486/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/i586/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/i686/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/mips64/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/mipsel/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/powerpc/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/sh4/uClibc.machine
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/x86_64/uClibc.machine

-- 
1.7.4.1



