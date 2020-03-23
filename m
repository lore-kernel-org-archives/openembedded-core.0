Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.47998.1584950620069856333
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2020 01:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 02N83JRc013424
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2020 01:03:29 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Mon, 23 Mar 2020 01:03:08 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] sysklogd: fix one parallel build error
Date: Mon, 23 Mar 2020 16:03:07 +0800
Message-ID: <1584950587-371159-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...-rarely-reproduced-parallel-build-problem.patch | 40 ++++++++++++++++++++++
 meta/recipes-extended/sysklogd/sysklogd.inc        |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-extended/sysklogd/files/0001-fix-one-rarely-reproduced-parallel-build-problem.patch

diff --git a/meta/recipes-extended/sysklogd/files/0001-fix-one-rarely-reproduced-parallel-build-problem.patch b/meta/recipes-extended/sysklogd/files/0001-fix-one-rarely-reproduced-parallel-build-problem.patch
new file mode 100644
index 0000000..334577a
--- /dev/null
+++ b/meta/recipes-extended/sysklogd/files/0001-fix-one-rarely-reproduced-parallel-build-problem.patch
@@ -0,0 +1,40 @@
+From dcaa75391ff267c38e776d48c579cdb734b91af3 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 23 Mar 2020 15:52:32 +0800
+Subject: [PATCH] fix one rarely reproduced parallel build problem
+
+fix for this issue:
+https://github.com/troglobit/sysklogd/issues/17
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+Upstream-Status: Backport
+[https://github.com/troglobit/sysklogd/commit/b88e21d1770a262f0e5d0f6b84f0abd4a5de55b7]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/Makefile.am | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 993dbfd..06b706d 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -56,3 +56,13 @@ libsyslog_la_SOURCES  = syslog.c syslog.h compat.h
+ libsyslog_la_CPPFLAGS = $(AM_CPPFLAGS) -D_XOPEN_SOURCE=600
+ libsyslog_la_LDFLAGS  = $(AM_LDFLAGS) -version-info 0:0:0
+ libsyslog_la_LIBADD   = $(LTLIBOBJS)
++
++# Both libsyslog_la and syslogd/logger requires objects like lib/pidfile.o, for
++# # libsyslog_la, the objects should be compiled with -fPIC, but for
++# # syslogd/logger, it doesn't need -fPIC, so there is a race issue when the two
++# # different lib/pidfile.o are compiled at the same time, which would cause errors like:
++# # ld: syslogd-syslogd.o: in function `main':
++# # syslogd.c:417: undefined reference to `__pidfile'
++# #
++# # Make LIBOBJS depend on LTLIBOBJS to fix the problem.
++# $(LIBOBJS): $(LTLIBOBJS)
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index 2e3d983..8899daa 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -12,6 +12,7 @@ inherit update-rc.d update-alternatives systemd autotools
 
 SRC_URI = "git://github.com/troglobit/sysklogd.git;nobranch=1 \
            file://sysklogd \
+           file://0001-fix-one-rarely-reproduced-parallel-build-problem.patch \
            "
 S = "${WORKDIR}/git"
 
-- 
2.7.4

