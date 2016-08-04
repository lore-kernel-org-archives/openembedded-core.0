Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B1D00731D7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 09:02:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Aug 2016 02:02:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,470,1464678000"; d="scan'208";a="1008236816"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 04 Aug 2016 02:02:16 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Aug 2016 12:02:12 +0300
Message-Id: <1470301332-6878-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1470301332-6878-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1470301332-6878-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/2] package.bbclass: warn about files under symlinked directories
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
X-List-Received-Date: Thu, 04 Aug 2016 09:02:15 -0000

[YOCTO #9827]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/package.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index df010e1..a9709ad 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -268,6 +268,9 @@ def files_from_filevars(filevars):
             if dirname == '.':
                 continue
             if cpath.islink(parent):
+                bb.warn("FILES contains file '%s' which resides under a "
+                        "directory symlink. Please fix the recipe and use the "
+                        "real path for the file." % f[1:])
                 symlink_paths.append(f)
                 files[ind] = parent
                 f = parent
-- 
2.6.6


