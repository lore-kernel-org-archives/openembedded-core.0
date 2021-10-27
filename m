Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E71EC433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 15:17:00 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.13168.1635347816645315769
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 08:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="230456710"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="230456710"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:16:59 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="537616997"
Received: from hchai4-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.47])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:16:58 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 02/36] ncurses: fix CVE-2021-39537
Date: Wed, 27 Oct 2021 23:16:10 +0800
Message-Id: 
 <8fceb122a1c0240106342738de7d2484b48d9a6a.1635347406.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635347406.git.anuj.mittal@intel.com>
References: <cover.1635347406.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 15:17:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157518

From: Mingli Yu <mingli.yu@windriver.com>

Backport patch [1] to fix CVE-2021-39537 [2].

[1] https://github.com/mirror/ncurses/commit/790a85dbd4a81d5f5d8dd02a44d84f01512ef443
[2] http://cvsweb.netbsd.org/bsdweb.cgi/pkgsrc/devel/ncurses/patches/patch-ncurses_tinfo_captoinfo.c?rev=1.1&content-type=text/x-cvsweb-markup

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
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
2.31.1


