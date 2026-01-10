Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA5DD277E8
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 13:22:04 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8352.1768051319741962258
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Jan 2026 05:22:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=JnxwAIjy;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260110132156b88f8198eb000207e3-xhokgp@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260110132156b88f8198eb000207e3
        for <openembedded-core@lists.openembedded.org>;
        Sat, 10 Jan 2026 14:21:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=BaLQ9bNOFdPWC2IVCPBA3efcbytX8OUS7uWFE7m4mqA=;
 b=JnxwAIjyc29m7sJTX4UUvsd4BBWUOpHPrI2jk/oLTKbGU28hDUee357q2sNS7mcEcZmtHb
 JHDd/37HgT3d8nasZEVEuqPWOFAlKIBI7251yjDPHgTGPnY6oZctp0hsl439URun+tMUVlEc
 8u+4Tsn4LBOcMHYiwMgOjWSyQMC6YE9fhOw1MPQJ7iVX3Oelo5edhqIDVULFa2GQyAqqQlnx
 F2O4WQPjueQRzZSiM/IewVy+QImkThml3dykHWKWvbOKo+a59Ce4Ey0PqrQ0EaORXXe/CI54
 q91I7LCOVa32/YICakTRvOvtX3dOAE1SuVSJRJAqPGBFsadM8ZjOxhUg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Steve Sakoman <steve@sakoman.com>
Subject: [OE-core][whinlatter][PATCH] util-linux: patch CVE-2025-14104
Date: Sat, 10 Jan 2026 14:21:52 +0100
Message-Id: <20260110132152.1747486-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Jan 2026 13:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229151

From: Peter Marko <peter.marko@siemens.com>

Pick patches per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2025-14104

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |  2 ++
 .../util-linux/CVE-2025-14104-01.patch        | 33 +++++++++++++++++++
 .../util-linux/CVE-2025-14104-02.patch        | 28 ++++++++++++++++
 3 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2025-14104-01.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2025-14104-02.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index e7a3c5be9f..3135bbb7c6 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -21,6 +21,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch \
            file://0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch \
            file://0001-include-mount-api-utils-avoid-using-sys-mount.h.patch \
+           file://CVE-2025-14104-01.patch \
+           file://CVE-2025-14104-02.patch \
            "
 
 SRC_URI[sha256sum] = "be9ad9a276f4305ab7dd2f5225c8be1ff54352f565ff4dede9628c1aaa7dec57"
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2025-14104-01.patch b/meta/recipes-core/util-linux/util-linux/CVE-2025-14104-01.patch
new file mode 100644
index 0000000000..23677345c9
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2025-14104-01.patch
@@ -0,0 +1,33 @@
+From aaa9e718c88d6916b003da7ebcfe38a3c88df8e6 Mon Sep 17 00:00:00 2001
+From: Mohamed Maatallah <hotelsmaatallahrecemail@gmail.com>
+Date: Sat, 24 May 2025 03:16:09 +0100
+Subject: [PATCH] Update setpwnam.c
+
+CVE: CVE-2025-14104
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/aaa9e718c88d6916b003da7ebcfe38a3c88df8e6]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ login-utils/setpwnam.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/login-utils/setpwnam.c b/login-utils/setpwnam.c
+index 3e3c1abde..95e470b5a 100644
+--- a/login-utils/setpwnam.c
++++ b/login-utils/setpwnam.c
+@@ -126,10 +126,12 @@ int setpwnam(struct passwd *pwd, const char *prefix)
+ 		}
+ 
+ 		/* Is this the username we were sent to change? */
+-		if (!found && linebuf[namelen] == ':' &&
+-		    !strncmp(linebuf, pwd->pw_name, namelen)) {
+-			/* Yes! So go forth in the name of the Lord and
+-			 * change it!  */
++		if (!found &&
++		    strncmp(linebuf, pwd->pw_name, namelen) == 0 &&
++		    strlen(linebuf) > namelen &&
++		    linebuf[namelen] == ':') {
++			/* Yes! But this time let’s not walk past the end of the buffer
++			 * in the name of the Lord, SUID, or anything else. */
+ 			if (putpwent(pwd, fp) < 0)
+ 				goto fail;
+ 			found = 1;
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2025-14104-02.patch b/meta/recipes-core/util-linux/util-linux/CVE-2025-14104-02.patch
new file mode 100644
index 0000000000..9d21db2743
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2025-14104-02.patch
@@ -0,0 +1,28 @@
+From 9a36d77012c4c771f8d51eba46b6e62c29bf572a Mon Sep 17 00:00:00 2001
+From: Mohamed Maatallah <hotelsmaatallahrecemail@gmail.com>
+Date: Mon, 26 May 2025 10:06:02 +0100
+Subject: [PATCH] Update bufflen
+
+Update buflen
+
+CVE: CVE-2025-14104
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/9a36d77012c4c771f8d51eba46b6e62c29bf572a]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ login-utils/setpwnam.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/login-utils/setpwnam.c b/login-utils/setpwnam.c
+index 95e470b5a..7778e98f7 100644
+--- a/login-utils/setpwnam.c
++++ b/login-utils/setpwnam.c
+@@ -99,7 +99,8 @@ int setpwnam(struct passwd *pwd, const char *prefix)
+ 		goto fail;
+ 
+ 	namelen = strlen(pwd->pw_name);
+-
++	if (namelen > buflen)
++		buflen += namelen;
+ 	linebuf = malloc(buflen);
+ 	if (!linebuf)
+ 		goto fail;

