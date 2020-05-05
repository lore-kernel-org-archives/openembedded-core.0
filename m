Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web11.1526.1588648881405400327
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 20:21:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=xUjTkUzG;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.194, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f194.google.com with SMTP id 18so215982pfx.6
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 20:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ve4XCnFuLXkNHXlw/1SzaQASWarJaSabNwGq0ElhW3E=;
        b=xUjTkUzGSKNDHth4pqkyRYPVWOL+V28Kk7knjaDZ3rASoYDoSYgdkofeIEcaQTwjr3
         d6jm1dv2vpjoWm7Qzrm5FAgiWqCIiZqa/pf+Blk8ZigwFXp1JxpWPa54hld0elzdvtZ/
         0Boaxipej72fKg3ZSS8O6G0D5bFowNb7PQEFBwvAARC1fM2zEiZV9WuRWMz1PcY7yXWA
         vrM/IUJ6tYAm5g1tgJI2FsmfBqrmMXu/VdhUnaCp581uJ3GdQiHAxJYefSBGvxSqkGVQ
         ikobQOwRvfePyDec75xR7tczgQ+KY13N38ir3TAR+jWW5QYFw0ErbDQ3jryJ6FLQOtc4
         /qpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ve4XCnFuLXkNHXlw/1SzaQASWarJaSabNwGq0ElhW3E=;
        b=BtHIXIkgVVBrMByQm2bqIIJqi8b+o2QL7FTKYo6PLDN0IXu1YXMKGG9pAKrbzYbXIQ
         3E7ztQe2OCm5reLzgBz5YTFaQmiwfNbe6PQqsOFi1V4bDzKfRnAhSxjSHhvhz4KwwnMa
         7bWT4Azeva0Qtj28H1hlqpetsqItImwQsFU7JHVubURxmmi5fZtChWiYf8XyzLcIkSAZ
         869IyvlWGfJ2hqFG59BVIuaSOVaw16HRuKjZUJ4xwLYkoStXmjrRqc+C71e2Kg9hlvjI
         gAgWJx4oQprKxQMvlwNNnTbyS/Q7A7KA4aHHP4lBOSJHDy0BTfSnUXpqFQraTZZa0YA1
         lJsA==
X-Gm-Message-State: AGi0Pubu4HG31bHi2lmS3nsMgLw7KQOZOf/LDfwR4bY3kNI0FZ+cM0SC
	IJ2t19YkG3p/pnkUi4FUYOpocd2wR6cz3A==
X-Google-Smtp-Source: APiQypLHupOth5PRIcxkmnkVOryY+snWmVNlIl3g573osOshPyjSd4c436v4JS/1fyvaCvTuu/dk6w==
X-Received: by 2002:a63:e542:: with SMTP id z2mr1191544pgj.165.1588648879870;
        Mon, 04 May 2020 20:21:19 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 20sm503379pfx.116.2020.05.04.20.21.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 20:21:19 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 26/28] iputils: Initialize libgcrypt
Date: Mon,  4 May 2020 17:19:21 -1000
Message-Id: <8648c6497d1904b988059cbd72d1592caa8708d0.1588638879.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588638879.git.steve@sakoman.com>
References: <cover.1588638879.git.steve@sakoman.com>

From: Mingli Yu <mingli.yu@windriver.com>

Initialize libgcrypt on first use otherwise
there comes below warning when check the status
of the ninfod.service.
 # systemctl status ninfod.service
 * ninfod.service - Respond to IPv6 Node Information Queries
 Loaded: loaded (/lib/systemd/system/ninfod.service; enabled; vendor preset: enabled)
 Active: active (running) since Wed 2020-04-29 05:18:21 UTC; 36s ago
 Docs: man:ninfod(8)
 Main PID: 347 (ninfod)
 Tasks: 1 (limit: 9382)
 Memory: 1.2M
 CGroup: /system.slice/ninfod.service
 `-347 /sbin/ninfod -d

 Apr 29 05:18:21 intel-x86-64 systemd[1]: Started Respond to IPv6 Node Information Queries.
 Apr 29 05:18:24 intel-x86-64 ninfod[347]: Libgcrypt warning: missing initialization - please fix the application

Reference: https://salsa.debian.org/apt-team/apt/-/commit/4f489a8c7954cbbc9613e6b671c8efe87b9ced8c

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-iputils-Initialize-libgcrypt.patch   | 55 +++++++++++++++++++
 .../iputils/iputils_s20190709.bb              |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-extended/iputils/iputils/0001-iputils-Initialize-libgcrypt.patch

diff --git a/meta/recipes-extended/iputils/iputils/0001-iputils-Initialize-libgcrypt.patch b/meta/recipes-extended/iputils/iputils/0001-iputils-Initialize-libgcrypt.patch
new file mode 100644
index 0000000000..b56804cebe
--- /dev/null
+++ b/meta/recipes-extended/iputils/iputils/0001-iputils-Initialize-libgcrypt.patch
@@ -0,0 +1,55 @@
+From 8576e0c218634e6f7ed1b6ff02fa164fb0c75f86 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 29 Apr 2020 03:50:32 +0000
+Subject: [PATCH] iputils_md5dig.h: Initialize libgcrypt
+
+Initialize libgcrypt on first use otherwise
+there comes below warning when check the status
+of the ninfod.service.
+ # systemctl status ninfod.service
+ * ninfod.service - Respond to IPv6 Node Information Queries
+ Loaded: loaded (/lib/systemd/system/ninfod.service; enabled; vendor preset: enabled)
+ Active: active (running) since Wed 2020-04-29 05:18:21 UTC; 36s ago
+ Docs: man:ninfod(8)
+ Main PID: 347 (ninfod)
+ Tasks: 1 (limit: 9382)
+ Memory: 1.2M
+ CGroup: /system.slice/ninfod.service
+ `-347 /sbin/ninfod -d
+
+ Apr 29 05:18:21 intel-x86-64 systemd[1]: Started Respond to IPv6 Node Information Queries.
+ Apr 29 05:18:24 intel-x86-64 ninfod[347]: Libgcrypt warning: missing initialization - please fix the application
+
+Upstream-Status: Inappropriate [the upstream avoids linking to crypto libraries in
+                   commit 214ed83 common: copy md5 implementation to iputils project]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ iputils_md5dig.h | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/iputils_md5dig.h b/iputils_md5dig.h
+index bfa7f02..3cc3fbf 100644
+--- a/iputils_md5dig.h
++++ b/iputils_md5dig.h
+@@ -24,8 +24,17 @@ typedef struct {
+ 	gcry_md_hd_t dig;
+ } iputils_md5dig_ctx;
+ 
++void maybeInit()
++{
++	if (!gcry_control(GCRYCTL_INITIALIZATION_FINISHED_P))
++	{
++		gcry_control(GCRYCTL_INITIALIZATION_FINISHED, 0);
++	}
++}
++
+ static void iputils_md5dig_init(iputils_md5dig_ctx *ctx)
+ {
++	maybeInit();
+ 	if (gcry_md_open(&ctx->dig, GCRY_MD_MD5, 0) != GPG_ERR_NO_ERROR)
+ 		abort();
+ 	return;
+-- 
+2.24.1
+
diff --git a/meta/recipes-extended/iputils/iputils_s20190709.bb b/meta/recipes-extended/iputils/iputils_s20190709.bb
index 2aed6b56ca..545f3d5e87 100644
--- a/meta/recipes-extended/iputils/iputils_s20190709.bb
+++ b/meta/recipes-extended/iputils/iputils_s20190709.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/iputils/iputils \
            file://0001-ninfod-change-variable-name-to-avoid-colliding-with-.patch \
            file://0001-ninfod-fix-systemd-Documentation-url-error.patch \
            file://0001-rarpd-rdisc-Drop-PrivateUsers.patch \
+           file://0001-iputils-Initialize-libgcrypt.patch \
            "
 SRCREV = "13e00847176aa23683d68fce1d17ffb523510946"
 
-- 
2.17.1

