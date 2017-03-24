Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 050D077BC2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 15:04:12 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 24 Mar 2017 08:04:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,215,1486454400"; d="scan'208";a="78998676"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 24 Mar 2017 08:04:13 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id C8CB26A4080
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 08:04:06 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Mar 2017 17:03:20 +0200
Message-Id: <1490367800-28099-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1490367800-28099-1-git-send-email-maxin.john@intel.com>
References: <1490367800-28099-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/2] valgrind: correct the comparison logic in vg_regtest
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
X-List-Received-Date: Fri, 24 Mar 2017 15:04:14 -0000

do_diffs in the vg_regtest script compares the actual test output
against the expected test output and returns 0 if it matches.

Previous upgrade modified the return value of do_diffs() and that
resulted in ptest failures.

[YOCTO #8471]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch b/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch
index f5ac989..7985308 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch
@@ -100,7 +100,7 @@ index a441f42..cb05b52 100755
                  unlink("$name.$mid.out");
                  unlink(<$name.$mid.diff*>);
 -                return;
-+                return 1;
++                return 0;
              }
          }
      }
@@ -113,7 +113,7 @@ index a441f42..cb05b52 100755
         print "Failure encountered, stopping to loop\n";
         exit 1
      }
-+    return 0;
++    return 1;
  }
  
  sub do_one_test($$) 
-- 
2.4.0


