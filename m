Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2085A606CB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 13:37:05 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 06 Oct 2016 06:37:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,454,1473145200"; d="scan'208";a="1061284043"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 06 Oct 2016 06:37:05 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Oct 2016 16:37:04 +0300
Message-Id: <1475761024-22533-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH v3] update-rc.d.bbclass: check that init script is executable before running it
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
X-List-Received-Date: Thu, 06 Oct 2016 13:37:09 -0000

Check that the init script that is going to be called in the prerm()
script really exists and is executable. There might be a packaging bug
or the script might've been removed already earlier in prerm().

[YOCTO #10299]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/update-rc.d.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index dfef2a2..348f3c0 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -37,7 +37,7 @@ fi
 }
 
 updatercd_prerm() {
-if [ -z "$D" ]; then
+if [ -z "$D" -a -x "${INIT_D_DIR}/${INITSCRIPT_NAME}" ]; then
 	${INIT_D_DIR}/${INITSCRIPT_NAME} stop
 fi
 }
-- 
2.6.6


