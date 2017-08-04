Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 530EC60616
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Aug 2017 18:57:08 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Aug 2017 11:57:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,321,1498546800"; d="scan'208";a="886564396"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Aug 2017 11:57:08 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Aug 2017 11:57:03 -0700
Message-Id: <20170804185703.51157-2-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20170804185703.51157-1-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20170804185703.51157-1-leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 2/2] sstatetests: limit the number of signature comparisons when differ
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
X-List-Received-Date: Fri, 04 Aug 2017 18:57:08 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

For perfomance reasons, limit the number of signature comparisons when
stamps differ. The limit set is hardcoded to 20.

[YOCTO #11651]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 0b36027918..695e2a86d5 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -468,9 +468,15 @@ http_proxy = "http://example.com/"
             # No changes, so we're done
             return
 
+        i_sigfile, max_sigfiles_to_compare = 0, 20
         for k in files1.keys() | files2.keys():
             if k in files1 and k in files2:
+                i_sigfile += 1
                 print("%s differs:" % k)
+                # this is an expensive computation, thus just compare the first
+                # 'max_sigfiles_to_compare' k files
+                if i_sigfile > max_sigfiles_to_compare:
+                    continue
                 sigdatafile1 = self.topdir + "/tmp-sstatesamehash/stamps/" + k + "." + files1[k]
                 sigdatafile2 = self.topdir + "/tmp-sstatesamehash2/stamps/" + k + "." + files2[k]
                 output = bb.siggen.compare_sigfiles(sigdatafile1, sigdatafile2)
-- 
2.12.3


