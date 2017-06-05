Return-Path: <peter.marko@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 92EBD776D1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 07:36:08 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v557LOOK017588
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Jun 2017 09:21:25 +0200
Received: from dev.sbt.siemens.com ([163.242.44.98])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v557LOT8001562;
	Mon, 5 Jun 2017 09:21:24 +0200
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id 90BE81AC4AA;
	Mon,  5 Jun 2017 09:21:24 +0200 (CEST)
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Jun 2017 09:21:12 +0200
Message-Id: <1496647273-9693-5-git-send-email-peter.marko@siemens.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1496647273-9693-1-git-send-email-peter.marko@siemens.com>
References: <1496647273-9693-1-git-send-email-peter.marko@siemens.com>
Subject: [PATCH 4/5] cve-check: clean cve-check recipe result before re-building
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
X-List-Received-Date: Mon, 05 Jun 2017 07:36:09 -0000

If there is cve report for a recipe in previous build and there
is no result for current one, old cves are kept in CVE_CHECK_DIR.
This happens on version upgrade or when cve/recipe is whitelisted.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes/cve-check.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 9007a6e..21f3225 100644
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


