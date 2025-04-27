Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F138C369D5
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 08:00:47 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.23087.1745740796662886235
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Apr 2025 00:59:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VmSlGWnj;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745740796; x=1777276796;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GWnt1dZzWjBcWrzzk9K2xEPB+3UTqcvvWryeWVzTkes=;
  b=VmSlGWnjsO3Ia512H3Yfg4mGahCLHFV/PrFmMP4ZA9Wd/Ti35ycLwxB/
   Hb2IMi8u0rakiTigDP0BaBTvcFhivzKh/sVDbQquAEzFAbXK5mv/wEwt5
   gQqsex02OXYSg68Ad0JbChXYDc8kQZ0bzgXD7/YtcqqnjeqeadVZkQhfo
   MbKjDKrHRNTG/5PklQwqiOZ3NfeW+KzgIjQ4amAzU837txfhDZmb8Io/f
   ymO4b8WKMKMS/e5Q7zK7mQlnAi8kGtMa5Cce6VlGXQ+xCu9WYpWERFr1X
   kXztkryS4tIJkm0AU9QkF1mZkbjux3nZTumCuD0W6qMZNQy+9JGaJ9k+w
   Q==;
X-CSE-ConnectionGUID: kOWAZ84pToOZGk0+RlylOg==
X-CSE-MsgGUID: tyKVZiNzTpuPfcEidCF/ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="185791499"
X-IronPort-AV: E=Sophos;i="6.15,243,1739804400"; 
   d="scan'208";a="185791499"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 16:59:54 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 20336D4F41
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 16:59:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D3A08CFAAD
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 16:59:51 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9792E1A0071;
	Sun, 27 Apr 2025 15:59:50 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>
Cc: openembedded-core@lists.openembedded.org,
	Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH v2] gzip: upgrade 1.13 -> 1.14
Date: Sun, 27 Apr 2025 15:59:36 +0800
Message-ID: <20250427075936.1577-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 08:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215544

1. Add coreutils to RDEPENDS:gzip-ptest to fix ptest error:
| od: invalid option -- 'A'
| BusyBox v1.37.0 () multi-call binary.

2. Delete BUILD_LDFLAGS to fix issue:
|ERROR: gzip-1.14-r0 do_package_qa: QA Issue: File /usr/lib/gzip/ptest/src/tests/Makefile in package gzip-ptest contains reference to TMPDIR ildpaths]
|ERROR: gzip-1.14-r0 do_package_qa: Fatal QA errors were found, failing task.

error point in /usr/lib/gzip/ptest/src/tests/Makefile of gzip-ptest:
|BUILD_LDFLAGS = -L/gzip/1.14/recipe-sysroot-native/usr/lib                         -L/gzip/1.14/recipe-sysroot-native/lib
|      -Wl,--enable-new-dtags                         -Wl,-rpath-link,/gzip/1.14/recipe-sysroot-native/usr/lib                         -Wl,-r
|path-link,/gzip/1.14/recipe-sysroot-native/lib                         -Wl,-rpath,/gzip/1.14/recipe-sysroot-native/usr/lib
|       -Wl,-rpath,/gzip/1.14/recipe-sysroot-native/lib                         -Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=/mnt
|/test/build_auh/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2 -pthread

ptest pass after delete BUILD_LDFLAGS in Makefile

ptest result:
|============================================================================
|Testsuite summary for gzip 1.14
|============================================================================
|# TOTAL: 30
|# PASS:  28
|# SKIP:  2
|# XFAIL: 0
|# FAIL:  0
|# XPASS: 0
|# ERROR: 0

License-Update: copyright years update and simplifies compliance by replacing
physical contact instructions with a permanent web reference

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../{gzip-1.13 => gzip-1.14}/wrong-path-fix.patch   | 13 ++++++-------
 .../gzip/{gzip_1.13.bb => gzip_1.14.bb}             |  8 +++++---
 2 files changed, 11 insertions(+), 10 deletions(-)
 rename meta/recipes-extended/gzip/{gzip-1.13 => gzip-1.14}/wrong-path-fix.patch (76%)
 rename meta/recipes-extended/gzip/{gzip_1.13.bb => gzip_1.14.bb} (81%)

diff --git a/meta/recipes-extended/gzip/gzip-1.13/wrong-path-fix.patch b/meta/recipes-extended/gzip/gzip-1.14/wrong-path-fix.patch
similarity index 76%
rename from meta/recipes-extended/gzip/gzip-1.13/wrong-path-fix.patch
rename to meta/recipes-extended/gzip/gzip-1.14/wrong-path-fix.patch
index 7f9e249de8..4d5e7a8e02 100644
--- a/meta/recipes-extended/gzip/gzip-1.13/wrong-path-fix.patch
+++ b/meta/recipes-extended/gzip/gzip-1.14/wrong-path-fix.patch
@@ -1,4 +1,7 @@
-fix MakeMaker issues with using wrong SHELL/GREP
+From eda9b1d08c517acbdc5b26c24c94a3985f29c749 Mon Sep 17 00:00:00 2001
+From: Ming Liu <ming.liu@windriver.com>
+Date: Fri, 21 Nov 2014 04:50:57 -0500
+Subject: [PATCH] fix MakeMaker issues with using wrong SHELL/GREP
 
 A set of substitution is being processed to all target scripts with sed by
 replacing some key words with the detected values at configure time, this
@@ -12,16 +15,15 @@ instead.
 Signed-off-by: Ming Liu <ming.liu@windriver.com>
 
 Upstream-Status: Pending
-
 ---
  Makefile.am | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 4f51b61..80a5ddf 100644
+index 23e0d3e..3455878 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -93,8 +93,7 @@ SUFFIXES = .in
+@@ -95,8 +95,7 @@ SUFFIXES = .in
  .in:
  	$(AM_V_GEN)rm -f $@-t $@ \
  	  && sed \
@@ -31,6 +33,3 @@ index 4f51b61..80a5ddf 100644
  		-e "s|'gzip'|$(GZIP_TRANSFORMED)|g" \
  		-e "s|'zdiff'|$(ZDIFF_TRANSFORMED)|g" \
  		-e "s|'zgrep'|$(ZGREP_TRANSFORMED)|g" \
---
-2.7.4
-
diff --git a/meta/recipes-extended/gzip/gzip_1.13.bb b/meta/recipes-extended/gzip/gzip_1.14.bb
similarity index 81%
rename from meta/recipes-extended/gzip/gzip_1.13.bb
rename to meta/recipes-extended/gzip/gzip_1.14.bb
index fd846b30a5..c7837cdae0 100644
--- a/meta/recipes-extended/gzip/gzip_1.13.bb
+++ b/meta/recipes-extended/gzip/gzip_1.14.bb
@@ -10,11 +10,12 @@ SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz \
 SRC_URI:append:class-target = " file://wrong-path-fix.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
-                    file://gzip.h;beginline=8;endline=20;md5=6e47caaa630e0c8bf9f1bc8d94a8ed0e"
+                    file://gzip.h;beginline=8;endline=20;md5=a22158dc3dd3f5cf6e5a556940a49212 \
+                    "
 
 PROVIDES:append:class-native = " gzip-replacement-native"
 
-RDEPENDS:${PN}-ptest += "make perl grep diffutils"
+RDEPENDS:${PN}-ptest += "make perl grep diffutils coreutils"
 
 BBCLASSEXTEND = "native nativesdk"
 
@@ -33,9 +34,10 @@ do_install_ptest() {
             -e 's/^Makefile: ..*/Makefile: /'           \
             -e 's,--sysroot=${STAGING_DIR_TARGET},,g'   \
             -e 's|${DEBUG_PREFIX_MAP}||g' \
+            -e 's|${BUILD_LDFLAGS}||g' \
             -e 's:${HOSTTOOLS_DIR}/::g'                 \
             -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
             ${B}/tests/Makefile > ${D}${PTEST_PATH}/src/tests/Makefile
 }
 
-SRC_URI[sha256sum] = "20fc818aeebae87cdbf209d35141ad9d3cf312b35a5e6be61bfcfbf9eddd212a"
+SRC_URI[sha256sum] = "613d6ea44f1248d7370c7ccdeee0dd0017a09e6c39de894b3c6f03f981191c6b"
-- 
2.43.0


