Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 612F4C369DC
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 03:00:27 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.8385.1745982017776801529
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 20:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TlDAbmCu;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-227d6b530d8so75007975ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 20:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745982017; x=1746586817; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yeupJoeCIuJlbxsUY9cNjOu6ai2LP/Se9UchHTx0yLE=;
        b=TlDAbmCuOnsT6pqzfuRLwenJwLjO8vyTj0bVJTvc6yoNAlckD/c/nyWBTC+Yjbd1ag
         1Wpq9BVU/siBI4JXiHeUicwrv8r17BHwK29ILnBTOVZQdOc7zTK1A8LCLKeJ+yMAYklj
         PLDXQS9OAL7Ef5d6ias8wdjHNqZeOHR9zf5VHBA4PErm9ed2DljMexk6uarClDkJYQ/i
         3N66HDlrry3UNKCXKkc/1dFzZ+EbIVkvxG0iTpdCLR99EWvaKYvYu9T0e0xEzJpCkPp4
         xzLkuZa1Vg88eT+zQt4ffv2aUCSrCFnPtBK4ptecPVf+cIjGf8UEhQpvrxInGb4KMp2V
         973Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745982017; x=1746586817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yeupJoeCIuJlbxsUY9cNjOu6ai2LP/Se9UchHTx0yLE=;
        b=XLb7fGiy5GIZuU1+R3/bWeLHJTSymeVAkxq0VQ0++NzcVMRT+4UoBarWJsixEGM0Z7
         DjOrtOffyqqGpVZmPxUQCgzNYoJVS1r6Qyn1oL/DKj4+j9zVSIWyZfwZWZb574azBDgc
         xiAc+PHj1Q20shKTMpXSM9ApCyAQzfTKMzZjyIQSOPtGcHQxTI1+ur/jLduVbX2FcXpV
         58BIUwXLxKGuR/tr0ub3Q1zvjbSSXychi04EprwUqsON+eowHFA81XUqlyK2mgWLsat7
         +Hg/n2IOkFzCTNS2h76N56WigMjBSgEC7VGH3MUqvOdTe8onMLYAG6i720L3sPY8kZEd
         g/EA==
X-Gm-Message-State: AOJu0Yy6kN30nBD33n1/7o0uw8Sq+B3vnzAdLfr/lD1mzn+7yeLtWXF8
	voSA62gf+xb3dA2E6qSY6C0G/o0AndGQ46fKWI+za9FLF5iZHPrUu7OfSVlDXshakvIuZai1sUa
	0
X-Gm-Gg: ASbGncuY88ZuO2YGsFovQNILEZ+8pdm29yzIcJ2VUWkkhb9xkzJJtJBaIk21zhP/WVi
	fCj9UfgwZXohGr17fr0+34x7SjeTGr87r5Mu5clmBrdzS+XHo39LQ3w/WJb1WgFYgPz2QJcKG5U
	XqEii83trNAKlADlq3xBnd4ULY0WN5tSpmB9EBD/BGdgJi9+G5/OpFYIJSunqr8sb+6emotjMs1
	CcEre9f8bNuwQiM8E3uX89t1flM/jNrpNn1Kly+PU5aPy2Pd2uEMl5ZmYEUynrv7oElLXucWN1x
	LZ5tNPn0jIBsau/wxbksDBUVD0DuS24dunGd+NjHqg==
X-Google-Smtp-Source: AGHT+IFyXLnEFGOV/h7Vn1jbpgz/WvLvklLol1MdI0iQw4WHTEyZX60TBI6eKYuVEDw+UuObvedX4w==
X-Received: by 2002:a17:903:2ec6:b0:22c:35c5:e30d with SMTP id d9443c01a7336-22df34dd0b9mr21951535ad.13.1745982016913;
        Tue, 29 Apr 2025 20:00:16 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34b:e5e0:c38a:7e03])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22de49dccd3sm30461175ad.123.2025.04.29.20.00.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 20:00:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/15] ppp: patch CVE-2024-58250
Date: Tue, 29 Apr 2025 19:59:50 -0700
Message-ID: <5350ef531ded14f0b4c32c211aaf993354be1ec9.1745981742.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745981742.git.steve@sakoman.com>
References: <cover.1745981742.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 03:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215708

From: Peter Marko <peter.marko@siemens.com>

Backport patch to remove vulnerable component.

This is a breaking change, but there will be no other fix for this CVE
as upstream did the deletion without providing a fix first.
If someone really needs this feature, which the commit message describes
as deprecated, bbappend with patch removal is possible.

License-Update: passprompt plugin removed

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
-- 
2.43.0


