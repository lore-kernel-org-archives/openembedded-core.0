Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33170FF885A
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 19:53:37 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23687.1777924407797494872
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2026 12:53:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=mMz3tLwK;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20260504195325de652f28f60002077b-fvztjf@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260504195325de652f28f60002077b
        for <openembedded-core@lists.openembedded.org>;
        Mon, 04 May 2026 21:53:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=bdNWJC3cp21BrjiRtgw/uCtREQnmBz+TmuZ5wdK4DZw=;
 b=mMz3tLwKYJuhCGdFte2BuZ/EH9e9OZzkRtFSOqm9rnDuAJVFSrxARl1f2f2OLtDORhm/9D
 G1DDW+zVsOCUOgLctczG8MeCajZz+rnFw1bZ0hPjPybNSOFELNfaLnpJNFGUcax1NmFG8xzU
 PtIjfK0W+Mbazv4qPu8oGIgm1RYrct9lUtJEuCqMnPey2/oDJ0gqaoRb1GkQmO5G+Mpx+TyQ
 DmykEexAUP1KodNE/Hm+Ix+PV7lmvNgh+/zNSJtxfSrH+Y08sX2DuusjLn5r2vIIJVNhM+Zs
 CEQUzvhRHEotIh/63hT5GLzZcFcp5ORrjzuzEZ2UxTVj0/ERKUpeW6CA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 4/5] inetutils: patch CVE-2026-32772
Date: Mon,  4 May 2026 21:52:45 +0200
Message-ID: <20260504195246.1190112-4-peter.marko@siemens.com>
In-Reply-To: <20260504195246.1190112-1-peter.marko@siemens.com>
References: <20260504195246.1190112-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 May 2026 19:53:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236456

From: Peter Marko <peter.marko@siemens.com>

Pick patch which references vulnerability report [1] linked in NVD
report (see NEWS file).

[1] https://www.openwall.com/lists/oss-security/2026/03/13/1

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../inetutils/inetutils/CVE-2026-32772.patch  | 138 ++++++++++++++++++
 .../inetutils/inetutils_2.7.bb                |   1 +
 2 files changed, 139 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32772.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32772.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32772.patch
new file mode 100644
index 0000000000..232774195f
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
index a3b0b20768..eb8b669e7c 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.7.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.7.bb
@@ -22,6 +22,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
            file://CVE-2026-24061-02.patch \
            file://CVE-2026-28372.patch \
            file://CVE-2026-32746.patch \
+           file://CVE-2026-32772.patch \
            "
 
 inherit autotools gettext update-alternatives texinfo

