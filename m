Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefanx.stanacar@intel.com>) id 1ULbES-0002Zu-1E
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Mar 2013 16:28:44 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Mar 2013 08:08:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,373,1363158000"; d="scan'208";a="309162493"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 29 Mar 2013 08:10:33 -0700
Received: from localhost.localdomain (unknown [10.237.112.141])
	by linux.intel.com (Postfix) with ESMTP id 93B462C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2013 08:10:26 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Mar 2013 17:10:19 +0200
Message-Id: <cover.1364568244.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 0/4] script to run build tests and collect time metrics
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Mar 2013 15:28:44 -0000

Hello,

This script runs a series of standard tests and collects some metrics
(wall clock and size of tmp/). It takes care of dropping vm caches
(for which it need sudo access) and doing a fetchall first.
It uses /usr/bin/time to measure the wall clock for builds (not bash
internal time command).

The metrics collected are:
* time bitbake core-image-sato and size of tmp/ dir without sstate
* time bitbake virtual/kernel
* time bitbake core-image-sato and size of tmp/ without sstate but with rm_work enabled
* time bitbake core-image-sato -c rootfs with sstate
* three parsing time metrics (bitbake -p) with and without tmp/cache. 

The results are collected in build-perf-test/globalres.log for all commits
that it has run, and in a separate folder for ech run (called results-<rev>-<date>)
This is the same script used to collect the results for:
https://wiki.yoctoproject.org/wiki/Performance_Test#1.4_Perfomance_Data
It's still a work in progress and needs some improvements but it should be a good starting point.

Regards,
Stefan

The following changes since commit 2f4fe1ee111a3dff68ac1cea6f3f6767cd6fe4eb:

  bitbake: hob: Search strings and results should be persistent (2013-03-29 10:41:25 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib stefans/perf-test
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=stefans/perf-test

Stefan Stanacar (4):
  scripts/contrib/build-perf-test.sh: add a script for build performance
    tracking
  scripts/contrib/build-perf-test.sh: add a global results file
  scripts/contrib/build-perf-test.sh: add option to allow cherry-picking
    of fix revisions
  scripts/contrib/build-perf-test.sh: add timings for bitbake -p

 scripts/contrib/build-perf-test.sh | 348 +++++++++++++++++++++++++++++++++++++
 1 file changed, 348 insertions(+)
 create mode 100755 scripts/contrib/build-perf-test.sh

-- 
1.8.1.4



