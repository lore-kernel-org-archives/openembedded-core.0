Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 683CA76DD8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 17:47:13 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 30 Aug 2015 10:47:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,435,1437462000"; d="scan'208";a="551420549"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Aug 2015 10:47:15 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 161A46A4005
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 10:46:22 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Aug 2015 20:46:57 +0300
Message-Id: <cover.1440956535.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/12] V3: Build wic images with bitbake
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
X-List-Received-Date: Sun, 30 Aug 2015 17:47:15 -0000

Hi Reviewers,

This patchset adds new image type 'wic' to the list of image types
supported by bitbake. This should allow to build partitioned image
the same way as any other images.

New image type can be used in image recipes almost the same way as other
image types. There is just one difference - <image>[.<machine>].wks file
should be put to the same location as image recipe.

To enable this functionality I've implemented generating .env files with
bitbake variables and reading them by wic. This seems to be the only way
to get bitbake variables in wic when it's run by bitbake as running
'bitbake -e' is not possible as bitbake is locked.

Test cases for new functionality and small improvements are also included
into this patchset.

Changes in V2:
- Fixed typo in the comment. Thanks Mario!
- Rebased on fresh master

Changes in V3:
- introduced WICVARS variable to define a list of variables used by wic.
  only variables mentioned in WICVARS will be written to <image>.env
- rebased on top of fresh master

The following changes since commit 6b17c3831897ee1d46a763d807c5bd863d426bc1:

  linux-yocto-3.14: Update to latest revisions (2015-08-30 12:47:51 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/wic-image-type
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/wic-image-type

Ed Bartosh (12):
  image.py: write bitbake variables to .env file
  oe-selftest: test generation of <image>.env
  wic: add BitbakeVars class
  wic: create new method _parse_line
  wic: add default_image attribute to BitbakeVars
  wic: set default image
  wic: implement getting variables from .env files
  wic: implement --vars option
  image_types.bbclass: add wic image type
  wic-image-minimal: add wic image recipe and .wks
  oe-selftest: test building wic image by bitbake
  wic: use bitbake variable ROOTFS_SIZE

 meta/classes/image_types.bbclass                   |  16 +++
 meta/lib/oe/image.py                               |  18 ++++
 meta/lib/oeqa/selftest/wic.py                      |  34 ++++++
 meta/recipes-extended/images/wic-image-minimal.bb  |  14 +++
 meta/recipes-extended/images/wic-image-minimal.wks |  10 ++
 scripts/lib/wic/imager/direct.py                   |  14 +++
 scripts/lib/wic/utils/oe/misc.py                   | 115 ++++++++++++++-------
 scripts/wic                                        |  12 ++-
 8 files changed, 195 insertions(+), 38 deletions(-)
 create mode 100644 meta/recipes-extended/images/wic-image-minimal.bb
 create mode 100644 meta/recipes-extended/images/wic-image-minimal.wks

--
Ed


