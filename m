Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.6900.1620371011413487034
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 00:03:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: DrOWPI29KzrSVUD9IVP6MYxnjyUUVOydfL9V2R4wJnMPcm5meVjzwgjv0QvxlJXYN+r90nxRd+
 b8M3nhgz8/og==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="185794856"
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="185794856"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:33 -0700
IronPort-SDR: Pf5ZVWeJNXcUWbb4PURr1fzEzIryuCQe1/eCKFGGc8VSF4rLOYchS+iu0QJ/57qrSYqDapRThr
 bkUX2pmxdOgA==
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="407331754"
Received: from sthum-mobl6.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.243.238])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:32 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 30/31] classes/image: Use xargs to set file timestamps
Date: Fri,  7 May 2021 15:02:42 +0800
Message-Id: <caa63cae723b9025943f3d60dd8ae852fc52addc.1620370571.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620370571.git.anuj.mittal@intel.com>
References: <cover.1620370571.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joshua Watt <JPEWhacker@gmail.com>

Instead of having find directly invoke touch for each file in the root
file system, pass a list to xargs for batching. This significantly
reduces the number of times the touch program is invoked and speeds up
the do_image task time:

    PKG           TASK      ABSDIFF  RELDIFF  CPUTIME1 -> CPUTIME2
    my-image      do_image   -45.3s   -94.2%     48.1s -> 2.8s

    Cumulative cputime:
      -44.3s    -92.3%    00:48.1 (48.1s) -> 00:03.7 (3.7s)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 15c65f90a3aa1e98c2beab2539403157df1fca08)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 013455f492..353cc67175 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -657,7 +657,7 @@ reproducible_final_image_task () {
         fi
         # Set mtime of all files to a reproducible value
         bbnote "reproducible_final_image_task: mtime set to $REPRODUCIBLE_TIMESTAMP_ROOTFS"
-        find  ${IMAGE_ROOTFS} -exec touch -h  --date=@$REPRODUCIBLE_TIMESTAMP_ROOTFS {} \;
+        find  ${IMAGE_ROOTFS} -print0 | xargs -0 touch -h  --date=@$REPRODUCIBLE_TIMESTAMP_ROOTFS
     fi
 }
 
-- 
2.30.2

