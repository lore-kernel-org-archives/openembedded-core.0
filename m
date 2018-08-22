Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 743A779327
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:18:49 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id 8-v6so2536731oip.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=74nhZ8xLYk8DtJgZwS+lMGHpGQaZxTJ3UUywxpIEF3s=;
	b=WzsoPndiW8LvnXRSJ+xuoFmQUBHYNbsq7mcOO0aH9D0CCky6VMI4XZcoLs3056toxE
	JHWCinBixQt76jfxAVRWx0lD5QuNgIIPiAg4m60wGnckS6BfLQKYG5s5RT42Tw+MaV4M
	+bu0vQ5D19toiDMX609ut+Fx4AafNkwXs5px1MCBnWyF3YbopzPbva1en9Y1lHzHMQJ5
	ptPsp0/CJ+TJ41uxa1eVj0YzhGFdhg/+CVvTimWNrOmRezmun9gz6jg0vugGMeCOuUU8
	8xnvsaTquz4cJ8fKSZIdRbLWIDrKGmJ+xvELwi6tvs9H4CfDnuN8HiWHWlrCuF/vL8Kq
	MkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=74nhZ8xLYk8DtJgZwS+lMGHpGQaZxTJ3UUywxpIEF3s=;
	b=kCD1vT7HCHr+58vtBNNRd5lqO+4Gzt/YIpOt//gk028m7SYcaCwIZFrXdipN9gCaVB
	VU9htuMZ0cNNq5Ue5RKcBNbKI2wgv9zYRqJ/m1wt+Lk5jbpVvWHeanFEC2laBEBzEIRs
	tJI1C/TqxPiBE3apD7t2yeFmAHiJFjN5RznwIl7AZFikBXNCw/x2eTaecwb6NvcoYnOm
	JRgsnPuKF4ciCjG1Kc5qDJAhCa9dE+CyKCc8Gn5IvKAUJ64ySYduiE/mXqHdgYUWdmby
	oUUhyGE9XbJBbkW0M9nXo9Kgr5x76QBj1L0oz4BjRNynOX59HZq3C2P0Pss6HTfei6GG
	IMWg==
X-Gm-Message-State: APzg51BL+v6GWxL0U3ki8J3R4kgKoqoh8akEH0Bi9dlrZhv6LARFv4b3
	VIIGdXTRvq1XDx8Xemplgbo0Y8Nqbu0=
X-Google-Smtp-Source: ANB0VdaZQRow+Q64uO4w0QgBW+jfo+wg/E34iTwlckgOmrlzFhrrUJKM78ovH+Vv1FPOYUmNPBGIdw==
X-Received: by 2002:aca:4107:: with SMTP id o7-v6mr3608208oia.76.1534936730244;
	Wed, 22 Aug 2018 04:18:50 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	c9-v6sm862308oia.1.2018.08.22.04.18.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:18:49 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:47:51 +0530
Message-Id: <1534936692-11736-13-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH 13/34] procps: CVE-2018-1124
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Aug 2018 11:18:49 -0000

proc/readproc.c: Fix bugs and overflows in file2strvec().

Note: this is by far the most important and complex patch of the whole
series, please review it carefully; thank you very much!

For this patch, we decided to keep the original function's design and
skeleton, to avoid regressions and behavior changes, while fixing the
various bugs and overflows. And like the "Harden file2str()" patch, this
patch does not fail when about to overflow, but truncates instead: there
is information available about this process, so return it to the caller;
also, we used INT_MAX as a limit, but a lower limit could be used.

The easy changes:

- Replace sprintf() with snprintf() (and check for truncation).

- Replace "if (n == 0 && rbuf == 0)" with "if (n <= 0 && tot <= 0)" and
  do break instead of return: it simplifies the code (only one place to
  handle errors), and also guarantees that in the while loop either n or
  tot is > 0 (or both), even if n is reset to 0 when about to overflow.

- Remove the "if (n < 0)" block in the while loop: it is (and was) dead
  code, since we enter the while loop only if n >= 0.

- Rewrite the missing-null-terminator detection: in the original
  function, if the size of the file is a multiple of 2047, a null-
  terminator is appended even if the file is already null-terminated.

- Replace "if (n <= 0 && !end_of_file)" with "if (n < 0 || tot <= 0)":
  originally, it was equivalent to "if (n < 0)", but we added "tot <= 0"
  to handle the first break of the while loop, and to guarantee that in
  the rest of the function tot is > 0.

- Double-force ("belt and suspenders") the null-termination of rbuf:
  this is (and was) essential to the correctness of the function.

- Replace the final "while" loop with a "for" loop that behaves just
  like the preceding "for" loop: in the original function, this would
  lead to unexpected results (for example, if rbuf is |\0|A|\0|, this
  would return the array {"",NULL} but should return {"","A",NULL}; and
  if rbuf is |A|\0|B| (should never happen because rbuf should be null-
  terminated), this would make room for two pointers in ret, but would
  write three pointers to ret).

The hard changes:

- Prevent the integer overflow of tot in the while loop, but unlike
  file2str(), file2strvec() cannot let tot grow until it almost reaches
  INT_MAX, because it needs more space for the pointers: this is why we
  introduced ARG_LEN, which also guarantees that we can add "align" and
  a few sizeof(char*)s to tot without overflowing.

- Prevent the integer overflow of "tot + c + align": when INT_MAX is
  (almost) reached, we write the maximal safe amount of pointers to ret
  (ARG_LEN guarantees that there is always space for *ret = rbuf and the
  NULL terminator).

Affects procps-ng < 3.3.15

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../procps/procps/CVE-2018-1124.patch              | 176 +++++++++++++++++++++
 meta/recipes-extended/procps/procps_3.3.12.bb      |   1 +
 2 files changed, 177 insertions(+)
 create mode 100644 meta/recipes-extended/procps/procps/CVE-2018-1124.patch

diff --git a/meta/recipes-extended/procps/procps/CVE-2018-1124.patch b/meta/recipes-extended/procps/procps/CVE-2018-1124.patch
new file mode 100644
index 0000000..bc78faf
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/CVE-2018-1124.patch
@@ -0,0 +1,176 @@
+From bdd058a0e676d2f013027fcfb2b344c313112a50 Mon Sep 17 00:00:00 2001
+From: Qualys Security Advisory <qsa@qualys.com>
+Date: Thu, 1 Jan 1970 00:00:00 +0000
+Subject: [PATCH 074/126] proc/readproc.c: Fix bugs and overflows in
+ file2strvec().
+
+Note: this is by far the most important and complex patch of the whole
+series, please review it carefully; thank you very much!
+
+For this patch, we decided to keep the original function's design and
+skeleton, to avoid regressions and behavior changes, while fixing the
+various bugs and overflows. And like the "Harden file2str()" patch, this
+patch does not fail when about to overflow, but truncates instead: there
+is information available about this process, so return it to the caller;
+also, we used INT_MAX as a limit, but a lower limit could be used.
+
+The easy changes:
+
+- Replace sprintf() with snprintf() (and check for truncation).
+
+- Replace "if (n == 0 && rbuf == 0)" with "if (n <= 0 && tot <= 0)" and
+  do break instead of return: it simplifies the code (only one place to
+  handle errors), and also guarantees that in the while loop either n or
+  tot is > 0 (or both), even if n is reset to 0 when about to overflow.
+
+- Remove the "if (n < 0)" block in the while loop: it is (and was) dead
+  code, since we enter the while loop only if n >= 0.
+
+- Rewrite the missing-null-terminator detection: in the original
+  function, if the size of the file is a multiple of 2047, a null-
+  terminator is appended even if the file is already null-terminated.
+
+- Replace "if (n <= 0 && !end_of_file)" with "if (n < 0 || tot <= 0)":
+  originally, it was equivalent to "if (n < 0)", but we added "tot <= 0"
+  to handle the first break of the while loop, and to guarantee that in
+  the rest of the function tot is > 0.
+
+- Double-force ("belt and suspenders") the null-termination of rbuf:
+  this is (and was) essential to the correctness of the function.
+
+- Replace the final "while" loop with a "for" loop that behaves just
+  like the preceding "for" loop: in the original function, this would
+  lead to unexpected results (for example, if rbuf is |\0|A|\0|, this
+  would return the array {"",NULL} but should return {"","A",NULL}; and
+  if rbuf is |A|\0|B| (should never happen because rbuf should be null-
+  terminated), this would make room for two pointers in ret, but would
+  write three pointers to ret).
+
+The hard changes:
+
+- Prevent the integer overflow of tot in the while loop, but unlike
+  file2str(), file2strvec() cannot let tot grow until it almost reaches
+  INT_MAX, because it needs more space for the pointers: this is why we
+  introduced ARG_LEN, which also guarantees that we can add "align" and
+  a few sizeof(char*)s to tot without overflowing.
+
+- Prevent the integer overflow of "tot + c + align": when INT_MAX is
+  (almost) reached, we write the maximal safe amount of pointers to ret
+  (ARG_LEN guarantees that there is always space for *ret = rbuf and the
+  NULL terminator).
+[carnil: backport for 3.3.9: Add include for limits.h and use of MAX_INT]
+
+CVE: CVE-2018-1124
+Upstream-Status: Backport [https://gitlab.com/procps-ng/procps/commit/36c350f07c75aabf747fb833f52a234ae5781b20]
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ proc/readproc.c | 53 ++++++++++++++++++++++++++++++++---------------------
+ 1 file changed, 32 insertions(+), 21 deletions(-)
+
+diff -Naurp procps-ng-3.3.12_org/proc/readproc.c procps-ng-3.3.12/proc/readproc.c
+--- procps-ng-3.3.12_org/proc/readproc.c	2016-07-09 14:49:25.825306872 -0700
++++ procps-ng-3.3.12/proc/readproc.c	2018-07-24 00:46:49.366202531 -0700
+@@ -37,6 +37,7 @@
+ #include <dirent.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
++#include <limits.h>
+ #ifdef WITH_SYSTEMD
+ #include <systemd/sd-login.h>
+ #endif
+--- a/proc/readproc.c
++++ b/proc/readproc.c
+@@ -600,11 +601,12 @@ static int file2str(const char *director
+ 
+ static char** file2strvec(const char* directory, const char* what) {
+     char buf[2048];	/* read buf bytes at a time */
+-    char *p, *rbuf = 0, *endbuf, **q, **ret;
++    char *p, *rbuf = 0, *endbuf, **q, **ret, *strp;
+     int fd, tot = 0, n, c, end_of_file = 0;
+     int align;
+ 
+-    sprintf(buf, "%s/%s", directory, what);
++    const int len = snprintf(buf, sizeof buf, "%s/%s", directory, what);
++    if(len <= 0 || (size_t)len >= sizeof buf) return NULL;
+     fd = open(buf, O_RDONLY, 0);
+     if(fd==-1) return NULL;
+ 
+@@ -612,18 +614,23 @@ static char** file2strvec(const char* di
+     while ((n = read(fd, buf, sizeof buf - 1)) >= 0) {
+ 	if (n < (int)(sizeof buf - 1))
+ 	    end_of_file = 1;
+-	if (n == 0 && rbuf == 0) {
+-	    close(fd);
+-	    return NULL;	/* process died between our open and read */
++	if (n <= 0 && tot <= 0) { /* nothing read now, nothing read before */
++	    break;		/* process died between our open and read */
+ 	}
+-	if (n < 0) {
+-	    if (rbuf)
+-		free(rbuf);
+-	    close(fd);
+-	    return NULL;	/* read error */
++	/* ARG_LEN is our guesstimated median length of a command-line argument
++	   or environment variable (the minimum is 1, the maximum is 131072) */
++	#define ARG_LEN 64
++	if (tot >= INT_MAX / (ARG_LEN + (int)sizeof(char*)) * ARG_LEN - n) {
++	    end_of_file = 1; /* integer overflow: null-terminate and break */
++	    n = 0; /* but tot > 0 */
+ 	}
+-	if (end_of_file && (n == 0 || buf[n-1]))/* last read char not null */
++	#undef ARG_LEN
++	if (end_of_file &&
++	    ((n > 0 && buf[n-1] != '\0') ||	/* last read char not null */
++	     (n <= 0 && rbuf[tot-1] != '\0')))	/* last read char not null */
+ 	    buf[n++] = '\0';			/* so append null-terminator */
++
++	if (n <= 0) break; /* unneeded (end_of_file = 1) but avoid realloc */
+ 	rbuf = xrealloc(rbuf, tot + n);		/* allocate more memory */
+ 	memcpy(rbuf + tot, buf, n);		/* copy buffer into it */
+ 	tot += n;				/* increment total byte ctr */
+@@ -631,29 +638,34 @@ static char** file2strvec(const char* di
+ 	    break;
+     }
+     close(fd);
+-    if (n <= 0 && !end_of_file) {
++    if (n < 0 || tot <= 0) {	/* error, or nothing read */
+ 	if (rbuf) free(rbuf);
+ 	return NULL;		/* read error */
+     }
++    rbuf[tot-1] = '\0'; /* belt and suspenders (the while loop did it, too) */
+     endbuf = rbuf + tot;			/* count space for pointers */
+     align = (sizeof(char*)-1) - ((tot + sizeof(char*)-1) & (sizeof(char*)-1));
+-    for (c = 0, p = rbuf; p < endbuf; p++) {
+-	if (!*p || *p == '\n')
++    c = sizeof(char*);				/* one extra for NULL term */
++    for (p = rbuf; p < endbuf; p++) {
++	if (!*p || *p == '\n') {
++	    if (c >= INT_MAX - (tot + (int)sizeof(char*) + align)) break;
+ 	    c += sizeof(char*);
++	}
+ 	if (*p == '\n')
+ 	    *p = 0;
+     }
+-    c += sizeof(char*);				/* one extra for NULL term */
+ 
+     rbuf = xrealloc(rbuf, tot + c + align);	/* make room for ptrs AT END */
+     endbuf = rbuf + tot;			/* addr just past data buf */
+     q = ret = (char**) (endbuf+align);		/* ==> free(*ret) to dealloc */
+-    *q++ = p = rbuf;				/* point ptrs to the strings */
+-    endbuf--;					/* do not traverse final NUL */
+-    while (++p < endbuf)
+-    	if (!*p)				/* NUL char implies that */
+-	    *q++ = p+1;				/* next string -> next char */
+-
++    for (strp = p = rbuf; p < endbuf; p++) {
++	if (!*p) {				/* NUL char implies that */
++	    if (c < 2 * (int)sizeof(char*)) break;
++	    c -= sizeof(char*);
++	    *q++ = strp;			/* point ptrs to the strings */
++	    strp = p+1;				/* next string -> next char */
++	}
++    }
+     *q = 0;					/* null ptr list terminator */
+     return ret;
+ }
diff --git a/meta/recipes-extended/procps/procps_3.3.12.bb b/meta/recipes-extended/procps/procps_3.3.12.bb
index adabd75..a0c1bf4 100644
--- a/meta/recipes-extended/procps/procps_3.3.12.bb
+++ b/meta/recipes-extended/procps/procps_3.3.12.bb
@@ -14,6 +14,7 @@ inherit autotools gettext pkgconfig update-alternatives
 
 SRC_URI = "http://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-${PV}.tar.xz \
            file://sysctl.conf \
+           file://CVE-2018-1124.patch \
           "
 
 SRC_URI[md5sum] = "957e42e8b193490b2111252e4a2b443c"
-- 
2.7.4


