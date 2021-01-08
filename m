Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.3749.1610079532734030116
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 20:18:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: WJdmioP6guMD6ba95R2+BxDnF90Sd4hf3TGfl1njcod+pQSllgfd29w+l8pZY/gc4NPjechXF5
 7IIYI/3UTdjQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="164613733"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="164613733"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:53 -0800
IronPort-SDR: Etd2xNnjgdkJi+5dzvlflL0SifhlDF9MLp1it82amwUFHx1vOCYCtmxyIRQqHi+DqIS5IAzs/h
 Ja3x3GJGRV5w==
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="362209499"
Received: from nshamsan-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.135.192])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:52 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 26/30] oeqa/commands: Ensure sync can be found regardless of PATH
Date: Fri,  8 Jan 2021 12:18:08 +0800
Message-Id: <8d7f1c1574ceaff11966331855491ef7c96fd110.1610079279.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610079278.git.anuj.mittal@intel.com>
References: <cover.1610079278.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Avoid command not found errors shown in selftest logs due to changes to PATH
settings which also risks intermittent problems due to IO load.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 40bcae01b0be2f293dea9ab42c6b7f8f47827cf5)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/utils/commands.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 8059cbce3e..8b3e12038d 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -188,7 +188,10 @@ def runCmd(command, ignore_status=False, timeout=None, assert_error=True, sync=T
     # call sync around the tests to ensure the IO queue doesn't get too large, taking any IO
     # hit here rather than in bitbake shutdown.
     if sync:
+        p = os.environ['PATH']
+        os.environ['PATH'] = "/usr/bin:/bin:/usr/sbin:/sbin:" + p
         os.system("sync")
+        os.environ['PATH'] = p
 
     result.command = command
     result.status = cmd.status
-- 
2.29.2

