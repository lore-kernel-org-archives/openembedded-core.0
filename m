Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4983677011
	for <openembedded-core@openembedded.org>;
	Fri,  5 Aug 2016 20:30:33 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 05 Aug 2016 13:30:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,474,1464678000"; d="scan'208";a="151353130"
Received: from pgronows-mobl.amr.corp.intel.com (HELO
	alimonb-mobl1.zpn.intel.com) ([10.254.134.94])
	by fmsmga004.fm.intel.com with ESMTP; 05 Aug 2016 13:30:32 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Fri,  5 Aug 2016 15:30:30 -0500
Message-Id: <1470429030-30444-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH] oeqa/utils/httpserver.py: HTTPServer enable thread connection handling
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
X-List-Received-Date: Fri, 05 Aug 2016 20:30:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

HTTPServer now supports multiple connections using Python threads.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/utils/httpserver.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/httpserver.py b/meta/lib/oeqa/utils/httpserver.py
index bd76f36..7d12331 100644
--- a/meta/lib/oeqa/utils/httpserver.py
+++ b/meta/lib/oeqa/utils/httpserver.py
@@ -1,8 +1,9 @@
 import http.server
 import multiprocessing
 import os
+from socketserver import ThreadingMixIn
 
-class HTTPServer(http.server.HTTPServer):
+class HTTPServer(ThreadingMixIn, http.server.HTTPServer):
 
     def server_start(self, root_dir):
         import signal
-- 
2.1.4


