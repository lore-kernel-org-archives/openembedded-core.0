Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5860C369C7
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 20:14:26 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.29946.1744834464546961863
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 13:14:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=s288ghc5;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-224171d6826so1127965ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 13:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1744834464; x=1745439264; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NtycDUaxd4w9hWsqt9cB4yX1hv68UGuZFRYl+TlEs1E=;
        b=s288ghc5fiku5hK1AQQ9aQ1zjCZ0VMAKz9GO53zYhWXMGZA62BqavA1e7cl4W8o84L
         yGmlMs9oAq9pgpOPkSR0d5pHcngWmK711/Ey9gtZ045r6/nEu2xrfobzdQdwOFKpupUx
         2vVsLbIMFeca+5Kgscip4vBIzmtdg17M5rOal+0QP8C92gnTs44qylNxYcBhLUD7P0OQ
         0tZuq02MULXUFSBx80K6N13PRnvuIv424S0QevZbP9hMOYQ9m8N13qdP7udfkz9aIihs
         0MczEZBIM5SghNxTvwT+IwMo/UjGEnlCz/8ciz8M8tMjYyQ3MIFLMUTYtgtpd3UfdiVt
         in6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744834464; x=1745439264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NtycDUaxd4w9hWsqt9cB4yX1hv68UGuZFRYl+TlEs1E=;
        b=gc05k/Hl/rJUWjbS3jndbucPHDA3zctcrQjvNVsSks8Z5Z7nQss8bIJBYi8PthkEre
         Jyjxu2cKH6RJzo09+TKX+o7dLc5YaZ8zcYoZWqL3bekLpvcIOL9Bb1K65sHadj4+D7FH
         Cgz9i9uz9/HSOc1qH+ok17b07ahfFmxxLbKn7VSJnebZvHgH/Qwwl8dCF91ShIUbE8J5
         5GDUQ9sjoOhp69UsjEXTqP1Faft4bV64LDMD9atqJ+tbF8WVmVZXQbuBRNAKFLO1Tl6g
         6gcbJQJVQv5Z0FUOX+naP940uAUMtt0hfd0tnPViPIW7uMPwNyQZh0ReXoqCVcX3DaFQ
         rM4g==
X-Gm-Message-State: AOJu0Yz44F6MmC+cI9PI4hYbai7EUJhTy9GhCvqZH1WcKKjgh9SK+aNj
	FyT+1I592Oox8hS/6e6whcTI6hj8BAe9UKksGI9LGstWowen+CxR6m2FAOg16vA79lLl/fq7KOy
	9
X-Gm-Gg: ASbGnctKlf3OY5hbrj4o0+trE3AXDbJFsxkuhHOnYB0hBwjsmAyoKrwDo5LFjCqGmdC
	Gvs1V8nZEGClObvy2+BFf8QnwaW4UxRGVJzyuEEB24g2oEcT/bdWDdt5efPs9nBMXPAcYfF8eJ7
	Yg/X/VDEMhP8cNx+mIPtfWX/0qaaBpjvZzs6J7GlW4dVFqZxRtHlOfPWbN5sLyOAa50JyM3jLGn
	8GTSj4OOzNIu472f7Fj1DrDF2nuo0IbeWEQSZ4IcSXdCgidZFwqEcWYwMhDWRjMXzFnyhl8+g6x
	JCrQIRLLHYrCjQM4bGGEqX+14Hjb6ut3
X-Google-Smtp-Source: AGHT+IFTrDxdMBAA+4CYRYUYd/rJnCUF00EBQdBQO9YtS10WbSm5ATyiho43h62z+5A8s0LpRm9QSw==
X-Received: by 2002:a17:903:948:b0:224:191d:8a79 with SMTP id d9443c01a7336-22c35916b53mr44963025ad.27.1744834463759;
        Wed, 16 Apr 2025 13:14:23 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aeb8:30c6:2c5c:85aa])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0b222029ccsm1703880a12.62.2025.04.16.13.14.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:14:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 1/6] openssh: Fix for CVE-2025-32728
Date: Wed, 16 Apr 2025 13:14:10 -0700
Message-ID: <59850fba21c60ac9731e293bd21f90c6ae0391f8.1744834364.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744834364.git.steve@sakoman.com>
References: <cover.1744834364.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 20:14:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215008

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


