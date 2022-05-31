Return-Path: <MSFT.DanTran@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCCA6C433F5
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 17:15:29 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.396.1654017326127273597
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 10:15:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oIYWVw1c;
 spf=pass (domain: gmail.com, ip: 209.85.216.41,
 mailfrom: msft.dantran@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id e24so5632695pjt.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 10:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gSN89/5h7kRIvea6Gt5ZnbQYpYO0VaaT23T1FHUXW8Q=;
        b=oIYWVw1cXl0yOU3fLJW2fps/1yQwGvyrZebOB2T+CXybYg1K9+91PbtA2Y/3Q0xWrk
         mqWuiIVNCD9RNDp0Ou6FP2BuCwAouHHp6CxKH+e5GgdrrICJ2CiQcCWaxWp9DmkDCAEN
         A6UvJE0jMjVyI9Z+I1V+Vsmwd9JpFuLsbpQXwkGlAOJ2P7K5xdfHl9cDPS8ZLMZ1C6+t
         utDmluVAjs+G25+UyPU9ujTqUxiIQ4pm2GoS6Nnq8GEmpCcbOkRJ7078u0MTeyd0jHfV
         V2YgdybIPN6ObM2jh3wJ/BJZJ/nUShJne8BLfm5k5hEgNuLz5iY8wALwlx8Ge+9kMII5
         +G4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gSN89/5h7kRIvea6Gt5ZnbQYpYO0VaaT23T1FHUXW8Q=;
        b=AgiJA2UM5EYOjRo7Ws/KSCwAeZtvB3ugrmw3OthlIEMFgWhvIzuiluaxSLEGwTXawo
         LyyT2LOlludp7FJf+LLBOcal+Uj8cp6wCt+gK9ChuU+JPyyaOuQPMhTSeDmPifkjf7mM
         c+7pfbdFjxXR9PSxYxr3W9+d66yDeotMbBRnTfQ30R8epCDxsUclLn3ZLLOCpFZJT35G
         NK10q16o5EUOo51vxpVTx26p6KJVG+xBxzpOCql245z8pHlP/9MLAFez+mk0WeDZtWQS
         UQGLkeYGWU/xunRXSahC9uEUThLNOVjeYjz1Re6Ga4qAx0Ke+ejCEJ28kqOKV5uF8GBw
         IxTQ==
X-Gm-Message-State: AOAM530YwSSIEwonTrR/rlNMVLucqvQo0jKmVkIJ0VgzmZNI7M0ifgdh
	et/Vu2q6iQ3SCCvpUZ0nOB4G+I+PaJB/FQ==
X-Google-Smtp-Source: 
 ABdhPJyNNlenmBAEgaSxYqlnBEFKekS5+LTuruD6hyqCNnHn5SU8+v2r/h/2tD5VnX47/qV2zFhCNA==
X-Received: by 2002:a17:903:240e:b0:163:e057:6cf9 with SMTP id
 e14-20020a170903240e00b00163e0576cf9mr10519072plo.29.1654017325152;
        Tue, 31 May 2022 10:15:25 -0700 (PDT)
Received: from DAN-TRAN.redmond.corp.microsoft.com
 ([2601:601:502:122b:540b:7ae5:4c1a:25fd])
        by smtp.gmail.com with ESMTPSA id
 cd21-20020a056a00421500b0050dc7628175sm10763127pfb.79.2022.05.31.10.15.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 May 2022 10:15:24 -0700 (PDT)
From: Dan Tran <msft.dantran@gmail.com>
X-Google-Original-From: Dan Tran <dantran@microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Dan Tran <dantran@microsoft.com>,
	Gustavo Lima Chaves <gustavo.chaves@microsoft.com>
Subject: [oe-core][dunfell][PATCH] ncurses: Fix CVE-2022-29458
Date: Tue, 31 May 2022 10:15:17 -0700
Message-Id: <20220531171517.27876-1-dantran@microsoft.com>
X-Mailer: git-send-email 2.22.0.vfs.1.1.57.gbaf16c8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 17:15:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166325

ncurses 6.3 before patch 20220416 has an out-of-bounds read and
segmentation violation in convert_strings in tinfo/read_entry.c in the
terminfo library.

Backported from the link below, extracting only the relevant changes.
https://github.com/ThomasDickey/ncurses-snapshots/commit/9d1d651878d4bf0695872a64cc65ba0acb825f36

Signed-off-by: Gustavo Lima Chaves <gustavo.chaves@microsoft.com>
Signed-off-by: Dan Tran <dantran@microsoft.com>
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
2.22.0.vfs.1.1.57.gbaf16c8


