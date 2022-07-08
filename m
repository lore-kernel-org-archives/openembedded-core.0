Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ADF8C433EF
	for <webhook@archiver.kernel.org>; Fri,  8 Jul 2022 08:00:24 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.4999.1657267219908303198
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 01:00:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.146.13,
 mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 26880EQf013188
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 8 Jul 2022 01:00:19 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 26880A1F026488
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 8 Jul 2022 01:00:14 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 8 Jul 2022 01:00:10 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 8 Jul 2022 01:00:09 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] vim: not adjust script pathnames for native scripts either
Date: Fri, 8 Jul 2022 16:00:08 +0800
Message-ID: <20220708080008.2690000-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Jul 2022 08:00:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167816

From: Mingli Yu <mingli.yu@windriver.com>

After the below commit introduced, the shebang size of native scripts
is also checked, so rework the patch to fix the gap.
377fe11bc0 insane.bbclass: Make do_qa_staging check shebangs

Fixes:
   ERROR: QA Issue: : /work/x86_64-linux/vim-native/9.0.0005-r0/sysroot-destdir/work/x86_64-linux/vim-native/9.0.0005-r0/recipe-sysroot-native/usr/share/vim/vim90/tools/mve.awk maximum shebang size exceeded, the maximum size is 128. [shebang-size]
   ERROR: QA Issue: : /work/x86_64-linux/vim-native/9.0.0005-r0/sysroot-destdir/work/x86_64-linux/vim-native/9.0.0005-r0/recipe-sysroot-native/usr/share/vim/vim90/tools/efm_perl.pl maximum shebang size exceeded, the maximum size is 128. [shebang-size]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../vim/files/no-path-adjust.patch            | 35 +++++++++++--------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-support/vim/files/no-path-adjust.patch b/meta/recipes-support/vim/files/no-path-adjust.patch
index 9d6da80913..908459a95e 100644
--- a/meta/recipes-support/vim/files/no-path-adjust.patch
+++ b/meta/recipes-support/vim/files/no-path-adjust.patch
@@ -1,4 +1,7 @@
-vim: do not adjust script pathnames
+From 4125a1ccb82fd53d003acdc34e462f238f0c4f0d Mon Sep 17 00:00:00 2001
+From: Joe Slater <joe.slater@windriver.com>
+Date: Fri, 8 Jul 2022 11:03:22 +0800
+Subject: [PATCH] vim: do not adjust script pathnames
 
 When cross-compiling, we do not want to reference the host versions of
 things like perl and awk.
@@ -6,24 +9,28 @@ things like perl and awk.
 Upstream-Status: Pending
 
 Signed-off-by: Joe Slater <joe.slater@windriver.com>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/Makefile | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
 
-Index: git/src/Makefile
-===================================================================
---- git.orig/src/Makefile
-+++ git/src/Makefile
-@@ -2565,11 +2565,14 @@ installtools: $(TOOLS) $(DESTDIR)$(exec_
+diff --git a/src/Makefile b/src/Makefile
+index c9513a632..7a7cbdc43 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -2534,11 +2534,7 @@ installtools: $(TOOLS) $(DESTDIR)$(exec_prefix) $(DEST_BIN) \
  		 rm -rf $$cvs; \
  	      fi
  	-chmod $(FILEMOD) $(DEST_TOOLS)/*
 -# replace the path in some tools
-+
-+# replace the path in some tools, but not when cross-compiling
-+ifneq ($(CROSS_COMPILING),1)
- 	perlpath=`./which.sh perl` && sed -e "s+/usr/bin/perl+$$perlpath+" $(TOOLSSOURCE)/efm_perl.pl >$(DEST_TOOLS)/efm_perl.pl
- 	awkpath=`./which.sh nawk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; if test -z "$$awkpath"; then \
- 		awkpath=`./which.sh gawk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; if test -z "$$awkpath"; then \
- 		awkpath=`./which.sh awk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; fi; fi
-+endif
+-	perlpath=`./which.sh perl` && sed -e "s+/usr/bin/perl+$$perlpath+" $(TOOLSSOURCE)/efm_perl.pl >$(DEST_TOOLS)/efm_perl.pl
+-	awkpath=`./which.sh nawk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; if test -z "$$awkpath"; then \
+-		awkpath=`./which.sh gawk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; if test -z "$$awkpath"; then \
+-		awkpath=`./which.sh awk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; fi; fi
++# not replace the path in some tools
  	-chmod $(SCRIPTMOD) `grep -l "^#!" $(DEST_TOOLS)/*`
  
  # install the language specific files for tools, if they were unpacked
+-- 
+2.25.1
+
-- 
2.25.1


