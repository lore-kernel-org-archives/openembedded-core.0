Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob11.registeredsite.com (atl4mhob11.registeredsite.com
	[209.17.115.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7012A78485
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 13:43:22 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.207])
	by atl4mhob11.registeredsite.com (8.14.4/8.14.4) with ESMTP id
	v7HDhMtF017181
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 09:43:22 -0400
Received: (qmail 14505 invoked by uid 0); 17 Aug 2017 13:43:22 -0000
X-TCPREMOTEIP: 37.74.225.130
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO mikebuntu.TOPIC.LOCAL)
	(mike@milosoftware.com@37.74.225.130)
	by 0 with ESMTPA; 17 Aug 2017 13:43:21 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Aug 2017 15:43:18 +0200
Message-Id: <1502977398-8571-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.9.1
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH] qemuboot.bbclass: Prevent creating a link loop
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
X-List-Received-Date: Thu, 17 Aug 2017 13:43:23 -0000

When IMAGE_NAME and IMAGE_LINK_NAME are equal, do_write_qemuboot_conf will
create a symlink that links to itself.

Check if this is the case before creating the link.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta/classes/qemuboot.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 86b3060..0e21fc9 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -114,7 +114,8 @@ python do_write_qemuboot_conf() {
     with open(qemuboot, 'w') as f:
         cf.write(f)
 
-    if os.path.lexists(qemuboot_link):
-       os.remove(qemuboot_link)
-    os.symlink(os.path.basename(qemuboot), qemuboot_link)
+    if qemuboot_link != qemuboot:
+        if os.path.lexists(qemuboot_link):
+           os.remove(qemuboot_link)
+        os.symlink(os.path.basename(qemuboot), qemuboot_link)
 }
-- 
1.9.1


