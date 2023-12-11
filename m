Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26004C4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 17:36:06 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.1386.1702316157088719800
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 09:35:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QJEz0ssy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40c339d2b88so33681355e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 09:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702316155; x=1702920955; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=l4JdpdXVeHEtzLccVGASZ9QNpDKXQXKqGzVV+u4luMs=;
        b=QJEz0ssyc/Neqgr+5S+yun5qf8Hs3QcxCGaqpFj33H2ukEWn8iU1+J9/AeAdea2ueQ
         A4Bs4sC/p8AiycMJe9WczTByG0/w74PlN9NQSuGDPdxD+G5c+++x4kgdXB1/wSGHkori
         +AtALPAXdz9aIIc7zSYJPahUYeYiI+Gh6j6nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702316155; x=1702920955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l4JdpdXVeHEtzLccVGASZ9QNpDKXQXKqGzVV+u4luMs=;
        b=kphfTO5zVfled3Wx8YWAVV7UwxqdA0C+mD8u91350XB6qOwrh0wecEgzIOna4zphz8
         Y1Q7r/m5r49hoHRnQPZi8+4/o2mzCtdGPChqoZZaSr2r8lH/1GfUbnp9tHjegX7oE2KF
         wGRvsyB0y9iKRIRU/kr1aWWMUc4mNWacYDrVE8DNYhFIR+IkcfL0NFRTGQuLLtPA3zkR
         1pMFJX6hCEcNnwTCC4jU0NHa2SNo1xp30nI8R0wlh6DmrmCNTi20q1AOSuUmOyU3yvrX
         fiJvdOrnKfj2RzeQbc/Fkg7/C2VTn1NJM3pjTao/PeB3FwE/gaTD9JmdpACgeRFfvoCn
         Atfg==
X-Gm-Message-State: AOJu0Yy3VX3laaTAmZk7UvNwICFLcrdFemZe7E2nRXpmC2guEnj1zgjC
	OLR2H1RoVoQlLTAEUsjYPOD5W/UM/x5W3qfKIzY=
X-Google-Smtp-Source: AGHT+IHA7fwixu7iHBnoyHB+jkQxsCtPl3jHCdZfEhhB3deAsEpZomV7ObH0Kssb9+rSZHaZgoNYFA==
X-Received: by 2002:a05:600c:1688:b0:40c:1db4:3a53 with SMTP id k8-20020a05600c168800b0040c1db43a53mr2339159wmn.157.1702316154452;
        Mon, 11 Dec 2023 09:35:54 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:cd7b:e198:4dbb:2063])
        by smtp.gmail.com with ESMTPSA id t9-20020a05600c198900b0040c490db950sm3435170wmq.47.2023.12.11.09.35.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 09:35:54 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH RFC] bitbake.conf/pseudo: Switch from exclusion list to inclusion list
Date: Mon, 11 Dec 2023 17:35:53 +0000
Message-Id: <20231211173553.2421931-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 17:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192183

Currently, pseudo tracks all files referenced within it's presence unless
they're listed in an exclusion list. The exclusion list has grown to be
fairly unwieldy.

This patch swaps PSEUDO_IGNORE_PATHS for PSEUDO_INCLUDE_PATHS which in
theory should be easier and more explicit to maintain.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf                     | 11 ++++-------
 meta/recipes-core/glibc/glibc-locale.inc   |  2 ++
 meta/recipes-devtools/pseudo/pseudo_git.bb |  4 ++--
 3 files changed, 8 insertions(+), 9 deletions(-)

For now I'm sharing this as an experiment to see if this is a change we want to
make. I'd be interested if anyone wanted to compare performance in particular. We
do need to run it through oe-selftest as I suspect there are issues to be identified
and tracked down. This patch was tested with basic image generation.

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e7826e7af96..bf639fe4f2a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -745,18 +745,15 @@ SRC_URI = ""
 PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
 PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
 PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
-PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,/run/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR}"
-PSEUDO_IGNORE_PATHS .= ",${TMPDIR}/sstate-control,${TMPDIR}/buildstats,${TMPDIR}/sysroots-components,${TMPDIR}/pkgdata"
-PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/deploy-,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/pkgdata-sysroot"
-PSEUDO_IGNORE_PATHS .= ",${DEPLOY_DIR},${BUILDHISTORY_DIR},${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR}"
+PSEUDO_INCLUDE_PATHS = "/tmp,/proc,/dev,${WORKDIR}/image,${WORKDIR}/package,${WORKDIR}/rootfs,${WORKDIR}/sstate-build-package/,${WORKDIR}/sstate-install-package/,${WORKDIR}/pkgdata,${WORKDIR}/minidebuginfo"
 
 export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
 #export PSEUDO_BINDIR = "${STAGING_DIR_NATIVE}${bindir_native}"
 #export PSEUDO_LIBDIR = "${STAGING_DIR_NATIVE}$PSEUDOBINDIR/../lib/pseudo/lib
-FAKEROOTBASEENV = "PSEUDO_BINDIR=${PSEUDO_SYSROOT}${bindir_native} PSEUDO_LIBDIR=${PSEUDO_SYSROOT}${prefix_native}/lib/pseudo/lib PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_IGNORE_PATHS=${@oe.path.canonicalize(d.getVar('PSEUDO_IGNORE_PATHS'))} PSEUDO_DISABLED=1 PYTHONDONTWRITEBYTECODE=1"
+FAKEROOTBASEENV = "PSEUDO_BINDIR=${PSEUDO_SYSROOT}${bindir_native} PSEUDO_LIBDIR=${PSEUDO_SYSROOT}${prefix_native}/lib/pseudo/lib PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_INCLUDE_PATHS=${@oe.path.canonicalize(d.getVar('PSEUDO_INCLUDE_PATHS'))} PSEUDO_DISABLED=1 PYTHONDONTWRITEBYTECODE=1"
 FAKEROOTCMD = "${PSEUDO_SYSROOT}${bindir_native}/pseudo"
-FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1 PSEUDO_IGNORE_PATHS=${@oe.path.canonicalize(d.getVar('PSEUDO_IGNORE_PATHS'))} PSEUDO_DISABLED=0"
+FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1 PSEUDO_INCLUDE_PATHS=${@oe.path.canonicalize(d.getVar('PSEUDO_INCLUDE_PATHS'))} PSEUDO_DISABLED=0"
 FAKEROOTNOENV = "PSEUDO_UNLOAD=1"
 FAKEROOTDIRS = "${PSEUDO_LOCALSTATEDIR}"
 FAKEROOTLOGS = "${WORKDIR}/pseudo/pseudo.log"
@@ -951,7 +948,7 @@ BB_HASHEXCLUDE_COMMON ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DI
     SSTATE_HASHEQUIV_METHOD SSTATE_HASHEQUIV_REPORT_TASKDATA \
     SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE GIT_CEILING_DIRECTORIES \
     OMP_NUM_THREADS BB_CURRENTTASK"
-BB_BASEHASH_IGNORE_VARS ?= "${BB_HASHEXCLUDE_COMMON} PSEUDO_IGNORE_PATHS BUILDHISTORY_DIR \
+BB_BASEHASH_IGNORE_VARS ?= "${BB_HASHEXCLUDE_COMMON} PSEUDO_INCLUDE_PATHS BUILDHISTORY_DIR \
     SSTATE_DIR SOURCE_DATE_EPOCH RUST_BUILD_SYS RUST_HOST_SYS RUST_TARGET_SYS"
 BB_HASHCONFIG_IGNORE_VARS ?= "${BB_HASHEXCLUDE_COMMON} DATE TIME SSH_AGENT_PID \
     SSH_AUTH_SOCK PSEUDO_BUILD BB_ENV_PASSTHROUGH_ADDITIONS DISABLE_SANITY_CHECKS \
diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index 289f58d4df9..d946b939ec3 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -64,6 +64,8 @@ FILES:localedef = "${bindir}/localedef"
 
 LOCALETREESRC = "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-locale"
 
+PSEUDO_INCLUDE_PATHS .= ",${WORKDIR}/locale-tree"
+
 copy_locale_files() {
 	local dir=$1 mode=$2
 
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 699cab11c66..daecb1554f5 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,6 +1,6 @@
 require pseudo.inc
 
-SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https \
+SRC_URI = "git://git.yoctoproject.org/pseudo;branch=rpurdie/include;protocol=https \
            file://0001-configure-Prune-PIE-flags.patch \
            file://glibc238.patch \
            file://fallback-passwd \
@@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "a8453eea4d902bbb0e01c786f1cb4a178c3bbee3"
+SRCREV = "97f343ddacdd308c54d298a9dde7019968aa959d"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git"
 
-- 
2.39.2


