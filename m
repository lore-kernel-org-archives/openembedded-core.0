Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SfPx7-0001O3-Bl
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 08:24:13 +0200
Received: by pbbrq2 with SMTP id rq2so4635855pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2012 23:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=TZTRofkCt1edrcDqpAEI2oe9AaxSB6zJ3v9lb/diWYQ=;
	b=L9uHctA4w5TWVxkpsVPl51t8XM91N/RCMw/rUJS+FYb205lrEJK/pLhISY+k6rMaxD
	4vXEGI5o7vxzeHEr2S5XPW4CgD+QK0eFQUUhS1sba0LwioqJ3b/0hRvl2B+tLCoQaolX
	JeDXTvl5sEJPAsTuel/OecV86X6CNKTGd82dQ27fBpOcoAfzQgA08P7YSupyPDAYFfhe
	9f5VRTZQwxsT8usrf0buQrCj/DWxshEhclU1ogL+/2pPwScoytnidG4zbqIYMpUgnYo9
	zjekOSThgCXFKYykff03LhgId1MueuItI5oxORrdzJldypnhrv7xdUtX8b52BPJuorjo
	xMCw==
Received: by 10.68.200.102 with SMTP id jr6mr16388299pbc.0.1339740814179;
	Thu, 14 Jun 2012 23:13:34 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id wi8sm12140453pbc.11.2012.06.14.23.13.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 14 Jun 2012 23:13:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jun 2012 23:12:25 -0700
Message-Id: <cover.1339740433.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/9 V3] rpm compilation on uclibc
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
X-List-Received-Date: Fri, 15 Jun 2012 06:24:13 -0000


This patch now can compile a uclibc sato image using rpm as packaging backend
fixes libzypp, zypper, sat-solver builds on uclibc
Upgrades uclibc-0.9.33 to latest on branch since we need
the fixes for glib-2.32.x to work correctly.
Fix glib-2.32.x build failure on x86_64/uclibc by caching
the relevant config variables (guint32/guint64) same patch was
applied to other architecture site files recently.

The following changes since commit ba380813c0198f95b1e786aa7f49b80c68cfe9b9:

  gcc-configure-target: Fix sysroot option breakage I introduced (sorry) (2012-06-14 19:48:07 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/misc-updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc-updates

Khem Raj (9):
  uclibc_0.9.33.bb: Upgrade to latest git
  site/x86_64-linux-uclibc: Cache definitions of guint32/guint64
  rpm: Fix compilation on uclibc
  rpm: Use link time check for libssp
  sat-solver: Fix build on uclibc
  libzypp: Fix build with uclibc
  rpm: pass lrt and lpthread to link step explicitly for uclibc
  zypper: Fix build on uclibc
  libzypp: Define OECMAKE_CXX_LINK_FLAGS when compiling for uclibc

 meta/recipes-core/uclibc/uclibc_0.9.33.bb          |    4 +-
 .../rpm/rpm/fstack-protector-configure-check.patch |   13 ++++
 meta/recipes-devtools/rpm/rpm/rpmatch.patch        |   42 +++++++++++++
 meta/recipes-devtools/rpm/rpm/uclibc-support.patch |   63 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    7 ++-
 meta/recipes-extended/libzypp/libzypp/cstdio.patch |   49 +++++++++++++++
 meta/recipes-extended/libzypp/libzypp_git.bb       |    9 ++-
 .../sat-solver/sat-solver/futimes.patch            |   32 ++++++++++
 meta/recipes-extended/sat-solver/sat-solver_git.bb |    3 +
 meta/recipes-extended/zypper/zypper/rpmatch.patch  |   23 +++++++
 meta/recipes-extended/zypper/zypper_git.bb         |    2 +
 meta/site/x86_64-linux-uclibc                      |    3 +
 12 files changed, 245 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/fstack-protector-configure-check.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpmatch.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/uclibc-support.patch
 create mode 100644 meta/recipes-extended/libzypp/libzypp/cstdio.patch
 create mode 100644 meta/recipes-extended/sat-solver/sat-solver/futimes.patch
 create mode 100644 meta/recipes-extended/zypper/zypper/rpmatch.patch

-- 
1.7.5.4



