Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E02C433F5
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 02:28:47 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web10.2624.1648607326369535497
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 19:28:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=4pXyUtsM;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.193,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f193.google.com with SMTP id h19so16546419pfv.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 19:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=nSRM8f6PRVA7QkQQQHu4TgAnW64sEnrAnOuwf7huxbg=;
        b=4pXyUtsM2vmu0lrFu808KjP1BJHffAUOKsuYqKktkkJdH4JgpLE7lsyXUJQohoSsP2
         PvJOe9ble0g7tGigYgCBr1fkw41s6x3MDT/fj+zP3nv+sYDR6dGgj6tDN88KaDNJtclb
         ggHxMBy7CRBUBCfFq3L+cv9PYkPPxT7aikQacHffRM4473Q3HTDkk6PDtXjYMe08m1zF
         qxxo7AcUfkskRvZGwSclg72d504HHZW3vzIe8ayUu3ZGQ35wMnng716GDmH2DNXqqNgZ
         Q1XdCfpG8AQrv0zTTbRnSyBEa2VpTgFG9GU8KNS9asWhHSKoU4/Qe9y9IVK9lCLI96IO
         1Bog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nSRM8f6PRVA7QkQQQHu4TgAnW64sEnrAnOuwf7huxbg=;
        b=3Ccw2FFSsmLpl3K0qkdYJRoAHRzY/1lRtmMQznAW/PojA5BUMGfdi+KaQOjGHyko6C
         aKuYQDUKLVhqRHX5YPziMaT9mJXt68oWPSSZMG4CCKcRLa0N01fT5/SFCz+hgq1uQYZr
         LmXgKfUHNmdhmOPxdQSY/PCG4W4QgL8OtL6kqbLuMkaiSCy9zZ37d/jeoLkl63VEfbth
         Ue6m8T5+u0Qn/zruZg4iSQH01Fz3AmH7SVL6vi6b2LKamv30Ptml1fvLx63Mp1kxlvVR
         8crIapjAmNGiefMJcuq+rrAmQ24pSVVGv2+4rA1uSXAwch1RU2725RakcnZVGJp2L4er
         e2zQ==
X-Gm-Message-State: AOAM532te0dkjr8UDj/77bNCaTMpumHX0ksW5+3uapwbmNWALGiSY9+g
	LqeGqW60NBVDDzbVTXjTSUeRETt9sTzBoMa20Hw=
X-Google-Smtp-Source: 
 ABdhPJzWsIXqF+KI92U0W8GuSDoLprgmoSqUyRoZqhb1PfccP9Qt5igfnMHusflKfxwaT9sjl+bq2g==
X-Received: by 2002:a63:9d08:0:b0:398:9129:ccbd with SMTP id
 i8-20020a639d08000000b003989129ccbdmr3576453pgd.298.1648607325238;
        Tue, 29 Mar 2022 19:28:45 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 kb13-20020a17090ae7cd00b001c7de069bacsm4643484pjb.42.2022.03.29.19.28.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 19:28:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/7] util-linux: fix CVE-2022-0563
Date: Tue, 29 Mar 2022 16:27:53 -1000
Message-Id: 
 <dffbf6301612ca91f6a1c306b9dde754b44912bb.1648596723.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1648596723.git.steve@sakoman.com>
References: <cover.1648596723.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 02:28:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163764

A flaw was found in the util-linux chfn and chsh utilities when compiled
with Readline support. The Readline library uses an "INPUTRC" environment
variable to get a path to the library config file. When the library cannot
parse the specified file, it prints an error message containing data from
the file. This flaw allows an unprivileged user to read root-owned files,
potentially leading to privilege escalation. This flaw affects util-linux
versions prior to 2.37.4.

Backport patch from upstream:
https://github.com/util-linux/util-linux/commit/faa5a3a83ad0cb5e2c303edbfd8cd823c9d94c17

Patch required slight modifications to apply cleanly to util-linux 2.35.1

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../util-linux/util-linux/CVE-2022-0563.patch | 161 ++++++++++++++++++
 .../util-linux/util-linux_2.35.1.bb           |   1 +
 2 files changed, 162 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2022-0563.patch

diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2022-0563.patch b/meta/recipes-core/util-linux/util-linux/CVE-2022-0563.patch
new file mode 100644
index 0000000000..54b496ea3f
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2022-0563.patch
@@ -0,0 +1,161 @@
+From faa5a3a83ad0cb5e2c303edbfd8cd823c9d94c17 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 10 Feb 2022 12:03:17 +0100
+Subject: [PATCH] chsh, chfn: remove readline support [CVE-2022-0563]
+
+The readline library uses INPUTRC= environment variable to get a path
+to the library config file. When the library cannot parse the
+specified file, it prints an error message containing data from the
+file.
+
+Unfortunately, the library does not use secure_getenv() (or a similar
+concept) to avoid vulnerabilities that could occur if set-user-ID or
+set-group-ID programs.
+
+Reported-by: Rory Mackie <rory.mackie@trailofbits.com>
+Signed-off-by: Karel Zak <kzak@redhat.com>
+
+Upstream-status: Backport
+https://github.com/util-linux/util-linux/commit/faa5a3a83ad0cb5e2c303edbfd8cd823c9d94c17
+
+CVE: CVE-2022-0563
+
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+
+---
+ login-utils/Makemodule.am |  2 +-
+ login-utils/chfn.c        | 16 +++------------
+ login-utils/chsh.c        | 42 ++-------------------------------------
+ 3 files changed, 6 insertions(+), 54 deletions(-)
+
+diff --git a/login-utils/Makemodule.am b/login-utils/Makemodule.am
+index fac5bfc..73636af 100644
+--- a/login-utils/Makemodule.am
++++ b/login-utils/Makemodule.am
+@@ -82,7 +82,7 @@ chfn_chsh_sources = \
+ 	login-utils/ch-common.c
+ chfn_chsh_cflags = $(SUID_CFLAGS) $(AM_CFLAGS)
+ chfn_chsh_ldflags = $(SUID_LDFLAGS) $(AM_LDFLAGS)
+-chfn_chsh_ldadd = libcommon.la $(READLINE_LIBS)
++chfn_chsh_ldadd = libcommon.la
+ 
+ if CHFN_CHSH_PASSWORD
+ chfn_chsh_ldadd += -lpam
+diff --git a/login-utils/chfn.c b/login-utils/chfn.c
+index b739555..2f8e44a 100644
+--- a/login-utils/chfn.c
++++ b/login-utils/chfn.c
+@@ -56,11 +56,6 @@
+ # include "auth.h"
+ #endif
+ 
+-#ifdef HAVE_LIBREADLINE
+-# define _FUNCTION_DEF
+-# include <readline/readline.h>
+-#endif
+-
+ struct finfo {
+ 	char *full_name;
+ 	char *office;
+@@ -229,22 +224,17 @@ static char *ask_new_field(struct chfn_control *ctl, const char *question,
+ {
+ 	int len;
+ 	char *buf;
+-#ifndef HAVE_LIBREADLINE
+-	size_t dummy = 0;
+-#endif
+ 
+ 	if (!def_val)
+ 		def_val = "";
++
+ 	while (true) {
+ 		printf("%s [%s]: ", question, def_val);
+ 		__fpurge(stdin);
+-#ifdef HAVE_LIBREADLINE
+-		rl_bind_key('\t', rl_insert);
+-		if ((buf = readline(NULL)) == NULL)
+-#else
++
+ 		if (getline(&buf, &dummy, stdin) < 0)
+-#endif
+ 			errx(EXIT_FAILURE, _("Aborted."));
++
+ 		/* remove white spaces from string end */
+ 		ltrim_whitespace((unsigned char *) buf);
+ 		len = rtrim_whitespace((unsigned char *) buf);
+diff --git a/login-utils/chsh.c b/login-utils/chsh.c
+index a9ebec8..ee6ff87 100644
+--- a/login-utils/chsh.c
++++ b/login-utils/chsh.c
+@@ -58,11 +58,6 @@
+ # include "auth.h"
+ #endif
+ 
+-#ifdef HAVE_LIBREADLINE
+-# define _FUNCTION_DEF
+-# include <readline/readline.h>
+-#endif
+-
+ struct sinfo {
+ 	char *username;
+ 	char *shell;
+@@ -121,33 +116,6 @@ static void print_shells(void)
+ 	endusershell();
+ }
+ 
+-#ifdef HAVE_LIBREADLINE
+-static char *shell_name_generator(const char *text, int state)
+-{
+-	static size_t len;
+-	char *s;
+-
+-	if (!state) {
+-		setusershell();
+-		len = strlen(text);
+-	}
+-
+-	while ((s = getusershell())) {
+-		if (strncmp(s, text, len) == 0)
+-			return xstrdup(s);
+-	}
+-	return NULL;
+-}
+-
+-static char **shell_name_completion(const char *text,
+-				    int start __attribute__((__unused__)),
+-				    int end __attribute__((__unused__)))
+-{
+-	rl_attempted_completion_over = 1;
+-	return rl_completion_matches(text, shell_name_generator);
+-}
+-#endif
+-
+ /*
+  *  parse_argv () --
+  *	parse the command line arguments, and fill in "pinfo" with any
+@@ -198,20 +166,14 @@ static char *ask_new_shell(char *question, char *oldshell)
+ {
+ 	int len;
+ 	char *ans = NULL;
+-#ifdef HAVE_LIBREADLINE
+-	rl_attempted_completion_function = shell_name_completion;
+-#else
+ 	size_t dummy = 0;
+-#endif
++
+ 	if (!oldshell)
+ 		oldshell = "";
+ 	printf("%s [%s]\n", question, oldshell);
+-#ifdef HAVE_LIBREADLINE
+-	if ((ans = readline("> ")) == NULL)
+-#else
+ 	if (getline(&ans, &dummy, stdin) < 0)
+-#endif
+ 		return NULL;
++
+ 	/* remove the newline at the end of ans. */
+ 	ltrim_whitespace((unsigned char *) ans);
+ 	len = rtrim_whitespace((unsigned char *) ans);
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/util-linux/util-linux_2.35.1.bb b/meta/recipes-core/util-linux/util-linux_2.35.1.bb
index 96d5eca518..89dc564ecb 100644
--- a/meta/recipes-core/util-linux/util-linux_2.35.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.35.1.bb
@@ -15,6 +15,7 @@ SRC_URI += "file://configure-sbindir.patch \
             file://include-strutils-cleanup-strto-functions.patch \
             file://CVE-2021-3995.patch \
             file://CVE-2021-3996.patch \
+            file://CVE-2022-0563.patch \
 "
 SRC_URI[md5sum] = "7f64882f631225f0295ca05080cee1bf"
 SRC_URI[sha256sum] = "d9de3edd287366cd908e77677514b9387b22bc7b88f45b83e1922c3597f1d7f9"
-- 
2.25.1


