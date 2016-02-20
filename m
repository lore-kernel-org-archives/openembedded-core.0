Return-Path: <juro.bystricky@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2601377155
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Feb 2016 01:49:48 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 19 Feb 2016 17:49:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,473,1449561600"; d="scan'208";a="749734608"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.145])
	by orsmga003.jf.intel.com with ESMTP; 19 Feb 2016 17:49:48 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2016 17:37:21 -0800
Message-Id: <1455932242-852-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: jurobystricky@hotmail.com
Subject: [PATCH 0/1] Don't assume /proc/<pid>/io present
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
X-List-Received-Date: Sat, 20 Feb 2016 01:49:49 -0000

Latest enhancements to collect task statistics in the file
buildstats.bbclass also collect task I/O statistics using procfs interface.
However, it is not guaranteed the I/O counters are actually present. This depends
on how the kernel was configured. If the kernel was configured without
CONFIG_TASK_IO_ACCOUNTING=y, the corresponding procfs entries are missing.
This has been in fact observed in the wild (Build Appliance).
If we try to read the non-existent counters, we will basically hang bitbake.
The attached patch file checks for missing procfs entries and avoids
reading them if not present. 
Bitbake will also issue a one-time warning message at the start of a build.



Juro Bystricky (1):
  buildstats.bbclass: Don't assume /proc/<pid>/io present

 meta/classes/buildstats.bbclass | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

-- 
1.9.1


