Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4543CD3B7DD
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 07:05:30 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2834.1765177524560636931
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Dec 2025 23:05:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=GwTataQ5;
 spf=pass (domain: mvista.com, ip: 209.85.210.177, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso4830920b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Dec 2025 23:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1765177524; x=1765782324; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p/DQKItCpemeFz97su7ZPN5BqXMJpJMd30ikAHiX9eQ=;
        b=GwTataQ5/3OX5XvRA1h4rTm49AanvD/CyNFoLom+Y4h3pxj1RH3JdKjTaXz/gwzPKN
         5TdcgHSejrKp/pqU+Ga89xFrPBk7Ab/kpaPWEnkVjizEWHLk9Fl5uA1ys1/TqcWg0lKC
         ArRGLYFdQOyvzxt4OVvrroN//R3Wa31ei7gHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765177524; x=1765782324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/DQKItCpemeFz97su7ZPN5BqXMJpJMd30ikAHiX9eQ=;
        b=NTc7DqLoyKMJJImcyaskM/+CM6n306A4v0wLQJ4q3i9IOlZIJfpM0vrNg5+2agOSi2
         aLviAnZFzS193PT+uLBn3rDiSnigOKiZNJa8c0cYd+9IUpqm3HHIr6UIiommfoqeXAK2
         YMKBnYDSfUV6RU4bPrUKcyyDHeoAJOK9UeRe4p5rT/bB0DCb50chRHEyqIlv19bzVEDv
         Dh2uVXS946++4CA/pQsvOofiKQSpj8sEfLjEGphznPxLya3J1mOHsH58zlBrMlJSemKJ
         y2cuhi244JHZI4/9VeRUeGwX0c1/CK9l/ONtMqgBW+4Mwbr9vooDU+XFEFui6VtsngO8
         l4Mg==
X-Gm-Message-State: AOJu0Yx2Igs3w7K2ai76RuzFoeOIzJi4H/o4dSc+jzR4K9dc2nhLCQPO
	fcudEcLeO5V31VYGYdA8jej+l3WUUaPprv0A1ycffXic2Rx61LohCsj56GOHvUVH5Wor/WIZqo2
	GMOWqCSQ=
X-Gm-Gg: ASbGnctSjOMiCl56cY0sBrY8sxol1FkJxoiEmANo+aXzGIWtfHA1gcmMzCQuAPTklLb
	K24XIGv8bh4tDwq0xX0FMLMuR6Hzd43eoY78l4jw8IaqF5bbEdZklLKG08wZH4xvczOOHAYsO76
	2zlzRXBLFEOfcFYVRt8BGUzLA2OUxXaeplPezDzmUqY9Y47XOMEC64Z2xRQTZ3GZJ3Z37PUiEzr
	v2ll3LmP3UcI4M6TI7yVs1/ue0YSCw35WkeJyi/WQCVAvwPpJiTmy/WY+zPmsyn8Tr/M2WPdcp+
	ft6a2EAArxCVQdvMHJCVMbfb7gKHR61I1O5lKK/8QlV2fQePnZpkFU/140IHzmgU4XjM0VOCLPM
	epNk0pOZwySOPlfFQQs9+mYoLvsDs/8gpm8wxj89sPXQK4FkrNRLhtuv5WpkYcUZEweH+l9JcXx
	LkSB09U4q8M71wBeI2CC3K5UA=
X-Google-Smtp-Source: AGHT+IG38D5MX/sm/eri+q49gZ8dfU2B6p+o/DAyKqrFnXut5R0/rH622aLF/0IRNzEbclId9vUIVQ==
X-Received: by 2002:a05:6a20:9392:b0:366:14ac:8c76 with SMTP id adf61e73a8af0-3661802a95fmr7345164637.76.1765177523596;
        Sun, 07 Dec 2025 23:05:23 -0800 (PST)
Received: from MVIN00013.mvista.com ([43.249.234.132])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf6a14f3fa0sm11127190a12.22.2025.12.07.23.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 23:05:23 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] openssh: fix CVE-2025-61984
Date: Mon,  8 Dec 2025 12:35:05 +0530
Message-ID: <20251208070505.156535-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Dec 2025 07:05:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227378

ssh in OpenSSH before 10.1 allows control characters in usernames that
originate from certain possibly untrusted sources, potentially leading
to code execution when a ProxyCommand is used. The untrusted sources
are the command line and %-sequence expansion of a configuration file.

Note:
openssh does not support variable expansion until 10.0, so backport
adapts for this.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-61984

Upstream-Status: Backport from https://github.com/openssh/openssh-portable/commit/35d5917652106aede47621bb3f64044604164043

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../openssh/openssh/CVE-2025-61984.patch      | 98 +++++++++++++++++++
 .../openssh/openssh_8.9p1.bb                  |  1 +
 2 files changed, 99 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2025-61984.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2025-61984.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2025-61984.patch
new file mode 100644
index 0000000000..aee237e507
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2025-61984.patch
@@ -0,0 +1,98 @@
+From 35d5917652106aede47621bb3f64044604164043 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Thu, 4 Sep 2025 00:29:09 +0000
+Subject: [PATCH] upstream: Improve rules for %-expansion of username.
+
+Usernames passed on the commandline will no longer be subject to
+% expansion. Some tools invoke ssh with connection information
+(i.e. usernames and host names) supplied from untrusted sources.
+These may contain % expansion sequences which could yield
+unexpected results.
+
+Since openssh-9.6, all usernames have been subject to validity
+checking. This change tightens the validity checks by refusing
+usernames that include control characters (again, these can cause
+surprises when supplied adversarially).
+
+This change also relaxes the validity checks in one small way:
+usernames supplied via the configuration file as literals (i.e.
+include no % expansion characters) are not subject to these
+validity checks. This allows usernames that contain arbitrary
+characters to be used, but only via configuration files. This
+is done on the basis that ssh's configuration is trusted.
+
+Pointed out by David Leadbeater, ok deraadt@
+
+OpenBSD-Commit-ID: e2f0c871fbe664aba30607321575e7c7fc798362
+
+CVE: CVE-2025-61984
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/35d5917652106aede47621bb3f64044604164043]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ ssh.c | 11 +++++++++++++++--
+ 1 file changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/ssh.c b/ssh.c
+index 82ed15f..d4e2040 100644
+--- a/ssh.c
++++ b/ssh.c
+@@ -634,6 +634,8 @@ valid_ruser(const char *s)
+ 	if (*s == '-')
+ 		return 0;
+ 	for (i = 0; s[i] != 0; i++) {
++		if (iscntrl((u_char)s[i]))
++			return 0;
+ 		if (strchr("'`\";&<>|(){}", s[i]) != NULL)
+ 			return 0;
+ 		/* Disallow '-' after whitespace */
+@@ -655,6 +657,7 @@ main(int ac, char **av)
+ 	struct ssh *ssh = NULL;
+ 	int i, r, opt, exit_status, use_syslog, direct, timeout_ms;
+ 	int was_addr, config_test = 0, opt_terminated = 0, want_final_pass = 0;
++	int user_on_commandline = 0, user_was_default = 0, user_expanded = 0;
+ 	char *p, *cp, *line, *argv0, *logfile, *host_arg;
+ 	char cname[NI_MAXHOST], thishost[NI_MAXHOST];
+ 	struct stat st;
+@@ -995,8 +998,10 @@ main(int ac, char **av)
+ 			}
+ 			break;
+ 		case 'l':
+-			if (options.user == NULL)
++			if (options.user == NULL) {
+ 				options.user = optarg;
++				user_on_commandline = 1;
++			}
+ 			break;
+ 
+ 		case 'L':
+@@ -1099,6 +1104,7 @@ main(int ac, char **av)
+ 			if (options.user == NULL) {
+ 				options.user = tuser;
+ 				tuser = NULL;
++				user_on_commandline = 1;
+ 			}
+ 			free(tuser);
+ 			if (options.port == -1 && tport != -1)
+@@ -1113,6 +1119,7 @@ main(int ac, char **av)
+ 				if (options.user == NULL) {
+ 					options.user = p;
+ 					p = NULL;
++					user_on_commandline = 1;
+ 				}
+ 				*cp++ = '\0';
+ 				host = xstrdup(cp);
+@@ -1265,8 +1272,10 @@ main(int ac, char **av)
+ 	if (fill_default_options(&options) != 0)
+ 		cleanup_exit(255);
+ 
+-	if (options.user == NULL)
++	if (options.user == NULL) {
++		user_was_default = 1;
+ 		options.user = xstrdup(pw->pw_name);
++	}
+ 
+ 	/*
+ 	 * If ProxyJump option specified, then construct a ProxyCommand now.
+-- 
+2.50.1
+
diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
index 780ece8999..6ba85712b3 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
@@ -40,6 +40,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2025-26465.patch \
            file://CVE-2025-32728.patch \
            file://CVE-2025-61985.patch \
+           file://CVE-2025-61984.patch \
            "
 SRC_URI[sha256sum] = "fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdaccd262380ae58bec5e7"
 
-- 
2.50.1


