Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.73633.1629400171345153229
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 12:09:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=YUD0lfTU;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.50, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f50.google.com with SMTP id v33-20020a0568300921b0290517cd06302dso9938926ott.13
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 12:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dnz+S1ekIGDskSyAd6ZJgvcxCX6paNofsm1dZIRsPkM=;
        b=YUD0lfTUg46VqiM2Cl/mZ23E2gnoYDH/7hUrTJ17w+/jq8CiCKRhFCf/m+wAqGg+Ov
         3hGJ4qlBZecYP0jOmR365raCXPCzLREtqbRNpW0bP4k6U91WsJsBfFP6HctzUGGsDBLc
         /tvFo3cafERgJ0+tgNAqgTHjm1DZYJ4ZnRR3lkC5UPfpAv+pSdek2rwL1rDZNMsHDUDk
         NuVPG/Sm4it646WK6ZNpBeTNqwhN8Gy8WPgJDb4qu0KmpOLCWZhMFsLz0VuO5Pj8Onsq
         KYb6f/eUyU0IevLmt0FD4XFprweeODkH0tzKdEcVFHP+7wSbVwShlYV9GhQUXUN9JVSf
         GKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dnz+S1ekIGDskSyAd6ZJgvcxCX6paNofsm1dZIRsPkM=;
        b=B9zwsr7p/fcvnYSfuoK37cKtbGQ9LwX/Y4skwK/irhqP0y2ny7Nf8HuacBbknoLj0u
         6NBaryhJ0XeKwiBFUqeeZ+fgHQEAQbtXy5k+YfmwnfbtETb2siMWDkCNj3gelox6Kk+6
         CbDJyaJZcExbs34DceZX0G8FUyWFMVgu80E1mPRi0vnC8C6Kg6/jIwsrXdQQm8ASOYt0
         kRSWMk5rNcVkutTjee/e+7WLSS3SUCt6tUfTPOHKRD1qXHgh/UOlEH0CmUdvH7rtnJ0n
         VmNdWjWqeKEyZznYVZ+U4StKOwSLaIEB3/LQNL085A8KWHZfS7EnY/65Ni6fWB0WfD2V
         aptg==
X-Gm-Message-State: AOAM530KMJToYv8Vc5X7pnEmsvRTweR1Bvkak89NAbGOldKjOYcJ7xX3
	rgLXLsZWNKx3iV0H+E/T9WI+htRr39XV/jxr
X-Google-Smtp-Source: ABdhPJw7i3EWYzl58C93TDYQYowAvogp7xbTKVEKWIspu4rP8DuD3fWjQtijqmEW/yEAa/LD+p69mA==
X-Received: by 2002:a9d:4683:: with SMTP id z3mr12683939ote.95.1629400170343;
        Thu, 19 Aug 2021 12:09:30 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s10sm765080oog.14.2021.08.19.12.09.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 12:09:29 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/12] sdk: Enable do_populate_sdk with multilibs
Date: Thu, 19 Aug 2021 09:08:02 -1000
Message-Id: <eea71d274fe4d5f23ba0ab35d14be4fff2e64e2b.1629399953.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629399953.git.steve@sakoman.com>
References: <cover.1629399953.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

This patch enables building image based SDKs for multi-libbed images
e.g. lib32-core-image-minimal and so on. Change the path to nativesdk
tools to use recipe-sysroot since thats where the nativesdk components
are installed and it will need access to qemu wrappers during build for
processing intercepts

[YOCTO #14444]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6196a785eababb040ee1dee9f33cb6d6dad77eef)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/multilib.bbclass          | 1 -
 meta/classes/populate_sdk_base.bbclass | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index ee677da1e2..9a8b02d4f6 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -106,7 +106,6 @@ python __anonymous () {
         d.setVar("LINGUAS_INSTALL", "")
         # FIXME, we need to map this to something, not delete it!
         d.setVar("PACKAGE_INSTALL_ATTEMPTONLY", "")
-        bb.build.deltask('do_populate_sdk', d)
         bb.build.deltask('do_populate_sdk_ext', d)
         return
 
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index ca56d803cb..b46f1aed27 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -66,7 +66,7 @@ python () {
 
 SDK_RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
 SDK_DEPENDS = "virtual/fakeroot-native ${SDK_ARCHIVE_DEPENDS} cross-localedef-native nativesdk-qemuwrapper-cross ${@' '.join(["%s-qemuwrapper-cross" % m for m in d.getVar("MULTILIB_VARIANTS").split()])} qemuwrapper-cross"
-PATH_prepend = "${STAGING_DIR_HOST}${SDKPATHNATIVE}${bindir}/crossscripts:${@":".join(all_multilib_tune_values(d, 'STAGING_BINDIR_CROSS').split())}:"
+PATH_prepend = "${WORKDIR}/recipe-sysroot/${SDKPATHNATIVE}${bindir}/crossscripts:${@":".join(all_multilib_tune_values(d, 'STAGING_BINDIR_CROSS').split())}:"
 SDK_DEPENDS += "nativesdk-glibc-locale"
 
 # We want the MULTIARCH_TARGET_SYS to point to the TUNE_PKGARCH, not PACKAGE_ARCH as it
-- 
2.25.1

