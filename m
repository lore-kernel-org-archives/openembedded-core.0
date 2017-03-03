Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 687B5776A6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 12:37:28 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 03 Mar 2017 04:37:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,237,1484035200"; d="scan'208";a="1117999715"
Received: from manuelal-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.4.231])
	by fmsmga001.fm.intel.com with ESMTP; 03 Mar 2017 04:37:28 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Mar 2017 14:37:24 +0200
Message-Id: <1488544647-31325-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1488544647-31325-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1488544647-31325-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [morty][PATCH 1/4] lib/oe/gpg_sign: sign rpm packages in chunks of 100
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
X-List-Received-Date: Fri, 03 Mar 2017 12:37:28 -0000

Split the file list into chunks in order to avoid
"OSError: [Errno 7] Argument list too long"

This would happend when a package has huge amount of subpackages, e.g.
glibc-locale.

[YOCTO #11069]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 874f5016fd4dc76bc867b68470297fe59e78a9e6)
---
 meta/lib/oe/gpg_sign.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index 38eb0cb..683ae5b 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -35,11 +35,12 @@ class LocalSigner(object):
             cmd += "--define '%%__gpg %s' " % self.gpg_bin
         if self.gpg_path:
             cmd += "--define '_gpg_path %s' " % self.gpg_path
-        cmd += ' '.join(files)
 
-        status, output = oe.utils.getstatusoutput(cmd)
-        if status:
-            raise bb.build.FuncFailed("Failed to sign RPM packages: %s" % output)
+        # Sign in chunks of 100 packages
+        for i in range(0, len(files), 100):
+            status, output = oe.utils.getstatusoutput(cmd + ' '.join(files[i:i+100]))
+            if status:
+                raise bb.build.FuncFailed("Failed to sign RPM packages: %s" % output)
 
     def detach_sign(self, input_file, keyid, passphrase_file, passphrase=None, armor=True):
         """Create a detached signature of a file"""
-- 
2.6.6


