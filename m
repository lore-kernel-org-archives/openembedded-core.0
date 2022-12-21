Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA2EC3DA79
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 17:56:05 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.25705.1671645356687858605
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 09:55:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OspETfMB;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id u7so8074770plq.11
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 09:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=22adWtZz6ccwUWOv98BnBMIGxrxJQzUiBCG8CTgxVak=;
        b=OspETfMBG9NeraAjOnV8nhn2jhWBFoeVnDYfeAHhcH1krx8Z7z1TgfViIuP4/JN7tc
         niCg9UJAD3aqWYqj5uUD243HxSrFrZCF0Ptl9bJSgU4BYcBmKG72fhybZrhBWeDeawKK
         UyyC81+t9n6qdgA6rAuqmk/CER6tHcdwWRUa4vpHPUxMX4Nrx2UP5hwymOSHEf3maK5+
         +t1MhgcsRuYHmHhS5V3keHxh7KXvxisWr6cbRO9uw79MUSMIRF1SbcDUB5YpRLXjSVa4
         moDZGS0nHuaWKQYbzBbGtAzk977/9NxQRIWXell1pYvncXS3JJaeZ8B23BJfi3es8+Bv
         7nTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=22adWtZz6ccwUWOv98BnBMIGxrxJQzUiBCG8CTgxVak=;
        b=n1cZJD4m01/k9bpU7I1CCuf2g0Rj+jo4Jj9cupOTdBcfmHFQRn1TGa7lqgDhJq2VGK
         3jxdWGtZaqvTQwwLNCj+E0frvMbsxr28XkmYn6zLGHuOkaFphCu9f7xnxAS9o+dzooGy
         N9fJT3lERA9X4EH61VLAheaaxcAP9nJv+U/e5cPzOJDDsseOnXNU8E7H+mCPlB3l2SOe
         +rhdsUIaK5HAcDCKZ085hDM8QB6FtSpQshZq+Wo6hSMj1YE/W5w4PKk7IHrqIACm5GqA
         udpkW/eR8/4z3OfUeQs1KDWxZCG92AOKkoxvTG7/6d2E+roRWzKerPYugIBiR489UyrX
         lPtw==
X-Gm-Message-State: AFqh2kr9Meoi0IY+tjK2D/PlfSOPNb4Cdwqz7lks+TvKcnDPs4wz3OAq
	QUJlpKam18mWz1i6F3SNep8kbAjZJoU=
X-Google-Smtp-Source: AMrXdXsGFVIGNYg8v8vvmIaL8MvEOH/9Y1JuInzVmfSk0pxC//Lf6eNWZRuGKko3hMMGpImwstASpQ==
X-Received: by 2002:a17:90a:4fe6:b0:219:9bae:6026 with SMTP id q93-20020a17090a4fe600b002199bae6026mr2954896pjh.45.1671645355822;
        Wed, 21 Dec 2022 09:55:55 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::41f2])
        by smtp.gmail.com with ESMTPSA id x11-20020a17090a294b00b00225a127b2a2sm1548943pjf.5.2022.12.21.09.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 09:55:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/9] virglrenderer: Replace lseek64 with lseek
Date: Wed, 21 Dec 2022 09:55:45 -0800
Message-Id: <20221221175551.1940464-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221175551.1940464-1-raj.khem@gmail.com>
References: <20221221175551.1940464-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 17:56:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174928

Fix build with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Replace-lseek64-with-lseek.patch     | 45 +++++++++++++++++++
 .../virglrenderer/virglrenderer_0.10.3.bb     |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-Replace-lseek64-with-lseek.patch

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-Replace-lseek64-with-lseek.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-Replace-lseek64-with-lseek.patch
new file mode 100644
index 0000000000..a0278abd28
--- /dev/null
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-Replace-lseek64-with-lseek.patch
@@ -0,0 +1,45 @@
+From a60f0658001d2e8e15ad980731d4130808d37d56 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 15 Dec 2022 12:58:57 -0800
+Subject: [PATCH] Replace lseek64 with lseek
+
+meson defined _FILE_OFFSET_BITS=64 unconditionally, this implies that
+lseek and lseek64 are both same since they are using 64bit off_t,
+replacing lseek64 with lseek also helps in compiling with latest musl C
+library which has removed these from _GNU_SOURCE namespace unlike glibc
+where _GNU_SOURCE also implies _LARGEFILE64_SOURCE and the definition of
+lseek64 is still available.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1003]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/proxy/proxy_context.c | 2 +-
+ src/venus/vkr_context.c   | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/proxy/proxy_context.c b/src/proxy/proxy_context.c
+index f2a035b..f20f7c8 100644
+--- a/src/proxy/proxy_context.c
++++ b/src/proxy/proxy_context.c
+@@ -319,7 +319,7 @@ validate_resource_fd_shm(int fd, uint64_t expected_size)
+       return false;
+    }
+ 
+-   const uint64_t size = lseek64(fd, 0, SEEK_END);
++   const uint64_t size = lseek(fd, 0, SEEK_END);
+    if (size != expected_size) {
+       proxy_log("failed to validate shm size(%" PRIu64 ") expected(%" PRIu64 ")", size,
+                 expected_size);
+diff --git a/src/venus/vkr_context.c b/src/venus/vkr_context.c
+index 9ecb9cd..1e5dc68 100644
+--- a/src/venus/vkr_context.c
++++ b/src/venus/vkr_context.c
+@@ -359,7 +359,7 @@ vkr_context_get_blob_locked(struct virgl_context *base,
+          return ret;
+ 
+       if (fd_type == VIRGL_RESOURCE_FD_DMABUF &&
+-          (uint64_t)lseek64(fd, 0, SEEK_END) < blob_size) {
++          (uint64_t)lseek(fd, 0, SEEK_END) < blob_size) {
+          close(fd);
+          return -EINVAL;
+       }
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.10.3.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.10.3.bb
index 3480eb954d..5d483431a7 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.10.3.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.10.3.bb
@@ -12,6 +12,7 @@ DEPENDS = "libdrm libepoxy virtual/egl virtual/libgbm"
 SRCREV = "0922041ec6730122e0fec11404e6859e2efc4bc0"
 SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=master;protocol=https \
            file://0001-meson.build-use-python3-directly-for-python.patch \
+           file://0001-Replace-lseek64-with-lseek.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.39.0


