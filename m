Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9035C54E58
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:41 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.8422.1709105612417738887
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sanJ2sgE;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105613; x=1740641613;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=SmZ5fIsn+j6Bx4hF9AfKBntiR3nQjn86bDIplmOJ8nM=;
  b=sanJ2sgEPTyHZzZNjJF0GE0fSd9XzEizoxrfIBwLl6pzy0Syr8f58BsT
   TfGDrpYEAigQf5+M0oh8hJb3AWZ1d0sA3kKQok62I24TwIttvy3Pid5VE
   FtYeHerQkDwWOWrD34+SOlY3cPb+hNJXL7QQGgL4U6jIfFnWFyuasyzAu
   rzV6ogxbnDTzSe3tC7HdJTBZVMr+R7nGnIka4F8GBJQM4HpwJWWvaWkxs
   kdfSNqzr7JZc1KORbnEIR7VMSpBdbiNULppXFAReJWr19R8HYN9QLy8/E
   3j98tP4BKNoMbhhpqiEEU2rqvoM/SaMpTj917ZnIff8gPGlmY3oSqhCKp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="150123418"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="150123418"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:32 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D3548E8549
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:29 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 159A3DAE94
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 91493347BF
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3B7F81A006A;
	Wed, 28 Feb 2024 15:33:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 24/48] minicom: upgrade 2.8 -> 2.9
Date: Wed, 28 Feb 2024 15:32:31 +0800
Message-Id: <1709105575-24259-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10-2.398700-10.000000
X-TMASE-MatchedRID: mL9wGNQYBVujz0nOeth/ySrLqyE6Ur/jkdS3kPlaZyV4+LtSkGbmRFP/
	rSiKhsFs6oHv+vDBrw3vOpaxrqKQ/TOfD6L6toKjmVBuNYtCo5uZmLDnd2pI375/tqn0MloNu8/
	lvGittlR/13sF0Ynlt6Fb/Rfcq0XuHvtWdNrtrGpnL/TwDZ0PSMiOJTMTCRyFpLN+rW1+Cq2+M3
	06Ro3W2kJXZnlGyrNBEriUbUlPOKPgp0ltbNse2/x0ykrbAxjCchr4pBLGIvAH8UzOewTxw78FH
	rw7frluNIBrw7gT13Qv/zJQ0aiPJqceJlSdtw9Eqoeab9Xgz8+HeUy7ZW7WAuCbuVI7hVbLytDi
	oCcQ2MO2S/v/ypmooWHeuUrtbI8SoGx3AJ5tkZM5ZRbFNAl0j/lSepWcgdLPHpyu/FxYOKFrFmV
	fWDAwW8tKuYsh2AG64rz9nnOxxGUUpEnP/PXTXEhwlOfYeSqx/soTtcgqC3wpeqaZhManGJSDlQ
	PoCUXSsX24ahsS5PuAMuqetGVetnyef22ep6XYxlblqLlYqXKFcRYJe1QjQndBIqd7sGLkQa58B
	SibjIyuJ2gQuf6OP2Va5+Rs/GB2l/PKCd3xGpd3JwsUeDNxJINtNwSXjVd4DwLWRKbuCY/+v9v5
	2ZIoWjoAf389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196348

From: Wang Mingyu <wangmy@fujitsu.com>

0001-fix-minicom-h-v-return-value-is-not-0.patch
allow.to.disable.lockdev.patch
removed since they're included in 2.9.

Changelog:
============
 - Change Hardware Flow Control Default to No.
 - Timestamping mode is now saved and restored.
 - Split "Screen and Keyboard" menu into two menus.
 - Update to gettext-0.21.
 - Change return values of --help and --version to success.
 - Support higher baud rates on MacOS
 - Save character send delay to config file
 - Save newline send delay to config file
 - Update translations: Romanian, German, French, Norwegian/Bookmal, Polish,
                        Serbian, Swedish
 - New translation: Georgian, Korean

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ix-minicom-h-v-return-value-is-not-0.patch | 33 -------------------
 .../minicom/allow.to.disable.lockdev.patch    | 30 -----------------
 .../{minicom_2.8.bb => minicom_2.9.bb}        |  7 ++--
 3 files changed, 2 insertions(+), 68 deletions(-)
 delete mode 100644 meta/recipes-extended/minicom/minicom/0001-fix-minicom-h-v-return-value-is-not-0.patch
 delete mode 100644 meta/recipes-extended/minicom/minicom/allow.to.disable.lockdev.patch
 rename meta/recipes-extended/minicom/{minicom_2.8.bb => minicom_2.9.bb} (80%)

diff --git a/meta/recipes-extended/minicom/minicom/0001-fix-minicom-h-v-return-value-is-not-0.patch b/meta/recipes-extended/minicom/minicom/0001-fix-minicom-h-v-return-value-is-not-0.patch
deleted file mode 100644
index 9e67126f3e..0000000000
--- a/meta/recipes-extended/minicom/minicom/0001-fix-minicom-h-v-return-value-is-not-0.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Exit normally for help/verison options
-
-If -v or -h is used for the help/version information, it is a normal exit situation,
-not an error condition. Sometimes these are used as a simple operation test of the
-resulting binary so the exit code does matter.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Submitted [https://salsa.debian.org/minicom-team/minicom/-/merge_requests/14]
----
- src/minicom.c |    6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-Index: minicom-2.8/src/minicom.c
-===================================================================
---- minicom-2.8.orig/src/minicom.c
-+++ minicom-2.8/src/minicom.c
-@@ -1257,14 +1257,14 @@ int main(int argc, char **argv)
-                  "modify it under the terms of the GNU General Public License\n"
-                  "as published by the Free Software Foundation; either version\n"
-                  "2 of the License, or (at your option) any later version.\n\n"));
--          exit(1);
-+          exit(0);
-           break;
-         case 's': /* setup mode */
-           dosetup = 1;
-           break;
-         case 'h':
-           helpthem();
--          exit(1);
-+          exit(0);
-           break;
-         case 'p': /* Pseudo terminal to use. */
-           if (strncmp(optarg, "/dev/", 5) == 0)
diff --git a/meta/recipes-extended/minicom/minicom/allow.to.disable.lockdev.patch b/meta/recipes-extended/minicom/minicom/allow.to.disable.lockdev.patch
deleted file mode 100644
index 39dc5c0492..0000000000
--- a/meta/recipes-extended/minicom/minicom/allow.to.disable.lockdev.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-configure: Allow lockdev to be disabled
-
-When the pkgconfig dependencies may be present, it is useful to be
-able to explictly disable the lockdev dependency. This adds such an
-option.
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Upstream-Status: Submitted [https://salsa.debian.org/minicom-team/minicom/-/merge_requests/14]
-
-Index: minicom-2.8/configure.ac
-===================================================================
---- minicom-2.8.orig/configure.ac
-+++ minicom-2.8/configure.ac
-@@ -43,7 +43,13 @@ if test "x$enable_socket" = xyes; then
- fi
- 
- PKG_PROG_PKG_CONFIG
--if test -n "$PKG_CONFIG"; then
-+
-+AC_ARG_ENABLE([lockdev],
-+        AS_HELP_STRING([--enable-lockdev],
-+                       [Enable lockdev support (def: enabled)]),
-+        [], [enable_lockdev="yes"])
-+
-+if test -n "$PKG_CONFIG" && test "x$enable_lockdev" = xyes; then
- 	PKG_CHECK_MODULES([LOCKDEV], [lockdev], AC_DEFINE([HAVE_LOCKDEV],[1],[Define if you have lockdev]),[:])
- fi
- 
diff --git a/meta/recipes-extended/minicom/minicom_2.8.bb b/meta/recipes-extended/minicom/minicom_2.9.bb
similarity index 80%
rename from meta/recipes-extended/minicom/minicom_2.8.bb
rename to meta/recipes-extended/minicom/minicom_2.9.bb
index 2640c6b057..907d5c79c9 100644
--- a/meta/recipes-extended/minicom/minicom_2.8.bb
+++ b/meta/recipes-extended/minicom/minicom_2.9.bb
@@ -7,12 +7,9 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=420477abc567404debca0a2a1cb6b645 \
                     file://src/minicom.h;beginline=1;endline=12;md5=a58838cb709f0db517f4e42730c49e81"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/m/${BPN}/${BPN}_${PV}.orig.tar.bz2 \
-           file://allow.to.disable.lockdev.patch \
-           file://0001-fix-minicom-h-v-return-value-is-not-0.patch \
-"
+SRC_URI = "${DEBIAN_MIRROR}/main/m/${BPN}/${BPN}_${PV}.orig.tar.bz2"
 
-SRC_URI[sha256sum] = "38cea30913a20349326ff3f1763ee1512b7b41601c24f065f365e18e9db0beba"
+SRC_URI[sha256sum] = "9efbb6458140e5a0de445613f0e76bcf12cbf7a9892b2f53e075c2e7beaba86c"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[lockdev] = "--enable-lockdev,--disable-lockdev,lockdev"
-- 
2.34.1


