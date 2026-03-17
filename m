Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D95DCF53D84
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 05:43:27 +0000 (UTC)
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69647.1773726202212179049
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 22:43:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=XAsSftxg;
 spf=pass (domain: mvista.com, ip: 74.125.82.44, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1271257ae53so7218920c88.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 22:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1773726201; x=1774331001; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G+q3FQZlIXzrBpN//E+MeU3kfGXON87QGRHWH7JNfI0=;
        b=XAsSftxgY0webphLTHAF0Yxb+Z3xQlzEihcRuD4Rvc7V7cS2J06S64Jx7J110Uf6ue
         uSDY9NXG9gHi6gEpx2PxfgUzSZqtMUTT1w5mOEdadgoT66X4hM7f8kTB2gcTZJF7pdTo
         +tcQEZFyBAhR2HX4+08JU+tGZdLSMzGsnv4s4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773726201; x=1774331001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+q3FQZlIXzrBpN//E+MeU3kfGXON87QGRHWH7JNfI0=;
        b=OZ1UKtB7Bz6FjCpePy1Ds0QlhJgztDKWjGSV8pag1ucpn+xBStAzRN68V/THKAxGk3
         ET4BHQM6sSmF0NmFI6sbhyEI5vRwzSjJtVHuxWS9f6q0ljHsQR2opxkQGpBWQAzXwLzl
         kvQ+i/vcz42NwPbNI2HOvh3ky6v6e7cwcYQootpJncLNDrPrvpbOILuvuUqrO1lNHSOe
         5QOk5FUNQtFSV0h8tyraGCtmlprs6Wgez8fkblG8PhSP/EL4+hPMmDjmooJ25Kip/GxL
         HsT6PZiculM2gPvMJIrSMDx4x9E6Vz5l00oCt6PG+j3okIiq/MdF3LhhRL2hy89IG0BH
         WJCA==
X-Gm-Message-State: AOJu0YzmHpoRKtXCls6zBAKvVsUkUy3R26KT3WTM3qEu3cX5KGmJRH01
	mOEIx5cAMuZb4zfgIJZM0SEuaK9qkEObM3E7aYm7q7AyhByjHn8xDMQdy+ZDMG9eYO72M7NZS47
	wUS/s
X-Gm-Gg: ATEYQzyqZkj1t6NOmGGqNtbathWqVIGWnhRJ+k+IOqh0g7thuDnqfFMKq3R51TbsS7f
	I5DzbbE5HZRgelLwfoK/W1r1sCf8/3cXZKb+cEu4YbHCUlSpZCzMfAy86D8IEHgX0pNkUukQ7fI
	3DtEUD1SBqqqyPvTVPui8v0v+7WU+UsSFCAZeO/124HwZpuUjXYEGa78d3sC+IasZ6Zu70a1VkO
	zDd9jrrPDWTpq8TmhbNwX99If+I8YfpRtVExJrSXDaDQT7n0i7tX/B7shYA3YKOC6aFWLpeO2Sk
	47imjwVXedOOiEPoUVeyeQavWzOTk228+3c2nfeKnb/xhT4vYfADzP5M0gE8Gwg+FoD0aCnMFPQ
	AxwjviGJEEpoP4PEx5FEISuC6vrWx2hrSQrMnjwoGvkl1w3IKAkvJdBk4hvS3aYCXIQZ0/uUypM
	Di/HLa3D8pozZO+O/iydjA742jsSZlPd140aW6
X-Received: by 2002:a05:7022:628b:b0:128:ccb7:7fa3 with SMTP id a92af1059eb24-128f3e06b8emr6888095c88.34.1773726201250;
        Mon, 16 Mar 2026 22:43:21 -0700 (PDT)
Received: from MVIN00013.mvista.com ([152.59.0.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0b1fc876csm12772419eec.29.2026.03.16.22.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 22:43:20 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH 1/2] vim: upgrade 9.1.1683 -> 9.1.2128
Date: Tue, 17 Mar 2026 11:03:40 +0530
Message-ID: <20260317053341.42864-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 05:43:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233297

Removes CVE-2025-66476 from CVE metrics.
It's fixed in 9.1.1947, but only affects Vim for Windows.

Rebased patches and resolved conflicts.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../vim/files/0001-src-Makefile-improve-reproducibility.patch | 4 ++--
 meta/recipes-support/vim/files/disable_acl_header_check.patch | 4 ++--
 meta/recipes-support/vim/files/no-path-adjust.patch           | 2 +-
 meta/recipes-support/vim/vim.inc                              | 4 ++--
 meta/recipes-support/vim/vim_9.1.bb                           | 2 --
 5 files changed, 7 insertions(+), 9 deletions(-)

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
index c492342ffb..fee9f055e9 100644
--- a/meta/recipes-support/vim/vim_9.1.bb
+++ b/meta/recipes-support/vim/vim_9.1.bb
@@ -21,5 +21,3 @@ ALTERNATIVE_LINK_NAME[xxd] = "${bindir}/xxd"
 # in many places for _FORTIFY_SOURCE=2.  Security flags become part of CC.
 #
 lcl_maybe_fortify = "${@oe.utils.conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE=1',d)}"
-
-CVE_STATUS[CVE-2025-66476] = "not-applicable-platform: Issue only applies on Windows"
-- 
2.50.1


