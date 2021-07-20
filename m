Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.4475.1626765164432274295
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jul 2021 00:12:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 16K7Cf46028572
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Tue, 20 Jul 2021 00:12:41 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 16K7Cfbg002965
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Jul 2021 00:12:41 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 20 Jul 2021 00:12:40 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Tue, 20 Jul 2021 00:12:39 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <alex.kanavin@gmail.com>,
        <raj.khem@gmail.com>
Subject: [PATCH v2] parselogs.py: ignore rndr initialization failure
Date: Tue, 20 Jul 2021 15:10:55 +0800
Message-ID: <20210720071055.30404-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAMKF1so_itQESzrcEM1wnvAdYz-mJepxYSw-8QRFzh4aKdAuAA@mail.gmail.com>
References: <CAMKF1so_itQESzrcEM1wnvAdYz-mJepxYSw-8QRFzh4aKdAuAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

After rng-tools upgraded to 6.13, the RNDR instruction added
as an entropy source [1]. But for some cpu which doesn't support
rndr, there comes below warning message:
 # systemctl status rngd
 [snip]
 Jul 20 06:48:07 qemuarm64 rngd[163]: [rndr  ]: No HW SUPPORT
 Jul 20 06:48:07 qemuarm64 rngd[163]: [rndr  ]: Initialization Failed
 [snip]

Actually the failed message doesn't matter as it only indicates
one entropy source rndr fails to initialize and won't affect rngd
function, so ignore the failure message to fix below error during
do_testimage.
NOTE: ======================================================================
NOTE: FAIL: test_parselogs (parselogs.ParseLogsTest)
NOTE: ----------------------------------------------------------------------
NOTE: Traceback (most recent call last):
  File "/build/layers/oe-core/meta/lib/oeqa/core/decorator/__init__.py", line 36, in wrapped_f
    return func(*args, **kwargs)
  File "/build/layers/oe-core/meta/lib/oeqa/runtime/cases/parselogs.py", line 382, in test_parselogs
    self.assertEqual(errcount, 0, msg=self.msg)
AssertionError: 1 != 0 : Log: /build/tmp/work/qemuarm64-wrs-linux/wrlinux-image-std/1.0-r5/target_logs/daemon.log
-----------------------
Central error: 2021-06-23T20:44:18.374494+00:00 qemuarm64 rngd[162]: [rndr  ]: Initialization Failed

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 1bb0425521..73243c3659 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -59,6 +59,7 @@ common_errors = [
     "Failed to process device, ignoring: Device or resource busy",
     "Cannot find a map file",
     "[rdrand]: Initialization Failed",
+    "[rndr  ]: Initialization Failed",
     "[pulseaudio] authkey.c: Failed to open cookie file",
     "[pulseaudio] authkey.c: Failed to load authentication key",
     ]
-- 
2.17.1

