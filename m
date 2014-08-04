Return-Path: <roxana.ciobanu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 52BD565D58
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 12:16:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Aug 2014 05:10:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,798,1400050800"; d="scan'208";a="553396851"
Received: from unknown (HELO roxana-OptiPlex-9010.rb.intel.com)
	([10.237.105.58])
	by orsmga001.jf.intel.com with ESMTP; 04 Aug 2014 05:16:15 -0700
From: Roxana Ciobanu <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Aug 2014 15:16:39 +0300
Message-Id: <fa6233e6804b85850496876aac25009533d9a6e5.1407154577.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1407154577.git.roxana.ciobanu@intel.com>
References: <cover.1407154577.git.roxana.ciobanu@intel.com>
In-Reply-To: <cover.1407154577.git.roxana.ciobanu@intel.com>
References: <cover.1407154577.git.roxana.ciobanu@intel.com>
Subject: [PATCH 1/1] scripts/send-error-report: fetch /Errors/ instead of /.
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
X-List-Received-Date: Mon, 04 Aug 2014 12:16:17 -0000

If HTTP_PROXY or http_proxy is set when the send-error-report script
is run, it will check to see if fetching / on the specified server
returns 200 without the proxy set. If it does it will assume that the
proxy is not needed. However this check can never work because
fetching / always redirects to /Errors/ in the current code and
thus returns code 301. This is fixed by fetching /Errors/ instead of /.

[YOCTO #YB6576]

Signed-off-by: Roxana Ciobanu <roxana.ciobanu@intel.com>
---
 scripts/send-error-report | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/send-error-report b/scripts/send-error-report
index 48d983b..c99d387 100755
--- a/scripts/send-error-report
+++ b/scripts/send-error-report
@@ -20,7 +20,7 @@ def handle_connection(server, data):
         # we need to check that the server isn't a local one, as in no_proxy
         try:
             temp = httplib.HTTPConnection(server, strict=True, timeout=5)
-            temp.request("GET", "/")
+            temp.request("GET", "/Errors/")
             tempres = temp.getresponse()
             if tempres.status == 200:
                 proxyrequired = False
-- 
1.9.1


