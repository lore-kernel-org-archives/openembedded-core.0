Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FBFEC433EF
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 03:33:54 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web09.5556.1651808023596750325
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 20:33:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h/mq235V;
 spf=pass (domain: gmail.com, ip: 209.85.210.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id j6so5217466pfe.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 20:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u7tt2xdzkk/rNtSFQfh3lEWvnGUmKUXaypHyBWSSNf0=;
        b=h/mq235VYrFsrlJjUMTPokagefCGRF6Wf/4wz2BQKFsJfFHufZCX/TcGOdR1nwnNjF
         WvRn25BiyJ1cvdwW+atS5SGueoqd9rYJUv86Gn7LFvluy9GehblAP5yCRQNMMSHsLHRJ
         Ij1SIghjRMnzT9/4Qa57va1cdlpys5OywN4uTChgQ1ICuXGSZ7gmOPYjiGijHEqu/1cn
         B8etAvxJpTV+ofKXGV3SZjup6SuU8zX4pw1Zk2st4xfMPdY5qwkRmIu8i7bIJAU/26Pg
         tKFSH2tkKWJ4DSPNOQlCwvmuPSN1hudI7EoJKIFnPdOjAF/YMh8h6CAFy8uQX6iJYcQz
         H7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u7tt2xdzkk/rNtSFQfh3lEWvnGUmKUXaypHyBWSSNf0=;
        b=NQBsHtL58iY1YWnmV+ff1/n+S1Hm3R0/sYIhMv+wwiPwMzLBE7EmHpjD54ixGaqRF7
         cO5KUMTNetqQ+9WgI8/9Ig0WisBi8SqVbYEd8BsK+oKbrVq3evocIlkNSnrKUKxxoy0Z
         ZNJlpJww+5MbFfxUUfXDX1CiT7bt4CAHhX463EpzbF9ZU6NZHFp8fNfe2Ok+WXXaJjww
         ZGWuVV56Ex8bFlxTzmCloFhvfTvZXSk3Sccdl4KH9GOJADuMPj7wKtO0pspXE4vkK7sL
         AA2rMW3Rbe/ctO140pIm0iujxmzocGZtZUSzwl1KyrejyS9Tmy8gVJmMcgxua2P0kJIn
         UC3A==
X-Gm-Message-State: AOAM532fv4HKEZoBOB3RRdSg2Y9zmPfYA/5dj0jcaFm1zG4UfJdpA1r1
	l+Wy34ktDofovhhSD0Z2T5qnTwwaojGclw==
X-Google-Smtp-Source: 
 ABdhPJx6VmoiGx3mvVb8vlgDXpFpyL9txelVGs8oCgmISg1iYDg0RMfUAPBeJwWjuVD3n6/WBBepPg==
X-Received: by 2002:a63:24d:0:b0:3c2:2f74:2ddb with SMTP id
 74-20020a63024d000000b003c22f742ddbmr1138320pgc.83.1651808022680;
        Thu, 05 May 2022 20:33:42 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 6-20020a170902ee4600b0015e8d4eb1desm423225plo.40.2022.05.05.20.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 20:33:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] systemd: Fix build regression with latest update
Date: Thu,  5 May 2022 20:33:40 -0700
Message-Id: <20220506033340.100181-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 May 2022 03:33:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165315

This happens when ptest is enabled with clang compiler

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-Use-sockaddr-pointer-type-for-bind.patch | 46 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_250.5.bb    |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-resolve-Use-sockaddr-pointer-type-for-bind.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-resolve-Use-sockaddr-pointer-type-for-bind.patch b/meta/recipes-core/systemd/systemd/0001-resolve-Use-sockaddr-pointer-type-for-bind.patch
new file mode 100644
index 00000000000..85672835378
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-resolve-Use-sockaddr-pointer-type-for-bind.patch
@@ -0,0 +1,46 @@
+From ad1428f29196bcc88ae382ee67ff705928e2be24 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 5 May 2022 20:25:37 -0700
+Subject: [PATCH] resolve: Use sockaddr pointer type for bind()
+
+bind() expects sockaddr* but SERVER_ADDRESS is sockaddr_in type struct
+
+Fixes errors with clang e.g.
+
+../git/src/resolve/test-resolved-stream.c:112:32: error: incompatible pointer types passing 'struct sockaddr_in *' to parameter of type 'const struct sockaddr *' [-Werror,-Wincompatible-pointer-types]
+        assert_se(bind(bindfd, &SERVER_ADDRESS, sizeof(SERVER_ADDRESS)) >= 0);
+                               ^~~~~~~~~~~~~~~
+../git/src/resolve/test-resolved-stream.c:251:39: error: incompatible pointer types passing 'struct sockaddr_in *' to parameter of type 'const struct sockaddr *' [-Werror,-Wincompatible-pointer-types]
+                r = connect(clientfd, &SERVER_ADDRESS, sizeof(SERVER_ADDRESS));
+
+Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/23281]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/resolve/test-resolved-stream.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/resolve/test-resolved-stream.c b/src/resolve/test-resolved-stream.c
+index f12c729e50..504b532002 100644
+--- a/src/resolve/test-resolved-stream.c
++++ b/src/resolve/test-resolved-stream.c
+@@ -109,7 +109,7 @@ static void *tcp_dns_server(void *p) {
+ 
+         assert_se((bindfd = socket(AF_INET, SOCK_STREAM | SOCK_CLOEXEC, 0)) >= 0);
+         assert_se(setsockopt(bindfd, SOL_SOCKET, SO_REUSEADDR, &(int){1}, sizeof(int)) >= 0);
+-        assert_se(bind(bindfd, &SERVER_ADDRESS, sizeof(SERVER_ADDRESS)) >= 0);
++        assert_se(bind(bindfd, (struct sockaddr*)&SERVER_ADDRESS, sizeof(SERVER_ADDRESS)) >= 0);
+         assert_se(listen(bindfd, 1) >= 0);
+         assert_se((acceptfd = accept(bindfd, NULL, NULL)) >= 0);
+         server_handle(acceptfd);
+@@ -248,7 +248,7 @@ static void test_dns_stream(bool tls) {
+         assert_se((clientfd = socket(AF_INET, SOCK_STREAM | SOCK_CLOEXEC, 0)) >= 0);
+ 
+         for (int i = 0; i < 100; i++) {
+-                r = connect(clientfd, &SERVER_ADDRESS, sizeof(SERVER_ADDRESS));
++                r = connect(clientfd, (struct sockaddr*)&SERVER_ADDRESS, sizeof(SERVER_ADDRESS));
+                 if (r >= 0)
+                         break;
+                 usleep(EVENT_TIMEOUT_USEC / 100);
+-- 
+2.36.0
+
diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core/systemd/systemd_250.5.bb
index 2cf3b7ca889..e5a2f65202c 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -25,6 +25,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch \
            file://0001-test-parse-argument-Include-signal.h.patch \
+           file://0001-resolve-Use-sockaddr-pointer-type-for-bind.patch \
            "
 
 # patches needed by musl
-- 
2.36.0


