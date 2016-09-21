Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0BBD860616
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 19:35:50 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 21 Sep 2016 12:35:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,375,1470726000"; d="scan'208";a="1034348340"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.27.83])
	by orsmga001.jf.intel.com with ESMTP; 21 Sep 2016 12:35:50 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2016 20:35:35 +0100
Message-Id: <cover.1474484610.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/4] runqemu fixes for toolchain and sdk uses
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
X-List-Received-Date: Wed, 21 Sep 2016 19:35:52 -0000

Another round of fixes for runqemu to support common usage models such as being
called via the Eclipse plugin.

* don't immediately bail out if QB_SYSTEM_NAME isn't set (this variable is only
  set in a qemuboot.conf file), instead attempt to infer the correct qemu-system
  binary based on the machine name, rootfs name or kernel name
* always attempt to infer paths which aren't explicitly set, rather than only
  trying to infer them when the values in a qemuboot.conf aren't validate
* don't try and determine whether a MACHINE setting is correct when called From
  an sdk environment, bitbake isn't available in this context

[YOCTO #10309]

The following changes since commit b2771e17a5f301423f65be9f93c9c1b1e7f8ab93:

  oeqa/selftest/lic-checksum: don't report the expected failure to errors.yp (2016-09-20 15:10:37 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/runqemu
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/runqemu

Joshua Lock (4):
  runqemu: validate paths and attempt to infer unset paths
  runqemu: try and guess qemu-system binary when MACHINE isn't set
  runqemu: don't try and invoke bitbake when running in a toolchain env
  runqemu: don't fail during check_arg_machine()

 scripts/runqemu | 50 +++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 47 insertions(+), 3 deletions(-)

-- 
2.7.4

