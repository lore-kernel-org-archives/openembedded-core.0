Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.1397.1611246150445140456
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 08:22:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: SLmJyAYdiTnZabFH6VjLSVks57VueDEH4qyihK8eFER6EIITELcxndjY8Acn+fMgMIMQ5nTbkM
 we4apBmpJO0g==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="166392472"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="166392472"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:31 -0800
IronPort-SDR: TaHvMN39A0WPVVyIMGLKI1VvNlYnzq7D3kPBsfvr2Q/REJvZDVlDjE4AU5F9w2bjT2YOqvPZQt
 SDK/n8dSCTQA==
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="427413708"
Received: from yonshuta-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.145.18])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:29 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 11/20] wic: Add workdir argument
Date: Fri, 22 Jan 2021 00:21:56 +0800
Message-Id: <6136e1312fc69b1b6196aa2fb8986d99ad46e7a1.1611245974.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1611245974.git.anuj.mittal@intel.com>
References: <cover.1611245974.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Barker <pbarker@konsulko.com>

This allows the path for the temporary workdir used by wic to be set
when running wic from bitbake or directly from the command line.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2e7314ac3a3cab89de93c932e8efc75de0feb0a7)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 2 +-
 scripts/wic                              | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 0ca67b77d5..b329568c7a 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -62,7 +62,7 @@ class DirectPlugin(ImagerPlugin):
 
         self.name = "%s-%s" % (os.path.splitext(os.path.basename(wks_file))[0],
                                strftime("%Y%m%d%H%M"))
-        self.workdir = tempfile.mkdtemp(dir=self.outdir, prefix='tmp.wic.')
+        self.workdir = options.workdir or tempfile.mkdtemp(dir=self.outdir, prefix='tmp.wic.')
         self._image = None
         self.ptable_format = self.ks.bootloader.ptable
         self.parts = self.ks.partitions
diff --git a/scripts/wic b/scripts/wic
index 24700f380f..a741aed364 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -312,6 +312,8 @@ def wic_init_parser_create(subparser):
 
     subparser.add_argument("-o", "--outdir", dest="outdir", default='.',
                       help="name of directory to create image in")
+    subparser.add_argument("-w", "--workdir",
+                      help="temporary workdir to use for intermediate files")
     subparser.add_argument("-e", "--image-name", dest="image_name",
                       help="name of the image to use the artifacts from "
                            "e.g. core-image-sato")
-- 
2.29.2

