Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB4EC3DA55
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:57:59 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.2187.1719853076589172202
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=OGivHBNa;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=SKVXcrZV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101906f3b4e37-227ff3f8-a072-4ec2-8aad-8aa4f1b81dec-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1719853076;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FEXuV7DW4a+3QX0THGaFQxzkDpYSxc0c20jbki4Pu/g=;
	b=OGivHBNauhRsOrgnMItWjp1t/vr0IfEeN81tC6/9mE2w3iCfr8PBFb6YhG14aQ/o
	m+jMK/qJDkpiySYiCaUtH8aAXySsIkvliKUSirQnENjq98YA8ICdSfmTsFtRv6411/0
	bVD+vA/D7wPIs9J4w1aUsWibCMI051aaL4dSWbAY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1719853076;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FEXuV7DW4a+3QX0THGaFQxzkDpYSxc0c20jbki4Pu/g=;
	b=SKVXcrZVOYQKvXQJkwSBCc9qNz01vn9EWeYe5BNH4WLP29tV7OKxDlX8fYXp/Rik
	iAQz+2JmXCU9vNOXwt972Po1U3iJqTQnBLBOgNwOkE+aHxEMjlQ3n/N15Ml2Sa+OHzu
	v0T4b+4BYH/9/KwL7aTDLX3tKYPuOvPYuVYicysg=
Content-Type: multipart/mixed; boundary="===============3583628818396284484=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cups: upgrading to 2.4.10 SUCCEEDED
Message-ID: <010101906f3b4e37-227ff3f8-a072-4ec2-8aad-8aa4f1b81dec-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jul 2024 16:57:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201356

--===============3583628818396284484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cups* to *2.4.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cups-upgrade-2.4.9-2.4.10.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From d3e95f6bdb0ca65c732d6d267ea3c8fb98a544bc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jul 2024 10:38:18 +0000
Subject: [PATCH] cups: upgrade 2.4.9 -> 2.4.10

---
 .../cups/cups/0001-use-echo-only-in-init.patch   | 11 ++++-------
 ...002-don-t-try-to-run-generated-binaries.patch | 16 ++++++----------
 ...ups-fix-multilib-install-file-conflicts.patch | 12 ++++--------
 meta/recipes-extended/cups/cups/libexecdir.patch |  5 ++---
 .../cups/{cups_2.4.9.bb => cups_2.4.10.bb}       |  2 +-
 5 files changed, 17 insertions(+), 29 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.4.9.bb => cups_2.4.10.bb} (51%)

diff --git a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
index 80bbad0a44..baa8004e74 100644
--- a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
+++ b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
@@ -1,7 +1,7 @@
-From a3f4d8ba97f4669a95943a7e65eb61aa44ce7999 Mon Sep 17 00:00:00 2001
+From 5585d9c124f8107b1e4978923edbb94e1222c005 Mon Sep 17 00:00:00 2001
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
index 2bc26edbfc..a03dc55c5b 100644
--- a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
+++ b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
@@ -1,21 +1,20 @@
-From 3e9a965dcd65ab2d40b753b6f792a1a4559182aa Mon Sep 17 00:00:00 2001
+From 5d9243e5a7cb32fa16bbc9accddf0842d3eaf661 Mon Sep 17 00:00:00 2001
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
index bc9260307c..19f167a91b 100644
--- a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
+++ b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
@@ -1,7 +1,7 @@
-From 7dbda1887aa19ab720aff22312f4caff2d575f62 Mon Sep 17 00:00:00 2001
+From c05a265bb03268460ce1f6a3d17d7cd38eb1e445 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-extended/cups/cups/libexecdir.patch b/meta/recipes-extended/cups/cups/libexecdir.patch
index 7ccad94f0f..c0c6f2e4b5 100644
--- a/meta/recipes-extended/cups/cups/libexecdir.patch
+++ b/meta/recipes-extended/cups/cups/libexecdir.patch
@@ -1,4 +1,4 @@
-From 1724f7bcdbcfdb445778f8a2e530c5c094c18c10 Mon Sep 17 00:00:00 2001
+From a94d8d987426e4a7ac79a98ca8dc6ee4ac3f7b9c Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Tue, 13 Jul 2021 12:56:30 +0100
 Subject: [PATCH] Use $libexecdir instead of hardcoding $prefix/lib as this
@@ -6,13 +6,12 @@ Subject: [PATCH] Use $libexecdir instead of hardcoding $prefix/lib as this
 
 Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@arm.com>
-
 ---
  config-scripts/cups-directories.m4 | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/config-scripts/cups-directories.m4 b/config-scripts/cups-directories.m4
-index 2033d47..230166e 100644
+index 069ee7b..2f67e5b 100644
 --- a/config-scripts/cups-directories.m4
 +++ b/config-scripts/cups-directories.m4
 @@ -239,7 +239,7 @@ AC_SUBST([CUPS_REQUESTS])
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
2.44.0


--===============3583628818396284484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/cups/cups-dbg: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-dbg: PKGSIZE changed from 8119520 to 8119760 (+0%)
packages/core2-64-poky-linux/cups/cups-dbg: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-dev: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-dev: PKGSIZE changed from 188704 to 188709 (+0%)
packages/core2-64-poky-linux/cups/cups-dev: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-doc: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-doc: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-lib: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-lib: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-libimage: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-libimage: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-locale-ca: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-locale-ca: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-locale-cs: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-locale-cs: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-locale-da: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-locale-da: PKGSIZE changed from 478934 to 478935 (+0%)
packages/core2-64-poky-linux/cups/cups-locale-da: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-locale-de: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-locale-de: PKGSIZE changed from 424603 to 424604 (+0%)
packages/core2-64-poky-linux/cups/cups-locale-de: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-locale-en: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-locale-en: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-locale-es: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-locale-es: PKGSIZE changed from 395645 to 395646 (+0%)
packages/core2-64-poky-linux/cups/cups-locale-es: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-locale-fr: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-locale-fr: PKGSIZE changed from 361012 to 361013 (+0%)
packages/core2-64-poky-linux/cups/cups-locale-fr: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-locale-it: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-locale-it: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-locale-ja: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-locale-ja: PKGSIZE changed from 407728 to 407729 (+0%)
packages/core2-64-poky-linux/cups/cups-locale-ja: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-locale-pt-br: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-locale-pt-br: PKGSIZE changed from 394263 to 394264 (+0%)
packages/core2-64-poky-linux/cups/cups-locale-pt-br: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-locale-ru: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-locale-ru: PKGSIZE changed from 416513 to 416514 (+0%)
packages/core2-64-poky-linux/cups/cups-locale-ru: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-locale-zh-cn: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-locale-zh-cn: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-src: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-src: PKGSIZE changed from 5972495 to 5972275 (-0%)
packages/core2-64-poky-linux/cups/cups-src: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-staticdev: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-staticdev: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-webif: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-webif: PKGSIZE changed from 1566146 to 1566162 (+0%)
packages/core2-64-poky-linux/cups/cups-webif: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups: PKGSIZE changed from 7323921 to 7323922 (+0%)
packages/core2-64-poky-linux/cups/cups: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups: SRC_URI changed from "https://github.com/OpenPrinting/cups/releases/download/v2.4.9/cups-2.4.9-source.tar.gz file://0001-use-echo-only-in-init.patch file://0002-don-t-try-to-run-generated-binaries.patch file://libexecdir.patch file://0004-cups-fix-multilib-install-file-conflicts.patch file://volatiles.99_cups file://cups-volatiles.conf" to "https://github.com/OpenPrinting/cups/releases/download/v2.4.10/cups-2.4.10-source.tar.gz file://0001-use-echo-only-in-init.patch file://0002-don-t-try-to-run-generated-binaries.patch file://libexecdir.patch file://0004-cups-fix-multilib-install-file-conflicts.patch file://volatiles.99_cups file://cups-volatiles.conf"
packages/core2-64-poky-linux/cups: PV changed from "2.4.9" to "2.4.10"

--===============3583628818396284484==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cups-upgrade-2.4.9-2.4.10.patch"

RnJvbSBkM2U5NWY2YmRiMGNhNjVjNzMyZDZkMjY3ZWEzYzhmYjk4YTU0NGJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdWwgMjAyNCAxMDozODoxOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGN1
cHM6IHVwZ3JhZGUgMi40LjkgLT4gMi40LjEwCgotLS0KIC4uLi9jdXBzL2N1cHMvMDAwMS11c2Ut
ZWNoby1vbmx5LWluLWluaXQucGF0Y2ggICB8IDExICsrKystLS0tLS0tCiAuLi4wMDItZG9uLXQt
dHJ5LXRvLXJ1bi1nZW5lcmF0ZWQtYmluYXJpZXMucGF0Y2ggfCAxNiArKysrKystLS0tLS0tLS0t
CiAuLi51cHMtZml4LW11bHRpbGliLWluc3RhbGwtZmlsZS1jb25mbGljdHMucGF0Y2ggfCAxMiAr
KysrLS0tLS0tLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvbGliZXhlY2Rpci5w
YXRjaCB8ICA1ICsrLS0tCiAuLi4vY3Vwcy97Y3Vwc18yLjQuOS5iYiA9PiBjdXBzXzIuNC4xMC5i
Yn0gICAgICAgfCAgMiArLQogNSBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAyOSBk
ZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy97Y3Vwc18yLjQu
OS5iYiA9PiBjdXBzXzIuNC4xMC5iYn0gKDUxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvY3Vwcy9jdXBzLzAwMDEtdXNlLWVjaG8tb25seS1pbi1pbml0LnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy8wMDAxLXVzZS1lY2hvLW9ubHktaW4taW5pdC5w
YXRjaAppbmRleCA4MGJiYWQwYTQ0Li5iYWE4MDA0ZTc0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLzAwMDEtdXNlLWVjaG8tb25seS1pbi1pbml0LnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvMDAwMS11c2UtZWNoby1vbmx5LWlu
LWluaXQucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIGEzZjRkOGJhOTdmNDY2OWE5NTk0M2E3
ZTY1ZWI2MWFhNDRjZTc5OTkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDU1ODVkOWMx
MjRmODEwN2IxZTQ5Nzg5MjNlZGJiOTRlMTIyMmMwMDUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBTYXVsIFdvbGQgPHNnd0BsaW51eC5pbnRlbC5jb20+CiBEYXRlOiBUaHUsIDEzIERl
YyAyMDEyIDE5OjAzOjUyIC0wODAwCi1TdWJqZWN0OiBbUEFUQ0ggMS80XSB1c2UgZWNobyBvbmx5
IGluIGluaXQKK1N1YmplY3Q6IFtQQVRDSF0gdXNlIGVjaG8gb25seSBpbiBpbml0CiAKIFVwc3Ry
ZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbZW1iZWRkZWQgc3BlY2lmaWNdCiBTaWduZWQtb2Zm
LWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KQEAgLTEwLDEw
ICsxMCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmlu
QGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKIAogZGlmZiAtLWdpdCBhL3NjaGVkdWxlci9jdXBzLnNoLmluIGIvc2NoZWR1bGVyL2N1cHMu
c2guaW4KLWluZGV4IDg5YWMzNmQuLjY2MThhMGYgMTAwNjQ0CitpbmRleCA3NGNjZTE4Li5jNTdm
MGRiIDEwMDY0NAogLS0tIGEvc2NoZWR1bGVyL2N1cHMuc2guaW4KICsrKyBiL3NjaGVkdWxlci9j
dXBzLnNoLmluCi1AQCAtNTAsNyArNTAsNyBAQCBjYXNlICJgdW5hbWVgIiBpbgorQEAgLTUxLDcg
KzUxLDcgQEAgY2FzZSAiYHVuYW1lYCIgaW4KICAJCUVDSE9fRVJST1I9OgogIAkJOzsKICAKQEAg
LTIyLDYgKzIyLDMgQEAgaW5kZXggODlhYzM2ZC4uNjYxOGEwZiAxMDA2NDQKICAJCUlTX09OPS9i
aW4vdHJ1ZQogIAkJaWYgdGVzdCAtZiAvZXRjL2luaXQuZC9mdW5jdGlvbnM7IHRoZW4KICAJCQku
IC9ldGMvaW5pdC5kL2Z1bmN0aW9ucwotLS0gCi0yLjE3LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy8wMDAyLWRvbi10LXRyeS10by1ydW4tZ2VuZXJhdGVk
LWJpbmFyaWVzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy8wMDAyLWRv
bi10LXRyeS10by1ydW4tZ2VuZXJhdGVkLWJpbmFyaWVzLnBhdGNoCmluZGV4IDJiYzI2ZWRiZmMu
LmEwM2RjNTVjNWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMv
MDAwMi1kb24tdC10cnktdG8tcnVuLWdlbmVyYXRlZC1iaW5hcmllcy5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLzAwMDItZG9uLXQtdHJ5LXRvLXJ1bi1nZW5lcmF0
ZWQtYmluYXJpZXMucGF0Y2gKQEAgLTEsMjEgKzEsMjAgQEAKLUZyb20gM2U5YTk2NWRjZDY1YWIy
ZDQwYjc1M2I2Zjc5MmExYTQ1NTkxODJhYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
NWQ5MjQzZTVhN2NiMzJmYTE2YmJjOWFjY2RkZjA4NDJkM2VhZjY2MSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEtvZW4gS29vaSA8a29lbkBkb21pbmlvbi50aHJ1aGVyZS5uZXQ+CiBE
YXRlOiBTdW4sIDMwIEphbiAyMDExIDE2OjM3OjI3ICswMTAwCi1TdWJqZWN0OiBbUEFUQ0ggMi80
XSBkb24ndCB0cnkgdG8gcnVuIGdlbmVyYXRlZCBiaW5hcmllcworU3ViamVjdDogW1BBVENIXSBk
b24ndCB0cnkgdG8gcnVuIGdlbmVyYXRlZCBiaW5hcmllcwogCiBVcHN0cmVhbS1TdGF0dXM6IElu
YXBwcm9wcmlhdGUgW2VtYmVkZGVkIHNwZWNpZmljXQogCiBTaWduZWQtb2ZmLWJ5OiBLb2VuIEtv
b2kgPGtvZW5AZG9taW5pb24udGhydWhlcmUubmV0PgotCiAtLS0KLSBwcGRjL01ha2VmaWxlIHwg
MzIgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KLSAxIGZpbGUgY2hhbmdlZCwgMTYg
aW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCisgcHBkYy9NYWtlZmlsZSB8IDQgKystLQor
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYg
LS1naXQgYS9wcGRjL01ha2VmaWxlIGIvcHBkYy9NYWtlZmlsZQotaW5kZXggMzJlMmUwYi4uZjE0
NzhkNCAxMDA2NDQKK2luZGV4IGUzNmVkMTEuLjNmZTk3ZTEgMTAwNjQ0CiAtLS0gYS9wcGRjL01h
a2VmaWxlCiArKysgYi9wcGRjL01ha2VmaWxlCi1AQCAtMTg2LDggKzE4Niw4IEBAIGdlbnN0cmlu
Z3M6CQlnZW5zdHJpbmdzLm8gbGliY3Vwc3BwZGMuYSAuLi9jdXBzLyQoTElCQ1VQU1NUQVRJQykg
XAorQEAgLTE4Nyw4ICsxODcsOCBAQCBnZW5zdHJpbmdzOgkJZ2Vuc3RyaW5ncy5vIGxpYmN1cHNw
cGRjLmEgLi4vY3Vwcy8kKExJQkNVUFNTVEFUSUMpIFwKICAJJChMRF9DWFgpICQoQVJDSEZMQUdT
KSAkKEFMTF9MREZMQUdTKSAtbyBnZW5zdHJpbmdzIGdlbnN0cmluZ3MubyBcCiAgCQlsaWJjdXBz
cHBkYy5hICQoTElOS0NVUFNTVEFUSUMpCiAgCSQoQ09ERV9TSUdOKSAtcyAiJChDT0RFX1NJR05f
SURFTlRJVFkpIiAkQApAQCAtMjYsNiArMjUsMyBAQCBpbmRleCAzMmUyZTBiLi5mMTQ3OGQ0IDEw
MDY0NAogIAogIAogICMKLS0tIAotMi4xNy4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC9jdXBzL2N1cHMvMDAwNC1jdXBzLWZpeC1tdWx0aWxpYi1pbnN0YWxsLWZpbGUtY29u
ZmxpY3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy8wMDA0LWN1cHMt
Zml4LW11bHRpbGliLWluc3RhbGwtZmlsZS1jb25mbGljdHMucGF0Y2gKaW5kZXggYmM5MjYwMzA3
Yy4uMTlmMTY3YTkxYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vw
cy8wMDA0LWN1cHMtZml4LW11bHRpbGliLWluc3RhbGwtZmlsZS1jb25mbGljdHMucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy8wMDA0LWN1cHMtZml4LW11bHRpbGli
LWluc3RhbGwtZmlsZS1jb25mbGljdHMucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIDdkYmRh
MTg4N2FhMTlhYjcyMGFmZjIyMzEyZjRjYWZmMmQ1NzVmNjIgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIGMwNWEyNjViYjAzMjY4NDYwY2UxZjZhM2QxN2Q3Y2QzOGViMWU0NDUgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLYWkgS2FuZyA8a2FpLmthbmdAd2luZHJpdmVyLmNv
bT4KIERhdGU6IFdlZCwgMyBPY3QgMjAxOCAwMDoyNzoxMSArMDgwMAotU3ViamVjdDogW1BBVENI
IDQvNF0gY3VwczogZml4IG11bHRpbGliIGluc3RhbGwgZmlsZSBjb25mbGljdHMKK1N1YmplY3Q6
IFtQQVRDSF0gY3VwczogZml4IG11bHRpbGliIGluc3RhbGwgZmlsZSBjb25mbGljdHMKIAogQENV
UFNfU0VSVkVSQklOQCBpcyAke2xpYmRpcn0gcmVsYXRlZCB0aGF0IGNhdXNlcyBtdWx0aWxpYiBp
bnN0YWxsIGZpbGUKIGNvbmZsaWN0LiBSZW1vdmUgQENVUFNfU0VSVkVSQklOQCBmcm9tIHRoZSBj
b21tZW50IGxpbmUgb2YgY3Vwcy1maWxlcy5jb25mIHRvCkBAIC0xMCwxNiArMTAsMTUgQEAgYXZv
aWQgdGhlIGNvbmZsaWN0LgogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtPRSBzcGVj
aWZpY10KIAogU2lnbmVkLW9mZi1ieTogS2FpIEthbmcgPGthaS5rYW5nQHdpbmRyaXZlci5jb20+
Ci0KIC0tLQogIGNvbmYvY3Vwcy1maWxlcy5jb25mLmluIHwgMiArLQogIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvY29uZi9jdXBz
LWZpbGVzLmNvbmYuaW4gYi9jb25mL2N1cHMtZmlsZXMuY29uZi5pbgotaW5kZXggNGE3OGJhNi4u
MDNjNjU4MiAxMDA2NDQKK2luZGV4IDkzNTg0YTEuLjY1YjcwNTIgMTAwNjQ0CiAtLS0gYS9jb25m
L2N1cHMtZmlsZXMuY29uZi5pbgogKysrIGIvY29uZi9jdXBzLWZpbGVzLmNvbmYuaW4KLUBAIC03
Myw3ICs3Myw3IEBAIFBhZ2VMb2cgQENVUFNfTE9HRElSQC9wYWdlX2xvZworQEAgLTY3LDcgKzY3
LDcgQEAgUGFnZUxvZyBAQ1VQU19MT0dESVJAL3BhZ2VfbG9nCiAgI1JlcXVlc3RSb290IEBDVVBT
X1JFUVVFU1RTQAogIAogICMgTG9jYXRpb24gb2YgaGVscGVyIHByb2dyYW1zLi4uCkBAIC0yOCw2
ICsyNywzIEBAIGluZGV4IDRhNzhiYTYuLjAzYzY1ODIgMTAwNjQ0CiAgCiAgIyBTU0wvVExTIGtl
eWNoYWluIGZvciB0aGUgc2NoZWR1bGVyLi4uCiAgI1NlcnZlcktleWNoYWluIEBDVVBTX1NFUlZF
UktFWUNIQUlOQAotLS0gCi0yLjE3LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2N1cHMvY3Vwcy9saWJleGVjZGlyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1
cHMvY3Vwcy9saWJleGVjZGlyLnBhdGNoCmluZGV4IDdjY2FkOTRmMGYuLmMwYzZmMmU0YjUgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvbGliZXhlY2Rpci5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzL2xpYmV4ZWNkaXIucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIDE3MjRmN2JjZGJjZmRiNDQ1Nzc4ZjhhMmU1MzBjNWMwOTRj
MThjMTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGE5NGQ4ZDk4NzQyNmU0YTdhYzc5
YTk4Y2E4ZGM2ZWU0YWMzZjdiOWMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb3Nz
IEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KIERhdGU6IFR1ZSwgMTMgSnVsIDIwMjEgMTI6
NTY6MzAgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gVXNlICRsaWJleGVjZGlyIGluc3RlYWQgb2Yg
aGFyZGNvZGluZyAkcHJlZml4L2xpYiBhcyB0aGlzCkBAIC02LDEzICs2LDEyIEBAIFN1YmplY3Q6
IFtQQVRDSF0gVXNlICRsaWJleGVjZGlyIGluc3RlYWQgb2YgaGFyZGNvZGluZyAkcHJlZml4L2xp
YiBhcyB0aGlzCiAKIFVwc3RyZWFtLVN0YXR1czogUGVuZGluZwogU2lnbmVkLW9mZi1ieTogUm9z
cyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+Ci0KIC0tLQogIGNvbmZpZy1zY3JpcHRzL2N1
cHMtZGlyZWN0b3JpZXMubTQgfCA0ICsrLS0KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlnLXNjcmlwdHMvY3Vwcy1k
aXJlY3Rvcmllcy5tNCBiL2NvbmZpZy1zY3JpcHRzL2N1cHMtZGlyZWN0b3JpZXMubTQKLWluZGV4
IDIwMzNkNDcuLjIzMDE2NmUgMTAwNjQ0CitpbmRleCAwNjllZTdiLi4yZjY3ZTViIDEwMDY0NAog
LS0tIGEvY29uZmlnLXNjcmlwdHMvY3Vwcy1kaXJlY3Rvcmllcy5tNAogKysrIGIvY29uZmlnLXNj
cmlwdHMvY3Vwcy1kaXJlY3Rvcmllcy5tNAogQEAgLTIzOSw3ICsyMzksNyBAQCBBQ19TVUJTVChb
Q1VQU19SRVFVRVNUU10pCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9j
dXBzXzIuNC45LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwc18yLjQuMTAuYmIK
c2ltaWxhcml0eSBpbmRleCA1MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1
cHMvY3Vwc18yLjQuOS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vw
c18yLjQuMTAuYmIKaW5kZXggZTBhMzUyMjAwNC4uZTE2YWQ0N2NmNSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwc18yLjQuOS5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvY3Vwcy9jdXBzXzIuNC4xMC5iYgpAQCAtMiw0ICsyLDQgQEAgcmVxdWlyZSBjdXBz
LmluYwogCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0zYjgzZWY5NjM4
N2YxNDY1NWZjODU0ZGRjM2M2YmQ1NyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM4ZmJmNDUz
NWExMDU1NDExM2UwMTNkNTRmZWRkYTAzZWU4ODAwN2VhNmE5NzYxZDYyNmEwNGUxZTQ0ODllOGMi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDc1NzU3YzJiYzBmN2EyOGIwMmVlNGQ1MmNhOWU0YjFh
YTFiYTJhZmZlMTZiOTg1ODU0ZjUzMzY5NDBlNWFkNyIKLS0gCjIuNDQuMAoK

--===============3583628818396284484==--

