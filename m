Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7183.1616377301187997965
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Mar 2021 18:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 3Cy6TNdSb4juAWvo6g7t+VmiAFLTz6i7jJVp4blW4RNHWL58ixxrLwDSSBqOAOzMEEyjKG8SWy
 mBLrbiflsgRw==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="190211648"
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="190211648"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:42:01 -0700
IronPort-SDR: VzYPIUKBztIZQOMNz49MwYBMjcIryZkCggE7fuYlXT0n3q5f1JaKQPP9budXq5yXwB+FqX9lUw
 wDP96UyW8CCw==
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="524295226"
Received: from myusoff-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.78.4])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:42:00 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 18/25] runqemu: use "raw" instead of "bin" for ovmf
Date: Mon, 22 Mar 2021 09:41:20 +0800
Message-Id: <c3eb98b9d079fbee40753d074ff1dbf497cbb1d0.1616377115.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616377115.git.anuj.mittal@intel.com>
References: <cover.1616377115.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jon Mason <jon.mason@arm.com>

bin is not an acceptable format for qemu and will throw an error is set.
The correct format in this case is raw.

Signed-off-by: Jon Mason <jon.mason@arm.com>
Change-Id: I9d78e356d39ecb15bef886c19870b029d9badd65
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cd279aeb986b4676ea8ecb1e7b12c7e29e83460a)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/runqemu | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index e5e66f3453..b80fec1c99 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1340,6 +1340,8 @@ class BaseConfig(object):
 
         for ovmf in self.ovmf_bios:
             format = ovmf.rsplit('.', 1)[-1]
+            if format == "bin":
+                format = "raw"
             self.qemu_opt += ' -drive if=pflash,format=%s,file=%s' % (format, ovmf)
 
         self.qemu_opt += ' ' + self.qemu_opt_script
-- 
2.30.2

