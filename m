Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8267BC2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 14:59:32 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.1088.1747839569082950827
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 07:59:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=G+0C26/W;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b26df8f44e6so6620324a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 07:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747839568; x=1748444368; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NtycDUaxd4w9hWsqt9cB4yX1hv68UGuZFRYl+TlEs1E=;
        b=G+0C26/W6fVlK9ORaDWpGldICP3ceL8yUuX6hSLSjiFCNZry+lyRQfY9cXp48P+2FA
         el0tP4gJhW+YbWoApi9b4mb00glH2C2rmC//v05yooQPpjLxdIcrWsKVFdBXJHqrQvgr
         mdm8b1hXx6fSZ0ugEw/NwIePuILKr/nUvzC/VZ3JMgftIZjiPgTJtMM5AP2sjxSrblbO
         IXFhV25P700USND5JFCVTnQdPm820rp9pHNrxNf4+KJwNUqYwwDeR/UVJfJRwhx5AJUn
         hLW/GGwCsi3rpJixqkirMy1POK5u161+ij5oYtT8DW90T+UbfasZLK2T1NV/OkAiKPYF
         trtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747839568; x=1748444368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NtycDUaxd4w9hWsqt9cB4yX1hv68UGuZFRYl+TlEs1E=;
        b=BwjQ3vuNrTDlTurmjCjKhrhDhvrIhTOXtM8rzM5LUMGUxm+YHrsFqdA/iwkO4jURHC
         Vntl2QKQs8GdNDBdyyGtQ2L5dsVtUDdFo2PQoDiiJvxLC0ZIdaD5GyBaUdM4dBGu4c0V
         PbbCI9dSl6MtZcKvHf/Sq3uf6Wy+NY3qEdW4X8ANV39B1Dt21dGLIn4YvXZOgqqVl/9m
         iJ1QFXfBmVFYOS0rZTsRD7oQ/IWnXZFTw9KIblJGyoEH0TffxkglClrI11Axi0MXTQAk
         R7Ad7dyqzPn1wdACX1Yhrfl9YqvXfcOt+BccgD99wk/LRwIpmsJlKwe83mrdzX96Qxjq
         DB8w==
X-Gm-Message-State: AOJu0Yxwp5u4jODPSwH27zl4kho6ecHuuAkjJZpgDuSYqQp+VsBU8F6b
	63rrEHIFNT4zz0o8UqCScTravP1O7rJnTuNHm80a15sYJnmkjB6tCv0tCwtzTfwQPSX869OW5xN
	smlZl
X-Gm-Gg: ASbGncuCuarUBYNJw1JrIpXvqFKHmE5UQettCG1CnbJXYG5e63DY6/CA+VIfow9JW2x
	/q2dLJiYkm7nCKqsh4YLdP28sPimVy65KnFnhXyNv6DxUVpuZNwbJPEePGR3y3kf+vTlrI7Gkg1
	k8r6GlQQxX7nFYGkhqIFJhzFj8ozLS4k9Htyz80vrIpxAA1BkQ/mNqCmrWHp6kOAFDlvW+PEorZ
	4ovGTfJyVD9xC7m5hM9uxmIPS57eao5wxPMJfdzHUWdbk8oPK2JISqnY8Hf9I15emCIDrFXvDW2
	B2khrqMER0GY2PppYc2hUqPEm4axCcqoB9ngKCJIOQ0=
X-Google-Smtp-Source: AGHT+IFXgi/Db2sZSbVUi5/QcftKkf0coAZSrFDxYjHa1+jSrC6eHxZwtPxP2oDe0Lwdb1Wsta2vmQ==
X-Received: by 2002:a17:902:d645:b0:231:f9e3:188c with SMTP id d9443c01a7336-231f9e319b7mr187622155ad.52.1747839568362;
        Wed, 21 May 2025 07:59:28 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:89d4:3586:e576:3ce4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adb017sm94189645ad.53.2025.05.21.07.59.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 07:59:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 1/7] openssh: Fix for CVE-2025-32728
Date: Wed, 21 May 2025 07:59:14 -0700
Message-ID: <6565ae2b01d6eb1e3a83ed387a5e3b765f85b8cf.1747839445.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747839445.git.steve@sakoman.com>
References: <cover.1747839445.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 14:59:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217037

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://github.com/openssh/openssh-portable/commit/fc86875e6acb36401dfc1dfb6b628a9d1460f367]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssh/openssh/CVE-2025-32728.patch      | 44 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2025-32728.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2025-32728.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2025-32728.patch
new file mode 100644
index 0000000000..72fc0073e8
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
+index aa342e8..eb932b8 100644
+--- a/session.c
++++ b/session.c
+@@ -2191,7 +2191,8 @@ session_auth_agent_req(struct ssh *ssh, Session *s)
+ 	if ((r = sshpkt_get_end(ssh)) != 0)
+ 		sshpkt_fatal(ssh, r, "%s: parse packet", __func__);
+ 	if (!auth_opts->permit_agent_forwarding_flag ||
+-	    !options.allow_agent_forwarding) {
++	    !options.allow_agent_forwarding ||
++	    options.disable_forwarding) {
+ 		debug_f("agent forwarding disabled");
+ 		return 0;
+ 	}
+@@ -2586,7 +2587,7 @@ session_setup_x11fwd(struct ssh *ssh, Session *s)
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
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 6ae4c81a42..afcd50c7e6 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -31,6 +31,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://0001-Fix-missing-header-for-systemd-notification.patch \
            file://CVE-2025-26466.patch \
            file://CVE-2025-26465.patch \
+           file://CVE-2025-32728.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 
-- 
2.43.0


