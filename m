Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB3BC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 12:13:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.19946.1703074397138997720
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 04:13:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jCWzui2z;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0718af4d0d=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BKAdclq009993
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 12:13:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=ZOY7+
	/6TPdsKB7fpYjAfZCo/WktWf6+Z7P4T2wA+vCw=; b=jCWzui2z3ZFQ2fxTgsUxc
	7dNmXS38YqSPnBFFRo3gojlNOb8CWY7VHAHgsOc+Qio70ntna1qvuSPkUm7etCeP
	SMvBLPCDFqQwptbjJWTYCaomaalYg6373BOi37Np6yA5DcfzCStKn9B9j3FGoAqw
	e3pAs3lW1audtL5pury5oY50SHJMzYxTmJWwS1GpW0TGsmzk7LhUIs6HCRWjlFk2
	PipVTUmlmOtEACpvKqS4cr33rkYI3CAVM+0x02JWSjY41BRCbVM8FQqkJX5eVk/s
	NPRZIUxGQDyDCm4tV0XqahH69ppWzPlxzsaejJpZBD4yBxQfV8Ng8w82gyDgNDsv
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v113xcdkj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 12:13:16 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 04:13:19 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 1/1] ncurses: Fix - tty is hung after reset
Date: Wed, 20 Dec 2023 12:12:57 +0000
Message-ID: <20231220121257.2662071-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: drVT0tZQQYxhpIFVJF3LnK4APvZRoq-Y
X-Proofpoint-GUID: drVT0tZQQYxhpIFVJF3LnK4APvZRoq-Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2312200086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 12:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192795

From: Soumya Sambu <soumya.sambu@windriver.com>

Serial tty is hung after reset command -
$echo "test " >> /dev/ttyS0
test
$stty -a < /dev/ttyS0
speed 115200 baud; rows 34; columns 153; line = 0;
intr = ^C; quit = ^\; erase = ^?; kill = ^U; eof = ^D; eol = <undef>; eol2 = <undef>; swtch = <undef>;
start = ^Q; stop = ^S; susp = ^Z; rprnt = ^R;
werase = ^W; lnext = ^V; discard = ^O; min = 1; time = 0;
-parenb -parodd -cmspar cs8 hupcl -cstopb cread clocal -crtscts
-ignbrk -brkint -ignpar -parmrk -inpck -istrip -inlcr -igncr icrnl ixon ixoff -iuclc -ixany -imaxbel iutf8
opost -olcuc -ocrnl onlcr -onocr -onlret -ofill -ofdel nl0 cr0 tab0 bs0 vt0 ff0
isig icanon -iexten echo echoe echok -echonl -noflsh -xcase -tostop -echoprt echoctl echoke -flusho -extproc
$reset
$echo "test " >> /dev/ttyS0
^C
$stty -a < /dev/ttyS0
^C

Updating reset_tty_settings API with latest code which fixes tty hung issue

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 ...eset-code-ncurses-6.4-patch-20231104.patch | 499 ++++++++++++++++++
 meta/recipes-core/ncurses/ncurses_6.4.bb      |   1 +
 2 files changed, 500 insertions(+)
 create mode 100644 meta/recipes-core/ncurses/files/0001-Updating-reset-code-ncurses-6.4-patch-20231104.patch

diff --git a/meta/recipes-core/ncurses/files/0001-Updating-reset-code-ncurses-6.4-patch-20231104.patch b/meta/recipes-core/ncurses/files/0001-Updating-reset-code-ncurses-6.4-patch-20231104.patch
new file mode 100644
index 0000000000..121db6bffe
--- /dev/null
+++ b/meta/recipes-core/ncurses/files/0001-Updating-reset-code-ncurses-6.4-patch-20231104.patch
@@ -0,0 +1,499 @@
+From 135d37072755704b8d018e5de74e62ff3f28c930 Mon Sep 17 00:00:00 2001
+From: Thomas E. Dickey <dickey@invisible-island.net>
+Date: Sun, 5 Nov 2023 05:54:54 +0530
+Subject: [PATCH] Updating reset code - ncurses 6.4 - patch 20231104
+
++ modify reset command to avoid altering clocal if the terminal uses a
+  modem (prompted by discussion with Werner Fink, Michal Suchanek,
+  OpenSUSE #1201384, Debian #60377).
++ build-fixes for --with-caps variations.
++ correct a couple of section-references in INSTALL.
+
+Signed-off-by: Thomas E. Dickey <dickey@invisible-island.net>
+
+Upstream-Status: Backport [https://ncurses.scripts.mit.edu/?p=ncurses.git;a=commitdiff;h=135d37072755704b8d018e5de74e62ff3f28c930]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ INSTALL                   |   8 +-
+ include/curses.events     |   2 +-
+ ncurses/tinfo/lib_tparm.c |   2 +
+ progs/reset_cmd.c         | 281 +++++++++++++++++++++-----------------
+ progs/tabs.c              |  10 +-
+ progs/tic.c               |   4 +
+ 6 files changed, 176 insertions(+), 131 deletions(-)
+
+diff --git a/INSTALL b/INSTALL
+index d9c1dd12..d0a39af0 100644
+--- a/INSTALL
++++ b/INSTALL
+@@ -47,7 +47,7 @@ If you are converting from BSD curses and do not have root access, be sure
+ to read the BSD CONVERSION NOTES section below.
+
+ If you are trying to build applications using gpm with ncurses,
+-read the USING NCURSES WITH GPM section below.
++read the USING GPM section below.
+
+ If you are cross-compiling, see the note below on BUILDING WITH A CROSS-COMPILER.
+
+@@ -79,7 +79,7 @@ INSTALLATION PROCEDURE:
+     The --prefix option to configure changes the root directory for installing
+     ncurses.  The default is normally in subdirectories of /usr/local, except
+     for systems where ncurses is normally installed as a system library (see
+-    "IF YOU ARE A SYSTEM INTEGRATOR").  Use --prefix=/usr to replace your
++    "FOR SYSTEM INTEGRATORS").  Use --prefix=/usr to replace your
+     default curses distribution.
+
+     The package gets installed beneath the --prefix directory as follows:
+@@ -176,7 +176,7 @@ INSTALLATION PROCEDURE:
+     You can make curses and terminfo fall back to an existing file of termcap
+     definitions by configuring with --enable-termcap.  If you do this, the
+     library will search /etc/termcap before the terminfo database, and will
+-    also interpret the contents of the TERM environment variable.  See the
++    also interpret the contents of the $TERM environment variable.  See the
+     section BSD CONVERSION NOTES below.
+
+ 3.  Type `make'.  Ignore any warnings, no error messages should be produced.
+@@ -1231,7 +1231,7 @@ CONFIGURE OPTIONS:
+	Specify a search-list of terminfo directories which will be compiled
+	into the ncurses library (default: DATADIR/terminfo)
+
+-	This is a colon-separated list, like the TERMINFO_DIRS environment
++	This is a colon-separated list, like the $TERMINFO_DIRS environment
+	variable.
+
+     --with-termlib[=XXX]
+diff --git a/include/curses.events b/include/curses.events
+index 25a2583f..468bde18 100644
+--- a/include/curses.events
++++ b/include/curses.events
+@@ -50,6 +50,6 @@ typedef struct
+ extern NCURSES_EXPORT(int) wgetch_events (WINDOW *, _nc_eventlist *) GCC_DEPRECATED(experimental option); /* experimental */
+ extern NCURSES_EXPORT(int) wgetnstr_events (WINDOW *,char *,int,_nc_eventlist *) GCC_DEPRECATED(experimental option); /* experimental */
+
+-#define KEY_EVENT	0633		/* We were interrupted by an event */
++#define KEY_EVENT	0634		/* We were interrupted by an event */
+
+ #endif /* NCURSES_WGETCH_EVENTS */
+diff --git a/ncurses/tinfo/lib_tparm.c b/ncurses/tinfo/lib_tparm.c
+index a10a3877..cd972c0f 100644
+--- a/ncurses/tinfo/lib_tparm.c
++++ b/ncurses/tinfo/lib_tparm.c
+@@ -1113,8 +1113,10 @@ check_string_caps(TPARM_DATA *data, const char *string)
+	    want_type = 2;	/* function key #1, transmit string #2 */
+	else if (CHECK_CAP(plab_norm))
+	    want_type = 2;	/* label #1, show string #2 */
++#ifdef pkey_plab
+	else if (CHECK_CAP(pkey_plab))
+	    want_type = 6;	/* function key #1, type string #2, show string #3 */
++#endif
+ #if NCURSES_XNAMES
+	else {
+	    char *check;
+diff --git a/progs/reset_cmd.c b/progs/reset_cmd.c
+index eff3af72..aec4b077 100644
+--- a/progs/reset_cmd.c
++++ b/progs/reset_cmd.c
+@@ -75,6 +75,9 @@ MODULE_ID("$Id: reset_cmd.c,v 1.28 2021/10/02 18:08:44 tom Exp $")
+ # endif
+ #endif
+
++#define set_flags(target, mask)    target |= mask
++#define clear_flags(target, mask)  target &= ~((unsigned)(mask))
++
+ static FILE *my_file;
+
+ static bool use_reset = FALSE;	/* invoked as reset */
+@@ -188,6 +191,79 @@ out_char(int c)
+ #define reset_char(item, value) \
+     tty_settings->c_cc[item] = CHK(tty_settings->c_cc[item], value)
+
++/*
++ * Simplify ifdefs
++ */
++#ifndef BSDLY
++#define BSDLY 0
++#endif
++#ifndef CRDLY
++#define CRDLY 0
++#endif
++#ifndef ECHOCTL
++#define ECHOCTL 0
++#endif
++#ifndef ECHOKE
++#define ECHOKE 0
++#endif
++#ifndef ECHOPRT
++#define ECHOPRT 0
++#endif
++#ifndef FFDLY
++#define FFDLY 0
++#endif
++#ifndef IMAXBEL
++#define IMAXBEL 0
++#endif
++#ifndef IUCLC
++#define IUCLC 0
++#endif
++#ifndef IXANY
++#define IXANY 0
++#endif
++#ifndef NLDLY
++#define NLDLY 0
++#endif
++#ifndef OCRNL
++#define OCRNL 0
++#endif
++#ifndef OFDEL
++#define OFDEL 0
++#endif
++#ifndef OFILL
++#define OFILL 0
++#endif
++#ifndef OLCUC
++#define OLCUC 0
++#endif
++#ifndef ONLCR
++#define ONLCR 0
++#endif
++#ifndef ONLRET
++#define ONLRET 0
++#endif
++#ifndef ONOCR
++#define ONOCR 0
++#endif
++#ifndef OXTABS
++#define OXTABS 0
++#endif
++#ifndef TAB3
++#define TAB3 0
++#endif
++#ifndef TABDLY
++#define TABDLY 0
++#endif
++#ifndef TOSTOP
++#define TOSTOP 0
++#endif
++#ifndef VTDLY
++#define VTDLY 0
++#endif
++#ifndef XCASE
++#define XCASE 0
++#endif
++
+ /*
+  * Reset the terminal mode bits to a sensible state.  Very useful after
+  * a child program dies in raw mode.
+@@ -195,6 +271,10 @@ out_char(int c)
+ void
+ reset_tty_settings(int fd, TTY * tty_settings, int noset)
+ {
++    unsigned mask;
++#ifdef TIOCMGET
++    int modem_bits;
++#endif
+     GET_TTY(fd, tty_settings);
+
+ #ifdef TERMIOS
+@@ -228,106 +308,65 @@ reset_tty_settings(int fd, TTY * tty_settings, int noset)
+     reset_char(VWERASE, CWERASE);
+ #endif
+
+-    tty_settings->c_iflag &= ~((unsigned) (IGNBRK
+-					   | PARMRK
+-					   | INPCK
+-					   | ISTRIP
+-					   | INLCR
+-					   | IGNCR
+-#ifdef IUCLC
+-					   | IUCLC
+-#endif
+-#ifdef IXANY
+-					   | IXANY
+-#endif
+-					   | IXOFF));
+-
+-    tty_settings->c_iflag |= (BRKINT
+-			      | IGNPAR
+-			      | ICRNL
+-			      | IXON
+-#ifdef IMAXBEL
+-			      | IMAXBEL
+-#endif
+-	);
+-
+-    tty_settings->c_oflag &= ~((unsigned) (0
+-#ifdef OLCUC
+-					   | OLCUC
+-#endif
+-#ifdef OCRNL
+-					   | OCRNL
+-#endif
+-#ifdef ONOCR
+-					   | ONOCR
+-#endif
+-#ifdef ONLRET
+-					   | ONLRET
+-#endif
+-#ifdef OFILL
+-					   | OFILL
+-#endif
+-#ifdef OFDEL
+-					   | OFDEL
+-#endif
+-#ifdef NLDLY
+-					   | NLDLY
+-#endif
+-#ifdef CRDLY
+-					   | CRDLY
+-#endif
+-#ifdef TABDLY
+-					   | TABDLY
+-#endif
+-#ifdef BSDLY
+-					   | BSDLY
+-#endif
+-#ifdef VTDLY
+-					   | VTDLY
+-#endif
+-#ifdef FFDLY
+-					   | FFDLY
+-#endif
+-			       ));
+-
+-    tty_settings->c_oflag |= (OPOST
+-#ifdef ONLCR
+-			      | ONLCR
+-#endif
+-	);
+-
+-    tty_settings->c_cflag &= ~((unsigned) (CSIZE
+-					   | CSTOPB
+-					   | PARENB
+-					   | PARODD
+-					   | CLOCAL));
+-    tty_settings->c_cflag |= (CS8 | CREAD);
+-    tty_settings->c_lflag &= ~((unsigned) (ECHONL
+-					   | NOFLSH
+-#ifdef TOSTOP
+-					   | TOSTOP
+-#endif
+-#ifdef ECHOPTR
+-					   | ECHOPRT
+-#endif
+-#ifdef XCASE
+-					   | XCASE
+-#endif
+-			       ));
+-
+-    tty_settings->c_lflag |= (ISIG
+-			      | ICANON
+-			      | ECHO
+-			      | ECHOE
+-			      | ECHOK
+-#ifdef ECHOCTL
+-			      | ECHOCTL
+-#endif
+-#ifdef ECHOKE
+-			      | ECHOKE
+-#endif
+-	);
+-#endif
++    clear_flags(tty_settings->c_iflag, (IGNBRK
++                                       | PARMRK
++                                       | INPCK
++                                       | ISTRIP
++                                       | INLCR
++                                       | IGNCR
++                                       | IUCLC
++                                       | IXANY
++                                       | IXOFF));
++
++    set_flags(tty_settings->c_iflag, (BRKINT
++                                     | IGNPAR
++                                     | ICRNL
++                                     | IXON
++                                     | IMAXBEL));
++
++    clear_flags(tty_settings->c_oflag, (0
++                                       | OLCUC
++                                       | OCRNL
++                                       | ONOCR
++                                       | ONLRET
++                                       | OFILL
++                                       | OFDEL
++                                       | NLDLY
++                                       | CRDLY
++                                       | TABDLY
++                                       | BSDLY
++                                       | VTDLY
++                                       | FFDLY));
++
++    set_flags(tty_settings->c_oflag, (OPOST
++                                     | ONLCR));
++
++    mask = (CSIZE | CSTOPB | PARENB | PARODD);
++#ifdef TIOCMGET
++    /* leave clocal alone if this appears to use a modem */
++    if (ioctl(fd, TIOCMGET, &modem_bits) == -1)
++       mask |= CLOCAL;
++#else
++    /* cannot check - use the behavior from tset */
++    mask |= CLOCAL;
++#endif
++    clear_flags(tty_settings->c_cflag, mask);
++
++    set_flags(tty_settings->c_cflag, (CS8 | CREAD));
++    clear_flags(tty_settings->c_lflag, (ECHONL
++                                       | NOFLSH
++                                       | TOSTOP
++                                       | ECHOPRT
++                                       | XCASE));
++
++    set_flags(tty_settings->c_lflag, (ISIG
++                                     | ICANON
++                                     | ECHO
++                                     | ECHOE
++                                     | ECHOK
++                                     | ECHOCTL
++                                     | ECHOKE));
++#endif /* TERMIOS */
+
+     if (!noset) {
+	SET_TTY(fd, tty_settings);
+@@ -402,29 +441,23 @@ set_conversions(TTY * tty_settings)
+ #if defined(EXP_WIN32_DRIVER)
+     /* FIXME */
+ #else
+-#ifdef ONLCR
+-    tty_settings->c_oflag |= ONLCR;
+-#endif
+-    tty_settings->c_iflag |= ICRNL;
+-    tty_settings->c_lflag |= ECHO;
+-#ifdef OXTABS
+-    tty_settings->c_oflag |= OXTABS;
+-#endif /* OXTABS */
++    set_flags(tty_settings->c_oflag, ONLCR);
++    set_flags(tty_settings->c_iflag, ICRNL);
++    set_flags(tty_settings->c_lflag, ECHO);
++    set_flags(tty_settings->c_oflag, OXTABS);
+
+     /* test used to be tgetflag("NL") */
+     if (VALID_STRING(newline) && newline[0] == '\n' && !newline[1]) {
+	/* Newline, not linefeed. */
+-#ifdef ONLCR
+-	tty_settings->c_oflag &= ~((unsigned) ONLCR);
+-#endif
+-	tty_settings->c_iflag &= ~((unsigned) ICRNL);
++        clear_flags(tty_settings->c_oflag, ONLCR);
++        clear_flags(tty_settings->c_iflag, ICRNL);
+     }
+-#ifdef OXTABS
++#if OXTABS
+     /* test used to be tgetflag("pt") */
+     if (VALID_STRING(set_tab) && VALID_STRING(clear_all_tabs))
+-	tty_settings->c_oflag &= ~OXTABS;
++	clear_flags(tty_settings->c_oflag, OXTABS);
+ #endif /* OXTABS */
+-    tty_settings->c_lflag |= (ECHOE | ECHOK);
++    set_flags(tty_settings->c_lflag, (ECHOE | ECHOK));
+ #endif
+ }
+
+@@ -490,7 +523,7 @@ send_init_strings(int fd GCC_UNUSED, TTY * old_settings)
+     bool need_flush = FALSE;
+
+     (void) old_settings;
+-#ifdef TAB3
++#if TAB3
+     if (old_settings != 0 &&
+	old_settings->c_oflag & (TAB3 | ONLCR | OCRNL | ONLRET)) {
+	old_settings->c_oflag &= (TAB3 | ONLCR | OCRNL | ONLRET);
+@@ -512,22 +545,22 @@ send_init_strings(int fd GCC_UNUSED, TTY * old_settings)
+
+	if (VALID_STRING(clear_margins)) {
+	    need_flush |= sent_string(clear_margins);
+-	} else
++	}
+ #if defined(set_lr_margin)
+-	if (VALID_STRING(set_lr_margin)) {
++	else if (VALID_STRING(set_lr_margin)) {
+	    need_flush |= sent_string(TIPARM_2(set_lr_margin, 0, columns - 1));
+-	} else
++	}
+ #endif
+ #if defined(set_left_margin_parm) && defined(set_right_margin_parm)
+-	    if (VALID_STRING(set_left_margin_parm)
+-		&& VALID_STRING(set_right_margin_parm)) {
++	else if (VALID_STRING(set_left_margin_parm)
++	  	 && VALID_STRING(set_right_margin_parm)) {
+	    need_flush |= sent_string(TIPARM_1(set_left_margin_parm, 0));
+	    need_flush |= sent_string(TIPARM_1(set_right_margin_parm,
+					       columns - 1));
+-	} else
++	}
+ #endif
+-	    if (VALID_STRING(set_left_margin)
+-		&& VALID_STRING(set_right_margin)) {
++	else if (VALID_STRING(set_left_margin)
++		 && VALID_STRING(set_right_margin)) {
+	    need_flush |= to_left_margin();
+	    need_flush |= sent_string(set_left_margin);
+	    if (VALID_STRING(parm_right_cursor)) {
+diff --git a/progs/tabs.c b/progs/tabs.c
+index 7378d116..d904330b 100644
+--- a/progs/tabs.c
++++ b/progs/tabs.c
+@@ -370,7 +370,9 @@ do_set_margin(int margin, bool no_op)
+	    }
+	    tputs(set_left_margin, 1, putch);
+	}
+-    } else if (VALID_STRING(set_left_margin_parm)) {
++    }
++#if defined(set_left_margin_parm) && defined(set_right_margin_parm)
++    else if (VALID_STRING(set_left_margin_parm)) {
+	result = TRUE;
+	if (!no_op) {
+	    if (VALID_STRING(set_right_margin_parm)) {
+@@ -379,12 +381,16 @@ do_set_margin(int margin, bool no_op)
+		tputs(TIPARM_2(set_left_margin_parm, margin, max_cols), 1, putch);
+	    }
+	}
+-    } else if (VALID_STRING(set_lr_margin)) {
++    }
++#endif
++#if defined(set_lr_margin)
++    else if (VALID_STRING(set_lr_margin)) {
+	result = TRUE;
+	if (!no_op) {
+	    tputs(TIPARM_2(set_lr_margin, margin, max_cols), 1, putch);
+	}
+     }
++#endif
+     return result;
+ }
+
+diff --git a/progs/tic.c b/progs/tic.c
+index 888927e2..78b568fa 100644
+--- a/progs/tic.c
++++ b/progs/tic.c
+@@ -3142,6 +3142,7 @@ guess_ANSI_VTxx(TERMTYPE2 *tp)
+  * In particular, any ECMA-48 terminal should support these, though the details
+  * for u9 are implementation dependent.
+  */
++#if defined(user6) && defined(user7) && defined(user8) && defined(user9)
+ static void
+ check_user_6789(TERMTYPE2 *tp)
+ {
+@@ -3177,6 +3178,9 @@ check_user_6789(TERMTYPE2 *tp)
+	break;
+     }
+ }
++#else
++#define check_user_6789(tp)    /* nothing */
++#endif
+
+ /* other sanity-checks (things that we don't want in the normal
+  * logic that reads a terminfo entry)
+--
+2.40.0
diff --git a/meta/recipes-core/ncurses/ncurses_6.4.bb b/meta/recipes-core/ncurses/ncurses_6.4.bb
index 388cd8d407..2c621525f9 100644
--- a/meta/recipes-core/ncurses/ncurses_6.4.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.4.bb
@@ -5,6 +5,7 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch \
            file://exit_prototype.patch \
            file://0001-Fix-CVE-2023-29491.patch \
+           file://0001-Updating-reset-code-ncurses-6.4-patch-20231104.patch \
            "
 # commit id corresponds to the revision in package version
 SRCREV = "79b9071f2be20a24c7be031655a5638f6032f29f"
-- 
2.40.0


