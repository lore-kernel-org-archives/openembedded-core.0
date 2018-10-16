Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 21F45794BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 09:11:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9G9B0Gq015064
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Oct 2018 02:11:00 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 16 Oct 2018 02:10:59 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 16 Oct 2018 16:29:14 +0800
Message-ID: <b6ed088639e5da76ad6669fda9c45bd7169d2448.1539678147.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1539678147.git.kai.kang@windriver.com>
References: <cover.1539678147.git.kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] wic: search nonarch STAGING_DATADIR for multilib
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
X-List-Received-Date: Tue, 16 Oct 2018 09:11:01 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It fails to build multilib image such as lib32-core-image-minimal with
wic by set 'IMAGE_FSTYPES = "wic"':

| ERROR: Couldn't find correct bootimg_dir, exiting

When multilib is enabled, STAGING_DATADIR is expanded with MLPREFIX. But
dependencies of images such as syslinux is still populated to nonarch
STAGING_DATADIR.

Search nonarch STAGING_DATADIR to fix the error.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 scripts/lib/wic/plugins/source/bootimg-pcbios.py | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index d599112dd7..9347aa7fcb 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -26,6 +26,7 @@
 
 import logging
 import os
+import re
 
 from wic import WicError
 from wic.engine import get_custom_config
@@ -47,10 +48,17 @@ class BootimgPcbiosPlugin(SourcePlugin):
         """
         Check if dirname exists in default bootimg_dir or in STAGING_DIR.
         """
-        for result in (bootimg_dir, get_bitbake_var("STAGING_DATADIR")):
+        staging_datadir = get_bitbake_var("STAGING_DATADIR")
+        for result in (bootimg_dir, staging_datadir):
             if os.path.exists("%s/%s" % (result, dirname)):
                 return result
 
+        # STAGING_DATADIR is expanded with MLPREFIX if multilib is enabled
+        # but dependency syslinux is still populated to original STAGING_DATADIR
+        nonarch_datadir = re.sub('/[^/]*recipe-sysroot', '/recipe-sysroot', staging_datadir)
+        if os.path.exists(os.path.join(nonarch_datadir, dirname)):
+            return nonarch_datadir
+
         raise WicError("Couldn't find correct bootimg_dir, exiting")
 
     @classmethod
-- 
2.18.0


