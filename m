Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6A87B60088
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 22:45:53 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 Oct 2015 15:45:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,184,1444719600"; d="scan'208";a="817378701"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by fmsmga001.fm.intel.com with ESMTP; 22 Oct 2015 15:45:54 -0700
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 22:45:09 +0000
Message-Id: <1445553911-12721-1-git-send-email-benjamin.esquivel@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Cc: brian.avery@intel.com, randy.e.witt@intel.com
Subject: [PATCH 0/2] adding runtest/systemd boot time test
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
X-List-Received-Date: Thu, 22 Oct 2015 22:45:56 -0000

=Introduction=
there has been a number of bugs filed against failing systemd services,
or units, that appear to be random and very hard to reproduce. The bugs
have been found at the autobuilder instances and not much information
about what caused the failure can be found

example bugs for the aforementioned errors are YOCTO#8142 and
YOCTO#8141, there are others

these errors seemingly can be reproduced by constraining the resources
on the target for testing, putting a low amount of CPU at disposal and
making it test with other test targets simultaneously to also constrain
IO has gotten the failure to show up often enough to debug it

further debug showed that the service tests were failing due to the
kernel booting in a long time, a number of seconds that exceeds systemd's
timeout for units to finalize coming up. 404 failure samples were
checked and all of them showed a boot time that exceeded the timeout

=Change Description=
this change creates a test that measures the target boot time against
the unit timeout default, which is 90 seconds. If the booting time
exceeded 90 seconds then the test fails

the tests that check for systemd services are now dependant upon this
test, if the boot time test fails then the tests that check services
will be skipped

Benjamin Esquivel (2):
  systemd: test target boot time against unit timeout
  systemd: skip service tests on long boot times

 meta/lib/oeqa/runtime/systemd.py | 83 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 78 insertions(+), 5 deletions(-)

-- 
1.8.4.5


