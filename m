Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E0C72739A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 18:14:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 16 Mar 2015 11:14:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,410,1422950400"; d="scan'208";a="666007094"
Received: from localhost.jf.intel.com ([10.7.201.37])
	by orsmga001.jf.intel.com with ESMTP; 16 Mar 2015 11:14:16 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2015 11:14:14 -0700
Message-Id: <1426529654-30535-3-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1426529654-30535-1-git-send-email-randy.e.witt@linux.intel.com>
References: <1426529654-30535-1-git-send-email-randy.e.witt@linux.intel.com>
Subject: [PATCH 2/2] lib/oeqa/selftest/lic-checksum: Add INHIBIT_DEFAULT_DEPS
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
X-List-Received-Date: Mon, 16 Mar 2015 18:14:16 -0000

The test_nonmatching_checksum doesn't need the default dependencies,
and they would just take extra time to generate.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/lib/oeqa/selftest/lic-checksum.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/lic-checksum.py b/meta/lib/oeqa/selftest/lic-checksum.py
index 9a9f7b2..92fc3a8 100644
--- a/meta/lib/oeqa/selftest/lic-checksum.py
+++ b/meta/lib/oeqa/selftest/lic-checksum.py
@@ -17,7 +17,8 @@ class LicenseTests(oeSelfTest):
         os.close(lic_file)
         self.track_for_cleanup(lic_path)
 
-        self.write_recipeinc('emptytest', 'LIC_FILES_CHKSUM = "file://%s;md5=d41d8cd98f00b204e9800998ecf8427e"' % lic_path)
+        self.write_recipeinc('emptytest', 'INHIBIT_DEFAULT_DEPS = "1"')
+        self.append_recipeinc('emptytest', 'LIC_FILES_CHKSUM = "file://%s;md5=d41d8cd98f00b204e9800998ecf8427e"' % lic_path)
         result = bitbake(bitbake_cmd)
 
         with open(lic_path, "w") as f:
-- 
1.9.3


