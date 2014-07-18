Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4E4417054E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jul 2014 23:02:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 Jul 2014 16:02:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,688,1400050800"; d="scan'208";a="545600171"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga001.jf.intel.com with ESMTP; 18 Jul 2014 16:02:06 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Jul 2014 23:01:52 +0000
Message-Id: <7ebd83d37f946d8f169e4bec7e00bfeed6cc6408.1405724512.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 2.0.0
Cc: Darren Hart <dvhart@linux.intel.com>, california.l.sullivan@intel.com
Subject: [PATCH] kernelshark: Remove trace-cmd from the kernelshark package
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
X-List-Received-Date: Fri, 18 Jul 2014 23:02:10 -0000

Fixes [YOCTO 6550]

Images installing both trace-cmd and kernelshark would fail with:

error: file /usr/bin/trace-cmd conflicts between attempted installs of
kernelshark-1.2+git0+7055ffd37b-r3.core2_32 and
trace-cmd-1.2+git0+7055ffd37b-r3.core2_32

This patch removes ${bindir}/trace-cmd from the install prior to
packaging, as is already done with the ${datadir}.

Reported-by: California Sullivan <california.l.sullivan@intel.com>
Signed-off-by: Darren Hart <dvhart@linux.intel.com>
(cherry picked from commit eb08ae8f729ef77329892d19b23ddfdaa7953de0)
---
 meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb b/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
index e64abe2..9af91c9 100644
--- a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
+++ b/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
@@ -15,6 +15,7 @@ EXTRA_OEMAKE = "'CC=${CC}' 'AR=${AR}' 'prefix=${prefix}' gui"
 
 do_install() {
 	oe_runmake CC="${CC}" AR="${AR}" prefix="${prefix}" DESTDIR="${D}" install_gui
+	rm ${D}${bindir}/trace-cmd
 	rm -rf ${D}${datadir}/trace-cmd
 	rmdir ${D}${datadir}
 }
-- 
2.0.0


