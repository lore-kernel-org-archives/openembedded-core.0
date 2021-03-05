Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7839.1614918154051973024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:23:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: kMbwol5GkCi/GTUIvPmiIPo63M500Fvpcf3BsPdAlt4QeHhfxomObn/wMALn7A7vOU0j3u1jRh
 ITayHqVgHjtg==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187671234"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187671234"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:23:00 -0800
IronPort-SDR: pNmRcXCvBAKMgzOH+rTbuI9oz2+FSxVRtObPzaRBM6YvfNgNIQeMAL4LrT25kdT5L12Gu/X5yH
 PvmyeONEU0iQ==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408129154"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:58 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 45/52] oeqa/pam: Need shadow installed for the tests
Date: Fri,  5 Mar 2021 12:21:21 +0800
Message-Id: <f1aad29b9a21b8e3116ed89ae2d3f79e563acbd5.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Distros may not use shadow for login manager
secondly login --help returns 1 only with shadow provided login
utility, with busybox it returns normal 0, the testcase clearly
assumes shadow being part of image, therefore add needed
checks to ensure the pre-requisites are met

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0820aeba74869bf6e85b200f39bc610a43ab9a7a)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/runtime/cases/pam.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/pam.py b/meta/lib/oeqa/runtime/cases/pam.py
index 271a1943e3..a482ded945 100644
--- a/meta/lib/oeqa/runtime/cases/pam.py
+++ b/meta/lib/oeqa/runtime/cases/pam.py
@@ -8,11 +8,14 @@
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.data import skipIfNotFeature
+from oeqa.runtime.decorator.package import OEHasPackage
 
 class PamBasicTest(OERuntimeTestCase):
 
     @skipIfNotFeature('pam', 'Test requires pam to be in DISTRO_FEATURES')
     @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['shadow'])
+    @OEHasPackage(['shadow-base'])
     def test_pam(self):
         status, output = self.target.run('login --help')
         msg = ('login command does not work as expected. '
-- 
2.29.2

