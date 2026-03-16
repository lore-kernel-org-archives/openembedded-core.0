Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A02E6F46433
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 09:30:09 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46601.1773653407249295582
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 02:30:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KHmlcNx2;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4852f8ac7e9so51650365e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 02:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773653405; x=1774258205; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQNIJ+4apFeSkKoE2KIKlfCENN1+qzqm+9JbtTU2HFg=;
        b=KHmlcNx2MxSNSABRsTYzDA6tYx7FpnkpwUD4Z8DuMqCYZ2KMKRZ2T5s/4bedEP9j1s
         4x3dx8FmpuTRycVcZMJunkVnlS8KiR1gs2zDwBwviEu908xYZEdQYeX5UUiNuQTmn0ro
         jHnEA/vHJkAIOmZWTKvsUMmze6R45zU1XupU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653405; x=1774258205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qQNIJ+4apFeSkKoE2KIKlfCENN1+qzqm+9JbtTU2HFg=;
        b=hV3L6XFUGb811HqTbxqbMjhVVVNzX39zcDVX2FNRYde1grJiCUNaBtathsEUax8Ir0
         GL/HaEkwhRhy3YpjCT3IXtWiEtGH+QabDQRRphe9YQSa9pHTjdUzBCpqdz1sL0UDIOM3
         +rcb/FgHi4dLOW1B/BNzT6VKIZcwMwzLC2h6Sbo16lH3XhV0YMhEj/4923IV14D4fHvk
         KP+SFZIeylJG2CEPXkbddb+akbvBWiY7STlUV0jeH7vy1pfV7DNy8gtgM/M5lGNx2jej
         tqZr37yn2tdltzioPUcpnvlG6qDB8jrdufkGDVrwFw/o/kDAz+LTVDXAMSYX15XZrhYW
         xe+g==
X-Gm-Message-State: AOJu0YzUcx9vrDevX5ERXnUPriyAcTaNoDeuDUTKzHjKS6B5/cIZwFbt
	s+ze6q9uwQ1Nllb8IOQ7LhaCqCUQ7v8x0FiUYSaVSJ7HwZungA/70rhZRNab1474r0ianQp8wz5
	PmXnc
X-Gm-Gg: ATEYQzyVyBLmuL8Em6AbpUe7LJNLlJFWMi1jfkfZpLYnFIK1wK/TCwYj3zx5d3gyvz3
	lLqszv8fxhd8dVEmwBQg/+bNdsB46hiYqb5O5sw+nOflZUjl0gZM86nTcZrHCFVBswg9WBULsnE
	lYNFPqCglogsDmpElcNy/IaILy781TUxI7t3QwWHWzLJB4AIOW1LXrbMCvg3d0c93X99jWEDzFs
	wmd1ituM16QnXeHn8gpPckDrd6EgN2thdb+BT9IPjwqhEySad6KS3EL9F+1a9xFejFYW3ZJYE56
	cdQQcdywOdOOEZm90Rljs2TotXG7SaNzlDXvohwrogVX89PVGwPgEW51GUuv93fLit4Pf8aZ3Nh
	EmpOzsKMpFc16v+BcIH+Tymsj/XTnFhkqS7gdij6YMEPIaxzVmGr+OA5vsQR+1HZvNAgoBg+WWw
	SjiBxsAkImoSIeCHJOnp7YrR+gScmfpMLtv2zHFgK5u0Z36H7f+6P8BImjV44H4qisixT7IRmq7
	8FzQhAFCgJqxbM998j5O7SuFI5V1jrjlg==
X-Received: by 2002:a05:600c:4f54:b0:485:353f:c651 with SMTP id 5b1f17b1804b1-48556702b4dmr202764035e9.22.1773653405147;
        Mon, 16 Mar 2026 02:30:05 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557a732cesm91138265e9.12.2026.03.16.02.30.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:30:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/17] inetutils: patch CVE-2026-28372
Date: Mon, 16 Mar 2026 10:28:24 +0100
Message-ID: <3f103e7164526c109bd9e5426026540d525eb5fd.1773652940.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773652940.git.yoann.congal@smile.fr>
References: <cover.1773652940.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 09:30:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233227

From: Peter Marko <peter.marko@siemens.com>

Pick patch according to [1] (equivalent to patch from [2]).

This CVE is needed if util-linux >= 2.40 is used which is not the case
in Yocto kirkstone, however it's always possible that users update
packages in their layers.

[1] https://security-tracker.debian.org/tracker/CVE-2026-28372
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-28372

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../inetutils/inetutils/CVE-2026-28372.patch  | 86 +++++++++++++++++++
 .../inetutils/inetutils_2.2.bb                |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-28372.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-28372.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-28372.patch
new file mode 100644
index 00000000000..b0038ab90f9
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
+ * Noteworthy changes in release 2.2 (2021-09-01) [stable]
+ 
+ ** ftp
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
+@@ -132,6 +132,14 @@ start_login (char *host, int autologin, char *name)
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
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.2.bb b/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
index 9f4e1a82e1b..c6e99ab09b3 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
@@ -26,6 +26,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://0002-CVE-2023-40303-Indent-changes-in-previous-commit.patch \
            file://CVE-2026-24061-01.patch \
            file://CVE-2026-24061-02.patch \
+           file://CVE-2026-28372.patch \
 "
 
 inherit autotools gettext update-alternatives texinfo

