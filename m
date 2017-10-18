Return-Path: <juro.bystricky@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C81E078200
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 23:55:13 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Oct 2017 16:55:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,398,1503385200"; d="scan'208";a="1026693489"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga003.jf.intel.com with ESMTP; 18 Oct 2017 16:55:11 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Oct 2017 16:55:12 -0700
Message-Id: <1508370913-63172-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH 0/1] util-linux-ptest fixes
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
X-List-Received-Date: Wed, 18 Oct 2017 23:55:14 -0000

This patch improves util-linux ptest package.
We don't manually disable any tests, so more tests are performed.
Also, we don't leak build host info into the package anymore, so the package
is now binary reproducible.

Results before (core-image-sato-sdk-ptest):

PASS:102
FAIL:21

Results after:

PASS: 340
FAIL: 11

The remaining failing tests can be addressed individually.
For example, "kill" fails 4 tests, but it is because we
don't test "kill" from util-linux but from util-procps.
If we select different "kill" alternative:

# update-alternatives --install /bin/kill kill /bin/kill/kill.util-linux 300

We will pass all "kill" tests as well, so we end up with only 7 failing tests.
There are about 59 tests that are skipped because some components are not installed
in core-image-sato-sdk-ptest.
(i.e. dmsetup, mdadm, scsi_debug_module, mkfs.cramfs, sntp, uuidgen, socat...)




Juro Bystricky (1):
  util-linux-ptest: various fixes

 meta/recipes-core/util-linux/util-linux.inc | 45 +++++++++++++++++------------
 1 file changed, 26 insertions(+), 19 deletions(-)

-- 
2.7.4


