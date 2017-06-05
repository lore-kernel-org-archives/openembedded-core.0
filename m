Return-Path: <peter.marko@siemens.com>
X-Greylist: delayed 878 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 05 Jun 2017 07:36:06 UTC
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id BF0E86FFD8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 07:36:06 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v557LODe017577
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Jun 2017 09:21:24 +0200
Received: from dev.sbt.siemens.com ([163.242.44.98])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v557LOrC001558;
	Mon, 5 Jun 2017 09:21:24 +0200
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id 7BEFE1AC42A;
	Mon,  5 Jun 2017 09:21:24 +0200 (CEST)
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Jun 2017 09:21:10 +0200
Message-Id: <1496647273-9693-3-git-send-email-peter.marko@siemens.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1496647273-9693-1-git-send-email-peter.marko@siemens.com>
References: <1496647273-9693-1-git-send-email-peter.marko@siemens.com>
Subject: [PATCH 2/5] cve-check: add do_rootfs dependency on cve-check
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
X-List-Received-Date: Mon, 05 Jun 2017 07:36:07 -0000

Since do_rootfs depends on cve-check results of all recipes,
we need to recursively depend on recipe do_cve_check.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes/cve-check.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index d8ac412..f851ec4 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -104,6 +104,7 @@ python cve_check_write_rootfs_manifest () {
 }
 
 ROOTFS_POSTPROCESS_COMMAND_prepend = "${@'cve_check_write_rootfs_manifest; ' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
+do_rootfs[recrdeptask] += "${@'do_cve_check' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
 
 def get_patches_cves(d):
     """
-- 
2.1.4


