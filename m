Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B335F89258
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 10:41:58 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22302.1776768113157955470
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 03:41:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ukho3Lju;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so52543635e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 03:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776768111; x=1777372911; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p8edV5zzHH6dorLxvV9egypfqYvTGo8gPKF3r8qn6Xo=;
        b=Ukho3LjuAeMcIEG6Nt9tdR74DoEvlqd4pS+3pRdpL0lO43H484WTPOBQZASJi/8hPM
         xObUAKnu92jaYytkqxP4XpFZ2uLTZiOBgSJ9cU/L0cac7wxWgZbYXeC7bZRQJYVTR7fz
         sHPRTxrUXzpJrwG8+uMFPeOvQI4TFSHpG9DVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776768111; x=1777372911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p8edV5zzHH6dorLxvV9egypfqYvTGo8gPKF3r8qn6Xo=;
        b=rvtv2kIzIdT5CBij/je4sJ9GolPpbY2GNdGroaOFeZJ4hdHXUEMjcdxKqlnj2KKmZK
         nWmWzC4TpijPGdcKgx44Fx6TJtf6MnlO1FuDwsG7rgB9iUDani0CjhHzKJ4lpEwXvw1a
         5hLJLn8DA7rzhF1YaCTBQ4wjKoc5qh+gq649Je/l+1xeUQVBDA++VdHVctKuFXPxXlPZ
         yw05e7YjAbdowDf2ABMn1UeB1k30jOQZlq6qP0imD4t4LlrpVOzjLqloKvQ2vFNmzysR
         knYJoqu7dMYEhgVUrI0n5Tr8OpmiBVdEjddx1oNK3p/B4Nx1LSNv/GtgzVHmwVy6TH5W
         6I6g==
X-Gm-Message-State: AOJu0Yx9OHo9PLDswxgsS3zQ7Q5e4M+qQ1G0Qq+kDteHDZ+tbWeuQPFj
	VnXvYcqLiQFsJFMz5KapLGHKLklHEOhHUyHhbzoEFEbJJlZbPT48WobEhGD5AvKqtnI4w+3evSD
	6IdXPHW4=
X-Gm-Gg: AeBDievSWnAHfQYVT8UgWZxJvA9TGsmIPlYGCpNDnD5/vBPD93aYbkJla2kWzMpX8PP
	4dxa/J4/aQSASu79H1V60gTtxjwlFVDk1mGABvz7lmk5oWScSNUlenRmVvrEy7NX4Ge3xTU4f1y
	w0fLPGU3nuKaQdkur7BADDrnjwCLGFLFmVLZPS6mY9NpmhIlDr6f24LidlwFQHyjBYyPG+lOsXI
	K5u5isKGJ3GPcNdJnTE2PZ3rQffv4/lqo0lWAX4bfdv0wfMzLuYV+bfaLOVaXsysIDA2mJ/8V43
	ekLCe0OItDsyknSeq09V/LJoYvBZH+1tYtRkGl5fpyCTkL+kZYa7ZFPA8wkgfWlFOC4gWNAbooN
	UQeHInXCB1aGte2x2x3IDi2anOb34nOBAcFSfWN7/KDO5w3X2bOf1T1jzNINH9ACrbwLR4Tc85U
	4oyjhpKxg2VyDe03sLQ2vC1dlsuVTYXq5ceMxoEwOGVl7hgg5Nrn8TNpsohbBIfWQ=
X-Received: by 2002:a05:600c:3216:b0:489:1ff1:74d3 with SMTP id 5b1f17b1804b1-4891ff17521mr53571175e9.20.1776768111069;
        Tue, 21 Apr 2026 03:41:51 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:aba4:e0e8:1cef:1732])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a4b329542sm163759995e9.3.2026.04.21.03.41.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 03:41:50 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] shadow: Drop pointless patch
Date: Tue, 21 Apr 2026 11:41:47 +0100
Message-ID: <20260421104147.1994119-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260421104147.1994119-1-richard.purdie@linuxfoundation.org>
References: <20260421104147.1994119-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 10:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235665

As far as I can tell, this patch is a no-op and doens't change the code.
As such, I think it just complicates things and can be removed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...nexpected-open-failure-in-chroot-env.patch | 48 -------------------
 meta/recipes-extended/shadow/shadow_4.19.4.bb |  1 -
 2 files changed, 49 deletions(-)
 delete mode 100644 meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch

diff --git a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
deleted file mode 100644
index 699269ed643..00000000000
--- a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From f7b765c022e4cad9140ac44712885c66e149abdc Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Thu, 17 Jul 2014 15:53:34 +0800
-Subject: [PATCH] commonio.c-fix-unexpected-open-failure-in-chroot-env
-
-Upstream-Status: Inappropriate [OE specific]
-
-commonio.c: fix unexpected open failure in chroot environment
-
-When using commands with '-R <newroot>' option in our pseudo environment,
-we would usually get the 'Pemission Denied' error. This patch serves as
-a workaround to this problem.
-
-Note that this patch doesn't change the logic in the code, it just expands
-the codes.
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- lib/commonio.c | 16 ++++++++++++----
- 1 file changed, 12 insertions(+), 4 deletions(-)
-
-diff --git a/lib/commonio.c b/lib/commonio.c
-index 4d83e83..9ee0e13 100644
---- a/lib/commonio.c
-+++ b/lib/commonio.c
-@@ -604,10 +604,18 @@ int commonio_open (struct commonio_db *db, int mode)
- 	db->cursor = NULL;
- 	db->changed = false;
- 
--	fd = open (db->filename,
--	             (db->readonly ? O_RDONLY : O_RDWR)
--	           | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW | O_CLOEXEC);
--	saved_errno = errno;
-+	if (db->readonly) {
-+		fd = open (db->filename,
-+			   (true ? O_RDONLY : O_RDWR)
-+			   | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW | O_CLOEXEC);
-+		saved_errno = errno;
-+	} else {
-+		fd = open (db->filename,
-+			   (false ? O_RDONLY : O_RDWR)
-+			   | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW| O_CLOEXEC);
-+		saved_errno = errno;
-+	}
-+
- 	db->fp = NULL;
- 	if (fd >= 0) {
- #ifdef WITH_TCB
diff --git a/meta/recipes-extended/shadow/shadow_4.19.4.bb b/meta/recipes-extended/shadow/shadow_4.19.4.bb
index 3ab9ae9c287..94f155641cc 100644
--- a/meta/recipes-extended/shadow/shadow_4.19.4.bb
+++ b/meta/recipes-extended/shadow/shadow_4.19.4.bb
@@ -23,7 +23,6 @@ SRC_URI:append:class-target = " \
            "
 
 SRC_URI:append:class-native = " \
-           file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
            file://disable_syslog.patch \
            file://notallylog.patch \
            "

