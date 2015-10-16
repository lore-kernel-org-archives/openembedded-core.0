Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9D18477134
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 07:59:58 +0000 (UTC)
Received: by pacfv9 with SMTP id fv9so15279998pac.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 00:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=S42ZC9ZT6cOcPVpm0xGPAaO9ljOAwtX3RllThvTGCFE=;
	b=RWApQaGG9zPVz/qf/oBef0eHqVKCAlQWk52hC+IVFYVqsI5ROrih9tKeHoqUXBo2eo
	vpO1P6eeKD/5IHES1bMTO+pj32E6ojWRBnqAEpxm/G1LotXd9hvXJQvQIkdt6tAst41v
	m5PjLafE/ahrpYr9ZsGFY/jSprYP24PjPMKcscM+uPIEMlyJM1SvfOURTVorA608tOpk
	whnQcb2x80Sb628pLToleTj1S1fj/hyR8DIKiBTxNC4YSd9cLAZL6/mnMPlu+2bwLBsE
	8TgAz+xsi9no2IZDJxI8PeIZjtqLjQUto0apVraMLFujwRWWf0UBsicMRAVeLncv6tsv
	+JsQ==
X-Received: by 10.66.120.208 with SMTP id le16mr14593792pab.133.1444982398741; 
	Fri, 16 Oct 2015 00:59:58 -0700 (PDT)
Received: from imac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169]) by smtp.gmail.com with ESMTPSA id
	b7sm19680695pas.31.2015.10.16.00.59.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Oct 2015 00:59:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Oct 2015 00:59:55 -0700
Message-Id: <cover.1444982178.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.1
Subject: [master/jethro][PATCH 0/9] uclibc fixes
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
X-List-Received-Date: Fri, 16 Oct 2015 08:00:01 -0000

These are fixes to uclibc and other packages to rebuild them on uclibc
this patchset will be useful on jethro as well, so this is a pull request for
both master and jethro

The following changes since commit d294da632a11024de69f091be71b71a1b2acacd9:

  kern-tools: temp. test patch resume fix (2015-10-15 12:38:24 -0700)

are available in the git repository at:

  git://github.com/kraj/openembedded-core uclibc_fixes
  https://github.com/kraj/openembedded-core/tree/uclibc_fixes

Khem Raj (9):
  rpcbind: Fix build with uclibc
  libtirpc: Refresh uclibc patches
  uclibc: Fix build with gcc5
  coreutils-6.9: Add missing dependency on virtual/libiconv
  coreutils: Do not use host paths in getloadavg.m4
  libpam: Fix build with uclibc
  libtirpc: Fix a bug exposed by uclibc
  systemd: Fix build with uclibc
  uclibc: Implement syncfs and AT_EMPTY_PATH for all and O_PATH for arm

 .../coreutils/coreutils-6.9/loadavg.patch          |  18 ++
 meta/recipes-core/coreutils/coreutils_6.9.bb       |   2 +
 .../systemd/0001-fix-build-on-uClibc-exp10.patch   |  22 ++
 ...nv-when-secure-versions-are-not-available.patch |  39 ++++
 meta/recipes-core/systemd/systemd_225.bb           |   2 +
 meta/recipes-core/uclibc/uclibc-git.inc            |   3 +
 ...-AT_EMPTY_PATH-for-all-and-O_PATH-for-arm.patch |  42 ++++
 ...zes-away-the-write-only-static-functions-.patch |  51 +++++
 .../uclibc/uclibc-git/0001-wire-in-syncfs.patch    |  49 +++++
 .../libtirpc/libtirpc/remove-des-uclibc.patch      |  22 +-
 .../libtirpc/libtirpc/va_list.patch                |  18 ++
 meta/recipes-extended/libtirpc/libtirpc_0.2.5.bb   |   4 +-
 meta/recipes-extended/pam/libpam/use-utmpx.patch   | 233 +++++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.2.1.bb          |   4 +-
 .../rpcbind/rpcbind/0001-uclibc-nss.patch          |  30 ---
 meta/recipes-extended/rpcbind/rpcbind_0.2.3.bb     |   2 -
 16 files changed, 496 insertions(+), 45 deletions(-)
 create mode 100644 meta/recipes-core/coreutils/coreutils-6.9/loadavg.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-fix-build-on-uClibc-exp10.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0022-Use-getenv-when-secure-versions-are-not-available.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-fcntl-Add-AT_EMPTY_PATH-for-all-and-O_PATH-for-arm.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-gcc5-optimizes-away-the-write-only-static-functions-.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-wire-in-syncfs.patch
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/va_list.patch
 create mode 100644 meta/recipes-extended/pam/libpam/use-utmpx.patch
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-uclibc-nss.patch

-- 
2.6.1


