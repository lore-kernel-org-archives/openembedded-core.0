Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2249E73187
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 03:19:45 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 21 Dec 2015 19:19:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,462,1444719600"; d="scan'208";a="866907923"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.148.44])
	by fmsmga001.fm.intel.com with ESMTP; 21 Dec 2015 19:19:44 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 16:19:15 +1300
Message-Id: <2312f393e60c050465657939b505b18425caadc6.1450754300.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450754300.git.paul.eggleton@linux.intel.com>
References: <cover.1450754300.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1450754300.git.paul.eggleton@linux.intel.com>
References: <cover.1450754300.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/5] classes/base: don't print header if BUILDCFG_HEADER not set
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
X-List-Received-Date: Tue, 22 Dec 2015 03:19:45 -0000

If we don't want a header printed at the start of task execution (which
we'd prefer not to within the extensible SDK)  we can accomplish that by
clearing BUILDCFG_VARS and BUILDCFG_HEADER, but that was still printing
a load of blank lines. To keep things simple, check if BUILDCFG_HEADER
is set to something before printing a header.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/base.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index f856298..5fc9271 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -230,7 +230,8 @@ python base_eventhandler() {
                     statuslines.extend(flines)
 
         statusheader = e.data.getVar('BUILDCFG_HEADER', True)
-        bb.plain('\n%s\n%s\n' % (statusheader, '\n'.join(statuslines)))
+        if statusheader:
+            bb.plain('\n%s\n%s\n' % (statusheader, '\n'.join(statuslines)))
 
     # This code is to silence warnings where the SDK variables overwrite the 
     # target ones and we'd see dulpicate key names overwriting each other
-- 
2.5.0


