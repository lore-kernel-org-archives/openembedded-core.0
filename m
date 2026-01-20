Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED97D2ED0F
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 13:38:15 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6474.1768916285887621847
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 05:38:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NsYIA5Ad;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso36662595e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 05:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768916284; x=1769521084; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aZx7yBXF/ju0Fn5lRwTxnclJE7Rx/mNlSC2pY349Xqs=;
        b=NsYIA5AdHjgKqJG+IBnbLSOmBJFvov0iWX+WmI9MOqOxUK6TYo2aGIcnnEVSVqN/OH
         PUaqxuJGPrs8O2VOuCzNCQpduXIUg4eynt9Nd2E99y9j/qDwCVEQywZblcA4Z+rmAYc7
         bnz5pXOZrWvD7ONJUgsdetp51StoG5y3JeSt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768916284; x=1769521084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aZx7yBXF/ju0Fn5lRwTxnclJE7Rx/mNlSC2pY349Xqs=;
        b=oag25IgflL8lug85A2OrW3rEI8udCz/MygbHOwyrcmgt4GCoE/ui+kUxho0ARPOVpy
         HC6uBvWDDoQlv1BttmxraQnaxrTTr/tY/5vT6tlCZZG2XAYx8wAHmq4tI0YwU2S5w+9w
         eGHfmgNW9HuMHtCwNjw9NAZsoreaSd9sDWhwKvocV9cQTnI5TjFCSHe2N26vx8MP1p2Z
         MENRV7QcA3HsggsTC/X6hZyukrIsRtTyru3mT39HHZf7T4/7h1g3hv3cpoHGuYmpeTrp
         sQGyEViP6vA15qF+2ddGMAkYeIQvPScpsszgiUaEjngjO70eyMyxKghKcecqkmyxtJ3P
         uQow==
X-Gm-Message-State: AOJu0YxgYEbYstx+YliIAghC9+wj/Mhia1rxO+hdPetoedu+r2hxzcp/
	oz1TidOGeDV8fQed6ohVxoQZiq2L2Iso7N5dnl+450pAU61m5TrZy8v5YeP6dNSq7sXtpUO/FrO
	Pmge5
X-Gm-Gg: AY/fxX4fQ0wZV5w1dzrP+1gOvwdBpuuD1mV0Yu1VajIBgLsOdmXViHD2o60dc/TE0qG
	1Pg7OAj48tSoRnaYS/5o71pgJia4UH72+3n3CtJm6hdW2GeVMaPXbtgrPEQbjob2zjRRBssnLg0
	AJm4Cgq/uZXM6UJD2HYi6nEp3gAz3mtbCWGYJ+2/2uSWESUGaB3H3rLb6hRqc8X0e0vwLDKgMXc
	B4GjUsrL8PBkZai4FxgwC2MggiBIkwrAG4OSoFa4VEizOo4CK8CVL0MBFHGN689W/Eabeoh2MwM
	iPKDJeQgR2o3vEy+07WCgUYgZyUl1h2PUozrPGw7/PoiBTTgZncfGzjh1OIZrwbBAb4PqmVP2EV
	NMDjd7CNlC3mUaymZwvAj9L9nXTQcyeogHOauQpo+pZJ90YkGKEvi8TqK4dwPgftuJLzR1uVOUr
	7aBrR7FoZh5T+Cij91VxZ53mt/A9ohKX9jyKm3DB3B5T63lpmNfn5pMDU/uKT72fY/Rg9NIBMcQ
	T0xw6rgYgjgGnZEFam4nQ==
X-Received: by 2002:a05:600c:638f:b0:479:1348:c63e with SMTP id 5b1f17b1804b1-480418f1128mr1015245e9.9.1768916283869;
        Tue, 20 Jan 2026 05:38:03 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b26764fsm303400035e9.12.2026.01.20.05.38.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 05:38:03 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/26] util-linux: patch CVE-2025-14104
Date: Tue, 20 Jan 2026 14:37:23 +0100
Message-ID: <6f04c21099444553894ad2b50068b7b4bb056b03.1768914702.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768914702.git.yoann.congal@smile.fr>
References: <cover.1768914702.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 13:38:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229707

From: Peter Marko <peter.marko@siemens.com>

Pick patches per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2025-14104

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/util-linux/util-linux.inc   |  2 ++
 .../util-linux/CVE-2025-14104-01.patch        | 33 +++++++++++++++++++
 .../util-linux/CVE-2025-14104-02.patch        | 28 ++++++++++++++++
 3 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2025-14104-01.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2025-14104-02.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index c62c6d70c3..a8b505a122 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -42,6 +42,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://CVE-2024-28085-0004.patch \
            file://CVE-2024-28085-0005.patch \
 	   file://fstab-isolation.patch \
+           file://CVE-2025-14104-01.patch \
+           file://CVE-2025-14104-02.patch \
            "
 
 SRC_URI[sha256sum] = "634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83"
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

