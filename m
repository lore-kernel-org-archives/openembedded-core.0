Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EE8516FCAE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 16:02:31 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 06 Jun 2014 09:02:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,990,1392192000"; d="scan'208";a="551006639"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 06 Jun 2014 09:02:07 -0700
Received: from localhost.localdomain (unknown [10.237.112.162])
	by linux.intel.com (Postfix) with ESMTP id 842946A4087;
	Fri,  6 Jun 2014 09:01:39 -0700 (PDT)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jun 2014 21:06:14 +0300
Message-Id: <1402077980-9548-1-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 0/6] YB #6375 #6254
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
X-List-Received-Date: Fri, 06 Jun 2014 16:02:32 -0000

This series of patches affects the automated runtime tests and introduces the following changes/features:

YB #6375: Add support for more rootfs compression formats
- The target controller dynamically determines what IMAGE_FSTYPES to use based on the value of supported_image_fstypes that each target controller defines or inherits. This is needed for:
    * givint the targer controllers the possibility to choose an image fstype that is actually built instead of relying on a hard-coded value
    * enable external scripts to predict the name of the rootfs file.
- Added bzip2 to the core-image-testmaster that decompresses the test roofs files. This is needed ATM for BSPs like beaglebone and edgeruter.

YB #6254: Set up automated testing of autobuilder images on real hardware
We need a script that fetches images from a remote http server(for now) and uses them to conduct runtime tests. For this we needed:
- to be able to import and use the testargetloader.py module to find the target controller beying used
- create and access classmethods from the target controllers that would give information about the images needed for download (like rootfs type and extra files)
- a script that could use the above, run the runtime tests and return the results

NOTE: This script relies on the merge of "[PATCH] oeqa/utils/commands.py: add support for postconfig option" allready on the mailing list.


Corneliu Stoicescu (6):
  targetcontrol.py: make possible dynamical determination of rootfs type
  masterimage.py: enable dynamical determination of rootfs type
  core-image-testmaster.bb: add bzip2 to image
  targetcontrol.py: Add a classmethod to get extra files needed by the
    target controllers
  oeqa/controllers/testtargetloader.py: add 'import os'
  scripts/test-remote-image: Add script for running runtime tests on
    remotely built images

 meta/lib/oeqa/controllers/masterimage.py           |   9 +-
 meta/lib/oeqa/controllers/testtargetloader.py      |   1 +
 meta/lib/oeqa/targetcontrol.py                     |  23 +-
 .../images/core-image-testmaster.bb                |   2 +-
 scripts/test-remote-image                          | 340 +++++++++++++++++++++
 5 files changed, 369 insertions(+), 6 deletions(-)
 create mode 100755 scripts/test-remote-image

-- 
1.8.3.2


