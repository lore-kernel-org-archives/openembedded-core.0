Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SvzIL-0003D0-TZ
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 01:22:38 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 30 Jul 2012 16:11:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="173355715"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.49])
	by orsmga001.jf.intel.com with ESMTP; 30 Jul 2012 16:10:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2012 00:10:55 +0100
Message-Id: <f4612ddce497c497c57af03ed5b35ab89ffa7e9e.1343689827.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343689827.git.paul.eggleton@linux.intel.com>
References: <cover.1343689827.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1343689827.git.paul.eggleton@linux.intel.com>
References: <cover.1343689827.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] classes/populate_sdk_base: don't break existing do_populate_sdk depends
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jul 2012 23:22:38 -0000

We set do_populate_sdk[depends] in populate_sdk_*.bbclass, but since
these are inherited at the top of populate_sdk_base.bbclass, those
values are wiped out by using = at the end of the latter class. Use +=
to avoid this.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_base.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 9483e93..55ec684 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -122,7 +122,7 @@ populate_sdk_log_check() {
 
 do_populate_sdk[dirs] = "${TOPDIR}"
 do_populate_sdk[nostamp] = "1"
-do_populate_sdk[depends] = "${@' '.join([x + ':do_populate_sysroot' for x in d.getVar('SDK_DEPENDS', True).split()])}"
+do_populate_sdk[depends] += "${@' '.join([x + ':do_populate_sysroot' for x in d.getVar('SDK_DEPENDS', True).split()])}"
 do_populate_sdk[rdepends] = "${@' '.join([x + ':do_populate_sysroot' for x in d.getVar('SDK_RDEPENDS', True).split()])}"
 do_populate_sdk[recrdeptask] = "do_package_write"
 addtask populate_sdk
-- 
1.7.9.5



