Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B820CD37B8
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:51 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8183.1778224370537068708
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PVr78aIN;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d7645adbdso956080f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224369; x=1778829169; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MqZxnDaW5IeXGMTvqn1RW6VD9WyvshLzH0fLt6f/ffY=;
        b=PVr78aINcae0bE2+4F8YkgDqQJkn5c4EnGo6CPbMP+H4DUaag+qR2rg5sjvatPtSST
         KnYOlyuTwgwqzgK8oQnIiMBtZSYCeEpacpOthhWnqdyVlZ9Eyx2Hsc9nhEOwKmQc4lcW
         wDCzPoHnxNPOp7rxF/WNDiYmYuT5QdeGPP0ZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224369; x=1778829169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MqZxnDaW5IeXGMTvqn1RW6VD9WyvshLzH0fLt6f/ffY=;
        b=jnETOw7tk9EbEwaao+YRUAhoNH2T+FHG+9AzA8DcaY9Nd51jkeYRuGfXIFh0xvPgXr
         MpCNvT75tVMdfTg0Ij+iCdbbi/4XC4Q7M6lJgHFzRcQfgpVBbKyXoVs0p6rkTM2uMREW
         5zyw0sy7HlknyG44I5B1Uil6Rcf04VWHpiGOcoEoKLO+0mOtEBGLPZBu9/h3p3DNBpC3
         JLrI6rFWFmcIn11Ro1yvOebFcShtQzyaLFB31+PuPqufCTdR4ygTJK11Ur+c8cxT0ONV
         E69iZRr5HqLlu7HlvcvENIwBQYplpNRmmlEpAoda9L8nWpDmOoOJ4jlkVRe2UgthgGfz
         6apw==
X-Gm-Message-State: AOJu0YyfQ5qKrEkZ0s43O1tv7Si3PRfzZOYrIy2TmQZInmGuIJqv0QMf
	d45AGxABr1JkqxJmBj8UQmjYPgR3Z+azj2eUBDSVmgtW6yr+hips9doDHoAxqY134tuPF3QX2Qn
	gVGSOoGs=
X-Gm-Gg: Acq92OHYknEhw9TLiV35mX5MaCDiei+zjlnMIT37OJUoTGk23wa9QkKpANU7SKnOcpQ
	VE8t1ocaBBVkp1HdHAmk6dUn+aZ+zDPliJj2GR5tRrbi1kwupq+KFIQMF4Xxc0xWYLBz5oNiTvH
	ugP2J4Eid+p+KZkqHkGBh93p9WECuQiZM1O60ol4PUUwNPlYKP8hvmNSSSFM38wuvFdYOu3A0Ja
	wceCJ8yFhCH2UInqBL6AH0uC+DIU/tTSOgqV2BMUNDqCa/KlxiZBrIwU5YyFPMEDYSB+XMfIBwi
	NR+jhXPTYukru8DaBhrGBAw3xscqf4PTU4MBlO3jPSXHeVDyYm3JlfFhV5YgRMqnMx0ecRs4yzS
	U2KVh7qxjJFc99uoTVRhnwmmw58xj2Ws7viNAc7e1uNksYX7lpmHayz8Y4k4yosMFsn2ru+D1vX
	NF8/GETYSt00/a+QT+laHCqWix44pwpgeKMyJ8TEwhMPKU6VL7Hf78n4a33HnF7ASI9JHzvnYeG
	K2ZiaUulEWqg1A6NJB7jGN4xDP39GIq4h6WLQ==
X-Received: by 2002:a5d:5d87:0:b0:449:9aee:4581 with SMTP id ffacd0b85a97d-4515b61bd32mr18078282f8f.12.1778224368426;
        Fri, 08 May 2026 00:12:48 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:47 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 50/52] inetutils: patch CVE-2026-32772
Date: Fri,  8 May 2026 09:11:43 +0200
Message-ID: <0638911b940a5b6f9338fe4627ca3d166cf9cf03.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236692

From: Peter Marko <peter.marko@siemens.com>

Pick patch which references vulnerability report [1] linked in NVD
report (see NEWS file).

[1] https://www.openwall.com/lists/oss-security/2026/03/13/1

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 36bdd32ebd952ac1c5c79130e328168b4d1e8a71)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../inetutils/inetutils/CVE-2026-32772.patch  | 138 ++++++++++++++++++
 .../inetutils/inetutils_2.7.bb                |   1 +
 2 files changed, 139 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32772.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32772.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32772.patch
new file mode 100644
index 00000000000..232774195f5
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32772.patch
@@ -0,0 +1,138 @@
+From d6b8b83aa51616946fd314bc48087312d13c99f8 Mon Sep 17 00:00:00 2001
+From: Collin Funk <collin.funk1@gmail.com>
+Date: Thu, 26 Mar 2026 22:52:54 -0700
+Subject: [PATCH] telnet: don't leak the value of unexported environment
+ variables
+
+Patch based on the following OpenBSD commit:
+<https://github.com/openbsd/src/commit/1a11dc7253488a97d6df686dae9230f78682e8df>
+
+* NEWS.md: Mention the fix.
+* telnet/commands.c (env_getvalue): Add a boolean argument to prevent
+prevent unexported variables from being returned.
+* telnet/externs.h (env_getvalue): Adjust the function declaration.
+* telnet/authenc.c (telnet_getenv): Add the new argument.
+* telnet/telnet.c (dooption, gettermname, suboption, env_opt_add)
+(telnet): Likewise.
+
+CVE: CVE-2026-32772
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/inetutils.git/commit/?id=d6b8b83aa51616946fd314bc48087312d13c99f8]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ NEWS              |  5 +++++
+ telnet/authenc.c  |  2 +-
+ telnet/commands.c |  6 ++----
+ telnet/externs.h  |  3 ++-
+ telnet/telnet.c   | 10 +++++-----
+ 5 files changed, 15 insertions(+), 11 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index 08370442..6e259e02 100644
+--- a/NEWS
++++ b/NEWS
+@@ -1,5 +1,10 @@
+ GNU inetutils NEWS -- history of user-visible changes.
+ 
++** telnet no longer leaks the value of unexported environment variables
++to servers sending the NEW-ENVIRON SEND USERVAR command.
++Reported by Justin Swartz in
++<https://www.openwall.com/lists/oss-security/2026/03/13/1>.
++
+ ** telnetd no longer allows clients to write past the end of a stack
+ allocated buffer, possibly leading to remote code execution, using an
+ SLC suboption with many triplets using function octets greater than 18.
+diff --git a/telnet/authenc.c b/telnet/authenc.c
+index 2706c9f8..f8daea9d 100644
+--- a/telnet/authenc.c
++++ b/telnet/authenc.c
+@@ -93,7 +93,7 @@ telnet_spin (void)
+ char *
+ telnet_getenv (char *val)
+ {
+-  return ((char *) env_getvalue (val));
++  return (char *) env_getvalue (val, false);
+ }
+ 
+ char *
+diff --git a/telnet/commands.c b/telnet/commands.c
+index 4967559b..9d85df73 100644
+--- a/telnet/commands.c
++++ b/telnet/commands.c
+@@ -2050,12 +2050,10 @@ env_default (int init, int welldefined)
+ }
+ 
+ unsigned char *
+-env_getvalue (const char *var)
++env_getvalue (const char *var, bool exported_only)
+ {
+   struct env_lst *ep = env_find (var);
+-  if (ep)
+-    return (ep->value);
+-  return (NULL);
++  return ep && (! exported_only || ep->export) ? ep->value : NULL;
+ }
+ 
+ #if defined OLD_ENVIRON && defined ENV_HACK
+diff --git a/telnet/externs.h b/telnet/externs.h
+index c1f5850e..0adc295a 100644
+--- a/telnet/externs.h
++++ b/telnet/externs.h
+@@ -331,7 +331,8 @@ env_opt (unsigned char *, int),
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
+index 6b0befc3..f83dfc18 100644
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
+@@ -1727,7 +1727,7 @@ env_opt_add (unsigned char *ep)
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
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.7.bb b/meta/recipes-connectivity/inetutils/inetutils_2.7.bb
index a3b0b207683..eb8b669e7ca 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.7.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.7.bb
@@ -22,6 +22,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
            file://CVE-2026-24061-02.patch \
            file://CVE-2026-28372.patch \
            file://CVE-2026-32746.patch \
+           file://CVE-2026-32772.patch \
            "
 
 inherit autotools gettext update-alternatives texinfo

