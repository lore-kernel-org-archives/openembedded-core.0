Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A77C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 08:26:41 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web12.6981.1634632000328116347
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 01:26:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 19J8QaEH029161
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Tue, 19 Oct 2021 01:26:37 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 19J8QSVN018985
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 19 Oct 2021 01:26:28 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 19 Oct 2021 01:26:28 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Tue, 19 Oct 2021 01:26:27 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 19 Oct 2021 01:26:27 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <anuj.mittal@intel.com>
Subject: [hardknott][PATCH] ncurses: fix CVE-2021-39537
Date: Tue, 19 Oct 2021 16:25:39 +0800
Message-ID: <20211019082539.24749-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 08:26:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157106

From: Mingli Yu <mingli.yu@windriver.com>

Backport patch [1] to fix CVE-2021-39537 [2].

[1] https://github.com/mirror/ncurses/commit/790a85dbd4a81d5f5d8dd02a44d84f01512ef443
[2] http://cvsweb.netbsd.org/bsdweb.cgi/pkgsrc/devel/ncurses/patches/patch-ncurses_tinfo_captoinfo.c?rev=1.1&content-type=text/x-cvsweb-markup

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../ncurses/files/CVE-2021-39537.patch        | 65 +++++++++++++++++++
 meta/recipes-core/ncurses/ncurses_6.2.bb      |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2021-39537.patch

diff --git a/meta/recipes-core/ncurses/files/CVE-2021-39537.patch b/meta/recipes-core/ncurses/files/CVE-2021-39537.patch
new file mode 100644
index 0000000000..d63bf57e8d
--- /dev/null
+++ b/meta/recipes-core/ncurses/files/CVE-2021-39537.patch
@@ -0,0 +1,65 @@
+From e83ecbd26252bac163fc4377ef30edbd4acb0bad Mon Sep 17 00:00:00 2001
+From: Sven Joachim <svenjoac@gmx.de>
+Date: Mon, 1 Jun 2020 08:03:52 +0200
+Subject: [PATCH] Import upstream patch 20200531
+
+20200531
+	+ correct configure version-check/warnng for g++ to allow for 10.x
+	+ re-enable "bel" in konsole-base (report by Nia Huang)
+	+ add linux-s entry (patch by Alexandre Montaron).
+	+ drop long-obsolete convert_configure.pl
+	+ add test/test_parm.c, for checking tparm changes.
+	+ improve parameter-checking for tparm, adding function _nc_tiparm() to
+	  handle the most-used case, which accepts only numeric parameters
+	  (report/testcase by "puppet-meteor").
+	+ use a more conservative estimate of the buffer-size in lib_tparm.c's
+	  save_text() and save_number(), in case the sprintf() function
+	  passes-through unexpected characters from a format specifier
+	  (report/testcase by "puppet-meteor").
+	+ add a check for end-of-string in cvtchar to handle a malformed
+	  string in infotocap (report/testcase by "puppet-meteor").
+
+CVE: CVE-2021-39537
+
+Upstream-Status: Backport [https://github.com/mirror/ncurses/commit/790a85dbd4a81d5f5d8dd02a44d84f01512ef443]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ ncurses/tinfo/captoinfo.c        |   11 +-
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/ncurses/tinfo/captoinfo.c b/ncurses/tinfo/captoinfo.c
+index 8b3b83d1..9362105a 100644
+--- a/ncurses/tinfo/captoinfo.c
++++ b/ncurses/tinfo/captoinfo.c
+@@ -98,7 +98,7 @@
+ #include <ctype.h>
+ #include <tic.h>
+ 
+-MODULE_ID("$Id: captoinfo.c,v 1.98 2020/02/02 23:34:34 tom Exp $")
++MODULE_ID("$Id: captoinfo.c,v 1.99 2020/05/25 21:28:29 tom Exp $")
+ 
+ #if 0
+ #define DEBUG_THIS(p) DEBUG(9, p)
+@@ -216,12 +216,15 @@ cvtchar(register const char *sp)
+ 	}
+ 	break;
+     case '^':
++	len = 2;
+ 	c = UChar(*++sp);
+-	if (c == '?')
++	if (c == '?') {
+ 	    c = 127;
+-	else
++	} else if (c == '\0') {
++	    len = 1;
++	} else {
+ 	    c &= 0x1f;
+-	len = 2;
++	}
+ 	break;
+     default:
+ 	c = UChar(*sp);
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/ncurses/ncurses_6.2.bb b/meta/recipes-core/ncurses/ncurses_6.2.bb
index e7d7396a20..598c51b00b 100644
--- a/meta/recipes-core/ncurses/ncurses_6.2.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.2.bb
@@ -3,6 +3,7 @@ require ncurses.inc
 SRC_URI += "file://0001-tic-hang.patch \
            file://0002-configure-reproducible.patch \
            file://0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch \
+           file://CVE-2021-39537.patch \
            "
 # commit id corresponds to the revision in package version
 SRCREV = "a669013cd5e9d6434e5301348ea51baf306c93c4"
-- 
2.17.1


