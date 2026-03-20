Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 369D41093174
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 00:28:39 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2619.1773966510773992120
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 17:28:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=VxkEDgUb;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-486ff201041so1763495e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 17:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773966509; x=1774571309; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OhEO0V90K/mXlLFn3x7bZAfVaJE/grxKR5d+d3IKTCI=;
        b=VxkEDgUb1TeCn8qlJzEhdZc4u36VnGRm4v0tpLETVkqok/FweyR26HXyIXL1bQLv23
         jHBxqnUSxcBVLdisPUrRHTO+j9OQOnPjYKtVU3CnXbyoLQiPjqE2o2LRIoyOZ41Vyr2L
         5FQTv/Nql3RyT1EHbosID4ngs+MPfPBDN1rgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773966509; x=1774571309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OhEO0V90K/mXlLFn3x7bZAfVaJE/grxKR5d+d3IKTCI=;
        b=pymEKcX9MjjWKSdF2w0l7QNPjPjh1OSAmPqWgPQ3vxugkZJL6+0qbGPVKPIUQzGvVP
         3dlgvcgUjWIWcd1J87fEXmzXrJMfNj+IZz8a830X+NuZ6HejYPtlJgiMDx2gfKq9NLTx
         sVBn1zeZsCvsq0QbdLH+ySwrtPKZa6xM6EHlOKm3GwftQZV3yWoHRUEZL7HW1nQShhgR
         aSxv77sBLcOtHqKI9ZppfPpDjSbOvq+vSVXYjwAJof5An0CHkBrceoDW8VSqG+yEl/yH
         XtXXXpYsC09UFBhw5Sgx2W4C8CcuNtVitnbxfSUW0dOUoruP23r1Cv0IaKgwuYcDGiBH
         +UTA==
X-Gm-Message-State: AOJu0YyeT5uwPZRbqz839zhtTspt0FX2ekMEMB5PA0TdL+QWZ3i3ZHF9
	wcRYeVxZH/n0EC7anaotYiywh+76G/K0Z4OCk8RO0z5MR/pK1ybe6V8MFIeAoPWuSrGtvQXO2hV
	1omkL
X-Gm-Gg: ATEYQzyWKfijigExTPj+RXymVT6FM64xkzyX6xONWRJAETDph9iWh8nSAEaSOwxGDcu
	m9/8vYxk2xbz68z0Nx6bpDvPEo8ynURxybX+rsto5cmOR2AdnRErUoQ4sYs+3KK8BMk7wxLDcjB
	7OMaswvhfXiXYocL0T0BRDGrPZjD1EQWIwtGqEoTwGmcvzxqL8M66hWsXgETU/jypoHp2JZKQCN
	ZJYd7j2oKSGX9ECF1j0hLVKHCYuZPGMI3cpWEbgiWlCdIQYz3VL2kKv1UomLWQM4bhvSN+OzYJS
	EgD4H0NBDYp0Ct/CXcauwdk8DN+NLS00ITnc2Oe5ydfd67mRkFSkvpozd5B/10qRklZvtWD+UOD
	YVpGMPsAOhxHImZtnwE9s2SrZpLrxC8A/aqmlO/iAPrkcMAkCelfNxw3aSvHkSloFq4gsJ4UYC8
	YCBQ6OHNr4dyX+KLuVlodPuAqUZObzPv9z1c6WNYhx+W5wC+2jxJ+nwXZRKNiOM8MblsVl3IPBf
	yftJquYaiWO5KiZb5qnv9WKG0cVHLzYmJbGTQ==
X-Received: by 2002:a05:600c:c167:b0:477:a1a2:d829 with SMTP id 5b1f17b1804b1-486fedc9a52mr16051795e9.13.1773966508777;
        Thu, 19 Mar 2026 17:28:28 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe8359acsm23850655e9.12.2026.03.19.17.28.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 17:28:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/15] inetutils: patch CVE-2026-28372
Date: Fri, 20 Mar 2026 01:28:08 +0100
Message-ID: <ed976c159eab45e6ca1f8e1ba73c5872818e80d2.1773966414.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773966414.git.yoann.congal@smile.fr>
References: <cover.1773966414.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 00:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233562

From: Peter Marko <peter.marko@siemens.com>

Pick patch according to [1] (equivalent to patch from [2]).

This CVE is needed if util-linux >= 2.40 is used which is not the case
in Yocto kirkstone, however it's always possible that users update
packages in their layers.

[1] https://security-tracker.debian.org/tracker/CVE-2026-28372
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-28372

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../inetutils/inetutils/CVE-2026-28372.patch  | 86 +++++++++++++++++++
 .../inetutils/inetutils_2.5.bb                |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-28372.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-28372.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-28372.patch
new file mode 100644
index 00000000000..4e6bf0c87ca
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
+ * Noteworthy changes in release 2.5 (2023-12-29) [stable]
+ 
+ ** ftpd, rcp, rlogin, rsh, rshd, uucpd
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
+@@ -130,6 +130,14 @@ start_login (char *host, int autologin, char *name)
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
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.5.bb b/meta/recipes-connectivity/inetutils/inetutils_2.5.bb
index 486878022f0..6c53902356f 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.5.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.5.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://tftpd.xinetd.inetutils \
            file://CVE-2026-24061-1.patch \
            file://CVE-2026-24061-2.patch \
+           file://CVE-2026-28372.patch \
            "
 
 inherit autotools gettext update-alternatives texinfo

