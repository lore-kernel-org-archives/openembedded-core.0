Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9689373CF8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 08:32:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4B8W3VC001766
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 01:32:03 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 11 May 2015 01:32:02 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 May 2015 01:31:59 -0700
Message-ID: <18b295b324e4834e88f21b4de422269f01ce5f27.1431333085.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1431333085.git.liezhi.yang@windriver.com>
References: <cover.1431333085.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] socat: fix for parallel build
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
X-List-Received-Date: Mon, 11 May 2015 08:32:07 -0000
Content-Type: text/plain

Fixed:
vsnprintf_r.o: file not recognized: File truncated
collect2: error: ld returned 3 exit status
Makefile:122: recipe for target 'filan' failed

Let filan depend on vsnprintf_r.o and snprinterr.o to fix the issue.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../socat/Makefile.in-fix-for-parallel-build.patch |   35 ++++++++++++++++++++
 meta/recipes-connectivity/socat/socat_1.7.3.0.bb   |    1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-connectivity/socat/socat/Makefile.in-fix-for-parallel-build.patch

diff --git a/meta/recipes-connectivity/socat/socat/Makefile.in-fix-for-parallel-build.patch b/meta/recipes-connectivity/socat/socat/Makefile.in-fix-for-parallel-build.patch
new file mode 100644
index 0000000..aa4db65
--- /dev/null
+++ b/meta/recipes-connectivity/socat/socat/Makefile.in-fix-for-parallel-build.patch
@@ -0,0 +1,35 @@
+From c6f0080b55679b6e8b5d332d6e05fdcbda1e4064 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Mon, 4 May 2015 00:58:47 -0700
+Subject: [PATCH] Makefile.in: fix for parallel build
+
+Fixed:
+vsnprintf_r.o: file not recognized: File truncated
+collect2: error: ld returned 3 exit status
+Makefile:122: recipe for target 'filan' failed
+
+Let filan depend on vsnprintf_r.o and snprinterr.o to fix the issue.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ Makefile.in |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index f2a6edb..88b784b 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -118,7 +118,7 @@ PROCAN_OBJS=procan_main.o procan.o procan-cdefs.o hostan.o error.o sycls.o sysut
+ procan: $(PROCAN_OBJS)
+ 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(PROCAN_OBJS) $(CLIBS)
+ 
+-filan: filan_main.o filan.o fdname.o error.o sycls.o sysutils.o utils.o
++filan: filan_main.o filan.o fdname.o error.o sycls.o sysutils.o utils.o vsnprintf_r.o snprinterr.o
+ 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ filan_main.o filan.o fdname.o error.o sycls.o sysutils.o utils.o vsnprintf_r.o snprinterr.o $(CLIBS)
+ 
+ libxio.a: $(XIOOBJS) $(UTLOBJS)
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-connectivity/socat/socat_1.7.3.0.bb b/meta/recipes-connectivity/socat/socat_1.7.3.0.bb
index 8923f41..b58e0a7 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.3.0.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.3.0.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
+           file://Makefile.in-fix-for-parallel-build.patch \
 "
 
 SRC_URI[md5sum] = "b607edb65bc6c57f4a43f06247504274"
-- 
1.7.9.5


