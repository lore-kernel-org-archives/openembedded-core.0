Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46FE4C10F1B
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 17:56:05 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.25704.1671645355384025393
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 09:55:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M93INk9H;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id o1-20020a17090a678100b00219cf69e5f0so3113788pjj.2
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 09:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gRaWmimR/UuiA2qyOcG35DWCbkk6P3FOlI/DKvTG0LQ=;
        b=M93INk9HwuuJqG2sVm5fDaXh1VAO8Iz6wLOOLcNkGgyENNRiYKDb0/vOsitku2bRn0
         daOJyK/Kyqp1sblJ3K0/JjUPZqVz4y3yGjtpL4SGvBf2hEcamlA6IpD1FXaU5+xV6wlC
         Zh/4kaB908fLL3pYY4fwTvpjYtaHtmQCQylBf8JNEit8fXNLEgef7Cb1d+gxYsAwXokf
         Ud+vKZ8x4akUpjPtceire0W+cNritRFq7lyDGx3qsd67SCEEmmuVvVZddH+Ih56HlZNa
         quSAx9iEq+7tglkHb2rbGaok49W7tV19dra6NCxdCb6AL+EFF4iXb4Zp0u8PMu3pdm1Y
         iR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gRaWmimR/UuiA2qyOcG35DWCbkk6P3FOlI/DKvTG0LQ=;
        b=BwRGhX29ypzvsEFTmiSASWasoTAJlOdSsbqRvGM8SlSz8MzOxpvQQDgvMRhNXhdNUH
         7x+zwBYMYSux0hFSwCqZHZ09YxXLC45YyXHvnNscqnQEiVH+EjT23RmuDhtR42j734/P
         Uji7+VhG+36MvK4Xfw0S0gIm8+5iqcaN9yuUTJUwu7jZ517BHZsmC+tgb6lBoCCIp3gp
         heYjDs/uWake/dGZFB6OHhk8cZHa38XDMgG68bfpM/1DdwGs9wkuHBdi3saTf7jiHoun
         wt4hLydQHl20sa9Ca5aX9i4tgdfQTwaNpSFh/zn5EeZ3a5ccktVKhFJkOWr9HqW3gML4
         KHXA==
X-Gm-Message-State: AFqh2krY6yaQpQTHRZfUxaJr8FbXmiVr9td1X+kWxHl9xBwvWhuHWxjM
	wo6IiymPHrsn3iKiZtS9B0QqospM3mo=
X-Google-Smtp-Source: AMrXdXtjXBAtsY7UcrvSzNhpu4rEgycc3FPli4glfVK5crYbdBa5Nrc4lKvXKqV6Plj5oVBBjH9TCg==
X-Received: by 2002:a17:90a:1642:b0:219:ba34:a60 with SMTP id x2-20020a17090a164200b00219ba340a60mr3168547pje.43.1671645354306;
        Wed, 21 Dec 2022 09:55:54 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::41f2])
        by smtp.gmail.com with ESMTPSA id x11-20020a17090a294b00b00225a127b2a2sm1548943pjf.5.2022.12.21.09.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 09:55:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/9] libbsd: Fix build with largefile support
Date: Wed, 21 Dec 2022 09:55:43 -0800
Message-Id: <20221221175551.1940464-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 17:56:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174926

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-off64_t-with-off_t-in-funopen_seek.patch | 34 +++++++++++++++++++
 meta/recipes-support/libbsd/libbsd_0.11.7.bb  |  4 ++-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libbsd/libbsd/0001-funopen-Replace-off64_t-with-off_t-in-funopen_seek.patch

diff --git a/meta/recipes-support/libbsd/libbsd/0001-funopen-Replace-off64_t-with-off_t-in-funopen_seek.patch b/meta/recipes-support/libbsd/libbsd/0001-funopen-Replace-off64_t-with-off_t-in-funopen_seek.patch
new file mode 100644
index 0000000000..45ecef041b
--- /dev/null
+++ b/meta/recipes-support/libbsd/libbsd/0001-funopen-Replace-off64_t-with-off_t-in-funopen_seek.patch
@@ -0,0 +1,34 @@
+From 9c4e5f8984e46344c9e150764b8aa0a7a70b6cb5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 15 Dec 2022 09:02:22 -0800
+Subject: [PATCH] funopen: Replace off64_t with off_t in funopen_seek
+
+AC_SYS_LARGEFILE in configure.ac is setting needed defines to make
+64bit off_t on relevant platforms.
+
+Fixes build on musl
+
+| ../../../../../../../../workspace/sources/libbsd/src/funopen.c:68:28: error: unknown type name 'off64_t'; did you mean 'off_t'?
+| funopen_seek(void *cookie, off64_t *offset, int whence)
+|                            ^~~~~~~
+|                            off_t
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/libbsd/libbsd/-/merge_requests/24]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/funopen.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/funopen.c b/src/funopen.c
+index 1e6f43a..a9b40e8 100644
+--- a/src/funopen.c
++++ b/src/funopen.c
+@@ -65,7 +65,7 @@ funopen_write(void *cookie, const char *buf, size_t size)
+ }
+ 
+ static int
+-funopen_seek(void *cookie, off64_t *offset, int whence)
++funopen_seek(void *cookie, off_t *offset, int whence)
+ {
+ 	struct funopen_cookie *cookiewrap = cookie;
+ 	off_t soff = *offset;
diff --git a/meta/recipes-support/libbsd/libbsd_0.11.7.bb b/meta/recipes-support/libbsd/libbsd_0.11.7.bb
index 7a1deed1f6..a9f7a00469 100644
--- a/meta/recipes-support/libbsd/libbsd_0.11.7.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.11.7.bb
@@ -32,7 +32,9 @@ LICENSE:${PN} = "BSD-3-Clause & ISC & PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=75e85c5a558f86d10fbd5abc567ea5e6"
 SECTION = "libs"
 
-SRC_URI = "https://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
+SRC_URI = "https://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
+           file://0001-funopen-Replace-off64_t-with-off_t-in-funopen_seek.patch \
+           "
 
 SRC_URI[sha256sum] = "9baa186059ebbf25c06308e9f991fda31f7183c0f24931826d83aa6abd8a0261"
 
-- 
2.39.0


