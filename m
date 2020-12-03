Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.11681.1607008172225836035
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 07:09:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=uw9qDyyU;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id n7so1581419pgg.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 07:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=gPBWcr5BI8rFdZwGmi1fHOpytoRFlbFuHH/mk7sl22U=;
        b=uw9qDyyUYoo6eCzeVSOgS+3Kum9drlJp8ynPwefmwWBDDFtZ/eTney2RmF3DkTH/4b
         QJG5gL91iF+GK6l77y9nVCPQb7t3CBbV2JofpMMFYVKwdliiZQOWujAsyLFS1CgBcN1Y
         PoRFjqT0Ay/mXZmyuxojQOYkZOiXSP9hu/IkLqRE+djYzKisA/Pvvcy0FhyD6yqwS4PZ
         rveXCduqMcJhIj2E0mX3ZjO7lt/BPdK3Zk3ZN5yhuzmPmj6xkpSEEhpSmWFLuVfEBlPI
         UmsnYLOJ8pmfQcJCZKn1Mm45CsTz6QoxGQJqJQj68BXf5n8jaNwQ/ukPQ+TLg+FIYqDE
         i60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=gPBWcr5BI8rFdZwGmi1fHOpytoRFlbFuHH/mk7sl22U=;
        b=CMZDN8IUsnoNuWe8BlkJTffT7zSGeDDh2lB6qFuCL7EdL90QDRhSIYpZ6EE3alBzvd
         AzO+7wQLvA7ZEnVmC2gqYau+Fk+XoEMM4LSuiawSXi19Fub3exgO+sN940GpZ15Bmw1q
         2ErR17Ah3Kf4kpnZl4HlbknEOJAVNwQpXakMAA5zGcrbMx/7LuRXLN3YTum/N9j2jbMJ
         BQVQASge4I9vBOEY5ae2fNRAAuYF/oLomIvEUPZnqtQGx4v+OHWQngSO577q41aaQQza
         yTsvOxjVoeFeDf+bdFTCzCewcMgsxsOkiVT5OjiMNwmtHe8G2C779jQ+L6Kt5+ytgyX5
         z5oA==
X-Gm-Message-State: AOAM532688roglfI2euLfDV+oMoLvW3s3qweK3LdD2Md75IHpX9EeLnW
	Gb0oKb4iK+q0YfiiUyq5C+tQY9NJqjBBvb9A
X-Google-Smtp-Source: ABdhPJwyH1Lkh7Tn4O5OAoz8f738VRrtKDqfSJq3GWl3uYxdxHSSSz1MHSTtFkaYvCu3ML/yPrXFHQ==
X-Received: by 2002:a05:6a00:16c5:b029:19b:696:28a0 with SMTP id l5-20020a056a0016c5b029019b069628a0mr3656084pfc.9.1607008171005;
        Thu, 03 Dec 2020 07:09:31 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s7sm1632320pju.37.2020.12.03.07.09.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 07:09:30 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/28] bitbake.conf: Extend PSEUDO_IGNORE_PATHS to ${COREBASE}/meta
Date: Thu,  3 Dec 2020 05:08:10 -1000
Message-Id: <80a6b7103ea2754422d7633e44dcf04fb38bd2d8.1607007208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607007208.git.steve@sakoman.com>
References: <cover.1607007208.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Unfortunately, .pyc files can be generated in meta/lib/oe which corrupt the pseudo
database so we need to extend the ignore list to cover this as well.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e0cb6dd689a362d8433caa14cc5a9fdd5eb44923)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 93a27521fd..922972967f 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -686,7 +686,7 @@ SRC_URI = ""
 PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
 PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
 PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
-PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts"
+PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${COREBASE}/meta"
 
 export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
-- 
2.17.1

