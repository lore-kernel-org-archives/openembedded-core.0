Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QZ7bB-0004fE-0j
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 22:31:01 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 21 Jun 2011 13:27:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,402,1304319600"; d="scan'208";a="17934254"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by orsmga001.jf.intel.com with ESMTP; 21 Jun 2011 13:27:26 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jun 2011 13:27:12 -0700
Message-Id: <cover.1308687821.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
Subject: [btrfs patch 0/6] enable btrfs images
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
X-List-Received-Date: Tue, 21 Jun 2011 20:31:01 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

These patches enable the btrfs image support in the poky tree.
Other than kernel parts all the parts are ready here. linux-yocto-2.6.37 
kernel need some work to get latest btrfs working, and that part will 
be sent separately.

The following changes since commit 2163461ec94528ecf046a04edc5db3d2dd3a6b8b:

  systemtap: remove non-core COMPATIBLE_MACHINES (2011-06-16 22:14:06 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/btrfs
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/btrfs

Nitin A Kamble (6):
  btrfs-tools: new recipe for tools to operate on btrfs images
  image-types.bbclass: get the image size in the whole number
  image_types.bbclass: enable btrfs as one of the image type
  qemu machine: enable btrfs as one of the supported filesystem
  base-files: add btrfs to /etc/filesystems
  scripts/runqemu: enable btrfs

 meta/classes/image_types.bbclass                   |    9 +-
 meta/conf/machine/include/qemu.inc                 |    2 +-
 .../recipes-core/base-files/base-files/filesystems |    1 +
 meta/recipes-core/base-files/base-files_3.0.14.bb  |    2 +-
 .../btrfs-tools/btrfs-tools/debian/01-labels.patch |   29 +
 .../btrfs-tools/btrfs-tools/debian/02-ftbfs.patch  |  125 +++
 .../btrfs-tools/btrfs-tools/debian/03-glibc.patch  |   16 +
 .../btrfs-tools/btrfs-tools/fix_use_of_gcc.patch   |   84 ++
 .../btrfs-tools/btrfs-tools/mkfs-xin-fixes.patch   |  183 ++++
 ...g-devices-so-degraded-filesystems-can-be-.patch |   64 ++
 ...-Check-for-RAID10-in-set_avail_alloc_bits.patch |   35 +
 ...t-the-root-generation-in-btrfs-debug-tree.patch |   33 +
 ...low-partial-FS-opens-for-btrfsck-scanning.patch |  253 +++++
 .../0005-Temporary-debugging-for-dragonn.patch     |   75 ++
 ...-add-a-btrfs-select-super-command-to-over.patch |  170 +++
 ...gs-use-safe-string-manipulation-functions.patch |  152 +++
 ...0003-Btrfs-progs-utils-Informative-errors.patch |   37 +
 ...-page-to-new-defragment-command-interface.patch |   99 ++
 ...prove-error-handling-in-the-btrfs-command.patch |  510 +++++++++
 ...progs-update-super-fields-for-space-cache.patch |   57 +
 ...-add-support-for-mixed-data-metadata-bloc.patch |  403 +++++++
 .../upstream-tmp/0008-Update-for-lzo-support.patch |  203 ++++
 ...pdate-clean-up-btrfs-help-and-man-page-V2.patch |  272 +++++
 ...0-Deprecate-btrfsctl-btrfs-show-btrfs-vol.patch |  152 +++
 ...11-Add-the-btrfs-filesystem-label-command.patch |  390 +++++++
 ...-Update-man-page-for-mixed-data-metadata-.patch |   42 +
 ...-Add-new-feature-to-mkfs.btrfs-to-make-fi.patch | 1108 ++++++++++++++++++++
 ...-fix-wrong-extent-buffer-size-when-readin.patch |   33 +
 ...5-btrfs-progs-add-discard-support-to-mkfs.patch |  110 ++
 .../btrfs-tools/btrfs-tools_git.bb                 |   52 +
 scripts/runqemu                                    |    6 +-
 scripts/runqemu-internal                           |   12 +-
 32 files changed, 4707 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/debian/01-labels.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/debian/02-ftbfs.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/debian/03-glibc.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_use_of_gcc.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/mkfs-xin-fixes.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-for-dragonn/0001-Fill-missing-devices-so-degraded-filesystems-can-be-.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-for-dragonn/0002-Check-for-RAID10-in-set_avail_alloc_bits.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-for-dragonn/0003-Print-the-root-generation-in-btrfs-debug-tree.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-for-dragonn/0004-Allow-partial-FS-opens-for-btrfsck-scanning.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-for-dragonn/0005-Temporary-debugging-for-dragonn.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0001-Btrfs-progs-add-a-btrfs-select-super-command-to-over.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0002-Btrfs-progs-use-safe-string-manipulation-functions.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0003-Btrfs-progs-utils-Informative-errors.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0004-update-man-page-to-new-defragment-command-interface.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0005-Improve-error-handling-in-the-btrfs-command.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0006-Btrfs-progs-update-super-fields-for-space-cache.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0007-Btrfs-progs-add-support-for-mixed-data-metadata-bloc.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0008-Update-for-lzo-support.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0009-Update-clean-up-btrfs-help-and-man-page-V2.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0010-Deprecate-btrfsctl-btrfs-show-btrfs-vol.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0011-Add-the-btrfs-filesystem-label-command.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0012-Btrfs-progs-Update-man-page-for-mixed-data-metadata-.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0013-btrfs-progs-Add-new-feature-to-mkfs.btrfs-to-make-fi.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0014-btrfs-progs-fix-wrong-extent-buffer-size-when-readin.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0015-btrfs-progs-add-discard-support-to-mkfs.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb

-- 
1.7.4.4



