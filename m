Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 44EFC719A4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 17:33:22 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 26 Oct 2017 10:33:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,301,1505804400"; 
   d="scan'208";a="1895111"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by orsmga002.jf.intel.com with ESMTP; 26 Oct 2017 10:33:24 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Oct 2017 10:33:18 -0700
Message-Id: <cover.1509034760.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Cc: limon.anibal@gmail.com
Subject: [PATCH 0/1] scripts/oe-selftest: oe-selftest-internal wrapper scripts that isolates execution
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
X-List-Received-Date: Thu, 26 Oct 2017 17:33:23 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

The below is a profiling experiment, running oe-selftest -r (the proposed
implementation, see patch description for more info):

Procedure:

With patch 1/1, multiple oe-selftest jobs can be launched in
parallel. One tool that launch jobs in parallel is GNU Parallel [1], allowing
to construct a simpole pipeline to execute all tests with a pool of four
jobs:

    $ echo $ALLTESTS | time parallel --jobs4 oe-selftest -r

where ALLTESTS is a variable containing all tests cases (modules) found by the
the runner (oe-selftest-internal) (i.e. ALLTESTS="$(oe-selftest -m |
awk '{ print $NF }' | grep -v ':')"). This is the result obtained from the
above command:

    739.57user 120.48system 45:34.61elapsed 31%CPU (0avgtext+0avgdata 124600maxresident)k
    390908inputs+15984336outputs (291major+20227951minor)pagefaults 0swaps


The import point on the above numbers is that isolation the oe-selftest execution per
module and using a parallelization tool, complete oe-selftest runs takes less than an hour,
beating current single-job times observed at main auto-buildes.

Profiling results were obtained on a machine with 88 Intel Xeon with 88 cores

[1] https://www.gnu.org/software/parallel/

The following changes since commit 65d23bd7986615fdfb0f1717b615534a2a14ab80:

  README.qemu: qemuppc64 is not supported (2017-10-16 23:54:31 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lsandov1/oe-selftest-own-directory
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lsandov1/oe-selftest-own-directory

Leonardo Sandoval (1):
  scripts/oe-selftest: oe-selftest-internal wrapper scripts that
    isolates execution

 scripts/oe-selftest          | 102 +++++++++++++++++++++++--------------------
 scripts/oe-selftest-internal |  75 +++++++++++++++++++++++++++++++
 2 files changed, 129 insertions(+), 48 deletions(-)
 create mode 100755 scripts/oe-selftest-internal

-- 
2.12.3


