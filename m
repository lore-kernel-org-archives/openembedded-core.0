Return-Path: <peter.marko@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 413E07813F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 06:05:38 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v5765diX030794
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Jun 2017 08:05:39 +0200
Received: from dev.sbt.siemens.com ([163.242.44.98])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id v5765cBG021735;
	Wed, 7 Jun 2017 08:05:38 +0200
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id A6D2D1CB951;
	Wed,  7 Jun 2017 08:05:38 +0200 (CEST)
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jun 2017 08:04:30 +0200
Message-Id: <1496815471-23075-4-git-send-email-peter.marko@siemens.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1496815471-23075-1-git-send-email-peter.marko@siemens.com>
References: <1496815471-23075-1-git-send-email-peter.marko@siemens.com>
In-Reply-To: <1496647273-9693-1-git-send-email-peter.marko@siemens.com>
References: <1496647273-9693-1-git-send-email-peter.marko@siemens.com>
Subject: [PATCH v2 3/4] cve-check: clean cve-check recipe result before re-building
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
X-List-Received-Date: Wed, 07 Jun 2017 06:05:38 -0000

If there is cve report for a recipe in previous build and there
is no result for current one, old cves are kept in CVE_CHECK_DIR.
This happens on version upgrade or when cve/recipe is whitelisted.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes/cve-check.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 1f0b691..6f5b0f5 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -83,6 +83,11 @@ python cve_check_write_rootfs_manifest () {
 
     import shutil
 
+    if d.getVar("CVE_CHECK_COPY_FILES") == "1":
+        deploy_file = os.path.join(d.getVar("CVE_CHECK_DIR"), d.getVar("PN"))
+        if os.path.exists(deploy_file):
+            bb.utils.remove(deploy_file)
+
     if os.path.exists(d.getVar("CVE_CHECK_TMP_FILE")):
         bb.note("Writing rootfs CVE manifest")
         deploy_dir = d.getVar("DEPLOY_DIR_IMAGE")
-- 
2.1.4


