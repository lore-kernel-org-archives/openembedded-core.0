Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.6900.1620371011413487034
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 00:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: G/zV1ssRfAijgtd9eQG24Ja/6jy4T4nCbtS0vpzyarY28r3B/kx+Sn6nCG08WjzOSkWy8fhW9u
 zzSJ+nj3TwQg==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="185794849"
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="185794849"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:31 -0700
IronPort-SDR: Xg8Q1yUVrCso3oUkt2ZTTZagHvJsx9mtp1OyepRKtQ2NRALp4/CWx0DegKz+Bkacvva3iyezRF
 huL08GbtzT0Q==
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="407331726"
Received: from sthum-mobl6.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.243.238])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:28 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 28/31] lib/package_manager: Use shutil.copy instead of bb.utils.copyfile for intercepts
Date: Fri,  7 May 2021 15:02:40 +0800
Message-Id: <f2c5f666140df29d97e2b1539e727d3609e9e4d2.1620370571.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620370571.git.anuj.mittal@intel.com>
References: <cover.1620370571.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If the scripts/postinst-intercepts is owned by root/root then the copyfile() calls
will fail due to chown issues. We don't care about ownership of these files so
use shutil.copy() instead which won't perform any chown.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1a03c70c282b3445b93a4c70ea6d40a1778750c5)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oe/package_manager/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_manager/__init__.py
index 8e7128b195..4d22bc0296 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -189,7 +189,7 @@ class PackageManager(object, metaclass=ABCMeta):
         bb.utils.remove(self.intercepts_dir, True)
         bb.utils.mkdirhier(self.intercepts_dir)
         for intercept in postinst_intercepts:
-            bb.utils.copyfile(intercept, os.path.join(self.intercepts_dir, os.path.basename(intercept)))
+            shutil.copy(intercept, os.path.join(self.intercepts_dir, os.path.basename(intercept)))
 
     @abstractmethod
     def _handle_intercept_failure(self, failed_script):
-- 
2.30.2

