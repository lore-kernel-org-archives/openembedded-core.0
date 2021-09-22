Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.4339.1632299757947530405
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Sep 2021 01:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 18M8ZuuL008902
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Sep 2021 01:35:56 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 22 Sep 2021 01:35:55 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 22 Sep 2021 01:35:55 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] libevent: mark util/monotonic_prc_fallback as retriable
Date: Wed, 22 Sep 2021 16:35:06 +0800
Message-ID: <20210922083506.29630-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Backport a patch to fix the below ptest failure:
 # ./run-ptest
 Running tests:
 EVPORT
 Skipping test
 KQUEUE
 Skipping test
 EPOLL
 test-eof: OKAY
 test-dumpevents: OKAY (output not checked)
 regress:
  FAIL ../libevent-2.1.12-stable/test/regress_util.c:1478: assert(diff.tv_sec == 0): 1 vs 0 util/monotonic_prc_fallback:
  [monotonic_prc_fallback FAILED]
 1/312 TESTS FAILED. (33 skipped)
 FAILED
 regress_debug:
  FAIL ../libevent-2.1.12-stable/test/regress_util.c:1478: assert(diff.tv_sec == 0): 1 vs 0 util/monotonic_prc_fallback:
  [monotonic_prc_fallback FAILED]
 1/312 TESTS FAILED. (33 skipped)
 FAILED
 [snip]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...-monotonic_prc_fallback-as-retriable.patch | 30 +++++++++++++++++++
 .../libevent/libevent_2.1.12.bb               |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-support/libevent/libevent/0001-test-mark-util-monotonic_prc_fallback-as-retriable.patch

diff --git a/meta/recipes-support/libevent/libevent/0001-test-mark-util-monotonic_prc_fallback-as-retriable.patch b/meta/recipes-support/libevent/libevent/0001-test-mark-util-monotonic_prc_fallback-as-retriable.patch
new file mode 100644
index 0000000000..754c446a67
--- /dev/null
+++ b/meta/recipes-support/libevent/libevent/0001-test-mark-util-monotonic_prc_fallback-as-retriable.patch
@@ -0,0 +1,30 @@
+From 8fc3fb57ac1b1b0f338506cb86e3adac29d684d7 Mon Sep 17 00:00:00 2001
+From: Azat Khuzhin <azat@libevent.org>
+Date: Wed, 22 Sep 2021 15:14:01 +0800
+Subject: [PATCH] test: mark util/monotonic_prc_fallback as retriable
+
+Refs: #1193
+
+Upstream-Status: Backport [https://github.com/libevent/libevent/commit/04fcd7c6df158bb65261867de4b9ec8439696934]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ test/regress_util.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/regress_util.c b/test/regress_util.c
+index 45caa27..a9e80db 100644
+--- a/test/regress_util.c
++++ b/test/regress_util.c
+@@ -1672,7 +1672,7 @@ struct testcase_t util_testcases[] = {
+ 	{ "monotonic_res_fallback", test_evutil_monotonic_res, TT_OFF_BY_DEFAULT, &basic_setup, (void*)"fallback" },
+ 	{ "monotonic_prc", test_evutil_monotonic_prc, 0, &basic_setup, (void*)"" },
+ 	{ "monotonic_prc_precise", test_evutil_monotonic_prc, TT_RETRIABLE, &basic_setup, (void*)"precise" },
+-	{ "monotonic_prc_fallback", test_evutil_monotonic_prc, 0, &basic_setup, (void*)"fallback" },
++	{ "monotonic_prc_fallback", test_evutil_monotonic_prc, TT_RETRIABLE, &basic_setup, (void*)"fallback" },
+ 	{ "date_rfc1123", test_evutil_date_rfc1123, 0, NULL, NULL },
+ 	{ "evutil_v4addr_is_local", test_evutil_v4addr_is_local, 0, NULL, NULL },
+ 	{ "evutil_v6addr_is_local", test_evutil_v6addr_is_local, 0, NULL, NULL },
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/libevent/libevent_2.1.12.bb b/meta/recipes-support/libevent/libevent_2.1.12.bb
index 4b419eab22..3f29c0cffe 100644
--- a/meta/recipes-support/libevent/libevent_2.1.12.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.12.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://github.com/libevent/libevent/releases/download/release-${PV}-
            file://run-ptest \
            file://0001-test-regress_dns.c-patch-out-tests-that-require-a-wo.patch \
            file://0002-test-regress.h-Increase-default-timeval-tolerance-50.patch \
+           file://0001-test-mark-util-monotonic_prc_fallback-as-retriable.patch \
            "
 
 SRC_URI[sha256sum] = "92e6de1be9ec176428fd2367677e61ceffc2ee1cb119035037a27d346b0403bb"
-- 
2.32.0

