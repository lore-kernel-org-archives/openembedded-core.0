Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 801FA65E1A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 22:29:52 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id x12so4405888wgg.26
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Sep 2014 15:29:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=SCowcZSvPxmdRC7TFnYLk3agczMC/IwuIwoW2uMGPoE=;
	b=WZWI+o0aubc6Bbeestr6gAHoPPkwbyN37KLxhBqSd3biHFiurx3sX6JqrM54zIvO8A
	rHnrVtawoi0uIWKdxsH3eu/fhE8tLW2SboZhyxc0wjEmGWmn4id9otWKXeymKo7SRZvY
	vxfJSQex6AqQhidSSPk/kxhqm9s3loKa5rN/8F010hz78Pm/vrbrX6h7Eu2IDthsNuYx
	dPO//anubmDOwyS7eX1rGmYnMzFneXO8B07oaUTSQNcQOqN1nnMlWAUlw5S7b6EEAlEv
	ef5bofUj+lBTtG0x6oxu6f8Rxq+eD7/GewIeXjDgWrmH0ZnmQVmUjUVc3dUTtjRJI6jb
	IYEg==
X-Gm-Message-State: ALoCoQnoq1AvUNsDmE/kda1DvWyrCObpzf8crWAy2X41Ew9JeixTqrcyV/yBNrKvIFtqwkEFg/Wr
X-Received: by 10.194.119.193 with SMTP id kw1mr46166944wjb.82.1410301793387; 
	Tue, 09 Sep 2014 15:29:53 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	ew1sm16389781wjb.31.2014.09.09.15.29.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Sep 2014 15:29:52 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Sep 2014 23:29:45 +0100
Message-Id: <1410301785-20464-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] valgrind: backport enabling for glibc 2.20
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
X-List-Received-Date: Tue, 09 Sep 2014 22:29:59 -0000

Now that we're running glibc 2.20 not 2.19, backport the configure.ac fixes from
upstream.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../valgrind/valgrind/glibc-2.19.patch             |   23 ---------------
 .../valgrind/valgrind/glibc-2.20.patch             |   30 ++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.9.0.bb   |    2 +-
 3 files changed, 31 insertions(+), 24 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/glibc-2.19.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/glibc-2.20.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/glibc-2.19.patch b/meta/recipes-devtools/valgrind/valgrind/glibc-2.19.patch
deleted file mode 100644
index 7714b99..0000000
--- a/meta/recipes-devtools/valgrind/valgrind/glibc-2.19.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Add support for compiling with glibc 2.19
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-Index: valgrind-3.9.0/configure.ac
-===================================================================
---- valgrind-3.9.0.orig/configure.ac	2014-02-12 09:03:07.879873700 -0800
-+++ valgrind-3.9.0/configure.ac	2014-02-12 09:07:35.099871774 -0800
-@@ -918,6 +918,13 @@
- 	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
- 	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
- 	;;
-+     2.19)
-+	AC_MSG_RESULT(2.19 family)
-+	AC_DEFINE([GLIBC_2_19], 1, [Define to 1 if you're using glibc 2.19.x])
-+	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	;;
-      darwin)
- 	AC_MSG_RESULT(Darwin)
- 	AC_DEFINE([DARWIN_LIBC], 1, [Define to 1 if you're using Darwin])
diff --git a/meta/recipes-devtools/valgrind/valgrind/glibc-2.20.patch b/meta/recipes-devtools/valgrind/valgrind/glibc-2.20.patch
new file mode 100644
index 0000000..fab4044
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/glibc-2.20.patch
@@ -0,0 +1,30 @@
+Backport of glibc 2.19 and 2.20 support.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/configure.ac b/configure.ac
+index 229ab98..1c18108 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -918,6 +918,20 @@ case "${GLIBC_VERSION}" in
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
+      darwin)
+ 	AC_MSG_RESULT(Darwin)
+ 	AC_DEFINE([DARWIN_LIBC], 1, [Define to 1 if you're using Darwin])
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
index 3e8c4ce..c415e77 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://fixed-perl-path.patch \
            file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch \
            file://sepbuildfix.patch \
-           file://glibc-2.19.patch \
+           file://glibc-2.20.patch \
            file://force-nostabs.patch \
            file://remove-arm-variant-specific.patch \
            file://remove-ppc-tests-failing-build.patch \
-- 
1.7.10.4


