Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 23CA773597
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Feb 2015 03:28:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1I3Sjx4018564
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 19:28:45 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 17 Feb 2015 19:28:45 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Feb 2015 19:28:43 -0800
Message-ID: <1aac34456a14b3ca57cc88b1e87f2a386ddf487e.1424230079.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1424230079.git.liezhi.yang@windriver.com>
References: <cover.1424230079.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] bind: fix paralle issue
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
X-List-Received-Date: Wed, 18 Feb 2015 03:28:44 -0000
Content-Type: text/plain

Fixed:
unix/os.o: file not recognized: File truncated
collect2: error: ld returned 1 exit status

This is because os.o was built twice:
* The implicity rule (depends on unix/os.o)
* The "make all" in unix subdir (depends on unix/os.o)

Depend on subdirs which is unix only rather than unix/os.o will fix the
problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../bind/bind/bind-confgen-build-unix.o-once.patch |   44 ++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.9.5.bb       |    1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/bind-confgen-build-unix.o-once.patch

diff --git a/meta/recipes-connectivity/bind/bind/bind-confgen-build-unix.o-once.patch b/meta/recipes-connectivity/bind/bind/bind-confgen-build-unix.o-once.patch
new file mode 100644
index 0000000..096d5d8
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/bind-confgen-build-unix.o-once.patch
@@ -0,0 +1,44 @@
+From 9b40619ff6fddfef2758ba797789f8487f412df3 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Mon, 16 Feb 2015 00:50:01 -0800
+Subject: [PATCH] confgen: don't build unix.o twice
+
+Fixed:
+unix/os.o: file not recognized: File truncated
+collect2: error: ld returned 1 exit status
+
+This is because os.o was built twice:
+* The implicity rule (depends on unix/os.o)
+* The "make all" in unix subdir (depends on unix/os.o)
+
+Depend on subdirs which is unix only rather than unix/os.o will fix the
+problem.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ bin/confgen/Makefile.in |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/bin/confgen/Makefile.in b/bin/confgen/Makefile.in
+index 8b3e5aa..4868a24 100644
+--- a/bin/confgen/Makefile.in
++++ b/bin/confgen/Makefile.in
+@@ -74,11 +74,11 @@ rndc-confgen.@O@: rndc-confgen.c
+ ddns-confgen.@O@: ddns-confgen.c
+ 	${LIBTOOL_MODE_COMPILE} ${CC} ${ALL_CFLAGS} -c ${srcdir}/ddns-confgen.c
+ 
+-rndc-confgen@EXEEXT@: rndc-confgen.@O@ util.@O@ keygen.@O@ ${UOBJS} ${CONFDEPLIBS} 
++rndc-confgen@EXEEXT@: rndc-confgen.@O@ util.@O@ keygen.@O@ ${CONFDEPLIBS} $(SUBDIRS)
+ 	export BASEOBJS="rndc-confgen.@O@ util.@O@ keygen.@O@ ${UOBJS}"; \
+ 	${FINALBUILDCMD}
+ 
+-ddns-confgen@EXEEXT@: ddns-confgen.@O@ util.@O@ keygen.@O@ ${UOBJS} ${CONFDEPLIBS} 
++ddns-confgen@EXEEXT@: ddns-confgen.@O@ util.@O@ keygen.@O@ ${CONFDEPLIBS} $(SUBDIRS)
+ 	export BASEOBJS="ddns-confgen.@O@ util.@O@ keygen.@O@ ${UOBJS}"; \
+ 	${FINALBUILDCMD}
+ 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-connectivity/bind/bind_9.9.5.bb b/meta/recipes-connectivity/bind/bind_9.9.5.bb
index 8431eb9..5d97874 100644
--- a/meta/recipes-connectivity/bind/bind_9.9.5.bb
+++ b/meta/recipes-connectivity/bind/bind_9.9.5.bb
@@ -20,6 +20,7 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://bind9_9_5-CVE-2014-8500.patch \
            file://bind-add-crosscripts-search-path-for-xml2-config.patch \
            file://bind-subdirs-run-serially.patch \
+           file://bind-confgen-build-unix.o-once.patch \
 	   "
 
 SRC_URI[md5sum] = "e676c65cad5234617ee22f48e328c24e"
-- 
1.7.9.5


