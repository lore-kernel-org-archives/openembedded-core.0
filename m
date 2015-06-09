Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0360273695
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 16:13:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t59GDlOX016344
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Jun 2015 09:13:47 -0700 (PDT)
Received: from co-op.wrs.com (128.224.56.206) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 9 Jun 2015 09:13:47 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Jun 2015 12:13:51 -0400
Message-ID: <1433866431-12391-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.4.2
MIME-Version: 1.0
Subject: [PATCH] bind: ensure searching for json headers searches sysroot
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
X-List-Received-Date: Tue, 09 Jun 2015 16:13:47 -0000
Content-Type: text/plain

Bind can fail configure by detecting headers w/o libs, or
it can fail the host contamination check.  More details
are within the commit log in the contained patch.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
new file mode 100644
index 000000000000..dedc437507cd
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -0,0 +1,49 @@
+From 9473d29843579802e96b0293a3e953fed93de82c Mon Sep 17 00:00:00 2001
+From: Paul Gortmaker <paul.gortmaker@windriver.com>
+Date: Tue, 9 Jun 2015 11:22:00 -0400
+Subject: [PATCH] bind: ensure searching for json headers searches sysroot
+
+Bind can fail configure by detecting headers w/o libs[1], or
+it can fail the host contamination check as per below:
+
+ERROR: This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities.
+Rerun configure task after fixing this. The path was 'build/tmp/work/core2-64-poky-linux/bind/9.10.2-r1/build'
+ERROR: Function failed: do_qa_configure
+ERROR: Logfile of failure stored in: build/tmp/work/core2-64-poky-linux/bind/9.10.2-r1/temp/log.do_configure.5242
+ERROR: Task 5 (meta/recipes-connectivity/bind/bind_9.10.2.bb, do_configure) failed with exit code '1'
+NOTE: Tasks Summary: Attempted 773 tasks of which 768 didn't need to be rerun and 1 failed.
+No currently running tasks (773 of 781)
+
+Summary: 1 task failed:
+  /meta/recipes-connectivity/bind/bind_9.10.2.bb, do_configure
+
+One way to fix it would be to unconditionally disable json in bind
+configure[2] but here we fix it by using the path to where we would
+put the header if we had json in the sysroot, in case someone wants
+to make use of the combination some day.
+
+[1] https://trac.macports.org/ticket/45305
+[2] https://trac.macports.org/changeset/126406
+
+Upstream-status: Inappropriate [OE Specific]
+Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
+---
+ configure.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index c9ef3a601343..17a1f613e9ac 100644
+--- a/configure.in
++++ b/configure.in
+@@ -2139,7 +2139,7 @@ case "$use_libjson" in
+ 		libjson_libs=""
+ 		;;
+ 	auto|yes)
+-		for d in /usr /usr/local /opt/local
++		for d in "${STAGING_INCDIR}"
+ 		do
+ 			if test -f "${d}/include/json/json.h"
+ 			then
+-- 
+2.4.2
+
diff --git a/meta/recipes-connectivity/bind/bind_9.10.2.bb b/meta/recipes-connectivity/bind/bind_9.10.2.bb
index 1dc15a9da739..43f17984b524 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.2.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.2.bb
@@ -18,6 +18,7 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://init.d-add-support-for-read-only-rootfs.patch \
            file://bind-confgen-build-unix.o-once.patch \
            file://0001-build-use-pkg-config-to-find-libxml2.patch \
+           file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
            "
 
 SRC_URI[md5sum] = "dca7a9967947bffa98547fca6130fc04"
-- 
2.4.2


