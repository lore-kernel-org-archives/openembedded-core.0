Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.6883.1620370974892359593
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 00:03:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 6hd0MBJ0wc58AuZKAB7Cq1yoqO3cXRxAwW82v1iYpupRKL/YbkkFAs7oGX5y1mxpgbOrLvbL2r
 ifD4t7T2F1AA==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="185794714"
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="185794714"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:01 -0700
IronPort-SDR: GRczgLXIDNXfODVfRpUs7vTa7+jTQXOGkufivWKE89y71smZRxX09mqZTYH08LfC1xxeWIyxZY
 TaCIslkDcSoQ==
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="407331559"
Received: from sthum-mobl6.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.243.238])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:00 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 08/31] rootfs.py: find .ko.gz and .ko.xz kernel modules as well
Date: Fri,  7 May 2021 15:02:20 +0800
Message-Id: <96a751b84d15480304b931264b9e5d07098c0a90.1620370571.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620370571.git.anuj.mittal@intel.com>
References: <cover.1620370571.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Christophe Chapuis <chris.chapuis@gmail.com>

* with xz PACKAGECONFIG enabled in kmod and xz module compression enabled in kernel
  the do_rootfs task doesn't run depmod in the image, because it thinks there are no modules:
  NOTE: No Kernel Modules found, not running depmod

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9c13ce05eae0f126eb150e48709e9bd06e9280fa)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oe/rootfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 5f81023040..d634adda4e 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -305,7 +305,7 @@ class Rootfs(object, metaclass=ABCMeta):
     def _check_for_kernel_modules(self, modules_dir):
         for root, dirs, files in os.walk(modules_dir, topdown=True):
             for name in files:
-                found_ko = name.endswith(".ko")
+                found_ko = name.endswith((".ko", ".ko.gz", ".ko.xz"))
                 if found_ko:
                     return found_ko
         return False
-- 
2.30.2

