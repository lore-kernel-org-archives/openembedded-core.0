Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53387C433EF
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 18:24:57 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web08.1165.1652811890999945252
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=D6E5AAZ0;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id q76so17633398pgq.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pax0IQQ0kmymbs4vgVPJNCjd+Q1eau7OtwumDa0Q4KY=;
        b=D6E5AAZ0IR4pjJkJrI62goIGe2zEBdx615F9DtWoefzDcIAp1aR840UVy2XRIPLfxe
         vU+fVx7IX4xSELtFyquSOXve21qAe6Zguk9iXrkflLhgGLwHeCPcYJercJsjtNT0qpNq
         J9Ok816H2hZB1ENZprCEOLIoMGhUvkq0eFd3uXp5Z+oMgLFDVTt5cfo7ZHyvNQHYDHQP
         eCoqYZx/os7kQ8HpHBq57rxKoIbxRHP88SE8/Oku7Gf+I0WzrFUQPaPsqIc9UDwNFKoM
         7mJPXiyBSzZFnRRs2d6mytIYtuwDSdI3jC2kN+l/xD4KwQpEjQ107i0oc9sPKxooDw/T
         TgkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pax0IQQ0kmymbs4vgVPJNCjd+Q1eau7OtwumDa0Q4KY=;
        b=BfpFCTU0Mz8LUFb1ZEcWlhEEARTB/zO8umcBBIQg+PKCAUR6+C140c/c0RKaPR7BW9
         7kb43ABlWR+rOIyErveksY/DhQWCTjJQeTsG/zNO8AkGDF/p5dxmfZiqYxl2+02GDL2e
         H9r6ZvnXlWltQlk0JIXgVJ5xdBxVjwZGAaspL5ZAOU86z4XbW2wMbDqQE04g8vL/Y4mV
         2d3fKnTZEsNYnjTdu4HcSyKTyNFWqyQ6LpxIwCKqmUqjmInI2RuKVwyhohZSg547mM3B
         mwwbbSS3/odu+oo0tiJ0egs8N5e04iA4/aC7LB2pt7UxAPERSCht/3jlQGiSLCs22xrv
         +1JQ==
X-Gm-Message-State: AOAM531Rg06lAZ6TX/LCcUWUKjd2EPvx6nuX0Re+/b98wS3zU2qTCxJV
	LdxrKQOlQbm9apLBo+Jc+J3JjTHohDkVtqfB
X-Google-Smtp-Source: 
 ABdhPJwhkLv1TdaCVkdgDQMR9eLXhIlLnCA1aS8+6oBr9W6sfO7CPfPI6PnEWRXiesVZHjkVABfAlg==
X-Received: by 2002:a65:6bce:0:b0:3f2:5f88:6f7d with SMTP id
 e14-20020a656bce000000b003f25f886f7dmr11540919pgw.253.1652811889638;
        Tue, 17 May 2022 11:24:49 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f9-20020a170902684900b0015e8d4eb1d1sm9408188pln.27.2022.05.17.11.24.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 11:24:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/31] systemd: Fix build regression with latest
 update
Date: Tue, 17 May 2022 08:23:53 -1000
Message-Id: 
 <53b7b68a7b84e6feef3d78e25dbdd8d053e921db.1652811454.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652811454.git.steve@sakoman.com>
References: <cover.1652811454.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 18:24:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165752

From: Khem Raj <raj.khem@gmail.com>

This happens when ptest is enabled with clang compiler

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a1f51bae8e4717da2375b9a476c368554a795487)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...e-Use-sockaddr-pointer-type-for-bind.patch | 46 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_250.5.bb    |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-resolve-Use-sockaddr-pointer-type-for-bind.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-resolve-Use-sockaddr-pointer-type-for-bind.patch b/meta/recipes-core/systemd/systemd/0001-resolve-Use-sockaddr-pointer-type-for-bind.patch
new file mode 100644
index 0000000000..8567283537
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
index 2cf3b7ca88..e5a2f65202 100644
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
2.25.1


