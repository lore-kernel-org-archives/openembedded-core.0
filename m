Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA8BD2ED0F
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 11:24:34 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4236.1768908267767989558
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 03:24:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bt99kjV8;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4801bc32725so25334885e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 03:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768908266; x=1769513066; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=STf2tGsCTPByRsiUufELAmHRNxtfM1g3wgDWaIsRHE0=;
        b=bt99kjV8FT6qMSzH/FedJQLrZvvE6Nub6GJsuVsCupC42eYgvuaiouIi7S+0KyzX/2
         F0FrHX++vCZmp3rSKrYkk0+hhOextOc7XgurDnOoAzzYls+40ku7z8/6xesHhFwedxIH
         6WfDc5sz6QJHyDPRV9ENkq8YDDpsYRhsiVqaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768908266; x=1769513066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=STf2tGsCTPByRsiUufELAmHRNxtfM1g3wgDWaIsRHE0=;
        b=lkdJc2ZSGNfSWqcX5oKG7796BC/rc5mrLn7p6XtUg6WfMbNycwIBwJpeOmcIyLqADz
         NlvlVZTfB9CnlbLZ+eEmq9FbXSgVCsZ9CD9LnaJ0ReZsul8RaIFgjEO3Lb4bHYcfoHBD
         wBK5GNjqANK+waA5jQMNnhVk5RAEzCMv16ilJY6belKzX6n6C3dZrxZTCWN/gLAmz1iT
         POQduhmXW7onOWtW/d2fJvx5KrXJHuUPhG6IarWechUYiVGr1NjMwbaMoCLFYSoZzcb2
         ZqbnHL+1tz0zYbf6CB5nepNjbUYZY698h36QleEFWP6Nlp/1kP1eKpOmo2W79gPLqp/p
         brDw==
X-Gm-Message-State: AOJu0YyBgFRHPUmcgyaICjkIn2R7RsaqKJl+x5sgfkoWm651LcM6f0cR
	7mqi8SeRienBgyAL/21Im3QF5enDmAspgRiJbY2dYMuXlAljYOQoQBeHZjgijUw9siVBU3XXD4u
	cv/v7
X-Gm-Gg: AY/fxX5IIFgaMw/jRQtO+DgWLiO06pNBW+anXFbUvcYMZVHt1pPYmadwCt/DEHrkWzd
	XFw9W40BBG5Y7GwnW8jWmRSqs/xUfrlPXWuxl7VSbDQ92S9v7on5nOX9yJoAdCJuHPcXuGRMLJo
	qTgTIJFfuhIqfb/hiyIS+uTd3+jMDiWafo9rdwuzOfgsgzNQoKN2ZIDpg6N0bkBz+pr0kE26vU9
	g5v+MgsxHhNIr6nnG+UUAryQqxLXivMQdxMk/B0SIJojKbreQpdSq2h9cqyBJi7OD91bx4e2eLN
	fsQWdzqIeJYchyWb/QESSDRNvHKul9+TEe1YWWhSeCYYAfuzttHtuS5JUeP+8fkpofsk8DUa2sR
	OyVgBhplmo12GwdSnFEn4GVFlq70MPwJG5tSsuoT4lONNmKVncZUpCR81wLjZTbOExDg4evYnlf
	aroDJZMY7eQZTIMjqf5bdA7gkK6tvJBUmN2HtzQtxKj5zTjczfF/lZT81nFLlA0emxGjwcZkWp8
	fV/35EkKO9U8LtXBvsYzw==
X-Received: by 2002:a05:600c:4691:b0:480:1c10:5633 with SMTP id 5b1f17b1804b1-4803b9d6ad6mr50473055e9.26.1768908265674;
        Tue, 20 Jan 2026 03:24:25 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921df9sm29558435f8f.3.2026.01.20.03.24.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:24:24 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 01/15] util-linux: patch CVE-2025-14104
Date: Tue, 20 Jan 2026 12:23:46 +0100
Message-ID: <6d4a4ef3014e6fcf66c7835ef71eebc7319bb575.1768906687.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768906687.git.yoann.congal@smile.fr>
References: <cover.1768906687.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 11:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229661

From: Peter Marko <peter.marko@siemens.com>

Pick patches per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2025-14104

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
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

