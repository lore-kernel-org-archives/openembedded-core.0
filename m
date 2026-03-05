Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 849E0F47CB1
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 18:50:57 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51812.1772736653647116235
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 10:50:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=EkDBzd7p;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202603051850505d422bf2d80002078e-v2x_mw@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202603051850505d422bf2d80002078e
        for <openembedded-core@lists.openembedded.org>;
        Thu, 05 Mar 2026 19:50:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=wK+bPEfq6cEyvhkjOt8aDCL7336+yXLqRJ36bawg8eM=;
 b=EkDBzd7p5SxFZDn/SbH9cex5Ck6sj5v9J6St3tBtlsb3dHe+iwXtrxiwgRH932G8NmKbFp
 AtVCWg74460hGRzMueAW0vPlWmiBG351gju+pxfaDHDce/MEnPJMJn5cVeGtjwUsiHEgZtOB
 ths9M5SV3io7VJg4Fu99rJOwnTVhiXkXxeZH1mXNnMOTJdv8ISklrVtVQ4D9FKVhncsucDlE
 oXnpB3GkuNYtstoVKBdYFabuv3XvBn45oQc0jlX9noU8XYLd6UnHKFN3Z03oY2egq8MLonGa
 vCcVsNAppWrMdjrNyXOw3kY6TIlN0IIwmE1mtgYViMi0V4WrGh/7YD7A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] inetutils: patch CVE-2026-28372
Date: Thu,  5 Mar 2026 19:50:39 +0100
Message-Id: <20260305185039.1487274-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 18:50:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232506

From: Peter Marko <peter.marko@siemens.com>

Pick patch according to [1] (equivalent to patch from [2]).

[1] https://security-tracker.debian.org/tracker/CVE-2026-28372
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-28372

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../inetutils/inetutils/CVE-2026-28372.patch  | 86 +++++++++++++++++++
 .../inetutils/inetutils_2.7.bb                |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-28372.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-28372.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-28372.patch
new file mode 100644
index 0000000000..79d390f473
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-28372.patch
@@ -0,0 +1,86 @@
+From 4db2f19f4caac03c7f4da6363c140bd70df31386 Mon Sep 17 00:00:00 2001
+From: Erik Auerswald <auerswal@unix-ag.uni-kl.de>
+Date: Sun, 15 Feb 2026 15:38:50 +0100
+Subject: [PATCH] telnetd: don't allow systemd service credentials
+
+The login(1) implementation of util-linux added support for
+systemd service credentials in release 2.40.  This allows to
+bypass authentication by specifying a directory name in the
+environment variable CREDENTIALS_DIRECTORY.  If this directory
+contains a file named 'login.noauth' with the content of 'yes',
+login(1) skips authentication.
+
+GNU Inetutils telnetd supports to set arbitrary environment
+variables using the 'Environment' and 'New Environment'
+Telnet options.  This allows specifying a directory containing
+'login.noauth'.  A local user can create such a directory
+and file, and, e.g., specify the user name 'root' to escalate
+privileges.
+
+This problem was reported by Ron Ben Yizhak in
+<https://lists.gnu.org/archive/html/bug-inetutils/2026-02/msg00000.html>.
+
+This commit clears CREDENTIALS_DIRECTORY from the environment
+before executing login(1) to implement a simple fix that can
+be backported easily.
+
+* NEWS.md: Mention fix.
+* THANKS: Mention Ron Ben Yizhak.
+* telnetd/pty.c: Clear CREDENTIALS_DIRECTORY from the environment
+before executing 'login'.
+
+CVE: CVE-2026-28372
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/inetutils.git/commit/?id=4db2f19f4caac03c7f4da6363c140bd70df31386]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ NEWS          | 5 +++++
+ THANKS        | 1 +
+ telnetd/pty.c | 8 ++++++++
+ 3 files changed, 14 insertions(+)
+
+diff --git a/NEWS b/NEWS
+index 877ca53b..f5172a71 100644
+--- a/NEWS
++++ b/NEWS
+@@ -1,5 +1,10 @@
+ GNU inetutils NEWS -- history of user-visible changes.
+ 
++** Prevent privilege escalation via telnetd abusing systemd service
++credentials support added to the login(1) implementation of util-linux
++in release 2.40.  Reported by Ron Ben Yizhak in
++<https://lists.gnu.org/archive/html/bug-inetutils/2026-02/msg00000.html>.
++
+ # Noteworthy changes in release 2.7 (2025-12-14) [stable]
+ 
+ ** Systems without asprintf are now supported through the use of gnulib.
+diff --git a/THANKS b/THANKS
+index 8d1d3dbb..ef5f6063 100644
+--- a/THANKS
++++ b/THANKS
+@@ -9,6 +9,7 @@ In particular:
+   NIIBE Yutaka		 (Security fixes & making talk finally work)
+   Nathan Neulinger       (tftpd)
+   Thomas Bushnell        (sockaddr sin_len field)
++  Ron Ben Yizhak         (reported privilege escalation via telnetd)
+ 
+ Please see version control logs and ChangeLog.? for full credits.
+ 
+diff --git a/telnetd/pty.c b/telnetd/pty.c
+index c727e7be..f3518049 100644
+--- a/telnetd/pty.c
++++ b/telnetd/pty.c
+@@ -129,6 +129,14 @@ start_login (char *host, int autologin, char *name)
+   if (!cmd)
+     fatal (net, "can't expand login command line");
+   argcv_get (cmd, "", &argc, &argv);
++
++  /* util-linux's "login" introduced an authentication bypass method
++   * via environment variable "CREDENTIALS_DIRECTORY" in version 2.40.
++   * Clear it from the environment before executing "login" to prevent
++   * abuse via Telnet.
++   */
++  unsetenv ("CREDENTIALS_DIRECTORY");
++
+   execv (argv[0], argv);
+   syslog (LOG_ERR, "%s: %m\n", cmd);
+   fatalperror (net, cmd);
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.7.bb b/meta/recipes-connectivity/inetutils/inetutils_2.7.bb
index a866ca5339..716174e299 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.7.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.7.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
            file://tftpd.xinetd.inetutils \
            file://CVE-2026-24061-01.patch \
            file://CVE-2026-24061-02.patch \
+           file://CVE-2026-28372.patch \
            "
 
 inherit autotools gettext update-alternatives texinfo

