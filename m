Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 37E2473308
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 15:00:16 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 11 Feb 2015 06:55:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,559,1418112000"; d="scan'208";a="664875931"
Received: from jjurski-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.24.180])
	by fmsmga001.fm.intel.com with ESMTP; 11 Feb 2015 07:00:06 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Feb 2015 14:59:56 +0000
Message-Id: <76fab91141104cd2b908ef27cac09191e2b7953f.1423666576.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1423666576.git.paul.eggleton@linux.intel.com>
References: <cover.1423666576.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1423666576.git.paul.eggleton@linux.intel.com>
References: <cover.1423666576.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 3/7] oe-pkgdata-util: fix read-value to handle data with colons in the value
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
X-List-Received-Date: Wed, 11 Feb 2015 15:00:16 -0000

The read-value subcommand was truncating the value if it contained
colons, for example FILES_INFO.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/oe-pkgdata-util | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 2baa9f4..1603dfb 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -162,7 +162,7 @@ def read_value(args):
         with open(pkgdata_file, 'r') as f:
             for line in f:
                 if line.startswith(valuename + ":"):
-                    val = line.split(': ')[1].rstrip()
+                    val = line.split(': ', 1)[1].rstrip()
         return val
 
     logger.debug("read-value('%s', '%s' '%s'" % (args.pkgdata_dir, args.valuename, packages))
-- 
1.9.3


