Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.6900.1620371011413487034
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 00:03:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: w3hixuMJWHhuZlaPW7cZOrbcyX39oy+dGk4lPFnhnQFMeu2yt//CMQl5v3X2Dc12VR5uv/WLfD
 BGfm1OowFWSA==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="185794860"
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="185794860"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:35 -0700
IronPort-SDR: Su/IC6zAYAnDFmnQbcYmYtwsCKWhB6e3lJ5T82NGO1hcbGPWXbnTUq9uwT78aK6/roMmS5NN3F
 T6u7l6PpP4gA==
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="407331760"
Received: from sthum-mobl6.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.243.238])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:33 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 31/31] libevent: Increase ptest timing tolerance 50 ms -> 100 ms
Date: Fri,  7 May 2021 15:02:43 +0800
Message-Id: <d5d88c2293e8ebc958d1bce9af8f796024443be9.1620370571.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620370571.git.anuj.mittal@intel.com>
References: <cover.1620370571.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yi Fan Yu <yifan.yu@windriver.com>

Adjusting the tolerance to a more reasonable time
given the load on the AB and given the high amount(100) of
events some of the tests like `common_timeout` generates.

[YOCTO #14163]

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 38b36d2b90d570149e63816e68f457aea28a5092)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ncrease-default-timeval-tolerance-50.patch | 33 +++++++++++++++++++
 .../libevent/libevent_2.1.12.bb               |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-support/libevent/libevent/0002-test-regress.h-Increase-default-timeval-tolerance-50.patch

diff --git a/meta/recipes-support/libevent/libevent/0002-test-regress.h-Increase-default-timeval-tolerance-50.patch b/meta/recipes-support/libevent/libevent/0002-test-regress.h-Increase-default-timeval-tolerance-50.patch
new file mode 100644
index 0000000000..0b20eda3c0
--- /dev/null
+++ b/meta/recipes-support/libevent/libevent/0002-test-regress.h-Increase-default-timeval-tolerance-50.patch
@@ -0,0 +1,33 @@
+From dff8fd27edb23bc1486809186c6a4fe1f75f2179 Mon Sep 17 00:00:00 2001
+From: Yi Fan Yu <yifan.yu@windriver.com>
+Date: Thu, 22 Apr 2021 22:35:59 -0400
+Subject: [PATCH] test/regress.h: Increase default timeval tolerance 50 ms ->
+ 100 ms
+
+The default timeout tolerance is 50 ms,
+which causes intermittent failure in many the
+related tests in arm64 QEMU.
+
+See: https://bugzilla.yoctoproject.org/show_bug.cgi?id=14163
+(The root cause seems to be a heavy load)
+
+Upstream-Status: Submitted [https://github.com/libevent/libevent/pull/1157]
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+---
+ test/regress.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/regress.h b/test/regress.h
+index f06a7669..829af4a7 100644
+--- a/test/regress.h
++++ b/test/regress.h
+@@ -127,7 +127,7 @@ int test_ai_eq_(const struct evutil_addrinfo *ai, const char *sockaddr_port,
+ 	tt_int_op(labs(timeval_msec_diff((tv1), (tv2)) - diff), <=, tolerance)
+ 
+ #define test_timeval_diff_eq(tv1, tv2, diff)				\
+-	test_timeval_diff_leq((tv1), (tv2), (diff), 50)
++	test_timeval_diff_leq((tv1), (tv2), (diff), 100)
+ 
+ long timeval_msec_diff(const struct timeval *start, const struct timeval *end);
+
diff --git a/meta/recipes-support/libevent/libevent_2.1.12.bb b/meta/recipes-support/libevent/libevent_2.1.12.bb
index dd4533cce5..6d53fea5a8 100644
--- a/meta/recipes-support/libevent/libevent_2.1.12.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.12.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://github.com/libevent/libevent/releases/download/release-${PV}-
            file://Makefile-missing-test-dir.patch \
            file://run-ptest \
            file://0001-test-regress_dns.c-patch-out-tests-that-require-a-wo.patch \
+           file://0002-test-regress.h-Increase-default-timeval-tolerance-50.patch \
            "
 
 SRC_URI[sha256sum] = "92e6de1be9ec176428fd2367677e61ceffc2ee1cb119035037a27d346b0403bb"
-- 
2.30.2

