Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web10.10556.1592494926980308107
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 08:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=zHllXbrL;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.176, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f176.google.com with SMTP id i74so5487051oib.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 08:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=aZWYJ0a7fYYr66YdEHj65sSRAn5AIrCJk5RfzeJBxdo=;
        b=zHllXbrLSKZ8SxBWnw7bwg/yHGln9zDepr/Xo2ftHzOAAPTTevDXdHaqCX9xGxUoLc
         v+EERZu68GPlGXnvqUozRd0r3AgzOPRqGDgHg/khcs6fivFY742Xym9DCl2ns6KFvDcL
         mFsbm1bveB2KrlMbDy2+ANu6g+f/qKD2e75YL3SAZdtuIZAY9w684l4LB/r/Nm8fHdw5
         cx4VR899v7pajw7jBX6mU1LeNc0EonYNSepldfam9Cpvrfnr4GrHbEfwWiG/ms0Xf0hm
         wWrMNQFm7OaOYnjVpaopSJNOwQjPZiBWb1+8fLDBcp9nPYa0EE+HjL19hzt6GjQdY3P5
         7OZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=aZWYJ0a7fYYr66YdEHj65sSRAn5AIrCJk5RfzeJBxdo=;
        b=e81otz0tt5bXvP19gCubM8hptldaTJ1AJnv7H7Aif3NVJznW2BLCv+6PMuyZ9y2r4G
         4HISHTG3SlPCS301SLL5EL2OV+Av8CjT16xAoMP1cHTaOtz/hUzVTWq58WFfHFcfW94M
         0PysNcKFQoaD/ZCG64/sDrsAmubOCG7o0yaF6TBKzjdkCcRH59gwLYxcpElkaWYzuCe5
         WfGO0RWtjPHQqDWIpLqmJxAZrnP/0DjbboREtvYiT0SaS8SpZUD4FtmAx+aQmuiPP8vE
         /ElwRHUraj/75mRPXc3fHEnknBcBq99w6wgR4bILSquR/hROYYA3ZeOTlzEXsyfPscmR
         LDGA==
X-Gm-Message-State: AOAM530HtW4etunBijPbo9RNIbaPaOrLx3F4xgxMIz262aSKSdqI15/z
	66r06V+xZJ7q7xB9Zejif3KPVspep3AtPQ==
X-Google-Smtp-Source: ABdhPJyorOKkH6Vy5xv7gX+IdL+w5bI5vUWGd0EGnqZY9+bgdU+fpwHP7w5A1YCwhWpAQTq1hSyYSQ==
X-Received: by 2002:aca:d612:: with SMTP id n18mr3333052oig.46.1592494925177;
        Thu, 18 Jun 2020 08:42:05 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id r7sm768843oor.9.2020.06.18.08.42.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 08:42:04 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/21] cpio: add patch to fix issues with gcc 10
Date: Thu, 18 Jun 2020 05:40:37 -1000
Message-Id: <21e5677cf239ff50142a31b034ce3316b1daa4bb.1592492076.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592492076.git.steve@sakoman.com>
References: <cover.1592492076.git.steve@sakoman.com>

From: Richard Leitner <richard.leitner@skidata.com>

gcc 10 introduced "-fno-common" as default. Therefore backport the
according cpio patch to fix this issue.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ca6e5511b59b585de793ff6424c7c6ccfcd8e61e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ove-superfluous-declaration-of-progr.patch | 28 +++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.13.bb       |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-extended/cpio/cpio-2.13/0002-src-global.c-Remove-superfluous-declaration-of-progr.patch

diff --git a/meta/recipes-extended/cpio/cpio-2.13/0002-src-global.c-Remove-superfluous-declaration-of-progr.patch b/meta/recipes-extended/cpio/cpio-2.13/0002-src-global.c-Remove-superfluous-declaration-of-progr.patch
new file mode 100644
index 0000000000..d48a3b0d19
--- /dev/null
+++ b/meta/recipes-extended/cpio/cpio-2.13/0002-src-global.c-Remove-superfluous-declaration-of-progr.patch
@@ -0,0 +1,28 @@
+From 33e6cb5a28fab3d99bd6818f8c01e6f33805390f Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Mon, 20 Jan 2020 07:45:39 +0200
+Subject: [PATCH] src/global.c: Remove superfluous declaration of program_name
+
+Upstream-Status: Accepted (commit 641d3f4)
+Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
+---
+ src/global.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/global.c b/src/global.c
+index fb3abe9..acf92bc 100644
+--- a/src/global.c
++++ b/src/global.c
+@@ -184,9 +184,6 @@ unsigned int warn_option = 0;
+ /* Extract to standard output? */
+ bool to_stdout_option = false;
+ 
+-/* The name this program was run with.  */
+-char *program_name;
+-
+ /* A pointer to either lstat or stat, depending on whether
+    dereferencing of symlinks is done for input files.  */
+ int (*xstat) ();
+-- 
+2.26.2
+
diff --git a/meta/recipes-extended/cpio/cpio_2.13.bb b/meta/recipes-extended/cpio/cpio_2.13.bb
index ecea8c6d8e..9e35a80f8b 100644
--- a/meta/recipes-extended/cpio/cpio_2.13.bb
+++ b/meta/recipes-extended/cpio/cpio_2.13.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 
 SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
+           file://0002-src-global.c-Remove-superfluous-declaration-of-progr.patch \
            "
 
 SRC_URI[md5sum] = "389c5452d667c23b5eceb206f5000810"
-- 
2.17.1

