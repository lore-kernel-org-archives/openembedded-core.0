Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id CBAA96C7E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 09:27:58 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 Sep 2013 02:28:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,943,1371106800"; d="scan'208";a="363220959"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.234])
	by azsmga001.ch.intel.com with ESMTP; 20 Sep 2013 02:28:00 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Sep 2013 10:27:51 +0100
Message-Id: <5e48791ccbb9ab86eef2f7dbbecb496a35ec6fcd.1379669217.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1379669217.git.paul.eggleton@linux.intel.com>
References: <cover.1379669217.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1379669217.git.paul.eggleton@linux.intel.com>
References: <cover.1379669217.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/5] classes/sanity: test for DISPLAY being set with testimage class
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
X-List-Received-Date: Fri, 20 Sep 2013 09:27:59 -0000

Update the sanity test for DISPLAY being set to handle the new testimage
class rather than the old imagetest-qemu class.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/sanity.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index feffed9..b8e5b02 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -627,11 +627,11 @@ def check_sanity_everybuild(status, d):
 
     check_supported_distro(d)
 
-    # Check if DISPLAY is set if IMAGETEST is set
-    if d.getVar( 'IMAGETEST', True ) == 'qemu':
+    # Check if DISPLAY is set if TEST_IMAGE is set
+    if d.getVar('TEST_IMAGE', True) == '1' or d.getVar('DEFAULT_TEST_SUITES', True):
         display = d.getVar("BB_ORIGENV", False).getVar("DISPLAY", True)
         if not display:
-            status.addresult('qemuimagetest needs an X desktop to start qemu, please set DISPLAY correctly (e.g. DISPLAY=:1.0)\n')
+            status.addresult('testimage needs an X desktop to start qemu, please set DISPLAY correctly (e.g. DISPLAY=:1.0)\n')
 
     omask = os.umask(022)
     if omask & 0755:
-- 
1.8.1.2


