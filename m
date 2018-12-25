Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1E7BD6C0BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Dec 2018 09:40:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBP9duih004099
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Dec 2018 01:40:32 -0800
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 25 Dec 2018 01:40:07 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Dec 2018 04:39:43 -0500
Message-ID: <b3c97b211633cd4314464f9c9e88ff3b970d738f.1545730744.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.19.0.rc2
In-Reply-To: <cover.1545730744.git.kai.kang@windriver.com>
References: <cover.1545730744.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] testimage.bbclass: remove boot parameter systemd.log_target
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
X-List-Received-Date: Tue, 25 Dec 2018 09:40:41 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Boot parameter systemd.log_target=console affects command journalctl's
output and causes oe selftest case test_systemd_boot_time fail to pass.

| Error at obtaining the boot time from journalctl
| RESULTS:
| RESULTS - systemd.SystemdJournalTests.test_systemd_boot_time - Testcase -1: SKIPPED (0.74s)

systemd.log_target=console was introduced by oe-core commit a0bb649 and
work with parameter systemd.log_level to enable systemd debug.
systemd.log_level has been removed already, so remove systemd.log_target
too to make case test_systemd_boot_time pass.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/testimage.bbclass | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 8a15c30c79..e8fa4a3b32 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -293,18 +293,12 @@ def testimage_main(d):
 
     package_extraction(d, tc.suites)
 
-    bootparams = None
-    if d.getVar('VIRTUAL-RUNTIME_init_manager', '') == 'systemd':
-        # Add systemd.log_level=debug to enable systemd debug logging
-        bootparams = 'systemd.log_target=console'
-
     results = None
     orig_sigterm_handler = signal.signal(signal.SIGTERM, sigterm_exception)
     try:
         # We need to check if runqemu ends unexpectedly
         # or if the worker send us a SIGTERM
-        tc.target.start(params=d.getVar("TEST_QEMUPARAMS"),
-                        extra_bootparams=bootparams)
+        tc.target.start(params=d.getVar("TEST_QEMUPARAMS"))
         results = tc.runTests()
     except (RuntimeError, BlockingIOError) as err:
         if isinstance(err, RuntimeError):
-- 
2.19.0.rc2


