Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web11.4150.1620808566675357961
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 01:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: d/eVymEBb+bgjt9UcHVW7Ifd5psfBhmohUV5Zif4V3CVt9nxjGMLhrhR0T0i7Pi5xCfpsjGIgA
 VsikYJr/+lzQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="179917783"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="179917783"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:36:06 -0700
IronPort-SDR: c3Uv1EwpP/xCerTSVCLp03vdz/vPKKho6fVy2b9pmHObq/xkzRKCRWizohgVX4NzM+Y7MGumSq
 yZjR2uCGpyEg==
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="430645738"
Received: from tmustofa-mobl1.amr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.35.122])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:36:04 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 04/15] oeqa/qemurunner: Improve handling of run_serial for shutdown commands
Date: Wed, 12 May 2021 16:35:36 +0800
Message-Id: <a72572532b976a4c3e8fa68fe63f63e39399ee88.1620808329.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620808329.git.anuj.mittal@intel.com>
References: <cover.1620808329.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When running a shutdown command, the serial port can close without the
command returning. This is seen as the socket being readable but having
no data. Change the way this case is handled in the code to avoid
tracebacks.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 396a3ba884820d040c91f7592daf20ac28c49b5d)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 526b493669..a0f17d557b 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -71,6 +71,8 @@ class QemuRunner:
         self.monitorpipe = None
 
         self.logger = logger
+        # Whether we're expecting an exit and should show related errors
+        self.canexit = False
 
         # Enable testing other OS's
         # Set commands for target communication, and default to Linux ALWAYS
@@ -472,6 +474,7 @@ class QemuRunner:
             self.thread.join()
 
     def allowexit(self):
+        self.canexit = True
         if self.thread:
             self.thread.allowexit()
 
@@ -530,7 +533,9 @@ class QemuRunner:
                     if re.search(self.boot_patterns['search_cmd_finished'], data):
                         break
                 else:
-                    raise Exception("No data on serial console socket")
+                    if self.canexit:
+                        return (1, "")
+                    raise Exception("No data on serial console socket, connection closed?")
 
         if data:
             if raw:
-- 
2.31.1

