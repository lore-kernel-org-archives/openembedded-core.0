Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SuAn6-0004lE-Nr
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 01:14:52 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 25 Jul 2012 16:03:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="171468459"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.21])
	by orsmga001.jf.intel.com with ESMTP; 25 Jul 2012 16:03:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jul 2012 00:03:12 +0100
Message-Id: <cover.1343256969.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/6] rootfs generation improvements v4
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
X-List-Received-Date: Wed, 25 Jul 2012 23:14:53 -0000

Fix up handling of "complementary" package installation (dev, dbg, doc,
etc.) and introduce a staticdev-pkgs IMAGE_FEATURES feature.

Changes since the brown paper bag patchset that was v3:

* Remove bogus clearing of IMAGE_FEATURES in core-image-minimal
* Fix broken fix for errors with the ipk and deb backends if no
  complementary packages need to be installed that prevented it from
  actually installing anything (!)


The following changes since commit 4148bc80c008d25c8a536c7c7dfdeac1669a6662:

  libgcc: Add missing dependency on libc:do_package (2012-07-24 10:12:08 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/rootfs2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/rootfs2

Andrei Gherzan (1):
  package.bbclass: Create symlinks for packages with different packaged
    name

Paul Eggleton (5):
  classes/rootfs_rpm: improve speed of RPM rootfs construction
  classes/package_deb: add PackageArch field
  Rework installation of dev, dbg, doc, and locale packages
  classes/image: add staticdev-pkgs IMAGE_FEATURES feature
  buildhistory: improve performance of image info collection

 meta/classes/buildhistory.bbclass                 |   51 ++-
 meta/classes/image.bbclass                        |   93 ++---
 meta/classes/license.bbclass                      |    2 +-
 meta/classes/package.bbclass                      |    6 +-
 meta/classes/package_deb.bbclass                  |    1 +
 meta/classes/package_rpm.bbclass                  |  183 +++++-----
 meta/classes/populate_sdk_deb.bbclass             |    2 +
 meta/classes/populate_sdk_ipk.bbclass             |    2 +
 meta/classes/populate_sdk_rpm.bbclass             |    3 +
 meta/classes/rootfs_deb.bbclass                   |   51 ++-
 meta/classes/rootfs_ipk.bbclass                   |   50 ++-
 meta/classes/rootfs_rpm.bbclass                   |   69 ++--
 meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c |  376 +++++++++++++++++++++
 meta/recipes-devtools/rpm/rpmresolve_1.0.bb       |   22 ++
 scripts/oe-pkgdata-util                           |  167 +++++++++
 scripts/opkg-query-helper.py                      |   76 +++++
 16 files changed, 889 insertions(+), 265 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c
 create mode 100644 meta/recipes-devtools/rpm/rpmresolve_1.0.bb
 create mode 100755 scripts/oe-pkgdata-util
 create mode 100755 scripts/opkg-query-helper.py

-- 
1.7.9.5



