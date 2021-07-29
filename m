Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web11.3551.1627521713104973426
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 18:21:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: jay.shen.teoh@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="192376763"
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; 
   d="scan'208";a="192376763"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2021 18:21:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; 
   d="scan'208";a="517870742"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga002.fm.intel.com with ESMTP; 28 Jul 2021 18:21:44 -0700
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][Patch 3/7] oeqa/runtime/cases: Only disable/enable for current boot
Date: Thu, 29 Jul 2021 09:21:19 +0800
Message-Id: <20210729012123.27489-3-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210729012123.27489-1-jay.shen.teoh@intel.com>
References: <20210729012123.27489-1-jay.shen.teoh@intel.com>
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

(From OE-Core rev: 43dd83b6a325589368c980a3f17cab90935aaeb0)

Signed-off-by: Wes Lindauer <wesley.lindauer@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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
2.32.0

