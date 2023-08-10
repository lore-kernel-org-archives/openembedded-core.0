Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E9CCC04FDF
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:04:57 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.21358.1691683487699318431
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=mqsHBJEN;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-686ba97e4feso964728b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683487; x=1692288287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HZCSq3UZSTg7/DR/SOzBJvfzksEm3u8pLiAR2Aes/Q0=;
        b=mqsHBJENjD11M3z5TBgvVAdMM3sMYcBi67geTAdEYrl0qUUZO88B1cxGcv7BlMOEFW
         2syuqwGXGOLSgtJ62Bnih3RgFovYjAbesu1eOormT9p8jCyG4YX+bcHVrQZI+ZbKBowV
         zx1pGzL0VKLmt26aGHEybyRtEypqJruru4EMPS1U4YM9D4D+x73nRjXBCMMBpJl008/G
         Qq3tynd7+FJSVWKl3Sk9PiPIEfl+KvAJE7cnDsIXjz7uEZmn3xxZxakRnFssOZb3q6v8
         CW8K8UCJcbxuat6kspWYjkA/JmTn4pK0jeKlMTKlnCMYwWUtcFegY+rEvNBlp9AWBU62
         dEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683487; x=1692288287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HZCSq3UZSTg7/DR/SOzBJvfzksEm3u8pLiAR2Aes/Q0=;
        b=kHI+uioR/DqU0BUwWCi33zELt/5M4NhvnMkvEsVPDAMv0Jfow/91A12NYbOej2JR4F
         ir9cx1V/bc+dWXcJTnLZlXz+WcUQFwAF2/WDgH/fcZ4TW1CoqAxb7c2UO9yi+Qqm4ds7
         V5qpjIv7ZaDGE4Yosh99mSMxJ5yQ6011npjp2h8lV117V/IBEUYIMUgxEqa1NPA7oh9j
         XRoES7ck40anv6zYMSUqGLXv8auKsZobOWzKub/FWOcaWzmB8hntc8CdsTDIVaeTVBWI
         1iWMv0iBVY5dDpofVLi4hnwnohXaSis0UXsZsD4/xqVferjt3HOJVFB3iZ5YWMeJHZqm
         geMg==
X-Gm-Message-State: AOJu0YzHV7hhOSJ36bjpRdS7Oy0LR6qA/iexQXMYUIZPSE4iWE97jjbD
	46mUrrAoBDU9HYKDCRBg6CXoWmOWlz3V9bSMHPA=
X-Google-Smtp-Source: AGHT+IGyWTtOzdeXwQQBHTcOB+jvB7DoNK4JwSWtdR1IpZ1pIfvW4XyjrsHUyzHlh5XyTLKCRRoG2g==
X-Received: by 2002:a05:6a20:144c:b0:12e:5f07:7ede with SMTP id a12-20020a056a20144c00b0012e5f077edemr3848873pzi.41.1691683486528;
        Thu, 10 Aug 2023 09:04:46 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.04.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:04:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 02/37] ncurses: fix CVE-2023-29491
Date: Thu, 10 Aug 2023 06:04:01 -1000
Message-Id: <cdb5d9d498d3c1917b286fba03ce7527f23f9953.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185764

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch to fix CVE-2023-29491.

(From OE-Core rev: f1c95ae70f7aac574daf5b935a02bbba0d6f8a16)

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../files/0001-Fix-CVE-2023-29491.patch       | 462 ++++++++++++++++++
 meta/recipes-core/ncurses/ncurses_6.4.bb      |   1 +
 2 files changed, 463 insertions(+)
 create mode 100644 meta/recipes-core/ncurses/files/0001-Fix-CVE-2023-29491.patch

diff --git a/meta/recipes-core/ncurses/files/0001-Fix-CVE-2023-29491.patch b/meta/recipes-core/ncurses/files/0001-Fix-CVE-2023-29491.patch
new file mode 100644
index 0000000000..1232c8c2a8
--- /dev/null
+++ b/meta/recipes-core/ncurses/files/0001-Fix-CVE-2023-29491.patch
@@ -0,0 +1,462 @@
+From 3d54a41f12e9aa059f06e66e72d872f2283395b6 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Sun, 30 Jul 2023 21:14:00 -0700
+Subject: [PATCH] Fix CVE-2023-29491
+
+CVE: CVE-2023-29491
+
+Upstream-Status: Backport [http://ncurses.scripts.mit.edu/?p=ncurses.git;a=commitdiff;h=eb51b1ea1f75a0ec17c9c5937cb28df1e8eeec56]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ ncurses/tinfo/lib_tgoto.c  |  10 +++-
+ ncurses/tinfo/lib_tparm.c  | 116 ++++++++++++++++++++++++++++++++-----
+ ncurses/tinfo/read_entry.c |   3 +
+ progs/tic.c                |   6 ++
+ progs/tparm_type.c         |   9 +++
+ progs/tparm_type.h         |   2 +
+ progs/tput.c               |  61 ++++++++++++++++---
+ 7 files changed, 185 insertions(+), 22 deletions(-)
+
+diff --git a/ncurses/tinfo/lib_tgoto.c b/ncurses/tinfo/lib_tgoto.c
+index 9cf5e100..c50ed4df 100644
+--- a/ncurses/tinfo/lib_tgoto.c
++++ b/ncurses/tinfo/lib_tgoto.c
+@@ -207,6 +207,14 @@ tgoto(const char *string, int x, int y)
+ 	result = tgoto_internal(string, x, y);
+     else
+ #endif
+-	result = TIPARM_2(string, y, x);
++    if ((result = TIPARM_2(string, y, x)) == NULL) {
++	/*
++	 * Because termcap did not provide a more general solution such as
++	 * tparm(), it was necessary to handle single-parameter capabilities
++	 * using tgoto().  The internal _nc_tiparm() function returns a NULL
++	 * for that case; retry for the single-parameter case.
++	 */
++	result = TIPARM_1(string, y);
++    }
+     returnPtr(result);
+ }
+diff --git a/ncurses/tinfo/lib_tparm.c b/ncurses/tinfo/lib_tparm.c
+index d9bdfd8f..a10a3877 100644
+--- a/ncurses/tinfo/lib_tparm.c
++++ b/ncurses/tinfo/lib_tparm.c
+@@ -1086,6 +1086,64 @@ tparam_internal(TPARM_STATE *tps, const char *string, TPARM_DATA *data)
+     return (TPS(out_buff));
+ }
+ 
++#ifdef CUR
++/*
++ * Only a few standard capabilities accept string parameters.  The others that
++ * are parameterized accept only numeric parameters.
++ */
++static bool
++check_string_caps(TPARM_DATA *data, const char *string)
++{
++    bool result = FALSE;
++
++#define CHECK_CAP(name) (VALID_STRING(name) && !strcmp(name, string))
++
++    /*
++     * Disallow string parameters unless we can check them against a terminal
++     * description.
++     */
++    if (cur_term != NULL) {
++	int want_type = 0;
++
++	if (CHECK_CAP(pkey_key))
++	    want_type = 2;	/* function key #1, type string #2 */
++	else if (CHECK_CAP(pkey_local))
++	    want_type = 2;	/* function key #1, execute string #2 */
++	else if (CHECK_CAP(pkey_xmit))
++	    want_type = 2;	/* function key #1, transmit string #2 */
++	else if (CHECK_CAP(plab_norm))
++	    want_type = 2;	/* label #1, show string #2 */
++	else if (CHECK_CAP(pkey_plab))
++	    want_type = 6;	/* function key #1, type string #2, show string #3 */
++#if NCURSES_XNAMES
++	else {
++	    char *check;
++
++	    check = tigetstr("Cs");
++	    if (CHECK_CAP(check))
++		want_type = 1;	/* style #1 */
++
++	    check = tigetstr("Ms");
++	    if (CHECK_CAP(check))
++		want_type = 3;	/* storage unit #1, content #2 */
++	}
++#endif
++
++	if (want_type == data->tparm_type) {
++	    result = TRUE;
++	} else {
++	    T(("unexpected string-parameter"));
++	}
++    }
++    return result;
++}
++
++#define ValidCap() (myData.tparm_type == 0 || \
++		    check_string_caps(&myData, string))
++#else
++#define ValidCap() 1
++#endif
++
+ #if NCURSES_TPARM_VARARGS
+ 
+ NCURSES_EXPORT(char *)
+@@ -1100,7 +1158,7 @@ tparm(const char *string, ...)
+     tps->tname = "tparm";
+ #endif /* TRACE */
+ 
+-    if (tparm_setup(cur_term, string, &myData) == OK) {
++    if (tparm_setup(cur_term, string, &myData) == OK && ValidCap()) {
+ 	va_list ap;
+ 
+ 	va_start(ap, string);
+@@ -1135,7 +1193,7 @@ tparm(const char *string,
+     tps->tname = "tparm";
+ #endif /* TRACE */
+ 
+-    if (tparm_setup(cur_term, string, &myData) == OK) {
++    if (tparm_setup(cur_term, string, &myData) == OK && ValidCap()) {
+ 
+ 	myData.param[0] = a1;
+ 	myData.param[1] = a2;
+@@ -1166,7 +1224,7 @@ tiparm(const char *string, ...)
+     tps->tname = "tiparm";
+ #endif /* TRACE */
+ 
+-    if (tparm_setup(cur_term, string, &myData) == OK) {
++    if (tparm_setup(cur_term, string, &myData) == OK && ValidCap()) {
+ 	va_list ap;
+ 
+ 	va_start(ap, string);
+@@ -1179,7 +1237,25 @@ tiparm(const char *string, ...)
+ }
+ 
+ /*
+- * The internal-use flavor ensures that the parameters are numbers, not strings
++ * The internal-use flavor ensures that parameters are numbers, not strings.
++ * In addition to ensuring that they are numbers, it ensures that the parameter
++ * count is consistent with intended usage.
++ *
++ * Unlike the general-purpose tparm/tiparm, these internal calls are fairly
++ * well defined:
++ *
++ * expected == 0 - not applicable
++ * expected == 1 - set color, or vertical/horizontal addressing
++ * expected == 2 - cursor addressing
++ * expected == 4 - initialize color or color pair
++ * expected == 9 - set attributes
++ *
++ * Only for the last case (set attributes) should a parameter be optional.
++ * Also, a capability which calls for more parameters than expected should be
++ * ignored.
++ *
++ * Return a null if the parameter-checks fail.  Otherwise, return a pointer to
++ * the formatted capability string.
+  */
+ NCURSES_EXPORT(char *)
+ _nc_tiparm(int expected, const char *string, ...)
+@@ -1189,22 +1265,36 @@ _nc_tiparm(int expected, const char *string, ...)
+     char *result = NULL;
+ 
+     _nc_tparm_err = 0;
++    T((T_CALLED("_nc_tiparm(%d, %s, ...)"), expected, _nc_visbuf(string)));
+ #ifdef TRACE
+     tps->tname = "_nc_tiparm";
+ #endif /* TRACE */
+ 
+-    if (tparm_setup(cur_term, string, &myData) == OK
+-	&& myData.num_actual <= expected
+-	&& myData.tparm_type == 0) {
+-	va_list ap;
++    if (tparm_setup(cur_term, string, &myData) == OK && ValidCap()) {
++	if (myData.num_actual == 0) {
++	    T(("missing parameter%s, expected %s%d",
++	       expected > 1 ? "s" : "",
++	       expected == 9 ? "up to " : "",
++	       expected));
++	} else if (myData.num_actual > expected) {
++	    T(("too many parameters, have %d, expected %d",
++	       myData.num_actual,
++	       expected));
++	} else if (expected != 9 && myData.num_actual != expected) {
++	    T(("expected %d parameters, have %d",
++	       myData.num_actual,
++	       expected));
++	} else {
++	    va_list ap;
+ 
+-	va_start(ap, string);
+-	tparm_copy_valist(&myData, FALSE, ap);
+-	va_end(ap);
++	    va_start(ap, string);
++	    tparm_copy_valist(&myData, FALSE, ap);
++	    va_end(ap);
+ 
+-	result = tparam_internal(tps, string, &myData);
++	    result = tparam_internal(tps, string, &myData);
++	}
+     }
+-    return result;
++    returnPtr(result);
+ }
+ 
+ /*
+diff --git a/ncurses/tinfo/read_entry.c b/ncurses/tinfo/read_entry.c
+index 2b1875ed..341337d2 100644
+--- a/ncurses/tinfo/read_entry.c
++++ b/ncurses/tinfo/read_entry.c
+@@ -323,6 +323,9 @@ _nc_read_termtype(TERMTYPE2 *ptr, char *buffer, int limit)
+ 	|| bool_count < 0
+ 	|| num_count < 0
+ 	|| str_count < 0
++	|| bool_count > BOOLCOUNT
++	|| num_count > NUMCOUNT
++	|| str_count > STRCOUNT
+ 	|| str_size < 0) {
+ 	returnDB(TGETENT_NO);
+     }
+diff --git a/progs/tic.c b/progs/tic.c
+index 93a0b491..888927e2 100644
+--- a/progs/tic.c
++++ b/progs/tic.c
+@@ -2270,9 +2270,15 @@ check_1_infotocap(const char *name, NCURSES_CONST char *value, int count)
+ 
+     _nc_reset_tparm(NULL);
+     switch (actual) {
++    case Str:
++	result = TPARM_1(value, strings[1]);
++	break;
+     case Num_Str:
+ 	result = TPARM_2(value, numbers[1], strings[2]);
+ 	break;
++    case Str_Str:
++	result = TPARM_2(value, strings[1], strings[2]);
++	break;
+     case Num_Str_Str:
+ 	result = TPARM_3(value, numbers[1], strings[2], strings[3]);
+ 	break;
+diff --git a/progs/tparm_type.c b/progs/tparm_type.c
+index 3da4a077..644aa62a 100644
+--- a/progs/tparm_type.c
++++ b/progs/tparm_type.c
+@@ -47,6 +47,7 @@ tparm_type(const char *name)
+     	{code, {longname} }, \
+ 	{code, {ti} }, \
+ 	{code, {tc} }
++#define XD(code, onlyname) TD(code, onlyname, onlyname, onlyname)
+     TParams result = Numbers;
+     /* *INDENT-OFF* */
+     static const struct {
+@@ -58,6 +59,10 @@ tparm_type(const char *name)
+ 	TD(Num_Str,	"pkey_xmit",	"pfx",		"px"),
+ 	TD(Num_Str,	"plab_norm",	"pln",		"pn"),
+ 	TD(Num_Str_Str, "pkey_plab",	"pfxl",		"xl"),
++#if NCURSES_XNAMES
++	XD(Str,		"Cs"),
++	XD(Str_Str,	"Ms"),
++#endif
+     };
+     /* *INDENT-ON* */
+ 
+@@ -80,12 +85,16 @@ guess_tparm_type(int nparam, char **p_is_s)
+     case 1:
+ 	if (!p_is_s[0])
+ 	    result = Numbers;
++	if (p_is_s[0])
++	    result = Str;
+ 	break;
+     case 2:
+ 	if (!p_is_s[0] && !p_is_s[1])
+ 	    result = Numbers;
+ 	if (!p_is_s[0] && p_is_s[1])
+ 	    result = Num_Str;
++	if (p_is_s[0] && p_is_s[1])
++	    result = Str_Str;
+ 	break;
+     case 3:
+ 	if (!p_is_s[0] && !p_is_s[1] && !p_is_s[2])
+diff --git a/progs/tparm_type.h b/progs/tparm_type.h
+index 7c102a30..af5bcf0f 100644
+--- a/progs/tparm_type.h
++++ b/progs/tparm_type.h
+@@ -45,8 +45,10 @@
+ typedef enum {
+     Other = -1
+     ,Numbers = 0
++    ,Str
+     ,Num_Str
+     ,Num_Str_Str
++    ,Str_Str
+ } TParams;
+ 
+ extern TParams tparm_type(const char *name);
+diff --git a/progs/tput.c b/progs/tput.c
+index 4cd0c5ba..41508b72 100644
+--- a/progs/tput.c
++++ b/progs/tput.c
+@@ -1,5 +1,5 @@
+ /****************************************************************************
+- * Copyright 2018-2021,2022 Thomas E. Dickey                                *
++ * Copyright 2018-2022,2023 Thomas E. Dickey                                *
+  * Copyright 1998-2016,2017 Free Software Foundation, Inc.                  *
+  *                                                                          *
+  * Permission is hereby granted, free of charge, to any person obtaining a  *
+@@ -47,12 +47,15 @@
+ #include <transform.h>
+ #include <tty_settings.h>
+ 
+-MODULE_ID("$Id: tput.c,v 1.99 2022/02/26 23:19:31 tom Exp $")
++MODULE_ID("$Id: tput.c,v 1.102 2023/04/08 16:26:36 tom Exp $")
+ 
+ #define PUTS(s)		fputs(s, stdout)
+ 
+ const char *_nc_progname = "tput";
+ 
++static bool opt_v = FALSE;	/* quiet, do not show warnings */
++static bool opt_x = FALSE;	/* clear scrollback if possible */
++
+ static bool is_init = FALSE;
+ static bool is_reset = FALSE;
+ static bool is_clear = FALSE;
+@@ -81,6 +84,7 @@ usage(const char *optstring)
+ 	KEEP("  -S <<       read commands from standard input")
+ 	KEEP("  -T TERM     use this instead of $TERM")
+ 	KEEP("  -V          print curses-version")
++	KEEP("  -v          verbose, show warnings")
+ 	KEEP("  -x          do not try to clear scrollback")
+ 	KEEP("")
+ 	KEEP("Commands:")
+@@ -148,7 +152,7 @@ exit_code(int token, int value)
+  * Returns nonzero on error.
+  */
+ static int
+-tput_cmd(int fd, TTY * settings, bool opt_x, int argc, char **argv, int *used)
++tput_cmd(int fd, TTY * settings, int argc, char **argv, int *used)
+ {
+     NCURSES_CONST char *name;
+     char *s;
+@@ -231,7 +235,9 @@ tput_cmd(int fd, TTY * settings, bool opt_x, int argc, char **argv, int *used)
+     } else if (VALID_STRING(s)) {
+ 	if (argc > 1) {
+ 	    int k;
++	    int narg;
+ 	    int analyzed;
++	    int provided;
+ 	    int popcount;
+ 	    long numbers[1 + NUM_PARM];
+ 	    char *strings[1 + NUM_PARM];
+@@ -271,14 +277,45 @@ tput_cmd(int fd, TTY * settings, bool opt_x, int argc, char **argv, int *used)
+ 
+ 	    popcount = 0;
+ 	    _nc_reset_tparm(NULL);
++	    /*
++	     * Count the number of numeric parameters which are provided.
++	     */
++	    provided = 0;
++	    for (narg = 1; narg < argc; ++narg) {
++		char *ending = NULL;
++		long check = strtol(argv[narg], &ending, 10);
++		if (check < 0 || ending == argv[narg] || *ending != '\0')
++		    break;
++		provided = narg;
++	    }
+ 	    switch (paramType) {
++	    case Str:
++		s = TPARM_1(s, strings[1]);
++		analyzed = 1;
++		if (provided == 0 && argc >= 1)
++		    provided++;
++		break;
++	    case Str_Str:
++		s = TPARM_2(s, strings[1], strings[2]);
++		analyzed = 2;
++		if (provided == 0 && argc >= 1)
++		    provided++;
++		if (provided == 1 && argc >= 2)
++		    provided++;
++		break;
+ 	    case Num_Str:
+ 		s = TPARM_2(s, numbers[1], strings[2]);
+ 		analyzed = 2;
++		if (provided == 1 && argc >= 2)
++		    provided++;
+ 		break;
+ 	    case Num_Str_Str:
+ 		s = TPARM_3(s, numbers[1], strings[2], strings[3]);
+ 		analyzed = 3;
++		if (provided == 1 && argc >= 2)
++		    provided++;
++		if (provided == 2 && argc >= 3)
++		    provided++;
+ 		break;
+ 	    case Numbers:
+ 		analyzed = _nc_tparm_analyze(NULL, s, p_is_s, &popcount);
+@@ -316,7 +353,13 @@ tput_cmd(int fd, TTY * settings, bool opt_x, int argc, char **argv, int *used)
+ 	    if (analyzed < popcount) {
+ 		analyzed = popcount;
+ 	    }
+-	    *used += analyzed;
++	    if (opt_v && (analyzed != provided)) {
++		fprintf(stderr, "%s: %s parameters for \"%s\"\n",
++			_nc_progname,
++			(analyzed < provided ? "extra" : "missing"),
++			argv[0]);
++	    }
++	    *used += provided;
+ 	}
+ 
+ 	/* use putp() in order to perform padding */
+@@ -339,7 +382,6 @@ main(int argc, char **argv)
+     int used;
+     TTY old_settings;
+     TTY tty_settings;
+-    bool opt_x = FALSE;		/* clear scrollback if possible */
+     bool is_alias;
+     bool need_tty;
+ 
+@@ -348,7 +390,7 @@ main(int argc, char **argv)
+ 
+     term = getenv("TERM");
+ 
+-    while ((c = getopt(argc, argv, is_alias ? "T:Vx" : "ST:Vx")) != -1) {
++    while ((c = getopt(argc, argv, is_alias ? "T:Vvx" : "ST:Vvx")) != -1) {
+ 	switch (c) {
+ 	case 'S':
+ 	    cmdline = FALSE;
+@@ -361,6 +403,9 @@ main(int argc, char **argv)
+ 	case 'V':
+ 	    puts(curses_version());
+ 	    ExitProgram(EXIT_SUCCESS);
++	case 'v':		/* verbose */
++	    opt_v = TRUE;
++	    break;
+ 	case 'x':		/* do not try to clear scrollback */
+ 	    opt_x = TRUE;
+ 	    break;
+@@ -404,7 +449,7 @@ main(int argc, char **argv)
+ 	    usage(NULL);
+ 	while (argc > 0) {
+ 	    tty_settings = old_settings;
+-	    code = tput_cmd(fd, &tty_settings, opt_x, argc, argv, &used);
++	    code = tput_cmd(fd, &tty_settings, argc, argv, &used);
+ 	    if (code != 0)
+ 		break;
+ 	    argc -= used;
+@@ -439,7 +484,7 @@ main(int argc, char **argv)
+ 	while (argnum > 0) {
+ 	    int code;
+ 	    tty_settings = old_settings;
+-	    code = tput_cmd(fd, &tty_settings, opt_x, argnum, argnow, &used);
++	    code = tput_cmd(fd, &tty_settings, argnum, argnow, &used);
+ 	    if (code != 0) {
+ 		if (result == 0)
+ 		    result = ErrSystem(0);	/* will return value >4 */
+-- 
+2.40.0
+
diff --git a/meta/recipes-core/ncurses/ncurses_6.4.bb b/meta/recipes-core/ncurses/ncurses_6.4.bb
index 1eb15673d1..388cd8d407 100644
--- a/meta/recipes-core/ncurses/ncurses_6.4.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.4.bb
@@ -4,6 +4,7 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://0002-configure-reproducible.patch \
            file://0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch \
            file://exit_prototype.patch \
+           file://0001-Fix-CVE-2023-29491.patch \
            "
 # commit id corresponds to the revision in package version
 SRCREV = "79b9071f2be20a24c7be031655a5638f6032f29f"
-- 
2.34.1


