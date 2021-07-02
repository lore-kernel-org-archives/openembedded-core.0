Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web11.11950.1625242831169525835
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 09:20:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10033"; a="196043495"
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; 
   d="scan'208";a="196043495"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 09:20:30 -0700
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; 
   d="scan'208";a="626776456"
Received: from ypoh4-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.151.64])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 09:20:29 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 14/22] Use the label provided when formating a dos partition
Date: Sat,  3 Jul 2021 00:19:56 +0800
Message-Id: <2fc2d0874fcb51abda249218443a71a42d9f02e9.1625242066.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1625242066.git.anuj.mittal@intel.com>
References: <cover.1625242066.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: jbouchard <jeanbouch418@gmail.com>

Previously the bootimg-pcbios wic plugin was not respecting
the --label option provided from the wks file. The plugin
was setting the label to 'boot'. With this fix, the --label
option is use. If no option are specified, then the default
is 'boot'.

Signed-off-by: jbouchard <jeanbouch418@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0fd7a73c1bd2486b7a022f0f69bbcb2e0d9cb141)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/wic/plugins/source/bootimg-pcbios.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index f2639e7004..32e47f1831 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -186,8 +186,10 @@ class BootimgPcbiosPlugin(SourcePlugin):
         # dosfs image, created by mkdosfs
         bootimg = "%s/boot%s.img" % (cr_workdir, part.lineno)
 
-        dosfs_cmd = "mkdosfs -n boot -i %s -S 512 -C %s %d" % \
-                    (part.fsuuid, bootimg, blocks)
+        label = part.label if part.label else "boot"
+
+        dosfs_cmd = "mkdosfs -n %s -i %s -S 512 -C %s %d" % \
+                    (label, part.fsuuid, bootimg, blocks)
         exec_native_cmd(dosfs_cmd, native_sysroot)
 
         mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (bootimg, hdddir)
-- 
2.31.1

