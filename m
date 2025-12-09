Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34600D3B9A8
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 21:53:23 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2557.1765317200955910996
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 13:53:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dHeKZkcf;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-34a4079cfaeso1678669a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 13:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1765317200; x=1765922000; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uxpo+ePC9VABm+CJ0P9Vb5Etcjh7bRRZuSYiKKw3jYg=;
        b=dHeKZkcf1p1BWFwtxlwEdUuy1+JOhShKGwznJiroVAL1fDslwKBU5R2Hv2OoEFzvNq
         ifyt0D8WDcxCcjEBWk9TaILzzNPWYQorqihOazFTRIRhTArazsy2YVIrqecyuHp3/LXP
         mJRdY5Ch5zwmIzdZKnfUFPcjAu4ri2Ntpjjm0/r3BL5QqRvrtXO80DO2fkTCEjYmEJeD
         OlAC47ndGXUBySlV5MHcR7jDMGjTuTwgfllquGo4k1Qw+pgkKaOAmxbZ9JJApOPfhuh2
         MVVzSQxw/2Rl8TqHp1GkjNGAxxSiGLJHGtdSYsPUUgsQ59u+4xLtFL/79NH8HnSqbHXr
         2wng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765317200; x=1765922000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Uxpo+ePC9VABm+CJ0P9Vb5Etcjh7bRRZuSYiKKw3jYg=;
        b=b/N8+BxfwARTomrWSi5OGMi83qoPqyI6Iki2RC6i1XZg+qH6wh4nOSDGg/D0oAvv/m
         7IxbCWMk5/oz3a/sfU9Ux/kgFdVFQA3SIawT0bFm060LR6dwhS4BvCA9dEEF4DJfHJq0
         nvABXkhe7Tn1l/Ys3QDd2whP8Mye09je8WSAwS6Aw4i0PngDB7MLljEl6pTHMdqAKEg2
         BAGD5R9iLWTJ9lGBlrIap1w4/YlMlt9fJKbzUwoaNlF5Sxi5uadllPIhX2V38yO3wKOl
         oOAahx1HvzhFUyFO27JmyLH85WV3vC97TIjDFuBHY7AouXTXiEPSCeaJP07Rq2Gj8Ed1
         BfLw==
X-Gm-Message-State: AOJu0Yw2hgF4hjLgKglVVgJzQlrdfol5iqDPoxWgnZjEdZclN2+7ghMv
	ttOhAZ8S1v/r4ua0pV+DafBw/J1m9cx/EwNwpY1/+HSx0V696pSInMUDO2S3bX5gDqgoiO+nr8P
	ED2QT
X-Gm-Gg: AY/fxX6T+zlOtLUHBbbrflefdj10NYWQpK3CRaOqopUe8UKOwGGC36GccW/zzAF29V0
	Wm3EzhREz/1T9rrKizkkuVRX7JLGNIodqOnfwNIgdOfmTxE8UBnLucy1Wclyeja/hkqcYYqU1VQ
	n02m/IQzjhWbTKc/YzdQrxsIVukidKoAX48T+wsaQyZZ3omVVEy6kW1SXELbNB3CuVEHcr3t3IP
	w2ybplTkoFKtQaD6goCst7wqsQf2bC/oqIYPdGbwhXhkHEOpHaZV7vhta6f0aD6SMDnt7ZVKpzZ
	H9c/KfzpbMDyCKHvnM5gscaX2isy2PqDaj84/LZc9EvI3YDyAK/4VWlDvMYwm2k6qUfd73feBen
	71B1OXBcAQ2T4k0ZCtOwC9DRNEIZIn0tlHdqTqE/+iSDwqEC9EdKtvjHze6Gm6O91y+DHXTnqoO
	aPPA==
X-Google-Smtp-Source: AGHT+IH70BSgwvH9wW5vt8rvHmygANAgorhFzSQtY4Fl1d6Q/RqGbm12VFlHKPs4KzKtuJ3p82n7lg==
X-Received: by 2002:a17:90b:3e46:b0:340:f05a:3ec3 with SMTP id 98e67ed59e1d1-34a7285c684mr221557a91.33.1765317200133;
        Tue, 09 Dec 2025 13:53:20 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:5aef:241f:68f0:d970])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a6ff012e6sm412296a91.2.2025.12.09.13.53.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 13:53:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/4] openssh: fix CVE-2025-61984
Date: Tue,  9 Dec 2025 13:53:06 -0800
Message-ID: <7ca0c7a4d17c707658669e255689ecd4183c7e9b.1765317045.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765317045.git.steve@sakoman.com>
References: <cover.1765317045.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 21:53:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227450

From: Hitendra Prajapati <hprajapati@mvista.com>

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


