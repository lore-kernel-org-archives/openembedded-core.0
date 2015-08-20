Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 448D865CBC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 11:56:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 20 Aug 2015 04:56:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,714,1432623600"; d="scan'208";a="787471288"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 20 Aug 2015 04:56:43 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 86C996A4005
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 04:55:54 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 14:56:13 +0300
Message-Id: <cover.1440071413.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/17] Build wic images with bitbake
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
X-List-Received-Date: Thu, 20 Aug 2015 11:56:44 -0000

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

The following changes since commit 6b8bb442880ef18097e47761f4f3b6f555f2877c:

  genericx86*: Update BSPs to use 4.1 Kernel (2015-08-19 18:05:56 +0100)

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
 meta/lib/oeqa/selftest/wic.py                      |  34 ++++++
 meta/recipes-extended/images/wic-image-minimal.bb  |  14 +++
 meta/recipes-extended/images/wic-image-minimal.wks |  10 ++
 scripts/lib/image/help.py                          |   6 +-
 scripts/lib/wic/imager/direct.py                   |  14 +++
 scripts/lib/wic/utils/oe/misc.py                   | 125 ++++++++++++++-------
 scripts/wic                                        |  14 ++-
 9 files changed, 213 insertions(+), 48 deletions(-)
 create mode 100644 meta/recipes-extended/images/wic-image-minimal.bb
 create mode 100644 meta/recipes-extended/images/wic-image-minimal.wks

--
Ed


