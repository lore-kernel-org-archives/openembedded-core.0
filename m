Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 066A66BD6F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 11:52:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r83Bq4JM013943
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Sep 2013 04:52:05 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 3 Sep 2013 04:52:04 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Sep 2013 07:51:59 -0400
Message-ID: <de9091dfe0d902de86a95fa1856c44f7fc4e6544.1378208967.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1378208967.git.liezhi.yang@windriver.com>
References: <cover.1378208967.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] archiver.bbclass: exclude recursive symlink for diff
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
X-List-Received-Date: Tue, 03 Sep 2013 11:52:04 -0000
Content-Type: text/plain

There would be errors if there are recursive symlinks in the ${S}:

diff: /xxx/udev/182-r8/udev-182/test/sys/block/loop0/bdi/subsystem/0:16/subsystem: recursive directory loop

We can check the recursive symlink and save it to the exclude file, then
the diff's --exclude-from argument can exclude them

[YOCTO #4986]

Signed-off-by: Valentin Cobelea <valentin.cobelea@enea.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/archiver.bbclass |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 66efe7d..f5ad562 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -493,6 +493,24 @@ def create_diff_gz(d):
     for i in exclude_from:
         f.write(i)
         f.write("\n")
+
+    symlinks = []
+    directories = []
+
+    # Add symlink and root dir to the separated lists for checking whether
+    # there is recursive symlink
+    for root, dirs, files in os.walk(os.getcwd(), followlinks=True):
+        if os.path.islink(root):
+            symlinks.append(root)
+        elif os.path.isdir(root):
+            directories.append(root)
+
+    # Check if there is a recursive symlink to a dir
+    for sym in symlinks:
+        if sym in directories:
+            # write the 'sym' in the 'exclude-from' file
+            f.write(os.path.basename(sym))
+
     f.close()
 
     s=d.getVar('S', True)
-- 
1.7.10.4


