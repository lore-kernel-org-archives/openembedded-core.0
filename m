Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C80D2ED12
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 11:24:44 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4243.1768908274428093724
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 03:24:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LpBJWtQ3;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so34481995e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 03:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768908272; x=1769513072; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VPulKy/C1VP+9SqSVi1V+0QH8p350DhbDOk/pYXHLhI=;
        b=LpBJWtQ3uQWHkc2+w+qRs5+6YT9eaFaj4M4hX1JN05U6OmWfkbTVjCkwBbd3lpulBt
         k0K0nAUEIqQjrmtJusQK8zjves78m4y3HWjmAuaF4vOI8VNnBmmbedNQhYCHGgeuGOM4
         fTbiSMNQ+n9VHPKVRGEhgbMp/vQnyCwYWx+WI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768908272; x=1769513072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VPulKy/C1VP+9SqSVi1V+0QH8p350DhbDOk/pYXHLhI=;
        b=LQ9EPFFbvyhHv807KUkLrJntO9EqYzncmx1de6Rr7QyyBXJ6eYae8Xuf6LxaSetkR7
         VbIbQxXcxO5uFYEt9Vfdk9FF7y9BdOMafbNJtj5Y6D8R/3rh/dXTrvxnU0ylmJguulHT
         1IGfuLd5dLGgpCYYa7gp3e+tIXEMfrt3pjUCRQvWdHJGOsjGPhPqpkGCV1LZZB7lA/eT
         QBognYmtXY/nsfVmJ23OUaO3vd2ZJwjbuxMpXOWjUunLNC8vZLYq38O3qAkHmhHIlw1Z
         iLbPdiaAfS2lDGA+cUYsQ+HWjZebZsVtvoT4VdN9pF6eovt+bixzzcdLRudQqcSF7mdj
         qmnQ==
X-Gm-Message-State: AOJu0YwBpQyp5aBsuocBgnFeZJbLChxTcS9EhgX6+l3rc+jEFZocxYFL
	evBrc2qTjGk2v8kaXPefhC96JWDVa+tT9KUl/n123xsm5Mdwu155T6l8vkYVHHZf4vvH98PIcC+
	lDaKR
X-Gm-Gg: AY/fxX5xIzTSsNQwH3PSS+bZhIgYHmZ3528E4cz0uzhnqbnO+qEk7SxEAwYK5tiPl+r
	UFCW3Ojjf2/uiPnU9E+CdUb7847D8QJFzcCVwij9s9NqLafUZHSR8KI/nUi8UrBxbHm+R9Ffqxi
	mKCYy7AIUUwXa4s9HDLDmAw++kIGmLGusaxtMg5yJwW2HHDCiS47UfkYooDTU6BOr1XZFxn8nmt
	/NepB53GaciLgNUPT4BHo1cJb9gPuGx3/7u82xl+7TpFiVa0QZY8imIlQqcAtFLufM9RMG4Xjb8
	sLx9cZVKR+BMfL2vKZHlNvK5vI9xhqa/3laARVGm+YvaKJE/hcv6fH8FRhsdNDIJTwrhjitJqA2
	KYTi427Xt0Fsf32vYu/nsIJ3Rte3870dR5rF0vHn7jI+5JaLpLzqPhTApFGbhfexO+29bsa1o3H
	bop5qCjiqGZFGJmWP7TZlxmktVFyntNcqpSKoqYOl9Av/y54YDckFTnN0Q7eqDzsY0pt9zfZ2r9
	BqW2x1kNywcaqij1PInaA==
X-Received: by 2002:a05:600c:a310:b0:47e:e712:aa88 with SMTP id 5b1f17b1804b1-4803e7f0e2cmr17489565e9.31.1768908272543;
        Tue, 20 Jan 2026 03:24:32 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921df9sm29558435f8f.3.2026.01.20.03.24.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:24:32 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 13/15] curl: patch CVE-2025-15079
Date: Tue, 20 Jan 2026 12:23:58 +0100
Message-ID: <48aab84b3f6d0ba5850f11aa4d90d26f23ae9915.1768906687.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768906687.git.yoann.congal@smile.fr>
References: <cover.1768906687.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 11:24:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229673

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://curl.se/docs/CVE-2025-15079.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2025-15079.patch            | 32 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.17.0.bb      |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-15079.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-15079.patch b/meta/recipes-support/curl/curl/CVE-2025-15079.patch
new file mode 100644
index 0000000000..2320e56d68
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2025-15079.patch
@@ -0,0 +1,32 @@
+From adca486c125d9a6d9565b9607a19dce803a8b479 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 24 Dec 2025 17:47:03 +0100
+Subject: [PATCH] libssh: set both knownhosts options to the same file
+
+Reported-by: Harry Sintonen
+
+Closes #20092
+
+CVE: CVE-2025-15079
+Upstream-Status: Backport [https://github.com/curl/curl/commit/adca486c125d9a6d9565b9607a19dce803a8b479]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/vssh/libssh.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/lib/vssh/libssh.c b/lib/vssh/libssh.c
+index 7d5905c83d..98c109ab59 100644
+--- a/lib/vssh/libssh.c
++++ b/lib/vssh/libssh.c
+@@ -2670,6 +2670,11 @@ static CURLcode myssh_connect(struct Curl_easy *data, bool *done)
+     infof(data, "Known hosts: %s", data->set.str[STRING_SSH_KNOWNHOSTS]);
+     rc = ssh_options_set(sshc->ssh_session, SSH_OPTIONS_KNOWNHOSTS,
+                          data->set.str[STRING_SSH_KNOWNHOSTS]);
++    if(rc == SSH_OK)
++      /* libssh has two separate options for this. Set both to the same file
++         to avoid surprises */
++      rc = ssh_options_set(sshc->ssh_session, SSH_OPTIONS_GLOBAL_KNOWNHOSTS,
++                           data->set.str[STRING_SSH_KNOWNHOSTS]);
+     if(rc != SSH_OK) {
+       failf(data, "Could not set known hosts file path");
+       return CURLE_FAILED_INIT;
diff --git a/meta/recipes-support/curl/curl_8.17.0.bb b/meta/recipes-support/curl/curl_8.17.0.bb
index 948769e0fb..a0022f3a3f 100644
--- a/meta/recipes-support/curl/curl_8.17.0.bb
+++ b/meta/recipes-support/curl/curl_8.17.0.bb
@@ -18,6 +18,7 @@ SRC_URI = " \
     file://CVE-2025-14017.patch \
     file://CVE-2025-14524.patch \
     file://CVE-2025-14819.patch \
+    file://CVE-2025-15079.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

