Return-Path: <Jian.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6EF9D65C75
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 08:44:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t068imuK023893
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Jan 2015 00:44:49 -0800 (PST)
Received: from localhost.localdomain (128.224.153.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 6 Jan 2015 00:44:48 -0800
From: Jian Liu <jian.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Jan 2015 16:44:47 +0800
Message-ID: <1420533887-13581-1-git-send-email-jian.liu@windriver.com>
X-Mailer: git-send-email 1.7.0.5
MIME-Version: 1.0
Subject: [PATCH 1/1] archiver: archived files contain symbol link files
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
X-List-Received-Date: Tue, 06 Jan 2015 08:44:56 -0000
Content-Type: text/plain

The archived files contains symbol link files. These files
can not be accessed out of the building host. Copy files
instead of creating symbol link when archiving.

Signed-off-by: Jian Liu <jian.liu@windriver.com>
---
 meta/lib/oe/patch.py | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index b838be8..324a37e 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -432,7 +432,15 @@ class QuiltTree(PatchSet):
         if not self.initialized:
             self.InitFromDir()
         PatchSet.Import(self, patch, force)
-        oe.path.symlink(patch["file"], self._quiltpatchpath(patch["file"]), force=True)
+
+        # if archiver work is being done, symbol link can not be used
+        src_file = patch["file"]
+        des_file = self._quiltpatchpath(patch["file"])
+        if "archiver" in des_file:
+           os.system("cp %s %s"%(src_file,des_file))
+        else:
+           oe.path.symlink(src_file, des_file, force=True)
+
         f = open(os.path.join(self.dir, "patches","series"), "a");
         f.write(os.path.basename(patch["file"]) + " -p" + patch["strippath"]+"\n")
         f.close()
-- 
1.8.3.2


