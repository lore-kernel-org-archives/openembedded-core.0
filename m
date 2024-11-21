Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA8ED75BCD
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 07:54:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5977.1732175674814872792
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 23:54:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=105597799c=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL6i5um014152
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 07:54:33 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xjc8d8m8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 07:54:33 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 20 Nov 2024 23:54:31 -0800
Received: from pek-lpg-core2.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 20 Nov 2024 23:54:31 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] automake: fix do_compile error when perl is under a very long path
Date: Thu, 21 Nov 2024 15:54:30 +0800
Message-ID: <20241121075430.1610968-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: hU61BVxlWweqNRat4kC1-c6DG6MMBWbs
X-Authority-Analysis: v=2.4 cv=R6hRGsRX c=1 sm=1 tr=0 ts=673ee739 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=WoIP9KW4204Gvwg0:21 a=VlfZXiiP6vEA:10 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=DhRdxkSas0Vczs2tuOwA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: hU61BVxlWweqNRat4kC1-c6DG6MMBWbs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-21_06,2024-11-20_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1031 phishscore=0
 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411210060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 07:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207517

From: Changqing Li <changqing.li@windriver.com>

Fixed:
bitbake automake-native failed with error:
| :; HELP2MAN_NAME="Generate Makefile.in files for configure from Makefile.am"; export HELP2MAN_NAME; LONGPATH/tmp/hosttools/mkdir -p doc && AUTOMAKE_HELP2MAN=true ./pre-inst-env LONGPATH/tmp/hosttools/perl ../automake-1.17/doc/help2man --output=doc/automake-1.17.1 --info-page=automake --name="${HELP2MAN_NAME}" bin/automake-1.17
| help2man: can't get `--help' info from bin/aclocal-1.17
| Try `--no-discard-stderr' if option outputs to stderr
| make: *** [Makefile:3818: doc/aclocal-1.17.1] Error 2

In above command,  `bin/aclocal-1.17 --help` will be runned, since
@PERL@ is replaced as the full path of perl, it is possible that the
shebang line exceeds the max limit and causes above error, because the
kernel imposes a maximum length on the text that follows the "#!"
characters at the start of a script; characters beyond the limit are
ignored.  Before Linux 5.1, the limit is 127 characters.  Since Linux
5.1, the limit is 255 characters.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/automake/automake.inc   |  2 ++
 ...report-error-when-the-path-of-Perl-c.patch | 35 +++++++++++++++++++
 .../automake/automake_1.17.bb                 |  2 +-
 3 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/automake/automake/0001-configure-don-t-report-error-when-the-path-of-Perl-c.patch

diff --git a/meta/recipes-devtools/automake/automake.inc b/meta/recipes-devtools/automake/automake.inc
index 9946c73c71..d6660f4a64 100644
--- a/meta/recipes-devtools/automake/automake.inc
+++ b/meta/recipes-devtools/automake/automake.inc
@@ -9,6 +9,8 @@ SRC_URI = "${GNU_MIRROR}/automake/automake-${PV}.tar.gz"
 
 inherit autotools texinfo
 
+EXTRA_OECONF = "PERL='/usr/bin/env perl'"
+
 do_configure() {
 	# We can end up patching macros, which would then mean autoreconf
 	# Cheat by saying everything is up to date.
diff --git a/meta/recipes-devtools/automake/automake/0001-configure-don-t-report-error-when-the-path-of-Perl-c.patch b/meta/recipes-devtools/automake/automake/0001-configure-don-t-report-error-when-the-path-of-Perl-c.patch
new file mode 100644
index 0000000000..c54c6fec08
--- /dev/null
+++ b/meta/recipes-devtools/automake/automake/0001-configure-don-t-report-error-when-the-path-of-Perl-c.patch
@@ -0,0 +1,35 @@
+From 4339a2298a2d486fb4636b72393499b59805edde Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 21 Nov 2024 14:54:37 +0800
+Subject: [PATCH] configure: don't report error when the path of Perl contains
+ spaces or tabs
+
+In order to make setting PERL to "/usr/bin/env perl" works well, patch
+configure as upstream suggested, refer [1]. Upstream probably will make this a
+non-fatal error later.
+
+[1] https://debbugs.gnu.org/cgi/bugreport.cgi?bug=74453
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index 45bf85a..68d3c7d 100755
+--- a/configure
++++ b/configure
+@@ -3514,7 +3514,7 @@ case $PERL in
+    as_fn_error $? "perl not found" "$LINENO" 5
+    ;;
+  *' '* | *'	'*)
+-  as_fn_error $? "The path to your Perl contains spaces or tabs.
++  : as_fn_error $? "The path to your Perl contains spaces or tabs.
+ This would cause build failures later or unusable programs.
+ Please use a path without spaces and try again." "$LINENO" 5
+   ;;
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/automake/automake_1.17.bb b/meta/recipes-devtools/automake/automake_1.17.bb
index e22e51498b..3470587603 100644
--- a/meta/recipes-devtools/automake/automake_1.17.bb
+++ b/meta/recipes-devtools/automake/automake_1.17.bb
@@ -24,13 +24,13 @@ SRC_URI += "\
            file://0003-build-fix-race-in-parallel-builds.patch \
            file://0004-Add-a-new-distro-feature-ptest.patch \
            file://0006-automake-Remove-delays-in-configure-scripts-using-au.patch \
+           file://0001-configure-don-t-report-error-when-the-path-of-Perl-c.patch \
            "
 
 SRC_URI[sha256sum] = "397767d4db3018dd4440825b60c64258b636eaf6bf99ac8b0897f06c89310acd"
 
 do_install:append () {
     install -d ${D}${datadir}
-    sed -i -e 's@^#!.*perl$@#!/usr/bin/env perl@' ${D}/${bindir}/*
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


