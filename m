Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.3705.1585708391005321473
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 19:33:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0312X9V4009240
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2020 19:33:09 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Tue, 31 Mar 2020 19:32:56 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] perf: fix compile error when rebuilding
Date: Wed, 1 Apr 2020 10:32:55 +0800
Message-ID: <1585708375-279106-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Fix error like:
Makefile.perf:597: recipe for target
'intel_x86_64-wrs-linux/perf/1.0-r9/perf-1.0/perf-in.o] Error 2
Makefile.perf:220: recipe for target 'sub-make' failed
make[1]: *** [sub-make] Error 2
Makefile:69: recipe for target 'all' failed
make: *** [all] Error 2

during rebuilding, when kernel version changed, some
source files also maybe changed. It could happened
that the source under ${S} messed up with some already
dropped files and also new files. Fix by clean the ${S}
before copy source files.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index e005eb0..c4b7b77 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -147,6 +147,7 @@ python copy_perf_source_from_kernel() {
     src_dir = d.getVar("STAGING_KERNEL_DIR")
     dest_dir = d.getVar("S")
     bb.utils.mkdirhier(dest_dir)
+    bb.utils.prunedir(dest_dir)
     for s in sources:
         src = oe.path.join(src_dir, s)
         dest = oe.path.join(dest_dir, s)
-- 
2.7.4

