Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.305.1628635712209575502
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 15:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ttasciog@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 17AMmUUf012615
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Aug 2021 15:48:30 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 10 Aug 2021 15:48:30 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 10 Aug 2021 15:48:30 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 21862)
	id 085EE900AE9; Tue, 10 Aug 2021 15:48:29 -0700 (PDT)
From: "Tony Tascioglu" <tony.tascioglu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>, <tony.tascioglu@windriver.com>
Subject: [PATCH] valgrind: skip broken ptests for glibc 2.34
Date: Tue, 10 Aug 2021 15:48:29 -0700
Message-ID: <20210810224829.159817-1-tony.tascioglu@windriver.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Skip tests that are problematic for glibc-2.34.
The list of problematic ptests was found by Richard after
patching several to work with the new glibc version.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=14500

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
---
 meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 | 5 +++++
 meta/recipes-devtools/valgrind/valgrind/remove-for-all     | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
index b4fc8af333..a3c36ba383 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
@@ -236,3 +236,8 @@ memcheck/tests/wrapmallocstatic
 memcheck/tests/writev1
 memcheck/tests/xml1
 memcheck/tests/linux/stack_changes
+gdbserver_tests/hginfo
+memcheck/tests/linux/timerfd-syscall
+drd/tests/thread_name_xml
+massif/tests/deep-D
+
diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-all b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
index c3fc639066..917b0b581b 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-for-all
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
@@ -1 +1,7 @@
 none/tests/amd64/fb_test_amd64
+gdbserver_tests/hginfo
+memcheck/tests/supp_unknown
+helgrind/tests/tls_threads
+drd/tests/bar_bad_xml
+drd/tests/pth_barrier_thr_cr
+
-- 
2.31.1

