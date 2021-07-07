Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.18591.1625648128824472858
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 01:55:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1678tRGY024704
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Jul 2021 01:55:28 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 7 Jul 2021 01:55:27 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Wed, 7 Jul 2021 01:55:26 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] qemuarm64.conf: change the cpu model to max
Date: Wed, 7 Jul 2021 16:54:19 +0800
Message-ID: <20210707085419.2610-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

After rng-tools upgraded to 6.13, the below logic introduced.
9070a04 Add support for ARM v8.5A "rndr" instruction

It means there is another entropy source rndr added for arm64,
so modify the cpu model to max [1] to make the rndr entropy source
function available and also used to silence the below failed message
when start rngd service on qemuarm64.
"[rndr ]: Initialization Failed"

Before the patch:
 $ systemctl status rngd
 [snip]
 Jul 05 07:15:47 qemuarm64 systemd[1]: Started Hardware RNG Entropy Gatherer Daemon.
 Jul 05 07:15:48 qemuarm64 rngd[152]: Initializing available sources
 Jul 05 07:15:48 qemuarm64 rngd[152]: [hwrng ]: Initialized
 Jul 05 07:15:48 qemuarm64 rngd[152]: [rndr ]: No HW SUPPORT
 Jul 05 07:15:48 qemuarm64 rngd[152]: [rndr ]: Initialization Failed
 Jul 05 07:15:48 qemuarm64 rngd[152]: [jitter]: Initializing AES buffer
 Jul 05 07:16:14 qemuarm64 rngd[152]: [jitter]: Enabling JITTER rng support
 Jul 05 07:16:14 qemuarm64 rngd[152]: [jitter]: Initialized

After the patch:
 $ systemctl status rngd
 [snip]
 Jul 07 08:48:30 qemuarm64 systemd[1]: Started Hardware RNG Entropy Gatherer Daemon.
 Jul 07 08:48:34 qemuarm64 rngd[164]: Initializing available sources
 Jul 07 08:48:34 qemuarm64 rngd[164]: [hwrng ]: Initialized
 Jul 07 08:48:34 qemuarm64 rngd[164]: [rndr  ]: Enabling aarch64 RNDR rng support
 Jul 07 08:48:34 qemuarm64 rngd[164]: [rndr  ]: Initialized
 Jul 07 08:48:35 qemuarm64 rngd[164]: [jitter]: Initializing AES buffer

[1] https://github.com/nhorman/rng-tools/pull/128

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/conf/machine/qemuarm64.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index 150a0744eb..a792dc32e6 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -15,7 +15,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 # For runqemu
 QB_SYSTEM_NAME = "qemu-system-aarch64"
 QB_MACHINE = "-machine virt"
-QB_CPU = "-cpu cortex-a57"
+QB_CPU = "-cpu max"
 QB_SMP = "-smp 4"
 QB_CPU_KVM = "-cpu host -machine gic-version=3"
 # For graphics to work we need to define the VGA device as well as the necessary USB devices
-- 
2.17.1

