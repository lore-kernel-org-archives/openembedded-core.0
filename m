Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C23ADCD343B
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 05:29:52 +0000 (UTC)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5457.1778131785421682654
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2026 22:29:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=En8az5Uy;
 spf=pass (domain: mvista.com, ip: 74.125.82.179, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so1160240eec.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 May 2026 22:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1778131784; x=1778736584; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+RnG/rpMKFsL/W6VwGNlouqFEDHeptainlGCJMAAnY8=;
        b=En8az5UyAgRpBB3oe+e7dEodtekTv9FpUaEFANffl/ZXpPYFXBqTdmvVLt9QdwEAXQ
         +ty7VKk4ckHtagiFbkwshvq4NdKh+7dBcTNkqU2RMw2UcHltFUfYPItHd7DP8g4cqD5F
         i6VmL05kyo1Hmb4voq2bPVeyryulHdK+D7gn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778131784; x=1778736584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+RnG/rpMKFsL/W6VwGNlouqFEDHeptainlGCJMAAnY8=;
        b=EMyDOFBUTcvJgaqi/H90I/8VW6nXjpH/IvJ7eLtPQDP4tdUxL8oJZ4u3feur2QdMxD
         BiybrAkM+PmUXRFlRY1DHGX0sbTjeyvk7IESEGyUPvORZnZ3F5/xPOj5p/XdtuGkexX+
         YJKolo+eSScSTN+pwbuMca1XppxbKSJrd9CtKGbK2Mbjckna9yX/rRkd9jbpIev0/0NM
         fSZDBOPB/NvWMu6puIiDw+pPIrFBfP8d4nwPPYUznlV1ECHqvnxW7+tXqARuj9NYCFHG
         K98YDKd/9y8rRg5ezqv60ucTLrjyiu/pc4GVuOi237x/U7LXE7f4/6qzWnrUlk2DPDCX
         3UvQ==
X-Gm-Message-State: AOJu0YwP3KyPwlxBfHKPb1uZWGR/T3UPGkI3VMdk1ue6VZ9QUyHhsWF2
	cp/IoJ+cUHo9VPa7r1waQvnXKcgV5N4NEhZGhHfaT0x82OCylFvaYCf+WFId6DdKDuCiYVn1d+B
	24nlDdok=
X-Gm-Gg: AeBDies33/8Im2Xqy8JgjoS56fmcaOPSAZ/rjsAMq5Xf+IMLXzRa1pGiIl8BnMxwWhX
	79bNj7Tgc3LQ5mbp4bm4t/f9rLKFdImfNnV/SqrAeGtrbgVqJUKXlpwg5LLRWbLG+ns4KzJjhB1
	DxdcxFN3xhRxA5vAhWZviagOpu3xht2zwlTn3ifcYb/RiVgqZthkA8jDhxfejCw8LbwWZicXPbU
	Lr7LrQoVOEezDBw6pDn6vpSmXKsa55qq1EYtWX1nrmMNIZWXPQct9xjAYRv7RBjSZL1WB5+Bq5Q
	7oh0GvQx8XkATuQPTD9f73TLGko6MWOTzpxy0Ivacpr5883UaCWFplc38M5Qwl+ULYXC/rHoKfj
	q5wejrKp+nXHQBtWCE5/jZhVuivSUS+HUyZNm6roK9NNxmrugDs/VV7Cc7nMdsrokuHLZD4Bwmc
	zfpFFzGx2cpbJUfNT2S9TUBAzgszjkjyk9iWis0Kkf6IpHD94=
X-Received: by 2002:a05:7301:19ae:b0:2ef:1d11:18ae with SMTP id 5a478bee46e88-2f54b797d07mr4090784eec.28.1778131784356;
        Wed, 06 May 2026 22:29:44 -0700 (PDT)
Received: from MVIN00013.mvista.com ([150.129.170.191])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56fd909e3sm6579321eec.20.2026.05.06.22.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 22:29:43 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] inetutils: fix for CVE-2026-32772
Date: Thu,  7 May 2026 10:59:33 +0530
Message-ID: <20260507052933.62935-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 05:29:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236557

Pick patch from [1] also mentioned at NVD report in [2]

[1] https://www.openwall.com/lists/oss-security/2026/03/13/1
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-32772
[3] https://cgit.git.savannah.gnu.org/cgit/inetutils.git/patch/?id=d6b8b83aa51616946fd314bc48087312d13c99f8
[4] https://security-tracker.debian.org/tracker/CVE-2026-32772

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../inetutils/inetutils/CVE-2026-32772.patch  | 172 ++++++++++++++++++
 .../inetutils/inetutils_2.5.bb                |   1 +
 2 files changed, 173 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32772.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32772.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32772.patch
new file mode 100644
index 0000000000..cc44f9531a
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
index 29ff62379d..2e1d2a30d7 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.5.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.5.bb
@@ -22,6 +22,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://CVE-2026-24061-2.patch \
            file://CVE-2026-28372.patch \
            file://CVE-2026-32746.patch \
+           file://CVE-2026-32772.patch \
            "
 
 inherit autotools gettext update-alternatives texinfo
-- 
2.50.1


