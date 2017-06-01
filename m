Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8EE1877D40
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 15:17:48 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Jun 2017 08:17:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,280,1493708400"; d="scan'208";a="109702179"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 01 Jun 2017 08:17:48 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Jun 2017 18:15:57 +0300
Message-Id: <cover.1496329361.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 0/2] Multi-threaded RPM support
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
X-List-Received-Date: Thu, 01 Jun 2017 15:17:50 -0000

These two patches add multi-threaded features to RPM to speed up the do_package_write_rpm task.

Specifically:

1) Multi-threaded xz compressor is used instead of default single-threaded gz. This has the most
dramatic effect when a recipe produces a smaller number of large-sized packages.

2) Packages creation is run in multiple threads via thread pools. This is most beneficial when
a recipe produces a large amount of small packages.

Some not very scientific benchmarks for time and .rpm sizes
(time is measured for do_package_write_rpm tasks only):

webkitgtk
before: 9m22s 1550M
after: 1m50s 858M

glibc-locale
before: 3m2s 125M
after: 40s 56M

glibc
before: 56s 54M
after: 23s 38M

perl
before: 1m19s 63M
after: 55s 42M

python3
before: 40s 38M
after: 28s 24M

The following changes since commit bd063fa288b49b6e3ea77982d0ccc46610feb1ad:

  tune-mips32*.inc: use consistent comments across all three .inc files (2017-05-30 10:15:20 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/parallel-rpm
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/parallel-rpm

Alexander Kanavin (2):
  package_rpm.bbclass: use multithreaded xz compression
  rpm: run binary package generation via thread pools

 meta/classes/package_rpm.bbclass                   |   2 +
 ...y-package-building-into-a-separate-functi.patch |  83 ++++++++
 ...-binary-package-creation-via-thread-pools.patch | 137 +++++++++++++
 ...c-make-operations-over-string-pools-threa.patch | 209 +++++++++++++++++++
 ...c-remove-static-local-variables-from-buil.patch | 227 +++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_git.bb               |   4 +
 6 files changed, 662 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Split-binary-package-building-into-a-separate-functi.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0002-Run-binary-package-creation-via-thread-pools.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0004-build-pack.c-remove-static-local-variables-from-buil.patch

-- 
2.11.0


