Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA0BC369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 10:21:47 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.5427.1744885299163738662
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 03:21:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NptpXXm1;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744885299; x=1776421299;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E4CLpuQBBoF3R82k/qOMgTQfef4Xa6hLj5UCrCtBPU4=;
  b=NptpXXm1naVc20C37yg+N3zI1DJPrXGbmOvovUHJrBFMoWcTgchGfODV
   J/7P75wo2ui++6XavJk2sDunYaIdgUQ7OJx3pNaByw5xEbIzKqPaljEMb
   rGQTb4zBQ9U1aatJOrBWzfHNVVQrT4Es6n9B8iuSe98vlyLQcr2cHJWTk
   cNjBXHQ4fVnePaliWYddLmiCP2geu8iO97FKGj3kQdXny9Ovj96Mee0Kc
   9KuT/RPVmJpovctBmNPv1aSsTcCUP+G7sZvRVMEz3FC5o2gHB6/bMgt/1
   JuusLOq9gcO6dN69bTM0UPv1ugqJwuBizj/SHxpEYnP24c18MkfWvx6Gu
   A==;
X-CSE-ConnectionGUID: T1odI1xBTCGlH44bzZDf8g==
X-CSE-MsgGUID: j/MwBWgoQumhmi0qUDDHYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="175653679"
X-IronPort-AV: E=Sophos;i="6.15,218,1739804400"; 
   d="scan'208";a="175653679"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 19:21:36 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 87A8BE9EA0
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 19:21:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4289BD8BD8
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 19:21:34 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 92A1D1A0078;
	Thu, 17 Apr 2025 18:21:33 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH] gzip: upgrade 1.13 -> 1.14
Date: Thu, 17 Apr 2025 18:21:30 +0800
Message-Id: <20250417102130.800-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 10:21:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215054

fix issue:
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

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 ...rence-fix-invalid-option-of-od-issue.patch | 36 +++++++++++++++++++
 .../wrong-path-fix.patch                      | 13 ++++---
 .../gzip/{gzip_1.13.bb => gzip_1.14.bb}       |  7 ++--
 3 files changed, 47 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-extended/gzip/gzip-1.14/0001-tests-reference-fix-invalid-option-of-od-issue.patch
 rename meta/recipes-extended/gzip/{gzip-1.13 => gzip-1.14}/wrong-path-fix.patch (76%)
 rename meta/recipes-extended/gzip/{gzip_1.13.bb => gzip_1.14.bb} (80%)

diff --git a/meta/recipes-extended/gzip/gzip-1.14/0001-tests-reference-fix-invalid-option-of-od-issue.patch b/meta/recipes-extended/gzip/gzip-1.14/0001-tests-reference-fix-invalid-option-of-od-issue.patch
new file mode 100644
index 0000000000..cc7ddbef5a
--- /dev/null
+++ b/meta/recipes-extended/gzip/gzip-1.14/0001-tests-reference-fix-invalid-option-of-od-issue.patch
@@ -0,0 +1,36 @@
+From fe8f7d75ca16e8c1c53b210dcdf130b91b57c252 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@fujitsu.com>
+Date: Thu, 17 Apr 2025 01:15:06 +0000
+Subject: [PATCH] tests/reference: fix invalid option of od issue
+
+ptest issue:
+| od: invalid option -- 'A'
+| BusyBox v1.37.0 () multi-call binary.
+
+replace "od" with "perl" according to the comments before error point
+|# Ensure that compressing these simple strings always produces the same bytes.
+|# If using "od" is not portable enough, consider using this:
+|# perl -ne 'printf "%02x ", ord($_) for split //'
+|for i in '' a b c yyy zzzzzzzzzzz; do
+|  echo $i: $(printf %s "$i" | gzip | od -An -tx1 | tr -d '\n')
+|done
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
+---
+ tests/reference | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/reference b/tests/reference
+index add962e..bfd6ad3 100755
+--- a/tests/reference
++++ b/tests/reference
+@@ -43,7 +43,7 @@ EOF
+ # If using "od" is not portable enough, consider using this:
+ # perl -ne 'printf "%02x ", ord($_) for split //'
+ for i in '' a b c yyy zzzzzzzzzzz; do
+-  echo $i: $(printf %s "$i" | gzip | od -An -tx1 | tr -d '\n')
++  echo $i: $(printf %s "$i" | gzip | perl -ne 'printf "%02x ", ord($_) for split //')
+ done > out || framework_failure_
+ 
+ compare exp out || fail=1
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
similarity index 80%
rename from meta/recipes-extended/gzip/gzip_1.13.bb
rename to meta/recipes-extended/gzip/gzip_1.14.bb
index fd846b30a5..f12dcb1e77 100644
--- a/meta/recipes-extended/gzip/gzip_1.13.bb
+++ b/meta/recipes-extended/gzip/gzip_1.14.bb
@@ -6,11 +6,13 @@ LICENSE = "GPL-3.0-or-later"
 
 SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz \
            file://run-ptest \
+           file://0001-tests-reference-fix-invalid-option-of-od-issue.patch \
            "
 SRC_URI:append:class-target = " file://wrong-path-fix.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
-                    file://gzip.h;beginline=8;endline=20;md5=6e47caaa630e0c8bf9f1bc8d94a8ed0e"
+                    file://gzip.h;beginline=8;endline=20;md5=a22158dc3dd3f5cf6e5a556940a49212 \
+                    "
 
 PROVIDES:append:class-native = " gzip-replacement-native"
 
@@ -33,9 +35,10 @@ do_install_ptest() {
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


