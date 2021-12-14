Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C83AC433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 01:21:04 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.20093.1639444861529217620
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 17:21:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=intel header.b=TicWbgpn;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639444862; x=1670980862;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=SkeAzzpcUR0keh8RqpEAw3RTzSvRw+ZfZcN5g1pet3M=;
  b=TicWbgpnKt6jM009rypu9yf1ULajmWyknt5vU5uEBlyYUkhBMTeI8BOt
   nbXmwpdM1g5cMQwHPT04lmgf0qOuRoIQ3IgR+HR0tK2jjC3WKUkNDY/3K
   OQsPYtfC00InqJW2IEBc+F1S2r3RuTZLv5el5PpBkfB8yJuEtqOYDyjPM
   AJY/8MvJF9H8RTezgWUJiJgvqelU/xQDae7TTmJsozzY9Wia9drY+rQxh
   Qo1Ht0XvkqRp+RDN19qfY4UKEXYYkpP75Xt0MwIjt4Ji3XqqQWt0VsN9W
   TV5kmPCltfmOoZfA6y6NV4/iv92DWO4J4MtgAxRVc3HMWxwSED3qYyUcK
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="238682476"
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600";
   d="scan'208";a="238682476"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 17:21:02 -0800
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600";
   d="scan'208";a="464869129"
Received: from zyteoh-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.239.31])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 17:21:00 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 01/17] ncurses: fix CVE-2021-39537
Date: Tue, 14 Dec 2021 09:20:36 +0800
Message-Id: 
 <c6422335f653c44efc651e8785821282d3d4f789.1639444641.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639444641.git.anuj.mittal@intel.com>
References: <cover.1639444641.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 01:21:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159663

From: Mingli Yu <mingli.yu@windriver.com>

Backport patch [1] to fix CVE-2021-39537 [2].

[1] https://github.com/mirror/ncurses/commit/790a85dbd4a81d5f5d8dd02a44d84f01512ef443
[2] http://cvsweb.netbsd.org/bsdweb.cgi/pkgsrc/devel/ncurses/patches/patch-ncurses_tinfo_captoinfo.c?rev=1.1&content-type=text/x-cvsweb-markup

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
(cherry picked from commit 8fceb122a1c0240106342738de7d2484b48d9a6a)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
2.33.1


