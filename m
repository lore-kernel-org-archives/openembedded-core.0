Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D253E8B361
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 21:11:51 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4393.1770153107742807305
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 13:11:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=SR98pwrl;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2026020321114460c744e1dd000207f1-fagakn@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026020321114460c744e1dd000207f1
        for <openembedded-core@lists.openembedded.org>;
        Tue, 03 Feb 2026 22:11:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Edzn62UNs78tGsJ2s+IANpX+fgt6WoOxGOx/TCPf9Q0=;
 b=SR98pwrl5bxd1CgAuOpwFEI3QQV8n1BJokdNQaaHStp5wTvrHzpVQyr3Zj2pGIOzLGwtTy
 pgcv6zfsmr0iXMqtjHLESkwWmAKYQlV0gak1rxVxSODBt5xgftf2kQ7GRgeXNwnvIOk6Q8IQ
 LTPHiQ6hXNOkSDiWBliFwyPV8WSUI/f5g0iubx/tDwDDTkgTI58ug050ntD2tFDw5ebuTyII
 8E22Z7II/7WoDaEZUHijBuOXTicuRw+Uilf2jbeLry4IzuIlJV1OOMaC36PKxvNy++2c+DR9
 VDKsvU4rvfo6hxQFR+GQ6+j7BiTPZpFWbEooE/FqVo4Qz2Sww4y2Nzcw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] vim: upgrade 9.1.1683 -> 9.1.2128
Date: Tue,  3 Feb 2026 22:11:42 +0100
Message-Id: <20260203211142.1873594-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 21:11:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230470

From: Peter Marko <peter.marko@siemens.com>

Removes CVE-2025-66476 from CVE metrics.
It's fixed in 9.1.1947, but only affects Vim for Windows.

Rebased patches and resolved conflicts.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../vim/files/0001-src-Makefile-improve-reproducibility.patch | 4 ++--
 meta/recipes-support/vim/files/disable_acl_header_check.patch | 4 ++--
 meta/recipes-support/vim/files/no-path-adjust.patch           | 2 +-
 meta/recipes-support/vim/vim.inc                              | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

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
index ab57c71732..541f022863 100644
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
index c730f1d0cf..a9f0661f2a 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://no-path-adjust.patch \
            "
 
-PV .= ".1683"
-SRCREV = "b922b30cfe4c044c83bac3cc908084ed20a83598"
+PV .= ".2128"
+SRCREV = "392b428d1239e963020b73682cd03f17ffb538b3"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"

