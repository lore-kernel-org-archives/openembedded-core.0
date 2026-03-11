Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84000112588E
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 19:27:43 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4760.1773257259934943888
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 12:27:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KorTsbTe;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso198216f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 12:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773257258; x=1773862058; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OUJuoLsJCtyZedY5zcPchDp30SV63UPwZC42BOCtcIk=;
        b=KorTsbTerQp/3WRzbAr0FdOI/VHY8v6cpwiXjFk5AhsihRQgTjShF62dhV9Kw1paQ5
         3441OMUVcE2rcycbZXUWDZQQeRliX6Bu9d96/X5uzBO8lV26Shl03d0RfdWusYEqWLiI
         IP6giFAelaCGWlfgRMc+ti8RVAtOlRw+MQYUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257258; x=1773862058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OUJuoLsJCtyZedY5zcPchDp30SV63UPwZC42BOCtcIk=;
        b=eib0fkwRNKjPF+ueVEkXVc4fWNemXcuU8RBnS6jQoSBFZuKKRhmsLH9bIaUn9owvwq
         fNZxqNMTAQ1alvdDMXD8ts+spEnz87QuEhtyQus4F4y1OxIb2Z8GhxOgaHb/j+HhXi+V
         1/fd7ZO4d6zUp0apbEvcMrU3YxCncYIzVYNq/ctUQru+g1yz+i1hCrBTCphiQZXudwgX
         aCLGuJlK8ZsYpZR5BvqrjWXJUGIdx0LRJ7JjIW7mB/IivDpO4foek3u9G1Mt2I4ASw3r
         B/ewNtdVXQeqM5KPCuDqBYq++TvL8Gi60VogyBx1Nt2rtSV2rT9ML69hYmfTvf56+6Hs
         3ovA==
X-Gm-Message-State: AOJu0YyoAlifIM3huDS1z0ChnJQBoODhiWu4CmTfIXk2HJOFX0iIQe2J
	buLVECzm+QMAsiAhgKs/+sMfrPRe8quxbwZlxODmXgyhbGMpWjGBvF4O2tKaoBYZw6uY/aBCr67
	tS8q4
X-Gm-Gg: ATEYQzxpZ5aKWSCHCx5fjruiV0RfftAmTW03LY0Sjro+r2dPE5Ja4ZksY2nkY0aPkwP
	+7gvf1mYSJFNtklr4AGONVXfxzF1Hv4Rm66qA0WYOnrVs+VbiDX9lqvIrXRbdb8U76GONlW5wRP
	LRXlMCVdE+T75bDCTJsZFa/jllIaCBdmXP4vA4jmVc1bUEe2c8hxemuXhgrZk5yIS3o9UqOV/BS
	oNDTtOYApWuuN3o2aSrWD8EqthpxIReoG7ZyDPpvrYkp35FaR7w8NwCh/ojbwW2lwKmSHeXlrCp
	tcLmRj7tIQ+HYyDL2Tp/++OPK5kAZ4Vb8pML6RvAjAiGsmldWzGQAfgEKB+PZ3EBL/nXqsArlNJ
	YDR6XXPZbdycUc+PoLC7vtzn8D9wNlgzJB0q3dd6gwg+CgBpsCb5RGja+V7idyYnz4i59YZbUWV
	+ir+L1sce8HUXgI26MKCGm4jcN/WALSNwqtJl4ivB8WJjz+TAtT2Yp6asHa0phJyXeYevd03Nii
	YZhdeGwVoV7n291DOSveiMOCw4=
X-Received: by 2002:a05:6000:2508:b0:439:ccd7:cde1 with SMTP id ffacd0b85a97d-439f81e7d29mr7558235f8f.14.1773257257893;
        Wed, 11 Mar 2026 12:27:37 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe22f3a4sm1452450f8f.38.2026.03.11.12.27.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:27:37 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 2/6] inetutils: patch CVE-2026-28372
Date: Wed, 11 Mar 2026 20:27:04 +0100
Message-ID: <971eca1ca9625cb7b3aeab756fde6425568cbd70.1773257124.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773257124.git.yoann.congal@smile.fr>
References: <cover.1773257124.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 19:27:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232901

From: Peter Marko <peter.marko@siemens.com>

Pick patch according to [1] (equivalent to patch from [2]).

[1] https://security-tracker.debian.org/tracker/CVE-2026-28372
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-28372

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../inetutils/inetutils/CVE-2026-28372.patch  | 86 +++++++++++++++++++
 .../inetutils/inetutils_2.6.bb                |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-28372.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-28372.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-28372.patch
new file mode 100644
index 00000000000..b6d07b2902d
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
index 967ecdd4426..29a40143a28 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.6.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.6.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://tftpd.xinetd.inetutils \
            file://CVE-2026-24061-01.patch \
            file://CVE-2026-24061-02.patch \
+           file://CVE-2026-28372.patch \
            "
 
 inherit autotools gettext update-alternatives texinfo

