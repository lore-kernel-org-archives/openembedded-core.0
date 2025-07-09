Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53573C83F10
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 02:51:51 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.5571.1752029502725602895
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 19:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ComOdXkg;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-23aeac7d77aso46007365ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 19:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752029502; x=1752634302; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/8z0lQNhANEV07f5Mr95fpF75Hy8azbo0F1u4bdfzM=;
        b=ComOdXkgkmJnZB3cGitINZOG6R1CeRkHToBgOsuLdYZYcFFEkxV3sMaqysthOWT366
         MsDs2WTz+YIhBOsrxHdE4Ze8iua4Ljtzdpjs0ZYCHBrmVj7V+JHiICwrwd0MpGjrtxpp
         MbAyl883dLTUu74uSbmZg5JYUICwFpmmiTyVF7qryn6YeTrphHORNE7GBxZh8Tv7tL+H
         x/hEdkDAl4pPuzvvtzPI+j5aHDQoFOWpgViCw1+w2Iahi6QbUd6kyVBMYsOiFR2mQRzV
         OtB6WPRz4xi2JcNlS2mK8x06ghU8jbhWZ3vE9h3zJ/bcOIJbsSfwXKrGDdZkexA5pllH
         ewCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752029502; x=1752634302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j/8z0lQNhANEV07f5Mr95fpF75Hy8azbo0F1u4bdfzM=;
        b=wUNUelh41Ss3xJV3wY3TBbYqWpWNWyTmzREnAHhdO5kriXZGMaT3epQTChnCUn+1IF
         aj4t2fvE+om0GE5+cRcbJPGHh8G6nrw1qZT2EJDIluQU1bFZNoeqxdymwN//ST4YxlTe
         pIffp45ZEzrmLaVuvAN5YgFWgvJG9YWQ/0tX1IbMZk4Xh/xzc9gzTkWe622n82uKjXU8
         fhbIOMk3xZGkQJMy5nBWYRL3EsxqcFMFaTm9pBc8U2ZJU912f1T3yVqpxnvRXOlPXsn/
         yhrn/mIZSlcVy8tPnzEBKh4bnSbF4E1PsOG1ce9vE0nKDooSe59HG7NtoTm0abvYnjU1
         I88Q==
X-Gm-Message-State: AOJu0Yxb28bgodO6uif9/8nSz/LoVudoiXV9ETXqJmSwIWzg/TNKxRwO
	y8+6IUmddhDO6eA0nK81cg1P4sNnngjfDTuMxnUaR+o2wT8o8u/KUqLkRCC0nz2EYkgB6fn8Os6
	g9ga4
X-Gm-Gg: ASbGnctChBKB/bA9aMDjFsQea6jqPgRAaSYAwWRWqC/WbgXDmYehVrBfYCKwdUq/qe8
	L4+JvWZ2Ary65nbwgrWtSen4hc9n5w+hfVYJqShogD6JQ3K20rAMqWZuwaPE+zzBcrJwY5ICG6z
	+lPr2WBjIjfzfO8f5cbxsS5wSu5PgIIxZHTkDwchZTXnOTAlIcxg59AM+/EKCVhUhgSj8VrzvUb
	F3uz/VAr73Au1NUus5TV0L321IDpYo1SwmCyxNsgqtJUkcmWAYR9G3UMU+4sk7pn9/jYyKLedtl
	V1anLI/0VwMNAVj5fD8SZ4Ri/XJCj4/iJT1cKC/gqGq1mqWc9Zu4mw==
X-Google-Smtp-Source: AGHT+IFN2jpHd6E0YoQyq45ARfm7jcr0pdCZYLodVyQkS4q9U+RsJVKRcijOUcRjUUZpmEDS4gRCHw==
X-Received: by 2002:a17:903:b8c:b0:235:f3b0:ae81 with SMTP id d9443c01a7336-23ddb2e6362mr13164155ad.27.1752029501838;
        Tue, 08 Jul 2025 19:51:41 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:a6e1:d218:3fcc:fd7d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c845922b5sm121979075ad.199.2025.07.08.19.51.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 19:51:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/12] sudo: Fix CVE-2025-32462
Date: Tue,  8 Jul 2025 19:51:18 -0700
Message-ID: <d01f888a5ec43fdc8e7bd496ae9317c0fa28da9b.1752029282.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752029282.git.steve@sakoman.com>
References: <cover.1752029282.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 02:51:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220064

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/sudo-project/sudo/commit/d530367828e3713d09489872743eb92d31fb11ff

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sudo/files/CVE-2025-32462.patch           | 42 +++++++++++++++++++
 meta/recipes-extended/sudo/sudo_1.9.15p5.bb   |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2025-32462.patch

diff --git a/meta/recipes-extended/sudo/files/CVE-2025-32462.patch b/meta/recipes-extended/sudo/files/CVE-2025-32462.patch
new file mode 100644
index 0000000000..04610d40fd
--- /dev/null
+++ b/meta/recipes-extended/sudo/files/CVE-2025-32462.patch
@@ -0,0 +1,42 @@
+From d530367828e3713d09489872743eb92d31fb11ff Mon Sep 17 00:00:00 2001
+From: "Todd C. Miller" <Todd.Miller@sudo.ws>
+Date: Tue, 1 Apr 2025 09:24:51 -0600
+Subject: [PATCH] Only allow a remote host to be specified when listing
+ privileges.
+
+This fixes a bug where a user with sudoers privileges on a different
+host could execute a command on the local host, even if the sudoers
+file would not otherwise allow this.  CVE-2025-32462
+
+Reported by Rich Mirch @ Stratascale Cyber Research Unit (CRU).
+
+Upstream-Status: Backport [https://github.com/sudo-project/sudo/commit/d530367828e3713d09489872743eb92d31fb11ff]
+CVE: CVE-2025-32462
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ plugins/sudoers/sudoers.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/plugins/sudoers/sudoers.c b/plugins/sudoers/sudoers.c
+index 70a0c1a528..ad2fa2f61c 100644
+--- a/plugins/sudoers/sudoers.c
++++ b/plugins/sudoers/sudoers.c
+@@ -350,6 +350,18 @@ sudoers_check_common(struct sudoers_context *ctx, int pwflag)
+     time_t now;
+     debug_decl(sudoers_check_common, SUDOERS_DEBUG_PLUGIN);
+ 
++    /* The user may only specify a host for "sudo -l". */
++    if (!ISSET(ctx->mode, MODE_LIST|MODE_CHECK)) {
++	if (strcmp(ctx->runas.host, ctx->user.host) != 0) {
++	    log_warningx(ctx, SLOG_NO_STDERR|SLOG_AUDIT,
++		N_("user not allowed to set remote host for command"));
++	    sudo_warnx("%s",
++		U_("a remote host may only be specified when listing privileges."));
++	    ret = false;
++	    goto done;
++	}
++    }
++
+     /* If given the -P option, set the "preserve_groups" flag. */
+     if (ISSET(ctx->mode, MODE_PRESERVE_GROUPS))
+ 	def_preserve_groups = true;
diff --git a/meta/recipes-extended/sudo/sudo_1.9.15p5.bb b/meta/recipes-extended/sudo/sudo_1.9.15p5.bb
index 8e542015ad..30860eb75e 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.15p5.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.15p5.bb
@@ -3,6 +3,7 @@ require sudo.inc
 SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-sudo.conf.in-fix-conflict-with-multilib.patch \
+           file://CVE-2025-32462.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"
-- 
2.43.0


