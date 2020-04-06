Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.12871.1586185918252682432
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 08:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: FdC5XmdSmCI0fsPpimNG1A7D8IzBSIEoCTEwm6iBm0JahsaiZJgHLk34cjFkTA5hXd0pzimBoo
 SMNjAtT0qbpw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2020 08:12:07 -0700
IronPort-SDR: C9M7yub+ybGUPYVFW/m8vCnMwGrlbmO2Vp2ZDCwImoIbxP9n8H4JVM9Wmowkrz7Xqekdfo5laH
 Cfnr3SVYlKNw==
X-IronPort-AV: E=Sophos;i="5.72,351,1580803200"; 
   d="scan'208";a="424391171"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.70.63])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2020 08:12:06 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 07/13] lib/oe/package_manager: fix handling of last package
Date: Mon,  6 Apr 2020 23:11:35 +0800
Message-Id: <7dba11373af742d4e4924e14e8fd386d53ffddbd.1586185832.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1586185832.git.anuj.mittal@intel.com>
References: <cover.1586185832.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jan Luebbe <jlu@pengutronix.de>

In commit 7d214b34e11dc57316ed5c1c7747c4601286f6d2, only the code in the
for loop was modified to store the pkgarch value. The code used if there
was no empty line at the end was not modified.

Instead of fixing the duplicated code, remove it and just make sure that
a final empty line is processed.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a7b93c695b23d015607b179d98526b9b14c03d45)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oe/package_manager.py | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 61206daeaa..27b2f17f95 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -41,7 +41,7 @@ def opkg_query(cmd_output):
     filename = ""
     dep = []
     pkgarch = ""
-    for line in cmd_output.splitlines():
+    for line in cmd_output.splitlines()+['']:
         line = line.rstrip()
         if ':' in line:
             if line.startswith("Package: "):
@@ -80,12 +80,6 @@ def opkg_query(cmd_output):
             dep = []
             pkgarch = ""
 
-    if pkg:
-        if not filename:
-            filename = "%s_%s_%s.ipk" % (pkg, ver, arch)
-        output[pkg] = {"arch":arch, "ver":ver,
-                "filename":filename, "deps": dep }
-
     return output
 
 def failed_postinsts_abort(pkgs, log_path):
-- 
2.25.1

