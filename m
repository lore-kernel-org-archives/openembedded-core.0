Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 46834608F7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 15:55:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4VFtNAL020816
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 08:55:23 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Fri, 31 May 2013 08:55:23 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 31 May 2013 11:02:00 -0500
Message-ID: <1370016120-22544-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/1 V2] lrzsz: check locale.h in configure
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
X-List-Received-Date: Fri, 31 May 2013 15:55:22 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

fix the build failure:
lrz.c:284:13: error: 'LC_ALL' undeclared (first use in this function)

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../lrzsz/lrzsz-0.12.20/lrzsz-check-locale.h.patch | 32 ++++++++++++++++++++++
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb            |  3 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/lrzsz-check-locale.h.patch

diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/lrzsz-check-locale.h.patch b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/lrzsz-check-locale.h.patch
new file mode 100644
index 0000000..9e46dfa
--- /dev/null
+++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/lrzsz-check-locale.h.patch
@@ -0,0 +1,32 @@
+From 28b473c3c96682a820e292cc1be006e19aee11bc Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Fri, 24 May 2013 01:07:24 -0400
+Subject: [PATCH] lrzsz check locale.h
+
+fix the build failure when using -O0 in a debug build:
+lrz.c:284:13: error: 'LC_ALL' undeclared (first use in this function)
+
+Upstream-Status: Submitted [uwe@ohse.de]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+---
+ configure.in |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index 6e2064c..c10460c 100644
+--- a/configure.in
++++ b/configure.in
+@@ -130,7 +130,7 @@ AC_CHECK_HEADERS(fcntl.h limits.h sys/ioctl.h sys/time.h unistd.h sys/times.h)
+ LRZSZ_HEADERS_TERM_IO
+ AC_CHECK_HEADERS(termios.h sys/termios.h termio.h sys/termio.h sgtty.h)
+ AC_CHECK_HEADERS(sys/mman.h utime.h syslog.h sys/syslog.h sys/param.h)
+-AC_CHECK_HEADERS(sys/select.h strings.h arpa/inet.h)
++AC_CHECK_HEADERS(sys/select.h strings.h locale.h arpa/inet.h)
+ 
+ dnl Checks for typedefs, structures, and compiler characteristics.
+ AC_TYPE_SIZE_T
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
index 83a75e3..0147b3d 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
+++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
@@ -10,13 +10,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 			file://src/lrz.c;beginline=1;endline=10;md5=5276956373ff7d8758837f6399a1045f"
 SECTION = "console/network"
 DEPENDS = ""
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://www.ohse.de/uwe/releases/lrzsz-${PV}.tar.gz \
 	   file://autotools.patch \
 	   file://makefile.patch \
 	   file://gettext.patch \
 	   file://lrzsz_fix_for_automake-1.12.patch \
+           file://lrzsz-check-locale.h.patch \
            "
 
 SRC_URI[md5sum] = "b5ce6a74abc9b9eb2af94dffdfd372a4"
-- 
1.8.3.rc1.25.g423ecb0


