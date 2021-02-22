Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.36963.1614009640008517381
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:00:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: S8nEdS6BONqtUg4q6il4RwS+D26W/6oODusZlq92SjUNu0PhnslYwvfqbAl2KqMV56z+ZxHT11
 UzpX1YLlpKdg==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="181049262"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="181049262"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:00:41 -0800
IronPort-SDR: NMiil59ERc362xDGuw+KZ0qXE7xqF9lD3k1ijT3HTezzPYx0ZDJwW7bf4FNgs2YFndVWWeKA8q
 PBdg4L+2827A==
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="430301805"
Received: from yrajendx-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.39])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:00:40 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 02/30] wic: debug mode to keep tmp directory
Date: Tue, 23 Feb 2021 00:00:05 +0800
Message-Id: <04d334d5bc5353c39c5059d25d97f111a9e368d9.1614009417.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614009417.git.anuj.mittal@intel.com>
References: <cover.1614009417.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <Chee.Yang.Lee@intel.com>

files in wic tmp directory can be usefull for debugging, so do not remove
tmp directory when wic create run with debugging mode (-D or --debug).

also update wic.Wic.test_debug_short and wic.Wic.test_debug_long to
check for tmp directory.

[YOCTO#14216]

Signed-off-by: Lee Chee Yang <Chee.Yang.Lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a122e2418b67d38f691edcf8dd846c167d6b4fa9)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/selftest/cases/wic.py      | 2 ++
 scripts/lib/wic/plugins/imager/direct.py | 6 ++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 9f4a9db444..df2d2d225e 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -318,6 +318,7 @@ class Wic(WicTestCase):
                                    "--image-name=core-image-minimal "
                                    "-D -o %s" % self.resultdir)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
+        self.assertEqual(1, len(glob(self.resultdir + "tmp.wic*")))
 
     def test_debug_long(self):
         """Test --debug option"""
@@ -325,6 +326,7 @@ class Wic(WicTestCase):
                                    "--image-name=core-image-minimal "
                                    "--debug -o %s" % self.resultdir)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
+        self.assertEqual(1, len(glob(self.resultdir + "tmp.wic*")))
 
     def test_skip_build_check_short(self):
         """Test -s option"""
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 7e1c1c03ab..ea709e8c54 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -54,6 +54,7 @@ class DirectPlugin(ImagerPlugin):
         self.native_sysroot = native_sysroot
         self.oe_builddir = oe_builddir
 
+        self.debug = options.debug
         self.outdir = options.outdir
         self.compressor = options.compressor
         self.bmap = options.bmap
@@ -274,8 +275,9 @@ class DirectPlugin(ImagerPlugin):
             if os.path.isfile(path):
                 shutil.move(path, os.path.join(self.outdir, fname))
 
-        # remove work directory
-        shutil.rmtree(self.workdir, ignore_errors=True)
+        # remove work directory when it is not in debugging mode
+        if not self.debug:
+            shutil.rmtree(self.workdir, ignore_errors=True)
 
 # Overhead of the MBR partitioning scheme (just one sector)
 MBR_OVERHEAD = 1
-- 
2.29.2

