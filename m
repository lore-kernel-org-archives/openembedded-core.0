Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.7663.1614918143328449753
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: AImZt2VB1G6FYxHakoui/FXiE3xMJ4DwfFA5cdO1y41xUShjyMTpj+hPg7lybAVnJFqwESPHOs
 cgQrLzCiXpbw==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187670904"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187670904"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:12 -0800
IronPort-SDR: QyvB52+oMGFpnPHfIr9FbfB9v67k4xxS9Or3h7O2YlsVryktcsAD6lBPcKi7H8lNO9glf89v1S
 zpmSKHDvUoag==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408128804"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:11 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 10/52] df.py: Add feature check for read-only-rootfs
Date: Fri,  5 Mar 2021 12:20:46 +0800
Message-Id: <db5d476b6e868853ad24eb4941c154a0ad6b2405.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wes Lindauer <wesley.lindauer@gmail.com>

If the target is using a read-only rootfs, the available space on '/'
will be zero. This will cause the test to incorrectly fail and skipping
seems appropriate in this case.

Signed-off-by: Wes Lindauer <wesley.lindauer@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit af1dbea3c9b9b42a3e6803b231e425423d70e210)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/runtime/cases/df.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/df.py b/meta/lib/oeqa/runtime/cases/df.py
index 89fd0fb901..bb155c9cf9 100644
--- a/meta/lib/oeqa/runtime/cases/df.py
+++ b/meta/lib/oeqa/runtime/cases/df.py
@@ -4,12 +4,14 @@
 
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.data import skipIfDataVar, skipIfInDataVar
 from oeqa.runtime.decorator.package import OEHasPackage
 
 class DfTest(OERuntimeTestCase):
 
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['coreutils', 'busybox'])
+    @skipIfInDataVar('IMAGE_FEATURES', 'read-only-rootfs', 'Test case df requires a writable rootfs')
     def test_df(self):
         cmd = "df -P / | sed -n '2p' | awk '{print $4}'"
         (status,output) = self.target.run(cmd)
-- 
2.29.2

