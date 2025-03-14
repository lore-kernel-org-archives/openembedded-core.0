Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30F64C35FF9
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 00:30:21 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.2851.1741912215313680743
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 17:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jEe8Slhg;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52E0TupP1990303
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Mar 2025 19:29:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741912196;
	bh=WVRKLzOjLSa4fuoeJy9UTHAumw1sIrWkIMg7F46Dckc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jEe8SlhgV7sKYkz3UNJufqdDLPyJx6JGEuiB8KO/uOaGRcJQI04jXD4UI3OTxIp5W
	 fgmfrYhCcTmeMQt1LaUBZdcUTAfd61XmWwe6wCYRSkJE8W20AnJSm/ONQW6fywi5Js
	 NIUbg5pfFKo5BWJN6Ihn6ZjrzXfNHv2KNreIvGGA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52E0TuqZ108694
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Mar 2025 19:29:56 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Mar 2025 19:29:55 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Mar 2025 19:29:55 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52E0TtAw061940;
	Thu, 13 Mar 2025 19:29:55 -0500
From: <rs@ti.com>
To: <otavio.salvador@ossystems.com.br>, <alex.kanavin@gmail.com>
CC: <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>,
        <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>,
        <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [PATCH] Revert "gettext: fix a parallel build issue"
Date: Thu, 13 Mar 2025 19:29:33 -0500
Message-ID: <20250314002937.672768-2-rs@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314002937.672768-1-rs@ti.com>
References: <20250314002937.672768-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 00:30:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212813

From: Randolph Sapp <rs@ti.com>

This reverts commit e18fc96f9d4c0a0525c21371d3f36e8dfe008b35.
---
 ...1-intl-Fix-build-failure-with-make-j.patch | 35 -------------------
 meta/recipes-core/gettext/gettext_0.22.5.bb   |  1 -
 2 files changed, 36 deletions(-)
 delete mode 100644 meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failure-with-make-j.patch

diff --git a/meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failure-with-make-j.patch b/meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failure-with-make-j.patch
deleted file mode 100644
index 144259dd3f..0000000000
--- a/meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failure-with-make-j.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 97a6a63ad61949663283f5fad68c9d5fb9be1f15 Mon Sep 17 00:00:00 2001
-From: Bruno Haible <bruno@clisp.org>
-Date: Tue, 12 Sep 2023 11:33:41 +0200
-Subject: [PATCH] intl: Fix build failure with "make -j".
-
-Reported by Christian Weisgerber <naddy@mips.inka.de> at
-<https://lists.gnu.org/archive/html/bug-gettext/2023-09/msg00005.html>.
-
-* gettext-runtime/intl/Makefile.am (langprefs.lo, log.lo): Depend on gettextP.h
-and its subordinate includes.
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/gitweb/?p=gettext.git;a=commit;h=97a6a63ad61949663283f5fad68c9d5fb9be1f15]
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- gettext-runtime/intl/Makefile.am | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gettext-runtime/intl/Makefile.am b/gettext-runtime/intl/Makefile.am
-index da7abb758..9e56978bc 100644
---- a/gettext-runtime/intl/Makefile.am
-+++ b/gettext-runtime/intl/Makefile.am
-@@ -387,8 +387,8 @@ dngettext.lo:        ../config.h $(srcdir)/gettextP.h libgnuintl.h $(srcdir)/gmo
- ngettext.lo:         ../config.h $(srcdir)/gettextP.h libgnuintl.h $(srcdir)/gmo.h $(srcdir)/loadinfo.h
- plural.lo:           ../config.h $(srcdir)/plural-exp.h $(PLURAL_DEPS)
- plural-exp.lo:       ../config.h $(srcdir)/plural-exp.h
--langprefs.lo:        ../config.h
--log.lo:              ../config.h
-+langprefs.lo:        ../config.h $(srcdir)/gettextP.h libgnuintl.h $(srcdir)/gmo.h $(srcdir)/loadinfo.h
-+log.lo:              ../config.h $(srcdir)/gettextP.h libgnuintl.h $(srcdir)/gmo.h $(srcdir)/loadinfo.h
- printf.lo:           ../config.h
- setlocale.lo:        ../config.h $(srcdir)/gettextP.h libgnuintl.h $(srcdir)/gmo.h $(srcdir)/loadinfo.h
- version.lo:          ../config.h libgnuintl.h
--- 
-2.25.1
-
diff --git a/meta/recipes-core/gettext/gettext_0.22.5.bb b/meta/recipes-core/gettext/gettext_0.22.5.bb
index 7eeb1a86fd..1a66d37916 100644
--- a/meta/recipes-core/gettext/gettext_0.22.5.bb
+++ b/meta/recipes-core/gettext/gettext_0.22.5.bb
@@ -28,7 +28,6 @@ SRC_URI += " \
            file://serial-tests-config.patch \
            file://0001-tests-autopoint-3-unset-MAKEFLAGS.patch \
            file://0001-init-env.in-do-not-add-C-CXX-parameters.patch \
-           file://0001-intl-Fix-build-failure-with-make-j.patch \
            "
 
 inherit autotools texinfo pkgconfig ptest
-- 
2.45.1


