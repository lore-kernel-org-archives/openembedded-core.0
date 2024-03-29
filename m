Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB093C6FD1F
	for <webhook@archiver.kernel.org>; Fri, 29 Mar 2024 11:14:16 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.14492.1711710847555813871
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Mar 2024 04:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=STAiJmPc;
 spf=pass (domain: mvista.com, ip: 209.85.215.181, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5d8ddbac4fbso1287386a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 04:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1711710846; x=1712315646; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rl2ESU8c0tMBSQoOvEDW2TT/jv/BfOpuWs0q3fbN89U=;
        b=STAiJmPcYI9uDEEc9ivIJa8yAp4RHj/5x/Pgx/ZBCoZIfqzoqnqF4CgW1z5blOhTnH
         UgBZKzbOELjXG7/Omo8OzL41W3pCdFyvQuTB1s5nT5p95ctpOkAyCzXsj3MWMI+zt2Il
         MmuMy3agF8L0Ki0IbGGF0uZelDBoRehfICMro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711710846; x=1712315646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rl2ESU8c0tMBSQoOvEDW2TT/jv/BfOpuWs0q3fbN89U=;
        b=usuIuRZafiR+gSbbEeoJrWDpLnbgqF75a3Mmno9AsrDIq70aeI1BDlA27oDsIfLJiO
         TJddkTjl52SlhjEj7YmeE3l/sBIo5niU+H/hcGhqpw4wiKubpGNHX3ca8JnaR8mv8r+Q
         a7woySq71tqUDz++IW0S/KdhItNHeMOb9ZUPOA/qDL32qUWwpAwdeRqsF8A44/RS0olw
         DHLFkOCHjDg7xaBP3Z5z92nUqp2JvW6TI2VMtrOjwsSZZ9PaGKisXlc3D+qmRm0bYzhY
         K0vafYsY/9lUbPgno4pdoB47jrhtDeQOfvrvDP0z0H2VK2p0Tojozg8OeBW0Kt14eSy0
         38gw==
X-Gm-Message-State: AOJu0YxxFvvUQfuwbGwW/bZtG0kn2Kg1l41Y1Cg6ye+WdeSltOnD8BNj
	gHy5QHTtPye0igVSXwqMS6XuLRgKrRpeeDbbD5kOlOMDb/KvS3jtdJ6nLaboV6ZNziVdNExXyIx
	Q
X-Google-Smtp-Source: AGHT+IHXX6PVVNSB8d62qRDlAzJwqN1KJMKJvFIAOVKRChgI4E5P765lJ9Sr92eL8MaJv0lqC7QtiA==
X-Received: by 2002:a05:6a21:398b:b0:1a3:e168:4deb with SMTP id ad11-20020a056a21398b00b001a3e1684debmr2060827pzc.32.1711710845778;
        Fri, 29 Mar 2024 04:14:05 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2401:4900:1cb0:1008:6045:5f4e:7c2d:1374])
        by smtp.gmail.com with ESMTPSA id 3-20020a17090a0cc300b002a20c0dcebbsm2105135pjt.31.2024.03.29.04.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 04:14:05 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] util-linux: Fix for CVE-2024-28085
Date: Fri, 29 Mar 2024 16:43:52 +0530
Message-Id: <20240329111352.1993057-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 11:14:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197629

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://github.com/util-linux/util-linux/commit/8a7b8456d1dc0e7ca557d1ac31f638986704757f
&
https://github.com/util-linux/util-linux/commit/27ee6446503af7ec0c2647704ca47ac4de3852ef
&
https://github.com/util-linux/util-linux/commit/aa13246a1bf1be9e4f6eb331f4d4d2dbc875e22f
& https://github.com/util-linux/util-linux/commit/404b0781f52f7c045ca811b2dceec526408ac253

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |   4 +
 .../util-linux/CVE-2024-28085-pre1.patch      | 200 ++++++++++++++++
 .../util-linux/CVE-2024-28085-pre2.patch      | 171 ++++++++++++++
 .../util-linux/CVE-2024-28085-pre3.patch      | 219 ++++++++++++++++++
 .../util-linux/CVE-2024-28085.patch           |  30 +++
 5 files changed, 624 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2024-28085-pre1.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2024-28085-pre2.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2024-28085-pre3.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2024-28085.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 982ec669a2..079359c55c 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -35,6 +35,10 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://run-ptest \
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
+           file://CVE-2024-28085-pre1.patch \
+           file://CVE-2024-28085-pre2.patch \
+           file://CVE-2024-28085-pre3.patch \
+           file://CVE-2024-28085.patch \
            "
 
 SRC_URI[sha256sum] = "634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83"
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-pre1.patch b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-pre1.patch
new file mode 100644
index 0000000000..ce3056eabe
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-pre1.patch
@@ -0,0 +1,200 @@
+From 8a7b8456d1dc0e7ca557d1ac31f638986704757f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?=D0=BD=D0=B0=D0=B1?= <nabijaczleweli@nabijaczleweli.xyz>
+Date: Wed, 15 Mar 2023 16:16:31 +0100
+Subject: [PATCH] write: correctly handle wide characters
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Do this by replacing fputc_careful() (notice that the description said
+it's locale-aware ‒ it very much is /not/), with a fputs_careful() which
+does the same thing, but if it were to output a byte in the \123 format,
+first it checks whether this byte starts a valid multibyte character.
+
+If it does, and that character is printable, write it verbatim.
+This means that
+  echo 'foo åäö ąęćźżń bar' | write nabijaczleweli pts/4
+instead of
+  foo \303\245\303\244\303\266
+  \304\205\304\231\304\207\305\272\305\274\305\204 bar
+yields
+  foo åäö ąęćźżń bar
+or, more realistically, from a message I got earlier today,
+  Filip powiedzia\305\202 \305\274e zap\305\202aci jutro
+becomes
+  Filip powiedział że zapłaci jutro
+
+Invalid/non-printable sequences get processed as before.
+
+Line reading in write must become getline() to avoid dealing with
+partial characters: for example on input consisting solely of
+ąęćźżń, where every {1} is an instance, the output would be
+  {42}ąęć\305\272żń{84}ąęćź\305\274ń{84}ąęćźż\305\204{39}
+with just fixed-512 fgets()
+
+Bug-Debian: https://bugs.debian.org/826596
+
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/8a7b8456d1dc0e7ca557d1ac31f638986704757f]
+CVE: CVE-2024-28085 #Dependency Patch1
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ include/carefulputc.h | 60 +++++++++++++++++++++++++++++++------------
+ login-utils/last.c    |  4 +--
+ term-utils/write.c    | 25 +++++-------------
+ 3 files changed, 52 insertions(+), 37 deletions(-)
+
+diff --git a/include/carefulputc.h b/include/carefulputc.h
+index 8860b12340..740add68e8 100644
+--- a/include/carefulputc.h
++++ b/include/carefulputc.h
+@@ -1,31 +1,59 @@
+ #ifndef UTIL_LINUX_CAREFULPUTC_H
+ #define UTIL_LINUX_CAREFULPUTC_H
+ 
+-/*
+- * A putc() for use in write and wall (that sometimes are sgid tty).
+- * It avoids control characters in our locale, and also ASCII control
+- * characters.   Note that the locale of the recipient is unknown.
+-*/
+ #include <stdio.h>
+ #include <string.h>
+ #include <ctype.h>
++#ifdef HAVE_WIDECHAR
++#include <wctype.h>
++#endif
++#include <stdbool.h>
+ 
+ #include "cctype.h"
+ 
+-static inline int fputc_careful(int c, FILE *fp, const char fail)
++/*
++ * A puts() for use in write and wall (that sometimes are sgid tty).
++ * It avoids control and invalid characters.
++ * The locale of the recipient is nominally unknown,
++ * but it's a solid bet that the encoding is compatible with the author's.
++ */
++static inline int fputs_careful(const char * s, FILE *fp, const char ctrl, bool cr_lf)
+ {
+-	int ret;
++	int ret = 0;
+ 
+-	if (isprint(c) || c == '\a' || c == '\t' || c == '\r' || c == '\n')
+-		ret = putc(c, fp);
+-	else if (!c_isascii(c))
+-		ret = fprintf(fp, "\\%3o", (unsigned char)c);
+-	else {
+-		ret = putc(fail, fp);
+-		if (ret != EOF)
+-			ret = putc(c ^ 0x40, fp);
++	for (size_t slen = strlen(s); *s; ++s, --slen) {
++		if (*s == '\n')
++			ret = fputs(cr_lf ? "\r\n" : "\n", fp);
++		else if (isprint(*s) || *s == '\a' || *s == '\t' || *s == '\r')
++			ret = putc(*s, fp);
++		else if (!c_isascii(*s)) {
++#ifdef HAVE_WIDECHAR
++			wchar_t w;
++			size_t clen = mbtowc(&w, s, slen);
++			switch(clen) {
++				case (size_t)-2:  // incomplete
++				case (size_t)-1:  // EILSEQ
++					mbtowc(NULL, NULL, 0);
++				nonprint:
++					ret = fprintf(fp, "\\%3hho", *s);
++					break;
++				default:
++					if(!iswprint(w))
++						goto nonprint;
++					ret = fwrite(s, 1, clen, fp);
++					s += clen - 1;
++					slen -= clen - 1;
++					break;
++			}
++#else
++			ret = fprintf(fp, "\\%3hho", *s);
++#endif
++		} else
++			ret = fputs((char[]){ ctrl, *s ^ 0x40, '\0' }, fp);
++		if (ret < 0)
++			return EOF;
+ 	}
+-	return (ret < 0) ? EOF : 0;
++	return 0;
+ }
+ 
+ static inline void fputs_quoted_case(const char *data, FILE *out, int dir)
+diff --git a/login-utils/last.c b/login-utils/last.c
+index d3eeed4b6e..1b45dbf24d 100644
+--- a/login-utils/last.c
++++ b/login-utils/last.c
+@@ -392,7 +392,6 @@ static int list(const struct last_control *ctl, struct utmpx *p, time_t logout_t
+ 	char		final[512];
+ 	char		utline[sizeof(p->ut_line) + 1];
+ 	char		domain[256];
+-	char		*s;
+ 	int		mins, hours, days;
+ 	int		r, len;
+ 	struct last_timefmt *fmt;
+@@ -548,8 +547,7 @@ static int list(const struct last_control *ctl, struct utmpx *p, time_t logout_t
+ 	/*
+ 	 *	Print out "final" string safely.
+ 	 */
+-	for (s = final; *s; s++)
+-		fputc_careful(*s, stdout, '*');
++	fputs_careful(final, stdout, '*', false);
+ 
+ 	if (len < 0 || (size_t)len >= sizeof(final))
+ 		putchar('\n');
+diff --git a/term-utils/write.c b/term-utils/write.c
+index 8b86e9a9d5..b485e28fd5 100644
+--- a/term-utils/write.c
++++ b/term-utils/write.c
+@@ -223,21 +223,6 @@ static void signal_handler(int signo)
+ 	signal_received = signo;
+ }
+ 
+-/*
+- * write_line - like fputs(), but makes control characters visible and
+- *     turns \n into \r\n.
+- */
+-static void write_line(char *s)
+-{
+-	while (*s) {
+-		const int c = *s++;
+-
+-		if ((c == '\n' && fputc_careful('\r', stdout, '^') == EOF)
+-		    || fputc_careful(c, stdout, '^') == EOF)
+-			err(EXIT_FAILURE, _("carefulputc failed"));
+-	}
+-}
+-
+ /*
+  * do_write - actually make the connection
+  */
+@@ -247,7 +232,8 @@ static void do_write(const struct write_control *ctl)
+ 	struct passwd *pwd;
+ 	time_t now;
+ 	struct tm *tm;
+-	char *host, line[512];
++	char *host, *line = NULL;
++	size_t linelen = 0;
+ 	struct sigaction sigact;
+ 
+ 	/* Determine our login name(s) before the we reopen() stdout */
+@@ -286,11 +272,14 @@ static void do_write(const struct write_control *ctl)
+ 	free(host);
+ 	printf("\r\n");
+ 
+-	while (fgets(line, sizeof(line), stdin) != NULL) {
++	while (getline(&line, &linelen, stdin) >= 0) {
+ 		if (signal_received)
+ 			break;
+-		write_line(line);
++
++		if (fputs_careful(line, stdout, '^', true) == EOF)
++			err(EXIT_FAILURE, _("carefulputc failed"));
+ 	}
++	free(line);
+ 	printf("EOF\r\n");
+ }
+ 
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-pre2.patch b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-pre2.patch
new file mode 100644
index 0000000000..1c4e4394cc
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-pre2.patch
@@ -0,0 +1,171 @@
+From 27ee6446503af7ec0c2647704ca47ac4de3852ef Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?=D0=BD=D0=B0=D0=B1?= <nabijaczleweli@nabijaczleweli.xyz>
+Date: Wed, 15 Mar 2023 16:16:43 +0100
+Subject: [PATCH] wall: convert homebrew buffering to open_memstream()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The struct buffer system duplicates a plethora of standard I/O
+functions (including a fork of fputc_careful())
+and adds a lot of complexity ‒ open_memstream() is standard,
+and fits perfectly into this niche
+
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/27ee6446503af7ec0c2647704ca47ac4de3852ef]
+CVE: CVE-2024-28085 #Dependency Patch2
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ term-utils/wall.c | 95 ++++++++++-------------------------------------
+ 1 file changed, 20 insertions(+), 75 deletions(-)
+
+diff --git a/term-utils/wall.c b/term-utils/wall.c
+index c601d3e5b7..a51a928293 100644
+--- a/term-utils/wall.c
++++ b/term-utils/wall.c
+@@ -274,74 +274,22 @@ int main(int argc, char **argv)
+ 	exit(EXIT_SUCCESS);
+ }
+ 
+-struct buffer {
+-	size_t	sz;
+-	size_t	used;
+-	char	*data;
+-};
+-
+-static void buf_enlarge(struct buffer *bs, size_t len)
++static void buf_putc_careful(FILE *fs, int c)
+ {
+-	if (bs->sz == 0 || len > bs->sz - bs->used) {
+-		bs->sz += len < 128 ? 128 : len;
+-		bs->data = xrealloc(bs->data, bs->sz);
+-	}
+-}
+-
+-static void buf_puts(struct buffer *bs, const char *s)
+-{
+-	size_t len = strlen(s);
+-
+-	buf_enlarge(bs, len + 1);
+-	memcpy(bs->data + bs->used, s, len + 1);
+-	bs->used += len;
+-}
+-
+-static void __attribute__((__format__ (__printf__, 2, 3)))
+-	buf_printf(struct buffer *bs, const char *fmt, ...)
+-{
+-	int rc;
+-	va_list ap;
+-	size_t limit;
+-
+-	buf_enlarge(bs, 0);	/* default size */
+-	limit = bs->sz - bs->used;
+-
+-	va_start(ap, fmt);
+-	rc = vsnprintf(bs->data + bs->used, limit, fmt, ap);
+-	va_end(ap);
+-
+-	if (rc >= 0 && (size_t) rc >= limit) {	/* not enough, enlarge */
+-		buf_enlarge(bs, (size_t)rc + 1);
+-		limit = bs->sz - bs->used;
+-		va_start(ap, fmt);
+-		rc = vsnprintf(bs->data  + bs->used, limit, fmt, ap);
+-		va_end(ap);
+-	}
+-
+-	if (rc > 0)
+-		bs->used += rc;
+-}
+-
+-static void buf_putc_careful(struct buffer *bs, int c)
+-{
+-	if (isprint(c) || c == '\a' || c == '\t' || c == '\r' || c == '\n') {
+-		buf_enlarge(bs, 1);
+-		bs->data[bs->used++] = c;
+-	} else if (!c_isascii(c))
+-		buf_printf(bs, "\\%3o", (unsigned char)c);
+-	else {
+-		char tmp[] = { '^', c ^ 0x40, '\0' };
+-		buf_puts(bs, tmp);
+-	}
++	if (isprint(c) || c == '\a' || c == '\t' || c == '\r' || c == '\n')
++		fputc(c, fs);
++	else if (!c_isascii(c))
++		fprintf(fs, "\\%3o", (unsigned char)c);
++	else
++		fputs((char[]){ '^', c ^ 0x40, '\0' }, fs);
+ }
+ 
+ static char *makemsg(char *fname, char **mvec, int mvecsz,
+ 		     size_t *mbufsize, int print_banner)
+ {
+-	struct buffer _bs = {.used = 0}, *bs = &_bs;
+ 	register int ch, cnt;
+-	char *p, *lbuf;
++	char *p, *lbuf, *retbuf;
++	FILE * fs = open_memstream(&retbuf, mbufsize);
+ 	long line_max;
+ 
+ 	line_max = sysconf(_SC_LINE_MAX);
+@@ -379,15 +327,15 @@ static char *makemsg(char *fname, char **mvec, int mvecsz,
+ 		 */
+ 		/* snprintf is not always available, but the sprintf's here
+ 		   will not overflow as long as %d takes at most 100 chars */
+-		buf_printf(bs, "\r%*s\r\n", TERM_WIDTH, " ");
++		fprintf(fs, "\r%*s\r\n", TERM_WIDTH, " ");
+ 
+ 		snprintf(lbuf, line_max,
+ 				_("Broadcast message from %s@%s (%s) (%s):"),
+ 				whom, hostname, where, date);
+-		buf_printf(bs, "%-*.*s\007\007\r\n", TERM_WIDTH, TERM_WIDTH, lbuf);
++		fprintf(fs, "%-*.*s\007\007\r\n", TERM_WIDTH, TERM_WIDTH, lbuf);
+ 		free(hostname);
+ 	}
+-	buf_printf(bs, "%*s\r\n", TERM_WIDTH, " ");
++	fprintf(fs, "%*s\r\n", TERM_WIDTH, " ");
+ 
+ 	 if (mvec) {
+ 		/*
+@@ -396,11 +344,11 @@ static char *makemsg(char *fname, char **mvec, int mvecsz,
+ 		int i;
+ 
+ 		for (i = 0; i < mvecsz; i++) {
+-			buf_puts(bs, mvec[i]);
++			fputs(mvec[i], fs);
+ 			if (i < mvecsz - 1)
+-				buf_puts(bs, " ");
++				fputc(' ', fs);
+ 		}
+-		buf_puts(bs, "\r\n");
++		fputs("\r\n", fs);
+ 	} else {
+ 		/*
+ 		 * read message from <file>
+@@ -428,23 +376,20 @@ static char *makemsg(char *fname, char **mvec, int mvecsz,
+ 		while (fgets(lbuf, line_max, stdin)) {
+ 			for (cnt = 0, p = lbuf; (ch = *p) != '\0'; ++p, ++cnt) {
+ 				if (cnt == TERM_WIDTH || ch == '\n') {
+-					for (; cnt < TERM_WIDTH; ++cnt)
+-						buf_puts(bs, " ");
+-					buf_puts(bs, "\r\n");
++					fprintf(fs, "%*s\r\n", TERM_WIDTH - cnt, "");
+ 					cnt = 0;
+ 				}
+ 				if (ch == '\t')
+ 					cnt += (7 - (cnt % 8));
+ 				if (ch != '\n')
+-					buf_putc_careful(bs, ch);
++					buf_putc_careful(fs, ch);
+ 			}
+ 		}
+ 	}
+-	buf_printf(bs, "%*s\r\n", TERM_WIDTH, " ");
++	fprintf(fs, "%*s\r\n", TERM_WIDTH, " ");
+ 
+ 	free(lbuf);
+ 
+-	bs->data[bs->used] = '\0';	/* be paranoid */
+-	*mbufsize = bs->used;
+-	return bs->data;
++	fclose(fs);
++	return retbuf;
+ }
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-pre3.patch b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-pre3.patch
new file mode 100644
index 0000000000..91beb53d1c
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-pre3.patch
@@ -0,0 +1,219 @@
+From aa13246a1bf1be9e4f6eb331f4d4d2dbc875e22f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?=D0=BD=D0=B0=D0=B1?= <nabijaczleweli@nabijaczleweli.xyz>
+Date: Wed, 15 Mar 2023 16:16:48 +0100
+Subject: [PATCH] wall: use fputs_careful()
+
+LINE_MAX only applies to teletypes in canonical mode: when stdin is a
+file, it could still very much tear; start off at 512 for the sprintf(),
+then use getline() like in write.
+
+The line wrapping has one suboptimal edge-case:
+  $ wall < all
+
+  Broadcast message from nabijaczleweli@tarta (pts/4) (Tue Mar 14 22:31:25
+  2023):
+
+  ^N^O^P^Q^R^S^T^U^V^W^X^Y^Z^[^\^]^^^_
+  !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJ
+  KLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~^?\200\201\202\203\204\205\206
+  \207\210\211\212\213\214\215\216\217\220\221\222\223\224\225\226\227\230\231\232
+  \233\234\235\236\237\240\241\242\243\244\245\246\247\250\251\252\253\254\255\256
+  \257\260\261\262\263\264\265\266\267\270\271\272\273\274\275\276\277\300\301\302
+  \303\304\305\306\307\310\311\312\313\314\315\316\317\320\321\322\323\324\325\326
+  \327\330\331\332\333\334\335\336\337\340\341\342\343\344\345\346\347\350\351\352
+  \353\354\355\356\357\360\361\362\363\364\365\366\367\370\371\372\373\374\375\376
+  \377
+but that's a pathological input, and the result is still infinitely
+better than it was before, so fixing that is more trouble than it's
+worth.
+
+Bug-Debian: https://bugs.debian.org/826596
+
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/aa13246a1bf1be9e4f6eb331f4d4d2dbc875e22f]
+CVE: CVE-2024-28085 #Dependency Patch3
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ include/carefulputc.h | 42 +++++++++++++++++++++++++++++++++---------
+ login-utils/last.c    |  2 +-
+ term-utils/wall.c     | 38 ++++++--------------------------------
+ term-utils/write.c    |  2 +-
+ 4 files changed, 41 insertions(+), 43 deletions(-)
+
+diff --git a/include/carefulputc.h b/include/carefulputc.h
+index 740add68e8..3cc6f7ff99 100644
+--- a/include/carefulputc.h
++++ b/include/carefulputc.h
+@@ -6,6 +6,7 @@
+ #include <ctype.h>
+ #ifdef HAVE_WIDECHAR
+ #include <wctype.h>
++#include <wchar.h>
+ #endif
+ #include <stdbool.h>
+ 
+@@ -15,18 +16,35 @@
+  * A puts() for use in write and wall (that sometimes are sgid tty).
+  * It avoids control and invalid characters.
+  * The locale of the recipient is nominally unknown,
+- * but it's a solid bet that the encoding is compatible with the author's.
++ * but it's a solid bet that it's compatible with the author's.
++ * Use soft_width=0 to disable wrapping.
+  */
+-static inline int fputs_careful(const char * s, FILE *fp, const char ctrl, bool cr_lf)
++static inline int fputs_careful(const char * s, FILE *fp, const char ctrl, bool cr_lf, int soft_width)
+ {
+-	int ret = 0;
++	int ret = 0, col = 0;
+ 
+ 	for (size_t slen = strlen(s); *s; ++s, --slen) {
+-		if (*s == '\n')
++		if (*s == '\t')
++			col += (7 - (col % 8)) - 1;
++		else if (*s == '\r')
++			col = -1;
++		else if (*s == '\a')
++			--col;
++
++		if ((soft_width && col >= soft_width) || *s == '\n') {
++			if (soft_width) {
++				fprintf(fp, "%*s", soft_width - col, "");
++				col = 0;
++			}
+ 			ret = fputs(cr_lf ? "\r\n" : "\n", fp);
+-		else if (isprint(*s) || *s == '\a' || *s == '\t' || *s == '\r')
++			if (*s == '\n' || ret < 0)
++				goto wrote;
++		}
++
++		if (isprint(*s) || *s == '\a' || *s == '\t' || *s == '\r') {
+ 			ret = putc(*s, fp);
+-		else if (!c_isascii(*s)) {
++			++col;
++		} else if (!c_isascii(*s)) {
+ #ifdef HAVE_WIDECHAR
+ 			wchar_t w;
+ 			size_t clen = mbtowc(&w, s, slen);
+@@ -35,21 +53,27 @@ static inline int fputs_careful(const char * s, FILE *fp, const char ctrl, bool
+ 				case (size_t)-1:  // EILSEQ
+ 					mbtowc(NULL, NULL, 0);
+ 				nonprint:
+-					ret = fprintf(fp, "\\%3hho", *s);
++					col += ret = fprintf(fp, "\\%3hho", *s);
+ 					break;
+ 				default:
+ 					if(!iswprint(w))
+ 						goto nonprint;
+ 					ret = fwrite(s, 1, clen, fp);
++					if (soft_width)
++						col += wcwidth(w);
+ 					s += clen - 1;
+ 					slen -= clen - 1;
+ 					break;
+ 			}
+ #else
+-			ret = fprintf(fp, "\\%3hho", *s);
++			col += ret = fprintf(fp, "\\%3hho", *s);
+ #endif
+-		} else
++		} else {
+ 			ret = fputs((char[]){ ctrl, *s ^ 0x40, '\0' }, fp);
++			col += 2;
++		}
++
++	wrote:
+ 		if (ret < 0)
+ 			return EOF;
+ 	}
+diff --git a/login-utils/last.c b/login-utils/last.c
+index 1b45dbf24d..37c6abe972 100644
+--- a/login-utils/last.c
++++ b/login-utils/last.c
+@@ -547,7 +547,7 @@ static int list(const struct last_control *ctl, struct utmpx *p, time_t logout_t
+ 	/*
+ 	 *	Print out "final" string safely.
+ 	 */
+-	fputs_careful(final, stdout, '*', false);
++	fputs_careful(final, stdout, '*', false, 0);
+ 
+ 	if (len < 0 || (size_t)len >= sizeof(final))
+ 		putchar('\n');
+diff --git a/term-utils/wall.c b/term-utils/wall.c
+index a51a928293..377db45183 100644
+--- a/term-utils/wall.c
++++ b/term-utils/wall.c
+@@ -274,29 +274,13 @@ int main(int argc, char **argv)
+ 	exit(EXIT_SUCCESS);
+ }
+ 
+-static void buf_putc_careful(FILE *fs, int c)
+-{
+-	if (isprint(c) || c == '\a' || c == '\t' || c == '\r' || c == '\n')
+-		fputc(c, fs);
+-	else if (!c_isascii(c))
+-		fprintf(fs, "\\%3o", (unsigned char)c);
+-	else
+-		fputs((char[]){ '^', c ^ 0x40, '\0' }, fs);
+-}
+-
+ static char *makemsg(char *fname, char **mvec, int mvecsz,
+ 		     size_t *mbufsize, int print_banner)
+ {
+-	register int ch, cnt;
+-	char *p, *lbuf, *retbuf;
++	char *lbuf, *retbuf;
+ 	FILE * fs = open_memstream(&retbuf, mbufsize);
+-	long line_max;
+-
+-	line_max = sysconf(_SC_LINE_MAX);
+-	if (line_max <= 0)
+-		line_max = 512;
+-
+-	lbuf = xmalloc(line_max);
++	size_t lbuflen = 512;
++	lbuf = xmalloc(lbuflen);
+ 
+ 	if (print_banner == TRUE) {
+ 		char *hostname = xgethostname();
+@@ -329,7 +313,7 @@ static char *makemsg(char *fname, char **mvec, int mvecsz,
+ 		   will not overflow as long as %d takes at most 100 chars */
+ 		fprintf(fs, "\r%*s\r\n", TERM_WIDTH, " ");
+ 
+-		snprintf(lbuf, line_max,
++		snprintf(lbuf, lbuflen,
+ 				_("Broadcast message from %s@%s (%s) (%s):"),
+ 				whom, hostname, where, date);
+ 		fprintf(fs, "%-*.*s\007\007\r\n", TERM_WIDTH, TERM_WIDTH, lbuf);
+@@ -373,18 +357,8 @@ static char *makemsg(char *fname, char **mvec, int mvecsz,
+ 		/*
+ 		 * Read message from stdin.
+ 		 */
+-		while (fgets(lbuf, line_max, stdin)) {
+-			for (cnt = 0, p = lbuf; (ch = *p) != '\0'; ++p, ++cnt) {
+-				if (cnt == TERM_WIDTH || ch == '\n') {
+-					fprintf(fs, "%*s\r\n", TERM_WIDTH - cnt, "");
+-					cnt = 0;
+-				}
+-				if (ch == '\t')
+-					cnt += (7 - (cnt % 8));
+-				if (ch != '\n')
+-					buf_putc_careful(fs, ch);
+-			}
+-		}
++		while (getline(&lbuf, &lbuflen, stdin) >= 0)
++			fputs_careful(lbuf, fs, '^', true, TERM_WIDTH);
+ 	}
+ 	fprintf(fs, "%*s\r\n", TERM_WIDTH, " ");
+ 
+diff --git a/term-utils/write.c b/term-utils/write.c
+index b485e28fd5..a5a21280c3 100644
+--- a/term-utils/write.c
++++ b/term-utils/write.c
+@@ -276,7 +276,7 @@ static void do_write(const struct write_control *ctl)
+ 		if (signal_received)
+ 			break;
+ 
+-		if (fputs_careful(line, stdout, '^', true) == EOF)
++		if (fputs_careful(line, stdout, '^', true, 0) == EOF)
+ 			err(EXIT_FAILURE, _("carefulputc failed"));
+ 	}
+ 	free(line);
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2024-28085.patch b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085.patch
new file mode 100644
index 0000000000..0bfc3cde75
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085.patch
@@ -0,0 +1,30 @@
+From 404b0781f52f7c045ca811b2dceec526408ac253 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 21 Mar 2024 11:16:20 +0100
+Subject: [PATCH] wall: fix escape sequence Injection [CVE-2024-28085]
+
+Let's use for all cases the same output function.
+
+Reported-by: Skyler Ferrante <sjf5462@rit.edu>
+Signed-off-by: Karel Zak <kzak@redhat.com>
+
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/404b0781f52f7c045ca811b2dceec526408ac253]
+CVE: CVE-2024-28085
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ term-utils/wall.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/term-utils/wall.c b/term-utils/wall.c
+index f894a32f86..588d3a9636 100644
+--- a/term-utils/wall.c
++++ b/term-utils/wall.c
+@@ -368,7 +368,7 @@ static char *makemsg(char *fname, char **mvec, int mvecsz,
+ 		int i;
+ 
+ 		for (i = 0; i < mvecsz; i++) {
+-			fputs(mvec[i], fs);
++			fputs_careful(mvec[i], fs, '^', true, TERM_WIDTH);
+ 			if (i < mvecsz - 1)
+ 				fputc(' ', fs);
+ 		}
-- 
2.25.1


