Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SbfpX-000142-Jh
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jun 2012 00:32:55 +0200
Received: by dalh21 with SMTP id h21so6631474dal.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2012 15:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=6uOSNSACRmMoK8vmcowVpzfD2Kz+T3x1AdCeErwzND8=;
	b=IjoX6sw4/PGhKEnYlrfQEx2U5cSUVfHrJR6e4jcEM/bOupuZrQ3n1XG1LcdW0qied8
	lVT6fS/vgcdpFXr89pKDCigCrr58vVEvkeNKcvA3Nc7Q7C7KcFiryCqpxirVelg2zbDE
	UAnKnJCvfeS+SM0ZJqSpBR47uw3mTwXZoCAFZV5Wap0Z0/rdlToa0jYPuF/iBvvlmtwX
	0mxELOc6A927ZHDpZE7iofiIkonU7iRpq15JWZsp6EnF/A7teLkjcplq3xK2U8sUPXVS
	bg37rDtPHzewIctiXw62TGjiVDH8Jt7r0QbtShXwj8NgEKZG0Pw7CYlWAVXUpFr3fwUr
	BXaQ==
Received: by 10.68.228.130 with SMTP id si2mr988998pbc.59.1338848549397;
	Mon, 04 Jun 2012 15:22:29 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id wk3sm26547pbc.21.2012.06.04.15.22.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Jun 2012 15:22:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jun 2012 15:21:29 -0700
Message-Id: <cover.1338848379.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/7] Prelink/ld bug and rpm compilation on uclibc
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
X-List-Received-Date: Mon, 04 Jun 2012 22:32:55 -0000

This patch fixes bunch of recipes to build on uclibc
binutils patch fixes the prelink problem recently seen on powerpc

The following changes since commit e3113827810e98eb1b012f0b280fb917199704c1:

  webkit-gtk: Use glib as unicode backend to avoid browser crash (2012-05-30 17:37:58 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/misc-updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc-updates

Khem Raj (7):
  binutils_2.22: Backport to fix bogus textrels
  rpm: Fix compilation on uclibc
  pth: Mark incompatible with uclibc
  libtool: Let -fstack-protector passed to link step
  rpm: Use link time check for libssp
  sat-solver: Fix build on uclibc
  libzypp: Fix build with uclibc

 .../binutils/binutils/0001-PR-ld-13470.patch       |   82 ++++++++++++++++++++
 meta/recipes-devtools/binutils/binutils_2.22.bb    |    3 +-
 meta/recipes-devtools/libtool/libtool-2.4.2.inc    |    3 +-
 .../libtool/libtool/respect-fstack-protector.patch |   53 +++++++++++++
 .../rpm/rpm/fstack-protector-configure-check.patch |   13 +++
 meta/recipes-devtools/rpm/rpm/rpmatch.patch        |   42 ++++++++++
 meta/recipes-devtools/rpm/rpm/uclibc-support.patch |   69 ++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    5 +-
 meta/recipes-extended/libzypp/libzypp/cstdio.patch |   49 ++++++++++++
 meta/recipes-extended/libzypp/libzypp_git.bb       |   10 ++-
 .../sat-solver/sat-solver/futimes.patch            |   32 ++++++++
 meta/recipes-extended/sat-solver/sat-solver_git.bb |    7 +-
 meta/recipes-support/pth/pth_2.0.7.bb              |   12 +++-
 13 files changed, 371 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-PR-ld-13470.patch
 create mode 100644 meta/recipes-devtools/libtool/libtool/respect-fstack-protector.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/fstack-protector-configure-check.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpmatch.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/uclibc-support.patch
 create mode 100644 meta/recipes-extended/libzypp/libzypp/cstdio.patch
 create mode 100644 meta/recipes-extended/sat-solver/sat-solver/futimes.patch

-- 
1.7.5.4



