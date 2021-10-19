Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C695C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:54:55 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.15097.1634673294914449514
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=t9b+z8N0;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id i76so877954pfe.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DOhqMtTvkwRAh7hTs5/cb2VWRzf3PWIw4QHUGvfCH54=;
        b=t9b+z8N0RUkv57DxPl4ASbD2bSxt0Cmcfy9emssGsbOhoHJjbDxmlxr7KyfQLWa+eI
         NdtwlgoAxS34ei5yWD8jvsND0iRbsWtxYa6xbQQT1I96ey36uYj+hZWTNk57QDsA/QbW
         g8zF88c3DkY1n4z5pCniemrPbpuE/FXn6Tt5waANlaJUwkOOh1gnW8PFm6/3omtkfexr
         +zC4xzq1buei+KEPdYJZuxxudtN6dAvKkLZ7heH4tJkKtM+UDuwb3psDMf6WOvX6rMiM
         uRONb+dC0FuGH8dJUbJfhFfmJVtuBtDOi5+zRAZg0FlgP12UYvZOBkJMgUdTDwbuYYuG
         pltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DOhqMtTvkwRAh7hTs5/cb2VWRzf3PWIw4QHUGvfCH54=;
        b=b3PFfirWHQrNSQFQuMPs/eFpSytj2QSicJT0oQHGmdEMSY9AA7KBVLbt0u/+nxXe/R
         tYDC7oe8+31fw799YleY4GUV6jVnBTTtULQYDkw9uXGgFK2Ogc5Cc4aL5lqR3a3zn0zh
         J2jZ0Rk8xLMi6rSullkajJzTw2q0h6PXELTSXva6yyR+xE9z/7Z9QKTsb/HptWJI47Rt
         jS/tVkBmyoAqsnV4H/DlxnbfLUuPK4OmgJzb5rbOFkJjOAqABlrJIP1pBlpa6a7X0Vpq
         NTvCw9aI8wKI1MuOpiTe89ZR0PXC2cuP8cjH3G8q8ZggLB0fRhaw4wMoWOulYIDa3Maz
         tQcA==
X-Gm-Message-State: AOAM531wbTy1IH93FUEWupSN3cglEE1YfR46xRq+02Jxy3mgGa5D+dvD
	q92SGGC4rfsl38V6hEuXA5r75LNViMIgIKH9tCU=
X-Google-Smtp-Source: 
 ABdhPJxJ9PPTb1vxNMdtEAq+AAfr+29iX2asZvB3l0yBnTpitErknOjz/ccw03rGtaxf0VA5UuXCgQ==
X-Received: by 2002:a63:8f4c:: with SMTP id r12mr29673730pgn.0.1634673293959;
        Tue, 19 Oct 2021 12:54:53 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.54.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:54:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/38] gpgme: Use glibc provided closefrom API when
 available
Date: Tue, 19 Oct 2021 09:53:30 -1000
Message-Id: 
 <eaebf0884d7e1ffb8a14cc1ff947d0724e7bb6a1.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634665675.git.steve@sakoman.com>
References: <cover.1634665675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:54:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157224

From: Khem Raj <raj.khem@gmail.com>

glibc 2.34+ has added this API new

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a2b2479d20d029f5a11dba8cf7f7ca3e4a5bbbe2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...se-closefrom-on-linux-and-glibc-2.34.patch | 24 +++++++++++++++++++
 meta/recipes-support/gpgme/gpgme_1.13.1.bb    |  3 ++-
 2 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch

diff --git a/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch b/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
new file mode 100644
index 0000000000..1c46684c6d
--- /dev/null
+++ b/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
@@ -0,0 +1,24 @@
+From adb1d4e5498a19e9d591ac8f42f9ddfdb23a1354 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 15 Jul 2021 12:33:13 -0700
+Subject: [PATCH] use closefrom() on linux and glibc 2.34+
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/posix-io.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/posix-io.c b/src/posix-io.c
+index e712ef2..ab8ded9 100644
+--- a/src/posix-io.c
++++ b/src/posix-io.c
+@@ -570,7 +570,7 @@ _gpgme_io_spawn (const char *path, char *const argv[], unsigned int flags,
+               if (fd_list[i].fd > fd)
+                 fd = fd_list[i].fd;
+             fd++;
+-#if defined(__sun) || defined(__FreeBSD__)
++#if defined(__sun) || defined(__FreeBSD__) || (defined(__GLIBC__) && __GNUC_PREREQ(2, 34))
+             closefrom (fd);
+             max_fds = fd;
+ #else /*!__sun */
diff --git a/meta/recipes-support/gpgme/gpgme_1.13.1.bb b/meta/recipes-support/gpgme/gpgme_1.13.1.bb
index 6e945d3165..dacc9896e4 100644
--- a/meta/recipes-support/gpgme/gpgme_1.13.1.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.13.1.bb
@@ -20,7 +20,8 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0006-fix-build-path-issue.patch \
            file://0007-python-Add-variables-to-tests.patch \
            file://0008-do-not-auto-check-var-PYTHON.patch \
-          "
+           file://0001-use-closefrom-on-linux-and-glibc-2.34.patch \
+           "
 
 SRC_URI[md5sum] = "198f0a908ec3cd8f0ce9a4f3a4489645"
 SRC_URI[sha256sum] = "c4e30b227682374c23cddc7fdb9324a99694d907e79242a25a4deeedb393be46"
-- 
2.25.1


