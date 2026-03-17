Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4010BF506CF
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 06:16:18 +0000 (UTC)
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70218.1773728177064489064
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 23:16:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=IzBi9Y/M;
 spf=pass (domain: mvista.com, ip: 74.125.82.48, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1271257ae53so7246879c88.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 23:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1773728176; x=1774332976; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J/M1iXkFW/Wau9W0dk1E88Q8Yr5onnKVqzpyGDsEO4g=;
        b=IzBi9Y/MqgQklCtThu1ujbzxXlq2jkABnTdYdVJW1cSEXLJCkTbW/mg7D9pVtvtbAQ
         x+LiS8h7sk0987yYQz75YM4KBTbNWpvCyVc0wj0/UlnADKeI3Lwi+wryJAV9h45d480F
         ccTfS0ZhsOUK1YFbjk4ciPAgQA6Py0vQ8XWw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773728176; x=1774332976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/M1iXkFW/Wau9W0dk1E88Q8Yr5onnKVqzpyGDsEO4g=;
        b=lVk9eY9BGR2Fc6BU26G9RYFAGAxx/fvCBsH/HtqF99CU3J74S5CL6qUZsvy58jdnDH
         fjDO0BUaVQWHgSdvUmI2Y8NoKZ/q1FjeGnDLmYicBGNe+Y8YdC26BuB8LzNMdTFHzQfM
         LFqFxTokfaWQwDcgwoQ6B4rwBBMTYxp8XtHhOnZCgIHMO7BYVBLekPRRQmutE8eQ5oap
         CTEMrK7NkB/1RhltFK8pfgMzMTwutTV9hoE2C1KgcEhhMfHoUMvWki5xi/gnfpV/LhoY
         7Nq8JN5XRzwyIIRKEUeQK/bxfb9k9qxei6m3bRwfmt2CMgoAFQ6HMo+4HE0aK7kt1JN6
         RQow==
X-Gm-Message-State: AOJu0YxZ0sANMtFHulMx537jx9pgUpuKmakoJ17IOzi6bS8nQ+7q4YEs
	n2fWeHM5yelmycRbtHPhzSAu8jLE8n5xim+XyDTI0OiHYHI0bclnutYxJw4KRPckZXpnTNnj6Yy
	9tepW
X-Gm-Gg: ATEYQzwcUE9xV6+tI8lvqMw5SGrwv74Rr6maRq2U1fp5bmblZg+AL9O/cxW3H3M0Bc7
	HoBZjWLeuTmyBTdGjXipoyysIvcCcVJhntPX1MP71tvUzlMSUIJf9+bi5YVN8+/NNH2dzggxe2n
	DrVcufNP51QtfnqTSQQeOQ8iflfM5qmDpkZQiMRj2XA75KOPZ8L2X6sOsRLTxT6c0eGC+ig8Oq4
	Xo08j8JUObGfSR35VlJJmv4sHCbEwHOnE2KV4aYAWT8sEqrbNS/+0tuReQr1UdzV+vG7mCoNBnF
	wopxHGfP3fcJF8Q4dl+fAnrWlXpLEmxIdrfBJadQlxb+m/CUzUVQMWf7yC7QguMXFPJJ56e2b7q
	tmpqw8mWIVaysHe0uR1YScSfNDAed29t1F26GSPPF1jvbgD4VMmtmrN/hTR/zYwVRMrMwYoA/Ai
	lqpX6vEBoTum3xDYk6GBFDDtXTj+xNA9dIPobM
X-Received: by 2002:a05:7022:4a3:b0:127:5cd6:fa45 with SMTP id a92af1059eb24-128f3d33acfmr6718311c88.14.1773728176202;
        Mon, 16 Mar 2026 23:16:16 -0700 (PDT)
Received: from MVIN00013.mvista.com ([152.59.0.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab3eec8fsm17788437eec.13.2026.03.16.23.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 23:16:15 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH 1/2] vim: upgrade 9.1.1683 -> 9.1.2128
Date: Tue, 17 Mar 2026 11:44:04 +0530
Message-ID: <20260317061405.278524-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 06:16:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233299

Removes CVE-2025-66476 from CVE metrics.
It's fixed in 9.1.1947, but only affects Vim for Windows.

Rebased patches and resolved conflicts.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../vim/files/0001-src-Makefile-improve-reproducibility.patch | 4 ++--
 meta/recipes-support/vim/files/disable_acl_header_check.patch | 4 ++--
 meta/recipes-support/vim/files/no-path-adjust.patch           | 2 +-
 meta/recipes-support/vim/vim.inc                              | 4 ++--
 meta/recipes-support/vim/vim_9.1.bb                           | 3 ---
 5 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch b/meta/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch
index 0741745adc..ae78059296 100644
--- a/meta/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch
+++ b/meta/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch
@@ -20,7 +20,7 @@ diff --git a/src/Makefile b/src/Makefile
 index 32c0d97d1..97c754673 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -3138,16 +3138,10 @@ auto/pathdef.c: Makefile auto/config.mk
+@@ -3143,16 +3143,10 @@ auto/pathdef.c: Makefile auto/config.mk
  	-@echo '#include "vim.h"' >> $@
  	-@echo 'char_u *default_vim_dir = (char_u *)"$(VIMRCLOC)";' | $(QUOTESED) >> $@
  	-@echo 'char_u *default_vimruntime_dir = (char_u *)"$(VIMRUNTIMEDIR)";' | $(QUOTESED) >> $@
@@ -29,7 +29,7 @@ index 32c0d97d1..97c754673 100644
 -	-@echo 'char_u *compiled_user = (char_u *)"' | tr -d $(NL) >> $@
 -	-@if test -n "$(COMPILEDBY)"; then \
 -		echo "$(COMPILEDBY)" | tr -d $(NL) >> $@; \
--		else ((logname) 2>/dev/null || whoami) | tr -d $(NL) >> $@; fi
+-		else (logname 2>/dev/null || whoami) | tr -d $(NL) >> $@; fi
 -	-@echo '";' >> $@
 -	-@echo 'char_u *compiled_sys = (char_u *)"' | tr -d $(NL) >> $@
 -	-@if test -z "$(COMPILEDBY)"; then hostname | tr -d $(NL) >> $@; fi
diff --git a/meta/recipes-support/vim/files/disable_acl_header_check.patch b/meta/recipes-support/vim/files/disable_acl_header_check.patch
index 2a5487e685..b34f91c9b6 100644
--- a/meta/recipes-support/vim/files/disable_acl_header_check.patch
+++ b/meta/recipes-support/vim/files/disable_acl_header_check.patch
@@ -17,7 +17,7 @@ diff --git a/src/configure.ac b/src/configure.ac
 index cdb818519..dafb7d6ce 100644
 --- a/src/configure.ac
 +++ b/src/configure.ac
-@@ -3400,7 +3400,7 @@ AC_CHECK_HEADERS(stdint.h stdlib.h string.h \
+@@ -3440,7 +3440,7 @@ AC_CHECK_HEADERS(stdint.h stdlib.h string.h \
  	sys/systeminfo.h locale.h sys/stream.h termios.h \
  	libc.h sys/statfs.h poll.h sys/poll.h pwd.h \
  	utime.h sys/param.h sys/ptms.h libintl.h libgen.h \
@@ -26,7 +26,7 @@ index cdb818519..dafb7d6ce 100644
  	sys/access.h sys/sysinfo.h wchar.h wctype.h)
  
  dnl sys/ptem.h depends on sys/stream.h on Solaris
-@@ -4137,6 +4137,7 @@ AC_ARG_ENABLE(acl,
+@@ -4182,6 +4182,7 @@ AC_ARG_ENABLE(acl,
  	, [enable_acl="yes"])
  if test "$enable_acl" = "yes"; then
    AC_MSG_RESULT(no)
diff --git a/meta/recipes-support/vim/files/no-path-adjust.patch b/meta/recipes-support/vim/files/no-path-adjust.patch
index 1b380393d8..a4efce491e 100644
--- a/meta/recipes-support/vim/files/no-path-adjust.patch
+++ b/meta/recipes-support/vim/files/no-path-adjust.patch
@@ -18,7 +18,7 @@ diff --git a/src/Makefile b/src/Makefile
 index c9513a632..7a7cbdc43 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -2552,11 +2552,7 @@ installtools: $(TOOLS) $(DESTDIR)$(exec_prefix) $(DEST_BIN) \
+@@ -2531,11 +2531,7 @@ installtools: $(TOOLS) $(DESTDIR)$(exec_prefix) $(DEST_BIN) \
  		 rm -rf $$cvs; \
  	      fi
  	-chmod $(FILEMOD) $(DEST_TOOLS)/*
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 289f31be70..0ce6aa71a4 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1683"
-SRCREV = "b922b30cfe4c044c83bac3cc908084ed20a83598"
+PV .= ".2128"
+SRCREV = "392b428d1239e963020b73682cd03f17ffb538b3"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
diff --git a/meta/recipes-support/vim/vim_9.1.bb b/meta/recipes-support/vim/vim_9.1.bb
index e536d4ce4b..f358e61132 100644
--- a/meta/recipes-support/vim/vim_9.1.bb
+++ b/meta/recipes-support/vim/vim_9.1.bb
@@ -17,6 +17,3 @@ ALTERNATIVE_LINK_NAME[xxd] = "${bindir}/xxd"
 # in many places for _FORTIFY_SOURCE=2.  Security flags become part of CC.
 #
 lcl_maybe_fortify = "${@oe.utils.conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE=1',d)}"
-
-# not-applicable-platform: Issue only applies on Windows
-CVE_CHECK_IGNORE += "CVE-2025-66476"
-- 
2.50.1


