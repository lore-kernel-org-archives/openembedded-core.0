Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B5FC25B79
	for <webhook@archiver.kernel.org>; Sat, 18 May 2024 21:31:03 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.27671.1716067852649513613
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 May 2024 14:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=iXMGGSFW;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20240518213049af5ea404ff2501cf8b-lpe2be@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20240518213049af5ea404ff2501cf8b
        for <openembedded-core@lists.openembedded.org>;
        Sat, 18 May 2024 23:30:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=XczC/eX3EYi9lF0lW+a2mQxoz3Je3nyEIWkICnNX2F4=;
 b=iXMGGSFWIu8BZXQouLOhj82jgpZGULh819mVbIzotL136B2iwLC/lG5cLO/vcxGEd/DClq
 ysweq9u5h/m1tSdbrmIyN6YJaW/Z/SR3h6XfeEmJrByHipzc8uxGRCH0rqHQHyf4KjRzYOSf
 ttQhR7+qNTgo6DKpe8cR8zRPv92Kg=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 2/2] ncurses: Upgrade 6.4 -> 6.5
Date: Sat, 18 May 2024 23:29:54 +0200
Message-Id: <20240518212954.788524-2-peter.marko@siemens.com>
In-Reply-To: <20240518212954.788524-1-peter.marko@siemens.com>
References: <20240518212954.788524-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 May 2024 21:31:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199539

From: Peter Marko <peter.marko@siemens.com>

Removed 4 backported patched included in this release.
Updated patches by devtool.

License-Update: copyright years refreshed

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../files/0001-Fix-CVE-2023-29491.patch       | 462 ----------------
 ...eset-code-ncurses-6.4-patch-20231104.patch | 499 ------------------
 .../ncurses/files/0001-tic-hang.patch         |  11 +-
 .../files/0002-configure-reproducible.patch   |   7 +-
 ...-Do-not-include-LDFLAGS-in-generated.patch |   5 +-
 .../ncurses/files/CVE-2023-45918.patch        | 180 -------
 .../ncurses/files/CVE-2023-50495.patch        | 301 -----------
 .../ncurses/files/exit_prototype.patch        |  11 +-
 meta/recipes-core/ncurses/ncurses.inc         |   2 +-
 .../{ncurses_6.4.bb => ncurses_6.5.bb}        |   6 +-
 10 files changed, 16 insertions(+), 1468 deletions(-)
 delete mode 100644 meta/recipes-core/ncurses/files/0001-Fix-CVE-2023-29491.patch
 delete mode 100644 meta/recipes-core/ncurses/files/0001-Updating-reset-code-ncurses-6.4-patch-20231104.patch
 delete mode 100644 meta/recipes-core/ncurses/files/CVE-2023-45918.patch
 delete mode 100644 meta/recipes-core/ncurses/files/CVE-2023-50495.patch
 rename meta/recipes-core/ncurses/{ncurses_6.4.bb => ncurses_6.5.bb} (68%)

diff --git a/meta/recipes-core/ncurses/files/0001-Fix-CVE-2023-29491.patch b/meta/recipes-core/ncurses/files/0001-Fix-CVE-2023-29491.patch
deleted file mode 100644
index 1232c8c2a8..0000000000
--- a/meta/recipes-core/ncurses/files/0001-Fix-CVE-2023-29491.patch
+++ /dev/null
@@ -1,462 +0,0 @@
-From 3d54a41f12e9aa059f06e66e72d872f2283395b6 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Sun, 30 Jul 2023 21:14:00 -0700
-Subject: [PATCH] Fix CVE-2023-29491
-
-CVE: CVE-2023-29491
-
-Upstream-Status: Backport [http://ncurses.scripts.mit.edu/?p=ncurses.git;a=commitdiff;h=eb51b1ea1f75a0ec17c9c5937cb28df1e8eeec56]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- ncurses/tinfo/lib_tgoto.c  |  10 +++-
- ncurses/tinfo/lib_tparm.c  | 116 ++++++++++++++++++++++++++++++++-----
- ncurses/tinfo/read_entry.c |   3 +
- progs/tic.c                |   6 ++
- progs/tparm_type.c         |   9 +++
- progs/tparm_type.h         |   2 +
- progs/tput.c               |  61 ++++++++++++++++---
- 7 files changed, 185 insertions(+), 22 deletions(-)
-
-diff --git a/ncurses/tinfo/lib_tgoto.c b/ncurses/tinfo/lib_tgoto.c
-index 9cf5e100..c50ed4df 100644
---- a/ncurses/tinfo/lib_tgoto.c
-+++ b/ncurses/tinfo/lib_tgoto.c
-@@ -207,6 +207,14 @@ tgoto(const char *string, int x, int y)
- 	result = tgoto_internal(string, x, y);
-     else
- #endif
--	result = TIPARM_2(string, y, x);
-+    if ((result = TIPARM_2(string, y, x)) == NULL) {
-+	/*
-+	 * Because termcap did not provide a more general solution such as
-+	 * tparm(), it was necessary to handle single-parameter capabilities
-+	 * using tgoto().  The internal _nc_tiparm() function returns a NULL
-+	 * for that case; retry for the single-parameter case.
-+	 */
-+	result = TIPARM_1(string, y);
-+    }
-     returnPtr(result);
- }
-diff --git a/ncurses/tinfo/lib_tparm.c b/ncurses/tinfo/lib_tparm.c
-index d9bdfd8f..a10a3877 100644
---- a/ncurses/tinfo/lib_tparm.c
-+++ b/ncurses/tinfo/lib_tparm.c
-@@ -1086,6 +1086,64 @@ tparam_internal(TPARM_STATE *tps, const char *string, TPARM_DATA *data)
-     return (TPS(out_buff));
- }
- 
-+#ifdef CUR
-+/*
-+ * Only a few standard capabilities accept string parameters.  The others that
-+ * are parameterized accept only numeric parameters.
-+ */
-+static bool
-+check_string_caps(TPARM_DATA *data, const char *string)
-+{
-+    bool result = FALSE;
-+
-+#define CHECK_CAP(name) (VALID_STRING(name) && !strcmp(name, string))
-+
-+    /*
-+     * Disallow string parameters unless we can check them against a terminal
-+     * description.
-+     */
-+    if (cur_term != NULL) {
-+	int want_type = 0;
-+
-+	if (CHECK_CAP(pkey_key))
-+	    want_type = 2;	/* function key #1, type string #2 */
-+	else if (CHECK_CAP(pkey_local))
-+	    want_type = 2;	/* function key #1, execute string #2 */
-+	else if (CHECK_CAP(pkey_xmit))
-+	    want_type = 2;	/* function key #1, transmit string #2 */
-+	else if (CHECK_CAP(plab_norm))
-+	    want_type = 2;	/* label #1, show string #2 */
-+	else if (CHECK_CAP(pkey_plab))
-+	    want_type = 6;	/* function key #1, type string #2, show string #3 */
-+#if NCURSES_XNAMES
-+	else {
-+	    char *check;
-+
-+	    check = tigetstr("Cs");
-+	    if (CHECK_CAP(check))
-+		want_type = 1;	/* style #1 */
-+
-+	    check = tigetstr("Ms");
-+	    if (CHECK_CAP(check))
-+		want_type = 3;	/* storage unit #1, content #2 */
-+	}
-+#endif
-+
-+	if (want_type == data->tparm_type) {
-+	    result = TRUE;
-+	} else {
-+	    T(("unexpected string-parameter"));
-+	}
-+    }
-+    return result;
-+}
-+
-+#define ValidCap() (myData.tparm_type == 0 || \
-+		    check_string_caps(&myData, string))
-+#else
-+#define ValidCap() 1
-+#endif
-+
- #if NCURSES_TPARM_VARARGS
- 
- NCURSES_EXPORT(char *)
-@@ -1100,7 +1158,7 @@ tparm(const char *string, ...)
-     tps->tname = "tparm";
- #endif /* TRACE */
- 
--    if (tparm_setup(cur_term, string, &myData) == OK) {
-+    if (tparm_setup(cur_term, string, &myData) == OK && ValidCap()) {
- 	va_list ap;
- 
- 	va_start(ap, string);
-@@ -1135,7 +1193,7 @@ tparm(const char *string,
-     tps->tname = "tparm";
- #endif /* TRACE */
- 
--    if (tparm_setup(cur_term, string, &myData) == OK) {
-+    if (tparm_setup(cur_term, string, &myData) == OK && ValidCap()) {
- 
- 	myData.param[0] = a1;
- 	myData.param[1] = a2;
-@@ -1166,7 +1224,7 @@ tiparm(const char *string, ...)
-     tps->tname = "tiparm";
- #endif /* TRACE */
- 
--    if (tparm_setup(cur_term, string, &myData) == OK) {
-+    if (tparm_setup(cur_term, string, &myData) == OK && ValidCap()) {
- 	va_list ap;
- 
- 	va_start(ap, string);
-@@ -1179,7 +1237,25 @@ tiparm(const char *string, ...)
- }
- 
- /*
-- * The internal-use flavor ensures that the parameters are numbers, not strings
-+ * The internal-use flavor ensures that parameters are numbers, not strings.
-+ * In addition to ensuring that they are numbers, it ensures that the parameter
-+ * count is consistent with intended usage.
-+ *
-+ * Unlike the general-purpose tparm/tiparm, these internal calls are fairly
-+ * well defined:
-+ *
-+ * expected == 0 - not applicable
-+ * expected == 1 - set color, or vertical/horizontal addressing
-+ * expected == 2 - cursor addressing
-+ * expected == 4 - initialize color or color pair
-+ * expected == 9 - set attributes
-+ *
-+ * Only for the last case (set attributes) should a parameter be optional.
-+ * Also, a capability which calls for more parameters than expected should be
-+ * ignored.
-+ *
-+ * Return a null if the parameter-checks fail.  Otherwise, return a pointer to
-+ * the formatted capability string.
-  */
- NCURSES_EXPORT(char *)
- _nc_tiparm(int expected, const char *string, ...)
-@@ -1189,22 +1265,36 @@ _nc_tiparm(int expected, const char *string, ...)
-     char *result = NULL;
- 
-     _nc_tparm_err = 0;
-+    T((T_CALLED("_nc_tiparm(%d, %s, ...)"), expected, _nc_visbuf(string)));
- #ifdef TRACE
-     tps->tname = "_nc_tiparm";
- #endif /* TRACE */
- 
--    if (tparm_setup(cur_term, string, &myData) == OK
--	&& myData.num_actual <= expected
--	&& myData.tparm_type == 0) {
--	va_list ap;
-+    if (tparm_setup(cur_term, string, &myData) == OK && ValidCap()) {
-+	if (myData.num_actual == 0) {
-+	    T(("missing parameter%s, expected %s%d",
-+	       expected > 1 ? "s" : "",
-+	       expected == 9 ? "up to " : "",
-+	       expected));
-+	} else if (myData.num_actual > expected) {
-+	    T(("too many parameters, have %d, expected %d",
-+	       myData.num_actual,
-+	       expected));
-+	} else if (expected != 9 && myData.num_actual != expected) {
-+	    T(("expected %d parameters, have %d",
-+	       myData.num_actual,
-+	       expected));
-+	} else {
-+	    va_list ap;
- 
--	va_start(ap, string);
--	tparm_copy_valist(&myData, FALSE, ap);
--	va_end(ap);
-+	    va_start(ap, string);
-+	    tparm_copy_valist(&myData, FALSE, ap);
-+	    va_end(ap);
- 
--	result = tparam_internal(tps, string, &myData);
-+	    result = tparam_internal(tps, string, &myData);
-+	}
-     }
--    return result;
-+    returnPtr(result);
- }
- 
- /*
-diff --git a/ncurses/tinfo/read_entry.c b/ncurses/tinfo/read_entry.c
-index 2b1875ed..341337d2 100644
---- a/ncurses/tinfo/read_entry.c
-+++ b/ncurses/tinfo/read_entry.c
-@@ -323,6 +323,9 @@ _nc_read_termtype(TERMTYPE2 *ptr, char *buffer, int limit)
- 	|| bool_count < 0
- 	|| num_count < 0
- 	|| str_count < 0
-+	|| bool_count > BOOLCOUNT
-+	|| num_count > NUMCOUNT
-+	|| str_count > STRCOUNT
- 	|| str_size < 0) {
- 	returnDB(TGETENT_NO);
-     }
-diff --git a/progs/tic.c b/progs/tic.c
-index 93a0b491..888927e2 100644
---- a/progs/tic.c
-+++ b/progs/tic.c
-@@ -2270,9 +2270,15 @@ check_1_infotocap(const char *name, NCURSES_CONST char *value, int count)
- 
-     _nc_reset_tparm(NULL);
-     switch (actual) {
-+    case Str:
-+	result = TPARM_1(value, strings[1]);
-+	break;
-     case Num_Str:
- 	result = TPARM_2(value, numbers[1], strings[2]);
- 	break;
-+    case Str_Str:
-+	result = TPARM_2(value, strings[1], strings[2]);
-+	break;
-     case Num_Str_Str:
- 	result = TPARM_3(value, numbers[1], strings[2], strings[3]);
- 	break;
-diff --git a/progs/tparm_type.c b/progs/tparm_type.c
-index 3da4a077..644aa62a 100644
---- a/progs/tparm_type.c
-+++ b/progs/tparm_type.c
-@@ -47,6 +47,7 @@ tparm_type(const char *name)
-     	{code, {longname} }, \
- 	{code, {ti} }, \
- 	{code, {tc} }
-+#define XD(code, onlyname) TD(code, onlyname, onlyname, onlyname)
-     TParams result = Numbers;
-     /* *INDENT-OFF* */
-     static const struct {
-@@ -58,6 +59,10 @@ tparm_type(const char *name)
- 	TD(Num_Str,	"pkey_xmit",	"pfx",		"px"),
- 	TD(Num_Str,	"plab_norm",	"pln",		"pn"),
- 	TD(Num_Str_Str, "pkey_plab",	"pfxl",		"xl"),
-+#if NCURSES_XNAMES
-+	XD(Str,		"Cs"),
-+	XD(Str_Str,	"Ms"),
-+#endif
-     };
-     /* *INDENT-ON* */
- 
-@@ -80,12 +85,16 @@ guess_tparm_type(int nparam, char **p_is_s)
-     case 1:
- 	if (!p_is_s[0])
- 	    result = Numbers;
-+	if (p_is_s[0])
-+	    result = Str;
- 	break;
-     case 2:
- 	if (!p_is_s[0] && !p_is_s[1])
- 	    result = Numbers;
- 	if (!p_is_s[0] && p_is_s[1])
- 	    result = Num_Str;
-+	if (p_is_s[0] && p_is_s[1])
-+	    result = Str_Str;
- 	break;
-     case 3:
- 	if (!p_is_s[0] && !p_is_s[1] && !p_is_s[2])
-diff --git a/progs/tparm_type.h b/progs/tparm_type.h
-index 7c102a30..af5bcf0f 100644
---- a/progs/tparm_type.h
-+++ b/progs/tparm_type.h
-@@ -45,8 +45,10 @@
- typedef enum {
-     Other = -1
-     ,Numbers = 0
-+    ,Str
-     ,Num_Str
-     ,Num_Str_Str
-+    ,Str_Str
- } TParams;
- 
- extern TParams tparm_type(const char *name);
-diff --git a/progs/tput.c b/progs/tput.c
-index 4cd0c5ba..41508b72 100644
---- a/progs/tput.c
-+++ b/progs/tput.c
-@@ -1,5 +1,5 @@
- /****************************************************************************
-- * Copyright 2018-2021,2022 Thomas E. Dickey                                *
-+ * Copyright 2018-2022,2023 Thomas E. Dickey                                *
-  * Copyright 1998-2016,2017 Free Software Foundation, Inc.                  *
-  *                                                                          *
-  * Permission is hereby granted, free of charge, to any person obtaining a  *
-@@ -47,12 +47,15 @@
- #include <transform.h>
- #include <tty_settings.h>
- 
--MODULE_ID("$Id: tput.c,v 1.99 2022/02/26 23:19:31 tom Exp $")
-+MODULE_ID("$Id: tput.c,v 1.102 2023/04/08 16:26:36 tom Exp $")
- 
- #define PUTS(s)		fputs(s, stdout)
- 
- const char *_nc_progname = "tput";
- 
-+static bool opt_v = FALSE;	/* quiet, do not show warnings */
-+static bool opt_x = FALSE;	/* clear scrollback if possible */
-+
- static bool is_init = FALSE;
- static bool is_reset = FALSE;
- static bool is_clear = FALSE;
-@@ -81,6 +84,7 @@ usage(const char *optstring)
- 	KEEP("  -S <<       read commands from standard input")
- 	KEEP("  -T TERM     use this instead of $TERM")
- 	KEEP("  -V          print curses-version")
-+	KEEP("  -v          verbose, show warnings")
- 	KEEP("  -x          do not try to clear scrollback")
- 	KEEP("")
- 	KEEP("Commands:")
-@@ -148,7 +152,7 @@ exit_code(int token, int value)
-  * Returns nonzero on error.
-  */
- static int
--tput_cmd(int fd, TTY * settings, bool opt_x, int argc, char **argv, int *used)
-+tput_cmd(int fd, TTY * settings, int argc, char **argv, int *used)
- {
-     NCURSES_CONST char *name;
-     char *s;
-@@ -231,7 +235,9 @@ tput_cmd(int fd, TTY * settings, bool opt_x, int argc, char **argv, int *used)
-     } else if (VALID_STRING(s)) {
- 	if (argc > 1) {
- 	    int k;
-+	    int narg;
- 	    int analyzed;
-+	    int provided;
- 	    int popcount;
- 	    long numbers[1 + NUM_PARM];
- 	    char *strings[1 + NUM_PARM];
-@@ -271,14 +277,45 @@ tput_cmd(int fd, TTY * settings, bool opt_x, int argc, char **argv, int *used)
- 
- 	    popcount = 0;
- 	    _nc_reset_tparm(NULL);
-+	    /*
-+	     * Count the number of numeric parameters which are provided.
-+	     */
-+	    provided = 0;
-+	    for (narg = 1; narg < argc; ++narg) {
-+		char *ending = NULL;
-+		long check = strtol(argv[narg], &ending, 10);
-+		if (check < 0 || ending == argv[narg] || *ending != '\0')
-+		    break;
-+		provided = narg;
-+	    }
- 	    switch (paramType) {
-+	    case Str:
-+		s = TPARM_1(s, strings[1]);
-+		analyzed = 1;
-+		if (provided == 0 && argc >= 1)
-+		    provided++;
-+		break;
-+	    case Str_Str:
-+		s = TPARM_2(s, strings[1], strings[2]);
-+		analyzed = 2;
-+		if (provided == 0 && argc >= 1)
-+		    provided++;
-+		if (provided == 1 && argc >= 2)
-+		    provided++;
-+		break;
- 	    case Num_Str:
- 		s = TPARM_2(s, numbers[1], strings[2]);
- 		analyzed = 2;
-+		if (provided == 1 && argc >= 2)
-+		    provided++;
- 		break;
- 	    case Num_Str_Str:
- 		s = TPARM_3(s, numbers[1], strings[2], strings[3]);
- 		analyzed = 3;
-+		if (provided == 1 && argc >= 2)
-+		    provided++;
-+		if (provided == 2 && argc >= 3)
-+		    provided++;
- 		break;
- 	    case Numbers:
- 		analyzed = _nc_tparm_analyze(NULL, s, p_is_s, &popcount);
-@@ -316,7 +353,13 @@ tput_cmd(int fd, TTY * settings, bool opt_x, int argc, char **argv, int *used)
- 	    if (analyzed < popcount) {
- 		analyzed = popcount;
- 	    }
--	    *used += analyzed;
-+	    if (opt_v && (analyzed != provided)) {
-+		fprintf(stderr, "%s: %s parameters for \"%s\"\n",
-+			_nc_progname,
-+			(analyzed < provided ? "extra" : "missing"),
-+			argv[0]);
-+	    }
-+	    *used += provided;
- 	}
- 
- 	/* use putp() in order to perform padding */
-@@ -339,7 +382,6 @@ main(int argc, char **argv)
-     int used;
-     TTY old_settings;
-     TTY tty_settings;
--    bool opt_x = FALSE;		/* clear scrollback if possible */
-     bool is_alias;
-     bool need_tty;
- 
-@@ -348,7 +390,7 @@ main(int argc, char **argv)
- 
-     term = getenv("TERM");
- 
--    while ((c = getopt(argc, argv, is_alias ? "T:Vx" : "ST:Vx")) != -1) {
-+    while ((c = getopt(argc, argv, is_alias ? "T:Vvx" : "ST:Vvx")) != -1) {
- 	switch (c) {
- 	case 'S':
- 	    cmdline = FALSE;
-@@ -361,6 +403,9 @@ main(int argc, char **argv)
- 	case 'V':
- 	    puts(curses_version());
- 	    ExitProgram(EXIT_SUCCESS);
-+	case 'v':		/* verbose */
-+	    opt_v = TRUE;
-+	    break;
- 	case 'x':		/* do not try to clear scrollback */
- 	    opt_x = TRUE;
- 	    break;
-@@ -404,7 +449,7 @@ main(int argc, char **argv)
- 	    usage(NULL);
- 	while (argc > 0) {
- 	    tty_settings = old_settings;
--	    code = tput_cmd(fd, &tty_settings, opt_x, argc, argv, &used);
-+	    code = tput_cmd(fd, &tty_settings, argc, argv, &used);
- 	    if (code != 0)
- 		break;
- 	    argc -= used;
-@@ -439,7 +484,7 @@ main(int argc, char **argv)
- 	while (argnum > 0) {
- 	    int code;
- 	    tty_settings = old_settings;
--	    code = tput_cmd(fd, &tty_settings, opt_x, argnum, argnow, &used);
-+	    code = tput_cmd(fd, &tty_settings, argnum, argnow, &used);
- 	    if (code != 0) {
- 		if (result == 0)
- 		    result = ErrSystem(0);	/* will return value >4 */
--- 
-2.40.0
-
diff --git a/meta/recipes-core/ncurses/files/0001-Updating-reset-code-ncurses-6.4-patch-20231104.patch b/meta/recipes-core/ncurses/files/0001-Updating-reset-code-ncurses-6.4-patch-20231104.patch
deleted file mode 100644
index 121db6bffe..0000000000
--- a/meta/recipes-core/ncurses/files/0001-Updating-reset-code-ncurses-6.4-patch-20231104.patch
+++ /dev/null
@@ -1,499 +0,0 @@
-From 135d37072755704b8d018e5de74e62ff3f28c930 Mon Sep 17 00:00:00 2001
-From: Thomas E. Dickey <dickey@invisible-island.net>
-Date: Sun, 5 Nov 2023 05:54:54 +0530
-Subject: [PATCH] Updating reset code - ncurses 6.4 - patch 20231104
-
-+ modify reset command to avoid altering clocal if the terminal uses a
-  modem (prompted by discussion with Werner Fink, Michal Suchanek,
-  OpenSUSE #1201384, Debian #60377).
-+ build-fixes for --with-caps variations.
-+ correct a couple of section-references in INSTALL.
-
-Signed-off-by: Thomas E. Dickey <dickey@invisible-island.net>
-
-Upstream-Status: Backport [https://ncurses.scripts.mit.edu/?p=ncurses.git;a=commitdiff;h=135d37072755704b8d018e5de74e62ff3f28c930]
-
-Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
----
- INSTALL                   |   8 +-
- include/curses.events     |   2 +-
- ncurses/tinfo/lib_tparm.c |   2 +
- progs/reset_cmd.c         | 281 +++++++++++++++++++++-----------------
- progs/tabs.c              |  10 +-
- progs/tic.c               |   4 +
- 6 files changed, 176 insertions(+), 131 deletions(-)
-
-diff --git a/INSTALL b/INSTALL
-index d9c1dd12..d0a39af0 100644
---- a/INSTALL
-+++ b/INSTALL
-@@ -47,7 +47,7 @@ If you are converting from BSD curses and do not have root access, be sure
- to read the BSD CONVERSION NOTES section below.
-
- If you are trying to build applications using gpm with ncurses,
--read the USING NCURSES WITH GPM section below.
-+read the USING GPM section below.
-
- If you are cross-compiling, see the note below on BUILDING WITH A CROSS-COMPILER.
-
-@@ -79,7 +79,7 @@ INSTALLATION PROCEDURE:
-     The --prefix option to configure changes the root directory for installing
-     ncurses.  The default is normally in subdirectories of /usr/local, except
-     for systems where ncurses is normally installed as a system library (see
--    "IF YOU ARE A SYSTEM INTEGRATOR").  Use --prefix=/usr to replace your
-+    "FOR SYSTEM INTEGRATORS").  Use --prefix=/usr to replace your
-     default curses distribution.
-
-     The package gets installed beneath the --prefix directory as follows:
-@@ -176,7 +176,7 @@ INSTALLATION PROCEDURE:
-     You can make curses and terminfo fall back to an existing file of termcap
-     definitions by configuring with --enable-termcap.  If you do this, the
-     library will search /etc/termcap before the terminfo database, and will
--    also interpret the contents of the TERM environment variable.  See the
-+    also interpret the contents of the $TERM environment variable.  See the
-     section BSD CONVERSION NOTES below.
-
- 3.  Type `make'.  Ignore any warnings, no error messages should be produced.
-@@ -1231,7 +1231,7 @@ CONFIGURE OPTIONS:
-	Specify a search-list of terminfo directories which will be compiled
-	into the ncurses library (default: DATADIR/terminfo)
-
--	This is a colon-separated list, like the TERMINFO_DIRS environment
-+	This is a colon-separated list, like the $TERMINFO_DIRS environment
-	variable.
-
-     --with-termlib[=XXX]
-diff --git a/include/curses.events b/include/curses.events
-index 25a2583f..468bde18 100644
---- a/include/curses.events
-+++ b/include/curses.events
-@@ -50,6 +50,6 @@ typedef struct
- extern NCURSES_EXPORT(int) wgetch_events (WINDOW *, _nc_eventlist *) GCC_DEPRECATED(experimental option); /* experimental */
- extern NCURSES_EXPORT(int) wgetnstr_events (WINDOW *,char *,int,_nc_eventlist *) GCC_DEPRECATED(experimental option); /* experimental */
-
--#define KEY_EVENT	0633		/* We were interrupted by an event */
-+#define KEY_EVENT	0634		/* We were interrupted by an event */
-
- #endif /* NCURSES_WGETCH_EVENTS */
-diff --git a/ncurses/tinfo/lib_tparm.c b/ncurses/tinfo/lib_tparm.c
-index a10a3877..cd972c0f 100644
---- a/ncurses/tinfo/lib_tparm.c
-+++ b/ncurses/tinfo/lib_tparm.c
-@@ -1113,8 +1113,10 @@ check_string_caps(TPARM_DATA *data, const char *string)
-	    want_type = 2;	/* function key #1, transmit string #2 */
-	else if (CHECK_CAP(plab_norm))
-	    want_type = 2;	/* label #1, show string #2 */
-+#ifdef pkey_plab
-	else if (CHECK_CAP(pkey_plab))
-	    want_type = 6;	/* function key #1, type string #2, show string #3 */
-+#endif
- #if NCURSES_XNAMES
-	else {
-	    char *check;
-diff --git a/progs/reset_cmd.c b/progs/reset_cmd.c
-index eff3af72..aec4b077 100644
---- a/progs/reset_cmd.c
-+++ b/progs/reset_cmd.c
-@@ -75,6 +75,9 @@ MODULE_ID("$Id: reset_cmd.c,v 1.28 2021/10/02 18:08:44 tom Exp $")
- # endif
- #endif
-
-+#define set_flags(target, mask)    target |= mask
-+#define clear_flags(target, mask)  target &= ~((unsigned)(mask))
-+
- static FILE *my_file;
-
- static bool use_reset = FALSE;	/* invoked as reset */
-@@ -188,6 +191,79 @@ out_char(int c)
- #define reset_char(item, value) \
-     tty_settings->c_cc[item] = CHK(tty_settings->c_cc[item], value)
-
-+/*
-+ * Simplify ifdefs
-+ */
-+#ifndef BSDLY
-+#define BSDLY 0
-+#endif
-+#ifndef CRDLY
-+#define CRDLY 0
-+#endif
-+#ifndef ECHOCTL
-+#define ECHOCTL 0
-+#endif
-+#ifndef ECHOKE
-+#define ECHOKE 0
-+#endif
-+#ifndef ECHOPRT
-+#define ECHOPRT 0
-+#endif
-+#ifndef FFDLY
-+#define FFDLY 0
-+#endif
-+#ifndef IMAXBEL
-+#define IMAXBEL 0
-+#endif
-+#ifndef IUCLC
-+#define IUCLC 0
-+#endif
-+#ifndef IXANY
-+#define IXANY 0
-+#endif
-+#ifndef NLDLY
-+#define NLDLY 0
-+#endif
-+#ifndef OCRNL
-+#define OCRNL 0
-+#endif
-+#ifndef OFDEL
-+#define OFDEL 0
-+#endif
-+#ifndef OFILL
-+#define OFILL 0
-+#endif
-+#ifndef OLCUC
-+#define OLCUC 0
-+#endif
-+#ifndef ONLCR
-+#define ONLCR 0
-+#endif
-+#ifndef ONLRET
-+#define ONLRET 0
-+#endif
-+#ifndef ONOCR
-+#define ONOCR 0
-+#endif
-+#ifndef OXTABS
-+#define OXTABS 0
-+#endif
-+#ifndef TAB3
-+#define TAB3 0
-+#endif
-+#ifndef TABDLY
-+#define TABDLY 0
-+#endif
-+#ifndef TOSTOP
-+#define TOSTOP 0
-+#endif
-+#ifndef VTDLY
-+#define VTDLY 0
-+#endif
-+#ifndef XCASE
-+#define XCASE 0
-+#endif
-+
- /*
-  * Reset the terminal mode bits to a sensible state.  Very useful after
-  * a child program dies in raw mode.
-@@ -195,6 +271,10 @@ out_char(int c)
- void
- reset_tty_settings(int fd, TTY * tty_settings, int noset)
- {
-+    unsigned mask;
-+#ifdef TIOCMGET
-+    int modem_bits;
-+#endif
-     GET_TTY(fd, tty_settings);
-
- #ifdef TERMIOS
-@@ -228,106 +308,65 @@ reset_tty_settings(int fd, TTY * tty_settings, int noset)
-     reset_char(VWERASE, CWERASE);
- #endif
-
--    tty_settings->c_iflag &= ~((unsigned) (IGNBRK
--					   | PARMRK
--					   | INPCK
--					   | ISTRIP
--					   | INLCR
--					   | IGNCR
--#ifdef IUCLC
--					   | IUCLC
--#endif
--#ifdef IXANY
--					   | IXANY
--#endif
--					   | IXOFF));
--
--    tty_settings->c_iflag |= (BRKINT
--			      | IGNPAR
--			      | ICRNL
--			      | IXON
--#ifdef IMAXBEL
--			      | IMAXBEL
--#endif
--	);
--
--    tty_settings->c_oflag &= ~((unsigned) (0
--#ifdef OLCUC
--					   | OLCUC
--#endif
--#ifdef OCRNL
--					   | OCRNL
--#endif
--#ifdef ONOCR
--					   | ONOCR
--#endif
--#ifdef ONLRET
--					   | ONLRET
--#endif
--#ifdef OFILL
--					   | OFILL
--#endif
--#ifdef OFDEL
--					   | OFDEL
--#endif
--#ifdef NLDLY
--					   | NLDLY
--#endif
--#ifdef CRDLY
--					   | CRDLY
--#endif
--#ifdef TABDLY
--					   | TABDLY
--#endif
--#ifdef BSDLY
--					   | BSDLY
--#endif
--#ifdef VTDLY
--					   | VTDLY
--#endif
--#ifdef FFDLY
--					   | FFDLY
--#endif
--			       ));
--
--    tty_settings->c_oflag |= (OPOST
--#ifdef ONLCR
--			      | ONLCR
--#endif
--	);
--
--    tty_settings->c_cflag &= ~((unsigned) (CSIZE
--					   | CSTOPB
--					   | PARENB
--					   | PARODD
--					   | CLOCAL));
--    tty_settings->c_cflag |= (CS8 | CREAD);
--    tty_settings->c_lflag &= ~((unsigned) (ECHONL
--					   | NOFLSH
--#ifdef TOSTOP
--					   | TOSTOP
--#endif
--#ifdef ECHOPTR
--					   | ECHOPRT
--#endif
--#ifdef XCASE
--					   | XCASE
--#endif
--			       ));
--
--    tty_settings->c_lflag |= (ISIG
--			      | ICANON
--			      | ECHO
--			      | ECHOE
--			      | ECHOK
--#ifdef ECHOCTL
--			      | ECHOCTL
--#endif
--#ifdef ECHOKE
--			      | ECHOKE
--#endif
--	);
--#endif
-+    clear_flags(tty_settings->c_iflag, (IGNBRK
-+                                       | PARMRK
-+                                       | INPCK
-+                                       | ISTRIP
-+                                       | INLCR
-+                                       | IGNCR
-+                                       | IUCLC
-+                                       | IXANY
-+                                       | IXOFF));
-+
-+    set_flags(tty_settings->c_iflag, (BRKINT
-+                                     | IGNPAR
-+                                     | ICRNL
-+                                     | IXON
-+                                     | IMAXBEL));
-+
-+    clear_flags(tty_settings->c_oflag, (0
-+                                       | OLCUC
-+                                       | OCRNL
-+                                       | ONOCR
-+                                       | ONLRET
-+                                       | OFILL
-+                                       | OFDEL
-+                                       | NLDLY
-+                                       | CRDLY
-+                                       | TABDLY
-+                                       | BSDLY
-+                                       | VTDLY
-+                                       | FFDLY));
-+
-+    set_flags(tty_settings->c_oflag, (OPOST
-+                                     | ONLCR));
-+
-+    mask = (CSIZE | CSTOPB | PARENB | PARODD);
-+#ifdef TIOCMGET
-+    /* leave clocal alone if this appears to use a modem */
-+    if (ioctl(fd, TIOCMGET, &modem_bits) == -1)
-+       mask |= CLOCAL;
-+#else
-+    /* cannot check - use the behavior from tset */
-+    mask |= CLOCAL;
-+#endif
-+    clear_flags(tty_settings->c_cflag, mask);
-+
-+    set_flags(tty_settings->c_cflag, (CS8 | CREAD));
-+    clear_flags(tty_settings->c_lflag, (ECHONL
-+                                       | NOFLSH
-+                                       | TOSTOP
-+                                       | ECHOPRT
-+                                       | XCASE));
-+
-+    set_flags(tty_settings->c_lflag, (ISIG
-+                                     | ICANON
-+                                     | ECHO
-+                                     | ECHOE
-+                                     | ECHOK
-+                                     | ECHOCTL
-+                                     | ECHOKE));
-+#endif /* TERMIOS */
-
-     if (!noset) {
-	SET_TTY(fd, tty_settings);
-@@ -402,29 +441,23 @@ set_conversions(TTY * tty_settings)
- #if defined(EXP_WIN32_DRIVER)
-     /* FIXME */
- #else
--#ifdef ONLCR
--    tty_settings->c_oflag |= ONLCR;
--#endif
--    tty_settings->c_iflag |= ICRNL;
--    tty_settings->c_lflag |= ECHO;
--#ifdef OXTABS
--    tty_settings->c_oflag |= OXTABS;
--#endif /* OXTABS */
-+    set_flags(tty_settings->c_oflag, ONLCR);
-+    set_flags(tty_settings->c_iflag, ICRNL);
-+    set_flags(tty_settings->c_lflag, ECHO);
-+    set_flags(tty_settings->c_oflag, OXTABS);
-
-     /* test used to be tgetflag("NL") */
-     if (VALID_STRING(newline) && newline[0] == '\n' && !newline[1]) {
-	/* Newline, not linefeed. */
--#ifdef ONLCR
--	tty_settings->c_oflag &= ~((unsigned) ONLCR);
--#endif
--	tty_settings->c_iflag &= ~((unsigned) ICRNL);
-+        clear_flags(tty_settings->c_oflag, ONLCR);
-+        clear_flags(tty_settings->c_iflag, ICRNL);
-     }
--#ifdef OXTABS
-+#if OXTABS
-     /* test used to be tgetflag("pt") */
-     if (VALID_STRING(set_tab) && VALID_STRING(clear_all_tabs))
--	tty_settings->c_oflag &= ~OXTABS;
-+	clear_flags(tty_settings->c_oflag, OXTABS);
- #endif /* OXTABS */
--    tty_settings->c_lflag |= (ECHOE | ECHOK);
-+    set_flags(tty_settings->c_lflag, (ECHOE | ECHOK));
- #endif
- }
-
-@@ -490,7 +523,7 @@ send_init_strings(int fd GCC_UNUSED, TTY * old_settings)
-     bool need_flush = FALSE;
-
-     (void) old_settings;
--#ifdef TAB3
-+#if TAB3
-     if (old_settings != 0 &&
-	old_settings->c_oflag & (TAB3 | ONLCR | OCRNL | ONLRET)) {
-	old_settings->c_oflag &= (TAB3 | ONLCR | OCRNL | ONLRET);
-@@ -512,22 +545,22 @@ send_init_strings(int fd GCC_UNUSED, TTY * old_settings)
-
-	if (VALID_STRING(clear_margins)) {
-	    need_flush |= sent_string(clear_margins);
--	} else
-+	}
- #if defined(set_lr_margin)
--	if (VALID_STRING(set_lr_margin)) {
-+	else if (VALID_STRING(set_lr_margin)) {
-	    need_flush |= sent_string(TIPARM_2(set_lr_margin, 0, columns - 1));
--	} else
-+	}
- #endif
- #if defined(set_left_margin_parm) && defined(set_right_margin_parm)
--	    if (VALID_STRING(set_left_margin_parm)
--		&& VALID_STRING(set_right_margin_parm)) {
-+	else if (VALID_STRING(set_left_margin_parm)
-+	  	 && VALID_STRING(set_right_margin_parm)) {
-	    need_flush |= sent_string(TIPARM_1(set_left_margin_parm, 0));
-	    need_flush |= sent_string(TIPARM_1(set_right_margin_parm,
-					       columns - 1));
--	} else
-+	}
- #endif
--	    if (VALID_STRING(set_left_margin)
--		&& VALID_STRING(set_right_margin)) {
-+	else if (VALID_STRING(set_left_margin)
-+		 && VALID_STRING(set_right_margin)) {
-	    need_flush |= to_left_margin();
-	    need_flush |= sent_string(set_left_margin);
-	    if (VALID_STRING(parm_right_cursor)) {
-diff --git a/progs/tabs.c b/progs/tabs.c
-index 7378d116..d904330b 100644
---- a/progs/tabs.c
-+++ b/progs/tabs.c
-@@ -370,7 +370,9 @@ do_set_margin(int margin, bool no_op)
-	    }
-	    tputs(set_left_margin, 1, putch);
-	}
--    } else if (VALID_STRING(set_left_margin_parm)) {
-+    }
-+#if defined(set_left_margin_parm) && defined(set_right_margin_parm)
-+    else if (VALID_STRING(set_left_margin_parm)) {
-	result = TRUE;
-	if (!no_op) {
-	    if (VALID_STRING(set_right_margin_parm)) {
-@@ -379,12 +381,16 @@ do_set_margin(int margin, bool no_op)
-		tputs(TIPARM_2(set_left_margin_parm, margin, max_cols), 1, putch);
-	    }
-	}
--    } else if (VALID_STRING(set_lr_margin)) {
-+    }
-+#endif
-+#if defined(set_lr_margin)
-+    else if (VALID_STRING(set_lr_margin)) {
-	result = TRUE;
-	if (!no_op) {
-	    tputs(TIPARM_2(set_lr_margin, margin, max_cols), 1, putch);
-	}
-     }
-+#endif
-     return result;
- }
-
-diff --git a/progs/tic.c b/progs/tic.c
-index 888927e2..78b568fa 100644
---- a/progs/tic.c
-+++ b/progs/tic.c
-@@ -3142,6 +3142,7 @@ guess_ANSI_VTxx(TERMTYPE2 *tp)
-  * In particular, any ECMA-48 terminal should support these, though the details
-  * for u9 are implementation dependent.
-  */
-+#if defined(user6) && defined(user7) && defined(user8) && defined(user9)
- static void
- check_user_6789(TERMTYPE2 *tp)
- {
-@@ -3177,6 +3178,9 @@ check_user_6789(TERMTYPE2 *tp)
-	break;
-     }
- }
-+#else
-+#define check_user_6789(tp)    /* nothing */
-+#endif
-
- /* other sanity-checks (things that we don't want in the normal
-  * logic that reads a terminfo entry)
---
-2.40.0
diff --git a/meta/recipes-core/ncurses/files/0001-tic-hang.patch b/meta/recipes-core/ncurses/files/0001-tic-hang.patch
index f98a943e5c..8cb92a3939 100644
--- a/meta/recipes-core/ncurses/files/0001-tic-hang.patch
+++ b/meta/recipes-core/ncurses/files/0001-tic-hang.patch
@@ -1,7 +1,7 @@
-From 168ba7a681be73ac024438e33e14fde1d5aea97d Mon Sep 17 00:00:00 2001
+From a51a53f0eecfd4d083aba8dfcd47c65e93978ff1 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 30 Mar 2018 10:02:24 +0800
-Subject: [PATCH 1/2] tic hang
+Subject: [PATCH] tic hang
 
 Upstream-Status: Inappropriate [configuration]
 
@@ -17,10 +17,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 5 insertions(+), 6 deletions(-)
 
 diff --git a/misc/terminfo.src b/misc/terminfo.src
-index 84f4810..6b385ec 100644
+index 5d575b8e..f9cc6880 100644
 --- a/misc/terminfo.src
 +++ b/misc/terminfo.src
-@@ -5562,12 +5562,11 @@ konsole-xf3x|KDE console window with keyboard for XFree86 3.x xterm,
+@@ -6518,12 +6518,11 @@ konsole-xf3x|KDE console window with keyboard for XFree86 3.x xterm,
  # The value for kbs (see konsole-vt100) reflects local customization rather
  # than the settings used for XFree86 xterm.
  konsole-xf4x|KDE console window with keyboard for XFree86 4.x xterm,
@@ -38,6 +38,3 @@ index 84f4810..6b385ec 100644
  
  # Obsolete: vt100.keymap
  # KDE's "vt100" keyboard has no relationship to any terminal that DEC made, but
--- 
-1.8.3.1
-
diff --git a/meta/recipes-core/ncurses/files/0002-configure-reproducible.patch b/meta/recipes-core/ncurses/files/0002-configure-reproducible.patch
index 66f26c06ab..11ca66c8e8 100644
--- a/meta/recipes-core/ncurses/files/0002-configure-reproducible.patch
+++ b/meta/recipes-core/ncurses/files/0002-configure-reproducible.patch
@@ -1,4 +1,4 @@
-From ec87e53066a9942e9aaba817d71268342f5e83b9 Mon Sep 17 00:00:00 2001
+From 63cf58044f4ab3297c5a2d0e132e87ebfa80c753 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 16 Aug 2017 14:45:27 +0800
 Subject: [PATCH] configure: reproducible
@@ -13,16 +13,15 @@ Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
 Rebase to 6.1
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  configure | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index 421cf859..a1b7840d 100755
+index 488d93fc..005d44e2 100755
 --- a/configure
 +++ b/configure
-@@ -5072,7 +5072,7 @@ else
+@@ -5129,7 +5129,7 @@ else
  		;;
  	(*)
  		cf_cv_ar_flags=unknown
diff --git a/meta/recipes-core/ncurses/files/0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch b/meta/recipes-core/ncurses/files/0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch
index a15694d4d4..d89399bbe5 100644
--- a/meta/recipes-core/ncurses/files/0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch
+++ b/meta/recipes-core/ncurses/files/0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch
@@ -1,4 +1,4 @@
-From 10cd0c12a6e14fb4f0498c299c1dd32720b710da Mon Sep 17 00:00:00 2001
+From 5962a5ee2885f67a396f7e8955ac1bbd7f15d4aa Mon Sep 17 00:00:00 2001
 From: Nathan Rossi <nathan@nathanrossi.com>
 Date: Mon, 14 Dec 2020 13:39:02 +1000
 Subject: [PATCH] gen-pkgconfig.in: Do not include LDFLAGS in generated pc
@@ -10,13 +10,12 @@ includes build host specific paths and options (e.g. uninative and
 
 Upstream-Status: Inappropriate [OE Specific]
 Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
-
 ---
  misc/gen-pkgconfig.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/misc/gen-pkgconfig.in b/misc/gen-pkgconfig.in
-index a45dd54f..85273054 100644
+index 89a5cd4a..07d94d17 100644
 --- a/misc/gen-pkgconfig.in
 +++ b/misc/gen-pkgconfig.in
 @@ -83,7 +83,7 @@ if [ "$includedir" != "/usr/include" ]; then
diff --git a/meta/recipes-core/ncurses/files/CVE-2023-45918.patch b/meta/recipes-core/ncurses/files/CVE-2023-45918.patch
deleted file mode 100644
index fbdae49a61..0000000000
--- a/meta/recipes-core/ncurses/files/CVE-2023-45918.patch
+++ /dev/null
@@ -1,180 +0,0 @@
-From bcf02d3242f1c7d57224a95f7903fcf4b5e7695d Mon Sep 17 00:00:00 2001
-From: Thomas E. Dickey <dickey@invisible-island.net>
-Date: Fri, 16 Jun 2023 02:54:29 +0530
-Subject: [PATCH] Fix CVE-2023-45918
-
-CVE: CVE-2023-45918
-
-Upstream-Status: Backport [https://ncurses.scripts.mit.edu/?p=ncurses.git;a=commit;h=bcf02d3242f1c7d57224a95f7903fcf4b5e7695d]
-
-Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
----
- ncurses/tinfo/comp_error.c | 15 ++++++---
- ncurses/tinfo/read_entry.c | 65 ++++++++++++++++++++++++++------------
- 2 files changed, 56 insertions(+), 24 deletions(-)
-
-diff --git a/ncurses/tinfo/comp_error.c b/ncurses/tinfo/comp_error.c
-index 48f48784..ee518e28 100644
---- a/ncurses/tinfo/comp_error.c
-+++ b/ncurses/tinfo/comp_error.c
-@@ -60,8 +60,15 @@ _nc_get_source(void)
- NCURSES_EXPORT(void)
- _nc_set_source(const char *const name)
- {
--    FreeIfNeeded(SourceName);
--    SourceName = strdup(name);
-+    if (name == NULL) {
-+	free(SourceName);
-+	SourceName = NULL;
-+    } else if (SourceName == NULL) {
-+	SourceName = strdup(name);
-+    } else if (strcmp(name, SourceName)) {
-+	free(SourceName);
-+	SourceName = strdup(name);
-+    }
- }
-
- NCURSES_EXPORT(void)
-@@ -95,9 +102,9 @@ static NCURSES_INLINE void
- where_is_problem(void)
- {
-     fprintf(stderr, "\"%s\"", SourceName ? SourceName : "?");
--    if (_nc_curr_line >= 0)
-+    if (_nc_curr_line > 0)
-	fprintf(stderr, ", line %d", _nc_curr_line);
--    if (_nc_curr_col >= 0)
-+    if (_nc_curr_col > 0)
-	fprintf(stderr, ", col %d", _nc_curr_col);
-     if (TermType != 0 && TermType[0] != '\0')
-	fprintf(stderr, ", terminal '%s'", TermType);
-diff --git a/ncurses/tinfo/read_entry.c b/ncurses/tinfo/read_entry.c
-index 341337d2..b0c3ad26 100644
---- a/ncurses/tinfo/read_entry.c
-+++ b/ncurses/tinfo/read_entry.c
-@@ -138,12 +138,13 @@ convert_16bits(char *buf, NCURSES_INT2 *Numbers, int count)
- }
- #endif
-
--static void
--convert_strings(char *buf, char **Strings, int count, int size, char *table)
-+static bool
-+convert_strings(char *buf, char **Strings, int count, int size,
-+		char *table, bool always)
- {
-     int i;
-     char *p;
--    bool corrupt = FALSE;
-+    bool success = TRUE;
-
-     for (i = 0; i < count; i++) {
-	if (IS_NEG1(buf + 2 * i)) {
-@@ -159,13 +160,10 @@ convert_strings(char *buf, char **Strings, int count, int size, char *table)
-		TR(TRACE_DATABASE, ("Strings[%d] = %s", i,
-				    _nc_visbuf(Strings[i])));
-	    } else {
--		if (!corrupt) {
--		    corrupt = TRUE;
--		    TR(TRACE_DATABASE,
--		       ("ignore out-of-range index %d to Strings[]", nn));
--		    _nc_warning("corrupt data found in convert_strings");
--		}
--		Strings[i] = ABSENT_STRING;
-+		TR(TRACE_DATABASE,
-+		   ("found out-of-range index %d to Strings[%d]", nn, i));
-+		success = FALSE;
-+		break;
-	    }
-	}
-
-@@ -175,10 +173,25 @@ convert_strings(char *buf, char **Strings, int count, int size, char *table)
-		if (*p == '\0')
-		    break;
-	    /* if there is no NUL, ignore the string */
--	    if (p >= table + size)
-+	    if (p >= table + size) {
-		Strings[i] = ABSENT_STRING;
-+	    } else if (p == Strings[i] && always) {
-+		TR(TRACE_DATABASE,
-+		   ("found empty but required Strings[%d]", i));
-+		success = FALSE;
-+		break;
-+	    }
-+	} else if (always) {	/* names are always needed */
-+	    TR(TRACE_DATABASE,
-+	       ("found invalid but required Strings[%d]", i));
-+	    success = FALSE;
-+	    break;
-	}
-     }
-+    if (!success) {
-+	_nc_warning("corrupt data found in convert_strings");
-+    }
-+    return success;
- }
-
- static int
-@@ -382,7 +395,10 @@ _nc_read_termtype(TERMTYPE2 *ptr, char *buffer, int limit)
-	if (Read(string_table, (unsigned) str_size) != str_size) {
-	    returnDB(TGETENT_NO);
-	}
--	convert_strings(buf, ptr->Strings, str_count, str_size, string_table);
-+	if (!convert_strings(buf, ptr->Strings, str_count, str_size,
-+			     string_table, FALSE)) {
-+	    returnDB(TGETENT_NO);
-+	}
-     }
- #if NCURSES_XNAMES
-
-@@ -483,8 +499,10 @@ _nc_read_termtype(TERMTYPE2 *ptr, char *buffer, int limit)
-	       ("Before computing extended-string capabilities "
-		"str_count=%d, ext_str_count=%d",
-		str_count, ext_str_count));
--	    convert_strings(buf, ptr->Strings + str_count, ext_str_count,
--			    ext_str_limit, ptr->ext_str_table);
-+	    if (!convert_strings(buf, ptr->Strings + str_count, ext_str_count,
-+				 ext_str_limit, ptr->ext_str_table, FALSE)) {
-+		returnDB(TGETENT_NO);
-+	    }
-	    for (i = ext_str_count - 1; i >= 0; i--) {
-		TR(TRACE_DATABASE, ("MOVE from [%d:%d] %s",
-				    i, i + str_count,
-@@ -516,10 +534,13 @@ _nc_read_termtype(TERMTYPE2 *ptr, char *buffer, int limit)
-	    TR(TRACE_DATABASE,
-	       ("ext_NAMES starting @%d in extended_strings, first = %s",
-		base, _nc_visbuf(ptr->ext_str_table + base)));
--	    convert_strings(buf + (2 * ext_str_count),
--			    ptr->ext_Names,
--			    (int) need,
--			    ext_str_limit, ptr->ext_str_table + base);
-+	    if (!convert_strings(buf + (2 * ext_str_count),
-+				 ptr->ext_Names,
-+				 (int) need,
-+				 ext_str_limit, ptr->ext_str_table + base,
-+				 TRUE)) {
-+		returnDB(TGETENT_NO);
-+	    }
-	}
-
-	TR(TRACE_DATABASE,
-@@ -572,13 +593,17 @@ _nc_read_file_entry(const char *const filename, TERMTYPE2 *ptr)
-	int limit;
-	char buffer[MAX_ENTRY_SIZE + 1];
-
--	if ((limit = (int) fread(buffer, sizeof(char), sizeof(buffer), fp))
--	    > 0) {
-+	limit = (int) fread(buffer, sizeof(char), sizeof(buffer), fp);
-+	if (limit > 0) {
-+	    const char *old_source = _nc_get_source();
-
-	    TR(TRACE_DATABASE, ("read terminfo %s", filename));
-+	    if (old_source == NULL)
-+		_nc_set_source(filename);
-	    if ((code = _nc_read_termtype(ptr, buffer, limit)) == TGETENT_NO) {
-		_nc_free_termtype2(ptr);
-	    }
-+	    _nc_set_source(old_source);
-	} else {
-	    code = TGETENT_NO;
-	}
---
-2.40.0
diff --git a/meta/recipes-core/ncurses/files/CVE-2023-50495.patch b/meta/recipes-core/ncurses/files/CVE-2023-50495.patch
deleted file mode 100644
index 7d90ddd30f..0000000000
--- a/meta/recipes-core/ncurses/files/CVE-2023-50495.patch
+++ /dev/null
@@ -1,301 +0,0 @@
-From 7daae3f2139a678fe0ae0b42fcf8d807cbff485c Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Sun, 4 Feb 2024 13:42:38 +0800
-Subject: [PATCH] parse_entry.c: check return value of _nc_save_str
-
-* check return value of _nc_save_str(), in special case for tic where
-extended capabilities are processed but the terminal description was
-not initialized (report by Ziqiao Kong).
-
-* regenerate llib-* files.
-
-CVE: CVE-2023-50495
-
-Upstream-Status: Backport [http://ncurses.scripts.mit.edu/?p=ncurses.git;a=commitdiff;h=7723dd6799ab10b32047ec73b14df9f107bafe99]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- ncurses/llib-lncurses       | 15 +++++++++++++++
- ncurses/llib-lncursest      | 15 +++++++++++++++
- ncurses/llib-lncursestw     | 15 +++++++++++++++
- ncurses/llib-lncursesw      | 15 +++++++++++++++
- ncurses/llib-ltinfo         | 15 +++++++++++++++
- ncurses/llib-ltinfot        | 15 +++++++++++++++
- ncurses/llib-ltinfotw       | 15 +++++++++++++++
- ncurses/llib-ltinfow        | 15 +++++++++++++++
- ncurses/tinfo/parse_entry.c | 23 ++++++++++++++++-------
- 9 files changed, 136 insertions(+), 7 deletions(-)
-
-diff --git a/ncurses/llib-lncurses b/ncurses/llib-lncurses
-index 211cf3b7..e4190aa2 100644
---- a/ncurses/llib-lncurses
-+++ b/ncurses/llib-lncurses
-@@ -3656,6 +3656,21 @@ char	*tiparm(
- 		...)
- 		{ return(*(char **)0); }
- 
-+#undef tiparm_s
-+char	*tiparm_s(
-+		int	num_expected,
-+		int	tparm_type,
-+		const char *string,
-+		...)
-+		{ return(*(char **)0); }
-+
-+#undef tiscan_s
-+int	tiscan_s(
-+		int	*num_expected,
-+		int	*tparm_type,
-+		const char *string)
-+		{ return(*(int *)0); }
-+
- #undef _nc_tiparm
- char	*_nc_tiparm(
- 		int	expected,
-diff --git a/ncurses/llib-lncursest b/ncurses/llib-lncursest
-index 1b09d676..e07abba6 100644
---- a/ncurses/llib-lncursest
-+++ b/ncurses/llib-lncursest
-@@ -3741,6 +3741,21 @@ char	*tiparm(
- 		...)
- 		{ return(*(char **)0); }
- 
-+#undef tiparm_s
-+char	*tiparm_s(
-+		int	num_expected,
-+		int	tparm_type,
-+		const char *string,
-+		...)
-+		{ return(*(char **)0); }
-+
-+#undef tiscan_s
-+int	tiscan_s(
-+		int	*num_expected,
-+		int	*tparm_type,
-+		const char *string)
-+		{ return(*(int *)0); }
-+
- #undef _nc_tiparm
- char	*_nc_tiparm(
- 		int	expected,
-diff --git a/ncurses/llib-lncursestw b/ncurses/llib-lncursestw
-index 4576e0fc..747c6be8 100644
---- a/ncurses/llib-lncursestw
-+++ b/ncurses/llib-lncursestw
-@@ -4702,6 +4702,21 @@ char	*tiparm(
- 		...)
- 		{ return(*(char **)0); }
- 
-+#undef tiparm_s
-+char	*tiparm_s(
-+		int	num_expected,
-+		int	tparm_type,
-+		const char *string,
-+		...)
-+		{ return(*(char **)0); }
-+
-+#undef tiscan_s
-+int	tiscan_s(
-+		int	*num_expected,
-+		int	*tparm_type,
-+		const char *string)
-+		{ return(*(int *)0); }
-+
- #undef _nc_tiparm
- char	*_nc_tiparm(
- 		int	expected,
-diff --git a/ncurses/llib-lncursesw b/ncurses/llib-lncursesw
-index 127350d2..862305d9 100644
---- a/ncurses/llib-lncursesw
-+++ b/ncurses/llib-lncursesw
-@@ -4617,6 +4617,21 @@ char	*tiparm(
- 		...)
- 		{ return(*(char **)0); }
- 
-+#undef tiparm_s
-+char	*tiparm_s(
-+		int	num_expected,
-+		int	tparm_type,
-+		const char *string,
-+		...)
-+		{ return(*(char **)0); }
-+
-+#undef tiscan_s
-+int	tiscan_s(
-+		int	*num_expected,
-+		int	*tparm_type,
-+		const char *string)
-+		{ return(*(int *)0); }
-+
- #undef _nc_tiparm
- char	*_nc_tiparm(
- 		int	expected,
-diff --git a/ncurses/llib-ltinfo b/ncurses/llib-ltinfo
-index a5cd7cd3..31e5e9a6 100644
---- a/ncurses/llib-ltinfo
-+++ b/ncurses/llib-ltinfo
-@@ -927,6 +927,21 @@ char	*tiparm(
- 		...)
- 		{ return(*(char **)0); }
- 
-+#undef tiparm_s
-+char	*tiparm_s(
-+		int	num_expected,
-+		int	tparm_type,
-+		const char *string,
-+		...)
-+		{ return(*(char **)0); }
-+
-+#undef tiscan_s
-+int	tiscan_s(
-+		int	*num_expected,
-+		int	*tparm_type,
-+		const char *string)
-+		{ return(*(int *)0); }
-+
- #undef _nc_tiparm
- char	*_nc_tiparm(
- 		int	expected,
-diff --git a/ncurses/llib-ltinfot b/ncurses/llib-ltinfot
-index bd3de812..48e5c25a 100644
---- a/ncurses/llib-ltinfot
-+++ b/ncurses/llib-ltinfot
-@@ -1003,6 +1003,21 @@ char	*tiparm(
- 		...)
- 		{ return(*(char **)0); }
- 
-+#undef tiparm_s
-+char	*tiparm_s(
-+		int	num_expected,
-+		int	tparm_type,
-+		const char *string,
-+		...)
-+		{ return(*(char **)0); }
-+
-+#undef tiscan_s
-+int	tiscan_s(
-+		int	*num_expected,
-+		int	*tparm_type,
-+		const char *string)
-+		{ return(*(int *)0); }
-+
- #undef _nc_tiparm
- char	*_nc_tiparm(
- 		int	expected,
-diff --git a/ncurses/llib-ltinfotw b/ncurses/llib-ltinfotw
-index 4d35a1e1..64dfdfa5 100644
---- a/ncurses/llib-ltinfotw
-+++ b/ncurses/llib-ltinfotw
-@@ -1025,6 +1025,21 @@ char	*tiparm(
- 		...)
- 		{ return(*(char **)0); }
- 
-+#undef tiparm_s
-+char	*tiparm_s(
-+		int	num_expected,
-+		int	tparm_type,
-+		const char *string,
-+		...)
-+		{ return(*(char **)0); }
-+
-+#undef tiscan_s
-+int	tiscan_s(
-+		int	*num_expected,
-+		int	*tparm_type,
-+		const char *string)
-+		{ return(*(int *)0); }
-+
- #undef _nc_tiparm
- char	*_nc_tiparm(
- 		int	expected,
-diff --git a/ncurses/llib-ltinfow b/ncurses/llib-ltinfow
-index db846764..7e17a35f 100644
---- a/ncurses/llib-ltinfow
-+++ b/ncurses/llib-ltinfow
-@@ -949,6 +949,21 @@ char	*tiparm(
- 		...)
- 		{ return(*(char **)0); }
- 
-+#undef tiparm_s
-+char	*tiparm_s(
-+		int	num_expected,
-+		int	tparm_type,
-+		const char *string,
-+		...)
-+		{ return(*(char **)0); }
-+
-+#undef tiscan_s
-+int	tiscan_s(
-+		int	*num_expected,
-+		int	*tparm_type,
-+		const char *string)
-+		{ return(*(int *)0); }
-+
- #undef _nc_tiparm
- char	*_nc_tiparm(
- 		int	expected,
-diff --git a/ncurses/tinfo/parse_entry.c b/ncurses/tinfo/parse_entry.c
-index 14bcb67e..0a0b5637 100644
---- a/ncurses/tinfo/parse_entry.c
-+++ b/ncurses/tinfo/parse_entry.c
-@@ -110,7 +110,7 @@ _nc_extend_names(ENTRY * entryp, const char *name, int token_type)
- 	/* Well, we are given a cancel for a name that we don't recognize */
- 	return _nc_extend_names(entryp, name, STRING);
-     default:
--	return 0;
-+	return NULL;
-     }
- 
-     /* Adjust the 'offset' (insertion-point) to keep the lists of extended
-@@ -142,6 +142,11 @@ _nc_extend_names(ENTRY * entryp, const char *name, int token_type)
- 	for (last = (unsigned) (max - 1); last > tindex; last--)
- 
-     if (!found) {
-+	char *saved;
-+
-+	if ((saved = _nc_save_str(name)) == NULL)
-+	    return NULL;
-+
- 	switch (token_type) {
- 	case BOOLEAN:
- 	    tp->ext_Booleans++;
-@@ -169,7 +174,7 @@ _nc_extend_names(ENTRY * entryp, const char *name, int token_type)
- 	TYPE_REALLOC(char *, actual, tp->ext_Names);
- 	while (--actual > offset)
- 	    tp->ext_Names[actual] = tp->ext_Names[actual - 1];
--	tp->ext_Names[offset] = _nc_save_str(name);
-+	tp->ext_Names[offset] = saved;
-     }
- 
-     temp.nte_name = tp->ext_Names[offset];
-@@ -364,6 +369,8 @@ _nc_parse_entry(ENTRY * entryp, int literal, bool silent)
- 	bool is_use = (strcmp(_nc_curr_token.tk_name, "use") == 0);
- 	bool is_tc = !is_use && (strcmp(_nc_curr_token.tk_name, "tc") == 0);
- 	if (is_use || is_tc) {
-+	    char *saved;
-+
- 	    if (!VALID_STRING(_nc_curr_token.tk_valstring)
- 		|| _nc_curr_token.tk_valstring[0] == '\0') {
- 		_nc_warning("missing name for use-clause");
-@@ -377,11 +384,13 @@ _nc_parse_entry(ENTRY * entryp, int literal, bool silent)
- 			    _nc_curr_token.tk_valstring);
- 		continue;
- 	    }
--	    entryp->uses[entryp->nuses].name = _nc_save_str(_nc_curr_token.tk_valstring);
--	    entryp->uses[entryp->nuses].line = _nc_curr_line;
--	    entryp->nuses++;
--	    if (entryp->nuses > 1 && is_tc) {
--		BAD_TC_USAGE
-+	    if ((saved = _nc_save_str(_nc_curr_token.tk_valstring)) != NULL) {
-+			entryp->uses[entryp->nuses].name = saved;
-+			entryp->uses[entryp->nuses].line = _nc_curr_line;
-+			entryp->nuses++;
-+			if (entryp->nuses > 1 && is_tc) {
-+			    BAD_TC_USAGE
-+		    }
- 	    }
- 	} else {
- 	    /* normal token lookup */
--- 
-2.25.1
-
diff --git a/meta/recipes-core/ncurses/files/exit_prototype.patch b/meta/recipes-core/ncurses/files/exit_prototype.patch
index fd961512e0..299852d2c0 100644
--- a/meta/recipes-core/ncurses/files/exit_prototype.patch
+++ b/meta/recipes-core/ncurses/files/exit_prototype.patch
@@ -1,28 +1,27 @@
-From 4a769a441d7e57a23017c3037cde3e53fb9f35fe Mon Sep 17 00:00:00 2001
+From af798dceafec8a9ea3f83fc250d784511ca0a29c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 30 Aug 2022 15:58:32 -0700
 Subject: [PATCH] Add needed headers for including mbstate_t and exit()
 
 Upstream-Status: Inappropriate [Reconfigure will solve it]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  configure | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/configure b/configure
-index f377f551..163f8899 100755
+index 005d44e2..72fa6c23 100755
 --- a/configure
 +++ b/configure
-@@ -3423,6 +3423,7 @@ rm -f "conftest.$ac_objext" "conftest.$ac_ext"
+@@ -3462,6 +3462,7 @@ rm -f "conftest.$ac_objext" "conftest.$ac_ext"
    cat >"conftest.$ac_ext" <<_ACEOF
- #line 3424 "configure"
+ #line 3463 "configure"
  #include "confdefs.h"
 +#include <stdlib.h>
  $ac_declaration
  int
  main (void)
-@@ -13111,6 +13112,7 @@ cat >"conftest.$ac_ext" <<_ACEOF
+@@ -13533,6 +13534,7 @@ cat >"conftest.$ac_ext" <<_ACEOF
  #include <stdlib.h>
  #include <stdarg.h>
  #include <stdio.h>
diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 3b72f3efdd..2a3fd4f2c5 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -2,7 +2,7 @@ SUMMARY = "The New Curses library"
 DESCRIPTION = "SVr4 and XSI-Curses compatible curses library and terminfo tools including tic, infocmp, captoinfo. Supports color, multiple highlights, forms-drawing characters, and automatic recognition of keypad and function-key sequences. Extensions include resizable windows and mouse support on both xterm and Linux console using the gpm library."
 HOMEPAGE = "http://www.gnu.org/software/ncurses/ncurses.html"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c5a4600fdef86384c41ca33ecc70a4b8;endline=27"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6f291ee54551d9d8d992ecd623fe4bc7;endline=27"
 SECTION = "libs"
 DEPENDS = "ncurses-native"
 DEPENDS:class-native = ""
diff --git a/meta/recipes-core/ncurses/ncurses_6.4.bb b/meta/recipes-core/ncurses/ncurses_6.5.bb
similarity index 68%
rename from meta/recipes-core/ncurses/ncurses_6.4.bb
rename to meta/recipes-core/ncurses/ncurses_6.5.bb
index 61558ecfa8..2e3ee337ea 100644
--- a/meta/recipes-core/ncurses/ncurses_6.4.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.5.bb
@@ -4,13 +4,9 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://0002-configure-reproducible.patch \
            file://0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch \
            file://exit_prototype.patch \
-           file://0001-Fix-CVE-2023-29491.patch \
-           file://0001-Updating-reset-code-ncurses-6.4-patch-20231104.patch \
-           file://CVE-2023-50495.patch \
-           file://CVE-2023-45918.patch \
            "
 # commit id corresponds to the revision in package version
-SRCREV = "1003914e200fd622a27237abca155ce6bf2e6030"
+SRCREV = "1c55d64d9d3e00399a21f04e9cac1e472ab5f70a"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+_\d+)$"
-- 
2.30.2


