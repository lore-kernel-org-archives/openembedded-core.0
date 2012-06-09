Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SdOvk-00044V-8e
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Jun 2012 18:54:28 +0200
Received: by pbbrq2 with SMTP id rq2so3570867pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jun 2012 09:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=9zyHT5peVqqMFAFm/hRGgw2LAtCwuMct8ozrkKCXbqU=;
	b=qvyw3oLPuufeheUbJ71T613e6IDJ9tSX20UWo+6cPpGjn9qH7JGwgdaRYxPzIOHaFW
	huhvn65UZUhDOLip1SxMF/m4vIOxcdTn0qXmg0tZSKwRQG33a3hEm8Db/CJ2ZEKoeFBs
	Dm1+oeJsIb1d4gJs/PBFaNBX7NVKo62V1+GCa0etSD8otcGa/6CUCoNhf2b8Rkj2y11i
	uCue20ZeqKSuB6jf3mfn2pD6TgtuHnGLthNycqu9AqviOYsu+7EPl14oYvB4+B/3W5LW
	s+4eIN2Fnoik1F6X1iLilcLbUKVCa0xnv+fVr1d0vxKENEeFsOVGxGgZ8s4TYTnsBa1e
	T73A==
Received: by 10.68.232.201 with SMTP id tq9mr8132426pbc.70.1339260236322;
	Sat, 09 Jun 2012 09:43:56 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id rv5sm11895980pbc.56.2012.06.09.09.43.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 09 Jun 2012 09:43:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jun 2012 09:42:53 -0700
Message-Id: <cover.1339259893.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 00/16 V2] Prelink/ld bug and rpm compilation on uclibc
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
X-List-Received-Date: Sat, 09 Jun 2012 16:54:28 -0000


This patch now can compile a uclibc sato image using rpm as packaging backend
Introduces variables into cmake class to control linker flags which was
not available
Adds npth recipe. npth is next gen pth soon gnupg 2.1 will drop pth
and move on to use npth, right now its only used in uclibc case
conditionalize use of pth using libc overrides since pth is not
compatible with uclibc

The following changes since commit 75a973328d50ef3c007edb7a471ea77fb97911ea:

  kern-tools: anchor KMACHINE test (2012-06-08 11:56:21 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/misc-updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc-updates

Khem Raj (16):
  binutils_2.22: Backport to fix bogus textrels
  rpm: Fix compilation on uclibc
  pth: Mark incompatible with uclibc
  libtool: Let -fstack-protector passed to link step
  rpm: Use link time check for libssp
  sat-solver: Fix build on uclibc
  libzypp: Fix build with uclibc
  augeas: Fix compilation failure
  rpm: pass lrt and lpthread to link step explicitly for uclibc
  zypper: Fix build on uclibc
  cmake.bbclass: Add OECMAKE_C_LINK_FLAGS and OECMAKE_CXX_LINK_FLAGS
    variables
  libzypp: Define OECMAKE_CXX_LINK_FLAGS when compiling for uclibc
  task-self-hosted.bb,task-core-lsb.bb: Conditionalize pth inclusion
  npth: Add recipe
  gpgme: Depend on npth for uclibc
  gnupg-2.0.19: Depend on npth for uclibc

 meta/classes/cmake.bbclass                         |    4 +
 meta/recipes-core/tasks/task-self-hosted.bb        |    4 +-
 .../binutils/binutils/0001-PR-ld-13470.patch       |   82 ++++++++++++++++++++
 meta/recipes-devtools/binutils/binutils_2.22.bb    |    3 +-
 meta/recipes-devtools/libtool/libtool-2.4.2.inc    |    3 +-
 .../libtool/libtool/respect-fstack-protector.patch |   53 +++++++++++++
 .../rpm/rpm/fstack-protector-configure-check.patch |   13 +++
 meta/recipes-devtools/rpm/rpm/rpmatch.patch        |   42 ++++++++++
 meta/recipes-devtools/rpm/rpm/uclibc-support.patch |   69 ++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    7 ++-
 meta/recipes-extended/augeas/augeas.inc            |    4 +-
 .../0001-Add-missing-argument-to-escape.patch      |   29 +++++++
 meta/recipes-extended/augeas/augeas_0.10.0.bb      |    2 +-
 meta/recipes-extended/libzypp/libzypp/cstdio.patch |   49 ++++++++++++
 meta/recipes-extended/libzypp/libzypp_git.bb       |    9 ++-
 .../sat-solver/sat-solver/futimes.patch            |   32 ++++++++
 meta/recipes-extended/sat-solver/sat-solver_git.bb |    7 +-
 meta/recipes-extended/tasks/task-core-lsb.bb       |    6 +-
 meta/recipes-extended/zypper/zypper/rpmatch.patch  |   23 ++++++
 meta/recipes-extended/zypper/zypper_git.bb         |    4 +-
 meta/recipes-support/gnupg/gnupg_2.0.19.bb         |    6 +-
 meta/recipes-support/gpgme/gpgme_1.3.1.bb          |    7 +-
 meta/recipes-support/npth/npth_0.90.bb             |   17 ++++
 meta/recipes-support/pth/pth_2.0.7.bb              |   12 +++-
 24 files changed, 469 insertions(+), 18 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-PR-ld-13470.patch
 create mode 100644 meta/recipes-devtools/libtool/libtool/respect-fstack-protector.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/fstack-protector-configure-check.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpmatch.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/uclibc-support.patch
 create mode 100644 meta/recipes-extended/augeas/augeas/0001-Add-missing-argument-to-escape.patch
 create mode 100644 meta/recipes-extended/libzypp/libzypp/cstdio.patch
 create mode 100644 meta/recipes-extended/sat-solver/sat-solver/futimes.patch
 create mode 100644 meta/recipes-extended/zypper/zypper/rpmatch.patch
 create mode 100644 meta/recipes-support/npth/npth_0.90.bb

-- 
1.7.5.4



