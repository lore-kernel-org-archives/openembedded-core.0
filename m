Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1ShMrR-0001E3-2n
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 17:30:25 +0200
Received: by pbbrq2 with SMTP id rq2so729762pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 08:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=D9aGrbHS7AarejeqnecCqDBi8gF6lnoXSbMcXhsv25M=;
	b=btU8KMR8kkbCSxzIqvQiA4gDtx8bqGjKfNBZjKWPK72TojhLVJGVilSIduLlnB2Evf
	pKWJ/3x+3iC2fXRzUgbYI5tFWmiGruMgqx0bZqUXeMewzV7a/nRiGpdDMsh10MH7SVv1
	9aHDwuLDMVFJVF0cAns6B8aFgHh0xiEdsszxfzLVUZL4echPbR7mp0eg6yYp/7ohwsgU
	CcaB6Jm74ient4EEFJuDFtCza1/0nEG5OW5p8QUf4FuUzWNTJqOUL4VGZAAmC0KPY8VD
	jDFc836ruKD/k+msVyNmGjQUiLH8Lu1l1bQbAxtc81RYzIX4ticOabhEVsKTF6hMNIg/
	hasg==
Received: by 10.68.190.102 with SMTP id gp6mr75933812pbc.5.1340205579267;
	Wed, 20 Jun 2012 08:19:39 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168]) by mx.google.com with ESMTPS id
	na10sm25824417pbc.23.2012.06.20.08.19.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jun 2012 08:19:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2012 08:18:19 -0700
Message-Id: <cover.1340205163.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/5] Toolchain fixes and uclibc-git upgrade
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
X-List-Received-Date: Wed, 20 Jun 2012 15:30:25 -0000

This patchset 

1. Updates gcc to 4.7.1+
2. Fixes on device toolchain since now they are built with sysroot
   couple of issues showed up
3. Rearranges binutils recipes so that target binutils recipe in not
   included everywhere
4. Add enable plugin option to binutils. Its needed for LTO to work
5. Update uclibc_git recipe to lastest uclibc master after a major
   branch has been collapsed in uclibc master


The following changes since commit 6d761ae17ddbd3d936e7fe985b40825ad62b2418:

  debian.bbclass: invoke target objdump (2012-06-18 13:20:29 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/misc-updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc-updates

Khem Raj (5):
  uclibc-git: Upgrade to latest tip of master
  gcc-4.7: Update to tip of gcc-4_7-branch since 4.7.1 has been out
  binutils: Add with-sysroot to target binutils
  gcc: Fix a case of sysroot with trailing / and gxx-include-dir
    leading     slash
  binutils: Enable plugins by default

 .../uclibc/uclibc-git/argp-support.patch           |  136 +++---
 ...so_use_arm_dl_linux_resolve_in_thumb_mode.patch |   27 --
 .../uclibc/uclibc-git/orign_path.patch             |   47 ++-
 meta/recipes-core/uclibc/uclibc_git.bb             |    3 +-
 meta/recipes-devtools/binutils/binutils-2.22.inc   |   37 ++
 .../binutils/binutils-cross-canadian.inc           |    7 +-
 .../binutils/binutils-cross-canadian_2.22.bb       |    4 +-
 meta/recipes-devtools/binutils/binutils-cross.inc  |    8 +-
 .../binutils/binutils-cross_2.22.bb                |    3 +-
 .../binutils/binutils-crosssdk_2.22.bb             |    3 -
 meta/recipes-devtools/binutils/binutils.inc        |   28 +--
 meta/recipes-devtools/binutils/binutils_2.22.bb    |   60 ++--
 meta/recipes-devtools/gcc/gcc-4.7.inc              |   13 +-
 .../gcc/gcc-4.7/fix-g++-sysroot.patch              |  428 ++++++++++++++++++++
 14 files changed, 600 insertions(+), 204 deletions(-)
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.22.inc
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/fix-g++-sysroot.patch

-- 
1.7.5.4



