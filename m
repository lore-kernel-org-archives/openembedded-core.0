Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1AC6C001DB
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 18:37:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.42936.1691433444441523610
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 11:37:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CNff6Jui;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7583fd2801=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 377F02TW018065
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Aug 2023 11:37:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=Q5LLY
	nBUzYC6gsZpVzA6KblZ+MpLYiBpWTMdtiWrhAU=; b=CNff6JuigTpheN3xyM04M
	Dvdp398QYMfNso6zI79Vt5V4iwQtKpyAV3hvB66oaY/Zs6MfzVsQ0zfenlRJToH5
	BEU5YhaIM44lk6jEOchDl87iLGHKhqGMUmHG6pzBObRACLO1iVAjK+r/ehGCmUqS
	ZhUxkVLncJMg0ZsDJ1LctdO4ygQcy3UGPFbQ8Pcus7g1+X5JNE948gm+bSzIHopL
	3mj2ZyGdssP1wCG297I0H7zPjTV3rq8KEYtbqwsVr6GimT1IzsfZf+aSu9oOPRKv
	HoovfjITzvJutkF6RhGYRuHVoPsz32IX2OpUqdcGlyXbZEidiEY0XXu/kCRluOo9
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s9nxfhjsm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 11:37:23 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 7 Aug 2023 11:37:21 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe-core]mickledore][PATCH 1/1] ncurses: fix CVE-2023-29491
Date: Mon, 7 Aug 2023 18:37:06 +0000
Message-ID: <20230807183706.3648673-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: ISHcZtbLchMdJ5vbaCkX2un2lwRvB6Tm
X-Proofpoint-ORIG-GUID: ISHcZtbLchMdJ5vbaCkX2un2lwRvB6Tm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-07_20,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 spamscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2306200000
 definitions=main-2308070170
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 18:37:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185619

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch to fix CVE-2023-29491.

(From OE-Core rev: f1c95ae70f7aac574daf5b935a02bbba0d6f8a16)

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
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
2.40.0


