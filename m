Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.2605.1602108588598460596
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 15:09:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UOccOKQD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id p15so4073790wmi.4
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2020 15:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mK+DMFnpn1rdayTSbCSx+17GiUGcy+K95Yv2LdWfViY=;
        b=UOccOKQD2IMQ4mI+9kgLJy1+KvsU6i6U6RTl0Hz0oHF1TJi33NELrCrL/hsfAfASk5
         wlmN4ESYzTn9eglC/mxduNEOMhM00jTNrDfmIXFtflrP9UaIAiACTf7Y32RtSzG2HF5g
         wpj9GI9CE7g2d/+lAod0fvG4Vxo+8UJgsEB6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mK+DMFnpn1rdayTSbCSx+17GiUGcy+K95Yv2LdWfViY=;
        b=DtAu08qzE8TKaN1f3H22MVG4T49KovBvQIrI6DsJCzy61fNaX/jRynZ7Uvg01ti+dV
         v+6AXWm2guRZ8WgN9RA/Yxj+6WCjIDQmQL7Ja23nZB0vurt97uUETyhOAuHcCCKzU666
         Tr5FGM37VQZRcMS6fkWvn0pcXyNjsKYDnfJzyk/TewCITdwIwmKxbI/MvDpipNf3/JW/
         vER21+6hCBAWcihLS79bgsOj4/bEBm71hsp6LNLuh3RWzt9i+wE6WmP2zpHjCKYbyWSB
         e8XQAQi+ZuIq0IcpiIyQJRbMCw4IFNVFKa7H79a5YsiaRI3dok7fp6HbY293O1MTIgOb
         ztVQ==
X-Gm-Message-State: AOAM531Isf8UMx6OyKkWnuzgKyOUKS6dCA1aT9AQXbs+auXLcKFJW0gw
	4pOBBls18LVDeiznCeZChYXjRkMR0WFBZg==
X-Google-Smtp-Source: ABdhPJwfKm9b4IQpiizaFSJ2VmWJgxZi0nawi5f9dCIU5qJYZka6nEPecvw9tpLwxA6E4dquzuzGhw==
X-Received: by 2002:a1c:8057:: with SMTP id b84mr5303703wmd.116.1602108586647;
        Wed, 07 Oct 2020 15:09:46 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.c.8.7.1.0.8.4.a.6.c.a.3.f.8.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f8f3:ac6a:4801:78cf])
        by smtp.gmail.com with ESMTPSA id 71sm4008422wrm.20.2020.10.07.15.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 15:09:46 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: seebs@seebs.net
Subject: [PATCH] bitbake.conf: Extend PSEUDO_IGNORE_PATHS to ${COREBASE}/meta
Date: Wed,  7 Oct 2020 23:09:45 +0100
Message-Id: <20201007220945.3195191-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unfortunately, .pyc files can be generated in meta/lib/oe which corrupt the pseudo
database so we need to extend the ignore list to cover this as well.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e0f46b09cf4..1b5cde2cbbd 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -685,7 +685,7 @@ SRC_URI = ""
 PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
 PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
 PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
-PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts"
+PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${COREBASE}/meta"
 
 export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
-- 
2.25.1

