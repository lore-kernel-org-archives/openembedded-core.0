Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 905057711B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 13:01:36 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 06 Nov 2015 05:01:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,252,1444719600"; d="scan'208";a="844154001"
Received: from bdiacone-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.207])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2015 05:01:36 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 13:01:20 +0000
Message-Id: <a31d9c5f3d7e38d40e4a909f6f53d70d0a31b957.1446814828.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1446814828.git.paul.eggleton@linux.intel.com>
References: <cover.1446814828.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1446814828.git.paul.eggleton@linux.intel.com>
References: <cover.1446814828.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/6] classes/distrodata: split SRC_URI properly before determining type
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
X-List-Received-Date: Fri, 06 Nov 2015 13:01:36 -0000

We weren't splitting SRC_URI values containing multiple URIs here; this
didn't cause any errors except when a trailing ; was left on a URI, in
which case the next URI was considered part of the parameter, which
didn't contain a = and therefore was considered invalid.

We only care about the first URI in SRC_URI in this context (since
that's the upstream URI by convention) so split it as we should and take
the first item.

Fixes [YOCTO #8645].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/distrodata.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index 5a4c1b6..44c06e1 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -271,9 +271,9 @@ python do_checkpkg() {
         from bb.fetch2 import FetchError, NoMethodError, decodeurl
 
         """first check whether a uri is provided"""
-        src_uri = d.getVar('SRC_URI', True)
+        src_uri = (d.getVar('SRC_URI', True) or '').split()
         if src_uri:
-            uri_type, _, _, _, _, _ = decodeurl(src_uri)
+            uri_type, _, _, _, _, _ = decodeurl(src_uri[0])
         else:
             uri_type = "none"
 
-- 
2.1.0


