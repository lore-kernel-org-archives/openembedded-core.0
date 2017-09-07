Return-Path: <juro.bystricky@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id DDA836025E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Sep 2017 00:34:01 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 06 Sep 2017 17:34:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,355,1500966000"; d="scan'208";a="126293230"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga004.jf.intel.com with ESMTP; 06 Sep 2017 17:34:02 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Sep 2017 17:33:57 -0700
Message-Id: <1504744438-53711-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH 0/1] qemurunner.py: simplify search for QEMU PID
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
X-List-Received-Date: Thu, 07 Sep 2017 00:34:02 -0000

This patch greatly simplifies the code in qemurunner.py that tries to determine the PID
of the running qemu (started by qemurunner->runqemu->...->qemu-system-xxx)).
The original code needed to search and analyze all processes to determine which
"qemu-system-xxx" was a direct descendant of qemurunner.py. As it turns out,
qemu can readily report its own PID, if asked via the argument "-pidfile file".
The new code passes this argument and then simply loops waiting for "file" to appear
(with a timeout value as before). Once this happens, it reads the contents of the
file and reports the value (PID).
The file containing the qemu PIDis deleted after qemurunner terminates.

The patch was tested with :

$ bitbake core-image-sato -c testimage
$ oe-selftest --all

Juro Bystricky (1):
  qemurunner.py: refactor searching for QEMU PID

 meta/lib/oeqa/utils/qemurunner.py | 303 +++++++++++++++++---------------------
 1 file changed, 136 insertions(+), 167 deletions(-)

-- 
2.7.4


