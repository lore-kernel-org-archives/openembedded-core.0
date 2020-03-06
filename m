Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 91F1261B09
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2020 11:25:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 026BPVpB009341
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Mar 2020 03:25:31 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.487.0; Fri, 6 Mar 2020 03:25:18 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Mar 2020 19:25:16 +0800
Message-ID: <1583493916-432974-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] parselogs.py: ignore rdrand initialization failure
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
X-List-Received-Date: Fri, 06 Mar 2020 11:25:30 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

On the system whose cpu doesn't support rdrand,
there comes below message when start rngd service
 #systemctl status rngd
 [snip]
 Feb 25 05:08:14 qemux86-64 rngd[133]: [rdrand]: Initialization Failed
 [snip]

Actually the failed message doesn't matter as it
only indicates one entropy source as rdrand fails
to initialize and won't affect rngd function.

So add to ignore the failure message to fix below
error during do_testimage:
NOTE: ======================================================================
NOTE: FAIL: test_parselogs (parselogs.ParseLogsTest)
NOTE: ----------------------------------------------------------------------
NOTE: Traceback (most recent call last):
  File "/buildarea/layers/oe-core/meta/lib/oeqa/core/decorator/__init__.py", line 36, in wrapped_f
    return func(*args, **kwargs)
  File "/buildarea/layers/oe-core/meta/lib/oeqa/runtime/cases/parselogs.py", line 370, in test_parselogs
    self.assertEqual(errcount, 0, msg=self.msg)
AssertionError: 1 != 0 : Log: /buildarea/tmp/work/qemux86-64-wrs-linux/wrlinux-image-std/1.0-r5/target_logs/daemon.log
Central error: 2020-03-06T09:45:12.774286+00:00 qemux86-64 rngd[134]: [rdrand]: Initialization Failed

Reference: https://github.com/nhorman/rng-tools/pull/84

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 3cad070..6444fe8 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -56,7 +56,8 @@ common_errors = [
     "error retry time-out =",
     "logind: cannot setup systemd-logind helper (-61), using legacy fallback",
     "Error changing net interface name 'eth0' to ",
-    "Cannot find a map file"
+    "Cannot find a map file",
+    "[rdrand]: Initialization Failed"
     ]
 
 video_related = [
-- 
2.7.4


