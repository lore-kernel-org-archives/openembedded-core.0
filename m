Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 203847C127
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Dec 2019 02:10:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xBQ2Audc028576
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Dec 2019 18:10:56 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Wed, 25 Dec 2019 18:10:55 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Dec 2019 10:10:54 +0800
Message-ID: <1577326254-239399-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] syslogkd: fix parallel compile failed problem
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Dec 2019 02:10:55 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Parallel compile maybe failed with error:
error: ../lib/strlcat.o: No such file or directory
Makefile:619: recipe for target 'syslogd' failed

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...arallel-build-problem-reported-by-Gentoo-.patch | 47 ++++++++++++++++++++++
 meta/recipes-extended/sysklogd/sysklogd.inc        |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-extended/sysklogd/files/0001-Fix-nasty-parallel-build-problem-reported-by-Gentoo-.patch

diff --git a/meta/recipes-extended/sysklogd/files/0001-Fix-nasty-parallel-build-problem-reported-by-Gentoo-.patch b/meta/recipes-extended/sysklogd/files/0001-Fix-nasty-parallel-build-problem-reported-by-Gentoo-.patch
new file mode 100644
index 0000000..bf43fc6
--- /dev/null
+++ b/meta/recipes-extended/sysklogd/files/0001-Fix-nasty-parallel-build-problem-reported-by-Gentoo-.patch
@@ -0,0 +1,47 @@
+From 50c66de8a9b64d6fa71329ea7d4fe981f3b4ef23 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 26 Dec 2019 10:03:35 +0800
+Subject: [PATCH] Fix nasty parallel build problem reported by Gentoo and
+ Westermo
+
+Independently of each other both the Gentoo project and Westermo found
+an issue with massively parallel builds on monster-core-machines.  At
+Westermo there are 40 core Xeon monsters that stumble when building
+sysklogd.
+
+The Gentoo bug report is here:
+
+    https://bugs.gentoo.org/701894
+
+The problem stems from strlcat.c and strlcpy.c being used for both
+the libcompat convenience library built for libsyslog and als for
+syslogd when the system does not have either of the APIs in libc,
+i.e. most Linux systems with GLIBC or musl libc.
+
+I can either rewrite the Makefile.am files to handle dependencies
+better, or we just disable parallel build like this patch. There's
+too few source files to gain anything from parallel build anyway.
+
+Signed-off-by: Joachim Nilsson <troglobit@gmail.com>
+
+Upstream-Status: Backport [https://github.com/troglobit/sysklogd/commit/9cf1f97cef04fed81c2407f7207795d7592ccb96]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ Makefile.am | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index c4cc80f..d7a7dd5 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -46,3 +46,6 @@ release: distcheck
+ # Workaround for systemd unit file duing distcheck
+ DISTCHECK_CONFIGURE_FLAGS = --with-systemd=$$dc_install_base/$(systemd) --with-klogd
+ 
++# Disable parallel build in top Makefile, we might otherwise get a very
++# # bizarre build problem with strlcpy.o in libcompat and for syslogd.
++.NOTPARALLEL:
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index 07edf40..774d23b 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -16,6 +16,7 @@ inherit update-rc.d update-alternatives systemd autotools
 SRC_URI = "git://github.com/troglobit/sysklogd.git;nobranch=1 \
            file://0001-Remove-__BEGIN_DECLS-__END_DECLS.patch \
            file://0002-include-sys-types.h-for-off_t.patch \
+           file://0001-Fix-nasty-parallel-build-problem-reported-by-Gentoo-.patch \
            file://sysklogd \
            "
 S = "${WORKDIR}/git"
-- 
2.7.4


