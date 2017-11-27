Return-Path: <v.vogelhuber@digitalendoscopy.de>
Received: from mx-relay14-hz1.antispameurope.com
	(mx-relay14-hz1.antispameurope.com [94.100.132.214])
	by mail.openembedded.org (Postfix) with ESMTP id 22A59782A9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 16:21:21 +0000 (UTC)
Received: from host-80-81-19-29.customer.m-online.net ([80.81.19.29]) by
	mx-relay14-hz1.antispameurope.com; Mon, 27 Nov 2017 17:21:22 +0100
Received: from DE028.digitendos.de (192.168.20.186) by srv-msx01.digitendos.de
	(192.168.20.14) with Microsoft SMTP Server (TLS) id 15.0.516.32;
	Mon, 27 Nov 2017 17:20:55 +0100
From: Volker Vogelhuber <v.vogelhuber@digitalendoscopy.de>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Nov 2017 17:20:55 +0100
Message-ID: <20171127162055.6612-2-v.vogelhuber@digitalendoscopy.de>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171127162055.6612-1-v.vogelhuber@digitalendoscopy.de>
References: <20171127162055.6612-1-v.vogelhuber@digitalendoscopy.de>
MIME-Version: 1.0
X-Originating-IP: [192.168.20.186]
X-ClientProxiedBy: srv-msx01.digitendos.de (192.168.20.14) To
	srv-msx01.digitendos.de (192.168.20.14)
X-cloud-security-sender: v.vogelhuber@digitalendoscopy.de
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on
	mx-relay14-hz1.antispameurope.com with E210B5803E5
X-cloud-security-connect: host-80-81-19-29.customer.m-online.net[80.81.19.29],
	TLS=1, IP=80.81.19.29
X-cloud-security: scantime:.2166
Subject: [PATCH] Allow specifying subdir for rootfs when using wic -e
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
X-List-Received-Date: Mon, 27 Nov 2017 16:21:22 -0000
Content-Type: text/plain

---
 scripts/lib/wic/ksparser.py              | 1 +
 scripts/lib/wic/partition.py             | 1 +
 scripts/lib/wic/plugins/source/rootfs.py | 7 ++++---
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 99b66eebc5..a9e07fcd2f 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -146,6 +146,7 @@ class KickStart():
         part.add_argument("--overhead-factor", type=overheadtype)
         part.add_argument('--part-type')
         part.add_argument('--rootfs-dir')
+        part.add_argument('--rootfs-subdir')
 
         # --size and --fixed-size cannot be specified together; options
         # ----extra-space and --overhead-factor should also raise a parser
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index b623bb9e6d..b42529ce48 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -53,6 +53,7 @@ class Partition():
         self.overhead_factor = args.overhead_factor
         self.part_type = args.part_type
         self.rootfs_dir = args.rootfs_dir
+        self.rootfs_subdir = args.rootfs_subdir
         self.size = args.size
         self.fixed_size = args.fixed_size
         self.source = args.source
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index aec720fb22..8dcf5a2872 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -83,7 +83,7 @@ class RootfsPlugin(SourcePlugin):
 
         part.rootfs_dir = cls.__get_rootfs_dir(rootfs_dir)
 
-        new_rootfs = None
+        new_rootfs = part.rootfs_dir
         # Handle excluded paths.
         if part.exclude_path is not None:
             # We need a new rootfs directory we can delete files from. Copy to
@@ -121,6 +121,7 @@ class RootfsPlugin(SourcePlugin):
                 else:
                     # Delete whole directory.
                     shutil.rmtree(full_path)
-
+        if not part.rootfs_subdir is None:
+            new_rootfs = os.path.join(new_rootfs, part.rootfs_subdir)
         part.prepare_rootfs(cr_workdir, oe_builddir,
-                            new_rootfs or part.rootfs_dir, native_sysroot)
+                            new_rootfs, native_sysroot)
-- 
2.11.0


