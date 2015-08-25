Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 62AE776C61
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 09:04:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 25 Aug 2015 02:04:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,744,1432623600"; d="scan'208";a="790394692"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 25 Aug 2015 02:04:28 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 2D2F26A4083;
	Tue, 25 Aug 2015 02:03:37 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Aug 2015 12:04:19 +0300
Message-Id: <cover.1440492980.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v2 00/17] Build wic images with bitbake
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
X-List-Received-Date: Tue, 25 Aug 2015 09:04:54 -0000

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

The following changes since commit bb34181b42b62e0476ba9e12f9125ed9f785cf23:

  bitbake: lib/bb/main: avoid importing all server/UI modules on every execution (2015-08-24 23:47:07 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/wic-image-type
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/wic-image-type

Ed Bartosh (17):
  image.py: write bitbake variables to .env file
  oe-selftest: test generation of <image>.env
  wic: remove undescore from function name
  wic: add BitbakeVars class
  wic: create new method _parse_line
  wic: add default_image attribute to BitbakeVars
  wic: set default image
  wic: implement getting variables from .env files
  wic: implement --vars option
  wic: rename variable
  wic: deferred call of hlp.get_wic_plugins_help()
  image_types.bbclass: add wic image type
  wic-image-minimal: add wic image recipe and .wks
  oe-selftest: test building wic image by bitbake
  image.py: set bitbake variable ROOTFS_SIZE
  wic: use bitbake variable ROOTFS_SIZE
  image.py: add script output to the rootfs log

 meta/classes/image_types.bbclass                   |  12 ++
 meta/lib/oe/image.py                               |  32 +++++-
 meta/lib/oeqa/selftest/wic.py                      |  33 ++++++
 meta/recipes-extended/images/wic-image-minimal.bb  |  14 +++
 meta/recipes-extended/images/wic-image-minimal.wks |  10 ++
 scripts/lib/image/help.py                          |   6 +-
 scripts/lib/wic/imager/direct.py                   |  14 +++
 scripts/lib/wic/utils/oe/misc.py                   | 125 ++++++++++++++-------
 scripts/wic                                        |  14 ++-
 9 files changed, 212 insertions(+), 48 deletions(-)
 create mode 100644 meta/recipes-extended/images/wic-image-minimal.bb
 create mode 100644 meta/recipes-extended/images/wic-image-minimal.wks

--
Regards,
Ed


