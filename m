Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ACCAEB64DA
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 19:16:12 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.48877.1689016568033061047
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 12:16:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=fOiuF2Di;
 spf=pass (domain: mvista.com, ip: 209.85.210.169, mailfrom: asharma@mvista.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-668709767b1so2708585b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 12:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1689016567; x=1691608567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WDVwZ/w+3ougTYjcCkcB8GZGijcmd9JwqotmWcCiWuY=;
        b=fOiuF2DiVfeXAUE2h+m+K6s4w/ux6uJxq+TAP3KzlH337uWSr5DdcTUBApdMA31HFO
         caDNVRzY3VNZcj38Pc0Z0vggKPL8DCSuXRbtRkTuFI0nsmHmSUGIikLWc5GLtRSMzIFa
         EabyWAkSV4CnxhuIJ5XGgATioGuWUvWlQqDNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689016567; x=1691608567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WDVwZ/w+3ougTYjcCkcB8GZGijcmd9JwqotmWcCiWuY=;
        b=H1jctWH8R4YE+o4+gS2GZEYkAzgR/ZAEISCE0Jv22+HjPfszezVXFVqaf43+Y8Tb9O
         Yb4KR0j2XQEKJMnbJSpr7BdQL0oG8EgYqx6RqrTDOJXi6LDVUsCQ4YBJIZtESdTd/FRS
         oCveq+Bjpbl8MrxHSegajh5bPiOtXaSgUTUkL8Q5bPa7DbPuc9G/sfoSQvkzCOjq59vd
         Th45EGoOnJE/UbYq1yxjyn+bZr4CoXT8/zQ/8jvsQfr3FGzgGb4F5n15QUyvHHnXZmjS
         16n7t/asEc4UeQyYbCP/t2EVKM/wSebsQGAueXoT4gc86HH1rzJF+ytjBYCxaamdednR
         Z1DQ==
X-Gm-Message-State: ABy/qLYJekBc1JSWWZupeYoduGagJO8gPue7axGiT+5CO0GBsP25vAqt
	zbEOsYYbi+PWm5AJYl51eDEL3FmX+KiNaUpvPCg=
X-Google-Smtp-Source: APBJJlFVx9MfoSMCWH6AczpSu0eG+mQ32KO4CpJyLlYlgjm3IseUqmc/2KPEXJbV91B7JCxli4C86Q==
X-Received: by 2002:a05:6a21:6d87:b0:121:bda6:2f85 with SMTP id wl7-20020a056a216d8700b00121bda62f85mr14237771pzb.30.1689016567231;
        Mon, 10 Jul 2023 12:16:07 -0700 (PDT)
Received: from asharma-Latitude-3400 ([2401:4900:1c31:670c:c76:6583:fbee:148d])
        by smtp.gmail.com with ESMTPSA id x25-20020aa793b9000000b00673e652985esm157108pff.44.2023.07.10.12.16.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jul 2023 12:16:06 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Tue, 11 Jul 2023 00:46:01 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][dunfell][PATCH] vim: Fix CVE-2023-2609 and CVE-2023-2610
Date: Tue, 11 Jul 2023 00:45:45 +0530
Message-Id: <20230710191545.28789-1-asharma@mvista.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 19:16:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184095

import patches from ubuntu to fix
 CVE-2023-2609
 CVE-2023-2610

Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/vim/tree/debian/patches?h=applied/ubuntu/devel&id=586a63887e677551384eea2ab03eb22bd1117338
Upstream commit
https://git.launchpad.net/ubuntu/+source/vim/tree/debian/patches/CVE-2023-2609.patch?h=applied/ubuntu/devel&id=586a63887e677551384eea2ab03eb22bd1117338
&
https://git.launchpad.net/ubuntu/+source/vim/tree/debian/patches/CVE-2023-2610.patch?h=applied/ubuntu/devel&id=586a63887e677551384eea2ab03eb22bd1117338]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../vim/files/CVE-2023-2609.patch             |  59 ++++++++++
 .../vim/files/CVE-2023-2610.patch             | 106 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   2 +
 3 files changed, 167 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2023-2609.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2023-2610.patch

diff --git a/meta/recipes-support/vim/files/CVE-2023-2609.patch b/meta/recipes-support/vim/files/CVE-2023-2609.patch
new file mode 100644
index 0000000000..c60d5efa25
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2023-2609.patch
@@ -0,0 +1,59 @@
+From d1ae8366aff286d41e7f5bc513cc0a1af5130aad Mon Sep 17 00:00:00 2001
+From: Bram Moolenaar <Bram@vim.org>
+Date: Tue, 9 May 2023 17:09:30 +0100
+Subject: [PATCH] patch 9.0.1531: crash when register contents ends up being
+ invalid
+
+Problem:    Crash when register contents ends up being invalid.
+Solution:   Check "y_array" is not NULL.
+
++Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/vim/tree/debian/patches?h=applied/ubuntu/devel&id=586a63887e677551384eea2ab03eb22bd1117338
++Upstream commit https://git.launchpad.net/ubuntu/+source/vim/tree/debian/patches/CVE-2023-2609.patch?h=applied/ubuntu/devel&id=586a63887e677551384eea2ab03eb22bd1117338]
++CVE: CVE-2023-2609
++Signed-off-by:  Ashish Sharma <asharma@mvista.com>
+---
+ src/register.c                 |  2 +-
+ src/testdir/test_registers.vim | 17 +++++++++++++++++
+ 2 files changed, 20 insertions(+), 1 deletion(-)
+
+diff --git a/src/register.c b/src/register.c
+index f3df79cfd642..e481d843c249 100644
+--- a/src/register.c
++++ b/src/register.c
+@@ -301,7 +301,7 @@ get_register(
+     if (copy)
+     {
+ 	// If we run out of memory some or all of the lines are empty.
+-	if (reg->y_size == 0)
++	if (reg->y_size == 0 || y_current->y_array == NULL)
+ 	    reg->y_array = NULL;
+ 	else
+ 	    reg->y_array = ALLOC_MULT(char_u *, reg->y_size);
+diff --git a/src/testdir/test_registers.vim b/src/testdir/test_registers.vim
+index e966932478d8..33ea0f4bd3e6 100644
+--- a/src/testdir/test_registers.vim
++++ b/src/testdir/test_registers.vim
+@@ -835,6 +835,23 @@ func Test_end_reg_executing()
+   bwipe!
+ endfunc
+ 
++" This was causing a crash because y_append was ending up being NULL
++func Test_zero_y_append()
++  " Run in a separate Vim instance because changing 'encoding' may cause
++  " trouble for later tests.
++  let lines =<< trim END
++      d
++      silent ?n
++      next <sfile>
++      so
++      sil! norm 0VPSP
++      set enc=latin1
++       
++  END
++  call writefile(lines, 'XTest_zero_y_append', 'D')
++  call RunVim([], [], '-u NONE -i NONE -e -s -S XTest_zero_y_append -c qa\!')
++endfunc
++
+ " Make sure that y_append is correctly reset
+ " and the previous register is working as expected
+ func Test_register_y_append_reset()
diff --git a/meta/recipes-support/vim/files/CVE-2023-2610.patch b/meta/recipes-support/vim/files/CVE-2023-2610.patch
new file mode 100644
index 0000000000..99fd58cd4f
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2023-2610.patch
@@ -0,0 +1,106 @@
+From ab9a2d884b3a4abe319606ea95a5a6d6b01cd73a Mon Sep 17 00:00:00 2001
+From: Bram Moolenaar <Bram@vim.org>
+Date: Tue, 9 May 2023 21:15:30 +0100
+Subject: [PATCH] patch 9.0.1532: crash when expanding "~" in substitute causes
+ very long text
+
+Problem:    Crash when expanding "~" in substitute causes very long text.
+Solution:   Limit the text length to MAXCOL.
+---
++Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/vim/tree/debian/patches?h=applied/ubuntu/devel&id=586a63887e677551384eea2ab03eb22bd1117338
++Upstream commit https://git.launchpad.net/ubuntu/+source/vim/tree/debian/patches/CVE-2023-2610.patch?h=applied/ubuntu/devel&id=586a63887e677551384eea2ab03eb22bd1117338]
++CVE: CVE-2023-2610
++Signed-off-by:  Ashish Sharma <asharma@mvista.com>
+
+ src/regexp.c                    | 30 +++++++++++++++++++-----------
+ src/testdir/test_substitute.vim | 14 ++++++++++++++
+ 2 files changed, 35 insertions(+), 11 deletions(-)
+
+diff --git a/src/regexp.c b/src/regexp.c
+index 33b36d11a8be..0e6c746df819 100644
+--- a/src/regexp.c
++++ b/src/regexp.c
+@@ -1767,10 +1767,7 @@ do_Lower(int *d, int c)
+ regtilde(char_u *source, int magic)
+ {
+     char_u	*newsub = source;
+-    char_u	*tmpsub;
+     char_u	*p;
+-    int		len;
+-    int		prevlen;
+ 
+     for (p = newsub; *p; ++p)
+     {
+@@ -1779,24 +1776,35 @@ regtilde(char_u *source, int magic)
+ 	    if (reg_prev_sub != NULL)
+ 	    {
+ 		// length = len(newsub) - 1 + len(prev_sub) + 1
+-		prevlen = (int)STRLEN(reg_prev_sub);
+-		tmpsub = alloc(STRLEN(newsub) + prevlen);
++		// Avoid making the text longer than MAXCOL, it will cause
++		// trouble at some point.
++		size_t	prevsublen = STRLEN(reg_prev_sub);
++		size_t  newsublen = STRLEN(newsub);
++		if (prevsublen > MAXCOL || newsublen > MAXCOL
++					    || newsublen + prevsublen > MAXCOL)
++		{
++		    emsg(_(e_resulting_text_too_long));
++		    break;
++		}
++
++		char_u *tmpsub = alloc(newsublen + prevsublen);
+ 		if (tmpsub != NULL)
+ 		{
+ 		    // copy prefix
+-		    len = (int)(p - newsub);	// not including ~
+-		    mch_memmove(tmpsub, newsub, (size_t)len);
++		    size_t prefixlen = p - newsub;	// not including ~
++		    mch_memmove(tmpsub, newsub, prefixlen);
+ 		    // interpret tilde
+-		    mch_memmove(tmpsub + len, reg_prev_sub, (size_t)prevlen);
++		    mch_memmove(tmpsub + prefixlen, reg_prev_sub,
++							       prevsublen);
+ 		    // copy postfix
+ 		    if (!magic)
+ 			++p;			// back off backslash
+-		    STRCPY(tmpsub + len + prevlen, p + 1);
++		    STRCPY(tmpsub + prefixlen + prevsublen, p + 1);
+ 
+-		    if (newsub != source)	// already allocated newsub
++		    if (newsub != source)	// allocated newsub before
+ 			vim_free(newsub);
+ 		    newsub = tmpsub;
+-		    p = newsub + len + prevlen;
++		    p = newsub + prefixlen + prevsublen;
+ 		}
+ 	    }
+ 	    else if (magic)
+diff --git a/src/testdir/test_substitute.vim b/src/testdir/test_substitute.vim
+index 7491b6163dc8..32e2f2785479 100644
+--- a/src/testdir/test_substitute.vim
++++ b/src/testdir/test_substitute.vim
+@@ -1414,6 +1414,24 @@ func Test_substitute_short_cmd()
+   bw!
+ endfunc
+ 
++" Check handling expanding "~" resulting in extremely long text.
++func Test_substitute_tilde_too_long()
++  if v:sizeoflong < 8
++    throw 'Skipped: only works with 64 bit long ints'
++  endif
++
++  enew!
++
++  s/.*/ixxx
++  s//~~~~~~~~~AAAAAAA@(
++
++  " Either fails with "out of memory" or "text too long".
++  " This can take a long time.
++  call assert_fails('sil! norm &&&&&&&&&', ['E1240:\|E342:'])
++
++  bwipe!
++endfunc
++
+ " This should be done last to reveal a memory leak when vim_regsub_both() is
+ " called to evaluate an expression but it is not used in a second call.
+ func Test_z_substitute_expr_leak()
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 309c91848d..59f3183f3e 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,6 +18,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://vim-add-knob-whether-elf.h-are-checked.patch \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
+	   file://CVE-2023-2609..patch \
+	   file://CVE-2023-2610..patch \
            "
 
 PV .= ".1527"
-- 
2.17.1


