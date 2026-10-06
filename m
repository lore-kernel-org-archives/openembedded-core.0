Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 805DACA5FED
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 16:02:00 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49213.1791302511995710806
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 09:01:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=HMLx36I7;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-2026100616014963565b2e1500020748-lomo4o@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2026100616014963565b2e1500020748
        for <openembedded-core@lists.openembedded.org>;
        Tue, 06 Oct 2026 18:01:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=44Qa/KfmIM+UsUC1zEGZ+FwxDhInGmGntxx1nUstQiI=;
 b=HMLx36I7I5DXJkauazNnpeBHtcgaBlAhq1/IXvFmz1JL8BUoP7eIWecGhcoFNB8cgyebRY
 udTBLxxe1JJu07LZJyulzRBxqP0LWPjNplUi+RCl26bI3+2DHhVIT9FLJNxDxeC2qKmtKtvD
 H4FbI1ayN9De4wKCsNtEbEcrR+G5dpyaFQY/KxD5CpQTdnu/VJuJZJFybPyzaz6xpvUkwepw
 996belnSoqw5x+vc7ibzwyKN7u8mmeVvYNtfNq6PEFt8vwCRLcG4bGMw8+gjeNh8CRJ4hFBS
 IiKsH7nE43CKR77Vf4lClwHMg9XN97uCnXHLVe1cuwKUBIKwP5GKkuYA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [blacksail][PATCH 1/2] popt: patch CVE-2026-18743
Date: Tue,  6 Oct 2026 18:01:30 +0200
Message-ID: <20261006160131.8547-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 16:02:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247310

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 6a47df77d4dda066f6c3651480546a79fd445ae6)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../popt/popt/CVE-2026-18743.patch            | 97 +++++++++++++++++++
 meta/recipes-support/popt/popt_1.19.bb        |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-support/popt/popt/CVE-2026-18743.patch

diff --git a/meta/recipes-support/popt/popt/CVE-2026-18743.patch b/meta/recipes-support/popt/popt/CVE-2026-18743.patch
new file mode 100644
index 0000000000..d57a39b470
--- /dev/null
+++ b/meta/recipes-support/popt/popt/CVE-2026-18743.patch
@@ -0,0 +1,97 @@
+From ea2092edba8d6c1a9acd60d9fd7a587c624d6ffe Mon Sep 17 00:00:00 2001
+From: Panu Matilainen <pmatilai@redhat.com>
+Date: Tue, 11 Aug 2026 11:45:44 +0300
+Subject: [PATCH] Fix CVE-2026-18743: buffer overflow(s) in
+ poptConfigFileToString()
+
+Fix the reallocation logic thinko, repeated twice in the function:
+if we need to reallocate, the current maximum value is not interesting
+in any way. Just allocate double the required size instead.
+
+The reproducer test is obviously closely tied to the initial buffer
+size of 480 and wouldn't work with other sizes, but with the current
+default this reliably crashes popt under ASAN prior to this fix.
+Also , the reproducer only exercises the first of these flaws.
+
+Fixes: CVE-2026-18743
+
+CVE: CVE-2026-18743
+Upstream-Status: Backport [https://github.com/rpm-software-management/popt/commit/ea2092edba8d6c1a9acd60d9fd7a587c624d6ffe]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/poptparse.c            | 10 ++++------
+ tests/test3-data/05.answer |  5 +++++
+ tests/test3-data/05.input  |  2 ++
+ tests/testit.sh            |  1 +
+ 4 files changed, 12 insertions(+), 6 deletions(-)
+ create mode 100644 tests/test3-data/05.answer
+ create mode 100644 tests/test3-data/05.input
+
+diff --git a/src/poptparse.c b/src/poptparse.c
+index f405081..c2a5435 100644
+--- a/src/poptparse.c
++++ b/src/poptparse.c
+@@ -139,7 +139,6 @@ int poptConfigFileToString(FILE *fp, char ** argstrp,
+     char * p;
+     char * q;
+     char * x;
+-    size_t t;
+     size_t argvlen = 0;
+     size_t maxlinelen = sizeof(line);
+     size_t linelen;
+@@ -186,9 +185,9 @@ int poptConfigFileToString(FILE *fp, char ** argstrp,
+ 	if (*q == '\0') {
+ 	    /* single command line option (ie, no name=val, just name) */
+ 	    q[-1] = '\0';		/* kill off newline from fgets() call */
+-	    argvlen += (t = (size_t)(q - p)) + (sizeof(" --")-1);
++	    argvlen += ((size_t)(q - p)) + (sizeof(" --")-1);
+ 	    if (argvlen >= maxargvlen) {
+-		maxargvlen = (t > maxargvlen) ? t*2 : maxargvlen*2;
++		maxargvlen = argvlen * 2;
+ 		argstr_tmp = realloc(argstr, maxargvlen);
+ 		if (argstr_tmp == NULL) {
+ 		    free(argstr);
+@@ -218,10 +217,9 @@ int poptConfigFileToString(FILE *fp, char ** argstrp,
+ 	    *x = '\0';	/* null out last char if space (including fgets() NL) */
+ 
+ 	/* rest of line accept */
+-	t = (size_t)(x - p);
+-	argvlen += t + (sizeof("' --='")-1);
++	argvlen += ((size_t)(x - p) + sizeof("' --='")-1);
+ 	if (argvlen >= maxargvlen) {
+-	    maxargvlen = (t > maxargvlen) ? t*2 : maxargvlen*2;
++	    maxargvlen = argvlen * 2;
+ 	    argstr_tmp = realloc(argstr, maxargvlen);
+ 	    if (argstr_tmp == NULL) {
+ 		free(argstr);
+diff --git a/tests/test3-data/05.answer b/tests/test3-data/05.answer
+new file mode 100644
+index 0000000..37b7fb8
+--- /dev/null
++++ b/tests/test3-data/05.answer
+@@ -0,0 +1,5 @@
++single string: ' --aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa --bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb'
++popt array: size=2
++'--aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
++'--bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb'
++
+diff --git a/tests/test3-data/05.input b/tests/test3-data/05.input
+new file mode 100644
+index 0000000..2508292
+--- /dev/null
++++ b/tests/test3-data/05.input
+@@ -0,0 +1,2 @@
++aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
++bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
+diff --git a/tests/testit.sh b/tests/testit.sh
+index 26724d6..4078f51 100755
+--- a/tests/testit.sh
++++ b/tests/testit.sh
+@@ -179,6 +179,7 @@ fi
+ run_diff test3 "test3 - 1" test3-data/01.input test3-data/01.answer
+ run_diff test3 "test3 - 2" test3-data/02.input test3-data/02.answer
+ run_diff test3 "test3 - 3" test3-data/03.input test3-data/03.answer
++run_diff test3 "test3 - 5" test3-data/05.input test3-data/05.answer
+ 
+ echo ""
+ echo "Passed."
diff --git a/meta/recipes-support/popt/popt_1.19.bb b/meta/recipes-support/popt/popt_1.19.bb
index 525bf553b1..3e9137c156 100644
--- a/meta/recipes-support/popt/popt_1.19.bb
+++ b/meta/recipes-support/popt/popt_1.19.bb
@@ -10,6 +10,7 @@ DEPENDS = "virtual/libiconv"
 
 SRC_URI = "http://ftp.rpm.org/popt/releases/popt-1.x/${BP}.tar.gz \
            file://run-ptest \
+           file://CVE-2026-18743.patch \
            "
 SRC_URI[sha256sum] = "c25a4838fc8e4c1c8aacb8bd620edb3084a3d63bf8987fdad3ca2758c63240f9"
 

