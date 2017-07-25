Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 8FA4778272
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 17:14:59 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Jul 2017 10:14:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,411,1496127600"; d="scan'208";a="1199212512"
Received: from yctb06.ostc.intel.com ([10.54.69.60])
	by fmsmga002.fm.intel.com with ESMTP; 25 Jul 2017 10:14:22 -0700
From: jose.perez.carranza@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jul 2017 10:14:16 -0700
Message-Id: <20170725171416.15383-1-jose.perez.carranza@linux.intel.com>
X-Mailer: git-send-email 2.12.3
MIME-Version: 1.0
Subject: [PATCH] buildperf/tests_basics: sync the system to have clean esdk deploy dir
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
X-List-Received-Date: Tue, 25 Jul 2017 17:14:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>

In some cases and depending on the resources measurement of disk usage
for eSDK deploy dir is failing due “measure_disk_usage” was locking for
tmp files (bitbake.lock and bitbake.sock) that were not deleted on time,
this can be avoided by a sync on the system to allow all process to be
finished on time and ensuring esdk deploy dir is clean.

Signed-off-by: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
---
 meta/lib/oeqa/buildperf/test_basic.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/buildperf/test_basic.py b/meta/lib/oeqa/buildperf/test_basic.py
index a9e4a5b731..92197878af 100644
--- a/meta/lib/oeqa/buildperf/test_basic.py
+++ b/meta/lib/oeqa/buildperf/test_basic.py
@@ -121,5 +121,7 @@ class Test4(BuildPerfTestCase):
         self.sync()
         self.measure_cmd_resources([installer, '-y', '-d', deploy_dir],
                                    'deploy', 'eSDK deploy')
+        #sync before the final disk usage measurement
+        self.sync()
         self.measure_disk_usage(deploy_dir, 'deploy_dir', 'deploy dir',
                                 apparent_size=True)
-- 
2.12.3


