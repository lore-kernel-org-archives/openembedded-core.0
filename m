Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7D4146FFA1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Aug 2017 21:33:53 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Aug 2017 14:33:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,339,1498546800"; d="scan'208";a="1179988372"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga001.fm.intel.com with ESMTP; 07 Aug 2017 14:33:54 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Aug 2017 14:33:51 -0700
Message-Id: <20170807213351.600-2-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20170807213351.600-1-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20170807213351.600-1-leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH v3 2/2] sstatetests: limit the number of signature comparisons when differ
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
X-List-Received-Date: Mon, 07 Aug 2017 21:33:53 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

For perfomance reasons, limit the number of signature comparisons when
stamps differ. The limit set is hardcoded to 20.

[YOCTO #11651]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 40 +++++++++++++++++++----------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 0b36027918..6298443a18 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -458,6 +458,25 @@ http_proxy = "http://example.com/"
                     base = os.sep.join(root.rsplit(os.sep, 2)[-2:] + [name])
                     f[base] = shash
             return f
+
+        def compare_sigfiles(files, files1, files2, compare=False):
+            for k in files:
+                if k in files1 and k in files2:
+                    i_sigfile += 1
+                    print("%s differs:" % k)
+                    if compare:
+                        sigdatafile1 = self.topdir + "/tmp-sstatesamehash/stamps/" + k + "." + files1[k]
+                        sigdatafile2 = self.topdir + "/tmp-sstatesamehash2/stamps/" + k + "." + files2[k]
+                        output = bb.siggen.compare_sigfiles(sigdatafile1, sigdatafile2)
+                        if output:
+                            print('\n'.join(output))
+                elif k in files1 and k not in files2:
+                    print("%s in files1" % k)
+                elif k not in files1 and k in files2:
+                    print("%s in files2" % k)
+                else:
+                    assert "shouldn't reach here"
+
         files1 = get_files(self.topdir + "/tmp-sstatesamehash/stamps/")
         files2 = get_files(self.topdir + "/tmp-sstatesamehash2/stamps/")
         # Remove items that are identical in both sets
@@ -468,18 +487,11 @@ http_proxy = "http://example.com/"
             # No changes, so we're done
             return
 
-        for k in files1.keys() | files2.keys():
-            if k in files1 and k in files2:
-                print("%s differs:" % k)
-                sigdatafile1 = self.topdir + "/tmp-sstatesamehash/stamps/" + k + "." + files1[k]
-                sigdatafile2 = self.topdir + "/tmp-sstatesamehash2/stamps/" + k + "." + files2[k]
-                output = bb.siggen.compare_sigfiles(sigdatafile1, sigdatafile2)
-                if output:
-                    print('\n'.join(output))
-            elif k in files1 and k not in files2:
-                print("%s in files1" % k)
-            elif k not in files1 and k in files2:
-                print("%s in files2" % k)
-            else:
-                assert "shouldn't reach here"
+        files = list(files1.keys() | files2.keys())
+        # this is an expensive computation, thus just compare the first 'max_sigfiles_to_compare' k files
+        max_sigfiles_to_compare = 20
+        first, rest = files[:max_sigfiles_to_compare], files[max_sigfiles_to_compare:]
+        compare_sigfiles(first, files1.keys(), files2.keys(), compare=True)
+        compare_sigfiles(rest, files1.keys(), files2.keys(), compare=False)
+
         self.fail("sstate hashes not identical.")
-- 
2.12.3


