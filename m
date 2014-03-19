Return-Path: <laurentiu.palcu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7A3096B8BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 10:56:06 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 19 Mar 2014 03:56:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,685,1389772800"; d="scan'208";a="495007800"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by fmsmga001.fm.intel.com with ESMTP; 19 Mar 2014 03:56:05 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Mar 2014 12:56:04 +0200
Message-Id: <cover.1395226050.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1395142153.git.laurentiu.palcu@intel.com>
References: <cover.1395142153.git.laurentiu.palcu@intel.com>
Subject: [PATCH v2 0/4] SDK buildhistory fixes (cover letter only)
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
X-List-Received-Date: Wed, 19 Mar 2014 10:56:08 -0000

v2:
 * I passed deploy_dir instead of target_rootfs to RpmPkgsList constructor...
   Strangely enough, this could be caught only when building core-image-minimal
   (which I didn't use in my tests).

The buildhistory dependency files for target/host SDK packages were not properly
created because the wrapper function called, list_installed_packages(), was always
looking in the image rootfs.

This patchset will rename the old wrapper function to image_list_installed_packages()
and create a new one, for SDK stuff, sdk_list_installed_packages().

The changes in package_manager.py, even though they appear to be lots, its the
same code moved around from one class to a newly created PkgsList class. So, the
logic remains the same.

Tested for all backends (buildhistory activated) with the following:

bitbake core-image-sato && bitbake -c populate_sdk core-image-sato

laurentiu

The following changes since commit 0150bc30d3674301631c2e9b6c64e01058fd1070:

  bitbake: runqueue: Really fix sigchld handling (2014-03-18 23:05:53 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/buildhistory_sdk_dep_files_fix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/buildhistory_sdk_dep_files_fix

Laurentiu Palcu (4):
  package_manager.py: create separate class for installed packages
    listing
  rootfs.py, sdk.py: adjust/create the wrappers for creating installed
    packages list
  image.bbclass, license.bbclass: adjust the name of
    list_installed_packages()
  buildhistory.bbclass: create proper dependency files for SDK

 meta/classes/buildhistory.bbclass |   40 ++--
 meta/classes/image.bbclass        |    4 +-
 meta/classes/license.bbclass      |    4 +-
 meta/lib/oe/package_manager.py    |  376 +++++++++++++++++++++----------------
 meta/lib/oe/rootfs.py             |   19 +-
 meta/lib/oe/sdk.py                |   18 ++
 6 files changed, 264 insertions(+), 197 deletions(-)

-- 
1.7.9.5


