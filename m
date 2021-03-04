Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web09.1312.1614824645155381159
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 18:24:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E9coMUEb;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d12so15256716pfo.7
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Mar 2021 18:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DRTVXRb1qSMWa9eNWZNbAjnjuJe+e1SoO+oTYpsBGl8=;
        b=E9coMUEb8Ztu3uU9s7GAxdVm4w2DyrevRoz/A8maq6Kwdehl6NAOlEFyeJElGXWhhs
         MIyGEg4sCKFv2WT7wELIxECwTYggLnT4lMU8BLiKCqHJB1euuYmD3VsLii93uUx51OYC
         7GzAayDwA0bNsfMcvjg2g0ioL3ixAPlGrSRohgxm7dmCM+NYxD+CcXsPPuihhWAVg2oR
         cWxlfoIsUElZFKx3A7RXJmULWrputeSAxmUbILltMELlxcKhoYeMTUOlcsviXOj90SGe
         RQ/avlYST2lwP/WcizDKqEFaK0clfSXP7Os5U/AgiM0xQhMNGVIfQwJu5WEjEHVYnu7K
         L32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DRTVXRb1qSMWa9eNWZNbAjnjuJe+e1SoO+oTYpsBGl8=;
        b=UdzrqJ856L1/2hv71GtUSv9WblHiVAbnfALxAZ4kyruCLy42upofNontRRWs8Xkr1B
         upSH09MQbZxGUAdyQI1UbpBwr3QTAIwela1BAoYQ6pFWp9EvDpuNj1XeUmK3EK4tnLp5
         1jtwbyPQKwk5Xb230Zw9wR5+rE5aKiA+wSQYLnvZQgM+kf3n60z6vfKqZ8RRa9ol3OyY
         cBRM720NYe3IDh7336k/IlLY3ZNNyHxwqgWIh5p51NMSt+uzeDThPlJzte5aXltfi+Y3
         jU69iJSwZTJ5wEbyUR8e6nLsDXxLc+D0/RFx4qW7VrSW7/O/LM2NmvzJE/qJzny4193B
         ctlA==
X-Gm-Message-State: AOAM5305ROp7EdIkoXWaoiadj1Lc9degNzEW1eLMHH2U7FUUNw2lZ55b
	ENDQGF6U0ljnSJ7kTGjXc/JFLLN3GqlD2Q==
X-Google-Smtp-Source: ABdhPJynPOn7XckRHetDEHBbNHzyTJa/e0v50Kf/pdUbvVFZ+EuSsEf30mAk5p7Itap/RZBRH7dxEA==
X-Received: by 2002:a63:fa05:: with SMTP id y5mr1718035pgh.154.1614824644237;
        Wed, 03 Mar 2021 18:24:04 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id q23sm13684851pgj.66.2021.03.03.18.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 18:24:03 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python3-cython: Check for PACKAGE_DEBUG_SPLIT_STYLE
Date: Wed,  3 Mar 2021 18:24:01 -0800
Message-Id: <20210304022401.1334730-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If using debug-without-src policy then usr/src/debug won't exist,
therefore check for this case

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-cython_0.29.22.bb          | 21 +++++++++++--------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cython_0.29.22.bb b/meta/recipes-devtools/python/python3-cython_0.29.22.bb
index 01f716c16f..272f8acc6e 100644
--- a/meta/recipes-devtools/python/python3-cython_0.29.22.bb
+++ b/meta/recipes-devtools/python/python3-cython_0.29.22.bb
@@ -20,14 +20,17 @@ do_install_append() {
 PACKAGEBUILDPKGD += "cython_fix_sources"
 
 cython_fix_sources () {
-	sed -i -e 's#${WORKDIR}#/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}#g' \
-		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Compiler/FlowControl.c \
-		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Compiler/FusedNode.c \
-		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Compiler/Scanning.c \
-		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Compiler/Visitor.c \
-		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Plex/Actions.c \
-		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Plex/Scanners.c \
-		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Runtime/refnanny.c \
-		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Tempita/_tempita.c \
+	if [ ! "${@bb.utils.filter('PACKAGE_DEBUG_SPLIT_STYLE', 'debug-without-src', d)}" ]; then
+		sed -i -e 's#${WORKDIR}#/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}#g' \
+			${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Compiler/FlowControl.c \
+			${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Compiler/FusedNode.c \
+			${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Compiler/Scanning.c \
+			${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Compiler/Visitor.c \
+			${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Plex/Actions.c \
+			${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Plex/Scanners.c \
+			${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Runtime/refnanny.c \
+			${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Tempita/_tempita.c
+        fi
+        sed -i -e 's#${WORKDIR}#/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}#g'\
 		${PKGD}${libdir}/${PYTHON_DIR}/site-packages/Cython*/SOURCES.txt
 }
-- 
2.30.1

