Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7E63773D8F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Apr 2015 15:43:26 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Apr 2015 08:43:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,595,1422950400"; d="scan'208";a="710920309"
Received: from pbrao1-mobl5.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.13.156])
	by fmsmga002.fm.intel.com with ESMTP; 17 Apr 2015 08:43:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Apr 2015 16:43:08 +0100
Message-Id: <80802343a694ddab76711d798c4dcd061d7e0f67.1429285210.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1429285210.git.paul.eggleton@linux.intel.com>
References: <cover.1429285210.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1429285210.git.paul.eggleton@linux.intel.com>
References: <cover.1429285210.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 2/3] lib/oe/package_manager: avoid traceback with no packages
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
X-List-Received-Date: Fri, 17 Apr 2015 15:43:26 -0000

If you were using deb packaging, had buildhistory enabled and produced
an SDK that contained no packages in one of the sysroots (such as with
uninative-tarball) then the do_populate_sdk was failing with a python
traceback because there were no fields to split in the output line.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 0460415..fffe11d 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -446,6 +446,8 @@ class DpkgPkgsList(PkgsList):
         if format == "file":
             tmp_output = ""
             for line in tuple(output.split('\n')):
+                if not line.strip():
+                    continue
                 pkg, pkg_file, pkg_arch = line.split()
                 full_path = os.path.join(self.rootfs_dir, pkg_arch, pkg_file)
                 if os.path.exists(full_path):
-- 
2.1.0


