Received: from mga18.intel.com (mga18.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.9634.1605627379456851254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 07:36:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: YNl7k3Tx+JIUdxw5l97bnjzhgtKkgtS81wQEl1X/L8AR3kT/7pRoJ+jEbGNpaJdfYdTM6qPfuB
 0SzC84sZv6xg==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="158720018"
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="158720018"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:32 -0800
IronPort-SDR: Bmp08w2HWc+9ODBISjs9VXUDZJI7BTmuXL9C09+FuMPbzn/bVQuLAsxQIB++jK+yyCaodjxrPI
 62acefgA0D6w==
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="400802979"
Received: from sbinisma-mobl2.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.40.254])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:31 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 13/19] lrzsz: Use Cross AR during compile
Date: Tue, 17 Nov 2020 23:36:02 +0800
Message-Id: <694202b05134bdef603b69667cd70a28bb311ccf.1605626675.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1605626675.git.anuj.mittal@intel.com>
References: <cover.1605626675.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Current code hardcodes archiver to be 'ar' from build host

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 74ed1d10434213ad3fcf54ded49879090f979e1e)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...mpilation-using-autoconf-detected-AR.patch | 36 +++++++++++++++++++
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb       |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0001-Fix-cross-compilation-using-autoconf-detected-AR.patch

diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0001-Fix-cross-compilation-using-autoconf-detected-AR.patch b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0001-Fix-cross-compilation-using-autoconf-detected-AR.patch
new file mode 100644
index 0000000000..47c7ec4170
--- /dev/null
+++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0001-Fix-cross-compilation-using-autoconf-detected-AR.patch
@@ -0,0 +1,36 @@
+From ecdcf0df6c28c65ca6d1e5638726e13e373c76c5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 11 Nov 2020 22:58:55 -0800
+Subject: [PATCH] Fix cross compilation using autoconf detected AR
+
+currently its using 'ar' program from build host, which is not expected,
+we need to respect AR passed in environment
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.in | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/configure.in b/configure.in
+index 4ddbe8b..b7c3c31 100644
+--- a/configure.in
++++ b/configure.in
+@@ -84,6 +84,13 @@ AC_ARG_ENABLE(syslog,
+ 	  ])
+ 
+ dnl Checks for programs.
++m4_ifndef([AC_PROG_AR],[dnl
++  AN_MAKEVAR([AR], [AC_PROG_AR])
++  AN_PROGRAM([ar], [AC_PROG_AR])
++  AC_DEFUN([AC_PROG_AR],
++  [AC_CHECK_TOOL(AR, ar, :)])
++])
++AC_PROG_AR
+ AC_PROG_CC
+ AC_PROG_GCC_TRADITIONAL
+ dnl AC_PROG_INSTALL  included in AM_INIT_AUTOMAKE
+-- 
+2.29.2
+
diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
index 4129237c59..54c431eeb3 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
+++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://www.ohse.de/uwe/releases/lrzsz-${PV}.tar.gz \
            file://lrzsz-check-locale.h.patch \
            file://cve-2018-10195.patch \
            file://include.patch \
+           file://0001-Fix-cross-compilation-using-autoconf-detected-AR.patch \
            "
 
 SRC_URI[md5sum] = "b5ce6a74abc9b9eb2af94dffdfd372a4"
-- 
2.28.0

