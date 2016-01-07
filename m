Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0989C73286
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 04:11:17 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 07 Jan 2016 20:11:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,536,1444719600"; d="scan'208";a="886244244"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by orsmga002.jf.intel.com with ESMTP; 07 Jan 2016 20:11:11 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 20:07:33 +0000
Message-Id: <cover.1452191688.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH 0/4] Clean PkgsList return data implementation.
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
X-List-Received-Date: Fri, 08 Jan 2016 04:11:19 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Currently the when calling the list() from the classes that inherit
from PKgsList, it must pass the format required and it will return
a formated string listing all the packages installed. Retruning such
string is not the best data structure to manipulate in the callers.

This series of patches change PkgsList to return a dictionary and the
callers will format the output as required.

This patches require: 

rpmresolve.c: Fix unfreed pointers that keep DB opened
http://patches.openembedded.org/patch/111021/

[YOCTO #7427]

The following changes since commit b9054f22526b89a752a07c5d4e6ca26afbf303aa:

  bitbake: fetch/git: Change to use clearer ssh url syntax for broken servers (2016-01-07 15:23:57 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug7427v3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug7427v3

Mariano Lopez (4):
  lib/oe/package_manager: Add list_pkgs() to PkgsList class
  lib/oe/utils: Add function format_pkg_list()
  lib/oe/rootfs: Use list_pkgs() instead of list()
  lib/oe/package_manager.py: Remove list() from PkgsList class

 meta/classes/buildhistory.bbclass        |  11 +-
 meta/classes/license.bbclass             |   8 +-
 meta/classes/populate_sdk_base.bbclass   |   8 +-
 meta/classes/rootfs-postcommands.bbclass |   5 +-
 meta/lib/oe/package_manager.py           | 185 +++++++++++++------------------
 meta/lib/oe/rootfs.py                    |   8 +-
 meta/lib/oe/sdk.py                       |   8 +-
 meta/lib/oe/utils.py                     |  22 ++++
 8 files changed, 129 insertions(+), 126 deletions(-)

-- 
1.8.4.5


