Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F415D2ED1A
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 12:09:25 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5019.1768910955248401112
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 04:09:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Q5jwpXr5;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so4676124f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 04:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768910953; x=1769515753; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6MLca8ree7MA2qqGYQbmLjTpanUR/5LSGatt4OCvTSg=;
        b=Q5jwpXr56jBOVLIy1KiFKdJMzZekwkWfvfXYRI8KKpXZpQN8yu/baUYekD4q75DPT0
         5ttE8eFgb7hWDRwDP3wiE0PyVXX6o1ycuJr1XBidHwGZOUao35WCkPjw2EnbWEZ6BDBB
         sSSTNcbtvElfBEYuhSTpY27XI6OanMv92Wrcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768910953; x=1769515753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6MLca8ree7MA2qqGYQbmLjTpanUR/5LSGatt4OCvTSg=;
        b=hZXK53Vu8Rb5tPVh4fpBTwxcoq68Cb12gnPxI/droCUVqxKKpMCV5gibpq1tpjTk+5
         vBSCubZC5eekyx9/TKZAiKOMvezwGDIxh22zNqpuks0dLuED8BrgVRVi1hT3AkpJBduX
         XWg8o52szZteMc15PqOfkrAuaaSN1FRd1su6DpXl3FqMNDC7+pz9k98/pmsHjwQXH197
         L08xX6Gkyo0wRz4k3Zwe04In4JhmRi1aDGTqc7TW5wIhsm29gvNw/UpZRwZoO30CBIDj
         5wxDbxWGvtNHO0XIquk/4n/1rSkxvO07JfVlLkzCuPR3i/tAQh60I0vWsV8L82StNKoz
         NhWA==
X-Gm-Message-State: AOJu0Yx41yZC/MJR+QTE+72ZyE8TBF6EWW276uJeJVJc8nHVNRBMx0jV
	o4fDfK+bceCbpc2aKWU78o4Rzn/HfqGCk4jBdFC1d1TrXrYCpKanSPYH3tdPmRn5tHqwD3i1eB+
	Tsilj
X-Gm-Gg: AZuq6aIAGRko+ReyzsgF0+7Mx4JUmUQKVpY1Z5aSocTAd9Rtw1rGZpENIW0L2kiwjk1
	1ZVF69/EQz7+8cYG9FFvVA1B2+eXUGUeZv8oipAkKOHQ8d2aezOMomJRMTnmVUwgP4wM+UkfwxA
	id2Ugp5xtSJkjnJYqYTcIHr80zBR3vbGDh4glM7OWW3KeZY/udKq7gmInwEjev1fxxKxKOpvnVL
	l43/UWJdU9oAWkX9VNYvJumdJc5DKo84ir6ZpIoX1FoJcPTVhvZ7bRUdZxMnh08qrCVAxnwKN1M
	p3KMa38Mz1RdoVMNdHhyxlfWUOOkx/nNzT8JQcAtqluo9Ankzt3sjKtniW2BN3YCqtYWZNPGy3i
	g7jNF36c0Z97VKJO0rFUIkoKo2Pl2iM6EC2+zP0VSrKVKyemBQ9uAY0JOAVEjRVaLRJ7fIbwqlx
	S453JzDhuWtpiPxpK/YKNDAf2CrI6JblgSntXVID0xePA2N9eK6K6sgNvehiMthpi38NDSua5O5
	GwFp2Kqt8ygYoLLnatpwA==
X-Received: by 2002:a5d:584d:0:b0:432:84f9:8bea with SMTP id ffacd0b85a97d-43569bcf38emr20051982f8f.51.1768910953406;
        Tue, 20 Jan 2026 04:09:13 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569927007sm28916097f8f.16.2026.01.20.04.09.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:09:13 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/22] util-linux: patch CVE-2025-14104
Date: Tue, 20 Jan 2026 13:08:17 +0100
Message-ID: <6c5e4c2d720dd87274211a5648e5891b198af3f4.1768910519.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768910519.git.yoann.congal@smile.fr>
References: <cover.1768910519.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 12:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229681

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
index ccab4b17f4..4797682c5d 100644
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

