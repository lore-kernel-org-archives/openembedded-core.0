Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.1397.1611246150445140456
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 08:22:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: IpbzQ4RJDB1db3tgSasJgYukap/GyhHBPBNxe4nylMZKweuVNWmYZr1ZKb4anlkEREpT2PnEdN
 ceO1IQlOvCtA==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="166392475"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="166392475"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:32 -0800
IronPort-SDR: thYcK4Hseac94hQvQj4fe9BirC2hKPDtc/2aLvm22Kk1/TCkVvx4s8XhxO+yUXZ2Aw+e+Ioiju
 M2J8S7IQlhNQ==
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="427413744"
Received: from yonshuta-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.145.18])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:31 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 12/20] wic: Ensure internal workdir is not reused
Date: Fri, 22 Jan 2021 00:21:57 +0800
Message-Id: <365b10a95ac0b04ca48a53e55cf5a0a330f1bc2f.1611245974.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1611245974.git.anuj.mittal@intel.com>
References: <cover.1611245974.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Barker <pbarker@konsulko.com>

If a path is specified for the internal wic working directory using
the -w/--workdir argument then it must not already exist. Re-using a
previous workdir could easily result in rootfs and intermediate files
from a previous build being added to the current image.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2e40c8d4109024ff704c5ce40d98050ca7f34dd5)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index b329568c7a..f107e60089 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -62,7 +62,7 @@ class DirectPlugin(ImagerPlugin):
 
         self.name = "%s-%s" % (os.path.splitext(os.path.basename(wks_file))[0],
                                strftime("%Y%m%d%H%M"))
-        self.workdir = options.workdir or tempfile.mkdtemp(dir=self.outdir, prefix='tmp.wic.')
+        self.workdir = self.setup_workdir(options.workdir)
         self._image = None
         self.ptable_format = self.ks.bootloader.ptable
         self.parts = self.ks.partitions
@@ -78,6 +78,16 @@ class DirectPlugin(ImagerPlugin):
         self._image = PartitionedImage(image_path, self.ptable_format,
                                        self.parts, self.native_sysroot)
 
+    def setup_workdir(self, workdir):
+        if workdir:
+            if os.path.exists(workdir):
+                raise WicError("Internal workdir '%s' specified in wic arguments already exists!" % (workdir))
+
+            os.makedirs(workdir)
+            return workdir
+        else:
+            return tempfile.mkdtemp(dir=self.outdir, prefix='tmp.wic.')
+
     def do_create(self):
         """
         Plugin entry point.
-- 
2.29.2

