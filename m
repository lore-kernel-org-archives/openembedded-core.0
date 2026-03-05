Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE75F47CB6
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 18:51:07 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51817.1772736664925378786
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 10:51:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=T0ENmFqr;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-2026030518510299d89a2bed0002074d-rcvpbk@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2026030518510299d89a2bed0002074d
        for <openembedded-core@lists.openembedded.org>;
        Thu, 05 Mar 2026 19:51:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=gi1PNVudELRN1eUx7S7fvlaLAFXx+ZCa8V7kNT4r4wQ=;
 b=T0ENmFqr5IjTk5UbG8Gn1x1V3pgBzlw5kxncg7N0U5njZczo80HQX7jg1QoI2IyT2Gdfja
 atUH34xMmWlypQv4iirCd2+V/nrBO+uNdnR27zzqUZ8Z5ItVj+Nf1co/VhKq+UKVnEuPajBh
 KE5zOX628JPWUPz3rlXGkszcn4Fkwzj/EdhLQh6zX96zdbI6DtJFPy+weRRb78yxgL2k0lCh
 DktqIFQDPxuEs9KP2beCNqCWfFcS/KRzjMq/H5Ub/X4JrdRqrp2a0FluDU0OzC1z0FbKgNZQ
 ZOh86BOuimAK43h9KD/n88aRGsj9VCufNxHVmcVrnxAITdmpzYRRs9BQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][whinlatter][PATCH] inetutils: patch CVE-2026-28372
Date: Thu,  5 Mar 2026 19:50:56 +0100
Message-Id: <20260305185056.1493933-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 18:51:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232509

From: Peter Marko <peter.marko@siemens.com>

Pick patch according to [1] (equivalent to patch from [2]).

[1] https://security-tracker.debian.org/tracker/CVE-2026-28372
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-28372

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../inetutils/inetutils/CVE-2026-28372.patch  | 86 +++++++++++++++++++
 .../inetutils/inetutils_2.6.bb                |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-28372.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-28372.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-28372.patch
new file mode 100644
index 0000000000..b6d07b2902
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
+ * Noteworthy changes in release 2.6 (2025-02-21) [stable]
+ 
+ ** The release tarball is now reproducible.
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
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.6.bb b/meta/recipes-connectivity/inetutils/inetutils_2.6.bb
index 967ecdd442..29a40143a2 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.6.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.6.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://tftpd.xinetd.inetutils \
            file://CVE-2026-24061-01.patch \
            file://CVE-2026-24061-02.patch \
+           file://CVE-2026-28372.patch \
            "
 
 inherit autotools gettext update-alternatives texinfo

