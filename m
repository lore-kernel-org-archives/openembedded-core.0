Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.2867.1614026088352953599
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 12:34:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YG2jqI2E;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id y7so58436943lji.7
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 12:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bHZ2PwkhPIu2PqwtYg+2SzyyWOB2hyCwnO2GowoLPa8=;
        b=YG2jqI2E+mWZdkjQptU7WsWqhL5ODUo8lggaABMY4AckGvyMkb1iV2sLoiwIpNKiS+
         1l1n+mWrEUp8tisoX42K+sqHxKHjC+WSqzW9lMBLfHH2msmEIFbPG17DzCVgA1UmqofH
         hiBi+T6pgVwEq53jCS7Kn7R7IOvuNIxYlrw117zxx+dZmkS6vaqxXPDnlwhr9sjsnxZK
         uYnQCYpuB60iFeVotTlg5uuZJdSIeCtr1qQU1kfvUuy98hHUCqGwWWIAQR7+Mi6QFCPl
         JW9kH0brrdvRXtXdrtdoAWKhny8l83MhQPWs3O8CGR/Z/6JDzZVqztdpugeWfjDBGqZ3
         G4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bHZ2PwkhPIu2PqwtYg+2SzyyWOB2hyCwnO2GowoLPa8=;
        b=hK7weofvq5RYdcslFb4zm8SBY5ckqLLMtfZDJSLFb1k/oouBwBXYWrRJDqMsG1keV7
         sYZVAKSdRxPqFRdr4vrgETEzS7kPfFbemG1F3VY9jQQ4UFmUSgznKQM3xTkF6w3S2yWR
         pg2CnkazeQI8mHJbLXphzjpJNsp2q9dy6e09JXrqnY5+KuduesyXOb6H/dsatj9W9+yY
         Cj1gSJc6chH2LRVFyXogLW02BVkmoL4HZVmd3FMVRrk6K0fdrmUy5TXToxag4WrsGO4f
         VZEBzz5Riq5i3ph/fyL1mIlGh4PIn5ibhFfJzQxBBM5lXeDasOJEAGPoM2rnFmilOOvR
         SrZQ==
X-Gm-Message-State: AOAM531+tZViTDibxZc/EU/phgIIy2YYfNwLpA1KIu0JI2oaH3VmirYV
	VDKZhcl+oOGo1UskwD6Nk+n8jMmhmaoqRA==
X-Google-Smtp-Source: ABdhPJzLgjTJdQIOVHTTetKzZg0ckeeDaviXhGKS3z/USH+Rt3PskRqGuIwfGtFHhpz6zPYy7ZqGjg==
X-Received: by 2002:a2e:3c13:: with SMTP id j19mr88314lja.130.1614026086426;
        Mon, 22 Feb 2021 12:34:46 -0800 (PST)
Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from localhost.localdomain (h124200.man.tk-internet.pl. [93.175.124.200])
        by smtp.gmail.com with ESMTPSA id z64sm2094135lfa.282.2021.02.22.12.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 12:34:46 -0800 (PST)
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: kergoth@gmail.com,
	Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [PATCH] bitbake.conf: Introduce PSEUDO_LOGFILE and FAKEROOTLOGS variables used by bitbake to print pseudo.log
Date: Mon, 22 Feb 2021 21:37:32 +0100
Message-Id: <20210222203732.9804-1-tomasz.dziendzielski@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bitbake depends on these variables while looking for pseudo.log file in
case of fakeroot task failure.

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
 meta/conf/bitbake.conf | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 375467d155..d0d8da6b90 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -681,6 +681,7 @@ SRC_URI = ""
 
 # Use pseudo as the fakeroot implementation
 PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
+PSEUDO_LOGFILE ?= "${WORKDIR}/pseudo/pseudo.log"
 PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
 PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
 PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,/run/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR}"
@@ -691,9 +692,10 @@ export PSEUDO_DISABLED = "1"
 #export PSEUDO_LIBDIR = "${STAGING_DIR_NATIVE}$PSEUDOBINDIR/../lib/pseudo/lib
 FAKEROOTBASEENV = "PSEUDO_BINDIR=${PSEUDO_SYSROOT}${bindir_native} PSEUDO_LIBDIR=${PSEUDO_SYSROOT}${prefix_native}/lib/pseudo/lib PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_IGNORE_PATHS=${@oe.path.canonicalize(d.getVar('PSEUDO_IGNORE_PATHS'))} PSEUDO_DISABLED=1 PYTHONDONTWRITEBYTECODE=1"
 FAKEROOTCMD = "${PSEUDO_SYSROOT}${bindir_native}/pseudo"
-FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1 PSEUDO_IGNORE_PATHS=${@oe.path.canonicalize(d.getVar('PSEUDO_IGNORE_PATHS'))} PSEUDO_DISABLED=0"
+FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_LOGFILE=${PSEUDO_LOGFILE} PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1 PSEUDO_IGNORE_PATHS=${@oe.path.canonicalize(d.getVar('PSEUDO_IGNORE_PATHS'))} PSEUDO_DISABLED=0"
 FAKEROOTNOENV = "PSEUDO_UNLOAD=1"
 FAKEROOTDIRS = "${PSEUDO_LOCALSTATEDIR}"
+FAKEROOTLOGS = "${PSEUDO_LOGFILE}"
 PREFERRED_PROVIDER_virtual/fakeroot-native ?= "pseudo-native"
 
 ##################################################################
-- 
2.30.1

