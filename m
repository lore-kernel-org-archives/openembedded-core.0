Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D106F771F5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 18:05:43 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 30 Jan 2017 10:05:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,312,1477983600"; d="scan'208";a="928256021"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga003.jf.intel.com with ESMTP; 30 Jan 2017 10:05:43 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jan 2017 10:02:12 -0800
Message-Id: <1485799333-7481-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: richard.purdie@intel.com, jurobystricky@hotmail.com
Subject: [PATCH v2 0/1] runqemu: disable network
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
X-List-Received-Date: Mon, 30 Jan 2017 18:05:44 -0000

Not all QEMU machines support network hardware emulation.
Those machines cannot be run by "runqemu", as network hardware is implicitly
always assumed. Trying to run them using "runqemu" would end up in
raise Exception('Failed to run %s' % cmd)

There is no way to disable network setup using qemuboot.conf nor command line
argument.

The patch for runqemu contains a simple fix that can disable the network using
qemuboot.conf, all that is required is to set the pre-existing variable
QB_NETWORK_DEVICE to "none".

A slightly more complex patch could contain support for command line argument
"nonetwork", similar to "nographic



Juro Bystricky (1):
  runqemu: allow bypassing of network setup

 meta/classes/qemuboot.bbclass | 3 ++-
 scripts/runqemu               | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.7.4


