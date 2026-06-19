Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E8FCDB475
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 08:33:23 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38123.1781857996049228912
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 01:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PlHntSXc;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso23587685e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 01:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781857994; x=1782462794; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwNfROmjO/EW0EiyHDeTbvQSHan7b/U1GdWAvAk+pk8=;
        b=PlHntSXcepHniWDEbG2v78gywYmhe+JgfjzPgfz53VGA6nTrNA62cuSFRkwKtgiF8Y
         iXjV21cS7LWuGln5prsGfCHK/8x4z320Ag4S8X/py4MPZv1TKSh3zzn+qZFmec2grgeX
         UDN+SfRIpY1QvtDpyfTksHtCTURx2deEmwUtWAE40PiMEbZo2w/6tPbxNWBr5cqx3ZDR
         dbWjfwqKFgpY2tD0rF7MOKUzdjexbvv4l3ZnImyaaQ8Aq/+EWW8nnCiLS0BE6qV7JJ2J
         GARAN6P5W8jW/T+njGIA5aiCdPjXQ4GqNF8Zk0s+yizE+eYiWVWtdQwX1GU4Yk9nwF3w
         lAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857994; x=1782462794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FwNfROmjO/EW0EiyHDeTbvQSHan7b/U1GdWAvAk+pk8=;
        b=ZzLnF2HIf0XfRifOGYslo8LWH9YqE9k3c4F85OhbDIk3k/2ItcTaaRqnIq07c4olXQ
         RrIo7pZSS71ZlFUEdzClWuuDcj0Auh6ZG6QAey418atKm6aDAJQVWwL7uIH2wCw0BnD0
         uc75vG2bw6+yLdVEd5Jyt8PYN0XYjM7cUY8EOPln/yFYzTBlHbaxPF+uOSsK9KKwXTBK
         Y1++263Xywbj7ply9Scmkofw5a8nSM0JYJ9AfIWM21F0PYw3+EBuDQefwq5zgfM7VPiM
         9s5PIFptxHJ904ezW5bivthPg/1rHnPEdyXSSPWYYGx5IpsMujJWpDToF43eSWyRSDCe
         Ycnw==
X-Gm-Message-State: AOJu0YxEIGHN7jBb5zHMFGncAejfpV6UNAXMmVtNSgbUmBx3CJ2d3KkL
	OxSkAbDB+P7NJmGfe5G+6hYoSGijpZtCcwUP9VJ8F5WiFo7LKZTLCLzliFKUcvEh
X-Gm-Gg: AfdE7cngE2pLNkz6QL/gE6jrU+lbWDRr8d0lGLkKliuQ+P0eRmHHp/n8w2hxmrIW6G4
	GiCfrRsuEPv1q1D7R3ApcR6u0IMJRvc0Ocmu6hV25e5zurnI/xUXR0cGqkqINtk2FVFICLFqLpm
	MRn03Fo4RCP1P0iCURqEYhZn/OfVVFiLHkYi7GopbEg44epPKMnWP+3+oULY8MaolDjWKAEL5V5
	yZHjCG4q3gOaA2M1IABL0EDGSql6hMhhaw5zDmiyYIddltNAwUCV/2cJbJFu/6ApAI//+P6AgH4
	P8LeufaWQCp0s00oCfrFVZQsugcYcDOGOVdZq47hU2hl+lETS+Zx482RncEnxo5wLBiRiJkw35L
	ji2h2Zw5yLgIsMx6wCDpJVBC+DdtsuVzZCuwMifVayw9KV+vORG0aMCGSkO+2drqEIr0roruHc0
	HLkgnywh+1McBJmu0kF0em34kDND6sKYtAR24eXbd3jw8qIyR0
X-Received: by 2002:a05:600c:8010:b0:490:bad9:de43 with SMTP id 5b1f17b1804b1-4923eeaca70mr51016745e9.0.1781857993718;
        Fri, 19 Jun 2026 01:33:13 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650bc429a1sm5878368f8f.30.2026.06.19.01.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 01:33:13 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/15] inetutils: upgrade 2.7 -> 2.8
Date: Fri, 19 Jun 2026 10:32:49 +0200
Message-ID: <20260619083305.3505156-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260619083305.3505156-1-alex.kanavin@gmail.com>
References: <20260619083305.3505156-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 08:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239142

From: Alexander Kanavin <alex@linutronix.de>

All dropped patches are backports.

Add warnings disabling as upstream does something custom that clashes
with oe's flags:
| cc1: error: '-Wformat-security' ignored without '-Wformat' [-Werror=format-security]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../inetutils/CVE-2026-24061-01.patch         |  38 -----
 .../inetutils/CVE-2026-24061-02.patch         |  82 -----------
 .../inetutils/inetutils/CVE-2026-28372.patch  |  86 -----------
 .../inetutils/inetutils/CVE-2026-32746.patch  |  55 -------
 .../inetutils/inetutils/CVE-2026-32772.patch  | 138 ------------------
 .../{inetutils_2.7.bb => inetutils_2.8.bb}    |   8 +-
 6 files changed, 2 insertions(+), 405 deletions(-)
 delete mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-01.patch
 delete mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-02.patch
 delete mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-28372.patch
 delete mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32746.patch
 delete mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32772.patch
 rename meta/recipes-connectivity/inetutils/{inetutils_2.7.bb => inetutils_2.8.bb} (96%)

diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-01.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-01.patch
deleted file mode 100644
index 9c05df22c7..0000000000
--- a/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-01.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From fd702c02497b2f398e739e3119bed0b23dd7aa7b Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Tue, 20 Jan 2026 01:10:36 -0800
-Subject: [PATCH] Fix injection bug with bogus user names
-
-Problem reported by Kyu Neushwaistein.
-* telnetd/utility.c (_var_short_name):
-Ignore user names that start with '-' or contain shell metacharacters.
-
-Signed-off-by: Simon Josefsson <simon@josefsson.org>
-
-CVE: CVE-2026-24061
-Upstream-Status: Backport [https://codeberg.org/inetutils/inetutils/commit/fd702c02497b2f398e739e3119bed0b23dd7aa7b]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- telnetd/utility.c | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/telnetd/utility.c b/telnetd/utility.c
-index b486226e..c02cd0e6 100644
---- a/telnetd/utility.c
-+++ b/telnetd/utility.c
-@@ -1733,7 +1733,14 @@ _var_short_name (struct line_expander *exp)
-       return user_name ? xstrdup (user_name) : NULL;
- 
-     case 'U':
--      return getenv ("USER") ? xstrdup (getenv ("USER")) : xstrdup ("");
-+      {
-+	/* Ignore user names starting with '-' or containing shell
-+	   metachars, as they can cause trouble.  */
-+	char const *u = getenv ("USER");
-+	return xstrdup ((u && *u != '-'
-+			 && !u[strcspn (u, "\t\n !\"#$&'()*;<=>?[\\^`{|}~")])
-+			? u : "");
-+      }
- 
-     default:
-       exp->state = EXP_STATE_ERROR;
diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-02.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-02.patch
deleted file mode 100644
index 62df504e60..0000000000
--- a/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-02.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From ccba9f748aa8d50a38d7748e2e60362edd6a32cc Mon Sep 17 00:00:00 2001
-From: Simon Josefsson <simon@josefsson.org>
-Date: Tue, 20 Jan 2026 14:02:39 +0100
-Subject: [PATCH] telnetd: Sanitize all variable expansions
-
-* telnetd/utility.c (sanitize): New function.
-(_var_short_name): Use it for all variables.
-
-CVE: CVE-2026-24061
-Upstream-Status: Backport [https://codeberg.org/inetutils/inetutils/commit/ccba9f748aa8d50a38d7748e2e60362edd6a32cc]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- telnetd/utility.c | 32 ++++++++++++++++++--------------
- 1 file changed, 18 insertions(+), 14 deletions(-)
-
-diff --git a/telnetd/utility.c b/telnetd/utility.c
-index c02cd0e6..b21ad961 100644
---- a/telnetd/utility.c
-+++ b/telnetd/utility.c
-@@ -1684,6 +1684,17 @@ static void _expand_cond (struct line_expander *exp);
- static void _skip_block (struct line_expander *exp);
- static void _expand_block (struct line_expander *exp);
- 
-+static char *
-+sanitize (const char *u)
-+{
-+  /* Ignore values starting with '-' or containing shell metachars, as
-+     they can cause trouble.  */
-+  if (u && *u != '-' && !u[strcspn (u, "\t\n !\"#$&'()*;<=>?[\\^`{|}~")])
-+    return u;
-+  else
-+    return "";
-+}
-+
- /* Expand a variable referenced by its short one-symbol name.
-    Input: exp->cp points to the variable name.
-    FIXME: not implemented */
-@@ -1710,13 +1721,13 @@ _var_short_name (struct line_expander *exp)
-       return xstrdup (timebuf);
- 
-     case 'h':
--      return xstrdup (remote_hostname);
-+      return xstrdup (sanitize (remote_hostname));
- 
-     case 'l':
--      return xstrdup (local_hostname);
-+      return xstrdup (sanitize (local_hostname));
- 
-     case 'L':
--      return xstrdup (line);
-+      return xstrdup (sanitize (line));
- 
-     case 't':
-       q = strchr (line + 1, '/');
-@@ -1724,23 +1735,16 @@ _var_short_name (struct line_expander *exp)
- 	q++;
-       else
- 	q = line;
--      return xstrdup (q);
-+      return xstrdup (sanitize (q));
- 
-     case 'T':
--      return terminaltype ? xstrdup (terminaltype) : NULL;
-+      return terminaltype ? xstrdup (sanitize (terminaltype)) : NULL;
- 
-     case 'u':
--      return user_name ? xstrdup (user_name) : NULL;
-+      return user_name ? xstrdup (sanitize (user_name)) : NULL;
- 
-     case 'U':
--      {
--	/* Ignore user names starting with '-' or containing shell
--	   metachars, as they can cause trouble.  */
--	char const *u = getenv ("USER");
--	return xstrdup ((u && *u != '-'
--			 && !u[strcspn (u, "\t\n !\"#$&'()*;<=>?[\\^`{|}~")])
--			? u : "");
--      }
-+      return xstrdup (sanitize (getenv ("USER")));
- 
-     default:
-       exp->state = EXP_STATE_ERROR;
diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-28372.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-28372.patch
deleted file mode 100644
index 79d390f473..0000000000
--- a/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-28372.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 4db2f19f4caac03c7f4da6363c140bd70df31386 Mon Sep 17 00:00:00 2001
-From: Erik Auerswald <auerswal@unix-ag.uni-kl.de>
-Date: Sun, 15 Feb 2026 15:38:50 +0100
-Subject: [PATCH] telnetd: don't allow systemd service credentials
-
-The login(1) implementation of util-linux added support for
-systemd service credentials in release 2.40.  This allows to
-bypass authentication by specifying a directory name in the
-environment variable CREDENTIALS_DIRECTORY.  If this directory
-contains a file named 'login.noauth' with the content of 'yes',
-login(1) skips authentication.
-
-GNU Inetutils telnetd supports to set arbitrary environment
-variables using the 'Environment' and 'New Environment'
-Telnet options.  This allows specifying a directory containing
-'login.noauth'.  A local user can create such a directory
-and file, and, e.g., specify the user name 'root' to escalate
-privileges.
-
-This problem was reported by Ron Ben Yizhak in
-<https://lists.gnu.org/archive/html/bug-inetutils/2026-02/msg00000.html>.
-
-This commit clears CREDENTIALS_DIRECTORY from the environment
-before executing login(1) to implement a simple fix that can
-be backported easily.
-
-* NEWS.md: Mention fix.
-* THANKS: Mention Ron Ben Yizhak.
-* telnetd/pty.c: Clear CREDENTIALS_DIRECTORY from the environment
-before executing 'login'.
-
-CVE: CVE-2026-28372
-Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/inetutils.git/commit/?id=4db2f19f4caac03c7f4da6363c140bd70df31386]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- NEWS          | 5 +++++
- THANKS        | 1 +
- telnetd/pty.c | 8 ++++++++
- 3 files changed, 14 insertions(+)
-
-diff --git a/NEWS b/NEWS
-index 877ca53b..f5172a71 100644
---- a/NEWS
-+++ b/NEWS
-@@ -1,5 +1,10 @@
- GNU inetutils NEWS -- history of user-visible changes.
- 
-+** Prevent privilege escalation via telnetd abusing systemd service
-+credentials support added to the login(1) implementation of util-linux
-+in release 2.40.  Reported by Ron Ben Yizhak in
-+<https://lists.gnu.org/archive/html/bug-inetutils/2026-02/msg00000.html>.
-+
- # Noteworthy changes in release 2.7 (2025-12-14) [stable]
- 
- ** Systems without asprintf are now supported through the use of gnulib.
-diff --git a/THANKS b/THANKS
-index 8d1d3dbb..ef5f6063 100644
---- a/THANKS
-+++ b/THANKS
-@@ -9,6 +9,7 @@ In particular:
-   NIIBE Yutaka		 (Security fixes & making talk finally work)
-   Nathan Neulinger       (tftpd)
-   Thomas Bushnell        (sockaddr sin_len field)
-+  Ron Ben Yizhak         (reported privilege escalation via telnetd)
- 
- Please see version control logs and ChangeLog.? for full credits.
- 
-diff --git a/telnetd/pty.c b/telnetd/pty.c
-index c727e7be..f3518049 100644
---- a/telnetd/pty.c
-+++ b/telnetd/pty.c
-@@ -129,6 +129,14 @@ start_login (char *host, int autologin, char *name)
-   if (!cmd)
-     fatal (net, "can't expand login command line");
-   argcv_get (cmd, "", &argc, &argv);
-+
-+  /* util-linux's "login" introduced an authentication bypass method
-+   * via environment variable "CREDENTIALS_DIRECTORY" in version 2.40.
-+   * Clear it from the environment before executing "login" to prevent
-+   * abuse via Telnet.
-+   */
-+  unsetenv ("CREDENTIALS_DIRECTORY");
-+
-   execv (argv[0], argv);
-   syslog (LOG_ERR, "%s: %m\n", cmd);
-   fatalperror (net, cmd);
diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32746.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32746.patch
deleted file mode 100644
index 63dd8b8c58..0000000000
--- a/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32746.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 6864598a29b652a6b69a958f5cd1318aa2b258af Mon Sep 17 00:00:00 2001
-From: Collin Funk <collin.funk1@gmail.com>
-Date: Wed, 11 Mar 2026 23:06:46 -0700
-Subject: [PATCH] telnetd: fix stack buffer overflow processing SLC suboption
- triplets
-
-Previously a client could write past the end of an internal buffer using
-an SLC suboption with many triplets using function octets greater than
-18, possibly leading to remote code execution. Reported by Adiel Sol,
-Arad Inbar, Erez Cohen, Nir Somech, Ben Grinberg, Daniel Lubel at DREAM
-Security Research Team at:
-<https://lists.gnu.org/r/bug-inetutils/2026-03/msg00031.html>.
-
-* telnetd/slc.c (add_slc): Return early if writing the tuple would lead
-us to writing past the end of the buffer.
-* NEWS.md: Mention the fix.
-
-CVE: CVE-2026-32746
-Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/inetutils.git/commit/?id=6864598a29b652a6b69a958f5cd1318aa2b258af]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- NEWS          | 6 ++++++
- telnetd/slc.c | 3 +++
- 2 files changed, 9 insertions(+)
-
-diff --git a/NEWS b/NEWS
-index 5fe1e4c5..c03d22f4 100644
---- a/NEWS
-+++ b/NEWS
-@@ -1,5 +1,11 @@
- GNU inetutils NEWS -- history of user-visible changes.
- 
-+** telnetd no longer allows clients to write past the end of a stack
-+allocated buffer, possibly leading to remote code execution, using an
-+SLC suboption with many triplets using function octets greater than 18.
-+Reported by Adiel Sol, Arad Inbar, Erez Cohen, Nir Somech, Ben Grinberg,
-+Daniel Lubel at DREAM Security Research Team.
-+
- ** Prevent privilege escalation via telnetd abusing systemd service
- credentials support added to the login(1) implementation of util-linux
- in release 2.40.  Reported by Ron Ben Yizhak in
-diff --git a/telnetd/slc.c b/telnetd/slc.c
-index f45e7725..2dfef22f 100644
---- a/telnetd/slc.c
-+++ b/telnetd/slc.c
-@@ -162,6 +162,9 @@ get_slc_defaults (void)
- void
- add_slc (char func, char flag, cc_t val)
- {
-+  /* Do nothing if the entire triplet cannot fit in the buffer.  */
-+  if (slcbuf + sizeof slcbuf - slcptr <= 6)
-+    return;
- 
-   if ((*slcptr++ = (unsigned char) func) == 0xff)
-     *slcptr++ = 0xff;
diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32772.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32772.patch
deleted file mode 100644
index 232774195f..0000000000
--- a/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32772.patch
+++ /dev/null
@@ -1,138 +0,0 @@
-From d6b8b83aa51616946fd314bc48087312d13c99f8 Mon Sep 17 00:00:00 2001
-From: Collin Funk <collin.funk1@gmail.com>
-Date: Thu, 26 Mar 2026 22:52:54 -0700
-Subject: [PATCH] telnet: don't leak the value of unexported environment
- variables
-
-Patch based on the following OpenBSD commit:
-<https://github.com/openbsd/src/commit/1a11dc7253488a97d6df686dae9230f78682e8df>
-
-* NEWS.md: Mention the fix.
-* telnet/commands.c (env_getvalue): Add a boolean argument to prevent
-prevent unexported variables from being returned.
-* telnet/externs.h (env_getvalue): Adjust the function declaration.
-* telnet/authenc.c (telnet_getenv): Add the new argument.
-* telnet/telnet.c (dooption, gettermname, suboption, env_opt_add)
-(telnet): Likewise.
-
-CVE: CVE-2026-32772
-Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/inetutils.git/commit/?id=d6b8b83aa51616946fd314bc48087312d13c99f8]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- NEWS              |  5 +++++
- telnet/authenc.c  |  2 +-
- telnet/commands.c |  6 ++----
- telnet/externs.h  |  3 ++-
- telnet/telnet.c   | 10 +++++-----
- 5 files changed, 15 insertions(+), 11 deletions(-)
-
-diff --git a/NEWS b/NEWS
-index 08370442..6e259e02 100644
---- a/NEWS
-+++ b/NEWS
-@@ -1,5 +1,10 @@
- GNU inetutils NEWS -- history of user-visible changes.
- 
-+** telnet no longer leaks the value of unexported environment variables
-+to servers sending the NEW-ENVIRON SEND USERVAR command.
-+Reported by Justin Swartz in
-+<https://www.openwall.com/lists/oss-security/2026/03/13/1>.
-+
- ** telnetd no longer allows clients to write past the end of a stack
- allocated buffer, possibly leading to remote code execution, using an
- SLC suboption with many triplets using function octets greater than 18.
-diff --git a/telnet/authenc.c b/telnet/authenc.c
-index 2706c9f8..f8daea9d 100644
---- a/telnet/authenc.c
-+++ b/telnet/authenc.c
-@@ -93,7 +93,7 @@ telnet_spin (void)
- char *
- telnet_getenv (char *val)
- {
--  return ((char *) env_getvalue (val));
-+  return (char *) env_getvalue (val, false);
- }
- 
- char *
-diff --git a/telnet/commands.c b/telnet/commands.c
-index 4967559b..9d85df73 100644
---- a/telnet/commands.c
-+++ b/telnet/commands.c
-@@ -2050,12 +2050,10 @@ env_default (int init, int welldefined)
- }
- 
- unsigned char *
--env_getvalue (const char *var)
-+env_getvalue (const char *var, bool exported_only)
- {
-   struct env_lst *ep = env_find (var);
--  if (ep)
--    return (ep->value);
--  return (NULL);
-+  return ep && (! exported_only || ep->export) ? ep->value : NULL;
- }
- 
- #if defined OLD_ENVIRON && defined ENV_HACK
-diff --git a/telnet/externs.h b/telnet/externs.h
-index c1f5850e..0adc295a 100644
---- a/telnet/externs.h
-+++ b/telnet/externs.h
-@@ -331,7 +331,8 @@ env_opt (unsigned char *, int),
- env_opt_start (void),
- env_opt_start_info (void), env_opt_add (unsigned char *), env_opt_end (int);
- 
--extern unsigned char *env_default (int, int), *env_getvalue (const char *);
-+extern unsigned char *env_default (int, int);
-+extern unsigned char *env_getvalue (const char *, bool);
- 
- int dosynch (const char *);
- int get_status (const char *);
-diff --git a/telnet/telnet.c b/telnet/telnet.c
-index 6b0befc3..f83dfc18 100644
---- a/telnet/telnet.c
-+++ b/telnet/telnet.c
-@@ -496,7 +496,7 @@ dooption (int option)
- #endif
- 
- 	    case TELOPT_XDISPLOC:	/* X Display location */
--	      if (env_getvalue ("DISPLAY"))
-+	      if (env_getvalue ("DISPLAY", false))
- 		new_state_ok = 1;
- 	      break;
- 
-@@ -793,7 +793,7 @@ gettermname (void)
-       resettermname = 0;
-       if (tnamep && tnamep != unknown)
- 	free (tnamep);
--      if ((tname = (char *) env_getvalue ("TERM")) &&
-+      if ((tname = (char *) env_getvalue ("TERM", false)) &&
- 	  (init_term (tname, &err) == 0))
- 	{
- 	  tnamep = mklist (termbuf, tname);
-@@ -992,7 +992,7 @@ suboption (void)
- 	  unsigned char temp[50], *dp;
- 	  int len;
- 
--	  if ((dp = env_getvalue ("DISPLAY")) == NULL)
-+	  if ((dp = env_getvalue ("DISPLAY", false)) == NULL)
- 	    {
- 	      /*
- 	       * Something happened, we no longer have a DISPLAY
-@@ -1727,7 +1727,7 @@ env_opt_add (unsigned char *ep)
- 	env_opt_add (ep);
-       return;
-     }
--  vp = env_getvalue ((char *) ep);
-+  vp = env_getvalue ((char *) ep, true);
-   if (opt_replyp + (vp ? strlen ((char *) vp) : 0) +
-       strlen ((char *) ep) + 6 > opt_replyend)
-     {
-@@ -2484,7 +2484,7 @@ telnet (char *user)
-       send_will (TELOPT_LINEMODE, 1);
-       send_will (TELOPT_NEW_ENVIRON, 1);
-       send_do (TELOPT_STATUS, 1);
--      if (env_getvalue ("DISPLAY"))
-+      if (env_getvalue ("DISPLAY", false))
- 	send_will (TELOPT_XDISPLOC, 1);
-       if (eight)
- 	tel_enter_binary (eight);
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.7.bb b/meta/recipes-connectivity/inetutils/inetutils_2.8.bb
similarity index 96%
rename from meta/recipes-connectivity/inetutils/inetutils_2.7.bb
rename to meta/recipes-connectivity/inetutils/inetutils_2.8.bb
index eb8b669e7c..b87c0ede43 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.7.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.8.bb
@@ -11,18 +11,13 @@ LICENSE = "GPL-3.0-only"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
-SRC_URI[sha256sum] = "a156be1cde3c5c0ffefc262180d9369a60484087907aa554c62787d2f40ec086"
+SRC_URI[sha256sum] = "57b3cf4f77555992881e5ba2a09a63b05aa2c56342a60ed4305b5f45938390b5"
 SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
            file://rexec.xinetd.inetutils \
            file://rlogin.xinetd.inetutils \
            file://rsh.xinetd.inetutils \
            file://telnet.xinetd.inetutils \
            file://tftpd.xinetd.inetutils \
-           file://CVE-2026-24061-01.patch \
-           file://CVE-2026-24061-02.patch \
-           file://CVE-2026-28372.patch \
-           file://CVE-2026-32746.patch \
-           file://CVE-2026-32772.patch \
            "
 
 inherit autotools gettext update-alternatives texinfo
@@ -44,6 +39,7 @@ EXTRA_OECONF = "--with-ncurses-include-dir=${STAGING_INCDIR} \
         --with-path-cp=${base_bindir}/cp \
         --with-path-uucico=${libexecdir}/uuico \
         --with-path-procnet-dev=/proc/net/dev \
+        --enable-gcc-warnings=no \
         "
 
 EXTRA_OECONF:append:libc-musl = " --with-path-utmpx=/dev/null/utmpx --with-path-wtmpx=/dev/null/wtmpx"
-- 
2.47.3


