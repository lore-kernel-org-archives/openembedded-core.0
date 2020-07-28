Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.8237.1595926357616374658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 01:53:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: z1ZArQrg1Fw8DWuh35mt0lZONGWjV0brg4DaZOKW/U9YxKXcfZnI0pt1PnC8yWGGa8RF43jNnf
 8qg6rkt0sehg==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="215699759"
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="215699759"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:53:16 -0700
IronPort-SDR: Tasu+qsx//BnOZFrCaQU+Uoarc1Lc0ptNT7osHBUDcaGO8WDPW+oVf1jWTgvzyz5+SWiOzJCfb
 dm2U7PYXRAHg==
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="434245927"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.137.161])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:53:14 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 22/32] utils: fix gcc 10 version detection
Date: Tue, 28 Jul 2020 16:51:23 +0800
Message-Id: <d9e58aff76edf1f5fdc31785fd81fae2c7c508c8.1595924916.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1595924916.git.anuj.mittal@intel.com>
References: <cover.1595924916.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Charles-Antoine Couret <charles-antoine.couret@mind.be>

Utils can not detect GCC 10 correctly due to wrong regex.
It generates this error "ERROR: Can't get compiler version from gcc  --version output"

Sub-version numbers should be 1 or more digits instead of 1 only.

Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 186fe4a3d390a52b87282c3e694ce3251e45ee78)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oe/utils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 652b2be145..144c123a0e 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -387,7 +387,7 @@ def host_gcc_version(d, taskcontextonly=False):
     except subprocess.CalledProcessError as e:
         bb.fatal("Error running %s --version: %s" % (compiler, e.output.decode("utf-8")))
 
-    match = re.match(r".* (\d\.\d)\.\d.*", output.split('\n')[0])
+    match = re.match(r".* (\d+\.\d+)\.\d+.*", output.split('\n')[0])
     if not match:
         bb.fatal("Can't get compiler version from %s --version output" % compiler)
 
-- 
2.25.4

