Return-Path: <mac@mcrowe.com>
Received: from avasout02.plus.net (avasout02.plus.net [212.159.14.17])
	by mail.openembedded.org (Postfix) with ESMTP id 4A7A07ED5A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 12:51:09 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id n0Rehl3R06ogsn0Rfhwlqk; Mon, 15 Jul 2019 13:51:09 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=Y62GTSWN c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=0o9FgrsRnhwA:10 a=-An2I_7KAAAA:8 a=-pCSyJ0Nshot33JTvScA:9
	a=Sq34B_EcNBM9_nrAYB9S:22
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>)
	id 1hn0Rd-0000j6-S9; Mon, 15 Jul 2019 13:51:05 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jul 2019 13:50:59 +0100
Message-Id: <20190715125100.14288-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfJV2csvcPH0nBrohCT0AAyP6YOIYjd+wiONsj7aMcTaNAzJn0KGhj0g5bFNtDOYAmSnSlfiKfnCIQyfIAgmgS8pAjXj//OjbixH08qEjq8AqgCH8ZkSz
	nG9LaeNhhyWtx7Hpnk5U/XLgJz3d5qqGDfbbKP2b1B1+6lmyTPmvljC6
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH 1/2] rootfs-postcommands: Cope with empty IMAGE_LINK_NAME in write_image_manifest
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
X-List-Received-Date: Mon, 15 Jul 2019 12:51:09 -0000
Content-Transfer-Encoding: 8bit

Ensure that we don't create a symlink named ".manifest" if IMAGE_LINK_NAME
is empty.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/classes/rootfs-postcommands.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 89f8efd323..a2fe3dea2b 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -260,7 +260,7 @@ python write_image_manifest () {
     with open(manifest_name, 'w+') as image_manifest:
         image_manifest.write(format_pkg_list(pkgs, "ver"))
 
-    if os.path.exists(manifest_name):
+    if os.path.exists(manifest_name) and link_name:
         manifest_link = deploy_dir + "/" + link_name + ".manifest"
         if os.path.lexists(manifest_link):
             os.remove(manifest_link)
-- 
2.20.1


