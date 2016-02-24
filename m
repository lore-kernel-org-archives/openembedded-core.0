Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 1A821771F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 14:52:34 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 24 Feb 2016 06:52:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,494,1449561600"; d="scan'208";a="893685922"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.7.109])
	by orsmga001.jf.intel.com with ESMTP; 24 Feb 2016 06:52:32 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 14:52:04 +0000
Message-Id: <cover.1456325292.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 00/10] Integrate swupd software updater
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
X-List-Received-Date: Wed, 24 Feb 2016 14:52:35 -0000

This series provides an initial set of changes to enable integration of the
swupd (https://clearlinux.org/features/software-update) software updater into an
image.

The changes are in the relatively early stages but I am hoping to land this work
before the M3 feature freeze so that the 2.1 release provides a foundation for
experimenting with swupd.

Approach:
An image that inherits the swupd-image bbclass will automatically have bundle
'chroots' created which contain the filesystem contents of the specified
bundles, with the contents of the inheriting image forming the default os-core
bundle.

The mechanism to achieve this is that several virtual image recipes are created
using the swupdbundle class, one for each defined bundle plus a 'mega' image
recipe. The 'mega' image contains the base image plus the contents of all of the
bundles, whilst bundle images contain only the base image plus the contents of a
single bundle.

We build the mega image first, then the base image (the one which inherits this
class) and finally all of the bundle images. Each non-mega image has a manifest
generated that lists the file contents of the image.

We took the approach of building images, rather than populating the chroot-like
bundle directories with a package manager, because various layers and recipes
make changes to the rootfs contents outside of the package manager, particularly
with IMAGE_POSTPROCESS_COMMAND, etc.

Once the images and their manifests have been created each bundle image manifest
is compared to the base image manifest in order to generate a list of files in
the bundle image which don't exist in the base image.
Files in this list are then preserved in the bundle directory for processing by
swupd-server in order to generate update artefacts.

Finally the binaries from swupd-server are called on the bundle directories to
generate the artefacts for consumption by a swupd client.

How to:
* inherit the swupd-image class in your core OS image. swupd-based OS's use
  bundles, the primary one of which, os-core, is defined as the contents of this
  image.
* Assign a list of names for bundles you wish to generate to the SWUPD_BUNDLES
  variable i.e.

  SWUPD_BUNDLES = "feature_one feature_two"
* Assign a list of packages for which their content should be included in a
  bundle to a varflag of BUNDLE_CONTENTS which matches the bundle name i.e.

  BUNDLE_CONTENTS[feature_one] = "package_one package_three package_six"
* Ensure the OS_VERSION variable is assigned an integer value and increased
  before each image build which should generate swupd update artefacts. This
  variable must echo the same version number as is used to set the VERSION_ID
  field of os-release as swupd-client will use it to check for updates.
* Publish the contents of ${DEPLOY_DIR}/swupd/${MACHINE}/${IMAGE_BASENAME}/www
  on a server for consumption by swupd-client
* Use swupd client sub-commands with the -u argument pointing to the contents
  published above

Known issues:
* shared pseudo database: the bundle chroot-like directories are generated
  per-recipe and processed by a task of the inheriting recipe. In order for the
  files generated outside of the base recipe to have correct permissions when
  processed by swupd-server we need to share a pseudo database across the
  recipes.
  This database is currently never cleaned up, which is likely to cause
  headaches due to the way pseudo operates on inodes that could be reused
  outside of pseudo's influence. We have yet to determine an appropriate time to
  perform housekeeping on this database (we essentially need the database to be
  removed when DEPLOY_DIR_SWUPD is removed).
* oe-swupd-helpers: this recipe provides stub implementations only of some
  swupd-client helpers. Anyone wishing to utilise swupd in a deployed image will
  need to at least override kernel_updater.sh and systemdboot_updater.sh.
* hard-coded paths: swupd assumes Clear Linux as a host OS and hard-codes
  several paths to directories, programs and configuration files on Clear.
* builds a lot of images: due to the approach taken there are n+2 images built,
  where n is the number of bundles defined in SWUPD_BUNDLES.
* creates a lot of duplicate files: due to the way swupd works by processing
  chroot-like bundle directories on each os release we potentially end up
  carrying a lot of duplicate files in DEPLOY_DIR_SWUPD. We intend to look at
  using the hardlink program to replace duplicate files in that directory with
  hard links in order to save disk space.
* requires far more testing: there are a lot of combinations of bundle contents,
  rootfs modification commands (IMAGE_POSTPROCESS_COMMAND,
  IMAGE_PREPROCESS_COMMAND, etc) that can affect the inputs to swupd and our
  testing has likely missed areas of issue.
* OS_VERSION: introduces a new variable for the OS version number when we
  already have a DISTRO_VERSION variable. This was done because swupd makes
  various assumptions about the version number which aren't necessarily true for
  traditional DISTRO_VERSION values in OE et al.

Example run:

# swupd verify -u 192.167.7.1/update
swupd-client software verify 2.87
  Copyright (C) 2012-2015 Intel Corporation
  bsdiff portions Copyright Colin Percival, see COPYING file for details

Verifying version 10
Verifying files
Inspected 2094 files
  0 files did not match
Verify succesdful

# swupd update -u 192.167.7.1/update
swupd-client software verify 2.87
  Copyright (C) 2012-2015 Intel Corporation
  bsdiff portions Copyright Colin Percival, see COPYING file for details

Update started.
Querying server version.
Perparing to update from 10 to 20
Querying current manifest.
Querying server manifest.
Running script 'Pre-update'
Downloading os-core pack for version 20
Extracting pack.

Statistics for going from version 20 to version 20:

    changed manifests : 3
    new manifests     : 0
    deleted manifests : 0

    changed files     : 258
    new files         : 35
    deleted files     : 0

 200...downloading files, this may take a while
Staging file content
Update was applied.
Update successful. System updated from version 10 to version 20
Calling post-update helper scripts.
No kernel update needed, skipping helper call out.
No bootloader updated needed, skipping helper call out.
Update exiting.

# swupd verify -u 192.167.7.1/update
swupd-client software verify 2.87
  Copyright (C) 2012-2015 Intel Corporation
  bsdiff portions Copyright Colin Percival, see COPYING file for details

Verifying version 20
Verifying files
Inspected 2112 files
  0 files did not match
Verify successful

---

The following changes since commit 205b446f3fc4a9885179a66a8dab9d81bcc63dca:

  uclibc: Do not use immediate expansion operator (2016-02-22 20:42:34 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/swupd
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/swupd

Joshua Lock (9):
  rsync: add native variant
  swupd-server: initial recipe 2.53
  hardlink: add new recipe
  swupdbundle: new class to generate virtual images for swupd-image
  swupd-image.bbclass: initial class to support swupd updater
  oe-swupd-helpers: provide swupd-client required helper scripts and
    units
  swupd-client: RDEPENDS on oe-swupd-helpers
  swupd-client: enable native builds
  os-release: sanitise VERSION_ID field

Mariano Lopez (1):
  swupd-client: Add recipe

 meta/classes/swupd-image.bbclass                   | 372 ++++++++++
 meta/classes/swupdbundle.bbclass                   |  59 ++
 meta/recipes-core/os-release/os-release.bb         |   9 +
 meta/recipes-devtools/rsync/rsync_3.1.2.bb         |   2 +
 meta/recipes-devtools/swupd/oe-swupd-helpers.bb    |  39 +
 .../swupd/oe-swupd-helpers/catalog-trigger.service |   8 +
 .../swupd/oe-swupd-helpers/clr_pre_update.sh       |  16 +
 .../swupd/oe-swupd-helpers/kernel_updater.sh       |   9 +
 .../oe-swupd-helpers/ldconfig-trigger.service      |   8 +
 .../swupd/oe-swupd-helpers/systemdboot_updater.sh  |  10 +
 .../oe-swupd-helpers/tmpfiles-trigger.service      |   8 +
 .../swupd/oe-swupd-helpers/update-triggers.target  |   5 +
 .../0001-Tolerate-quotes-in-os-release-files.patch |  59 ++
 ...hange-systemctl-path-to-OE-systemctl-path.patch |  31 +
 .../swupd-client/Fix-build-failure-on-Yocto.patch  |  36 +
 .../Right-usage-of-AC_ARG_ENABLE-on-bzip2.patch    |  38 +
 meta/recipes-devtools/swupd/swupd-client_2.87.bb   |  49 ++
 ...S-to-take-the-state-data-dir-as-an-argume.patch | 782 +++++++++++++++++++++
 ...argv-helper-for-safer-calls-to-system-uti.patch | 133 ++++
 ...re-option-to-re-enable-config-files-in-ma.patch |  66 ++
 ...ression-that-introduced-a-directory-named.patch |  29 +
 meta/recipes-devtools/swupd/swupd-server_2.53.bb   |  33 +
 meta/recipes-extended/hardlink/hardlink_0.3.0.bb   |  19 +
 23 files changed, 1820 insertions(+)
 create mode 100644 meta/classes/swupd-image.bbclass
 create mode 100644 meta/classes/swupdbundle.bbclass
 create mode 100644 meta/recipes-devtools/swupd/oe-swupd-helpers.bb
 create mode 100644 meta/recipes-devtools/swupd/oe-swupd-helpers/catalog-trigger.service
 create mode 100755 meta/recipes-devtools/swupd/oe-swupd-helpers/clr_pre_update.sh
 create mode 100755 meta/recipes-devtools/swupd/oe-swupd-helpers/kernel_updater.sh
 create mode 100644 meta/recipes-devtools/swupd/oe-swupd-helpers/ldconfig-trigger.service
 create mode 100755 meta/recipes-devtools/swupd/oe-swupd-helpers/systemdboot_updater.sh
 create mode 100644 meta/recipes-devtools/swupd/oe-swupd-helpers/tmpfiles-trigger.service
 create mode 100644 meta/recipes-devtools/swupd/oe-swupd-helpers/update-triggers.target
 create mode 100644 meta/recipes-devtools/swupd/swupd-client/0001-Tolerate-quotes-in-os-release-files.patch
 create mode 100644 meta/recipes-devtools/swupd/swupd-client/Change-systemctl-path-to-OE-systemctl-path.patch
 create mode 100644 meta/recipes-devtools/swupd/swupd-client/Fix-build-failure-on-Yocto.patch
 create mode 100644 meta/recipes-devtools/swupd/swupd-client/Right-usage-of-AC_ARG_ENABLE-on-bzip2.patch
 create mode 100644 meta/recipes-devtools/swupd/swupd-client_2.87.bb
 create mode 100644 meta/recipes-devtools/swupd/swupd-server/0001-Add-option-S-to-take-the-state-data-dir-as-an-argume.patch
 create mode 100644 meta/recipes-devtools/swupd/swupd-server/0001-Add-system_argv-helper-for-safer-calls-to-system-uti.patch
 create mode 100644 meta/recipes-devtools/swupd/swupd-server/0002-Add-configure-option-to-re-enable-config-files-in-ma.patch
 create mode 100644 meta/recipes-devtools/swupd/swupd-server/0002-Fix-regression-that-introduced-a-directory-named.patch
 create mode 100644 meta/recipes-devtools/swupd/swupd-server_2.53.bb
 create mode 100644 meta/recipes-extended/hardlink/hardlink_0.3.0.bb

--
2.5.0

