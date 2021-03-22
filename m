Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7183.1616377301187997965
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Mar 2021 18:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: kZq+IAVBUZyxpGpsl6t8ROIXO7faWonKoHbRRPCAk/uSW/HfS8VymtbtF2Rmz74ia2Uc+8bC8v
 F2q6EXWP9WTA==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="190211596"
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="190211596"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:41:49 -0700
IronPort-SDR: tQ/457ZbvpUV+c9sEGJmGQzoGHdo3o7x3SO+3tkG/FDhU0hVEm7Z2usB8Exm5Eeq4+EpQnNx14
 /sE3B8LIgiEw==
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="524295163"
Received: from myusoff-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.78.4])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:41:48 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 08/25] ptest-packagelists: remove libinput-ptest
Date: Mon, 22 Mar 2021 09:41:10 +0800
Message-Id: <15c39af471bd42f0469ee138f3c93e8652e6f55f.1616377115.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616377115.git.anuj.mittal@intel.com>
References: <cover.1616377115.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

The libinput ptests are very sensitive to system load, and will fail
if events from the kernel don't arrive sufficiently fast (from 20ms to
200ms depending on the test).

This is by design as input processing is inherently time-sensitive and
to avoid code bugs the test suite considers timing problems fatal.

As this is causing a large proportion of ptest runs to fail in libinput,
disable the execution of these tests for now.

[ YOCTO #14164 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 54e2eb809bdfedb64219f37b82589372bbc96905)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index ce13368c2e..e0a876dbdc 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -60,6 +60,7 @@ PTESTS_FAST_remove_mips64 = "qemu-ptest"
 #    bash-ptest \ # Test outcomes are non-deterministic by design
 #    ifupdown-ptest \ # Tested separately in lib/oeqa/selftest/cases/imagefeatures.py
 #    mdadm-ptest \ # Tests rely on non-deterministic sleep() amounts
+#    libinput-ptest \ # Tests need an unloaded system to be reliable
 #"
 
 PTESTS_SLOW = "\
@@ -72,7 +73,6 @@ PTESTS_SLOW = "\
     glib-2.0-ptest \
     gstreamer1.0-ptest \
     libevent-ptest \
-    libinput-ptest \
     lttng-tools-ptest \
     openssh-ptest \
     openssl-ptest \
-- 
2.30.2

