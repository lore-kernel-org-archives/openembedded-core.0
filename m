Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8FB7F72F77
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 12:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490270426; x=1521806426;
	h=from:to:cc:subject:date:message-id;
	bh=SrARaDizj/HaZCjydLboWOu7vC9wf9ZSV6UZzNLyl9E=;
	b=SubCr5+wpM4gHZC8tW4JQWG4Q20xvWlM8Ws/KcrwsLCd26nbUdgsWZlF
	H6FgXOwLfNmU1u3zGv0wsZZxLov8Ew==;
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Mar 2017 05:00:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,209,1486454400"; d="scan'208";a="947392740"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 23 Mar 2017 05:00:24 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Mar 2017 13:59:37 +0200
Message-Id: <20170323115937.19781-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] expect: resolve string formatting issues
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
X-List-Received-Date: Thu, 23 Mar 2017 12:00:24 -0000

[YOCTO #9542]

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/security_flags.inc        |  1 -
 .../0001-Resolve-string-formatting-issues.patch    | 29 ++++++++++++++++++++++
 meta/recipes-devtools/expect/expect_5.45.bb        |  1 +
 3 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/expect/expect/0001-Resolve-string-formatting-issues.patch

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 5a1ea0de8e9..89fd45b859c 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -91,7 +91,6 @@ SECURITY_CFLAGS_pn-zlib = "${SECURITY_NO_PIE_CFLAGS}"
 
 # Recipes which fail to compile when elevating -Wformat-security to an error
 SECURITY_STRINGFORMAT_pn-busybox = ""
-SECURITY_STRINGFORMAT_pn-expect = ""
 SECURITY_STRINGFORMAT_pn-gcc = ""
 SECURITY_STRINGFORMAT_pn-oh-puzzles = ""
 
diff --git a/meta/recipes-devtools/expect/expect/0001-Resolve-string-formatting-issues.patch b/meta/recipes-devtools/expect/expect/0001-Resolve-string-formatting-issues.patch
new file mode 100644
index 00000000000..af1d8c626c2
--- /dev/null
+++ b/meta/recipes-devtools/expect/expect/0001-Resolve-string-formatting-issues.patch
@@ -0,0 +1,29 @@
+From 107cc370705d8520ba42f1416d89ed3544277c83 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 23 Mar 2017 13:44:41 +0200
+Subject: [PATCH] Resolve string formatting issues.
+
+Upstream-Status: Inappropriate [upstream seems dead]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ exp_clib.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/exp_clib.c b/exp_clib.c
+index 172c05e..809200e 100644
+--- a/exp_clib.c
++++ b/exp_clib.c
+@@ -1476,8 +1476,8 @@ expDiagLogU(str)
+      char *str;
+ {
+   if (exp_is_debugging) {
+-    fprintf(stderr,str);
+-    if (exp_logfile) fprintf(exp_logfile,str);
++    fprintf(stderr, "%s", str);
++    if (exp_logfile) fprintf(exp_logfile, "%s", str);
+   }
+ }
+ 
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/expect/expect_5.45.bb b/meta/recipes-devtools/expect/expect_5.45.bb
index ab22a61394e..630f2e46492 100644
--- a/meta/recipes-devtools/expect/expect_5.45.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.bb
@@ -25,6 +25,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/${BPN}${PV}.tar.gz \
            file://0002-tcl.m4.patch \
            file://01-example-shebang.patch \
            file://0001-expect-install-scripts-without-using-the-fixline1-tc.patch \
+           file://0001-Resolve-string-formatting-issues.patch \
           "
 SRC_URI[md5sum] = "44e1a4f4c877e9ddc5a542dfa7ecc92b"
 SRC_URI[sha256sum] = "b28dca90428a3b30e650525cdc16255d76bb6ccd65d448be53e620d95d5cc040"
-- 
2.11.0


