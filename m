Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7839.1614918154051973024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:23:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Sbms6FlnUvXKkFj4tvbHaHrAPK9IXfDYKI/c61djNiJDb4s5+Ohs4eCfeBINyOSJ7SwVMlma7i
 MEpUSmHn3D7Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187671243"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187671243"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:23:01 -0800
IronPort-SDR: 6t00oAMrjTEEpnCsmRj7R6nRw4r1Yyt7rcC6Veyy/uIJqJXisPZwezXUdd9+iVaHiMvlO8d08J
 vlOnN6EN5/3Q==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408129162"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:23:00 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 46/52] valgrind: Increase timeout duration 30 -> 90 s
Date: Fri,  5 Mar 2021 12:21:22 +0800
Message-Id: <cbdc6e8a7318061e973faee8010efe2e748157e8.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yi Fan Yu <yifan.yu@windriver.com>

Attempt to fix intermittent failure of `drd/tests/std_list`
Locally tested to take around 45 s on qemuarm64

[YOCTO #14228]

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit aac00b1c8042e41cd6bb1aea8e3033a1c6dd2b05)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...Modify-vg_test-wrapper-to-support-PTEST-formats.patch | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch b/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch
index 7985308e41..0c399ef52c 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch
@@ -19,6 +19,11 @@ Upstream-Status: Pending
 Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+Increase time limit to 90 s.
+(double of the expected time of drd/tests/std_list on qemuarm64)
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
 ---
  tests/vg_regtest.in | 75 +++++++++++++++++++++++++++++++++++++++--------------
  1 file changed, 55 insertions(+), 20 deletions(-)
@@ -66,7 +71,7 @@ index a441f42..cb05b52 100755
  # Since most of the program time is spent in system() calls, need this to
  # propagate a Ctrl-C enabling us to quit.
 -sub mysystem($) 
-+# Enforce 30 seconds limit for the test.
++# Enforce 90 seconds limit for the test.
 +# This resume execution of the remaining tests if valgrind hangs.
 +sub mysystem($)
  {
@@ -76,7 +81,7 @@ index a441f42..cb05b52 100755
 +    my $exit_code=0;
 +    eval {
 +        local $SIG{'ALRM'} = sub { die "timed out\n" };
-+        alarm(30);
++        alarm(90);
 +        $exit_code = system($_[0]);
 +        alarm (0);
 +        ($exit_code == 2) and die "SIGINT\n";   # 2 is SIGINT
-- 
2.29.2

