Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id EAF7773232
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 12:38:12 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1baMaL-0000NP-4m from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2016 05:38:13 -0700
Received: from awais-Precision-M4700.pkl.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.224.2; Thu, 18 Aug 2016 13:38:11 +0100
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Aug 2016 17:37:58 +0500
Message-ID: <1471523878-32164-1-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] insane.bbclass: handle INSANE_SKIP for license-checksum
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
X-List-Received-Date: Thu, 18 Aug 2016 12:38:13 -0000
Content-Type: text/plain

The function populate_lic_qa_checksum() is used to do the
QA test for license-checksum but it does not handle the
scenario where a package adds license-checksum to its
INSANE_SKIP and hence fails in such condition.
This patch adds handling of INSANE_SKIP to the
populate_lic_qa_checksum() function so it returns
cleanly in such a scenario.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 meta/classes/insane.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 2cb8cc0..719ecd4 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -697,6 +697,10 @@ python populate_lic_qa_checksum() {
     if lic == "CLOSED":
         return
 
+    if 'license-checksum' in (d.getVar('INSANE_SKIP_' + pn, True) or "").split():
+        bb.note("Skipping %s for license-checksum QA test", pn)
+        return
+
     if not lic_files and d.getVar('SRC_URI', True):
         package_qa_handle_error("license-checksum", pn + ": Recipe file fetches files and does not have license file information (LIC_FILES_CHKSUM)", d)
         return
-- 
1.9.1


