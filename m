Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 60D6278519
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 18:00:37 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP; 17 Aug 2017 11:00:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,389,1498546800"; d="scan'208";a="1004911450"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by orsmga003.jf.intel.com with ESMTP; 17 Aug 2017 11:00:38 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Aug 2017 11:00:36 -0700
Message-Id: <20170817180036.109077-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH] report-error: provide distro identifier string in case of uninative build
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
X-List-Received-Date: Thu, 17 Aug 2017 18:00:37 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Besides providing the NATIVELSBSTRING, include distro info when creating
the (json) error report. This information provides better info than the
standard 'universal*' string for uninative builds.

[YOCTO #11824]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/classes/report-error.bbclass | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index d6fdd364ad..1c55abfbf3 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -29,6 +29,13 @@ python errorreport_handler () {
         import json
         import codecs
 
+        def nativelsb():
+            nativelsbstr = e.data.getVar("NATIVELSBSTRING")
+            # provide a bit more host info in case of uninative build
+            if e.data.getVar('UNINATIVE_URL') != 'unset':
+                return '/'.join([nativelsbstr, lsb_distro_identifier(e.data)])
+            return nativelsbstr
+
         logpath = e.data.getVar('ERR_REPORT_DIR')
         datafile = os.path.join(logpath, "error-report.txt")
 
@@ -38,7 +45,7 @@ python errorreport_handler () {
             machine = e.data.getVar("MACHINE")
             data['machine'] = machine
             data['build_sys'] = e.data.getVar("BUILD_SYS")
-            data['nativelsb'] = e.data.getVar("NATIVELSBSTRING")
+            data['nativelsb'] = nativelsb()
             data['distro'] = e.data.getVar("DISTRO")
             data['target_sys'] = e.data.getVar("TARGET_SYS")
             data['failures'] = []
-- 
2.12.3


