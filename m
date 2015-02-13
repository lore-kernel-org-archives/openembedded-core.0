Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EBAB573430
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 08:15:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1D8Fb4h022771
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 00:15:37 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 13 Feb 2015 00:15:37 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Feb 2015 00:15:25 -0800
Message-ID: <7a6060d1bc3e5393d9a05fd5d7f135d020243e6a.1423808841.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1423808841.git.liezhi.yang@windriver.com>
References: <cover.1423808841.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 01/12] bind: fix and enable parallel build
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
X-List-Received-Date: Fri, 13 Feb 2015 08:15:37 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../bind/bind/bind-subdirs-run-serially.patch      |   35 ++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.9.5.bb       |    2 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/bind/bind/bind-subdirs-run-serially.patch

diff --git a/meta/recipes-connectivity/bind/bind/bind-subdirs-run-serially.patch b/meta/recipes-connectivity/bind/bind/bind-subdirs-run-serially.patch
new file mode 100644
index 0000000..9db7a17
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/bind-subdirs-run-serially.patch
@@ -0,0 +1,35 @@
+From b24468b6fe1f136bfd854773bc0e117aca0012d5 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 28 Jan 2015 01:23:09 -0800
+Subject: [PATCH] lib/export/isc/Makefile.in: let SUBDIRS run serially
+
+Fix parallel issue::
+make[2]: *** No rule to make target `nls/msgcat.o', needed by `libisc.a'.  Stop.
+make[2]: *** Waiting for unfinished jobs....
+make[3]: Leaving directory `bind-9.9.5/lib/export/isc/unix'
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ lib/export/isc/Makefile.in |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/export/isc/Makefile.in b/lib/export/isc/Makefile.in
+index a92f66f..27dabcb 100644
+--- a/lib/export/isc/Makefile.in
++++ b/lib/export/isc/Makefile.in
+@@ -103,6 +103,10 @@ SRCS =		@ISC_EXTRA_SRCS@ \
+ 
+ LIBS =		@LIBS@
+ 
++# Note: the order of SUBDIRS is important.
++# Attempt to disable parallel processing.
++.NOTPARALLEL:
++.NO_PARALLEL:
+ SUBDIRS =	include unix nls @ISC_THREAD_DIR@
+ TARGETS =	timestamp
+ 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-connectivity/bind/bind_9.9.5.bb b/meta/recipes-connectivity/bind/bind_9.9.5.bb
index eacb23f..8431eb9 100644
--- a/meta/recipes-connectivity/bind/bind_9.9.5.bb
+++ b/meta/recipes-connectivity/bind/bind_9.9.5.bb
@@ -19,6 +19,7 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://init.d-add-support-for-read-only-rootfs.patch \
            file://bind9_9_5-CVE-2014-8500.patch \
            file://bind-add-crosscripts-search-path-for-xml2-config.patch \
+           file://bind-subdirs-run-serially.patch \
 	   "
 
 SRC_URI[md5sum] = "e676c65cad5234617ee22f48e328c24e"
@@ -48,7 +49,6 @@ INITSCRIPT_PARAMS = "defaults"
 
 SYSTEMD_SERVICE_${PN} = "named.service"
 
-PARALLEL_MAKE = ""
 
 RDEPENDS_${PN} = "python-core"
 
-- 
1.7.9.5


