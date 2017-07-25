Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C26FA71984
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 20:06:31 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Jul 2017 13:06:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,412,1496127600"; d="scan'208";a="131147673"
Received: from yctb06.ostc.intel.com ([10.54.69.60])
	by fmsmga005.fm.intel.com with ESMTP; 25 Jul 2017 13:06:32 -0700
From: jose.perez.carranza@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jul 2017 13:06:28 -0700
Message-Id: <20170725200628.24373-1-jose.perez.carranza@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20170725194217.41657-1-jose.perez.carranza@linux.intel.com>
References: <20170725194217.41657-1-jose.perez.carranza@linux.intel.com>
Subject: [PATCH v2] oeqa/buildperf: Add 'bitbake -m' on sync function to ensure bitbake is unloaded
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Jul 2017 20:06:31 -0000

From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>

Add 'bitbake -m' to the sync method and ensure all process related to
bitbake are correctly unloaded before doing the different measurements.
Also add a call to sync funtion on Test4 before final measurment of
eSDK deploy dir disk usage.

Signed-off-by: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py       | 1 +
 meta/lib/oeqa/buildperf/test_basic.py | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 6e62b279c1..7b2b4aa2a4 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -485,6 +485,7 @@ class BuildPerfTestCase(unittest.TestCase):
     @staticmethod
     def sync():
         """Sync and drop kernel caches"""
+        runCmd2('bitbake -m', ignore_status=True)
         log.debug("Syncing and dropping kernel caches""")
         KernelDropCaches.drop()
         os.sync()
diff --git a/meta/lib/oeqa/buildperf/test_basic.py b/meta/lib/oeqa/buildperf/test_basic.py
index a9e4a5b731..a19089a6ed 100644
--- a/meta/lib/oeqa/buildperf/test_basic.py
+++ b/meta/lib/oeqa/buildperf/test_basic.py
@@ -121,5 +121,7 @@ class Test4(BuildPerfTestCase):
         self.sync()
         self.measure_cmd_resources([installer, '-y', '-d', deploy_dir],
                                    'deploy', 'eSDK deploy')
+        #make sure bitbake is unloaded
+        self.sync()
         self.measure_disk_usage(deploy_dir, 'deploy_dir', 'deploy dir',
                                 apparent_size=True)
-- 
2.12.3


