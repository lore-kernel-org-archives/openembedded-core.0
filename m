Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9E38065C85
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 19:02:31 +0000 (UTC)
Received: by wesw55 with SMTP id w55so299660wes.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 11:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=b1RenVXeLW/etJBou7Nx2jgl7XUfbUHtDNwrvVwrYco=;
	b=HrJzcRzt7ynwXZRxEBP0luH7NYlU7C3d++7cMDVaKBj5ZmxYpcAWTYSM1ahQIk3w4o
	C+4Ap4VRJaJWtaGCHSntNHyQZzdkcgt3+Jh24VOUbpu/tcpf+U3oYC0SV4htoqjmgpct
	7jBdT3dye/mqQ8XH3wMIKBJKFpFQ2hs2bdpRznEyMivm6IBmUgb9o4h88NOBYt6LFRAg
	A69VrbFlrGUJp52jV0ogQeOrqsRrId/pC8N1UdERKNsxw8HLvcoI7pBCpQSvvO5yEA4P
	br4XzOPT4yCab5/YjeFU0xWk17h5KB3hxtZwfO1KHfSDux1JSg9zFVE2Sg0bgEtGgasP
	IXxg==
X-Received: by 10.180.21.162 with SMTP id w2mr50736794wie.42.1424199752033;
	Tue, 17 Feb 2015 11:02:32 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o7sm21465262wix.12.2015.02.17.11.02.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Feb 2015 11:02:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Feb 2015 20:02:27 +0100
Message-Id: <1424199748-10800-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.0
In-Reply-To: <CA+chaQdaa+S3AC8YYzmHdv7beMxBzP_03C25Jn=5NiE=DxmGjg@mail.gmail.com>
References: <CA+chaQdaa+S3AC8YYzmHdv7beMxBzP_03C25Jn=5NiE=DxmGjg@mail.gmail.com>
Subject: [PATCH 1/2] valgrind: add glibc-2.21 to glibc.patch
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
X-List-Received-Date: Tue, 17 Feb 2015 19:02:38 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../valgrind/valgrind/glibc-2.20.patch             | 30 ------------------
 .../recipes-devtools/valgrind/valgrind/glibc.patch | 37 ++++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.10.1.bb  |  2 +-
 3 files changed, 38 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/glibc-2.20.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/glibc.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/glibc-2.20.patch b/meta/recipes-devtools/valgrind/valgrind/glibc-2.20.patch
deleted file mode 100644
index fab4044..0000000
--- a/meta/recipes-devtools/valgrind/valgrind/glibc-2.20.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Backport of glibc 2.19 and 2.20 support.
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/configure.ac b/configure.ac
-index 229ab98..1c18108 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -918,6 +918,20 @@ case "${GLIBC_VERSION}" in
- 	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
- 	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
- 	;;
-+     2.19)
-+	AC_MSG_RESULT(2.19 family)
-+	AC_DEFINE([GLIBC_2_19], 1, [Define to 1 if you're using glibc 2.19.x])
-+	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	;;
-+     2.20)
-+	AC_MSG_RESULT(2.20 family)
-+	AC_DEFINE([GLIBC_2_20], 1, [Define to 1 if you're using glibc 2.20.x])
-+	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	;;
-      darwin)
- 	AC_MSG_RESULT(Darwin)
- 	AC_DEFINE([DARWIN_LIBC], 1, [Define to 1 if you're using Darwin])
diff --git a/meta/recipes-devtools/valgrind/valgrind/glibc.patch b/meta/recipes-devtools/valgrind/valgrind/glibc.patch
new file mode 100644
index 0000000..8b902dd
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/glibc.patch
@@ -0,0 +1,37 @@
+Backport of glibc 2.19 and 2.20 and 2.21 support.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/configure.ac b/configure.ac
+index 229ab98..1c18108 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -918,6 +918,27 @@ case "${GLIBC_VERSION}" in
+ 	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
+ 	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
+ 	;;
++     2.19)
++	AC_MSG_RESULT(2.19 family)
++	AC_DEFINE([GLIBC_2_19], 1, [Define to 1 if you're using glibc 2.19.x])
++	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
++	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
++	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
++	;;
++     2.20)
++	AC_MSG_RESULT(2.20 family)
++	AC_DEFINE([GLIBC_2_20], 1, [Define to 1 if you're using glibc 2.20.x])
++	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
++	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
++	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
++	;;
++     2.21)
++	AC_MSG_RESULT(2.21 family)
++	AC_DEFINE([GLIBC_2_21], 1, [Define to 1 if you're using glibc 2.21.x])
++	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
++	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
++	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
++	;;
+      darwin)
+ 	AC_MSG_RESULT(Darwin)
+ 	AC_DEFINE([DARWIN_LIBC], 1, [Define to 1 if you're using Darwin])
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
index 7d02b9f..1c2ac61 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://fixed-perl-path.patch \
            file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch \
            file://sepbuildfix.patch \
-           file://glibc-2.20.patch \
+           file://glibc.patch \
            file://force-nostabs.patch \
            file://remove-arm-variant-specific.patch \
            file://remove-ppc-tests-failing-build.patch \
-- 
2.3.0


