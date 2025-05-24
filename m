Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95EC4C5B542
	for <webhook@archiver.kernel.org>; Sat, 24 May 2025 13:36:44 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.7012.1748093799145761537
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 May 2025 06:36:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wEgfqbYS;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3081fe5987eso650666a91.3
        for <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 06:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748093798; x=1748698598; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6GZqyOzJ/E8PmMsCCsdBdPK0oNuHaCIGi6hB5HGLdg=;
        b=wEgfqbYSbt9+BQmvwAxxtaMNSSkvkTgm8UTzI2rBRnQrzLGkJyXIZE2XQCcjF5rzWf
         shHPQjdde7AX84zOhu8nq88ZJY7jwlcmOopZQCaIXMlcz/1+2QKWTVU9ZZihZbiIDBIg
         Lmmqkc4yE4FfZLm1Hkao1vfp/jsd7MIy0GHAb8sbw5TwuAzcNZIHk+xePmRNXBUzEiB1
         1Cdle4wApBaEzbeIPrutORPE42CDijFnugYO2D7guEMsK35tE8XkpjhuBar/bPiUoX7b
         5jC+SySY7bJBopla02MXN7AVfNAVKmxZcRNegV0swTDpMuKUd8t9VsDalMdeX1GBI4xg
         /dWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748093798; x=1748698598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6GZqyOzJ/E8PmMsCCsdBdPK0oNuHaCIGi6hB5HGLdg=;
        b=ZNsVDVgxmksXVY3CnU7OScE0khQXHQj/RVTv6CtE5OiuR0ZlYpHofF9tvgoQnIaIWn
         KFi98RLDh4wvflvq4xCsPtHyYa89BPIBQMuNOlnV5qbegQ0Bm8SfK7fBVJYSJEwJf61s
         m2tSOpwi/QFlfd8Inruly2xSlAek18hGChqHWVd8fNOb75e3/FyDXt3fZgDIi4/7PsAo
         RqWIGHRZY6EGcpZYnUMg4mFktN5L9EmohX5WK/hRsiO8IuehJlKENWONZM5uAqo9zh5A
         +SQ1XlRFhE4mPbJth421cfDo7LoSa+gV/3oABKq35eaxMDw6emXtbb8VzSs1w71AB/Zt
         L8wQ==
X-Gm-Message-State: AOJu0YyY/CrwJl0PdspzIqBIVCKuLWcczrw0VSXHTolofxZ18tpo3G5/
	Qm/TD0d86480al6GWSRJP70J6a1PWsErH1IrRMiNvBattsjYqo/qqQ/QBHek833HXwPFzqVj34m
	sdI8d
X-Gm-Gg: ASbGncsZRmUtVGEOMgTq2wgAmZ4Vh7JdfpH0DwnQuLrjpmyHOJ8FJvyan0nJhTVMrMy
	hp+M1aRWDkUExbwDo0pctbtHFzhm9e/mSKt7GmxYKMVlleeO8QRdL48snf59v6rE83SZWDdmJU6
	ZDzT4vF1GavhDgDYjktaaQ91TO1ZqXXnHIw0qvEJaNCTqoEfZudpl9/NeD7pkGjh8fJDPbTI74f
	o36Ucz9aBcKH+SsSvXHk2s/oOYf9qkhEVEl6Tv+7wPJdzgGNDrXn+qy+XVPk/4eZGjN1sh0vlqD
	rQM83QlGSMXsoSEYmrCli9wQnEP5D7nRS4WppkQk+8w=
X-Google-Smtp-Source: AGHT+IGHJuQnwLQONwW1zuaR3MEu5zXkprv1uUFPnaoI2uiWGfqrAy9+pwyuasPHStTDeKiHgZdK5g==
X-Received: by 2002:a17:90b:4b83:b0:30e:382f:8b86 with SMTP id 98e67ed59e1d1-3110f824189mr5257752a91.15.1748093798311;
        Sat, 24 May 2025 06:36:38 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3157:44bf:9f62:fea8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365c4f9csm9058913a91.20.2025.05.24.06.36.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 06:36:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/12] openssh: Fix CVE-2025-32728
Date: Sat, 24 May 2025 06:36:17 -0700
Message-ID: <68413e1413eb87254d68f30920574b0e2c766782.1748093626.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748093626.git.steve@sakoman.com>
References: <cover.1748093626.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 13:36:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217226

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/fc86875e6acb36401dfc1dfb6b628a9d1460f367]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssh/openssh/CVE-2025-32728.patch      | 44 +++++++++++++++++++
 .../openssh/openssh_8.9p1.bb                  |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2025-32728.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2025-32728.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2025-32728.patch
new file mode 100644
index 0000000000..d992f78ed7
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2025-32728.patch
@@ -0,0 +1,44 @@
+From fc86875e6acb36401dfc1dfb6b628a9d1460f367 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Wed, 9 Apr 2025 07:00:03 +0000
+Subject: [PATCH] upstream: Fix logic error in DisableForwarding option. This
+ option
+
+was documented as disabling X11 and agent forwarding but it failed to do so.
+Spotted by Tim Rice.
+
+OpenBSD-Commit-ID: fffc89195968f7eedd2fc57f0b1f1ef3193f5ed1
+
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/fc86875e6acb36401dfc1dfb6b628a9d1460f367]
+CVE: CVE-2025-32728
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ session.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/session.c b/session.c
+index e67d24d..625e97f 100644
+--- a/session.c
++++ b/session.c
+@@ -2182,7 +2182,8 @@ session_auth_agent_req(struct ssh *ssh, Session *s)
+ 	if ((r = sshpkt_get_end(ssh)) != 0)
+ 		sshpkt_fatal(ssh, r, "%s: parse packet", __func__);
+ 	if (!auth_opts->permit_agent_forwarding_flag ||
+-	    !options.allow_agent_forwarding) {
++	    !options.allow_agent_forwarding ||
++	    options.disable_forwarding) {
+ 		debug_f("agent forwarding disabled");
+ 		return 0;
+ 	}
+@@ -2568,7 +2569,7 @@ session_setup_x11fwd(struct ssh *ssh, Session *s)
+ 		ssh_packet_send_debug(ssh, "X11 forwarding disabled by key options.");
+ 		return 0;
+ 	}
+-	if (!options.x11_forwarding) {
++	if (!options.x11_forwarding || options.disable_forwarding) {
+ 		debug("X11 forwarding disabled in server configuration file.");
+ 		return 0;
+ 	}
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
index 54b4d238eb..345051c8dc 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
@@ -38,6 +38,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2023-51385.patch \
            file://CVE-2024-6387.patch \
            file://CVE-2025-26465.patch \
+           file://CVE-2025-32728.patch \
            "
 SRC_URI[sha256sum] = "fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdaccd262380ae58bec5e7"
 
-- 
2.43.0


