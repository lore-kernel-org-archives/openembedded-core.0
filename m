Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9D3BB77085
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 22:04:49 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP; 07 Sep 2016 15:04:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,297,1470726000"; d="scan'208";a="1026549969"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.9.194])
	by orsmga001.jf.intel.com with ESMTP; 07 Sep 2016 15:04:29 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2016 23:04:23 +0100
Message-Id: <cover.1473285523.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/2] Python 3 runqemu fixes
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
X-List-Received-Date: Wed, 07 Sep 2016 22:04:49 -0000

Note: This patch is against master-next, as the Python 3 runqemu hasn't made it
to master yet.
This supercedes my earlier one patch series "Python3 runqemu: remove use of subprocess.run()" (both versions)

Two fixes for the Python3 runqemu:
* Use of subprocess.run() in recent runqemu changes (by me) elevates the Python
  3 requirement from 3.4+ to 3.5+. Replace subprocess.run() with
  subprocess.check_output(), as that is available in Python 3.1+
* testimage calls runqemu from within a bitbake run, which prevents us from 
  using `bitbake -e` to determine bitbake environment variables. The test code
  exports an OE_TMPDIR variable which was used by the shell runqemu to 
  infer/guess paths into the sysroot. This patch does the equivalent.

Changes since "Python3 runqemu: remove use of subprocess.run()" v2:
* Fix typo in exception handler log message.
* Add extra fix to support testimage

Changes since "Python3 runqemu: remove use of subprocess.run()" v1:
* Fix printing of error message in exception handler

The following changes since commit 3df3462d81216d8b26a87d9915abd9de1b2c2faa:

  bitbake: cooker: record events on cooker exit (2016-09-06 23:18:06 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib joshuagl/runqemu
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=joshuagl/runqemu

Joshua Lock (2):
  runqemu: remove use of subprocess.run()
  runqemu: fixes for when invoked during a bitbake run

 scripts/runqemu | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

-- 
2.7.4

