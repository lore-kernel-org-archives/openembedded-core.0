Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A06C8303F
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 19:33:00 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.47928.1756150373174284051
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Aug 2025 12:32:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=LnZCMvT+;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20250825193250a68a86e2f46ab28600-w0farv@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250825193250a68a86e2f46ab28600
        for <openembedded-core@lists.openembedded.org>;
        Mon, 25 Aug 2025 21:32:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=kUoYGhXO1MXu/yKaCOvoKnTcnTYcK/OtPiEYCkunQDM=;
 b=LnZCMvT+0MdV1Z6zQy3O+hhSjBUbTasEUaMC/WLJ+eEP3jOncJQVyb43IWyamJjkzZy7SE
 5JDfBJYX3RjpF4rMQ10nywZXRVB7cBWMUM6X3XFwv8o9LezA+Lk1fbf0UUWQFiZnh+rElJz1
 asuMktAtJJPvVrIEqAS4v6tjKR/DCEla4sbcMFODpuRa9QvpQKct3U+QZLe41If7jIYyjUtD
 QT855EcOpQU8v3Y1+5HGmBIVaQ+ALZis1Rp46PHFpsjyFMOngRKcdEjE2xFV+vMM+VGcBhla
 BpE4FJZqG9R2AVcJ48qyCV0Q9bmVFYVtXZe8y+O32ShiNXIJVCWGeynA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Mingli Yu <mingli.yu@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 1/2] vim: not adjust script pathnames for native scripts either
Date: Mon, 25 Aug 2025 21:31:19 +0200
Message-Id: <20250825193120.813696-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 19:33:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222421

From: Mingli Yu <mingli.yu@windriver.com>

After the below commit introduced, the shebang size of native scripts
is also checked, so rework the patch to fix the gap.
377fe11bc0 insane.bbclass: Make do_qa_staging check shebangs

Fixes:
   ERROR: QA Issue: : /work/x86_64-linux/vim-native/9.0.0005-r0/sysroot-destdir/work/x86_64-linux/vim-native/9.0.0005-r0/recipe-sysroot-native/usr/share/vim/vim90/tools/mve.awk maximum shebang size exceeded, the maximum size is 128. [shebang-size]
   ERROR: QA Issue: : /work/x86_64-linux/vim-native/9.0.0005-r0/sysroot-destdir/work/x86_64-linux/vim-native/9.0.0005-r0/recipe-sysroot-native/usr/share/vim/vim90/tools/efm_perl.pl maximum shebang size exceeded, the maximum size is 128. [shebang-size]

(From OE-Core rev: 79232458b9cdc741a2049d83839af73f58a5554c)

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
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

