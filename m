Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 310F6C369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 17:40:35 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.290.1745516427096261484
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 10:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=W7X4Qrdv;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20250424174023e9ee297d6991eba857-1apqtj@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250424174023e9ee297d6991eba857
        for <openembedded-core@lists.openembedded.org>;
        Thu, 24 Apr 2025 19:40:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=+pYuostTtqVuLHzrEVqjKtSmFeVMQWKDgpU0LlpHxR8=;
 b=W7X4Qrdvq+gSi1wk2kGt54QxZ0LO+jMJvKr9KUidZlDnCWu4yrL2/lC9Ldxx2kKH9UxdW7
 840KsRBXcpaMdM3gstXMHTVa7dqXR5G/LEoGXZD17iUN/xZOuac91AQEH6t9NVfC/vTN6y1M
 J37B1wJXsLeXhUjilwknbyfJVgdLZ8sR7zrxr13ZLjtLMBcS51E6wIjPb7XIWUCnhhY1l8G+
 Hw8xwZDfK0KMSLFl6pWJaXXtGY776R/i5ZCx5Cynm3BRtgJhb817guifU/fCtDrT330KvoT9
 iux6mTmL/BaWVljY8ohN7bCKYvHSbDkEUHc+Dnm6QBEevlJFLh8sIEoQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] ppp: patch CVE-2024-58250
Date: Thu, 24 Apr 2025 19:39:36 +0200
Message-Id: <20250424173936.2250399-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 17:40:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215396

From: Peter Marko <peter.marko@siemens.com>

Backport patch to remove vulnerable component.

This is a breaking change, but there will be no other fix for this CVE
as upstream did the deletion without providing a fix first.
If someone really needs this feature, which the commit message describes
as deprecated, bbappend with patch removal is possible.

License-Update: passprompt plugin removed

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../ppp/ppp/CVE-2024-58250.patch              | 194 ++++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.5.0.bb    |   2 +-
 2 files changed, 195 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/CVE-2024-58250.patch

diff --git a/meta/recipes-connectivity/ppp/ppp/CVE-2024-58250.patch b/meta/recipes-connectivity/ppp/ppp/CVE-2024-58250.patch
new file mode 100644
index 0000000000..55d36c5baa
--- /dev/null
+++ b/meta/recipes-connectivity/ppp/ppp/CVE-2024-58250.patch
@@ -0,0 +1,194 @@
+From 0a66ad22e54c72690ec2a29a019767c55c5281fc Mon Sep 17 00:00:00 2001
+From: Paul Mackerras <paulus@ozlabs.org>
+Date: Fri, 18 Oct 2024 20:22:57 +1100
+Subject: [PATCH] pppd: Remove passprompt plugin
+
+This is prompted by a number of factors:
+
+* It was more useful back in the dial-up days, but no-one uses dial-up
+  any more
+
+* In many cases there will be no terminal accessible to the prompter
+  program at the point where the prompter is run
+
+* The passwordfd plugin does much the same thing but does it more
+  cleanly and securely
+
+* The handling of privileges and file descriptors needs to be audited
+  thoroughly.
+
+Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
+
+CVE: CVE-2024-58250
+Upstream-Status: Backport [https://github.com/ppp-project/ppp/commit/0a66ad22e54c72690ec2a29a019767c55c5281fc]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ pppd/plugins/Makefile.am  |   6 +-
+ pppd/plugins/passprompt.c | 137 --------------------------------------
+ 2 files changed, 1 insertion(+), 142 deletions(-)
+ delete mode 100644 pppd/plugins/passprompt.c
+
+diff --git a/pppd/plugins/Makefile.am b/pppd/plugins/Makefile.am
+index 2826148..9480d51 100644
+--- a/pppd/plugins/Makefile.am
++++ b/pppd/plugins/Makefile.am
+@@ -1,4 +1,4 @@
+-pppd_plugin_LTLIBRARIES = minconn.la passprompt.la passwordfd.la winbind.la
++pppd_plugin_LTLIBRARIES = minconn.la passwordfd.la winbind.la
+ pppd_plugindir = $(PPPD_PLUGIN_DIR)
+ 
+ PLUGIN_CPPFLAGS = -I${top_srcdir}
+@@ -8,10 +8,6 @@ minconn_la_CPPFLAGS = $(PLUGIN_CPPFLAGS)
+ minconn_la_LDFLAGS = $(PLUGIN_LDFLAGS)
+ minconn_la_SOURCES = minconn.c
+ 
+-passprompt_la_CPPFLAGS = $(PLUGIN_CPPFLAGS)
+-passprompt_la_LDFLAGS = $(PLUGIN_LDFLAGS)
+-passprompt_la_SOURCES = passprompt.c
+-
+ passwordfd_la_CPPFLAGS = $(PLUGIN_CPPFLAGS)
+ passwordfd_la_LDFLAGS = $(PLUGIN_LDFLAGS)
+ passwordfd_la_SOURCES = passwordfd.c
+diff --git a/pppd/plugins/passprompt.c b/pppd/plugins/passprompt.c
+deleted file mode 100644
+index 7779d51..0000000
+--- a/pppd/plugins/passprompt.c
++++ /dev/null
+@@ -1,137 +0,0 @@
+-/*
+- * passprompt.c - pppd plugin to invoke an external PAP password prompter
+- *
+- * Copyright 1999 Paul Mackerras, Alan Curry.
+- *
+- *  This program is free software; you can redistribute it and/or
+- *  modify it under the terms of the GNU General Public License
+- *  as published by the Free Software Foundation; either version
+- *  2 of the License, or (at your option) any later version.
+- */
+-
+-#include <errno.h>
+-#include <unistd.h>
+-#include <sys/wait.h>
+-#include <sys/param.h>
+-#include <limits.h>
+-#include <stdio.h>
+-#include <syslog.h>
+-#include <stdarg.h>
+-#include <stdint.h>
+-#include <stdbool.h>
+-#include <string.h>
+-
+-#include <pppd/pppd.h>
+-#include <pppd/upap.h>
+-#include <pppd/eap.h>
+-#include <pppd/options.h>
+-
+-char pppd_version[] = PPPD_VERSION;
+-
+-static char promptprog[PATH_MAX+1];
+-static int promptprog_refused = 0;
+-
+-static struct option options[] = {
+-    { "promptprog", o_string, promptprog,
+-      "External PAP password prompting program",
+-      OPT_STATIC, NULL, PATH_MAX },
+-    { NULL }
+-};
+-
+-static int promptpass(char *user, char *passwd)
+-{
+-    int p[2];
+-    pid_t kid;
+-    int readgood, wstat, ret;
+-    ssize_t red;
+-
+-    if (promptprog_refused || promptprog[0] == 0 || access(promptprog, X_OK) < 0)
+-	return -1;	/* sorry, can't help */
+-
+-    if (!passwd)
+-	return 1;
+-
+-    if (pipe(p)) {
+-	warn("Can't make a pipe for %s", promptprog);
+-	return 0;
+-    }
+-    if ((kid = fork()) == (pid_t) -1) {
+-	warn("Can't fork to run %s", promptprog);
+-	close(p[0]);
+-	close(p[1]);
+-	return 0;
+-    }
+-    if (!kid) {
+-	/* we are the child, exec the program */
+-	char *argv[5], fdstr[32];
+-	ppp_sys_close();
+-	closelog();
+-	close(p[0]);
+-	ret = seteuid(getuid());
+-	if (ret != 0) {
+-		warn("Couldn't set effective user id");
+-	}
+-	ret = setegid(getgid());
+-	if (ret != 0) {
+-		warn("Couldn't set effective user id");
+-	}
+-	sprintf(fdstr, "%d", p[1]);
+-	argv[0] = promptprog;
+-	argv[1] = strdup(user);
+-	argv[2] = strdup(ppp_remote_name());
+-	argv[3] = fdstr;
+-	argv[4] = 0;
+-	execv(*argv, argv);
+-	_exit(127);
+-    }
+-
+-    /* we are the parent, read the password from the pipe */
+-    close(p[1]);
+-    readgood = 0;
+-    do {
+-	red = read(p[0], passwd + readgood, MAXSECRETLEN-1 - readgood);
+-	if (red == 0)
+-	    break;
+-	if (red < 0) {
+-	    if (errno == EINTR && !ppp_signaled(SIGTERM))
+-		continue;
+-	    error("Can't read secret from %s: %m", promptprog);
+-	    readgood = -1;
+-	    break;
+-	}
+-	readgood += red;
+-    } while (readgood < MAXSECRETLEN - 1);
+-    close(p[0]);
+-
+-    /* now wait for child to exit */
+-    while (waitpid(kid, &wstat, 0) < 0) {
+-	if (errno != EINTR || ppp_signaled(SIGTERM)) {
+-	    warn("error waiting for %s: %m", promptprog);
+-	    break;
+-	}
+-    }
+-
+-    if (readgood < 0)
+-	return 0;
+-    passwd[readgood] = 0;
+-    if (!WIFEXITED(wstat))
+-	warn("%s terminated abnormally", promptprog);
+-    if (WEXITSTATUS(wstat)) {
+-	    warn("%s exited with code %d", promptprog, WEXITSTATUS(wstat));
+-	    /* code when cancel was hit in the prompt prog */
+-	    if (WEXITSTATUS(wstat) == 128) {
+-	        promptprog_refused = 1;
+-	    }
+-	    return -1;
+-    }
+-    return 1;
+-}
+-
+-void plugin_init(void)
+-{
+-    ppp_add_options(options);
+-    pap_passwd_hook = promptpass;
+-#ifdef PPP_WITH_EAPTLS
+-    eaptls_passwd_hook = promptpass;
+-#endif
+-}
diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.0.bb b/meta/recipes-connectivity/ppp/ppp_2.5.0.bb
index badf22db97..b50795109f 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.5.0.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.5.0.bb
@@ -7,7 +7,6 @@ BUGTRACKER = "http://ppp.samba.org/cgi-bin/ppp-bugs"
 DEPENDS = "libpcap openssl virtual/crypt"
 LICENSE = "BSD-3-Clause & BSD-3-Clause-Attribution & GPL-2.0-or-later & LGPL-2.0-or-later & PD & RSA-MD"
 LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=29;md5=e2c43fe6e81ff77d87dc9c290a424dea \
-                    file://pppd/plugins/passprompt.c;beginline=1;endline=10;md5=3bcbcdbf0e369c9a3e0b8c8275b065d8 \
                     file://pppd/tdb.c;beginline=1;endline=27;md5=4ca3a9991b011038d085d6675ae7c4e6 \
                     file://chat/chat.c;beginline=1;endline=15;md5=0d374b8545ee5c62d7aff1acbd38add2"
 
@@ -24,6 +23,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
            file://provider \
            file://ppp@.service \
            file://0001-Revert-lock-path-to-var-lock-435.patch \
+           file://CVE-2024-58250.patch \
            "
 
 SRC_URI[sha256sum] = "5cae0e8075f8a1755f16ca290eb44e6b3545d3f292af4da65ecffe897de636ff"

