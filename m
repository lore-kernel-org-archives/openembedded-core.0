Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5DBD0735BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 16:40:25 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 Feb 2015 08:40:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,609,1418112000"; d="scan'208";a="680425584"
Received: from abarnicl-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.2.27])
	by fmsmga002.fm.intel.com with ESMTP; 19 Feb 2015 08:40:26 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Feb 2015 16:39:54 +0000
Message-Id: <8a97f5b880c2be7fe3b1f65f852f8f53e416fc87.1424363815.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1424363815.git.paul.eggleton@linux.intel.com>
References: <cover.1424363815.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1424363815.git.paul.eggleton@linux.intel.com>
References: <cover.1424363815.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 05/15] classes/externalsrc: show a warning on compiling
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
X-List-Received-Date: Thu, 19 Feb 2015 16:40:25 -0000

Make sure there's no chance of anyone forgetting they have a recipe set
up for externalsrc; otherwise you could get confused about what is going
on. (With our default logging setup we can't make it a note because the
UI doesn't forward those; otherwise I would have used bb.note().)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/externalsrc.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 234bd8d..25f0be9 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -68,7 +68,13 @@ python () {
         for task in d.getVar("SRCTREECOVEREDTASKS", True).split():
             bb.build.deltask(task, d)
 
+        d.prependVarFlag('do_compile', 'prefuncs', "externalsrc_compile_prefunc ")
+
         # Ensure compilation happens every time
         d.setVarFlag('do_compile', 'nostamp', '1')
 }
 
+python externalsrc_compile_prefunc() {
+    # Make it obvious that this is happening, since forgetting about it could lead to much confusion
+    bb.warn('Compiling %s from external source %s' % (d.getVar('PN', True), d.getVar('EXTERNALSRC', True)))
+}
-- 
1.9.3


