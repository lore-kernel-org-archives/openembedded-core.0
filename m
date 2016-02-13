Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4D03676DE1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 11:12:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 Feb 2016 03:12:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,440,1449561600"; d="scan'208";a="883635434"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 13 Feb 2016 03:12:41 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 12F416A4004
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 04:00:31 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Feb 2016 11:02:18 +0200
Message-Id: <ddadf61184c69ac7998ac2716575ccded9fd1545.1455353103.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1455353103.git.ed.bartosh@linux.intel.com>
References: <cover.1455353103.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1455353103.git.ed.bartosh@linux.intel.com>
References: <cover.1455353103.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v3 11/14] wic: fix processing of --use-uuid
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
X-List-Received-Date: Sat, 13 Feb 2016 11:12:40 -0000

Processing of this option was lost during recent change of
wks parsting. It was discovered during the work on booting
wic images under qemu. Now, when -use-uuid is fixed it's
possible to specify root partition by partition uuid.
This will be done in the following commit.

(From OE-Core rev: b4882e0b84d7fd4c85ee95386e94722485eafc2b)

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/wic/partition.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 9bb1a0a..55bcfba 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -57,7 +57,10 @@ class Partition(object):
         self.size = args.size
         self.source = args.source
         self.sourceparams = args.sourceparams
+        self.use_uuid = args.use_uuid
         self.uuid = args.uuid
+        if args.use_uuid and not self.uuid:
+            self.uuid = str(uuid.uuid4())
 
         self.lineno = lineno
         self.source_file = ""
-- 
2.1.4


