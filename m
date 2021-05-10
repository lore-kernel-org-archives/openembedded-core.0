Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.26599.1620614036807064276
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 May 2021 19:33:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 14A2Xt3k001398
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sun, 9 May 2021 19:33:55 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Sun, 9 May 2021 19:33:55 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Sun, 9 May 2021 19:33:54 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] rng-tools: disable the CPU affinity mask
Date: Mon, 10 May 2021 10:33:10 +0800
Message-ID: <20210510023310.5516-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

For the jitter entropy source, each task thread will create an internal
counter timer thread when the system clock resolution is under 5MHz.

But it will introduce high cpu usage for a long time and also make random
data generate too slow if sets the CPU affinity mask of the internal counter
timer thread.

There is no solution until now and the Upstream recommends to disable
the internal timer and think Jitter RNG will not work due to the coarse
timer. Check [1] and [2] for more details.

So disable the CPU affinity mask as a workaround to avoid lots of context
switch and too high cpu load for a long time.

[1] https://github.com/smuellerDD/jitterentropy-library/issues/37
[2] https://github.com/nhorman/rng-tools/pull/123

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...tter.c-disable-the-CPU-affinity-mask.patch | 48 +++++++++++++++++++
 .../rng-tools/rng-tools_6.11.bb               |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/0001-rngd_jitter.c-disable-the-CPU-affinity-mask.patch

diff --git a/meta/recipes-support/rng-tools/rng-tools/0001-rngd_jitter.c-disable-the-CPU-affinity-mask.patch b/meta/recipes-support/rng-tools/rng-tools/0001-rngd_jitter.c-disable-the-CPU-affinity-mask.patch
new file mode 100644
index 0000000000..e5fe1b0021
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools/0001-rngd_jitter.c-disable-the-CPU-affinity-mask.patch
@@ -0,0 +1,48 @@
+From e44e35dd0b739da8718a5c78e0092bd2feabf5ce Mon Sep 17 00:00:00 2001
+From: Zhantao Tang <zhantao.tang@windriver.com>
+Date: Sun, 25 Apr 2021 11:33:24 +0800
+Subject: [PATCH] rngd_jitter.c: disable the CPU affinity mask
+
+For the jitter entropy source, each task thread will create an internal
+counter timer thread when the system clock resolution is under 5MHz.
+
+But it will introduce high cpu usage for a long time and also make random
+data generate too slow if sets the CPU affinity mask of the internal counter
+timer thread.
+
+So disable the CPU affinity mask to avoid lots of context switch and too
+high cpu load for a long time.
+
+Upstream-Status: Denied[There is no solution until now and Upstream recommend
+                        to disable the internal timer and think Jitter RNG will
+                        not work due to the coarse timer. Check [1] and [2] for
+                        more details]
+
+[1] https://github.com/smuellerDD/jitterentropy-library/issues/37
+[2] https://github.com/nhorman/rng-tools/pull/123
+
+Signed-off-by: Zhantao Tang <zhantao.tang@windriver.com>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ rngd_jitter.c | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/rngd_jitter.c b/rngd_jitter.c
+index c803f0d..ef03c6c 100644
+--- a/rngd_jitter.c
++++ b/rngd_jitter.c
+@@ -252,11 +252,6 @@ static void *thread_entropy_task(void *data)
+ 		me->slptm.tv_nsec = 0;
+ 	}
+ 
+-	/* fill initial entropy */
+-	CPU_ZERO(&cpuset);
+-	CPU_SET(me->core_id, &cpuset);
+-	pthread_setaffinity_np(pthread_self(), CPU_ALLOC_SIZE(me->core_id+1), &cpuset);
+-
+ 	tmpbuf = malloc(me->buf_sz);
+ 	if (!tmpbuf) {
+ 		message_entsrc(me->ent_src,LOG_DAEMON|LOG_DEBUG, "Unable to allocate temp buffer on cpu %d\n", me->core_id);
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/rng-tools/rng-tools_6.11.bb b/meta/recipes-support/rng-tools/rng-tools_6.11.bb
index 61a0cef2e0..e45a7d12cb 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.11.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.11.bb
@@ -10,6 +10,7 @@ DEPENDS = "sysfsutils openssl"
 
 SRC_URI = "\
     git://github.com/nhorman/rng-tools.git \
+    file://0001-rngd_jitter.c-disable-the-CPU-affinity-mask.patch \
     file://init \
     file://default \
     file://rngd.service \
-- 
2.29.2

