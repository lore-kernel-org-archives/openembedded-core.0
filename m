Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB929C04FF6
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 13:36:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.21391.1713533765401903259
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Apr 2024 06:36:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=OWNRJEH5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=483981f7a8=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43JBFQAX004326
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 13:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=PPS06212021; bh=dDrh9CZSZzb0Gw8nrV
	N6aCDjfYTrE3RQpabl9mNwsa4=; b=OWNRJEH5PVdmF8uPvmmzrCZZjk6pL+C9Kv
	87RZ3mUBcuW5LdFv4SVEKN9eSN3Cd1jjSXPRj8/DAlTAYCxL6TnUMI+tTFI4Kvb4
	WsvbFQlvqYwSgydtnuJel7w5J0i+mAEYfGpzu4OMAcAONft64IeV9OIKg7EUQWCe
	Ke9tnOCb/mcvzACLD9W7uagobuzAN1VoeYmlXalPOe9t/1fl9Zt1Ab51CjmrdLog
	vvYz6gJiSvmMv+nYWJsCKqD6v0bBZV9YxzD6dOlNDufSadFhjIvQJ1l34/5I+9bz
	Us7gAfsu+g4Hp+eCwWc8GCVH2ixNQ87xbT77N9MOghNSW/Qkx4Bw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xff8ye5jh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 13:36:04 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Fri, 19 Apr 2024 06:36:01 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] util-linux: Fix CVE-2024-28085
Date: Fri, 19 Apr 2024 13:35:44 +0000
Message-ID: <20240419133544.3010310-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: yhdnKTj__eu_UCLUNb7BCiIGp1UHt2VU
X-Proofpoint-ORIG-GUID: yhdnKTj__eu_UCLUNb7BCiIGp1UHt2VU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_09,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404190102
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 43JBFQAX004326
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 13:36:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198550

From: Soumya Sambu <soumya.sambu@windriver.com>

wall in util-linux through 2.40, often installed with setgid
tty permissions, allows escape sequences to be sent to other
users' terminals through argv. (Specifically, escape sequences
received from stdin are blocked, but escape sequences received
from argv are not blocked.) There may be plausible scenarios
where this leads to account takeover.

CVE-2024-28085-0004 is the CVE fix and CVE-2024-28085-0001,
CVE-2024-28085-0002, CVE-2024-28085-0003 are dependent commits
to fix the CVE.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-28085

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |   4 +
 .../util-linux/CVE-2024-28085-0001.patch      | 202 ++++++++++++++++
 .../util-linux/CVE-2024-28085-0002.patch      | 172 ++++++++++++++
 .../util-linux/CVE-2024-28085-0003.patch      | 223 ++++++++++++++++++
 .../util-linux/CVE-2024-28085-0004.patch      |  34 +++
 5 files changed, 635 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2024-2808=
5-0001.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2024-2808=
5-0002.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2024-2808=
5-0003.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2024-2808=
5-0004.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-c=
ore/util-linux/util-linux.inc
index 982ec669a2..72c028ac3d 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -35,6 +35,10 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-linu=
x/v${MAJOR_VERSION}/util-lin
            file://run-ptest \
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
+           file://CVE-2024-28085-0001.patch \
+           file://CVE-2024-28085-0002.patch \
+           file://CVE-2024-28085-0003.patch \
+           file://CVE-2024-28085-0004.patch \
            "
=20
 SRC_URI[sha256sum] =3D "634e6916ad913366c3536b6468e7844769549b99a7b2bf80=
314de78ab5655b83"
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0001.=
patch b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0001.patch
new file mode 100644
index 0000000000..7ce2d6c567
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0001.patch
@@ -0,0 +1,202 @@
+From 8a7b8456d1dc0e7ca557d1ac31f638986704757f Mon Sep 17 00:00:00 2001
+From: =D0=BD=D0=B0=D0=B1 <nabijaczleweli@nabijaczleweli.xyz>
+Date: Wed Mar 15 16:16:31 2023 +0100
+Subject: [PATCH] write: correctly handle wide characters
+
+Do this by replacing fputc_careful() (notice that the description said
+it's locale-aware =E2=80=92 it very much is /not/), with a fputs_careful=
() which
+does the same thing, but if it were to output a byte in the \123 format,
+first it checks whether this byte starts a valid multibyte character.
+
+If it does, and that character is printable, write it verbatim.
+This means that
+  echo 'foo =C3=A5=C3=A4=C3=B6 =C4=85=C4=99=C4=87=C5=BA=C5=BC=C5=84 bar'=
 | write nabijaczleweli pts/4
+instead of
+  foo \303\245\303\244\303\266
+  \304\205\304\231\304\207\305\272\305\274\305\204 bar
+yields
+  foo =C3=A5=C3=A4=C3=B6 =C4=85=C4=99=C4=87=C5=BA=C5=BC=C5=84 bar
+or, more realistically, from a message I got earlier today,
+  Filip powiedzia\305\202 \305\274e zap\305\202aci jutro
+becomes
+  Filip powiedzia=C5=82 =C5=BCe zap=C5=82aci jutro
+
+Invalid/non-printable sequences get processed as before.
+
+Line reading in write must become getline() to avoid dealing with
+partial characters: for example on input consisting solely of
+=C4=85=C4=99=C4=87=C5=BA=C5=BC=C5=84, where every {1} is an instance, th=
e output would be
+  {42}=C4=85=C4=99=C4=87\305\272=C5=BC=C5=84{84}=C4=85=C4=99=C4=87=C5=BA=
\305\274=C5=84{84}=C4=85=C4=99=C4=87=C5=BA=C5=BC\305\204{39}
+with just fixed-512 fgets()
+
+Bug-Debian: https://bugs.debian.org/826596
+
+CVE: CVE-2024-28085
+
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/comm=
it/8a7b8456d1dc0e7ca557d1ac31f638986704757f]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ include/carefulputc.h | 62 +++++++++++++++++++++++++++++++------------
+ login-utils/last.c    |  4 +--
+ term-utils/write.c    | 25 +++++------------
+ 3 files changed, 53 insertions(+), 38 deletions(-)
+
+diff --git a/include/carefulputc.h b/include/carefulputc.h
+index 66a0f15..2506614 100644
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
++ * but it's a solid bet that the encoding is compatible with the author=
's.
++ */
++static inline int fputs_careful(const char * s, FILE *fp, const char ct=
rl, bool cr_lf)
+ {
+-	int ret;
+-
+-	if (isprint(c) || c =3D=3D '\a' || c =3D=3D '\t' || c =3D=3D '\r' || c=
 =3D=3D '\n')
+-		ret =3D putc(c, fp);
+-	else if (!c_isascii(c))
+-		ret =3D fprintf(fp, "\\%3o", (unsigned char)c);
+-	else {
+-		ret =3D putc(fail, fp);
+-		if (ret !=3D EOF)
+-			ret =3D putc(c ^ 0x40, fp);
++	int ret =3D 0;
++
++	for (size_t slen =3D strlen(s); *s; ++s, --slen) {
++		if (*s =3D=3D '\n')
++			ret =3D fputs(cr_lf ? "\r\n" : "\n", fp);
++		else if (isprint(*s) || *s =3D=3D '\a' || *s =3D=3D '\t' || *s =3D=3D=
 '\r')
++			ret =3D putc(*s, fp);
++		else if (!c_isascii(*s)) {
++#ifdef HAVE_WIDECHAR
++			wchar_t w;
++			size_t clen =3D mbtowc(&w, s, slen);
++			switch(clen) {
++				case (size_t)-2:  // incomplete
++				case (size_t)-1:  // EILSEQ
++					mbtowc(NULL, NULL, 0);
++				nonprint:
++					ret =3D fprintf(fp, "\\%3hho", *s);
++					break;
++				default:
++					if(!iswprint(w))
++						goto nonprint;
++					ret =3D fwrite(s, 1, clen, fp);
++					s +=3D clen - 1;
++					slen -=3D clen - 1;
++					break;
++			}
++#else
++			ret =3D fprintf(fp, "\\%3hho", *s);
++#endif
++		} else
++			ret =3D fputs((char[]){ ctrl, *s ^ 0x40, '\0' }, fp);
++		if (ret < 0)
++			return EOF;
+	}
+-	return (ret < 0) ? EOF : 0;
++	return 0;
+ }
+
+ static inline void fputs_quoted_case(const char *data, FILE *out, int d=
ir)
+diff --git a/login-utils/last.c b/login-utils/last.c
+index f3272ca..aacd1f6 100644
+--- a/login-utils/last.c
++++ b/login-utils/last.c
+@@ -403,7 +403,6 @@ static int list(const struct last_control *ctl, stru=
ct utmpx *p, time_t logout_t
+	char		final[512];
+	char		utline[sizeof(p->ut_line) + 1];
+	char		domain[256];
+-	char		*s;
+	int		mins, hours, days;
+	int		r, len;
+	struct last_timefmt *fmt;
+@@ -559,8 +558,7 @@ static int list(const struct last_control *ctl, stru=
ct utmpx *p, time_t logout_t
+	/*
+	 *	Print out "final" string safely.
+	 */
+-	for (s =3D final; *s; s++)
+-		fputc_careful(*s, stdout, '*');
++	fputs_careful(final, stdout, '*', false);
+
+	if (len < 0 || (size_t)len >=3D sizeof(final))
+		putchar('\n');
+diff --git a/term-utils/write.c b/term-utils/write.c
+index 50f18dc..710a58c 100644
+--- a/term-utils/write.c
++++ b/term-utils/write.c
+@@ -223,21 +223,6 @@ static void signal_handler(int signo)
+	signal_received =3D signo;
+ }
+
+-/*
+- * write_line - like fputs(), but makes control characters visible and
+- *     turns \n into \r\n.
+- */
+-static void write_line(char *s)
+-{
+-	while (*s) {
+-		const int c =3D *s++;
+-
+-		if ((c =3D=3D '\n' && fputc_careful('\r', stdout, '^') =3D=3D EOF)
+-		    || fputc_careful(c, stdout, '^') =3D=3D EOF)
+-			err(EXIT_FAILURE, _("carefulputc failed"));
+-	}
+-}
+-
+ /*
+  * do_write - actually make the connection
+  */
+@@ -247,7 +232,8 @@ static void do_write(const struct write_control *ctl=
)
+	struct passwd *pwd;
+	time_t now;
+	struct tm *tm;
+-	char *host, line[512];
++	char *host, *line =3D NULL;
++	size_t linelen =3D 0;
+	struct sigaction sigact;
+
+	/* Determine our login name(s) before the we reopen() stdout */
+@@ -286,11 +272,14 @@ static void do_write(const struct write_control *c=
tl)
+	free(host);
+	printf("\r\n");
+
+-	while (fgets(line, sizeof(line), stdin) !=3D NULL) {
++	while (getline(&line, &linelen, stdin) >=3D 0) {
+		if (signal_received)
+			break;
+-		write_line(line);
++
++		if (fputs_careful(line, stdout, '^', true) =3D=3D EOF)
++			err(EXIT_FAILURE, _("carefulputc failed"));
+	}
++	free(line);
+	printf("EOF\r\n");
+ }
+
+--
+2.40.0
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0002.=
patch b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0002.patch
new file mode 100644
index 0000000000..1fceebbdb4
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0002.patch
@@ -0,0 +1,172 @@
+From 27ee6446503af7ec0c2647704ca47ac4de3852ef Mon Sep 17 00:00:00 2001
+From: =D0=BD=D0=B0=D0=B1 <nabijaczleweli@nabijaczleweli.xyz>
+Date: Wed, 15 Mar 2023 16:16:43 +0100
+Subject: [PATCH] wall: convert homebrew buffering to open_memstream()
+
+The struct buffer system duplicates a plethora of standard I/O
+functions (including a fork of fputc_careful())
+and adds a lot of complexity =E2=80=92 open_memstream() is standard,
+and fits perfectly into this niche
+
+CVE: CVE-2024-28085
+
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/comm=
it/27ee6446503af7ec0c2647704ca47ac4de3852ef]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ term-utils/wall.c | 95 ++++++++++-------------------------------------
+ 1 file changed, 20 insertions(+), 75 deletions(-)
+
+diff --git a/term-utils/wall.c b/term-utils/wall.c
+index c601d3e..a51a928 100644
+--- a/term-utils/wall.c
++++ b/term-utils/wall.c
+@@ -274,74 +274,22 @@ int main(int argc, char **argv)
+	exit(EXIT_SUCCESS);
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
+-	if (bs->sz =3D=3D 0 || len > bs->sz - bs->used) {
+-		bs->sz +=3D len < 128 ? 128 : len;
+-		bs->data =3D xrealloc(bs->data, bs->sz);
+-	}
+-}
+-
+-static void buf_puts(struct buffer *bs, const char *s)
+-{
+-	size_t len =3D strlen(s);
+-
+-	buf_enlarge(bs, len + 1);
+-	memcpy(bs->data + bs->used, s, len + 1);
+-	bs->used +=3D len;
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
+-	limit =3D bs->sz - bs->used;
+-
+-	va_start(ap, fmt);
+-	rc =3D vsnprintf(bs->data + bs->used, limit, fmt, ap);
+-	va_end(ap);
+-
+-	if (rc >=3D 0 && (size_t) rc >=3D limit) {	/* not enough, enlarge */
+-		buf_enlarge(bs, (size_t)rc + 1);
+-		limit =3D bs->sz - bs->used;
+-		va_start(ap, fmt);
+-		rc =3D vsnprintf(bs->data  + bs->used, limit, fmt, ap);
+-		va_end(ap);
+-	}
+-
+-	if (rc > 0)
+-		bs->used +=3D rc;
+-}
+-
+-static void buf_putc_careful(struct buffer *bs, int c)
+-{
+-	if (isprint(c) || c =3D=3D '\a' || c =3D=3D '\t' || c =3D=3D '\r' || c=
 =3D=3D '\n') {
+-		buf_enlarge(bs, 1);
+-		bs->data[bs->used++] =3D c;
+-	} else if (!c_isascii(c))
+-		buf_printf(bs, "\\%3o", (unsigned char)c);
+-	else {
+-		char tmp[] =3D { '^', c ^ 0x40, '\0' };
+-		buf_puts(bs, tmp);
+-	}
++	if (isprint(c) || c =3D=3D '\a' || c =3D=3D '\t' || c =3D=3D '\r' || c=
 =3D=3D '\n')
++		fputc(c, fs);
++	else if (!c_isascii(c))
++		fprintf(fs, "\\%3o", (unsigned char)c);
++	else
++		fputs((char[]){ '^', c ^ 0x40, '\0' }, fs);
+ }
+
+ static char *makemsg(char *fname, char **mvec, int mvecsz,
+		     size_t *mbufsize, int print_banner)
+ {
+-	struct buffer _bs =3D {.used =3D 0}, *bs =3D &_bs;
+	register int ch, cnt;
+-	char *p, *lbuf;
++	char *p, *lbuf, *retbuf;
++	FILE * fs =3D open_memstream(&retbuf, mbufsize);
+	long line_max;
+
+	line_max =3D sysconf(_SC_LINE_MAX);
+@@ -379,15 +327,15 @@ static char *makemsg(char *fname, char **mvec, int=
 mvecsz,
+		 */
+		/* snprintf is not always available, but the sprintf's here
+		   will not overflow as long as %d takes at most 100 chars */
+-		buf_printf(bs, "\r%*s\r\n", TERM_WIDTH, " ");
++		fprintf(fs, "\r%*s\r\n", TERM_WIDTH, " ");
+
+		snprintf(lbuf, line_max,
+				_("Broadcast message from %s@%s (%s) (%s):"),
+				whom, hostname, where, date);
+-		buf_printf(bs, "%-*.*s\007\007\r\n", TERM_WIDTH, TERM_WIDTH, lbuf);
++		fprintf(fs, "%-*.*s\007\007\r\n", TERM_WIDTH, TERM_WIDTH, lbuf);
+		free(hostname);
+	}
+-	buf_printf(bs, "%*s\r\n", TERM_WIDTH, " ");
++	fprintf(fs, "%*s\r\n", TERM_WIDTH, " ");
+
+	 if (mvec) {
+		/*
+@@ -396,11 +344,11 @@ static char *makemsg(char *fname, char **mvec, int=
 mvecsz,
+		int i;
+
+		for (i =3D 0; i < mvecsz; i++) {
+-			buf_puts(bs, mvec[i]);
++			fputs(mvec[i], fs);
+			if (i < mvecsz - 1)
+-				buf_puts(bs, " ");
++				fputc(' ', fs);
+		}
+-		buf_puts(bs, "\r\n");
++		fputs("\r\n", fs);
+	} else {
+		/*
+		 * read message from <file>
+@@ -428,23 +376,20 @@ static char *makemsg(char *fname, char **mvec, int=
 mvecsz,
+		while (fgets(lbuf, line_max, stdin)) {
+			for (cnt =3D 0, p =3D lbuf; (ch =3D *p) !=3D '\0'; ++p, ++cnt) {
+				if (cnt =3D=3D TERM_WIDTH || ch =3D=3D '\n') {
+-					for (; cnt < TERM_WIDTH; ++cnt)
+-						buf_puts(bs, " ");
+-					buf_puts(bs, "\r\n");
++					fprintf(fs, "%*s\r\n", TERM_WIDTH - cnt, "");
+					cnt =3D 0;
+				}
+				if (ch =3D=3D '\t')
+					cnt +=3D (7 - (cnt % 8));
+				if (ch !=3D '\n')
+-					buf_putc_careful(bs, ch);
++					buf_putc_careful(fs, ch);
+			}
+		}
+	}
+-	buf_printf(bs, "%*s\r\n", TERM_WIDTH, " ");
++	fprintf(fs, "%*s\r\n", TERM_WIDTH, " ");
+
+	free(lbuf);
+
+-	bs->data[bs->used] =3D '\0';	/* be paranoid */
+-	*mbufsize =3D bs->used;
+-	return bs->data;
++	fclose(fs);
++	return retbuf;
+ }
+--
+2.40.0
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0003.=
patch b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0003.patch
new file mode 100644
index 0000000000..55eba9cc49
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0003.patch
@@ -0,0 +1,223 @@
+From aa13246a1bf1be9e4f6eb331f4d4d2dbc875e22f Mon Sep 17 00:00:00 2001
+From: =D0=BD=D0=B0=D0=B1 <nabijaczleweli@nabijaczleweli.xyz>
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
+  Broadcast message from nabijaczleweli@tarta (pts/4) (Tue Mar 14 22:31:=
25
+  2023):
+
+  ^N^O^P^Q^R^S^T^U^V^W^X^Y^Z^[^\^]^^^_
+  !"#$%&'()*+,-./0123456789:;<=3D>?@ABCDEFGHIJ
+  KLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~^?\200\201\202\203=
\204\205\206
+  \207\210\211\212\213\214\215\216\217\220\221\222\223\224\225\226\227\2=
30\231\232
+  \233\234\235\236\237\240\241\242\243\244\245\246\247\250\251\252\253\2=
54\255\256
+  \257\260\261\262\263\264\265\266\267\270\271\272\273\274\275\276\277\3=
00\301\302
+  \303\304\305\306\307\310\311\312\313\314\315\316\317\320\321\322\323\3=
24\325\326
+  \327\330\331\332\333\334\335\336\337\340\341\342\343\344\345\346\347\3=
50\351\352
+  \353\354\355\356\357\360\361\362\363\364\365\366\367\370\371\372\373\3=
74\375\376
+  \377
+but that's a pathological input, and the result is still infinitely
+better than it was before, so fixing that is more trouble than it's
+worth.
+
+Bug-Debian: https://bugs.debian.org/826596
+
+CVE: CVE-2024-28085
+
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/comm=
it/aa13246a1bf1be9e4f6eb331f4d4d2dbc875e22f]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ include/carefulputc.h | 42 +++++++++++++++++++++++++++++++++---------
+ login-utils/last.c    |  2 +-
+ term-utils/wall.c     | 38 ++++++--------------------------------
+ term-utils/write.c    |  2 +-
+ 4 files changed, 41 insertions(+), 43 deletions(-)
+
+diff --git a/include/carefulputc.h b/include/carefulputc.h
+index 2506614..89f8a99 100644
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
+- * but it's a solid bet that the encoding is compatible with the author=
's.
++ * but it's a solid bet that it's compatible with the author's.
++ * Use soft_width=3D0 to disable wrapping.
+  */
+-static inline int fputs_careful(const char * s, FILE *fp, const char ct=
rl, bool cr_lf)
++static inline int fputs_careful(const char * s, FILE *fp, const char ct=
rl, bool cr_lf, int soft_width)
+ {
+-	int ret =3D 0;
++	int ret =3D 0, col =3D 0;
+
+	for (size_t slen =3D strlen(s); *s; ++s, --slen) {
+-		if (*s =3D=3D '\n')
++		if (*s =3D=3D '\t')
++			col +=3D (7 - (col % 8)) - 1;
++		else if (*s =3D=3D '\r')
++			col =3D -1;
++		else if (*s =3D=3D '\a')
++			--col;
++
++		if ((soft_width && col >=3D soft_width) || *s =3D=3D '\n') {
++			if (soft_width) {
++				fprintf(fp, "%*s", soft_width - col, "");
++				col =3D 0;
++			}
+			ret =3D fputs(cr_lf ? "\r\n" : "\n", fp);
+-		else if (isprint(*s) || *s =3D=3D '\a' || *s =3D=3D '\t' || *s =3D=3D=
 '\r')
++			if (*s =3D=3D '\n' || ret < 0)
++				goto wrote;
++		}
++
++		if (isprint(*s) || *s =3D=3D '\a' || *s =3D=3D '\t' || *s =3D=3D '\r'=
) {
+			ret =3D putc(*s, fp);
+-		else if (!c_isascii(*s)) {
++			++col;
++		} else if (!c_isascii(*s)) {
+ #ifdef HAVE_WIDECHAR
+			wchar_t w;
+			size_t clen =3D mbtowc(&w, s, slen);
+@@ -35,21 +53,27 @@ static inline int fputs_careful(const char * s, FILE=
 *fp, const char ctrl, bool
+				case (size_t)-1:  // EILSEQ
+					mbtowc(NULL, NULL, 0);
+				nonprint:
+-					ret =3D fprintf(fp, "\\%3hho", *s);
++					col +=3D ret =3D fprintf(fp, "\\%3hho", *s);
+					break;
+				default:
+					if(!iswprint(w))
+						goto nonprint;
+					ret =3D fwrite(s, 1, clen, fp);
++					if (soft_width)
++						col +=3D wcwidth(w);
+					s +=3D clen - 1;
+					slen -=3D clen - 1;
+					break;
+			}
+ #else
+-			ret =3D fprintf(fp, "\\%3hho", *s);
++			col +=3D ret =3D fprintf(fp, "\\%3hho", *s);
+ #endif
+-		} else
++		} else {
+			ret =3D fputs((char[]){ ctrl, *s ^ 0x40, '\0' }, fp);
++			col +=3D 2;
++		}
++
++	wrote:
+		if (ret < 0)
+			return EOF;
+	}
+diff --git a/login-utils/last.c b/login-utils/last.c
+index aacd1f6..43c5429 100644
+--- a/login-utils/last.c
++++ b/login-utils/last.c
+@@ -558,7 +558,7 @@ static int list(const struct last_control *ctl, stru=
ct utmpx *p, time_t logout_t
+	/*
+	 *	Print out "final" string safely.
+	 */
+-	fputs_careful(final, stdout, '*', false);
++	fputs_careful(final, stdout, '*', false, 0);
+
+	if (len < 0 || (size_t)len >=3D sizeof(final))
+		putchar('\n');
+diff --git a/term-utils/wall.c b/term-utils/wall.c
+index a51a928..377db45 100644
+--- a/term-utils/wall.c
++++ b/term-utils/wall.c
+@@ -274,29 +274,13 @@ int main(int argc, char **argv)
+	exit(EXIT_SUCCESS);
+ }
+
+-static void buf_putc_careful(FILE *fs, int c)
+-{
+-	if (isprint(c) || c =3D=3D '\a' || c =3D=3D '\t' || c =3D=3D '\r' || c=
 =3D=3D '\n')
+-		fputc(c, fs);
+-	else if (!c_isascii(c))
+-		fprintf(fs, "\\%3o", (unsigned char)c);
+-	else
+-		fputs((char[]){ '^', c ^ 0x40, '\0' }, fs);
+-}
+-
+ static char *makemsg(char *fname, char **mvec, int mvecsz,
+		     size_t *mbufsize, int print_banner)
+ {
+-	register int ch, cnt;
+-	char *p, *lbuf, *retbuf;
++	char *lbuf, *retbuf;
+	FILE * fs =3D open_memstream(&retbuf, mbufsize);
+-	long line_max;
+-
+-	line_max =3D sysconf(_SC_LINE_MAX);
+-	if (line_max <=3D 0)
+-		line_max =3D 512;
+-
+-	lbuf =3D xmalloc(line_max);
++	size_t lbuflen =3D 512;
++	lbuf =3D xmalloc(lbuflen);
+
+	if (print_banner =3D=3D TRUE) {
+		char *hostname =3D xgethostname();
+@@ -329,7 +313,7 @@ static char *makemsg(char *fname, char **mvec, int m=
vecsz,
+		   will not overflow as long as %d takes at most 100 chars */
+		fprintf(fs, "\r%*s\r\n", TERM_WIDTH, " ");
+
+-		snprintf(lbuf, line_max,
++		snprintf(lbuf, lbuflen,
+				_("Broadcast message from %s@%s (%s) (%s):"),
+				whom, hostname, where, date);
+		fprintf(fs, "%-*.*s\007\007\r\n", TERM_WIDTH, TERM_WIDTH, lbuf);
+@@ -373,18 +357,8 @@ static char *makemsg(char *fname, char **mvec, int =
mvecsz,
+		/*
+		 * Read message from stdin.
+		 */
+-		while (fgets(lbuf, line_max, stdin)) {
+-			for (cnt =3D 0, p =3D lbuf; (ch =3D *p) !=3D '\0'; ++p, ++cnt) {
+-				if (cnt =3D=3D TERM_WIDTH || ch =3D=3D '\n') {
+-					fprintf(fs, "%*s\r\n", TERM_WIDTH - cnt, "");
+-					cnt =3D 0;
+-				}
+-				if (ch =3D=3D '\t')
+-					cnt +=3D (7 - (cnt % 8));
+-				if (ch !=3D '\n')
+-					buf_putc_careful(fs, ch);
+-			}
+-		}
++		while (getline(&lbuf, &lbuflen, stdin) >=3D 0)
++			fputs_careful(lbuf, fs, '^', true, TERM_WIDTH);
+	}
+	fprintf(fs, "%*s\r\n", TERM_WIDTH, " ");
+
+diff --git a/term-utils/write.c b/term-utils/write.c
+index 710a58c..1d57fce 100644
+--- a/term-utils/write.c
++++ b/term-utils/write.c
+@@ -276,7 +276,7 @@ static void do_write(const struct write_control *ctl=
)
+		if (signal_received)
+			break;
+
+-		if (fputs_careful(line, stdout, '^', true) =3D=3D EOF)
++		if (fputs_careful(line, stdout, '^', true, 0) =3D=3D EOF)
+			err(EXIT_FAILURE, _("carefulputc failed"));
+	}
+	free(line);
+--
+2.40.0
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0004.=
patch b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0004.patch
new file mode 100644
index 0000000000..dd78e029dc
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0004.patch
@@ -0,0 +1,34 @@
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
+CVE: CVE-2024-28085
+
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/comm=
it/404b0781f52f7c045ca811b2dceec526408ac253]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ term-utils/wall.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/term-utils/wall.c b/term-utils/wall.c
+index 377db45..1e7e9ab 100644
+--- a/term-utils/wall.c
++++ b/term-utils/wall.c
+@@ -328,7 +328,7 @@ static char *makemsg(char *fname, char **mvec, int m=
vecsz,
+		int i;
+
+		for (i =3D 0; i < mvecsz; i++) {
+-			fputs(mvec[i], fs);
++			fputs_careful(mvec[i], fs, '^', true, TERM_WIDTH);
+			if (i < mvecsz - 1)
+				fputc(' ', fs);
+		}
+--
+2.40.0
--=20
2.40.0


