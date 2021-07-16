Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web11.1434.1626403354833085378
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 19:42:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="232494564"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="232494564"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:42:36 -0700
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="656075398"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.225.206])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:42:34 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 03/28] devtool: deploy-target: Fix preserving attributes when using --strip
Date: Fri, 16 Jul 2021 10:42:01 +0800
Message-Id: <421a199ad31f7cd7fb50e3abf9cdd41fed5532dd.1626403078.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1626403078.git.anuj.mittal@intel.com>
References: <cover.1626403078.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Amstutz <florian.amstutz@scs.ch>

Commit a2db4fa127a3347fc6df31f895fb0b552669119e added ${WORKDIR}/deploy-* to
PSEUDO_IGNORE_PATHS. This breaks the --strip mode since ${D} is copied to
deploy-target-stripped. Use the directory devtool-deploy-target-stripped
instead.

[YOCTO #14451]

Signed-off-by: Florian Amstutz <florian.amstutz@scs.ch>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 02661f20faf11d0fa2f1874bd423f5d9fa7a31c9)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/devtool/deploy.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index e5af2c95ae..833322571f 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -168,7 +168,7 @@ def deploy(args, config, basepath, workspace):
         if args.strip and not args.dry_run:
             # Fakeroot copy to new destination
             srcdir = recipe_outdir
-            recipe_outdir = os.path.join(rd.getVar('WORKDIR'), 'deploy-target-stripped')
+            recipe_outdir = os.path.join(rd.getVar('WORKDIR'), 'devtool-deploy-target-stripped')
             if os.path.isdir(recipe_outdir):
                 bb.utils.remove(recipe_outdir, True)
             exec_fakeroot(rd, "cp -af %s %s" % (os.path.join(srcdir, '.'), recipe_outdir), shell=True)
-- 
2.31.1

