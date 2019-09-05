Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6178D7F270
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 11:19:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x85BJRlA025525
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Sep 2019 04:19:27 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Thu, 5 Sep 2019 04:19:21 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Sep 2019 19:19:20 +0800
Message-ID: <1567682360-87742-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] bootchart2: switch to add patch from change source in do_install
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
X-List-Received-Date: Thu, 05 Sep 2019 11:19:26 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

it is not proper change source in do_install, it will make
source not updated even local.conf have change the DISTRO_FEATURES

[YOCTO: #13493]

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0001-bootchart2-support-usrmerge.patch         | 37 ++++++++++++++++++++++
 .../bootchart2/bootchart2_0.14.8.bb                |  7 ++--
 2 files changed, 40 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/bootchart2/bootchart2/0001-bootchart2-support-usrmerge.patch

diff --git a/meta/recipes-devtools/bootchart2/bootchart2/0001-bootchart2-support-usrmerge.patch b/meta/recipes-devtools/bootchart2/bootchart2/0001-bootchart2-support-usrmerge.patch
new file mode 100644
index 0000000..8ee6723
--- /dev/null
+++ b/meta/recipes-devtools/bootchart2/bootchart2/0001-bootchart2-support-usrmerge.patch
@@ -0,0 +1,37 @@
+From b6d1a1ff2de363b1b76c8c70f77ae56a4e4d4b56 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 5 Sep 2019 18:37:31 +0800
+Subject: [PATCH] bootchart2: support usrmerge
+
+Upstream-Status: Inappropriate[oe-specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 1cc2974..f988904 100644
+--- a/Makefile
++++ b/Makefile
+@@ -36,7 +36,7 @@ endif
+ PY_SITEDIR ?= $(PY_LIBDIR)/site-packages
+ LIBC_A_PATH = /usr$(LIBDIR)
+ # Always lib, even on systems that otherwise use lib64
+-SYSTEMD_UNIT_DIR = $(EARLY_PREFIX)/lib/systemd/system
++SYSTEMD_UNIT_DIR ?= $(EARLY_PREFIX)/lib/systemd/system
+ COLLECTOR = \
+ 	collector/collector.o \
+ 	collector/output.o \
+@@ -99,7 +99,7 @@ install-chroot:
+ 	install -d $(DESTDIR)$(PKGLIBDIR)/tmpfs
+ 
+ install-collector: all install-chroot
+-	install -m 755 -D bootchartd $(DESTDIR)$(EARLY_PREFIX)/sbin/$(PROGRAM_PREFIX)bootchartd$(PROGRAM_SUFFIX)
++	install -m 755 -D bootchartd $(DESTDIR)${BASE_SBINDIR}/$(PROGRAM_PREFIX)bootchartd$(PROGRAM_SUFFIX)
+ 	install -m 644 -D bootchartd.conf $(DESTDIR)/etc/$(PROGRAM_PREFIX)bootchartd$(PROGRAM_SUFFIX).conf
+ 	install -m 755 -D bootchart-collector $(DESTDIR)$(PKGLIBDIR)/$(PROGRAM_PREFIX)bootchart$(PROGRAM_SUFFIX)-collector
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
index 465cdd9..60682eb 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
@@ -93,6 +93,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 SRC_URI = "git://github.com/xrmx/bootchart.git \
            file://bootchartd_stop.sh \
            file://0001-collector-Allocate-space-on-heap-for-chunks.patch \
+           ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://0001-bootchart2-support-usrmerge.patch','',d)} \
           "
 
 S = "${WORKDIR}/git"
@@ -114,6 +115,8 @@ UPDATERCPN = "bootchartd-stop-initscript"
 INITSCRIPT_NAME = "bootchartd_stop.sh"
 INITSCRIPT_PARAMS = "start 99 2 3 4 5 ."
 
+EXTRA_OEMAKE = 'BASE_SBINDIR="${base_sbindir}"'
+
 do_compile_prepend () {
     export PY_LIBDIR="${libdir}/${PYTHON_DIR}"
     export BINDIR="${bindir}"
@@ -121,10 +124,6 @@ do_compile_prepend () {
 }
 
 do_install () {
-    if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','true','false',d)}; then
-        sed -i -e "s;install -m 755 -D bootchartd \$(DESTDIR)\$(EARLY_PREFIX)/sbin/;install -m 755 -D bootchartd \$(DESTDIR)/usr/sbin/;g" ${B}/Makefile
-    fi
-    sed -i -e "s;SYSTEMD_UNIT_DIR =; SYSTEMD_UNIT_DIR ?=;g" ${B}/Makefile
     install -d ${D}${sysconfdir} # needed for -native
     export PY_LIBDIR="${libdir}/${PYTHON_DIR}"
     export BINDIR="${bindir}"
-- 
2.7.4


