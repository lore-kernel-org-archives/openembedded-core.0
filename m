Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3DF4277C5D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 14:39:43 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP; 26 Apr 2017 07:39:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,254,1488873600"; d="scan'208";a="253742001"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga004.fm.intel.com with ESMTP; 26 Apr 2017 07:39:43 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Apr 2017 17:39:42 +0300
Message-Id: <20170426143942.19020-1-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH] oeqa.utils.metadata: cope with invalid lines in os-release file
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
X-List-Received-Date: Wed, 26 Apr 2017 14:39:47 -0000

Don't crash if every line in /etc/os-release does not adhere to the
expected "key=val" format. E.g. CentOS 7 has empty lines in the file.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/utils/metadata.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/metadata.py b/meta/lib/oeqa/utils/metadata.py
index cb81155e54..d291ddb960 100644
--- a/meta/lib/oeqa/utils/metadata.py
+++ b/meta/lib/oeqa/utils/metadata.py
@@ -20,8 +20,10 @@ def get_os_release():
         return None
     with open(os_release_file) as fobj:
         for line in fobj:
-            key, value = line.split('=', 1)
-            data[key.strip().lower()] = value.strip().strip('"')
+            split = line.split('=', 1)
+            if len(split) == 2:
+                key, value = split
+                data[key.strip().lower()] = value.strip().strip('"')
     return data
 
 def metadata_from_bb():
-- 
2.12.0


