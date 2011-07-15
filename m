Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>)
	id 1Qhmb0-0006kB-I0; Fri, 15 Jul 2011 19:57:31 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6FHFeMf013631;
	Fri, 15 Jul 2011 12:15:40 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2011 10:15:38 -0700
Message-Id: <1310750138-24607-1-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Koen Kooi <koen@openembedded.org>,
	Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
Subject: [PATCH] Fixed concurrency problem for ZIP packed recipes.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Jul 2011 17:57:31 -0000

From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>

The problem occured when unzip-native is not yet staged, and ZIP
archive unpacking already started resulting in failed do_unpack task.
Added NEED_UNZIP_FOR_UNPACK variable to use in recipes which do_unpack
with unzip utility but doesn't have '.zip' in SRC_URI (f.e. .EXE
windows self-extraction binaries).

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
Signed-off-by: Koen Kooi <koen@openembedded.org>
Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/classes/base.bbclass |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 0c2c546..2bd9cc2 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -354,6 +354,15 @@ python () {
         depends = depends + " xz-native:do_populate_sysroot"
         bb.data.setVarFlag('do_unpack', 'depends', depends, d)
 
+    # unzip-native should already be staged before unpacking ZIP recipes
+    need_unzip = bb.data.getVar('NEED_UNZIP_FOR_UNPACK', d, 1)
+    src_uri = bb.data.getVar('SRC_URI', d, 1)
+
+    if ".zip" in src_uri or need_unzip == "1":
+        depends = bb.data.getVarFlag('do_unpack', 'depends', d) or ""
+        depends = depends + " unzip-native:do_populate_staging"
+        bb.data.setVarFlag('do_unpack', 'depends', depends, d)
+
     # 'multimachine' handling
     mach_arch = bb.data.getVar('MACHINE_ARCH', d, 1)
     pkg_arch = bb.data.getVar('PACKAGE_ARCH', d, 1)
-- 
1.7.0.4



