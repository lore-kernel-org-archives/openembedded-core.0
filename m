Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9879CD98E0
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:04:32 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105066.1781424266770613271
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:04:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QB0ecNNM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso19752795e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424265; x=1782029065; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gr8sYvKHPo8Wr887AlE9v1Yphtfl4JDRJKmGAWuX9n8=;
        b=QB0ecNNMocQ/Ec8zb9JiCltcgCSlTWBJFsCGlm+ZP82xlEoLYS4HL8a66Ndsd0eOFN
         5eIK+7lsORzteLfyrN1e+w6WcEvGpf9ihSxUAHLyk+0OBchVPV+8Gi+ekevEIxFpIekR
         kb9NHKcprAuJ09yzuW2NkgkM9rhe9KRXcCPvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424265; x=1782029065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gr8sYvKHPo8Wr887AlE9v1Yphtfl4JDRJKmGAWuX9n8=;
        b=gZVgS9Z2Qge3GjjPG0a0pC8GI2KFtyRrin3AK/v87niiEK0BcGDrHEDX1PQE5tHjZq
         q2dpyFq2pYrmnGYpo/2ex4ONlOt+sJWY9q6wfCnjz/+w1NKpqlllES59wKrSHK7BtAEa
         va+01bcb4fChKeFZK60HMo3aqIge2w6Afj55YNmLWppWijDsoAHir3M/HU4aIdQXEuBb
         u0RoJMAE98I//k45JS8MoGCXR9lw2B0nkZHeDc0RNL1DXoJeS09pgFhfQMcLx1UMlxJq
         6yF2hHSWTfeengTIHw+sjOclPjIxzx09oWF74fWS4isFVSSl5OOZztQ/nUmn2lDU/eOP
         d9Tg==
X-Gm-Message-State: AOJu0Yxqc8luDrJqIhmJFnOfmXSzhN755YWIJXrHj5wrSxE4IB1PK1Lp
	6ckDNwvM+P/fkF8sO9n62u/b9D3/qfCKGbDthiriIBRLbaMOdwOfwvspwvsXfVwAi1dWPIXQFsO
	JtT5Z
X-Gm-Gg: Acq92OEFeINa9fBjR5h8HfrxD0twdLBfFcycrcvZklCUkeeqIKQcYjWbPstxEeGJ8jF
	6QHPTBo5HrjszMFs1KTEbPWKc0+OsYE3Em+qqH9/hrctX54reg0kEZTiUc9BDdF2iLRFaW1fMTG
	Lq8VgLPsSixyfllAXwu5fyDq9bwaksc3B3b2DC47H+oBhlF8ZuEt4MLtJJCcKzpn5Bhc7OvuDUr
	+2ocoP173IHqOOtlQBMK3/lp1h1xjuX7MX+KQDwLWO+K2lFrtgbc6HyCT3tMOUBWXUT6bIULhUh
	JfyauRnXU2ljp2Rd4dA9kCRZwfxUzF+3f6JljnvJq/0rxODJugdc4oWLm9sKqIel/baKZIGryNA
	RtTezxCDdGt1qtyUum9mGcNs+vy9L/rtZ/L39fbBTEO1LZgjUdbCK4lUOo24FyoyTzVtlwB13uo
	oEuWfuozdsD+jNOgEcuZ9QYZntzp0efgQncBr6B9CRPfkFT4r0zJ0r
X-Received: by 2002:a05:600c:83c9:b0:490:e1e6:cb69 with SMTP id 5b1f17b1804b1-4922005167bmr66935665e9.7.1781424264838;
        Sun, 14 Jun 2026 01:04:24 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.04.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:04:24 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 49/56] tcl8: upgrade 8.6.17 -> 8.6.18
Date: Sun, 14 Jun 2026 09:03:00 +0100
Message-ID: <20260614080307.4017177-49-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238733

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...neric-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch | 4 ++--
 meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch    | 6 +++---
 .../tcltk8/tcl8/fix_non_native_build_issue.patch            | 4 ++--
 meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch      | 6 +++---
 .../tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch     | 4 ++--
 .../tcltk8/{tcl8_8.6.17.bb => tcl8_8.6.18.bb}               | 2 +-
 6 files changed, 13 insertions(+), 13 deletions(-)
 rename meta/recipes-devtools/tcltk8/{tcl8_8.6.17.bb => tcl8_8.6.18.bb} (97%)

diff --git a/meta/recipes-devtools/tcltk8/tcl8/0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch b/meta/recipes-devtools/tcltk8/tcl8/0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch
index 6ba7ff4340c..9cc29f773a0 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch
@@ -1,4 +1,4 @@
-From 7d404d1827ffb69a2aa7b60c10b435c6f47f7bfb Mon Sep 17 00:00:00 2001
+From 9f78045af22aa2217d7ec0233348983751223c89 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 18 Aug 2023 12:25:11 +0200
 Subject: [PATCH] generic/tcl.h: use Tcl_WideInt for seconds in Tcl_Time
@@ -19,7 +19,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/generic/tcl.h b/generic/tcl.h
-index d8fd70a..ffff4b1 100644
+index 83f07e6..16e99f8 100644
 --- a/generic/tcl.h
 +++ b/generic/tcl.h
 @@ -1425,7 +1425,7 @@ typedef enum {
diff --git a/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch b/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
index ad91b9ffb32..c346a21a197 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
@@ -1,4 +1,4 @@
-From bfca2e4ae32ab546f796d9c7ff7cbf542d5b2bfe Mon Sep 17 00:00:00 2001
+From 0f47a7716dfd5166d44efee2ed1f4788914f0881 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 22 Nov 2022 18:48:27 +0800
 Subject: [PATCH] tcl: update the header location
@@ -26,7 +26,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  3 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index 45e7b76..5a46e6a 100644
+index 54bb664..98d6192 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
 @@ -57,7 +57,7 @@ SCRIPT_INSTALL_DIR	= $(INSTALL_ROOT)$(TCL_LIBRARY)
@@ -39,7 +39,7 @@ index 45e7b76..5a46e6a 100644
  # Path to the private tcl header dir:
  PRIVATE_INCLUDE_DIR	= @PRIVATE_INCLUDE_DIR@
 diff --git a/unix/configure.in b/unix/configure.in
-index 50b3e03..8a33d0c 100644
+index 00f16ae..640060b 100644
 --- a/unix/configure.in
 +++ b/unix/configure.in
 @@ -775,7 +775,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
diff --git a/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch b/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch
index 07a1f4d0407..33f6e1fd33c 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch
@@ -1,4 +1,4 @@
-From ad7847a15163f12c24d8ecb50dffa289876dc830 Mon Sep 17 00:00:00 2001
+From 18ed2dc77a50f68f56a9e353c072faf4fff0b303 Mon Sep 17 00:00:00 2001
 From: Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: Fri, 13 Aug 2010 12:24:00 -0700
 Subject: [PATCH] tcl: fix a build issue
@@ -10,7 +10,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 10 insertions(+), 10 deletions(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index ab2e7b5..45e7b76 100644
+index 3d52fe7..54bb664 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
 @@ -723,7 +723,7 @@ tcltest-real:
diff --git a/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch b/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
index 0f8bd062acd..9420d20d8d1 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
@@ -1,4 +1,4 @@
-From 2af07e2d0f0cb9f42ff982ce257e2067dcf1ec77 Mon Sep 17 00:00:00 2001
+From 94ef831d7052c819dddab92f22f1fc8319dd27bf Mon Sep 17 00:00:00 2001
 From: Richard Purdie <rpurdie@linux.intel.com>
 Date: Wed, 9 Dec 2009 23:59:44 +0000
 Subject: [PATCH] tcl: Add tcltk from OE.dev but with legacy staging function
@@ -11,7 +11,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  2 files changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index 3efdfec..ab2e7b5 100644
+index 23f86c8..3d52fe7 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
 @@ -812,7 +812,10 @@ install-binaries: binaries
@@ -27,7 +27,7 @@ index 3efdfec..ab2e7b5 100644
  	@$(INSTALL_PROGRAM) ${TCL_EXE} "$(BIN_INSTALL_DIR)/tclsh$(VERSION)${EXE_SUFFIX}"
  	@echo "Installing tclConfig.sh to $(CONFIG_INSTALL_DIR)/"
 diff --git a/unix/tcl.m4 b/unix/tcl.m4
-index 7f5464e..cd8d929 100644
+index cd89170..122aff0 100644
 --- a/unix/tcl.m4
 +++ b/unix/tcl.m4
 @@ -1378,6 +1378,9 @@ AC_DEFUN([SC_CONFIG_CFLAGS], [
diff --git a/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch b/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
index 12e1937aa11..d8f42864097 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
@@ -1,4 +1,4 @@
-From 0b479a0dc845f9926cb40c13d86e55391a89fe98 Mon Sep 17 00:00:00 2001
+From 36331191e3443603277b3c2abbfa4c1bdf0fdb82 Mon Sep 17 00:00:00 2001
 From: "Song.Li" <Song.Li@windriver.com>
 Date: Wed, 1 Aug 2012 19:05:51 +0800
 Subject: [PATCH] tcl:install tcl to lib64 instead of lib on 64bit target
@@ -17,7 +17,7 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/unix/configure.in b/unix/configure.in
-index ed07ca5..50b3e03 100644
+index 4078970..00f16ae 100644
 --- a/unix/configure.in
 +++ b/unix/configure.in
 @@ -774,7 +774,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
diff --git a/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb b/meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb
similarity index 97%
rename from meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb
rename to meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb
index 1b08fda5fa6..545c1cdc608 100644
--- a/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb
+++ b/meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb
@@ -24,7 +24,7 @@ SRC_URI = "${BASE_SRC_URI} \
            file://run-ptest \
            file://0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch \
            "
-SRC_URI[sha256sum] = "a1d8cbe44b38beaa29fc2130c4e7b79b8bf02e2bcc028ffefd7a25a2122202a0"
+SRC_URI[sha256sum] = "1880b6337de72431174511419550bb4cf1327b7c8200a5466d1c4eb3ecac5132"
 
 SRC_URI:class-native = "${BASE_SRC_URI}"
 

