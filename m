Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id AE57E7E27B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 12:37:57 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id g135so2649850wme.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 05:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=0Zsz43TFqg2ud+M7Dia6PRY1SXHqk3NqD/oaNc6OQ98=;
	b=bLMSjmgrKhqe9yNIJu83ANkdon2oGLPmzXLuajA243tASukuxDxaES/5DnzfUMV9t+
	xf4WZ3mf7UNyA50rROhwTz8J1jkypvGH+RJS891HTbiIDoN5fCWCcRwIprK9v8rdw5le
	1sRV7+D6AhMiJfwz4Umk5Pn6IQggDchub4+rQencvDq04x+dzLW4yxDGGPgmqR+bH2ew
	lyJ7aSAQcxjL81KH+X7sNNwbbyeGirIO0PevyC3oCqVBipd/xehakIttx3CumQa0plv2
	f8AoLHchDLMWA4X5K4exUHzKVxo8LP+sgjSNCJg3QmFrNTNmLLiPjIyxQWX7lQy1GcTb
	0e0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=0Zsz43TFqg2ud+M7Dia6PRY1SXHqk3NqD/oaNc6OQ98=;
	b=aTnVTBTDNis49pG7EO0KWvAVi47HuyxPbbHGWsjw20edWB5aFWPbMIpN1G/moxZKQm
	xC4cDaE7TIfUl853n9Pi7ZpFuL5V1zHqEQb+48p3n0FreNhczGoFZQLgan0JrLeMfDfA
	7oqXnux9xOY35RiUN9xRYHpKhmvy5j66GxHK1Oc81IbIWCKYr96AiynV8EJcAIS0r384
	aWXS3byAAOyhqjrj/XjDEuweoxOGnzFZfpigs+gflHwgX/cCsMKBpU1Qyk0hT3ttpZXY
	zkVTaPdPYpSAZX+3suEGMKv7jM/4lI3IabYV4vcaSoGrI5GsPBQPYr34VghOlcRxUiaP
	eWdg==
X-Gm-Message-State: APjAAAXCcctryFZ6ZxWIJvPWG7zl7mHSypiuMtPQ54ln9dc1RRjV7Jsi
	AWD515ww7IuVQDP6fIyiejRARFCIDKA=
X-Google-Smtp-Source: APXvYqyYg8cEkRl5LV+gfpJw4ewA7pnD26LytpCw6qpYU5oFutBOfGmKykPapNmvuxkOdO7sxKCr7w==
X-Received: by 2002:a1c:cb43:: with SMTP id b64mr19207464wmg.135.1561466277981;
	Tue, 25 Jun 2019 05:37:57 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	j189sm2975116wmb.48.2019.06.25.05.37.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Jun 2019 05:37:57 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jun 2019 13:37:53 +0100
Message-Id: <20190625123753.18465-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190625123753.18465-1-ross.burton@intel.com>
References: <20190625123753.18465-1-ross.burton@intel.com>
Subject: [PATCH][thud 2/2] glibc: backport CVE fixes
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
X-List-Received-Date: Tue, 25 Jun 2019 12:37:58 -0000

Backport the fixes for several CVEs from the 2.28 stable branch:
- CVE-2016-10739
- CVE-2018-19591
- CVE-2019-9169

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glibc/glibc/CVE-2016-10739.patch | 232 +++++++++++++++++++++
 meta/recipes-core/glibc/glibc/CVE-2018-19591.patch |  48 +++++
 meta/recipes-core/glibc/glibc/CVE-2019-9169.patch  |  40 ++++
 meta/recipes-core/glibc/glibc_2.28.bb              |   4 +-
 4 files changed, 323 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2016-10739.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2018-19591.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2019-9169.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2016-10739.patch b/meta/recipes-core/glibc/glibc/CVE-2016-10739.patch
new file mode 100644
index 00000000000..7eb55d6663d
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2016-10739.patch
@@ -0,0 +1,232 @@
+CVE: CVE-2016-10739
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 8e92ca5dd7a7e38a4dddf1ebc4e1e8f0cb27e4aa Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Mon, 21 Jan 2019 08:59:42 +0100
+Subject: [PATCH] resolv: Reformat inet_addr, inet_aton to GNU style
+
+(cherry picked from commit 5e30b8ef0758763effa115634e0ed7d8938e4bc0)
+---
+ ChangeLog          |   5 ++
+ resolv/inet_addr.c | 192 ++++++++++++++++++++++++++++-------------------------
+ 2 files changed, 106 insertions(+), 91 deletions(-)
+
+diff --git a/resolv/inet_addr.c b/resolv/inet_addr.c
+index 022f7ea084..32f58b0e13 100644
+--- a/resolv/inet_addr.c
++++ b/resolv/inet_addr.c
+@@ -1,3 +1,21 @@
++/* Legacy IPv4 text-to-address functions.
++   Copyright (C) 2019 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
+ /*
+  * Copyright (c) 1983, 1990, 1993
+  *    The Regents of the University of California.  All rights reserved.
+@@ -78,105 +96,97 @@
+ #include <limits.h>
+ #include <errno.h>
+ 
+-/*
+- * Ascii internet address interpretation routine.
+- * The value returned is in network order.
+- */
++/* ASCII IPv4 Internet address interpretation routine.  The value
++   returned is in network order.  */
+ in_addr_t
+-__inet_addr(const char *cp) {
+-	struct in_addr val;
++__inet_addr (const char *cp)
++{
++  struct in_addr val;
+ 
+-	if (__inet_aton(cp, &val))
+-		return (val.s_addr);
+-	return (INADDR_NONE);
++  if (__inet_aton (cp, &val))
++    return val.s_addr;
++  return INADDR_NONE;
+ }
+ weak_alias (__inet_addr, inet_addr)
+ 
+-/*
+- * Check whether "cp" is a valid ascii representation
+- * of an Internet address and convert to a binary address.
+- * Returns 1 if the address is valid, 0 if not.
+- * This replaces inet_addr, the return value from which
+- * cannot distinguish between failure and a local broadcast address.
+- */
++/* Check whether "cp" is a valid ASCII representation of an IPv4
++   Internet address and convert it to a binary address.  Returns 1 if
++   the address is valid, 0 if not.  This replaces inet_addr, the
++   return value from which cannot distinguish between failure and a
++   local broadcast address.  */
+ int
+-__inet_aton(const char *cp, struct in_addr *addr)
++__inet_aton (const char *cp, struct in_addr *addr)
+ {
+-	static const in_addr_t max[4] = { 0xffffffff, 0xffffff, 0xffff, 0xff };
+-	in_addr_t val;
+-	char c;
+-	union iaddr {
+-	  uint8_t bytes[4];
+-	  uint32_t word;
+-	} res;
+-	uint8_t *pp = res.bytes;
+-	int digit;
+-
+-	int saved_errno = errno;
+-	__set_errno (0);
+-
+-	res.word = 0;
+-
+-	c = *cp;
+-	for (;;) {
+-		/*
+-		 * Collect number up to ``.''.
+-		 * Values are specified as for C:
+-		 * 0x=hex, 0=octal, isdigit=decimal.
+-		 */
+-		if (!isdigit(c))
+-			goto ret_0;
+-		{
+-			char *endp;
+-			unsigned long ul = strtoul (cp, (char **) &endp, 0);
+-			if (ul == ULONG_MAX && errno == ERANGE)
+-				goto ret_0;
+-			if (ul > 0xfffffffful)
+-				goto ret_0;
+-			val = ul;
+-			digit = cp != endp;
+-			cp = endp;
+-		}
+-		c = *cp;
+-		if (c == '.') {
+-			/*
+-			 * Internet format:
+-			 *	a.b.c.d
+-			 *	a.b.c	(with c treated as 16 bits)
+-			 *	a.b	(with b treated as 24 bits)
+-			 */
+-			if (pp > res.bytes + 2 || val > 0xff)
+-				goto ret_0;
+-			*pp++ = val;
+-			c = *++cp;
+-		} else
+-			break;
+-	}
+-	/*
+-	 * Check for trailing characters.
+-	 */
+-	if (c != '\0' && (!isascii(c) || !isspace(c)))
+-		goto ret_0;
+-	/*
+-	 * Did we get a valid digit?
+-	 */
+-	if (!digit)
+-		goto ret_0;
+-
+-	/* Check whether the last part is in its limits depending on
+-	   the number of parts in total.  */
+-	if (val > max[pp - res.bytes])
++  static const in_addr_t max[4] = { 0xffffffff, 0xffffff, 0xffff, 0xff };
++  in_addr_t val;
++  char c;
++  union iaddr
++  {
++    uint8_t bytes[4];
++    uint32_t word;
++  } res;
++  uint8_t *pp = res.bytes;
++  int digit;
++
++  int saved_errno = errno;
++  __set_errno (0);
++
++  res.word = 0;
++
++  c = *cp;
++  for (;;)
++    {
++      /* Collect number up to ``.''.  Values are specified as for C:
++	 0x=hex, 0=octal, isdigit=decimal.  */
++      if (!isdigit (c))
++	goto ret_0;
++      {
++	char *endp;
++	unsigned long ul = strtoul (cp, &endp, 0);
++	if (ul == ULONG_MAX && errno == ERANGE)
+ 	  goto ret_0;
+-
+-	if (addr != NULL)
+-		addr->s_addr = res.word | htonl (val);
+-
+-	__set_errno (saved_errno);
+-	return (1);
+-
+-ret_0:
+-	__set_errno (saved_errno);
+-	return (0);
++	if (ul > 0xfffffffful)
++	  goto ret_0;
++	val = ul;
++	digit = cp != endp;
++	cp = endp;
++      }
++      c = *cp;
++      if (c == '.')
++	{
++	  /* Internet format:
++	     a.b.c.d
++	     a.b.c	(with c treated as 16 bits)
++	     a.b	(with b treated as 24 bits).  */
++	  if (pp > res.bytes + 2 || val > 0xff)
++	    goto ret_0;
++	  *pp++ = val;
++	  c = *++cp;
++	}
++      else
++	break;
++    }
++  /* Check for trailing characters.  */
++  if (c != '\0' && (!isascii (c) || !isspace (c)))
++    goto ret_0;
++  /*  Did we get a valid digit?  */
++  if (!digit)
++    goto ret_0;
++
++  /* Check whether the last part is in its limits depending on the
++     number of parts in total.  */
++  if (val > max[pp - res.bytes])
++    goto ret_0;
++
++  if (addr != NULL)
++    addr->s_addr = res.word | htonl (val);
++
++  __set_errno (saved_errno);
++  return 1;
++
++ ret_0:
++  __set_errno (saved_errno);
++  return 0;
+ }
+ weak_alias (__inet_aton, inet_aton)
+ libc_hidden_def (__inet_aton)
+-- 
+2.11.0
diff --git a/meta/recipes-core/glibc/glibc/CVE-2018-19591.patch b/meta/recipes-core/glibc/glibc/CVE-2018-19591.patch
new file mode 100644
index 00000000000..9c78a3dfa02
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2018-19591.patch
@@ -0,0 +1,48 @@
+CVE: CVE-2018-19591
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From ce6ba630dbc96f49eb1f30366aa62261df4792f9 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Tue, 27 Nov 2018 16:12:43 +0100
+Subject: [PATCH] CVE-2018-19591: if_nametoindex: Fix descriptor for overlong
+ name [BZ #23927]
+
+(cherry picked from commit d527c860f5a3f0ed687bd03f0cb464612dc23408)
+---
+ ChangeLog                          |  7 +++++++
+ NEWS                               |  6 ++++++
+ sysdeps/unix/sysv/linux/if_index.c | 11 ++++++-----
+ 3 files changed, 19 insertions(+), 5 deletions(-)
+
+diff --git a/sysdeps/unix/sysv/linux/if_index.c b/sysdeps/unix/sysv/linux/if_index.c
+index e3d08982d9..782fc5e175 100644
+--- a/sysdeps/unix/sysv/linux/if_index.c
++++ b/sysdeps/unix/sysv/linux/if_index.c
+@@ -38,11 +38,6 @@ __if_nametoindex (const char *ifname)
+   return 0;
+ #else
+   struct ifreq ifr;
+-  int fd = __opensock ();
+-
+-  if (fd < 0)
+-    return 0;
+-
+   if (strlen (ifname) >= IFNAMSIZ)
+     {
+       __set_errno (ENODEV);
+@@ -50,6 +45,12 @@ __if_nametoindex (const char *ifname)
+     }
+ 
+   strncpy (ifr.ifr_name, ifname, sizeof (ifr.ifr_name));
++
++  int fd = __opensock ();
++
++  if (fd < 0)
++    return 0;
++
+   if (__ioctl (fd, SIOCGIFINDEX, &ifr) < 0)
+     {
+       int saved_errno = errno;
+-- 
+2.11.0
diff --git a/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch b/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch
new file mode 100644
index 00000000000..8f28b56fa05
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch
@@ -0,0 +1,40 @@
+CVE: CVE-2019-9196
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 2aee101ff6075dd97a99982a1ba29e21ec25c52f Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Mon, 21 Jan 2019 11:08:13 -0800
+Subject: [PATCH] regex: fix read overrun [BZ #24114]
+
+Problem found by AddressSanitizer, reported by Hongxu Chen in:
+https://debbugs.gnu.org/34140
+* posix/regexec.c (proceed_next_node):
+Do not read past end of input buffer.
+
+(cherry picked from commit 583dd860d5b833037175247230a328f0050dbfe9)
+---
+ ChangeLog       | 8 ++++++++
+ posix/regexec.c | 6 ++++--
+ 2 files changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/posix/regexec.c b/posix/regexec.c
+index 73644c2341..06b8487c3e 100644
+--- a/posix/regexec.c
++++ b/posix/regexec.c
+@@ -1289,8 +1289,10 @@ proceed_next_node (const re_match_context_t *mctx, Idx nregs, regmatch_t *regs,
+ 	      else if (naccepted)
+ 		{
+ 		  char *buf = (char *) re_string_get_buffer (&mctx->input);
+-		  if (memcmp (buf + regs[subexp_idx].rm_so, buf + *pidx,
+-			      naccepted) != 0)
++		  if (mctx->input.valid_len - *pidx < naccepted
++		      || (memcmp (buf + regs[subexp_idx].rm_so, buf + *pidx,
++				  naccepted)
++			  != 0))
+ 		    return -1;
+ 		}
+ 	    }
+-- 
+2.11.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.28.bb b/meta/recipes-core/glibc/glibc_2.28.bb
index 72cee04d9a7..ffc4be814b9 100644
--- a/meta/recipes-core/glibc/glibc_2.28.bb
+++ b/meta/recipes-core/glibc/glibc_2.28.bb
@@ -47,7 +47,9 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0032-sysdeps-ieee754-soft-fp-ignore-maybe-uninitialized-w.patch \
            file://0033-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
            file://0034-inject-file-assembly-directives.patch \
-"
+           file://CVE-2016-10739.patch \
+           file://CVE-2018-19591.patch \
+           file://CVE-2019-9169.patch"
 
 NATIVESDKFIXES ?= ""
 NATIVESDKFIXES_class-nativesdk = "\
-- 
2.11.0


