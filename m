Return-Path: <Kexin.Hao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6695A7999C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 07:09:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8T79cNp003366
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 00:09:38 -0700 (PDT)
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Sat, 29 Sep 2018 00:09:37 -0700
From: Kevin Hao <kexin.hao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2018 15:01:44 +0800
Message-ID: <20180929070147.88203-2-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180929070147.88203-1-kexin.hao@windriver.com>
References: <20180929070147.88203-1-kexin.hao@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] wic: bootimg-pcbios: Drop the unnecessary reference of STAGING_DATADIR
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
X-List-Received-Date: Sat, 29 Sep 2018 07:09:37 -0000
Content-Type: text/plain

Actually the bootimg_dir is the value of STAGING_DATADIR, so we don't
need to check this directory twice times.

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 scripts/lib/wic/plugins/source/bootimg-pcbios.py | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index d599112dd759..dc7b76cf22a7 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -45,11 +45,10 @@ class BootimgPcbiosPlugin(SourcePlugin):
     @classmethod
     def _get_bootimg_dir(cls, bootimg_dir, dirname):
         """
-        Check if dirname exists in default bootimg_dir or in STAGING_DIR.
+        Check if dirname exists in default bootimg_dir
         """
-        for result in (bootimg_dir, get_bitbake_var("STAGING_DATADIR")):
-            if os.path.exists("%s/%s" % (result, dirname)):
-                return result
+        if os.path.exists("%s/%s" % (bootimg_dir, dirname)):
+            return bootimg_dir
 
         raise WicError("Couldn't find correct bootimg_dir, exiting")
 
-- 
2.14.4


