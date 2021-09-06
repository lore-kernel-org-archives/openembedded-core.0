Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web11.17762.1630897608440755017
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Sep 2021 20:06:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10098"; a="219925641"
X-IronPort-AV: E=Sophos;i="5.85,271,1624345200"; 
   d="scan'208";a="219925641"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2021 20:06:46 -0700
X-IronPort-AV: E=Sophos;i="5.85,271,1624345200"; 
   d="scan'208";a="522846482"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.236.127])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2021 20:06:44 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 1/4] lib/package_manager: Use shutil.copy instead of bb.utils.copyfile for intercepts
Date: Mon,  6 Sep 2021 11:06:21 +0800
Message-Id: <db5ab68f0e5b2398b2faa3547deff8e02f3220a0.1630897275.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1630897275.git.anuj.mittal@intel.com>
References: <cover.1630897275.git.anuj.mittal@intel.com>
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
index 42225a3b2e..26f9f82aaa 100644
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
2.31.1

