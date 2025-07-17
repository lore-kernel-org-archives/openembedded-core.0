Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E96C83F37
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 02:59:21 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.40517.1752721160836677857
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 19:59:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BCg9/Aim;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3190fbe8536so458719a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 19:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752721160; x=1753325960; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ibt/isOy36/S56FeWvBuG1hKnUYDieuIFcRV0+ID/5o=;
        b=BCg9/AimXNPFszn4cKnp/nd64ZpgTrqKOm2QHXAjzGaN/xqVs+OX1tBeRBtwDoMPeo
         +w87JyE78sT0hgYSXcjar7JC9EPVXwFNnea4zyCfZksliGiVQUzUGnV6Me4KZNhhqjbl
         cv6w9iQLjKUCl+pJW7v2gYDEeJdiBXVvv5wtQS8FjSwDE87zsOlhdTyIRobZvD6QWOgc
         4QS86Q7mOdlhIwfbG8dBbAaKGU8pwPU6taGz+irH4eZD16gSLnmf9CbwcQfkET+C2kaC
         WQg6y3wAU/oV4gWN4+a3QPHXZS0odGChAPBkgfV4yTleK7hg+KPbpaEv9mA9GYbjP9Ny
         2q9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752721160; x=1753325960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ibt/isOy36/S56FeWvBuG1hKnUYDieuIFcRV0+ID/5o=;
        b=fDsIgAFRbNsaFIhiBKIc9iW4scX/FsgpplttH7QfRWZdGB73UluzlrM9mXZpkqT3P4
         +N43dqm5djfj088WzctYjl+9fccYWQkNQimoVimigIS5keTtDAQNjI8/bZ7t+SvNIvLx
         ZhJNv21im8Ijpw9fhi0/dAG7SNXTjh3299x+65PzKQW7Tw8JysDC48/iBFbpziq+mTL3
         ZaiVrrcXByEw83/EtNDN+PYIV/gA0ULTvyMdf2t7mZc064m44kjX8Ao6hc6FOM7kpDOn
         d/pPzDTzNJpWRsa6FbhuEdotHSYfblRYQDyTtBh8YbXAmH2LuL2uBsR4Hh69e4k/oVGn
         kFrQ==
X-Gm-Message-State: AOJu0Yzx65WQJtS6g3LWhCihUNY68R2cyy2MSzKYSJxQr3SM1aQg628k
	/7Sz1M6akkl4ZFSUei+wFJ14yv830kuxhFQ6FXrZ0duN3bX3U0Afcmx8CH1q9ZAF3e9OrPw3QXh
	xrzNb
X-Gm-Gg: ASbGncutXhb4nu7yYSlNj/Pu9du2IHn/IXJEDZL9x3FvZ/d5FpoI0nPK0da5L8nepV8
	QqWSv22HKt3b6lj27zrHpvfzIWcmqi4fGdzmiv8uCu6SN72Glb5xiEop8CkSbn3lQgB/Suhk+V3
	VTKUti/nbX3cb89/vhXdtWbXZjY7qQXLhCgc2XeNNcE1CfCbuzs2jEnKzFHYYzRehK3L472zjzK
	yRHbldCDE8GW9zA5DXjea5ezDqI4EQt6pEJV6G/8b6z3LV90e/hrccPJQrpNwiU8fuScAeM5JBu
	tM6gi5yff6ZUIuXfamkClbxh1+grtvLkXN5PiKZN46+09xf/nrFfH6FPe9LA8l5J9u1P6qn2M5q
	/cXapx2xi1lBo3Q==
X-Google-Smtp-Source: AGHT+IHnudHeChbcdQ1QzXZbzSBCaNlSW7C5Z50yKB8yILiA4tfqE3QitCnUJlyOLrsJ2IMd24O0Vw==
X-Received: by 2002:a17:90b:2810:b0:311:fc8b:31b5 with SMTP id 98e67ed59e1d1-31c9f47cff5mr7332256a91.14.1752721159997;
        Wed, 16 Jul 2025 19:59:19 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3bfc:8fec:7e35:e96a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f29e313sm2204547a91.35.2025.07.16.19.59.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 19:59:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/12] Revert "sudo: Fix CVE-2025-32462"
Date: Wed, 16 Jul 2025 19:58:55 -0700
Message-ID: <9310d6f867798ab98f1343ce1bc74ad8bbd6d1dd.1752721028.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752721028.git.steve@sakoman.com>
References: <cover.1752721028.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 02:59:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220507

This CVE is fixed in the following version bump

This reverts commit d01f888a5ec43fdc8e7bd496ae9317c0fa28da9b.
---
 .../sudo/files/CVE-2025-32462.patch           | 42 -------------------
 meta/recipes-extended/sudo/sudo_1.9.15p5.bb   |  1 -
 2 files changed, 43 deletions(-)
 delete mode 100644 meta/recipes-extended/sudo/files/CVE-2025-32462.patch

diff --git a/meta/recipes-extended/sudo/files/CVE-2025-32462.patch b/meta/recipes-extended/sudo/files/CVE-2025-32462.patch
deleted file mode 100644
index 04610d40fd..0000000000
--- a/meta/recipes-extended/sudo/files/CVE-2025-32462.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From d530367828e3713d09489872743eb92d31fb11ff Mon Sep 17 00:00:00 2001
-From: "Todd C. Miller" <Todd.Miller@sudo.ws>
-Date: Tue, 1 Apr 2025 09:24:51 -0600
-Subject: [PATCH] Only allow a remote host to be specified when listing
- privileges.
-
-This fixes a bug where a user with sudoers privileges on a different
-host could execute a command on the local host, even if the sudoers
-file would not otherwise allow this.  CVE-2025-32462
-
-Reported by Rich Mirch @ Stratascale Cyber Research Unit (CRU).
-
-Upstream-Status: Backport [https://github.com/sudo-project/sudo/commit/d530367828e3713d09489872743eb92d31fb11ff]
-CVE: CVE-2025-32462
-Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
----
- plugins/sudoers/sudoers.c | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/plugins/sudoers/sudoers.c b/plugins/sudoers/sudoers.c
-index 70a0c1a528..ad2fa2f61c 100644
---- a/plugins/sudoers/sudoers.c
-+++ b/plugins/sudoers/sudoers.c
-@@ -350,6 +350,18 @@ sudoers_check_common(struct sudoers_context *ctx, int pwflag)
-     time_t now;
-     debug_decl(sudoers_check_common, SUDOERS_DEBUG_PLUGIN);
- 
-+    /* The user may only specify a host for "sudo -l". */
-+    if (!ISSET(ctx->mode, MODE_LIST|MODE_CHECK)) {
-+	if (strcmp(ctx->runas.host, ctx->user.host) != 0) {
-+	    log_warningx(ctx, SLOG_NO_STDERR|SLOG_AUDIT,
-+		N_("user not allowed to set remote host for command"));
-+	    sudo_warnx("%s",
-+		U_("a remote host may only be specified when listing privileges."));
-+	    ret = false;
-+	    goto done;
-+	}
-+    }
-+
-     /* If given the -P option, set the "preserve_groups" flag. */
-     if (ISSET(ctx->mode, MODE_PRESERVE_GROUPS))
- 	def_preserve_groups = true;
diff --git a/meta/recipes-extended/sudo/sudo_1.9.15p5.bb b/meta/recipes-extended/sudo/sudo_1.9.15p5.bb
index 30860eb75e..8e542015ad 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.15p5.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.15p5.bb
@@ -3,7 +3,6 @@ require sudo.inc
 SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-sudo.conf.in-fix-conflict-with-multilib.patch \
-           file://CVE-2025-32462.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"
-- 
2.43.0


