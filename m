Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F44FC433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 02:31:37 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.2146.1654137088223444826
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 19:31:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=rxTpScyC;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id y189so3535812pfy.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 19:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=RyWHIyXAa5PuKYDr1V8RwTrjVoPAibWxI8h+jcvGkXY=;
        b=rxTpScyCTyirfJZsaZwuw8czqsaX7HcxcDDVU4kNXWFGRlZ2jSLdHqYZKHrQh0yiz2
         Ozn5NV1ltcBSTMTb5y78X2lEKXXsjl8+9D4vHTlfeDgDIVawen24k5pFd3+KB266afxZ
         2sToJk1yRX255H03x8aCdapuLt1SAOKN1xyM+DJeSbZIoGaLjFYchb1vPo8ykud5n0QV
         RcjNQumZfdlWVobxYn+B4m0MARFYAUI4ot/2DXBeRuanf89k5VcRAz9OcYz6+dqMLdLE
         wZWeTqd0dylFoqrMhLdJFNh0zKfU8Q9FsZymHPFce3CF4mKn9G+/RTUZRVFiYAyxyc1m
         KlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RyWHIyXAa5PuKYDr1V8RwTrjVoPAibWxI8h+jcvGkXY=;
        b=fAXz4QjgbCwwrqVrBbTCte1BCfEHerGgFoE2HLWNND6G4ZvbLVvogMtpY64WkBhJIX
         0jUmGd0vK8lmgw9aYG3gOATI7Ls/KVcctiB/DYlFJOJ3JCD2jXTTkBydvkj2vhpFPWTi
         SNieABlGri7UCF8MEiNeRkdZnHvISI8Nbp/rj7U3fRz2H52qGAle9V5RFdOcSAud/4I+
         uFshxsNMAgCaf3ZH/RMRNU0IEZKJ+7TbFtX0/Hp2OqFyR3gbazUd7V6wfFAy4Ml8Kg4A
         aptexejfBgaJmNGuAvGCUpf/aaAjwKGAr0DPAM8VrvZKWbf7fCgdHFcJT72EihKCgBfo
         WNFw==
X-Gm-Message-State: AOAM533g0RZvLZ6CPTrWTVZosBU0Yt5DmlJ9Zt/GS75TtSjc6amQX6BG
	E9PLjNrJlYqM8RbZNDHzeDuSY6LGTiq4zNZE
X-Google-Smtp-Source: 
 ABdhPJxvMUd3/Gql1AFNif9KZBVfnoY1gAh0vpghXXz4id611wrEXXLJ7blRl4k1Mytw6feuNVpXgw==
X-Received: by 2002:a63:f455:0:b0:3fc:e1c1:bf10 with SMTP id
 p21-20020a63f455000000b003fce1c1bf10mr485617pgk.467.1654137086941;
        Wed, 01 Jun 2022 19:31:26 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 j23-20020a63ec17000000b003fc37053c82sm1990447pgh.12.2022.06.01.19.31.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 19:31:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/11] ncurses: Fix CVE-2022-29458
Date: Wed,  1 Jun 2022 16:30:45 -1000
Message-Id: 
 <2287d591cf32f5580ea6679805d04c3a5146ecd5.1654136888.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654136888.git.steve@sakoman.com>
References: <cover.1654136888.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 02:31:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166453

From: Dan Tran <MSFT.DanTran@gmail.com>

ncurses 6.3 before patch 20220416 has an out-of-bounds read and
segmentation violation in convert_strings in tinfo/read_entry.c in the
terminfo library.

Backported from the link below, extracting only the relevant changes.
https://github.com/ThomasDickey/ncurses-snapshots/commit/9d1d651878d4bf0695872a64cc65ba0acb825f36

Signed-off-by: Gustavo Lima Chaves <gustavo.chaves@microsoft.com>
Signed-off-by: Dan Tran <dantran@microsoft.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ncurses/files/CVE-2022-29458.patch        | 135 ++++++++++++++++++
 meta/recipes-core/ncurses/ncurses_6.2.bb      |   1 +
 2 files changed, 136 insertions(+)
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2022-29458.patch

diff --git a/meta/recipes-core/ncurses/files/CVE-2022-29458.patch b/meta/recipes-core/ncurses/files/CVE-2022-29458.patch
new file mode 100644
index 0000000000..eb1b7c96f9
--- /dev/null
+++ b/meta/recipes-core/ncurses/files/CVE-2022-29458.patch
@@ -0,0 +1,135 @@
+From 5f40697e37e195069f55528fc7a1d77e619ad104 Mon Sep 17 00:00:00 2001
+From: Dan Tran <dantran@microsoft.com>
+Date: Fri, 13 May 2022 13:28:41 -0700
+Subject: [PATCH] ncurses 6.3 before patch 20220416 has an out-of-bounds read
+ and segmentation violation in convert_strings in tinfo/read_entry.c in the
+ terminfo library.
+
+CVE: CVE-2022-29458
+Upstream-Status: Backport
+[https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1009870]
+
+Signed-off-by: Gustavo Lima Chaves <gustavo.chaves@microsoft.com>
+Signed-off-by: Dan Tran <dantran@microsoft.com>
+---
+ ncurses/tinfo/alloc_entry.c | 14 ++++++--------
+ ncurses/tinfo/read_entry.c  | 25 +++++++++++++++++++------
+ 2 files changed, 25 insertions(+), 14 deletions(-)
+
+diff --git a/ncurses/tinfo/alloc_entry.c b/ncurses/tinfo/alloc_entry.c
+index 4bf7d6c8..b49ad6aa 100644
+--- a/ncurses/tinfo/alloc_entry.c
++++ b/ncurses/tinfo/alloc_entry.c
+@@ -48,13 +48,11 @@
+ 
+ #include <tic.h>
+ 
+-MODULE_ID("$Id: alloc_entry.c,v 1.64 2020/02/02 23:34:34 tom Exp $")
++MODULE_ID("$Id: alloc_entry.c,v 1.69 2022/04/16 22:46:53 tom Exp $")
+ 
+ #define ABSENT_OFFSET    -1
+ #define CANCELLED_OFFSET -2
+ 
+-#define MAX_STRTAB	4096	/* documented maximum entry size */
+-
+ static char *stringbuf;		/* buffer for string capabilities */
+ static size_t next_free;	/* next free character in stringbuf */
+ 
+@@ -71,8 +69,8 @@ _nc_init_entry(ENTRY * const tp)
+     }
+ #endif
+ 
+-    if (stringbuf == 0)
+-	TYPE_MALLOC(char, (size_t) MAX_STRTAB, stringbuf);
++    if (stringbuf == NULL)
++	TYPE_MALLOC(char, (size_t) MAX_ENTRY_SIZE, stringbuf);
+ 
+     next_free = 0;
+ 
+@@ -108,11 +106,11 @@ _nc_save_str(const char *const string)
+ 	 * Cheat a little by making an empty string point to the end of the
+ 	 * previous string.
+ 	 */
+-	if (next_free < MAX_STRTAB) {
++	if (next_free < MAX_ENTRY_SIZE) {
+ 	    result = (stringbuf + next_free - 1);
+ 	}
+-    } else if (next_free + len < MAX_STRTAB) {
+-	_nc_STRCPY(&stringbuf[next_free], string, MAX_STRTAB);
++    } else if (next_free + len < MAX_ENTRY_SIZE) {
++	_nc_STRCPY(&stringbuf[next_free], string, MAX_ENTRY_SIZE);
+ 	DEBUG(7, ("Saved string %s", _nc_visbuf(string)));
+ 	DEBUG(7, ("at location %d", (int) next_free));
+ 	next_free += len;
+diff --git a/ncurses/tinfo/read_entry.c b/ncurses/tinfo/read_entry.c
+index 5b570b0f..23c2cebc 100644
+--- a/ncurses/tinfo/read_entry.c
++++ b/ncurses/tinfo/read_entry.c
+@@ -1,5 +1,5 @@
+ /****************************************************************************
+- * Copyright 2018-2019,2020 Thomas E. Dickey                                *
++ * Copyright 2018-2021,2022 Thomas E. Dickey                                *
+  * Copyright 1998-2016,2017 Free Software Foundation, Inc.                  *
+  *                                                                          *
+  * Permission is hereby granted, free of charge, to any person obtaining a  *
+@@ -42,7 +42,7 @@
+ 
+ #include <tic.h>
+ 
+-MODULE_ID("$Id: read_entry.c,v 1.157 2020/02/02 23:34:34 tom Exp $")
++MODULE_ID("$Id: read_entry.c,v 1.162 2022/04/16 21:00:00 tom Exp $")
+ 
+ #define TYPE_CALLOC(type,elts) typeCalloc(type, (unsigned)(elts))
+ 
+@@ -145,6 +145,7 @@ convert_strings(char *buf, char **Strings, int count, int size, char *table)
+ {
+     int i;
+     char *p;
++    bool corrupt = FALSE;
+ 
+     for (i = 0; i < count; i++) {
+ 	if (IS_NEG1(buf + 2 * i)) {
+@@ -154,8 +155,20 @@ convert_strings(char *buf, char **Strings, int count, int size, char *table)
+ 	} else if (MyNumber(buf + 2 * i) > size) {
+ 	    Strings[i] = ABSENT_STRING;
+ 	} else {
+-	    Strings[i] = (MyNumber(buf + 2 * i) + table);
+-	    TR(TRACE_DATABASE, ("Strings[%d] = %s", i, _nc_visbuf(Strings[i])));
++	    int nn = MyNumber(buf + 2 * i);
++	    if (nn >= 0 && nn < size) {
++		Strings[i] = (nn + table);
++		TR(TRACE_DATABASE, ("Strings[%d] = %s", i,
++				    _nc_visbuf(Strings[i])));
++	    } else {
++		if (!corrupt) {
++		    corrupt = TRUE;
++		    TR(TRACE_DATABASE,
++		       ("ignore out-of-range index %d to Strings[]", nn));
++		    _nc_warning("corrupt data found in convert_strings");
++		}
++		Strings[i] = ABSENT_STRING;
++	    }
+ 	}
+ 
+ 	/* make sure all strings are NUL terminated */
+@@ -776,7 +789,7 @@ _nc_read_tic_entry(char *filename,
+ 	 * looking for compiled (binary) terminfo data.
+ 	 *
+ 	 * cgetent uses a two-level lookup.  On the first it uses the given
+-	 * name to return a record containing only the aliases for an entry. 
++	 * name to return a record containing only the aliases for an entry.
+ 	 * On the second (using that list of aliases as a key), it returns the
+ 	 * content of the terminal description.  We expect second lookup to
+ 	 * return data beginning with the same set of aliases.
+@@ -833,7 +846,7 @@ _nc_read_tic_entry(char *filename,
+ #endif /* NCURSES_USE_DATABASE */
+ 
+ /*
+- * Find and read the compiled entry for a given terminal type, if it exists. 
++ * Find and read the compiled entry for a given terminal type, if it exists.
+  * We take pains here to make sure no combination of environment variables and
+  * terminal type name can be used to overrun the file buffer.
+  */
+-- 
+2.36.1
+
diff --git a/meta/recipes-core/ncurses/ncurses_6.2.bb b/meta/recipes-core/ncurses/ncurses_6.2.bb
index 700464f70b..451bfbcb5d 100644
--- a/meta/recipes-core/ncurses/ncurses_6.2.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.2.bb
@@ -4,6 +4,7 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://0002-configure-reproducible.patch \
            file://0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch \
            file://CVE-2021-39537.patch \
+           file://CVE-2022-29458.patch \
            "
 # commit id corresponds to the revision in package version
 SRCREV = "a669013cd5e9d6434e5301348ea51baf306c93c4"
-- 
2.25.1


