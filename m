Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web12.363.1611586406456041413
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:53:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=nyyP8CpQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id h15so5254608pli.8
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OTExiDjGYhJgjxxwsVXxDaFRPOgWVHOSJon6eDQqXxw=;
        b=nyyP8CpQ39dEchNQCSjl1fhpXKo3YOOaPeUy1VKjNdMF6kU2gukxeHSe6DbK6jKOOj
         uXezx5eiw1YqQGVxpK7bTuQYznyjMRi3fI+XgoO1vpWXiVJG+5PcyfXzSMNhbTsp9gwA
         XAzEolu2FUEzMh4B1f4Txw1dxQmcTAHeEngIMMslfw7inp2/XuHkJWay5/SlbYqNDFga
         TJGYqSEGfltMVMz6ecS150rj4rDsu1rzXC7qCsfTxa4/+qTv4+1nIATfWUWNk1tUOZCR
         qJBv/DSZyLqZU41kSE1TV0q3uTa/gTpDGNrgH+2UJC13dSVnT0NMyM4Jje17gfMC8rvp
         JbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OTExiDjGYhJgjxxwsVXxDaFRPOgWVHOSJon6eDQqXxw=;
        b=tD6xEuKp50vsjmSBSxcZuVegYbhkHvmBJ0WzXS9MsD+6fzQZ94hZAPo195/qVwFBxF
         Sa0tEnYdGrQA4fqYd1wTb0Xz5J1g/LSpuOkncFibZVqdeImZ2CzeUlFbBtZoVeklD91e
         3yAiHPeoPEWjZGvY3VpT3iJ8+AszDR4Qv40jpGq7CYxpUFowzx77nMQ8xbMfdjT6NNOV
         U30VQD7quPAlEj+ezQargeX66FoSsC6N210P9IW4TKJBXukmPWgOHNc8R+1aB5uDGDVd
         iK5mt86DgyJ6xQeBgMANEXmwtkTXuQIHXqmpoki+T21bG4K3B8HH6yQ0r2szQlKnhwfl
         CRNQ==
X-Gm-Message-State: AOAM532tJMFab7cr/BuwNjUCcR6yy+hHXGbmgcaDyMamUEBgdMF3EjrF
	veWvkCnO1WNPk0hh/SvmyqQqpuqlzik2x0KsYzw=
X-Google-Smtp-Source: ABdhPJzuV/EgDHyDSIG1VRZvFolQ55TorPlNgu1nlkXcqqr2oxLnTqTiY2RnZm9+48sIDBHcC5lfog==
X-Received: by 2002:a17:90a:4314:: with SMTP id q20mr573868pjg.87.1611586405584;
        Mon, 25 Jan 2021 06:53:25 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.53.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:53:25 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 37/47] bitbake.conf: Add /run/ to PSEUDO_IGNORE_PATHS
Date: Mon, 25 Jan 2021 04:51:09 -1000
Message-Id: <54b27207b079df23509f5f10701d3a10201949c8.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Builds were failing on WSL2 which turns out to be due to accesses to
/run/ on those systems. Add this to PSEUDO_IGNORE_PATHS to fix
builds on WSL2.

[YOCTO #14175]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1d1bf51217e8b4d54af28739d3271484ee5a7974)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9257987f2a..1dcd9379d8 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -686,7 +686,7 @@ SRC_URI = ""
 PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
 PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
 PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
-PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR}"
+PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,/run/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR}"
 
 export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
-- 
2.25.1

