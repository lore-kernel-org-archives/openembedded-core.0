Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.972.1619398464930781840
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 9QdznTBzlPpgYOOuC0jc/gvEaZWoeNPao0NkBCAegk5ckNH6eAqwH02naoB7/wAeznj3I1KUFz
 y3YAIelNSkVg==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818099"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818099"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:24 -0700
IronPort-SDR: k/IVRbssT37ypaTU0cvv9m/EbMBvV4VQpaXzXUdAWC0GJrwTfsOxYe8W1Shen2SlXN5Ro5UCqS
 GKtvHKQ6hexQ==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067362"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:23 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 22/64] oeqa/runtime/cases: Only disable/enable for current boot
Date: Mon, 26 Apr 2021 08:52:53 +0800
Message-Id: <49a6632aa789fca8085a91b5b7c749aef3db4e0e.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wes Lindauer <wesley.lindauer@gmail.com>

Previously doing a stop/start worked, but using a disable/enable does
not work on a read-only rootfs. Add a --runtime flag to systemctl so
that systemd only modifies the current boot and does not attempt to
write to the filesystem.

This also keeps the test from making a permanent (one could argue
policy) change to the running system being tested. i.e. What if the
image being tested had intentionally disabled the timesyncd service in
preference to using chrony or ntpd? The test shouldn't assume that the
user wants the timesyncd service enabled.

Signed-off-by: Wes Lindauer <wesley.lindauer@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 43dd83b6a325589368c980a3f17cab90935aaeb0)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/runtime/cases/date.py | 4 ++--
 meta/lib/oeqa/runtime/cases/rtc.py  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/date.py b/meta/lib/oeqa/runtime/cases/date.py
index fdd2a6ae58..e14322911d 100644
--- a/meta/lib/oeqa/runtime/cases/date.py
+++ b/meta/lib/oeqa/runtime/cases/date.py
@@ -13,12 +13,12 @@ class DateTest(OERuntimeTestCase):
     def setUp(self):
         if self.tc.td.get('VIRTUAL-RUNTIME_init_manager') == 'systemd':
             self.logger.debug('Stopping systemd-timesyncd daemon')
-            self.target.run('systemctl disable --now systemd-timesyncd')
+            self.target.run('systemctl disable --now --runtime systemd-timesyncd')
 
     def tearDown(self):
         if self.tc.td.get('VIRTUAL-RUNTIME_init_manager') == 'systemd':
             self.logger.debug('Starting systemd-timesyncd daemon')
-            self.target.run('systemctl enable --now systemd-timesyncd')
+            self.target.run('systemctl enable --now --runtime systemd-timesyncd')
 
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['coreutils', 'busybox'])
diff --git a/meta/lib/oeqa/runtime/cases/rtc.py b/meta/lib/oeqa/runtime/cases/rtc.py
index a34c101a9d..c4e6681324 100644
--- a/meta/lib/oeqa/runtime/cases/rtc.py
+++ b/meta/lib/oeqa/runtime/cases/rtc.py
@@ -9,12 +9,12 @@ class RTCTest(OERuntimeTestCase):
     def setUp(self):
         if self.tc.td.get('VIRTUAL-RUNTIME_init_manager') == 'systemd':
             self.logger.debug('Stopping systemd-timesyncd daemon')
-            self.target.run('systemctl disable --now systemd-timesyncd')
+            self.target.run('systemctl disable --now --runtime systemd-timesyncd')
 
     def tearDown(self):
         if self.tc.td.get('VIRTUAL-RUNTIME_init_manager') == 'systemd':
             self.logger.debug('Starting systemd-timesyncd daemon')
-            self.target.run('systemctl enable --now systemd-timesyncd')
+            self.target.run('systemctl enable --now --runtime systemd-timesyncd')
 
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['coreutils', 'busybox'])
-- 
2.30.2

