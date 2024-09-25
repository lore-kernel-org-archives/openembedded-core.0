Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3430CF9C6C
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:43 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.9246.1727246973247954874
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PLAZEigV;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246978; x=1758782978;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=l9rYIFKXy69mEgQYP1Qe/aQyLKLER2sZ29t17jtni+E=;
  b=PLAZEigVIWt9z/kjOc0yued7qW8IU4z4Xzz12pQLs2GkKvp0tTe7i0h8
   8VTg+9MHXImd8apb9Rak3wPD6b2RGfuBJ/GY0E2sGn8iSLBDMoR37ya8h
   7GMLDxj+DSw/zgRozXmGtHeaksEjzrpkQq3vwvt8cv6HQBQ6CjIOXxl1+
   9oxYknhlwtrnoIVL2SguPte9zkUPktZ5PwzPF4LrIm6Ham/4/5HDWRqh6
   0EZT9qaFvbPmVU1dnneO35qFlshC4APiuacSV35jshdGvmQzoXQy+MluK
   0pSydpmwrQJ2fHTxDDSDzG7nPxYQKignWYa09skPPK4xU0XnfOu7MlTcM
   g==;
X-CSE-ConnectionGUID: F+Y+fp5FSSWeaWI6WmmkWg==
X-CSE-MsgGUID: azJX4SARSyKiQ3fz6yKKqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="162105375"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="162105375"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:36 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4D2F4DB3C6
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:34 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8582AD3F07
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 02630E2B1B
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A78CA1A000A;
	Wed, 25 Sep 2024 14:49:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/47] gawk: upgrade 5.3.0 -> 5.3.1
Date: Wed, 25 Sep 2024 14:48:38 +0800
Message-Id: <1727246960-20665-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10--0.245800-10.000000
X-TMASE-MatchedRID: h8nmbN2t+rqjz0nOeth/yaoXHZz/dXlxkdS3kPlaZyXkABvhO7aBvqTz
	q4wH3yI2RshHKnHaJ757soXzkOVjzPUUM6QeN5XjHlDQRrnQLaVNLPQl0QAltJb209Jh7btUYTS
	hhDGj1mzA+OjLG1jwgOEFcKrgSbnL+Y8BX+7oxN85ZRbFNAl0j0JUmCCQg66wbNSK+DWcxZrPDm
	paQyREJQd+SVJtCjAAEriUbUlPOKPgp0ltbNse282CuVPkCNzuN5dqZcIK7VgwcMedHxxRAiFLS
	h+QCTPZIvrftAIhWmLK24Lrk00g7kwYXRRr2ymnydRP56yRRA8ZskwWqoib3DQQTVweW/TMnDq2
	cOBL/wXMCY8ExEcvQcGCo5N2nuDi4jcxYN7NUiWdVNZaI2n6/8oioCrSMgeKbPhxQ+wdmOn2wNO
	0mj7WknBRLfMXZsh4gDLqnrRlXrZ8nn9tnqel2MZW5ai5WKlyaFm5NIVgTxI96BqNQ45B/estoH
	z0eCs8Qij1nzrfBQJpLSkd4w/KmsYN3kTk+7nxYWwZtjiE8+kp6jfn/nC8QAKXHgkwEbdo/r/b+
	dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204897

From: Wang Mingyu <wangmy@fujitsu.com>

0001-m4-readline-add-missing-includes.patch
removed since it's included in 5.3.1

Changelog:
==========
- More subtle issues related to uninitialized array elements have
  been fixed.
- A number of bugs in the debugger related to handling of arrays
  have been fixed.
- Some subtle bugs in the API have been fixed.
- Use of MPFR is now possible again on 32-bit Power PC Mac systems.
- Race conditions around broken pipes for system() and read and write
  pipes should now be closed off.
- Support for OSF/1 has been removed.
- The never-documented --nostalgia option has been removed. It was
  causing bug reports.
- The implementation of printf/sprintf has been thoroughly reworked
  in order to make the code more maintainable and to fix a goodly
  number of corner cases.
- As usual, there have been several minor code cleanups and bug fixes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...001-m4-readline-add-missing-includes.patch | 38 -------------------
 .../gawk/{gawk_5.3.0.bb => gawk_5.3.1.bb}     |  3 +-
 2 files changed, 1 insertion(+), 40 deletions(-)
 delete mode 100644 meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-includes.patch
 rename meta/recipes-extended/gawk/{gawk_5.3.0.bb => gawk_5.3.1.bb} (95%)

diff --git a/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-includes.patch b/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-includes.patch
deleted file mode 100644
index 6fffd1f373..0000000000
--- a/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-includes.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 4f4e84f139e2a8682f1374a592f2636c43ad857b Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Tue, 21 May 2024 15:10:11 +0000
-Subject: [PATCH] m4/readline: add missing includes
-
-The cross-specific code fragment only includes stdio.h, where the native
-fragment also includes fcntl.h and unistd.h.  This is important because
-GCC 14.1 has made the implicit definitions an error:
-
-conftest.c: In function 'main':
-conftest.c:144:9: error: implicit declaration of function 'close'; did you mean 'pclose'? [-Wimplicit-function-declaration]
-conftest.c:146:14: error: implicit declaration of function 'open'; did you mean 'popen'? [-Wimplicit-function-declaration]
-
-Add the missing includes so that the check doesn't always fail due to
-these errors.
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/gawk.git/commit/?id=c1613c310d71b87f509458e0259ecd10eda2b140]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- m4/readline.m4 | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/m4/readline.m4 b/m4/readline.m4
-index 38f96326..efd52d4e 100644
---- a/m4/readline.m4
-+++ b/m4/readline.m4
-@@ -66,6 +66,8 @@ dnl action if false:
- dnl action if cross compiling:
- 		[AC_LINK_IFELSE(
- 			[AC_LANG_PROGRAM([[#include <stdio.h>
-+#include <fcntl.h>
-+#include <unistd.h>
- #include <readline/readline.h>
- #include <readline/history.h>]],		dnl includes
- 			dnl function body
--- 
-2.34.1
-
diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb b/meta/recipes-extended/gawk/gawk_5.3.1.bb
similarity index 95%
rename from meta/recipes-extended/gawk/gawk_5.3.0.bb
rename to meta/recipes-extended/gawk/gawk_5.3.1.bb
index ac9d8500d6..50b891ef14 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.1.bb
@@ -16,11 +16,10 @@ PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
 PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
 
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
-           file://0001-m4-readline-add-missing-includes.patch \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "378f8864ec21cfceaa048f7e1869ac9b4597b449087caf1eb55e440d30273336"
+SRC_URI[sha256sum] = "fa41b3a85413af87fb5e3a7d9c8fa8d4a20728c67651185bb49c38a7f9382b1e"
 
 inherit autotools gettext texinfo update-alternatives
 
-- 
2.34.1


