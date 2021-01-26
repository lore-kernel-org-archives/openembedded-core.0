Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web12.13000.1611672230975319937
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:43:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=aaJWZfYZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id m6so10556445pfk.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yc7Bcudw7YIh5mUPyyX64SC/ZQYdwas3EpoLdNRFVgg=;
        b=aaJWZfYZZP0b/iK9TrDcpnrOD16Wg8j53hy22mnl8UqutIsXTrKvT6ULuKgf7Vza5y
         5S5/BXiaZEhyJJZIqEGv3rB8s8IVGs5W98moEy6XO+mM+J1C2BtR/AgBjbUepg5meCSk
         ndHloqdByFhItKF60tnzldFNtV+2zTI1mvhtdN6Z4COrm4NSr6I4RAsGGhFx3FWk6Qfg
         D3QCUwADq5phsq4OUV59VgvSXXH+AZFhlqkNszAYsWwoaBl06dJrsRIPSiMHlrTjYiGR
         xHp+oPmW4ejcQG/S14xv4nvv4SaTO11nPLimYlApQ3RX21PZA0ZF9me+YxTe7nTxbBWd
         I4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yc7Bcudw7YIh5mUPyyX64SC/ZQYdwas3EpoLdNRFVgg=;
        b=eg759pmdsiQtIuOoA2LbAYGfeRKLJ7sGYUKOnyBIzG1MPP5UEtHGk3EbxBwJMneY35
         0lssXbrWRbY8yEcHHcsNoAZ6iAl07me6mLnHczTF6RzWQ2WJ2+NfCg46vedkaZQpG7eb
         RaF1O87mYoHyuZvTg4FMAW+M7LMaSojcXl7eCy+kkEg8a7pprp0E9muq7420dWyXwZP7
         5ASJXVeYzdZEhKn2hUQl2+MeVrZ81a6PBHeD+raFZ5D5JKz4b1H9CTsyZnePp8C571vu
         evCVFergHTBlrd1kTb7KutOmryO7OaS8qT2tl/b4jUQFdBYtRytVRt45Nx3IWOgBzNwf
         4Hhg==
X-Gm-Message-State: AOAM5335ACjuUNtAB9IUZpmN5JaMeF6hHkR01+HURwW1Jbhz5kps7RTc
	hN0g6ixaFyOkZbc5RNPueT4XGfcuAjGxPGaIVEQ=
X-Google-Smtp-Source: ABdhPJyvBHcMTiHFSuFY4WcXpj2uRWt6YKN+Wo+F+O7MOUHIJv4EZMhIJnac9hT4e7qBq9ojURBj9A==
X-Received: by 2002:a65:480c:: with SMTP id h12mr5900972pgs.169.1611672230026;
        Tue, 26 Jan 2021 06:43:50 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.43.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:43:49 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 36/46] bitbake.conf: Add /run/ to PSEUDO_IGNORE_PATHS
Date: Tue, 26 Jan 2021 04:41:47 -1000
Message-Id: <2369281241a28067c938aec80f848693832facef.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
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
index 8224c05ac9..01020c9823 100644
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

