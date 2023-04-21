Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79ADEC7618E
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 03:22:29 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.3799.1682047339630621461
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Apr 2023 20:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=LPMiX6XP;
 spf=pass (domain: mvista.com, ip: 209.85.210.174, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-63b7b54642cso1392091b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 20:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1682047338; x=1684639338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BRmS5RSV+prfUUV4PM6r8EABf/cDEnDsP4VnyxQ0+UM=;
        b=LPMiX6XPKuCOmSPdLn8wCX4bE3QVMhaHVD7rha5bp53e0T3kxakuCC1PipcSStjd1s
         tSK0OZBCUsdBcjV6/U2jo0q8ULXVJsb3P2TXohHTPyaYda0MCmsDAVy7PDmM/tK/Sqx4
         Pr5Lk4om0510cLbzC9zRocAKOMnOgnKFQO4D4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682047338; x=1684639338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BRmS5RSV+prfUUV4PM6r8EABf/cDEnDsP4VnyxQ0+UM=;
        b=bjN99yoYqYBcuRJHAJsXRs8LSu/UN3BdLTwSG5VchQLKRpBT7j+BVbcHACfDsP8yTw
         QOl+UJE/3Y49qDVMiOpQ7kL2Ql1C3nW5yZVaJpydFhILAaTjhqbfmummkWGJvxrOhfAU
         92viXyg39aU4ldKPeKti6oHDWizADl7V6qxT8Y8J7aYys8XaKumaJ2tHrIBTh/uf25V5
         OpuJqobbgEdxkBU9fs2Tl2sjllIqxAL3zCMcJFF9vszlziAMsJMiMbFv8pXKZ+LTS7U8
         NvflWvJw+cMzoh3htPlLlcldRBGFxqCquMrhthdiaH0RpUe0n/2poCNjkTLjBr3W+YJT
         HYuA==
X-Gm-Message-State: AAQBX9fMro/Hl67GDyNI1OW1Pyiv8+8Yu3hS0FeUPCKyqqMuv7I4DDiv
	x/6Q8aFwqYyN8zGjXD8pogEdL5iXh+NqraPKNR0=
X-Google-Smtp-Source: AKy350ZzquNNnhRT+4gwQQ1em0FFHjf6Mo2yKgrcoafeH0r6Bupg1I22XE/g3T9SNxEKf/SR1+fP8Q==
X-Received: by 2002:a05:6a00:1144:b0:63f:120a:1d96 with SMTP id b4-20020a056a00114400b0063f120a1d96mr2623445pfm.11.1682047338035;
        Thu, 20 Apr 2023 20:22:18 -0700 (PDT)
Received: from MVIN00020.mvista.com ([223.178.244.54])
        by smtp.gmail.com with ESMTPSA id d4-20020a655ac4000000b0051b3d5543c4sm1761448pgt.30.2023.04.20.20.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 20:22:17 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] sudo: Security fix for CVE-2023-28486 and CVE-2023-28487
Date: Fri, 21 Apr 2023 08:49:35 +0530
Message-Id: <20230421031935.25782-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 03:22:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180263

From: Vijay Anusuri <vanusuri@mvista.com>

import patches from ubuntu to fix
 CVE-2023-28486
 CVE-2023-28487

Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/sudo/tree/debian/patches?h=ubuntu/focal-security
Upstream commit https://github.com/sudo-project/sudo/commit/334daf92b31b79ce68ed75e2ee14fca265f029ca & https://github.com/sudo-project/sudo/commit/12648b4e0a8cf486480442efd52f0e0b6cab6e8b]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../CVE-2023-28486_CVE-2023-28487-1.patch     | 646 ++++++++++++++++++
 .../CVE-2023-28486_CVE-2023-28487-2.patch     |  26 +
 meta/recipes-extended/sudo/sudo_1.8.32.bb     |   2 +
 3 files changed, 674 insertions(+)
 create mode 100644 meta/recipes-extended/sudo/sudo/CVE-2023-28486_CVE-2023-28487-1.patch
 create mode 100644 meta/recipes-extended/sudo/sudo/CVE-2023-28486_CVE-2023-28487-2.patch

diff --git a/meta/recipes-extended/sudo/sudo/CVE-2023-28486_CVE-2023-28487-1.patch b/meta/recipes-extended/sudo/sudo/CVE-2023-28486_CVE-2023-28487-1.patch
new file mode 100644
index 0000000000..bc6f8c19a6
--- /dev/null
+++ b/meta/recipes-extended/sudo/sudo/CVE-2023-28486_CVE-2023-28487-1.patch
@@ -0,0 +1,646 @@
+Origin: Backport obtained from SUSE. Thanks!
+
+From 334daf92b31b79ce68ed75e2ee14fca265f029ca Mon Sep 17 00:00:00 2001
+From: "Todd C. Miller" <Todd.Miller@sudo.ws>
+Date: Wed, 18 Jan 2023 08:21:34 -0700
+Subject: [PATCH] Escape control characters in log messages and "sudoreplay -l"
+ output. The log message contains user-controlled strings that could include
+ things like terminal control characters.  Space characters in the command
+ path are now also escaped.
+
+Command line arguments that contain spaces are surrounded with
+single quotes and any literal single quote or backslash characters
+are escaped with a backslash.  This makes it possible to distinguish
+multiple command line arguments from a single argument that contains
+spaces.
+
+Issue found by Matthieu Barjole and Victor Cutillas of Synacktiv
+(https://synacktiv.com).
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/sudo/tree/debian/patches/CVE-2023-2848x-1.patch?h=ubuntu/focal-security
+Upstream commit  https://github.com/sudo-project/sudo/commit/334daf92b31b79ce68ed75e2ee14fca265f029ca]
+CVE: CVE-2023-28486 CVE-2023-28487
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ doc/sudoers.man.in           |   33 +++++++--
+ doc/sudoers.mdoc.in          |   28 ++++++--
+ doc/sudoreplay.man.in        |    9 ++
+ doc/sudoreplay.mdoc.in       |   10 ++
+ include/sudo_compat.h        |    6 +
+ include/sudo_lbuf.h          |    7 ++
+ lib/util/lbuf.c              |  106 +++++++++++++++++++++++++++++++
+ lib/util/util.exp.in         |    1 
+ plugins/sudoers/logging.c    |  145 +++++++++++--------------------------------
+ plugins/sudoers/sudoreplay.c |   44 +++++++++----
+ 10 files changed, 257 insertions(+), 132 deletions(-)
+
+--- a/doc/sudoers.man.in
++++ b/doc/sudoers.man.in
+@@ -4566,6 +4566,19 @@ can log events using either
+ syslog(3)
+ or a simple log file.
+ The log format is almost identical in both cases.
++Any control characters present in the log data are formatted in octal
++with a leading
++\(oq#\(cq
++character.
++For example, a horizontal tab is stored as
++\(oq#011\(cq
++and an embedded carriage return is stored as
++\(oq#015\(cq.
++In addition, space characters in the command path are stored as
++\(oq#040\(cq.
++Literal single quotes and backslash characters
++(\(oq\e\(cq)
++in command line arguments are escaped with a backslash.
+ .SS "Accepted command log entries"
+ Commands that sudo runs are logged using the following format (split
+ into multiple lines for readability):
+@@ -4646,7 +4659,7 @@ A list of environment variables specifie
+ if specified.
+ .TP 14n
+ command
+-The actual command that was executed.
++The actual command that was executed, including any command line arguments.
+ .PP
+ Messages are logged using the locale specified by
+ \fIsudoers_locale\fR,
+@@ -4882,17 +4895,21 @@ with a few important differences:
+ 1.\&
+ The
+ \fIprogname\fR
+-and
+-\fIhostname\fR
+-fields are not present.
++field is not present.
+ .TP 5n
+ 2.\&
+-If the
+-\fIlog_year\fR
+-option is enabled,
+-the date will also include the year.
++The
++\fIhostname\fR
++is only logged if the
++\fIlog_host\fR
++option is enabled.
+ .TP 5n
+ 3.\&
++The date does not include the year unless the
++\fIlog_year\fR
++option is enabled.
++.TP 5n
++4.\&
+ Lines that are longer than
+ \fIloglinelen\fR
+ characters (80 by default) are word-wrapped and continued on the
+--- a/doc/sudoers.mdoc.in
++++ b/doc/sudoers.mdoc.in
+@@ -4261,6 +4261,19 @@ can log events using either
+ .Xr syslog 3
+ or a simple log file.
+ The log format is almost identical in both cases.
++Any control characters present in the log data are formatted in octal
++with a leading
++.Ql #
++character.
++For example, a horizontal tab is stored as
++.Ql #011
++and an embedded carriage return is stored as
++.Ql #015 .
++In addition, space characters in the command path are stored as
++.Ql #040 .
++Literal single quotes and backslash characters
++.Pq Ql \e
++in command line arguments are escaped with a backslash.
+ .Ss Accepted command log entries
+ Commands that sudo runs are logged using the following format (split
+ into multiple lines for readability):
+@@ -4328,7 +4341,7 @@ option is enabled.
+ A list of environment variables specified on the command line,
+ if specified.
+ .It command
+-The actual command that was executed.
++The actual command that was executed, including any command line arguments.
+ .El
+ .Pp
+ Messages are logged using the locale specified by
+@@ -4550,14 +4563,17 @@ with a few important differences:
+ .It
+ The
+ .Em progname
+-and
++field is not present.
++.It
++The
+ .Em hostname
+-fields are not present.
++is only logged if the
++.Em log_host
++option is enabled.
+ .It
+-If the
++The date does not include the year unless the
+ .Em log_year
+-option is enabled,
+-the date will also include the year.
++option is enabled.
+ .It
+ Lines that are longer than
+ .Em loglinelen
+--- a/doc/sudoreplay.man.in
++++ b/doc/sudoreplay.man.in
+@@ -149,6 +149,15 @@ In this mode,
+ will list available sessions in a format similar to the
+ \fBsudo\fR
+ log file format, sorted by file name (or sequence number).
++Any control characters present in the log data are formated in octal
++with a leading
++\(oq#\(cq
++character.
++For example, a horizontal tab is displayed as
++\(oq#011\(cq
++and an embedded carriage return is displayed as
++\(oq#015\(cq.
++.sp
+ If a
+ \fIsearch expression\fR
+ is specified, it will be used to restrict the IDs that are displayed.
+--- a/doc/sudoreplay.mdoc.in
++++ b/doc/sudoreplay.mdoc.in
+@@ -142,6 +142,16 @@ In this mode,
+ will list available sessions in a format similar to the
+ .Nm sudo
+ log file format, sorted by file name (or sequence number).
++Any control characters present in the log data are formatted in octal
++with a leading
++.Ql #
++character.
++For example, a horizontal tab is displayed as
++.Ql #011
++and an embedded carriage return is displayed as
++.Ql #015 .
++Space characters in the command name and arguments are also formatted in octal.
++.Pp
+ If a
+ .Ar search expression
+ is specified, it will be used to restrict the IDs that are displayed.
+--- a/include/sudo_compat.h
++++ b/include/sudo_compat.h
+@@ -79,6 +79,12 @@
+ # endif
+ #endif
+ 
++#ifdef HAVE_FALLTHROUGH_ATTRIBUTE
++# define FALLTHROUGH 	__attribute__((__fallthrough__))
++#else
++# define FALLTHROUGH 	do { } while (0)
++#endif
++
+ /*
+  * Given the pointer x to the member m of the struct s, return
+  * a pointer to the containing structure.
+--- a/include/sudo_lbuf.h
++++ b/include/sudo_lbuf.h
+@@ -36,9 +36,15 @@ struct sudo_lbuf {
+ 
+ typedef int (*sudo_lbuf_output_t)(const char *);
+ 
++/* Flags for sudo_lbuf_append_esc() */
++#define LBUF_ESC_CNTRL	0x01
++#define LBUF_ESC_BLANK	0x02
++#define LBUF_ESC_QUOTE	0x04
++
+ __dso_public void sudo_lbuf_init_v1(struct sudo_lbuf *lbuf, sudo_lbuf_output_t output, int indent, const char *continuation, int cols);
+ __dso_public void sudo_lbuf_destroy_v1(struct sudo_lbuf *lbuf);
+ __dso_public bool sudo_lbuf_append_v1(struct sudo_lbuf *lbuf, const char *fmt, ...) __printflike(2, 3);
++__dso_public bool sudo_lbuf_append_esc_v1(struct sudo_lbuf *lbuf, int flags, const char *fmt, ...) __printflike(3, 4);
+ __dso_public bool sudo_lbuf_append_quoted_v1(struct sudo_lbuf *lbuf, const char *set, const char *fmt, ...) __printflike(3, 4);
+ __dso_public void sudo_lbuf_print_v1(struct sudo_lbuf *lbuf);
+ __dso_public bool sudo_lbuf_error_v1(struct sudo_lbuf *lbuf);
+@@ -47,6 +53,7 @@ __dso_public void sudo_lbuf_clearerr_v1(
+ #define sudo_lbuf_init(_a, _b, _c, _d, _e) sudo_lbuf_init_v1((_a), (_b), (_c), (_d), (_e))
+ #define sudo_lbuf_destroy(_a) sudo_lbuf_destroy_v1((_a))
+ #define sudo_lbuf_append sudo_lbuf_append_v1
++#define sudo_lbuf_append_esc sudo_lbuf_append_esc_v1
+ #define sudo_lbuf_append_quoted sudo_lbuf_append_quoted_v1
+ #define sudo_lbuf_print(_a) sudo_lbuf_print_v1((_a))
+ #define sudo_lbuf_error(_a) sudo_lbuf_error_v1((_a))
+--- a/lib/util/lbuf.c
++++ b/lib/util/lbuf.c
+@@ -93,6 +93,112 @@ sudo_lbuf_expand(struct sudo_lbuf *lbuf,
+ }
+ 
+ /*
++ * Escape a character in octal form (#0n) and store it as a string
++ * in buf, which must have at least 6 bytes available.
++ * Returns the length of buf, not counting the terminating NUL byte.
++ */
++static int
++escape(unsigned char ch, char *buf)
++{
++    const int len = ch < 0100 ? (ch < 010 ? 3 : 4) : 5;
++
++    /* Work backwards from the least significant digit to most significant. */
++    switch (len) {
++    case 5:
++	buf[4] = (ch & 7) + '0';
++	ch >>= 3;
++	FALLTHROUGH;
++    case 4:
++	buf[3] = (ch & 7) + '0';
++	ch >>= 3;
++	FALLTHROUGH;
++    case 3:
++	buf[2] = (ch & 7) + '0';
++	buf[1] = '0';
++	buf[0] = '#';
++	break;
++    }
++    buf[len] = '\0';
++
++    return len;
++}
++
++/*
++ * Parse the format and append strings, only %s and %% escapes are supported.
++ * Any non-printable characters are escaped in octal as #0nn.
++ */
++bool
++sudo_lbuf_append_esc_v1(struct sudo_lbuf *lbuf, int flags, const char *fmt, ...)
++{
++    unsigned int saved_len = lbuf->len;
++    bool ret = false;
++    const char *s;
++    va_list ap;
++    debug_decl(sudo_lbuf_append_esc, SUDO_DEBUG_UTIL);
++
++    if (sudo_lbuf_error(lbuf))
++	debug_return_bool(false);
++
++#define should_escape(ch) \
++    ((ISSET(flags, LBUF_ESC_CNTRL) && iscntrl((unsigned char)ch)) || \
++    (ISSET(flags, LBUF_ESC_BLANK) && isblank((unsigned char)ch)))
++#define should_quote(ch) \
++    (ISSET(flags, LBUF_ESC_QUOTE) && (ch == '\'' || ch == '\\'))
++
++    va_start(ap, fmt);
++    while (*fmt != '\0') {
++	if (fmt[0] == '%' && fmt[1] == 's') {
++	    if ((s = va_arg(ap, char *)) == NULL)
++		s = "(NULL)";
++	    while (*s != '\0') {
++		if (should_escape(*s)) {
++		    if (!sudo_lbuf_expand(lbuf, sizeof("#0177") - 1))
++			goto done;
++		    lbuf->len += escape(*s++, lbuf->buf + lbuf->len);
++		    continue;
++		}
++		if (should_quote(*s)) {
++		    if (!sudo_lbuf_expand(lbuf, 2))
++			goto done;
++		    lbuf->buf[lbuf->len++] = '\\';
++		    lbuf->buf[lbuf->len++] = *s++;
++		    continue;
++		}
++		if (!sudo_lbuf_expand(lbuf, 1))
++		    goto done;
++		lbuf->buf[lbuf->len++] = *s++;
++	    }
++	    fmt += 2;
++	    continue;
++	}
++	if (should_escape(*fmt)) {
++	    if (!sudo_lbuf_expand(lbuf, sizeof("#0177") - 1))
++		goto done;
++	    if (*fmt == '\'') {
++		lbuf->buf[lbuf->len++] = '\\';
++		lbuf->buf[lbuf->len++] = *fmt++;
++	    } else {
++		lbuf->len += escape(*fmt++, lbuf->buf + lbuf->len);
++	    }
++	    continue;
++	}
++	if (!sudo_lbuf_expand(lbuf, 1))
++	    goto done;
++	lbuf->buf[lbuf->len++] = *fmt++;
++    }
++    ret = true;
++
++done:
++    if (!ret)
++	lbuf->len = saved_len;
++    if (lbuf->size != 0)
++	lbuf->buf[lbuf->len] = '\0';
++    va_end(ap);
++
++    debug_return_bool(ret);
++}
++
++/*
+  * Parse the format and append strings, only %s and %% escapes are supported.
+  * Any characters in set are quoted with a backslash.
+  */
+--- a/lib/util/util.exp.in
++++ b/lib/util/util.exp.in
+@@ -79,6 +79,7 @@ sudo_gethostname_v1
+ sudo_gettime_awake_v1
+ sudo_gettime_mono_v1
+ sudo_gettime_real_v1
++sudo_lbuf_append_esc_v1
+ sudo_lbuf_append_quoted_v1
+ sudo_lbuf_append_v1
+ sudo_lbuf_clearerr_v1
+--- a/plugins/sudoers/logging.c
++++ b/plugins/sudoers/logging.c
+@@ -58,6 +58,7 @@
+ #include <syslog.h>
+ 
+ #include "sudoers.h"
++#include "sudo_lbuf.h"
+ 
+ #ifndef HAVE_GETADDRINFO
+ # include "compat/getaddrinfo.h"
+@@ -940,14 +941,6 @@ should_mail(int status)
+ 	(def_mail_no_perms && !ISSET(status, VALIDATE_SUCCESS)));
+ }
+ 
+-#define	LL_TTY_STR	"TTY="
+-#define	LL_CWD_STR	"PWD="		/* XXX - should be CWD= */
+-#define	LL_USER_STR	"USER="
+-#define	LL_GROUP_STR	"GROUP="
+-#define	LL_ENV_STR	"ENV="
+-#define	LL_CMND_STR	"COMMAND="
+-#define	LL_TSID_STR	"TSID="
+-
+ #define IS_SESSID(s) ( \
+     isalnum((unsigned char)(s)[0]) && isalnum((unsigned char)(s)[1]) && \
+     (s)[2] == '/' && \
+@@ -962,14 +955,16 @@ should_mail(int status)
+ static char *
+ new_logline(const char *message, const char *errstr)
+ {
+-    char *line = NULL, *evstr = NULL;
+ #ifndef SUDOERS_NO_SEQ
+     char sessid[7];
+ #endif
+     const char *tsid = NULL;
+-    size_t len = 0;
++    struct sudo_lbuf lbuf;
++    int i;
+     debug_decl(new_logline, SUDOERS_DEBUG_LOGGING)
+ 
++    sudo_lbuf_init(&lbuf, NULL, 0, NULL, 0);
++
+ #ifndef SUDOERS_NO_SEQ
+     /* A TSID may be a sudoers-style session ID or a free-form string. */
+     if (sudo_user.iolog_file != NULL) {
+@@ -989,119 +984,55 @@ new_logline(const char *message, const c
+ #endif
+ 
+     /*
+-     * Compute line length
++     * Format the log line as an lbuf, escaping control characters in
++     * octal form (#0nn).  Error checking (ENOMEM) is done at the end.
+      */
+-    if (message != NULL)
+-	len += strlen(message) + 3;
+-    if (errstr != NULL)
+-	len += strlen(errstr) + 3;
+-    len += sizeof(LL_TTY_STR) + 2 + strlen(user_tty);
+-    len += sizeof(LL_CWD_STR) + 2 + strlen(user_cwd);
+-    if (runas_pw != NULL)
+-	len += sizeof(LL_USER_STR) + 2 + strlen(runas_pw->pw_name);
+-    if (runas_gr != NULL)
+-	len += sizeof(LL_GROUP_STR) + 2 + strlen(runas_gr->gr_name);
+-    if (tsid != NULL)
+-	len += sizeof(LL_TSID_STR) + 2 + strlen(tsid);
+-    if (sudo_user.env_vars != NULL) {
+-	size_t evlen = 0;
+-	char * const *ep;
+-
+-	for (ep = sudo_user.env_vars; *ep != NULL; ep++)
+-	    evlen += strlen(*ep) + 1;
+-	if (evlen != 0) {
+-	    if ((evstr = malloc(evlen)) == NULL)
+-		goto oom;
+-	    evstr[0] = '\0';
+-	    for (ep = sudo_user.env_vars; *ep != NULL; ep++) {
+-		strlcat(evstr, *ep, evlen);
+-		strlcat(evstr, " ", evlen);	/* NOTE: last one will fail */
+-	    }
+-	    len += sizeof(LL_ENV_STR) + 2 + evlen;
+-	}
+-    }
+-    if (user_cmnd != NULL) {
+-	/* Note: we log "sudo -l command arg ..." as "list command arg ..." */
+-	len += sizeof(LL_CMND_STR) - 1 + strlen(user_cmnd);
+-	if (ISSET(sudo_mode, MODE_CHECK))
+-	    len += sizeof("list ") - 1;
+-	if (user_args != NULL)
+-	    len += strlen(user_args) + 1;
+-    }
+-
+-    /*
+-     * Allocate and build up the line.
+-     */
+-    if ((line = malloc(++len)) == NULL)
+-	goto oom;
+-    line[0] = '\0';
+ 
+     if (message != NULL) {
+-	if (strlcat(line, message, len) >= len ||
+-	    strlcat(line, errstr ? " : " : " ; ", len) >= len)
+-	    goto toobig;
++	sudo_lbuf_append_esc(&lbuf, LBUF_ESC_CNTRL, "%s%s", message,
++	    errstr ? " : " : " ; ");
+     }
+     if (errstr != NULL) {
+-	if (strlcat(line, errstr, len) >= len ||
+-	    strlcat(line, " ; ", len) >= len)
+-	    goto toobig;
+-    }
+-    if (strlcat(line, LL_TTY_STR, len) >= len ||
+-	strlcat(line, user_tty, len) >= len ||
+-	strlcat(line, " ; ", len) >= len)
+-	goto toobig;
+-    if (strlcat(line, LL_CWD_STR, len) >= len ||
+-	strlcat(line, user_cwd, len) >= len ||
+-	strlcat(line, " ; ", len) >= len)
+-	goto toobig;
++	sudo_lbuf_append_esc(&lbuf, LBUF_ESC_CNTRL, "%s ; ", errstr);
++    }
++    if (user_tty != NULL) {
++	sudo_lbuf_append_esc(&lbuf, LBUF_ESC_CNTRL, "TTY=%s ; ", user_tty);
++    }
++    if (user_cwd != NULL) {
++	sudo_lbuf_append_esc(&lbuf, LBUF_ESC_CNTRL, "PWD=%s ; ", user_cwd);
++    }
+     if (runas_pw != NULL) {
+-	if (strlcat(line, LL_USER_STR, len) >= len ||
+-	    strlcat(line, runas_pw->pw_name, len) >= len ||
+-	    strlcat(line, " ; ", len) >= len)
+-	    goto toobig;
++	sudo_lbuf_append_esc(&lbuf, LBUF_ESC_CNTRL, "USER=%s ; ",
++	    runas_pw->pw_name);
+     }
+     if (runas_gr != NULL) {
+-	if (strlcat(line, LL_GROUP_STR, len) >= len ||
+-	    strlcat(line, runas_gr->gr_name, len) >= len ||
+-	    strlcat(line, " ; ", len) >= len)
+-	    goto toobig;
++	sudo_lbuf_append_esc(&lbuf, LBUF_ESC_CNTRL, "GROUP=%s ; ",
++	    runas_gr->gr_name);
+     }
+     if (tsid != NULL) {
+-	if (strlcat(line, LL_TSID_STR, len) >= len ||
+-	    strlcat(line, tsid, len) >= len ||
+-	    strlcat(line, " ; ", len) >= len)
+-	    goto toobig;
+-    }
+-    if (evstr != NULL) {
+-	if (strlcat(line, LL_ENV_STR, len) >= len ||
+-	    strlcat(line, evstr, len) >= len ||
+-	    strlcat(line, " ; ", len) >= len)
+-	    goto toobig;
+-	free(evstr);
+-	evstr = NULL;
++	sudo_lbuf_append_esc(&lbuf, LBUF_ESC_CNTRL, "TSID=%s ; ", tsid);
++    }
++    if (sudo_user.env_vars != NULL) {
++	sudo_lbuf_append_esc(&lbuf, LBUF_ESC_CNTRL, "ENV=%s", sudo_user.env_vars[0]);
++	for (i = 1; sudo_user.env_vars[i] != NULL; i++) {
++	    sudo_lbuf_append_esc(&lbuf, LBUF_ESC_CNTRL, " %s",
++		sudo_user.env_vars[i]);
++	}
+     }
+     if (user_cmnd != NULL) {
+-	if (strlcat(line, LL_CMND_STR, len) >= len)
+-	    goto toobig;
+-	if (ISSET(sudo_mode, MODE_CHECK) && strlcat(line, "list ", len) >= len)
+-	    goto toobig;
+-	if (strlcat(line, user_cmnd, len) >= len)
+-	    goto toobig;
++	sudo_lbuf_append_esc(&lbuf, LBUF_ESC_CNTRL|LBUF_ESC_BLANK,
++	    "COMMAND=%s", user_cmnd);
+ 	if (user_args != NULL) {
+-	    if (strlcat(line, " ", len) >= len ||
+-		strlcat(line, user_args, len) >= len)
+-		goto toobig;
++	    sudo_lbuf_append_esc(&lbuf,
++		LBUF_ESC_CNTRL|LBUF_ESC_QUOTE,
++		" %s", user_args);
+ 	}
+     }
+ 
+-    debug_return_str(line);
+-oom:
+-    free(evstr);
++    if (!sudo_lbuf_error(&lbuf))
++	debug_return_str(lbuf.buf);
++
++    sudo_lbuf_destroy(&lbuf);
+     sudo_warnx(U_("%s: %s"), __func__, U_("unable to allocate memory"));
+     debug_return_str(NULL);
+-toobig:
+-    free(evstr);
+-    free(line);
+-    sudo_warnx(U_("internal error, %s overflow"), __func__);
+-    debug_return_str(NULL);
+ }
+--- a/plugins/sudoers/sudoreplay.c
++++ b/plugins/sudoers/sudoreplay.c
+@@ -71,6 +71,7 @@
+ #include "sudo_conf.h"
+ #include "sudo_debug.h"
+ #include "sudo_event.h"
++#include "sudo_lbuf.h"
+ #include "sudo_util.h"
+ 
+ #ifdef HAVE_GETOPT_LONG
+@@ -1353,7 +1354,8 @@ match_expr(struct search_node_list *head
+ }
+ 
+ static int
+-list_session(char *logfile, regex_t *re, const char *user, const char *tty)
++list_session(struct sudo_lbuf *lbuf, char *logfile, regex_t *re,
++    const char *user, const char *tty)
+ {
+     char idbuf[7], *idstr, *cp;
+     const char *timestr;
+@@ -1386,16 +1388,32 @@ list_session(char *logfile, regex_t *re,
+     }
+     /* XXX - print rows + cols? */
+     timestr = get_timestr(li->tstamp, 1);
+-    printf("%s : %s : TTY=%s ; CWD=%s ; USER=%s ; ",
+-	timestr ? timestr : "invalid date",
+-	li->user, li->tty, li->cwd, li->runas_user);
+-    if (li->runas_group)
+-	printf("GROUP=%s ; ", li->runas_group);
+-    printf("TSID=%s ; COMMAND=%s\n", idstr, li->cmd);
+-
+-    ret = 0;
+-
++    sudo_lbuf_append_esc(lbuf, LBUF_ESC_CNTRL, "%s : %s : ",
++	timestr ? timestr : "invalid date", li->user);
++    if (li->tty != NULL) {
++	sudo_lbuf_append_esc(lbuf, LBUF_ESC_CNTRL, "TTY=%s ; ",
++	    li->tty);
++    }
++    if (li->cwd != NULL) {
++	sudo_lbuf_append_esc(lbuf, LBUF_ESC_CNTRL, "CWD=%s ; ",
++	    li->cwd);
++    }
++    sudo_lbuf_append_esc(lbuf, LBUF_ESC_CNTRL, "USER=%s ; ", li->runas_user);
++    if (li->runas_group != NULL) {
++	sudo_lbuf_append_esc(lbuf, LBUF_ESC_CNTRL, "GROUP=%s ; ",
++	    li->runas_group);
++    }
++    sudo_lbuf_append_esc(lbuf, LBUF_ESC_CNTRL, "TSID=%s ; ", idstr);
++    sudo_lbuf_append_esc(lbuf, LBUF_ESC_CNTRL, "COMMAND=%s",
++	    li->cmd);
++
++    if (!sudo_lbuf_error(lbuf)) {
++	puts(lbuf->buf);
++	ret = 0;
++    }
+ done:
++    lbuf->error = 0;
++    lbuf->len = 0;
+     free_log_info(li);
+     debug_return_int(ret);
+ }
+@@ -1415,6 +1433,7 @@ find_sessions(const char *dir, regex_t *
+     DIR *d;
+     struct dirent *dp;
+     struct stat sb;
++    struct sudo_lbuf lbuf;
+     size_t sdlen, sessions_len = 0, sessions_size = 0;
+     unsigned int i;
+     int len;
+@@ -1426,6 +1445,8 @@ find_sessions(const char *dir, regex_t *
+ #endif
+     debug_decl(find_sessions, SUDO_DEBUG_UTIL)
+ 
++    sudo_lbuf_init(&lbuf, NULL, 0, NULL, 0);
++
+     d = opendir(dir);
+     if (d == NULL)
+ 	sudo_fatal(U_("unable to open %s"), dir);
+@@ -1485,7 +1506,7 @@ find_sessions(const char *dir, regex_t *
+ 
+ 	    /* Check for dir with a log file. */
+ 	    if (lstat(pathbuf, &sb) == 0 && S_ISREG(sb.st_mode)) {
+-		list_session(pathbuf, re, user, tty);
++		list_session(&lbuf, pathbuf, re, user, tty);
+ 	    } else {
+ 		/* Strip off "/log" and recurse if a dir. */
+ 		pathbuf[sdlen + len - 4] = '\0';
+@@ -1496,6 +1517,7 @@ find_sessions(const char *dir, regex_t *
+ 	}
+ 	free(sessions);
+     }
++    sudo_lbuf_destroy(&lbuf);
+ 
+     debug_return_int(0);
+ }
diff --git a/meta/recipes-extended/sudo/sudo/CVE-2023-28486_CVE-2023-28487-2.patch b/meta/recipes-extended/sudo/sudo/CVE-2023-28486_CVE-2023-28487-2.patch
new file mode 100644
index 0000000000..d021873b70
--- /dev/null
+++ b/meta/recipes-extended/sudo/sudo/CVE-2023-28486_CVE-2023-28487-2.patch
@@ -0,0 +1,26 @@
+Backport of:
+
+From 12648b4e0a8cf486480442efd52f0e0b6cab6e8b Mon Sep 17 00:00:00 2001
+From: "Todd C. Miller" <Todd.Miller@sudo.ws>
+Date: Mon, 13 Mar 2023 08:04:32 -0600
+Subject: [PATCH] Add missing " ; " separator between environment variables and
+ command. This is a regression introduced in sudo 1.9.13. GitHub issue #254.
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/sudo/tree/debian/patches/CVE-2023-2848x-2.patch?h=ubuntu/focal-security
+Upstream commit https://github.com/sudo-project/sudo/commit/12648b4e0a8cf486480442efd52f0e0b6cab6e8b]
+CVE: CVE-2023-28486 CVE-2023-28487
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/eventlog/eventlog.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+--- a/plugins/sudoers/logging.c
++++ b/plugins/sudoers/logging.c
+@@ -1018,6 +1018,7 @@ new_logline(const char *message, const c
+ 	    sudo_lbuf_append_esc(&lbuf, LBUF_ESC_CNTRL, " %s",
+ 		sudo_user.env_vars[i]);
+ 	}
++	sudo_lbuf_append(&lbuf, " ; ");
+     }
+     if (user_cmnd != NULL) {
+ 	sudo_lbuf_append_esc(&lbuf, LBUF_ESC_CNTRL|LBUF_ESC_BLANK,
diff --git a/meta/recipes-extended/sudo/sudo_1.8.32.bb b/meta/recipes-extended/sudo/sudo_1.8.32.bb
index 5bc48ec6fa..e35bbfa789 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.32.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.32.bb
@@ -6,6 +6,8 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            file://0001-Fix-includes-when-building-with-musl.patch \
            file://CVE-2022-43995.patch \
            file://CVE-2023-22809.patch \
+           file://CVE-2023-28486_CVE-2023-28487-1.patch \
+           file://CVE-2023-28486_CVE-2023-28487-2.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"
-- 
2.25.1


