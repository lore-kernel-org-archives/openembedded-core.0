Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 211B3C369C2
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 17:41:25 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.313.1745516478644544449
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 10:41:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=GSNi/3nq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20250424174116b81e5ead5075d5efc7-b9mqni@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20250424174116b81e5ead5075d5efc7
        for <openembedded-core@lists.openembedded.org>;
        Thu, 24 Apr 2025 19:41:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=2CRwnfmvOkFHM1cqMmBdT75lRsyIBLbNuDv0m3+Jlfk=;
 b=GSNi/3nqPLOZTJbTsTTv16OZaBu9sEngyXoCxRO1oZNFXBedn56lBFJT5zEVCtD+y3npR9
 ARWipf+ejUMom9SLJe42ASlo1VVDmyBZbFh16dYa9pI6IM3zmOCwa8QgDdPWW9l/I/tD2uTK
 N/nYjeJ69y6mVJNOCliCTMlvQNNJ56g5sfq6hCeeKwd0zR6KKKQ1Bcq7C+ntst4rdathIV7+
 3X5lAV5Ul61Ypy1rcWLcsFV3+sP8dpbHoHwXzw8/AS0GOrIC3RzxDm9GDB6drL5lUdfwMlfA
 1026MAMj5YBrDS8ZeUBQs0hcOc6eitLTrQlL3ghVUy7Oun/KY+LuBgAQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] ppp: patch CVE-2024-58250
Date: Thu, 24 Apr 2025 19:40:29 +0200
Message-Id: <20250424174029.2250456-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 17:41:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215397

From: Peter Marko <peter.marko@siemens.com>

Backport patch to remove vulnerable component.

This is a breaking change, but there will be no other fix for this CVE
as upstream did the deletion without providing a fix first.
If someone really needs this feature, which the commit message describes
as deprecated, bbappend with patch removal is possible.

License-Update: passprompt plugin removed

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../ppp/ppp/CVE-2024-58250.patch              | 185 ++++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.4.9.bb    |   2 +-
 2 files changed, 186 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/CVE-2024-58250.patch

diff --git a/meta/recipes-connectivity/ppp/ppp/CVE-2024-58250.patch b/meta/recipes-connectivity/ppp/ppp/CVE-2024-58250.patch
new file mode 100644
index 0000000000..b07d28253f
--- /dev/null
+++ b/meta/recipes-connectivity/ppp/ppp/CVE-2024-58250.patch
@@ -0,0 +1,185 @@
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
+ pppd/plugins/Makefile.linux |   2 +-
+ pppd/plugins/Makefile.sol2  |   6 --
+ pppd/plugins/passprompt.c   | 119 ------------------------------------
+ 3 files changed, 1 insertion(+), 126 deletions(-)
+ delete mode 100644 pppd/plugins/passprompt.c
+
+diff --git a/pppd/plugins/Makefile.linux b/pppd/plugins/Makefile.linux
+index 6403e3d..fcc36e4 100644
+--- a/pppd/plugins/Makefile.linux
++++ b/pppd/plugins/Makefile.linux
+@@ -17,7 +17,7 @@ CFLAGS += -DUSE_EAPTLS=1
+ SUBDIRS := pppoe pppoatm pppol2tp
+ # Uncomment the next line to include the radius authentication plugin
+ SUBDIRS += radius
+-PLUGINS := minconn.so passprompt.so passwordfd.so winbind.so
++PLUGINS := minconn.so passwordfd.so winbind.so
+ 
+ # This setting should match the one in ../Makefile.linux
+ MPPE=y
+diff --git a/pppd/plugins/Makefile.sol2 b/pppd/plugins/Makefile.sol2
+index bc7d85d..f77ea1d 100644
+--- a/pppd/plugins/Makefile.sol2
++++ b/pppd/plugins/Makefile.sol2
+@@ -17,11 +17,5 @@ minconn.so: minconn.o
+ minconn.o: minconn.c
+ 	$(CC) $(CFLAGS) -c $? 
+ 
+-passprompt.so: passprompt.o
+-	ld -o $@ $(LDFLAGS) -h $@ passprompt.o
+-
+-passprompt.o: passprompt.c
+-	$(CC) $(CFLAGS) -c $?
+-
+ clean:
+ 	rm -f *.o *.so
+diff --git a/pppd/plugins/passprompt.c b/pppd/plugins/passprompt.c
+deleted file mode 100644
+index 7779d51..0000000
+--- a/pppd/plugins/passprompt.c
++++ /dev/null
+@@ -1,119 +0,0 @@
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
+-#include <errno.h>
+-#include <unistd.h>
+-#include <sys/wait.h>
+-#include <syslog.h>
+-#include "pppd.h"
+-
+-char pppd_version[] = VERSION;
+-
+-static char promptprog[PATH_MAX+1];
+-static int promptprog_refused = 0;
+-
+-static option_t options[] = {
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
+-    int readgood, wstat;
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
+-	sys_close();
+-	closelog();
+-	close(p[0]);
+-	seteuid(getuid());
+-	setegid(getgid());
+-	argv[0] = promptprog;
+-	argv[1] = user;
+-	argv[2] = remote_name;
+-	sprintf(fdstr, "%d", p[1]);
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
+-	    if (errno == EINTR && !got_sigterm)
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
+-	if (errno != EINTR || got_sigterm) {
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
+-    add_options(options);
+-    pap_passwd_hook = promptpass;
+-#ifdef USE_EAPTLS
+-    eaptls_passwd_hook = promptpass;
+-#endif
+-}
diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.9.bb b/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
index b7f71b673d..e25929febf 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
@@ -7,7 +7,6 @@ BUGTRACKER = "http://ppp.samba.org/cgi-bin/ppp-bugs"
 DEPENDS = "libpcap openssl virtual/crypt"
 LICENSE = "BSD-3-Clause & BSD-3-Clause-Attribution & GPL-2.0-or-later & LGPL-2.0-or-later & PD & RSA-MD"
 LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=29;md5=e2c43fe6e81ff77d87dc9c290a424dea \
-                    file://pppd/plugins/passprompt.c;beginline=1;endline=10;md5=3bcbcdbf0e369c9a3e0b8c8275b065d8 \
                     file://pppd/tdb.c;beginline=1;endline=27;md5=4ca3a9991b011038d085d6675ae7c4e6 \
                     file://chat/chat.c;beginline=1;endline=15;md5=0d374b8545ee5c62d7aff1acbd38add2"
 
@@ -26,6 +25,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
            file://ppp@.service \
            file://0001-ppp-fix-build-against-5.15-headers.patch \
            file://CVE-2022-4603.patch \
+           file://CVE-2024-58250.patch \
            "
 
 SRC_URI[sha256sum] = "f938b35eccde533ea800b15a7445b2f1137da7f88e32a16898d02dee8adc058d"

