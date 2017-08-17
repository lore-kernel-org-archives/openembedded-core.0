Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 595 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 17 Aug 2017 11:00:00 UTC
Received: from atl4mhfb01.myregisteredsite.com
	(atl4mhfb01.myregisteredsite.com [209.17.115.55])
	by mail.openembedded.org (Postfix) with ESMTP id 70A2178468
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 11:00:00 +0000 (UTC)
Received: from atl4mhob15.registeredsite.com (atl4mhob15.registeredsite.com
	[209.17.115.53])
	by atl4mhfb01.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	v7HAo7aM028019 for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 06:50:07 -0400
Received: from mailpod.hostingplatform.com ([10.30.71.205])
	by atl4mhob15.registeredsite.com (8.14.4/8.14.4) with ESMTP id
	v7HAo435008113
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 06:50:04 -0400
Received: (qmail 28510 invoked by uid 0); 17 Aug 2017 10:50:04 -0000
X-TCPREMOTEIP: 37.74.225.130
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO mikebuntu.TOPIC.LOCAL)
	(mike@milosoftware.com@37.74.225.130)
	by 0 with ESMTPA; 17 Aug 2017 10:50:04 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Aug 2017 12:49:49 +0200
Message-Id: <1502966989-24289-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.9.1
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH] rootfs-postcommands.bbclass: Prevent linking testdata to itself
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
X-List-Received-Date: Thu, 17 Aug 2017 11:00:00 -0000

testdata and testdata_link may point to the same file, in particular
when IMAGE_LINK_NAME and IMAGE_NAME are equal.

Check if this is the case before creating a symlink that points to
itself and makes the next build fail.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta/classes/rootfs-postcommands.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 78f7c55..c92df7b 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -300,7 +300,8 @@ python write_image_test_data() {
     searchString = "%s/"%(d.getVar("TOPDIR")).replace("//","/")
     export2json(d, testdata,searchString=searchString,replaceString="")
 
-    if os.path.lexists(testdata_link):
-       os.remove(testdata_link)
-    os.symlink(os.path.basename(testdata), testdata_link)
+    if testdata_link != testdata:
+        if os.path.lexists(testdata_link):
+           os.remove(testdata_link)
+        os.symlink(os.path.basename(testdata), testdata_link)
 }
-- 
1.9.1


