Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A962C25B78
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 09:11:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17996.1716887472293633956
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 May 2024 02:11:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5878445e50=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44S5hgXw015627
	for <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 09:11:11 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yb56xat8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 09:11:10 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 02:11:09 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 02:11:08 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] gettext: fix a parallel build issue
Date: Tue, 28 May 2024 17:11:07 +0800
Message-ID: <20240528091107.2942760-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: L74Nl_0klC9Plpwo8fnAlxf2eX-mvHIi
X-Proofpoint-GUID: L74Nl_0klC9Plpwo8fnAlxf2eX-mvHIi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_05,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405280068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 09:11:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199962

From: Changqing Li <changqing.li@windriver.com>

Occasionally, gettext will build failed with error:
In file included from ../../../gettext-0.22.5/gettext-runtime/intl/gettextP.h:71,
                 from ../../../gettext-0.22.5/gettext-runtime/intl/log.c:24:
./libgnuintl.h:98:1: error: unterminated comment
   98 | /* The user can define _INTL_RE
      | ^
./libgnuintl.h:17: error: unterminated #ifndef
   17 | #ifndef _LIBINTL_H

In file included from ../../../gettext-0.22.5/gettext-runtime/intl/gettextP.h:71,
                 from ../../../gettext-0.22.5/gettext-runtime/intl/langprefs.c:25:
./libgnuintl.h:98:1: error: unterminated comment
   98 | /* The user can define _INTL_RE
      | ^
./libgnuintl.h:17: error: unterminated #ifndef
   17 | #ifndef _LIBINTL_H

It is a parallel build issue caused by missing dependencies, backport
patch to fix it.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...1-intl-Fix-build-failure-with-make-j.patch | 35 +++++++++++++++++++
 meta/recipes-core/gettext/gettext_0.22.5.bb   |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failure-with-make-j.patch

diff --git a/meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failure-with-make-j.patch b/meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failure-with-make-j.patch
new file mode 100644
index 0000000000..144259dd3f
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failure-with-make-j.patch
@@ -0,0 +1,35 @@
+From 97a6a63ad61949663283f5fad68c9d5fb9be1f15 Mon Sep 17 00:00:00 2001
+From: Bruno Haible <bruno@clisp.org>
+Date: Tue, 12 Sep 2023 11:33:41 +0200
+Subject: [PATCH] intl: Fix build failure with "make -j".
+
+Reported by Christian Weisgerber <naddy@mips.inka.de> at
+<https://lists.gnu.org/archive/html/bug-gettext/2023-09/msg00005.html>.
+
+* gettext-runtime/intl/Makefile.am (langprefs.lo, log.lo): Depend on gettextP.h
+and its subordinate includes.
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/gitweb/?p=gettext.git;a=commit;h=97a6a63ad61949663283f5fad68c9d5fb9be1f15]
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ gettext-runtime/intl/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gettext-runtime/intl/Makefile.am b/gettext-runtime/intl/Makefile.am
+index da7abb758..9e56978bc 100644
+--- a/gettext-runtime/intl/Makefile.am
++++ b/gettext-runtime/intl/Makefile.am
+@@ -387,8 +387,8 @@ dngettext.lo:        ../config.h $(srcdir)/gettextP.h libgnuintl.h $(srcdir)/gmo
+ ngettext.lo:         ../config.h $(srcdir)/gettextP.h libgnuintl.h $(srcdir)/gmo.h $(srcdir)/loadinfo.h
+ plural.lo:           ../config.h $(srcdir)/plural-exp.h $(PLURAL_DEPS)
+ plural-exp.lo:       ../config.h $(srcdir)/plural-exp.h
+-langprefs.lo:        ../config.h
+-log.lo:              ../config.h
++langprefs.lo:        ../config.h $(srcdir)/gettextP.h libgnuintl.h $(srcdir)/gmo.h $(srcdir)/loadinfo.h
++log.lo:              ../config.h $(srcdir)/gettextP.h libgnuintl.h $(srcdir)/gmo.h $(srcdir)/loadinfo.h
+ printf.lo:           ../config.h
+ setlocale.lo:        ../config.h $(srcdir)/gettextP.h libgnuintl.h $(srcdir)/gmo.h $(srcdir)/loadinfo.h
+ version.lo:          ../config.h libgnuintl.h
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/gettext/gettext_0.22.5.bb b/meta/recipes-core/gettext/gettext_0.22.5.bb
index 1a66d37916..7eeb1a86fd 100644
--- a/meta/recipes-core/gettext/gettext_0.22.5.bb
+++ b/meta/recipes-core/gettext/gettext_0.22.5.bb
@@ -28,6 +28,7 @@ SRC_URI += " \
            file://serial-tests-config.patch \
            file://0001-tests-autopoint-3-unset-MAKEFLAGS.patch \
            file://0001-init-env.in-do-not-add-C-CXX-parameters.patch \
+           file://0001-intl-Fix-build-failure-with-make-j.patch \
            "
 
 inherit autotools texinfo pkgconfig ptest
-- 
2.25.1


