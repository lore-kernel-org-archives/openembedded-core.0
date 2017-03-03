Return-Path: <anibal.limon@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 4151C775D2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 22:57:36 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Mar 2017 14:57:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,239,1484035200"; d="scan'208";a="830712716"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.120])
	by FMSMGA003.fm.intel.com with ESMTP; 03 Mar 2017 14:57:37 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Mar 2017 17:01:07 -0600
Message-Id: <1488582067-25664-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH] buildhistory.bbclass: Only execute get_extra_sdkinfo when sdk is enabled
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
X-List-Received-Date: Fri, 03 Mar 2017 22:57:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If sdk ins't in BUILDHISTORY_FEATURES the get_extra_sdkinfo fails
because no information about sdk is generated in buildhistory repo.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 7251a2c..babcf57 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -550,7 +550,9 @@ END
 python buildhistory_get_extra_sdkinfo() {
     import operator
     import math
-    if d.getVar('BB_CURRENTTASK') == 'populate_sdk_ext':
+
+    if d.getVar('BB_CURRENTTASK') == 'populate_sdk_ext' and \
+            "sdk" in (d.getVar('BUILDHISTORY_FEATURES') or "").split():
         tasksizes = {}
         filesizes = {}
         for root, _, files in os.walk(d.expand('${SDK_OUTPUT}/${SDKPATH}/sstate-cache')):
-- 
2.1.4


