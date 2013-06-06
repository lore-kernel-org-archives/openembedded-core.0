Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D73206A68E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 07:41:13 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 06 Jun 2013 00:39:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,813,1363158000"; d="scan'208";a="325104374"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 06 Jun 2013 00:41:12 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jun 2013 10:41:11 +0300
Message-Id: <cover.1370502833.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1369313581.git.laurentiu.palcu@intel.com>
References: <cover.1369313581.git.laurentiu.palcu@intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH v2 0/7] run-postinsts refactoring
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
X-List-Received-Date: Thu, 06 Jun 2013 07:41:14 -0000

(cover letter only)

Changes in v2:
 * addressed an RPM issue that happened on AB. Interestingly, it happened only on
   certain distros. Our internal AB (running on Ubuntu server 12.04), didn't show
   any issues. So, what was the problem? We use a scriptlet wrapper to run the
   pre/post install scriptlets. What I missed in the previous patchset was that I
   didn't use the scriptlet wrapper when running the pre/post remove scriptlets
   and the context in which they ran was not correct. Hence, the update-rc.d used
   was the host's...
 * addresses Ross's request to move run-postinsts recipe out of dpkg directory,
   since it's generic now;

Paul, Mark would you please review the RPM changes please?

Thanks,
Laurentiu

Changes in v1:
Hi all,

My work at #4484 revealed that the package managers deb/ipk/rpm handle removal
of PM meta-data (when the PM is not deployed) and the delayed postinstalls
execution in their own way. Currently we have:
 * run-postinsts (for deb/ipk) and rpm-postinsts (for rpm) for running the delayed
   postinstalls on target when the PM is not part of the image;
 * opkg removes the meta-data and some uneeded packages whilst deb/rpm remove
   only the meta-data;
 * both opkg and deb have no way of running the delayed postinstalls on target,
   if package-management is not part of IMAGE_FEATURES, because the meta-data
   was deleted (and it would have been useless anyway since the PM is not installed);

That being said, this patchset tries to create a more unified solution for all
PM backends.

rpm-postinsts recipe is replaced by run-postinsts but I'll keep it in oe-core
for a while (a couple of weeks maybe), just in case the current solution does not
satisfy the RPM users (I doubt it though).

I did tests with core-image-minimal using sysvinit/systemd and with/without delayed
postinstalls. The results are as expected.

Thanks,
Laurentiu

The following changes since commit a62aed41f2d8f874f7ae24d0e5be5dbc66ea2199:

  lrzsz: check locale.h in configure (2013-06-04 15:55:46 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/run_postinsts_refactor_v2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/run_postinsts_refactor_v2

Laurentiu Palcu (7):
  rootfs_*.bbclass: add some helper functions
  image.bbclass: remove unneeded files from the image
  core-image-minimal: do not remove packaging files in the rootfs
    postprocess
  run-postinsts: make it generic
  rootfs_rpm.bbclass: switch to using run-postinsts
  package_rpm.bbclass: handle pre/post remove scriptlets
  rpm: replace rpm-postinsts dependency with run-postinsts

 meta/classes/image.bbclass                         |   33 ++++++++++++++
 meta/classes/package_rpm.bbclass                   |   16 ++++---
 meta/classes/rootfs_deb.bbclass                    |   23 +++++++++-
 meta/classes/rootfs_ipk.bbclass                    |   39 ++++++++--------
 meta/classes/rootfs_rpm.bbclass                    |   29 ++++++++++--
 meta/recipes-core/images/core-image-minimal.bb     |    2 -
 .../dpkg/run-postinsts/run-postinsts               |   36 ---------------
 .../dpkg/run-postinsts/run-postinsts.awk           |   30 -------------
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    2 +-
 .../run-postinsts/run-postinsts/run-postinsts      |   47 ++++++++++++++++++++
 .../{dpkg => run-postinsts}/run-postinsts_1.0.bb   |    7 ++-
 11 files changed, 159 insertions(+), 105 deletions(-)
 delete mode 100755 meta/recipes-devtools/dpkg/run-postinsts/run-postinsts
 delete mode 100644 meta/recipes-devtools/dpkg/run-postinsts/run-postinsts.awk
 create mode 100755 meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
 rename meta/recipes-devtools/{dpkg => run-postinsts}/run-postinsts_1.0.bb (68%)

-- 
1.7.9.5


