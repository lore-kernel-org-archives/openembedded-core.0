Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 3258871CA5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 13:55:25 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 02 Feb 2017 05:55:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,324,1477983600"; d="scan'208";a="54730507"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 02 Feb 2017 05:55:26 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id BC22A6A4080
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 05:54:26 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2017 15:32:56 +0200
Message-Id: <cover.1486041986.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/3] wic: fix creation of working directory
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
X-List-Received-Date: Thu, 02 Feb 2017 13:55:26 -0000

Hi,

Changed working directory to be subdirectory of output dir.
This should fix several possible issues:
- current code uses mktemp which doesn't create anything
- default temporary directory is created in /tmp, which can
  cause wic to take long time to move result image as output
  directory can be on another partition
- possible disk space issues due to the /tmp usage

The following changes since commit 7d75fd29296a9c411881b4288bff2e02cb145a25:

  wic: remove syslinux.py (2017-02-01 12:46:17 +0200)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/refactoring-10619
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/refactoring-10619

Ed Bartosh (3):
  wic: engine: create output dir
  wic: direct: fix creation of work directory
  wic: get rid of image_output_dir variable

 scripts/lib/wic/engine.py                | 3 +++
 scripts/lib/wic/plugins/imager/direct.py | 2 +-
 scripts/wic                              | 6 +-----
 3 files changed, 5 insertions(+), 6 deletions(-)

--
2.1.4


