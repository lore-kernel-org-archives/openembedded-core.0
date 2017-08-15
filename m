Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BC7EF784D5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 21:40:04 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Aug 2017 14:40:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,379,1498546800"; d="scan'208";a="1183109639"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2017 14:40:05 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Aug 2017 14:40:02 -0700
Message-Id: <20170815214002.55130-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH] gpg_sign: perform rpm signing serially
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
X-List-Received-Date: Tue, 15 Aug 2017 21:40:04 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

gpg signing in file batches (which was default to 100) is a memory expensive
computation, causing trouble in some host machines (even on production AB
as seen on the bugzilla ID). Also, in terms of performance, there is no real
gain when rpm signing is done in batches. Considering the latter issues, perform the
rpm signing serially.

Log showing errors observed recently at AB workers:

    | gpg: signing failed: Cannot allocate memory
    | gpg: signing failed: Cannot allocate memory
    | error: gpg exec failed (2)
    | /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/work/core2-64-poky-linux/base-passwd/3.5.29-r0/deploy-rpms/core2_64/base-passwd-dev-3.5.29-r0.core2_64.rpm:

[YOCTO #11914]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oe/gpg_sign.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index f4d8b10e4b..5c7985a856 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -45,9 +45,9 @@ class LocalSigner(object):
             if fsk_password:
                 cmd += "--define '_file_signing_key_password %s' " % fsk_password
 
-        # Sign in chunks of 100 packages
-        for i in range(0, len(files), 100):
-            status, output = oe.utils.getstatusoutput(cmd + ' '.join(files[i:i+100]))
+        # Sign packages
+        for f in files:
+            status, output = oe.utils.getstatusoutput(cmd + ' ' + f)
             if status:
                 raise bb.build.FuncFailed("Failed to sign RPM packages: %s" % output)
 
-- 
2.12.3


