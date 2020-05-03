Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.23920.1588516847015260209
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 07:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=VspOzegk;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id B9C1860133;
	Sun,  3 May 2020 16:40:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1588516843;
	bh=PU0zYaoKAB34eZgDDrzJ721SCp5hvYir7c8prpQA4R4=;
	h=From:To:Cc:Subject:Date:From;
	b=VspOzegkh/fC83zUlEP2BTNrWakn695V1nzr7FLA6EW+H0Y2KRpBDhFRJNPzZ2he/
	 6lHubZkSk54TtgS1FEMASDqIY1tDNf9AbCCLLwoG1WcuKgCTl221WSlvDJn1SPJS3N
	 jEX+tVSYtXeF7MFVkr8wZLcojT8XLHVvbJlUX5r6vyzevV5B5mmC7OFIn7dBknmbfd
	 KTrD+0wXP/DD+tFPMwAmbSao+P64ZHxnTwY/dVEpnjsdjVYtIdoRpccmG/YNTizcgV
	 Gzexou+N+UH5xDAjF4viWJZQtYzPpPkh++8/jcInX9YrrwaWGC/SaQ/C9LYuCYuojT
	 N2AFf4+wDnlPw==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-core@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [PATCH] sysklogd: upgrade 2.1.1 -> 2.1.2
Date: Sun,  3 May 2020 16:40:41 +0200
Message-Id: <1588516841-10104-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

See https://github.com/troglobit/sysklogd/releases/tag/v2.1.2

Also remove patch applied upstream.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 ...-rarely-reproduced-parallel-build-problem.patch | 40 ----------------------
 meta/recipes-extended/sysklogd/sysklogd.inc        |  1 -
 meta/recipes-extended/sysklogd/sysklogd_2.1.1.bb   |  3 --
 meta/recipes-extended/sysklogd/sysklogd_2.1.2.bb   |  3 ++
 4 files changed, 3 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-extended/sysklogd/files/0001-fix-one-rarely-reproduced-parallel-build-problem.patch
 delete mode 100644 meta/recipes-extended/sysklogd/sysklogd_2.1.1.bb
 create mode 100644 meta/recipes-extended/sysklogd/sysklogd_2.1.2.bb

diff --git a/meta/recipes-extended/sysklogd/files/0001-fix-one-rarely-reproduced-parallel-build-problem.patch b/meta/recipes-extended/sysklogd/files/0001-fix-one-rarely-reproduced-parallel-build-problem.patch
deleted file mode 100644
index 97bf6ae..0000000
--- a/meta/recipes-extended/sysklogd/files/0001-fix-one-rarely-reproduced-parallel-build-problem.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From dcaa75391ff267c38e776d48c579cdb734b91af3 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Mon, 23 Mar 2020 15:52:32 +0800
-Subject: [PATCH] fix one rarely reproduced parallel build problem
-
-fix for this issue:
-https://github.com/troglobit/sysklogd/issues/17
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
-Upstream-Status: Backport
-[https://github.com/troglobit/sysklogd/commit/b88e21d1770a262f0e5d0f6b84f0abd4a5de55b7]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- src/Makefile.am | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 993dbfd..06b706d 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -56,3 +56,13 @@ libsyslog_la_SOURCES  = syslog.c syslog.h compat.h
- libsyslog_la_CPPFLAGS = $(AM_CPPFLAGS) -D_XOPEN_SOURCE=600
- libsyslog_la_LDFLAGS  = $(AM_LDFLAGS) -version-info 0:0:0
- libsyslog_la_LIBADD   = $(LTLIBOBJS)
-+
-+# Both libsyslog_la and syslogd/logger requires objects like lib/pidfile.o, for
-+# libsyslog_la, the objects should be compiled with -fPIC, but for
-+# syslogd/logger, it doesn't need -fPIC, so there is a race issue when the two
-+# different lib/pidfile.o are compiled at the same time, which would cause errors like:
-+# ld: syslogd-syslogd.o: in function `main':
-+# syslogd.c:417: undefined reference to `__pidfile'
-+#
-+# Make LIBOBJS depend on LTLIBOBJS to fix the problem.
-+$(LIBOBJS): $(LTLIBOBJS)
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index 8899daa..2e3d983 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -12,7 +12,6 @@ inherit update-rc.d update-alternatives systemd autotools
 
 SRC_URI = "git://github.com/troglobit/sysklogd.git;nobranch=1 \
            file://sysklogd \
-           file://0001-fix-one-rarely-reproduced-parallel-build-problem.patch \
            "
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.1.1.bb b/meta/recipes-extended/sysklogd/sysklogd_2.1.1.bb
deleted file mode 100644
index eb6b4ef..0000000
--- a/meta/recipes-extended/sysklogd/sysklogd_2.1.1.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require sysklogd.inc
-
-SRCREV = "24dafe9a27ac959ebeb89acd3ebd3d62cca4b755"
diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.1.2.bb b/meta/recipes-extended/sysklogd/sysklogd_2.1.2.bb
new file mode 100644
index 0000000..2917c2a
--- /dev/null
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.1.2.bb
@@ -0,0 +1,3 @@
+require sysklogd.inc
+
+SRCREV = "6d6010add698370fc7d9828f0aaa18613dd2397f"
-- 
2.7.4

