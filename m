Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 312D3C4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 07:13:09 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.4943.1646205180161715135
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 23:13:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: liezhi.yang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 2227Cwlu016424
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 1 Mar 2022 23:12:59 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 1 Mar 2022 23:12:59 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 1 Mar 2022 23:12:58 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 1 Mar 2022 23:12:58 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/3] perl: Makefile.PL: Fix _PATH_LOG for deterministic build
Date: Tue, 1 Mar 2022 23:12:57 -0800
Message-ID: 
 <d4b25c6c4a2a48da96da92bd03fe060e0cb37547.1646204967.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1646204967.git.liezhi.yang@windriver.com>
References: <cover.1646204967.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 07:13:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162590

It checks host's path such as /dev/log and uses it, this doesn't make sense for
cross build, and it causes undeterministic, for example, the contianer os
usually doesn't have /dev/log which leads to a different build result since
other host usually has /dev/log, so make it always use the default value to fix
the issue.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...Makefile.PL-Fix-_PATH_LOG-for-determ.patch | 34 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.34.0.bb     |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch

diff --git a/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch b/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
new file mode 100644
index 00000000000..f6bcbce6856
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
@@ -0,0 +1,34 @@
+From a73fff1fcf0def4ce93964f1b63fe3ad0967259d Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Fri, 18 Feb 2022 09:44:26 +0000
+Subject: [PATCH] cpan/Sys-Syslog/Makefile.PL: Fix _PATH_LOG for deterministic
+
+It checks host's path such as /dev/log and uses it, this doesn't make sense for
+cross build, and it causes undeterministic, for example, the contianer os
+usually doesn't have /dev/log which leads to a different build result since
+other host usually has /dev/log, so make it always use the default value to fix
+the issue.
+
+Upstream-Status:Inappropriate [OE specific]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ cpan/Sys-Syslog/Makefile.PL | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/cpan/Sys-Syslog/Makefile.PL b/cpan/Sys-Syslog/Makefile.PL
+index d09ba69..d44e58c 100644
+--- a/cpan/Sys-Syslog/Makefile.PL
++++ b/cpan/Sys-Syslog/Makefile.PL
+@@ -130,6 +130,8 @@ else {
+     $_PATH_LOG = "";
+ }
+ 
++# OE specific
++$_PATH_LOG = "";
+ 
+ # if possible, generate the code that handles the constants with 
+ # ExtUtils::Constant, otherwise use cached copy in fallback/
+-- 
+2.31.1
+
diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
index a97da872032..8a1db7ed359 100644
--- a/meta/recipes-devtools/perl/perl_5.34.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://aacd2398e766500cb5d83c4d76b642fcf31d997a.patch \
            file://ea57297a58b8f10ab885c19eec48ea076116cc1f.patch \
            file://5bc1e5fdd87aa205011512cd1e6cc655bcf677fd.patch \
+           file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.31.1


