Return-Path: <mac@mcrowe.com>
Received: from avasout02.plus.net (avasout02.plus.net [212.159.14.17])
	by mail.openembedded.org (Postfix) with ESMTP id 3345E7DE4B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2019 08:25:17 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id klR6hYqZI6ogsklR8htmyg; Tue, 09 Jul 2019 09:25:18 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=Y62GTSWN c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=0o9FgrsRnhwA:10 a=-An2I_7KAAAA:8 a=bBZSfkolZURaFVFiMgEA:9
	a=Sq34B_EcNBM9_nrAYB9S:22
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>)
	id 1hklR5-0006fQ-Q7; Tue, 09 Jul 2019 09:25:15 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jul 2019 09:25:09 +0100
Message-Id: <20190709082509.21956-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfLn+410CINxp47MukcvIsS5FFTCrkNmrmJc8z27uDYUcQ+f4OgqbRgkSrTkYeU3WWNQp27+cQtYChdB/W3T6JxFpM/Y3QlwmGO3nZI6xoVdiUT7oq7HW
	1HZbadfJjHiayHL9Ec8gSccdO4+nNDXMj0J7UjaCViI6RPiJYdEP5q13
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] image.bbclass: Only append to IMAGE_LINK_NAME if it was already set
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
X-List-Received-Date: Tue, 09 Jul 2019 08:25:18 -0000
Content-Transfer-Encoding: 8bit

create_symlinks does not create any links if IMAGE_LINK_NAME is empty.
Unfortunately, setup_debugfs_variables unconditionally appends '-dbg' which
results in a previously-empty IMAGE_LINK_NAME containing just '-dbg'. Let's
check that it's not empty before appending.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/classes/image.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 7daa97effb..682858dc95 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -328,7 +328,8 @@ addtask do_image_qa_setscene
 
 def setup_debugfs_variables(d):
     d.appendVar('IMAGE_ROOTFS', '-dbg')
-    d.appendVar('IMAGE_LINK_NAME', '-dbg')
+    if d.getVar('IMAGE_LINK_NAME'):
+        d.appendVar('IMAGE_LINK_NAME', '-dbg')
     d.appendVar('IMAGE_NAME','-dbg')
     d.setVar('IMAGE_BUILDING_DEBUGFS', 'true')
     debugfs_image_fstypes = d.getVar('IMAGE_FSTYPES_DEBUGFS')
-- 
2.20.1


