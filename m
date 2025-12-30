Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04136EE57C2
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 20:54:36 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.72755.1767128069054355138
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 12:54:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=gs71q8dJ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202512302054251eafd9ac860002075a-qq5gsj@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202512302054251eafd9ac860002075a
        for <openembedded-core@lists.openembedded.org>;
        Tue, 30 Dec 2025 21:54:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=wFXA7iEfZHOP7VXHvgKN9Sor/NHTgQyO97gi7qmnQtc=;
 b=gs71q8dJwN9068jfEchThJ++K9YkUG4nRJC1+y7ETODKBBMbxTQk+YwBVrluGbXQRQlKkk
 0JW2j5yS0CpYRG4i2Wj9pyAg+6OpyRmY840NF8v5Q4h46FahIXfTaV8BqGg5usR8/RtErn+V
 pTBVCUrqK8Wxo7aoCtZAR/c1oAPqaHisp/GHsl2oLaxC1vLkeXxXAoZ7QV6bl9fYpVi7e50X
 JF9UC3XOYkDTD9BS3QyWOyU1Zy/rNJJ7AFRozweAVn42sN3DQFXMeSC+NPqQfpph/EKeGaCh
 O5F3/jg+7z6X3bWCWdcWXMsP4qwG7Hx+KtUTRuKcpyQGw6JvNYnooq8Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] util-linux: patch CVE-2025-14104
Date: Tue, 30 Dec 2025 21:54:12 +0100
Message-Id: <20251230205412.3095904-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 20:54:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228722

From: Peter Marko <peter.marko@siemens.com>

Pick patches per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2025-14104

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |  2 ++
 .../util-linux/CVE-2025-14104-01.patch        | 33 +++++++++++++++++++
 .../util-linux/CVE-2025-14104-02.patch        | 28 ++++++++++++++++
 3 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2025-14104-01.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2025-14104-02.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index ccab4b17f41..4797682c5d5 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -44,6 +44,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://CVE-2024-28085-0002.patch \
 	   file://fstab-isolation.patch \
            file://sys-utils-hwclock-rtc-fix-pointer-usage.patch \
+           file://CVE-2025-14104-01.patch \
+           file://CVE-2025-14104-02.patch \
            "
 
 SRC_URI[sha256sum] = "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f"
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2025-14104-01.patch b/meta/recipes-core/util-linux/util-linux/CVE-2025-14104-01.patch
new file mode 100644
index 00000000000..23677345c94
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
index 00000000000..9d21db27436
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

