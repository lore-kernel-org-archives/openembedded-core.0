Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 9429C60248
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 22:47:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 07 Nov 2016 14:47:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,459,1473145200"; d="scan'208";a="1056519039"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.14.208])
	by orsmga001.jf.intel.com with ESMTP; 07 Nov 2016 14:47:37 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2016 22:47:21 +0000
Message-Id: <cover.1478558432.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/4] Make oe.lsb.distro_identifier() more consistent
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
X-List-Received-Date: Mon, 07 Nov 2016 22:47:37 -0000

The oe.lsb.distro_identifier() method call will return different identification
information depending on the source which is found to provide that information.

This series attempts to address this in two ways:
1) preferring os-release(5) as the source of distribution identification. this
  increasingly common standard mechanism is available on each of the build host
  distributions we commonly test on.
2) converting the distribution identifier to lower case before including it in
  the distro_identifier return value. This ensures that, for most of the tested
  distros, the identifier returned via the LSB code paths matches that returned
  by the os-release code paths.

The following changes since commit 98c6ebf1e05158c689e01b785d32757847cdb10c:

  oeqa/selftest/kernel.py: Add new file destined for kernel related tests (2016-11-01 10:05:40 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/liboe
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/liboe

Joshua Lock (4):
  lib/oe/path: remove duplicate import
  lib/oe/lsb: make the release dict keys consistent regardless of source
  lib/oe/lsb: prefer /etc/os-release for distribution data
  lib/oe/lsb: attempt to ensure consistent distro id regardless of
    source

 meta/lib/oe/lsb.py  | 70 +++++++++++++++++++++++++++++++++++------------------
 meta/lib/oe/path.py |  1 -
 2 files changed, 46 insertions(+), 25 deletions(-)

-- 
2.7.4

