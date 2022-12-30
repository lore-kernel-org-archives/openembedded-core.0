Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB21C4332F
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 21:12:16 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.28531.1672434734846911448
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 13:12:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WCC9lU9k;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id o1-20020a17090a678100b00219cf69e5f0so26867175pjj.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 13:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2fbPnRz9gUMxN2JpmdNyhYRyhNCsTb4DmAjrbV8GvpU=;
        b=WCC9lU9k/N6eE9T4x7CLM1q7vFmGcrBJ4L0sqX+Cr0dT2hWiN/pEt4bSOF1DHZZtaM
         F0WosDmQIYyMiu8H1ckkipVHFDskjb+nIQfHLnWnaq9IXzaQrwLwq7VdkAs95NuP5kAl
         eVEvMxyRTRTDGszS04J8A2uSA3zBK+wF+poX49z+1UXQN2nWKVr+vgwNJu4NZsSgGSBj
         vbjae/XE338vKBSTal1o/KsB9uK+OYH1GDurCmcbpz5rWiSiEsK7I0OMnv0oZCmsDei8
         ekSYrD097QPvHwFdYvXhRg2pqdq35ShdnZ41K4d/QZwodAHTJpo9uAU3WiVGNx1VKfME
         XQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2fbPnRz9gUMxN2JpmdNyhYRyhNCsTb4DmAjrbV8GvpU=;
        b=gAgwdUiBexwwVWk3HsvZd8NNg2jCvDelAfee6nvSGv2Es+OXURIqrWuc0poOtVqcgz
         9r1vTEQdPiJConpEPSZuJDHaFMtzyNCDGk7PXyLok/Jxg8Vp/Vcmc9dhz1d+Yp8Y6Yfe
         BHDGWXv3+Uf9Ik42vKYUAzN01IHuZcdtpuOm7MC/Myl4uJqgZPDvYI+1gYGln8EFeFht
         TIf5NbZaqV22fUFQnKOdjC49M2zeoZ5hxFJzT8RrPSgu1fudGymdiOd1FOpfDNLx44VH
         alczlKBSre1RkE7FhWf75Uonz+j9osHD4a3cOytCLTrBlUXZAQFdEsMal13xMZjsygnm
         Jj+g==
X-Gm-Message-State: AFqh2kp7pbZaW75WdpvEIRbjKfxYVm6HamlEV9PkIWzZvPH2ItKcUe/o
	dNKAnnbHDt8KbPaDiBhzENOiT05eI/g=
X-Google-Smtp-Source: AMrXdXvVSvUYrL+9mxo5JRqDP+Qdemjk22LYdL99PvPxJ16X/8mEy01F4iZUxGkyXe70dAB+XgObNA==
X-Received: by 2002:a17:902:edc3:b0:189:e577:c83d with SMTP id q3-20020a170902edc300b00189e577c83dmr30438424plk.66.1672434734008;
        Fri, 30 Dec 2022 13:12:14 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id h16-20020a170902f55000b0019277df45a6sm3963341plf.53.2022.12.30.13.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 13:12:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] vulkan-samples: Do not use LFS64 APIs in spdlog
Date: Fri, 30 Dec 2022 13:12:11 -0800
Message-Id: <20221230211211.1260457-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 21:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175177

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ot-use-LFS64-functions-on-linux-musl.patch | 37 +++++++++++++++++++
 .../vulkan/vulkan-samples_git.bb              |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-Do-not-use-LFS64-functions-on-linux-musl.patch

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-Do-not-use-LFS64-functions-on-linux-musl.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-Do-not-use-LFS64-functions-on-linux-musl.patch
new file mode 100644
index 0000000000..f2bd7e510b
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-samples/0001-Do-not-use-LFS64-functions-on-linux-musl.patch
@@ -0,0 +1,37 @@
+From ce7a593e74c8e0c2ece15c73e7614d4f13a19a53 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 30 Dec 2022 13:04:08 -0800
+Subject: [PATCH] Do not use LFS64 functions on linux/musl
+
+On musl, off_t is 64bit always ( even on 32bit platforms ), therefore using
+LFS64 funcitons is not needed on such platforms. Moreover, musl has stopped
+providing aliases for these functions [1] which means it wont compile on
+newer musl systems. Therefore only use it on 32bit glibc/linux platforms
+and exclude musl like cygwin or OSX
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=246f1c811448f37a44b41cd8df8d0ef9736d95f4
+
+Upstream-Status: Submitted [https://github.com/gabime/spdlog/pull/2589]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/spdlog/details/os.h | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/include/spdlog/details/os.h b/include/spdlog/details/os.h
+index 8e8476f0..be0a67b8 100644
+--- a/include/spdlog/details/os.h
++++ b/include/spdlog/details/os.h
+@@ -227,7 +227,9 @@ inline size_t filesize(FILE *f)
+ #else // unix
+     int fd = fileno(f);
+ // 64 bits(but not in osx or cygwin, where fstat64 is deprecated)
+-#if !defined(__FreeBSD__) && !defined(__APPLE__) && (defined(__x86_64__) || defined(__ppc64__)) && !defined(__CYGWIN__)
++#if !defined(__FreeBSD__) && !defined(__APPLE__) && \
++    (defined(__linux__) && defined(__GLIBC__)) && \
++    (defined(__x86_64__) || defined(__ppc64__)) && !defined(__CYGWIN__)
+     struct stat64 st;
+     if (::fstat64(fd, &st) == 0)
+     {
+-- 
+2.39.0
+
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index de90a88502..6aabf2e3b8 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -9,6 +9,7 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=master;prot
            file://0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch \
            file://debugfix.patch \
            file://0001-Qualify-move-as-std-move.patch;patchdir=third_party/spirv-cross \
+           file://0001-Do-not-use-LFS64-functions-on-linux-musl.patch;patchdir=third_party/spdlog \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.39.0


