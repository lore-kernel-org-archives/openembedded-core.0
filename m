Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web08.8256.1612533559364285227
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 05:59:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: BaYeTmddBtNn4C/2sqLq0ADCPn61GherLq5wxb+EhkzfNHvws9e/PUD8x80m6Pp7ZsKbQl1yGy
 /UvnmSk+s5dw==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="200439022"
X-IronPort-AV: E=Sophos;i="5.81,155,1610438400"; 
   d="scan'208";a="200439022"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2021 05:59:18 -0800
IronPort-SDR: V6vMPp/68qxK0N2HCugeVD8U0a9olpoZbb55BYgRmkTkbiUfe8N4zI7ikUFbhPl0SOJ8NkeDvR
 T29+HaYGFLEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,155,1610438400"; 
   d="scan'208";a="360374559"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by orsmga006.jf.intel.com with ESMTP; 05 Feb 2021 05:59:16 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell 1/3] classes/image_types_wic: Reorder do_flush_pseudodb
Date: Fri,  5 Feb 2021 21:59:14 +0800
Message-Id: <20210205135916.55589-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Ricardo Ribalda <ricardo.ribalda@gmail.com>

When IMAGE_FSTYPES contains more types than wic, it can happen than the
pseudo database is not flushed properly.

This can be solved by changing the order of when do_flush_pseudodb is
launched.

Yocto Bug: https://bugzilla.yoctoproject.org/show_bug.cgi?id=13898
Fixes: dde90a5dd2b2 ("wic: Fix multi images .wks with bitbake")
Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 445b0a9544b55735496bbb23dbff3399b3b9e9a4)
Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 meta/classes/image_types_wic.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index f6c8d8995e..ae00acc5ea 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -151,7 +151,7 @@ python do_rootfs_wicenv () {
     depdir = d.getVar('IMGDEPLOYDIR')
     bb.utils.copyfile(os.path.join(outdir, basename) + '.env', os.path.join(depdir, basename) + '.env')
 }
-addtask do_flush_pseudodb after do_image before do_image_wic
+addtask do_flush_pseudodb after do_rootfs before do_image do_image_qa
 addtask do_rootfs_wicenv after do_image before do_image_wic
 do_rootfs_wicenv[vardeps] += "${WICVARS}"
 do_rootfs_wicenv[prefuncs] = 'set_image_size'
-- 
2.17.1

