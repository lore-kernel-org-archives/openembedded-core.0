Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1StQZx-0004el-5x
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 23:54:13 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Jul 2012 14:42:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="196972489"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.58])
	by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2012 14:42:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jul 2012 22:42:23 +0100
Message-Id: <cover.1343079550.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/6] rootfs generation improvements v2
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
X-List-Received-Date: Mon, 23 Jul 2012 21:54:13 -0000

Fix up handling of "complementary" package installation (dev, dbg, doc,
etc.) and introduce a staticdev-pkgs IMAGE_FEATURES feature.

I've tested this with all backends using buildhistory to examine the
changes to the image contents, and compared the lists of files in the
SDK-from-image output with the rpm backend.

Changes since v1 of this series:

* The way packages were mapped to their dev equivalents was extremely
  naive. We now use pkgdata to map back to the actual dev package, which
  handles debian renaming properly (e.g. the zlib recipe produces a main
  package called libz1, whose corresponding dev package is libz-dev).
  This relies upon Andrei Gerzhan's pending fix to add symlinks to do
  reverse pkgdata lookups, which has been updated (to use a separate
  directory, always create the symlink even if the name is the same, and
  force the symlink so that it can be re-run without errors) and has
  been included in this series.
* Rework the rpm backend to use a separate C program to do the
  resolution of package name to package file, and consolidate the
  package list processing code.
* Improve performance of buildhistory data collection, using python
  helper script (ipk/deb backends) and the aforementioned C program
  (rpm backend) to avoid lots of slow sed/grep operations. As an
  example, a build of core-image-minimal-dev with the rpm backend went
  from about 13 mins to about 5 mins, so less than half the time.

The latter two changes seem unrelated, but due to us triggering some
kind of environment size limit with the rpm backend, a rethink of how
that code works was required, and this is the result. Overall, if
buildhistory is not enabled, with the rpm backend do_rootfs actually
takes a little bit longer than it did previously, however without the
work on performance I believe the impact would have been much greater.

Note: building core-image-lsb-sdk with these changes uncovered an
issue with the dhcp recipe packaging (patch already submitted to fix
this), and another issue with locale packages (bug 2815 filed).
Additionally it emphasises how the greedy dev/dbg package dependencies
drag in a lot of other seemingly extraneous packages; this will be
worked on separately (see bug 2599).



The following changes since commit da1de01aa74da0f38f07af523a9861824f7b0c95:

  Pyphon-native: Fix typo (2012-07-22 14:20:26 +0100)

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
 meta/classes/image.bbclass                        |   88 ++---
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
 16 files changed, 885 insertions(+), 264 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c
 create mode 100644 meta/recipes-devtools/rpm/rpmresolve_1.0.bb
 create mode 100755 scripts/oe-pkgdata-util
 create mode 100755 scripts/opkg-query-helper.py

-- 
1.7.9.5



