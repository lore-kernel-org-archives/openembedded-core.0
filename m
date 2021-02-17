Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.138.1613602016772823421
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 14:46:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZN5o1Tb+;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id c17so17943326ljn.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 14:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fqyjx56/l54+RAHscEyt/GF41l3umO6GaYF/gSFC7Wg=;
        b=ZN5o1Tb+liDdgiQJDnCh++vKo+6UcN0qkIYrABDAiqp5Bu1OEn931guiQjRHzPZQtu
         AzaEFMLsXpQeyxTir5zXAcU6LBY4TzUjDeE6n9WgU96C9UQwiFdJYKDVMGPbyJFLy0Um
         CRW0sGJnx7t8eo/T6G2n37qm6r+5SUoNWN4464dKqfaaq8DGH1a2OIBpOrSk4ZmjGWfr
         ZOlQtQOz+N063mNMFeHJz4HiRBs+0NtnOy2xiW3/5ALnIKY3hsTMPO30yY6nItg6n//Y
         2+Kj8mmxI2K/ux+jqjZ1dOX/6d2daAxcZ/WBrxTcQ3UBZxGRgv5mwFqVTZ8cmofcjqVg
         xcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fqyjx56/l54+RAHscEyt/GF41l3umO6GaYF/gSFC7Wg=;
        b=mvYlDjwM3aAAeP0FeQf/I50d+kC3kPqiltkFmU3pWK4HZ3jwD0a44sLEoFm0Pl0cFf
         Zmh54W9B/nIsKNJhjOZZ2j87zr+87MmDZ6LVsavI7hsQQ2YrxTyaYKLJZI8bF42ZV9JY
         pM3e58ZJsNx2ln7iHxsQOk/3QJJZ3aE/WsDS7oarTbNrafnKmhfk4WsC+eZO2w+Fz91r
         aX1v4GutUe7VRdnFiiNxqxqIxYbfqeNpeFJE0/tm9JRcjqBSbcIkI0ANuQ9sltbWOc0m
         07kw/EQVMxMfHv1jP3oHNVYh4lONk4j5xEC/B5YY4LYJt6lyecw/X3UbxwzD+lxRgi03
         XYhg==
X-Gm-Message-State: AOAM5327zccX66pYUOK5kgmmimnzV9uRwzrmIlIEzhCdjKqKnigPm0WX
	7OmPJhmozyvResVjH8pAA3X9t2rUXG0=
X-Google-Smtp-Source: ABdhPJx7DyRY10+K+4KwZsS7rf5h2XZkSJbb/Q5h+1jnRkk1h8+xWoPso4yr/QNIFZZqMTzV3S1RXA==
X-Received: by 2002:a2e:505d:: with SMTP id v29mr761706ljd.393.1613602013602;
        Wed, 17 Feb 2021 14:46:53 -0800 (PST)
Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from localhost.localdomain (h124200.man.tk-internet.pl. [93.175.124.200])
        by smtp.gmail.com with ESMTPSA id w26sm394520lfr.186.2021.02.17.14.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 14:46:52 -0800 (PST)
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [PATCH] bitbake.conf: Add sstate-build-populate_sdk and intercept_scripts- to PSEUDO_IGNORE_PATHS
Date: Wed, 17 Feb 2021 23:49:15 +0100
Message-Id: <20210217224915.23546-1-tomasz.dziendzielski@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recipes using populate_sdk.bbclass are failing with pseudo abort due to
path mismatch on these paths.

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 375467d155..c234c75823 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -683,7 +683,7 @@ SRC_URI = ""
 PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
 PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
 PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
-PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,/run/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR}"
+PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,/run/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${WORKDIR}/sstate-build-populate_sdk,${WORKDIR}/intercept_scripts-,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR}"
 
 export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
-- 
2.30.1

