Return-Path: <stefanx.stanacar@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 38AC96B59C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Apr 2014 10:05:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Apr 2014 03:01:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,779,1389772800"; d="scan'208";a="485594575"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 02 Apr 2014 03:02:12 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.160])
	by linux.intel.com (Postfix) with ESMTP id 848826A4007;
	Wed,  2 Apr 2014 03:01:56 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Apr 2014 13:02:31 +0300
Message-Id: <1396432951-17436-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH] sanity: testimage needs DISPLAY set only for qemu targets
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
X-List-Received-Date: Wed, 02 Apr 2014 10:05:50 -0000

There's no point in failing if DISPLAY isn't set if we don't
boot a qemu image when using a controller like SimpleRemoteTarget
or GummibootTarget.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/classes/sanity.bbclass | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index dd7fe4c..989bdcd 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -672,9 +672,11 @@ def check_sanity_everybuild(status, d):
 
     # Check if DISPLAY is set if TEST_IMAGE is set
     if d.getVar('TEST_IMAGE', True) == '1' or d.getVar('DEFAULT_TEST_SUITES', True):
-        display = d.getVar("BB_ORIGENV", False).getVar("DISPLAY", True)
-        if not display:
-            status.addresult('testimage needs an X desktop to start qemu, please set DISPLAY correctly (e.g. DISPLAY=:1.0)\n')
+        testtarget = d.getVar('TEST_TARGET', True)
+        if testtarget == 'qemu' or testtarget == 'QemuTarget':
+            display = d.getVar("BB_ORIGENV", False).getVar("DISPLAY", True)
+            if not display:
+                status.addresult('testimage needs an X desktop to start qemu, please set DISPLAY correctly (e.g. DISPLAY=:1.0)\n')
 
     omask = os.umask(022)
     if omask & 0755:
-- 
1.9.0


