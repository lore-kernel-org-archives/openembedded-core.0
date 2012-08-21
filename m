Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T3f0w-0005r3-E7
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 05:20:22 +0200
Received: by pbcwy7 with SMTP id wy7so8863245pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 20:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=gQ7kU11y1OgLYh67HiRoCzGpdyf7x/lQLC+M0Q34MrU=;
	b=WTO8p2R5j5swmVRaYgn450/1L7P6MmXzswq/TsXpSbh2ksi9iqFEOwv68qpfbkefhm
	W2Id+bggRmh1kJ7TOEc+suG3oZSqJ6lAyOqy75kS8r78324WFFqxZqIq6CH+In3Hev/k
	6Fk36qZmjw+jq7Jh+9eNpP4Dxf2q2J5PhIkad6v7KcFIMZtJJJZMBKpdT9KY3POmqOAt
	RmMAKP1jhqH0VGSiFGs1J6/MTN7Jx2ZbHslJKI9rU8vv8AaRXsnNZw/Q3vGx5mOvcsbL
	6c7iNwxNvataAdf71hfhXYq8wKeiY6LAG1uJO+XX+ADcTHZayyEiCZYQKHwKlwAgGta8
	e7Gw==
Received: by 10.68.197.70 with SMTP id is6mr39800995pbc.64.1345518498280;
	Mon, 20 Aug 2012 20:08:18 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id hr1sm441192pbc.23.2012.08.20.20.08.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 20:08:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2012 20:07:43 -0700
Message-Id: <cover.1345518098.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/9] Rework cross toolchain bootstrap
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
X-List-Received-Date: Tue, 21 Aug 2012 03:20:22 -0000

This patchset drops one gcc bootstrap phase. It has been possible because of
some work upstream glibc to drop build time dependency on libgcc_s and libgcc_eh

I have built all possible images in OE-Core for all qemu machines
all of them built fine except *-rt and *-initramfs which failed due to unrelated
issues. I have built from scratch as well as built from sstate. Seems to go
ok. 


The following changes since commit 04568d1f18250d531aad5d286157d2d559083520:

  qemu: Fix broken accidental path move (2012-08-20 17:25:21 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/toolchain-rework
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/toolchain-rework

Khem Raj (9):
  eglibc-2.16: Remove build dependency on libgcc_s and libgcc_eh
  eglibc-2.16: Update to top of 2.16 branch
  gcc-cross: Make gcc-cross-initial as the only intermediate gcc stage
  eglibc: Fix eglibc-initial and let eglibc depend on it
  uclibc.inc,uclibc-config.inc: Untabify python snippets
  uclibc: Use gcc-cross-initial as staging compiler
  gcc-crosssdk-initial_4.7.bb: Add --with-native-system-header-dir to
    EXTRA_OECONF
  gcc-cross-intermediate, gcc-crosssdk-intermediate: Remove
  gcc: Switch SRC_URI to use svn

 .../0001-Add-ARM-specific-static-stubs.c.patch     |   27 ++
 ...f-libgcc_s-and-libgcc_eh-when-building-gl.patch |  343 ++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc-initial.inc        |   16 +-
 meta/recipes-core/eglibc/eglibc-testing.inc        |    2 +-
 meta/recipes-core/eglibc/eglibc.inc                |   11 +-
 meta/recipes-core/eglibc/eglibc_2.16.bb            |    6 +-
 meta/recipes-core/uclibc/uclibc-config.inc         |  128 ++++----
 meta/recipes-core/uclibc/uclibc-initial_0.9.33.bb  |   10 +-
 meta/recipes-core/uclibc/uclibc-initial_git.bb     |   10 +-
 meta/recipes-core/uclibc/uclibc.inc                |   28 +-
 meta/recipes-core/uclibc/uclibc_0.9.33.bb          |    7 +-
 meta/recipes-core/uclibc/uclibc_git.bb             |    7 +-
 meta/recipes-devtools/gcc/gcc-4.7.inc              |   11 +-
 .../gcc/gcc-4.7/arm-nolibfloat.patch               |   40 ---
 meta/recipes-devtools/gcc/gcc-cross-initial.inc    |   50 ++-
 .../gcc/gcc-cross-intermediate.inc                 |   68 ----
 .../gcc/gcc-cross-intermediate_4.7.bb              |    3 -
 .../gcc/gcc-crosssdk-initial_4.7.bb                |    2 +
 .../gcc/gcc-crosssdk-intermediate.inc              |    9 -
 .../gcc/gcc-crosssdk-intermediate_4.7.bb           |    3 -
 20 files changed, 534 insertions(+), 247 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0001-Add-ARM-specific-static-stubs.c.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0001-Avoid-use-of-libgcc_s-and-libgcc_eh-when-building-gl.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.7/arm-nolibfloat.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
 delete mode 100644 meta/recipes-devtools/gcc/gcc-cross-intermediate_4.7.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-intermediate.inc
 delete mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.7.bb

-- 
1.7.9.5



