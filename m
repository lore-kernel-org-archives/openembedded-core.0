Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.48460.1612244058134667125
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 21:34:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: cUU6NiViS44h9OEKRq1GnSQWHxuHkJ3VdS2klp/AtmV3n65zwdCCRVrglLoW9lUQd+AHiaAvLy
 4pNZQO4WiPuA==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="180876886"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="180876886"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:22 -0800
IronPort-SDR: fbDx1pdZjz9D0u770STLVUoqyywtJNWF4/+xbyDD1oR2zchApn+msHcM7bpAH6RweqpOaUIFaS
 9eqi1rjpgu7A==
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="370360902"
Received: from ajayap1x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.184.137])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:21 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 07/25] devtool: Fix file:// fetcher symlink directory structure
Date: Tue,  2 Feb 2021 13:33:50 +0800
Message-Id: <a6a4e1350c6c8170648a9e910b06e6534d11f926.1612243805.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612243805.git.anuj.mittal@intel.com>
References: <cover.1612243805.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>

Add relative path if file is under directory.

[YOCTO #13738]

(From OE-Core rev: 19ddacc1b38f9ebb86a9359963ccc3c707f7125e)

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3a220f1e411767cbf9e7099c18d94a12171c1093)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/devtool/standard.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index f7d8a82117..7b62b7e7b8 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -474,7 +474,11 @@ def symlink_oelocal_files_srctree(rd,srctree):
                 destpth = os.path.join(srctree, relpth, fn)
                 if os.path.exists(destpth):
                     os.unlink(destpth)
-                os.symlink('oe-local-files/%s' % fn, destpth)
+                if relpth != '.':
+                    back_relpth = os.path.relpath(local_files_dir, root)
+                    os.symlink('%s/oe-local-files/%s/%s' % (back_relpth, relpth, fn), destpth)
+                else:
+                    os.symlink('oe-local-files/%s' % fn, destpth)
                 addfiles.append(os.path.join(relpth, fn))
         if addfiles:
             bb.process.run('git add %s' % ' '.join(addfiles), cwd=srctree)
-- 
2.29.2

