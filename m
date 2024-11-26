Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 946C7D3B7CA
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 08:37:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.41135.1732610246783296872
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 00:37:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=106096f7e7=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ7deks004952
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 08:37:26 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 433618b02c-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 08:37:25 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 26 Nov 2024 00:37:24 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 26 Nov 2024 00:37:24 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 1/1] libgcrypt: Fix building error with '-O2' in sysroot path
Date: Tue, 26 Nov 2024 00:37:23 -0800
Message-ID: <ee0a993b1b1d8531f174f347f10df4c56edf6973.1732610136.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <cover.1732610136.git.liezhi.yang@windriver.com>
References: <cover.1732610136.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: urE8Tyb20YrPmGKC1fi7P9t0chqSX3H_
X-Proofpoint-GUID: urE8Tyb20YrPmGKC1fi7P9t0chqSX3H_
X-Authority-Analysis: v=2.4 cv=O65rvw9W c=1 sm=1 tr=0 ts=674588c5 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VlfZXiiP6vEA:10 a=GwUem0DFAAAA:8 a=t7CeM3EgAAAA:8 a=57SyGIRnAAAA:8 a=D8WYKHJ3sVY1n_0hxiYA:9 a=4f0m0rT7cLEA:10
 a=r0dl5i_q2XGqDZkti5dn:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-26_07,2024-11-25_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411260066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 08:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207843

From: Robert Yang <liezhi.yang@windriver.com>

* Backport a patch to fix:
$ . oe-init-build-env build-O2
$ bitbake libgcrypt
random/rndjent.c:40:10: fatal error: stdio.h: No such file or directory

* Remove 0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch which
  is fixed by the backported patch.

Note, master branch's libgcrypt_1.11.0.bb has already fixed this problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...ilding-error-with-O2-in-sysroot-path.patch | 64 +++++++++++++++++++
 ...ilding-error-with-O2-in-sysroot-path.patch | 39 -----------
 .../libgcrypt/libgcrypt_1.10.3.bb             |  2 +-
 3 files changed, 65 insertions(+), 40 deletions(-)
 create mode 100644 meta/recipes-support/libgcrypt/files/0001-Fix-building-error-with-O2-in-sysroot-path.patch
 delete mode 100644 meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch

diff --git a/meta/recipes-support/libgcrypt/files/0001-Fix-building-error-with-O2-in-sysroot-path.patch b/meta/recipes-support/libgcrypt/files/0001-Fix-building-error-with-O2-in-sysroot-path.patch
new file mode 100644
index 0000000000..dee4969f35
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/0001-Fix-building-error-with-O2-in-sysroot-path.patch
@@ -0,0 +1,64 @@
+From b99952adc6ee611641709610d2e4dc90ba9acf37 Mon Sep 17 00:00:00 2001
+From: "simit.ghane" <simit.ghane@lge.com>
+Date: Tue, 7 May 2024 14:09:03 +0530
+Subject: [PATCH] Fix building error with '-O2' in sysroot path
+
+* cipher/Makefile.am (o_flag_munging): Tweak the sed script.
+* random/Makefile.am (o_flag_munging): Ditto.
+--
+
+Characters like '-O2' or '-Ofast' will be replaced by '-O1' and '-O0'
+respectively when compiling cipher and random in the filesystem
+paths as well if they happen to contain '-O2' or '-Ofast
+
+If we are cross compiling libgcrypt and sysroot contains such
+characters, we would
+get compile errors because the sysroot path has been modified.
+
+Fix this by adding blank spaces and tabs before the original matching
+pattern in the sed command.
+
+Signed-off-by: simit.ghane <simit.ghane@lge.com>
+
+ChangeLog entries added by wk
+
+Note that there is also the configure option --disable-O-flag-munging;
+see the README.
+
+Upstream-Status: Backport [https://dev.gnupg.org/rCb99952adc6ee611641709610d2e4dc90ba9acf37 https://dev.gnupg.org/rC5afadba008918d651afefb842ae123cc18454c74]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ cipher/Makefile.am | 2 +-
+ random/Makefile.am | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/cipher/Makefile.am b/cipher/Makefile.am
+index 2c39586e..a914ed2b 100644
+--- a/cipher/Makefile.am
++++ b/cipher/Makefile.am
+@@ -168,7 +168,7 @@ gost-s-box$(EXEEXT_FOR_BUILD): gost-s-box.c
+ 
+ 
+ if ENABLE_O_FLAG_MUNGING
+-o_flag_munging = sed -e 's/-O\([2-9sgz][2-9sgz]*\)/-O1/' -e 's/-Ofast/-O1/g'
++o_flag_munging = sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O1 /g' -e 's/[[:blank:]]-Ofast/ -O1 /g'
+ else
+ o_flag_munging = cat
+ endif
+diff --git a/random/Makefile.am b/random/Makefile.am
+index 0c935a05..340df38a 100644
+--- a/random/Makefile.am
++++ b/random/Makefile.am
+@@ -56,7 +56,7 @@ jitterentropy-base.c jitterentropy.h jitterentropy-base-user.h
+ 
+ # The rndjent module needs to be compiled without optimization.  */
+ if ENABLE_O_FLAG_MUNGING
+-o_flag_munging = sed -e 's/-O\([1-9sgz][1-9sgz]*\)/-O0/g' -e 's/-Ofast/-O0/g'
++o_flag_munging = sed -e 's/[[:blank:]]-O\([1-9sgz][1-9sgz]*\)/ -O0 /g' -e 's/[[:blank:]]-Ofast/ -O0 /g'
+ else
+ o_flag_munging = cat
+ endif
+-- 
+2.44.1
+
diff --git a/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch b/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
deleted file mode 100644
index cf9ebfb3e6..0000000000
--- a/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 0f66e796a8522e1043dda03b88d5f6feae839d16 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Wed, 16 Aug 2017 10:44:41 +0800
-Subject: [PATCH] libgcrypt: fix building error with '-O2' in sysroot path
-
-Upstream-Status: Pending
-
-Characters like '-O2' or '-Ofast' will be replaced by '-O1' when
-compiling cipher.
-If we are cross compiling libgcrypt and sysroot contains such
-characters, we would
-get compile errors because the sysroot path has been modified.
-
-Fix this by adding blank spaces before and after the original matching
-pattern in the
-sed command.
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-
-Rebase to 1.8.0
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- cipher/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cipher/Makefile.am b/cipher/Makefile.am
-index c3d642b..88c883a 100644
---- a/cipher/Makefile.am
-+++ b/cipher/Makefile.am
-@@ -153,7 +153,7 @@ gost-s-box: gost-s-box.c
- 
- 
- if ENABLE_O_FLAG_MUNGING
--o_flag_munging = sed -e 's/-O\([2-9sgz][2-9sgz]*\)/-O1/' -e 's/-Ofast/-O1/g'
-+o_flag_munging = sed -e 's/ -O\([2-9sgz][2-9sgz]*\) / -O1 /' -e 's/ -Ofast / -O1 /g'
- else
- o_flag_munging = cat
- endif
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
index 5a76201ab5..3d49d586bb 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
@@ -21,11 +21,11 @@ DEPENDS = "libgpg-error"
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://0001-libgcrypt-fix-m4-file-for-oe-core.patch \
-           file://0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch \
            file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch \
            file://no-native-gpg-error.patch \
            file://no-bench-slope.patch \
            file://run-ptest \
+           file://0001-Fix-building-error-with-O2-in-sysroot-path.patch \
            "
 SRC_URI[sha256sum] = "8b0870897ac5ac67ded568dcfadf45969cfa8a6beb0fd60af2a9eadc2a3272aa"
 
-- 
2.44.1


