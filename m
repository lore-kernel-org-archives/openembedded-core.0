Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0A94F6E2D8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2014 15:05:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Feb 2014 07:01:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,786,1384329600"; d="scan'208";a="450167296"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 05 Feb 2014 07:05:15 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Feb 2014 17:05:14 +0200
Message-Id: <cover.1391612528.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1391427313.git.laurentiu.palcu@intel.com>
References: <cover.1391427313.git.laurentiu.palcu@intel.com>
Subject: [PATCH v3 00/51] Rootfs/image generation refactoring (cover letter only)
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
X-List-Received-Date: Wed, 05 Feb 2014 15:05:37 -0000

V3:
 * add simple check to just return if we're attempting to install packages and
   the list is empty;

V2:
 * fix building from feeds for opkg;
 * rebase;

Hi all,

First off: this large patchset adds no change in the rootfs/image creation
functionality. The main logic is supposed to be the same as before. Also, I
decided not to spam the list with this large patchset (49 patches) and I sent
only the cover-letter. Those who want to take a peak at the code, can have a
look by clicking the link below.

If people would like the patches sent to the list too, just say so.

Ok, what's it all about then? Here are the main changes:
 * all the old bash shell code (more then 90% of it anyway) has been ported to
   Python. This would, hopefully, make the code more readable and allows us to
   use some of the Python powerful features. The following new files were born,
   together with a fair amount of changes in some bbclass'es:

    > meta/lib/oe/manifest.py - implements the initial manifest creation (for now).
      This is a file containing the list of packages going into the final image.
      In theory, we should be able to use this file later to re-generate the
      rootfs from a package feed, outside bitbake environment;

    > meta/lib/oe/package_manager.py - implements the basic package management
      API: install/remove packages, update index DB/index file creation. This
      is mainly used by Rootfs/Sdk classes in order to generate the rootfs;

    > meta/lib/oe/rootfs.py - contains code for rootfs generation;

    > meta/lib/oe/image.py - the image creation part;

    > meta/lib/oe/sdk.py - populate the SDK target/host rootfs.

   With the new code, the entire do_rootfs routine in image.bbclass has now just
   3 function calls: create_manifest(), create_rootfs(), create_image(). In this
   order. Easier to debug just a certain part of the rootfs/image creation process.

 * Some performance improvement has been obtained in 2 areas: index file creation
   and image generation. These operations were serial in the old code. Now, they're
   done in parallel.

 * People complained about intercept scripts being hard to debug. That was because
   the old code used a log checking routine that scanned the logs for some
   standart error strings which were not necessarily errors. Hence, the intercepts
   had their stderr redirected to /dev/null. This was now removed since we can
   easily handle intercepts errors in python. So, errors will go to the log file.

That's about it. There is room for even further improvement, in the index creation
part. I had some code in place for that but I had to remove it, temporarily, due
to some synchronization issues. Hopefully, I'll find the issue and include that
piece back.

The code was tested on my machine and on a local AB for x86, x86-64, arm, ppc,
mips and build appliance. The builds and sanity tests finished successfully.

laurentiu

The following changes since commit 4e9eb77108c7e628ebd00ec848b8bc034802e197:

  sstate: Improve funciton checksums (2014-02-04 22:51:43 +0000)

are available in the git repository at:

  git://mirror.rb.intel.com/git.yoctoproject.org/poky-contrib lpalcu/rootfs_refactoring_ship_oecore

for you to fetch changes up to 8a4a72dae5b3b9452f20d1c45fdf196ae450aaf7:

  lib/oe/package_manager.py: check that package list is not empty (2014-02-05 16:57:52 +0200)

----------------------------------------------------------------
Hongxu Jia (18):
      lib/oe/manifest.py: add rpm image manifest creation
      lib/oe/package_manager.py: support RpmPM
      lib/oe/rootfs.py: support RpmRootfs
      lib/oe/rootfs.py: Tweak the rootfs removing operation
      rootfs.py: fix uninstall uneeded pkgs failed
      rootfs.py: strip kernel-abiversion useless readline
      lib/oe/image.py: fix get rootfs_extra_space failed
      image.bbclass/license.bbclass: ajustment list_installed_packages invoking
      license.bbclass: fix license_create_manifest failed
      lib/oe/sdk.py: support RpmRootfs
      image.bbclass/populate_sdk_base.bbclass: shift position of sdk complementary install definition
      Cleanup rootfs_rpm,package_rpm bbclass files
      lib/oe/rootfs.py: fix invoking rpm _handle_intercept_failure failed
      lib/oe/package_manager.py: fix invoking rpm save_rpmpostinist failed
      lib/oe/rootfs.py: fix invoking _run_intercepts failed
      populate_sdk_rpm.bbclass: remove old shell code
      package_manger.py/rootfs.py: rename save_rpmpostinist with save_rpmpostinst
      lib/oe/package_manager.py: moving global SCRIPTLET_FORMAT and DB_CONFIG_CONTENT to RpmPM

Laurentiu Palcu (33):
      lib/oe/utils.py: add pre/post process helper function
      lib/oe/image.py: add new image creation library
      lib/oe/manifest.py: add library for image manifest creation
      lib/oe/package_manager.py: add new package management library
      lib/oe/rootfs.py: add new library for rootfs creation
      Activate the new python rootfs/image creation routines
      oe/manifest.py: Add manifest creation for opkg
      package_(deb|ipk).bbclass: remove the stamp when creating package from cache
      lib/oe/manifest.py: create global variables for package types
      lib/oe/package_manager.py: add deploy dir locking mechanism
      lib/oe/package_manager.py: use the bitbake APT_ARGS variable
      lib/oe/package_manager.py: add support for opkg backend
      lib/oe/rootfs.py: add support for opkg backend
      Cleanup image,rootfs_ipk,package_ipk bbclass files
      image.bbclass, lib/oe/rootfs.py: remove intercept_scripts directory
      lib/oe/manifest.py: create manifests for SDK too
      lib/oe/rootfs.py: use Manifest.INSTALL_ORDER
      lib/oe/package_manager.py: fixes for dpkg backend
      lib/oe/sdk.py: add SDK class
      populate_sdk_base.bbclass: activate the new python routines
      image.bbclass: change POPULATE_SDK_POST_TARGET_COMMAND
      populate_sdk_(deb|ipk).bbclass: remove old shell code
      lib/oe/package_manager.py: RpmPM fixes
      lib/oe/rootfs.py: warn the user if intercept hooks fail
      scripts/postinst-intercepts: do not redirect errors to /dev/null
      lib/oe/package_manager.py: DpkgPM, use lock on deploy dir
      lib/oe/image.py: fix image size calculation routine
      lib/oe/package_manager.py: OpkgPM/DpkgPM fixes
      lib/oe/rootfs.py: OpkgRootfs, fix issue in _get_delayed_postinsts()
      lib/oe/package_manager.py: do not use stamps
      lib/oe/package_manager.py: OpkgPM, bad recommendation handling change
      rootfs.py, package_manager.py, sdk.py: Fix building from feeds feature for opkg
      lib/oe/package_manager.py: check that package list is not empty

 meta/classes/image.bbclass                      |  329 +-----
 meta/classes/image_types.bbclass                |  113 --
 meta/classes/license.bbclass                    |   16 +-
 meta/classes/package_deb.bbclass                |  151 +--
 meta/classes/package_ipk.bbclass                |  202 +---
 meta/classes/package_rpm.bbclass                |  472 --------
 meta/classes/populate_sdk_base.bbclass          |   63 +-
 meta/classes/populate_sdk_deb.bbclass           |   59 -
 meta/classes/populate_sdk_ipk.bbclass           |   54 -
 meta/classes/populate_sdk_rpm.bbclass           |  152 ---
 meta/classes/rootfs_deb.bbclass                 |  115 --
 meta/classes/rootfs_ipk.bbclass                 |  138 +--
 meta/classes/rootfs_rpm.bbclass                 |  184 ---
 meta/lib/oe/image.py                            |  239 ++++
 meta/lib/oe/manifest.py                         |  291 +++++
 meta/lib/oe/package_manager.py                  | 1375 +++++++++++++++++++++++
 meta/lib/oe/rootfs.py                           |  681 +++++++++++
 meta/lib/oe/sdk.py                              |  345 ++++++
 meta/lib/oe/utils.py                            |   12 +-
 scripts/postinst-intercepts/update_font_cache   |    2 +-
 scripts/postinst-intercepts/update_pixbuf_cache |    2 +-
 21 files changed, 3017 insertions(+), 1978 deletions(-)
 create mode 100644 meta/lib/oe/image.py
 create mode 100644 meta/lib/oe/manifest.py
 create mode 100644 meta/lib/oe/package_manager.py
 create mode 100644 meta/lib/oe/rootfs.py
 create mode 100644 meta/lib/oe/sdk.py

Hongxu Jia (18):
  lib/oe/manifest.py: add rpm image manifest creation
  lib/oe/package_manager.py: support RpmPM
  lib/oe/rootfs.py: support RpmRootfs
  lib/oe/rootfs.py: Tweak the rootfs removing operation
  rootfs.py: fix uninstall uneeded pkgs failed
  rootfs.py: strip kernel-abiversion useless readline
  lib/oe/image.py: fix get rootfs_extra_space failed
  image.bbclass/license.bbclass: ajustment list_installed_packages
    invoking
  license.bbclass: fix license_create_manifest failed
  lib/oe/sdk.py: support RpmRootfs
  image.bbclass/populate_sdk_base.bbclass: shift position of sdk
    complementary install definition
  Cleanup rootfs_rpm,package_rpm bbclass files
  lib/oe/rootfs.py: fix invoking rpm _handle_intercept_failure failed
  lib/oe/package_manager.py: fix invoking rpm save_rpmpostinist failed
  lib/oe/rootfs.py: fix invoking _run_intercepts failed
  populate_sdk_rpm.bbclass: remove old shell code
  package_manger.py/rootfs.py: rename save_rpmpostinist with
    save_rpmpostinst
  lib/oe/package_manager.py: moving global SCRIPTLET_FORMAT and
    DB_CONFIG_CONTENT to RpmPM

Laurentiu Palcu (33):
  lib/oe/utils.py: add pre/post process helper function
  lib/oe/image.py: add new image creation library
  lib/oe/manifest.py: add library for image manifest creation
  lib/oe/package_manager.py: add new package management library
  lib/oe/rootfs.py: add new library for rootfs creation
  Activate the new python rootfs/image creation routines
  oe/manifest.py: Add manifest creation for opkg
  package_(deb|ipk).bbclass: remove the stamp when creating package
    from cache
  lib/oe/manifest.py: create global variables for package types
  lib/oe/package_manager.py: add deploy dir locking mechanism
  lib/oe/package_manager.py: use the bitbake APT_ARGS variable
  lib/oe/package_manager.py: add support for opkg backend
  lib/oe/rootfs.py: add support for opkg backend
  Cleanup image,rootfs_ipk,package_ipk bbclass files
  image.bbclass, lib/oe/rootfs.py: remove intercept_scripts directory
  lib/oe/manifest.py: create manifests for SDK too
  lib/oe/rootfs.py: use Manifest.INSTALL_ORDER
  lib/oe/package_manager.py: fixes for dpkg backend
  lib/oe/sdk.py: add SDK class
  populate_sdk_base.bbclass: activate the new python routines
  image.bbclass: change POPULATE_SDK_POST_TARGET_COMMAND
  populate_sdk_(deb|ipk).bbclass: remove old shell code
  lib/oe/package_manager.py: RpmPM fixes
  lib/oe/rootfs.py: warn the user if intercept hooks fail
  scripts/postinst-intercepts: do not redirect errors to /dev/null
  lib/oe/package_manager.py: DpkgPM, use lock on deploy dir
  lib/oe/image.py: fix image size calculation routine
  lib/oe/package_manager.py: OpkgPM/DpkgPM fixes
  lib/oe/rootfs.py: OpkgRootfs, fix issue in _get_delayed_postinsts()
  lib/oe/package_manager.py: do not use stamps
  lib/oe/package_manager.py: OpkgPM, bad recommendation handling change
  rootfs.py, package_manager.py, sdk.py: Fix building from feeds
    feature for opkg
  lib/oe/package_manager.py: check that package list is not empty

 meta/classes/image.bbclass                      |  329 +-----
 meta/classes/image_types.bbclass                |  113 --
 meta/classes/license.bbclass                    |   16 +-
 meta/classes/package_deb.bbclass                |  151 +--
 meta/classes/package_ipk.bbclass                |  202 +---
 meta/classes/package_rpm.bbclass                |  472 --------
 meta/classes/populate_sdk_base.bbclass          |   63 +-
 meta/classes/populate_sdk_deb.bbclass           |   59 -
 meta/classes/populate_sdk_ipk.bbclass           |   54 -
 meta/classes/populate_sdk_rpm.bbclass           |  152 ---
 meta/classes/rootfs_deb.bbclass                 |  115 --
 meta/classes/rootfs_ipk.bbclass                 |  138 +--
 meta/classes/rootfs_rpm.bbclass                 |  184 ---
 meta/lib/oe/image.py                            |  239 ++++
 meta/lib/oe/manifest.py                         |  291 +++++
 meta/lib/oe/package_manager.py                  | 1375 +++++++++++++++++++++++
 meta/lib/oe/rootfs.py                           |  681 +++++++++++
 meta/lib/oe/sdk.py                              |  345 ++++++
 meta/lib/oe/utils.py                            |   12 +-
 scripts/postinst-intercepts/update_font_cache   |    2 +-
 scripts/postinst-intercepts/update_pixbuf_cache |    2 +-
 21 files changed, 3017 insertions(+), 1978 deletions(-)
 create mode 100644 meta/lib/oe/image.py
 create mode 100644 meta/lib/oe/manifest.py
 create mode 100644 meta/lib/oe/package_manager.py
 create mode 100644 meta/lib/oe/rootfs.py
 create mode 100644 meta/lib/oe/sdk.py

-- 
1.7.9.5


