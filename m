Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.4062.1623383461856029952
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jun 2021 20:51:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: l6qXWHykOXAMdJPX4WR3LockvXDxSJQMXYAu1lHUdh+r/0hAYLMsH4SNCD8ImPxv+sCBRScWfX
 d/A6cST7eQDQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="192566069"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="192566069"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 20:51:18 -0700
IronPort-SDR: 71Dt/F6g9S1U3SEbE6OBeJsNgTjsYEuMPwXBhWlN6uHI1ws+DWkJpQcORKyPzZHHf/XVpinhf2
 CCb/4vN2azOA==
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="403091664"
Received: from dlau-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.151.154])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 20:51:17 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 16/17] image-live.bbclass: order do_bootimg after do_rootfs
Date: Fri, 11 Jun 2021 11:50:49 +0800
Message-Id: <7b10309fa169834483589e999432caf414225b3e.1623383318.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623383318.git.anuj.mittal@intel.com>
References: <cover.1623383318.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Guillaume Champagne <champagne.guillaume.c@gmail.com>

do_bootimg expects IMGDEPLOYDIR to exist, since it stores its artifacts
there. Therefore, do_bootimg should run after do_rootfs because
IMGDEPLOYDIR is created before do_rootfs runs since IMGDEPLOYDIR is
contained in do_rootfs' [cleandirs] varflag.

When do_bootimg depends on ${PN}:do_image_${LIVE_ROOTFS_TYPE},
do_bootimg is correctly ordered after do_rootfs because
do_image_${FSTYPE} tasks are added after do_image and do_image itself is
added after do_rootfs.

However, when do_bootimg doesn't depend on
${PN}:do_image_${LIVE_ROOTFS_TYPE}
(introduced by: 96f47c39f1d17f073243913d524bde84add41d8f), do_bootimg
can run before do_rootfs, thus before IMGDEPLOYDIR is created. To
avoid this situation, do_bootimg is now explicitly ordered after
do_rootfs.

Signed-off-by: Guillaume Champagne <champagne.guillaume.c@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 73c21db8e54002b300ba4972cb49c0577acc5406)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/image-live.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index 8b08305cdb..fd876ed8e1 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -261,4 +261,4 @@ python do_bootimg() {
 do_bootimg[subimages] = "hddimg iso"
 do_bootimg[imgsuffix] = "."
 
-addtask bootimg before do_image_complete
+addtask bootimg before do_image_complete after do_rootfs
-- 
2.31.1

