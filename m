Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21261C3DA52
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 09:44:19 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.10225.1720604654270418084
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 02:44:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DuqxZUen;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1720604655; x=1752140655;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ixYfm3uTCCGiBXYEcL963HDo3kAiAq0NLxHlQZ+EYig=;
  b=DuqxZUen+zaltFNY/tBdFXxMcNJp5CZWVpSXe/+/r2WGFE7afogC5bZA
   QZu/TAdm7OvpPeptStwJR97SxYKWRg8NYWBsrc7v3aW62RNT0Pn2F6zYr
   d5rt1tz5J4FRZC+HB04ex3ZKdrnoKiAUX4R3f3gnQKg7GNj8FsKaHgL7x
   yq7rDWbgk3XNH3A0QLiHUfts8Kqmo+ICE5KhuoCrv8OsUJcpIrCiR/pQ7
   70fSOqG9PK7c3agb6GQ2N+YARXfjkXyI2KUHLK/Fdn+ZG9GhUmsnC/X9X
   l6jYIVqlclGuy54tSOPwaOKOWxTJycDUmvP+0dVwTWxD0oIhH9FTfYoOq
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="145396396"
X-IronPort-AV: E=Sophos;i="6.09,197,1716217200"; 
   d="scan'208";a="145396396"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 18:44:12 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0CE11D6482
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:11 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 511D931908
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:10 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E27DE220028
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:09 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9317A1A0002;
	Wed, 10 Jul 2024 17:44:09 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/30] cups: upgrade 2.4.9 -> 2.4.10
Date: Wed, 10 Jul 2024 17:43:29 +0800
Message-Id: <1720604634-23406-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
References: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28520.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28520.006
X-TMASE-Result: 10--4.977300-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yUIIxwDaU5mrrOCEGIPhtwj+Aw16GgqpOynN
	YSmpHzdZ/0gQSi6whYDJ+K7AEUcP+/pzkStoOGX2KsurITpSv+Mj7+0dxWCTnt9RlPzeVuQQ1vZ
	7s3YIVDL7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgBmyTBaqiJvcaHvr9sOkYSsuF3
	qZrtYTy7WHcKLe20ut/kcTqrhuUhzeG4FwcWqASzBgCmbnj9Jm3hng3KTHeTZtyrjqNnDgLWkRc
	A7PBu0x4vM1YF6AJbbCCfuIMF6xLd934/rDAK3zlGdyD+QE2h+rNne0S4vL74kBXLWIBjuus6IQ
	5y6hjhVgAVYCnO0EWbSspcQmcxzArr0VCPiXNm6F+ceNFnzNx9VqsE9AZ8derR5U/btsyfP+v9v
	52ZIoWjoAf389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 09:44:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201700

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fixed error handling when reading a mixed "1setOf" attribute.
- Fixed scheduler start if there is only domain socket to listen on

0001-use-echo-only-in-init.patch
0002-don-t-try-to-run-generated-binaries.patch
0004-cups-fix-multilib-install-file-conflicts.patch
refreshed for 2.4.10.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../cups/cups/0001-use-echo-only-in-init.patch   | 11 ++++-------
 ...002-don-t-try-to-run-generated-binaries.patch | 16 ++++++----------
 ...ups-fix-multilib-install-file-conflicts.patch | 12 ++++--------
 .../cups/{cups_2.4.9.bb => cups_2.4.10.bb}       |  2 +-
 4 files changed, 15 insertions(+), 26 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.4.9.bb => cups_2.4.10.bb} (51%)

diff --git a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
index 80bbad0a44..e6bd400779 100644
--- a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
+++ b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
@@ -1,7 +1,7 @@
-From a3f4d8ba97f4669a95943a7e65eb61aa44ce7999 Mon Sep 17 00:00:00 2001
+From ddfe6ed6a89226985e8c9f0751c026aabc0927a0 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Thu, 13 Dec 2012 19:03:52 -0800
-Subject: [PATCH 1/4] use echo only in init
+Subject: [PATCH] use echo only in init
 
 Upstream-Status: Inappropriate [embedded specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
@@ -10,10 +10,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/scheduler/cups.sh.in b/scheduler/cups.sh.in
-index 89ac36d..6618a0f 100644
+index 74cce18..c57f0db 100644
 --- a/scheduler/cups.sh.in
 +++ b/scheduler/cups.sh.in
-@@ -50,7 +50,7 @@ case "`uname`" in
+@@ -51,7 +51,7 @@ case "`uname`" in
  		ECHO_ERROR=:
  		;;
  
@@ -22,6 +22,3 @@ index 89ac36d..6618a0f 100644
  		IS_ON=/bin/true
  		if test -f /etc/init.d/functions; then
  			. /etc/init.d/functions
--- 
-2.17.1
-
diff --git a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
index 2bc26edbfc..75270cb0cb 100644
--- a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
+++ b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
@@ -1,21 +1,20 @@
-From 3e9a965dcd65ab2d40b753b6f792a1a4559182aa Mon Sep 17 00:00:00 2001
+From ff6c7168c3f26094b3a18298208a28831d1c1fd5 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Sun, 30 Jan 2011 16:37:27 +0100
-Subject: [PATCH 2/4] don't try to run generated binaries
+Subject: [PATCH] don't try to run generated binaries
 
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-
 ---
- ppdc/Makefile | 32 ++++++++++++++++----------------
- 1 file changed, 16 insertions(+), 16 deletions(-)
+ ppdc/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/ppdc/Makefile b/ppdc/Makefile
-index 32e2e0b..f1478d4 100644
+index e36ed11..3fe97e1 100644
 --- a/ppdc/Makefile
 +++ b/ppdc/Makefile
-@@ -186,8 +186,8 @@ genstrings:		genstrings.o libcupsppdc.a ../cups/$(LIBCUPSSTATIC) \
+@@ -187,8 +187,8 @@ genstrings:		genstrings.o libcupsppdc.a ../cups/$(LIBCUPSSTATIC) \
  	$(LD_CXX) $(ARCHFLAGS) $(ALL_LDFLAGS) -o genstrings genstrings.o \
  		libcupsppdc.a $(LINKCUPSSTATIC)
  	$(CODE_SIGN) -s "$(CODE_SIGN_IDENTITY)" $@
@@ -26,6 +25,3 @@ index 32e2e0b..f1478d4 100644
  
  
  #
--- 
-2.17.1
-
diff --git a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
index bc9260307c..d49fb8f2c2 100644
--- a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
+++ b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
@@ -1,7 +1,7 @@
-From 7dbda1887aa19ab720aff22312f4caff2d575f62 Mon Sep 17 00:00:00 2001
+From 6e286b582571ffca3f7874076d70eec6fd5713f6 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Wed, 3 Oct 2018 00:27:11 +0800
-Subject: [PATCH 4/4] cups: fix multilib install file conflicts
+Subject: [PATCH] cups: fix multilib install file conflicts
 
 @CUPS_SERVERBIN@ is ${libdir} related that causes multilib install file
 conflict. Remove @CUPS_SERVERBIN@ from the comment line of cups-files.conf to
@@ -10,16 +10,15 @@ avoid the conflict.
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
 ---
  conf/cups-files.conf.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/conf/cups-files.conf.in b/conf/cups-files.conf.in
-index 4a78ba6..03c6582 100644
+index 93584a1..65b7052 100644
 --- a/conf/cups-files.conf.in
 +++ b/conf/cups-files.conf.in
-@@ -73,7 +73,7 @@ PageLog @CUPS_LOGDIR@/page_log
+@@ -67,7 +67,7 @@ PageLog @CUPS_LOGDIR@/page_log
  #RequestRoot @CUPS_REQUESTS@
  
  # Location of helper programs...
@@ -28,6 +27,3 @@ index 4a78ba6..03c6582 100644
  
  # SSL/TLS keychain for the scheduler...
  #ServerKeychain @CUPS_SERVERKEYCHAIN@
--- 
-2.17.1
-
diff --git a/meta/recipes-extended/cups/cups_2.4.9.bb b/meta/recipes-extended/cups/cups_2.4.10.bb
similarity index 51%
rename from meta/recipes-extended/cups/cups_2.4.9.bb
rename to meta/recipes-extended/cups/cups_2.4.10.bb
index e0a3522004..e16ad47cf5 100644
--- a/meta/recipes-extended/cups/cups_2.4.9.bb
+++ b/meta/recipes-extended/cups/cups_2.4.10.bb
@@ -2,4 +2,4 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "38fbf4535a10554113e013d54fedda03ee88007ea6a9761d626a04e1e4489e8c"
+SRC_URI[sha256sum] = "d75757c2bc0f7a28b02ee4d52ca9e4b1aa1ba2affe16b985854f5336940e5ad7"
-- 
2.34.1


