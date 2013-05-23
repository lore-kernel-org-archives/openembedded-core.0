Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 30CDD6086B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 13:15:29 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2013 06:15:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,728,1363158000"; d="scan'208";a="342006790"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 23 May 2013 06:15:29 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2013 16:15:18 +0300
Message-Id: <cover.1369313581.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/7] run-postinsts refactoring
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
X-List-Received-Date: Thu, 23 May 2013 13:15:29 -0000

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

The following changes since commit f7b639e527a65f9ce77aef07651ac5ec1e094e52:

  rpm-postinsts.bb: enable postinst logging (2013-05-23 10:28:05 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/run_postinsts_refactor
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/run_postinsts_refactor

Laurentiu Palcu (7):
  systemd: add udev-utils dependency for udev-hwdb
  rootfs_*.bbclass: add some helper functions
  image.bbclass: remove unneeded files from the image
  core-image-minimal: do not remove packaging files in the rootfs
    postprocess
  run-postinsts: make it generic
  rootfs_rpm.bbclas: switch to using run-postinsts
  rpm: replace rpm-postinsts dependency with run-postinsts

 meta/classes/image.bbclass                         |   33 +++++++++++
 meta/classes/rootfs_deb.bbclass                    |   23 +++++++-
 meta/classes/rootfs_ipk.bbclass                    |   39 ++++++-------
 meta/classes/rootfs_rpm.bbclass                    |   25 ++++++++-
 meta/recipes-core/images/core-image-minimal.bb     |    2 -
 meta/recipes-core/systemd/systemd_199.bb           |    2 +
 .../dpkg/run-postinsts/run-postinsts               |   59 ++++++++++++--------
 .../dpkg/run-postinsts/run-postinsts.awk           |   30 ----------
 meta/recipes-devtools/dpkg/run-postinsts_1.0.bb    |    7 +--
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    2 +-
 10 files changed, 135 insertions(+), 87 deletions(-)
 delete mode 100644 meta/recipes-devtools/dpkg/run-postinsts/run-postinsts.awk

-- 
1.7.9.5


