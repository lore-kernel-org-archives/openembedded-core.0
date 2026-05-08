Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75104CD37AC
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 06:26:56 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7703.1778221607833048063
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 23:26:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2yAfDErT;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso11852925e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 23:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778221606; x=1778826406; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzGdwZmkASr175rA3WPJiOvnPfz16Tbby1iJ1/SBFX8=;
        b=2yAfDErTW38z0atOQf3OTpadB0Q+LvwPUsQ1853C4l0CETVqa1/aOUK8UbvHqOuct5
         wYDUSBEfoT4UukzdM4Rt/GbdpRDKMrnQiNjjFG8BoYm6ZljPtsKShb7FbzV0LUqFC1Lv
         WO8fhyhp3NavGa+YRJcnDw9Z+fLu2nOYuoIns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778221606; x=1778826406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LzGdwZmkASr175rA3WPJiOvnPfz16Tbby1iJ1/SBFX8=;
        b=IUeceEbSKHM85nmrnE95NzgSFBD/ABnGzSyqMlib4tNJz2H3EIgIzy2mNNwNLHEHmC
         vdxE1ynBcoRmmX+TXG84jyWRh0qZaMtcdA5p1ekCsGt0bLTpIKTRbI1wd9/ilEpHOlDi
         +FSTN5ihNSKSPKIgrdWcFEOJFkc/VzOk8cRciI/psrdbytnXhfGLyPPWgniy9SVOZUgF
         lrhdjKe33XfzlI32HGsaGWcT39i0FMJmjXXwvArC/B38yK8SD67iLwR8YLBvDrXXyDQN
         Z0RpAtH8bvUY8kWtc/0do+5aKVSyi7oScL8AfFGjK+hPzkmOif4rwXqV7TfNuFii4ADi
         n+Rw==
X-Gm-Message-State: AOJu0Yy2c2F6JrpsIxoNSvG4s3i5mxeQQ8J9tPXw3jxtG2lXM5XVUa6S
	phLHx8xPag1gWFHS0Yi9Nj4zG7cwko+lomrWYxMoCSgwFjBxRiaKz5K+4OlXjzrg8qUAfYhtjJg
	0TVfs15g=
X-Gm-Gg: AeBDieshW6SRkOkLx2dx0ExJJMLsi4xfrGLeV+HnGNx+kYAuI0QiutE39n+t0Fmh2EB
	CJnqK9juDfizI6M9cs4MMo2LBzCr7SSopKt2fdD8D1X7qhTLnTTUiEN64J8x81c9jnwwpOm6mUM
	Pa/htDp9cdSYDtS80o6ar+6y74/zA8dWK3J9IQTxJdpWaHQUvvZdF6pOxWpG5HISlJoT1bFem9E
	pg7h3i5LGrLu8n7oYkvslPhPSZ+qA5KopKH5+QwNL7hPl8juQ1UNFRg96nwIsjaXUgD7eJJVvJi
	ykGwBEqGEHn2Li3K3j+l5Pni+1Htm/L91cA3e6HQTZi1O4KiN6YcgO+zjWxzl3xuEFiv6xKQyRn
	ekRnts6MDClCd5PY5QYS+DxWZCyPajyT9SUK83l9QJiMEGbo2vGVrqv1xjNjN/G7UAZOlH6Fhu8
	EA+dKOMykFLQTLYu9ratm68+HgY24TepdjuPpGOimJtNhw/nYyKjIiIizgV/JOga13Q1E3ucqPs
	PuhlXGVaB5Km4ZCYfoHR5w86lw=
X-Received: by 2002:a05:600c:8594:b0:485:39b2:a47c with SMTP id 5b1f17b1804b1-48e676b65a9mr13985855e9.25.1778221605861;
        Thu, 07 May 2026 23:26:45 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e68ec5c49sm15202695e9.11.2026.05.07.23.26.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 23:26:45 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 6/8] inetutils: fix for CVE-2026-32772
Date: Fri,  8 May 2026 08:25:58 +0200
Message-ID: <02b29ddc66956c83af2702bbf0fcd4985c00fa68.1778198884.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198884.git.yoann.congal@smile.fr>
References: <cover.1778198884.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 06:26:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236638

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick patch from [1] also mentioned at NVD report in [2]

[1] https://www.openwall.com/lists/oss-security/2026/03/13/1
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-32772
[3] https://cgit.git.savannah.gnu.org/cgit/inetutils.git/patch/?id=d6b8b83aa51616946fd314bc48087312d13c99f8
[4] https://security-tracker.debian.org/tracker/CVE-2026-32772

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
[YC: NEWS diff in [3] links to [1]]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../inetutils/inetutils/CVE-2026-32772.patch  | 172 ++++++++++++++++++
 .../inetutils/inetutils_2.5.bb                |   1 +
 2 files changed, 173 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32772.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32772.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32772.patch
new file mode 100644
index 00000000000..cc44f9531a4
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32772.patch
@@ -0,0 +1,172 @@
+From d6b8b83aa51616946fd314bc48087312d13c99f8 Mon Sep 17 00:00:00 2001
+From: Collin Funk <collin.funk1@gmail.com>
+Date: Thu, 26 Mar 2026 22:52:54 -0700
+Subject: telnet: don't leak the value of unexported environment variables
+
+Patch based on the following OpenBSD commit:
+<https://github.com/openbsd/src/commit/1a11dc7253488a97d6df686dae9230f78682e8df>
+
+* telnet/commands.c (env_getvalue): Add a boolean argument to prevent
+prevent unexported variables from being returned.
+* telnet/externs.h (env_getvalue): Adjust the function declaration.
+* telnet/authenc.c (telnet_getenv): Add the new argument.
+* telnet/telnet.c (dooption, gettermname, suboption, env_opt_add)
+(telnet): Likewise.
+
+A telnet server can read a client's environment variables with the
+NEW-ENVIRON option and the SEND ENV_USERVAR command.
+
+This had previously been reported as CVE-2005-0488, but inetutils never
+got a fix for it.
+
+Reported-by: Justin Swartz <justin.swartz@risingedge.co.za>
+Based-on-patch: https://gitlab.com/redhat/centos-stream/rpms/telnet/-/blob/c9s/telnet-0.17-env.patch
+Link: https://www.openwall.com/lists/oss-security/2026/03/13/1
+
+CVE: CVE-2026-32772
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/inetutils.git/patch/?id=d6b8b83aa51616946fd314bc48087312d13c99f8]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libtelnet/misc-proto.h |  4 +++-
+ telnet/authenc.c       |  4 ++--
+ telnet/commands.c      |  5 +++--
+ telnet/externs.h       |  4 +++-
+ telnet/telnet.c        | 10 +++++-----
+ 5 files changed, 16 insertions(+), 11 deletions(-)
+
+diff --git a/libtelnet/misc-proto.h b/libtelnet/misc-proto.h
+index abf8316..a836a69 100644
+--- a/libtelnet/misc-proto.h
++++ b/libtelnet/misc-proto.h
+@@ -68,6 +68,8 @@
+ #ifndef __MISC_PROTO__
+ # define __MISC_PROTO__
+ 
++#include <stdbool.h>
++
+ void auth_encrypt_init (char *, char *, char *, char *, int);
+ void auth_encrypt_user (char *);
+ void auth_encrypt_connect (int);
+@@ -79,6 +81,6 @@ void printd (unsigned char *, int);
+ int net_write (unsigned char *, int);
+ void net_encrypt (void);
+ int telnet_spin (void);
+-char *telnet_getenv (char *);
++char *telnet_getenv (char *, bool);
+ char *telnet_gets (char *, char *, int, int);
+ #endif
+diff --git a/telnet/authenc.c b/telnet/authenc.c
+index b019251..dcd19e8 100644
+--- a/telnet/authenc.c
++++ b/telnet/authenc.c
+@@ -91,9 +91,9 @@ telnet_spin ()
+ }
+ 
+ char *
+-telnet_getenv (char *val)
++telnet_getenv (char *val, bool exported_only)
+ {
+-  return ((char *) env_getvalue (val));
++  return ((char *) env_getvalue (val, exported_only));
+ }
+ 
+ char *
+diff --git a/telnet/commands.c b/telnet/commands.c
+index 2a133c9..d8d0864 100644
+--- a/telnet/commands.c
++++ b/telnet/commands.c
+@@ -66,6 +66,7 @@
+ #include <stdarg.h>
+ #include <errno.h>
+ 
++#include <stdbool.h>
+ #include <stdlib.h>
+ #include <limits.h>		/* LLONG_MAX for Solaris. */
+ 
+@@ -2059,10 +2060,10 @@ env_default (int init, int welldefined)
+ }
+ 
+ unsigned char *
+-env_getvalue (const char *var)
++env_getvalue (const char *var, bool exported_only)
+ {
+   register struct env_lst *ep = env_find (var);
+-  if (ep)
++  if (ep && (!exported_only || ep->export))
+     return (ep->value);
+   return (NULL);
+ }
+diff --git a/telnet/externs.h b/telnet/externs.h
+index f79c6ae..e0d9fbc 100644
+--- a/telnet/externs.h
++++ b/telnet/externs.h
+@@ -67,6 +67,7 @@
+ # endif
+ #endif
+ 
++#include <stdbool.h>
+ #include <stdio.h>
+ #include <setjmp.h>
+ #if defined CRAY && !defined NO_BSD_SETJMP
+@@ -331,7 +332,8 @@ env_opt (unsigned char *, int),
+ env_opt_start (void),
+ env_opt_start_info (void), env_opt_add (unsigned char *), env_opt_end (int);
+ 
+-extern unsigned char *env_default (int, int), *env_getvalue (const char *);
++extern unsigned char *env_default (int, int);
++extern unsigned char *env_getvalue (const char *, bool);
+ 
+ int dosynch (const char *);
+ int get_status (const char *);
+diff --git a/telnet/telnet.c b/telnet/telnet.c
+index 8884b6e..6a5cf8b 100644
+--- a/telnet/telnet.c
++++ b/telnet/telnet.c
+@@ -496,7 +496,7 @@ dooption (int option)
+ #endif
+ 
+ 	    case TELOPT_XDISPLOC:	/* X Display location */
+-	      if (env_getvalue ("DISPLAY"))
++	      if (env_getvalue ("DISPLAY", false))
+ 		new_state_ok = 1;
+ 	      break;
+ 
+@@ -793,7 +793,7 @@ gettermname (void)
+       resettermname = 0;
+       if (tnamep && tnamep != unknown)
+ 	free (tnamep);
+-      if ((tname = (char *) env_getvalue ("TERM")) &&
++      if ((tname = (char *) env_getvalue ("TERM", false)) &&
+ 	  (init_term (tname, &err) == 0))
+ 	{
+ 	  tnamep = mklist (termbuf, tname);
+@@ -992,7 +992,7 @@ suboption (void)
+ 	  unsigned char temp[50], *dp;
+ 	  int len;
+ 
+-	  if ((dp = env_getvalue ("DISPLAY")) == NULL)
++	  if ((dp = env_getvalue ("DISPLAY", false)) == NULL)
+ 	    {
+ 	      /*
+ 	       * Something happened, we no longer have a DISPLAY
+@@ -1727,7 +1727,7 @@ env_opt_add (register unsigned char *ep)
+ 	env_opt_add (ep);
+       return;
+     }
+-  vp = env_getvalue ((char *) ep);
++  vp = env_getvalue ((char *) ep, true);
+   if (opt_replyp + (vp ? strlen ((char *) vp) : 0) +
+       strlen ((char *) ep) + 6 > opt_replyend)
+     {
+@@ -2484,7 +2484,7 @@ telnet (char *user)
+       send_will (TELOPT_LINEMODE, 1);
+       send_will (TELOPT_NEW_ENVIRON, 1);
+       send_do (TELOPT_STATUS, 1);
+-      if (env_getvalue ("DISPLAY"))
++      if (env_getvalue ("DISPLAY", false))
+ 	send_will (TELOPT_XDISPLOC, 1);
+       if (eight)
+ 	tel_enter_binary (eight);
+-- 
+2.50.1
+
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.5.bb b/meta/recipes-connectivity/inetutils/inetutils_2.5.bb
index 29ff62379d3..2e1d2a30d7a 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.5.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.5.bb
@@ -22,6 +22,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://CVE-2026-24061-2.patch \
            file://CVE-2026-28372.patch \
            file://CVE-2026-32746.patch \
+           file://CVE-2026-32772.patch \
            "
 
 inherit autotools gettext update-alternatives texinfo

