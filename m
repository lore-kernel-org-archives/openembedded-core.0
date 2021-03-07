Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web12.17039.1615087137746600537
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Mar 2021 19:18:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a7F+6VjD;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id s7so3287321plg.5
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Mar 2021 19:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RJYGIa40FI61SxJUod1M+Hse5FSAZjkxBMuOFe6EGUw=;
        b=a7F+6VjDOfAKywgQyZclPQE4EHLsd8vY7BYUcpn+3qIw8nRVguR3AtwTXCYPbXWhAc
         bhojQ5bhlRXRtCD8mRY38EbskPxYRMrhmEhyvAnJ1PmnlUjmZpJFrE2UvhBLjULFQh20
         xUL5TGpLyz93HlL2p5vufH8EfKYmbyaGkeqRc0MACJ0UcY63L8frVTN4KMr5Iq4YhcmC
         PkcJzsuXCcWQu8WFPHqLaGOy4P8rEH9GERW6g1t3gKGtMuTdT6Zt3nRVYCatyjUXJ5Zm
         53W0y4P3LO0iJFNffjcMOdZynJ4+0LoPm3oeWYPiBxft7aHEtIZ0irFxcozg7kPV875Q
         1aUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RJYGIa40FI61SxJUod1M+Hse5FSAZjkxBMuOFe6EGUw=;
        b=dPPt/O3RYzliR6XRXx31ASEMKDkgDq87nNRGyFhQDhV3lL6ajW+g6XVd1GoYLgV0KL
         oMvEabRhS91AUX0WKSETb9ScxQBsX8aZgWnEgjv7O2IwqRqVIOEc+nePmv1sH9USH/0O
         97rcKDOCvjas/TnQi54uV8Ecchxc/9/TL/+q8zaYWgbeoO9tgtXKiEdSYdxbQszOhXUO
         p7vBCa9ZfrUu+B/I+C+sZ9DoUe7wQyT0TIyGXXpFVqgGgHQwxbVdzZCgDWxtza9acq5O
         3/1TtefufiKD6FmMjlEgZQI/O36VY/KpuDqmoaGMSdN5LlZo80QSmoyJKIuSFgk75r7y
         fX3w==
X-Gm-Message-State: AOAM531e40Zln2vqqcbN6S1V7xLUMfxR5fKdhTYBXHK8if9KEJK8Chzk
	6UuTEKodOswgYLIT/rjWNiO5/FAJj6vumQ==
X-Google-Smtp-Source: ABdhPJzkpkHSaSzUiXEDKbleSiBrgfjdiUaoavAOB+XvUZbuJHpCe9QZTvW+6hbo32J7qcDaicqdeg==
X-Received: by 2002:a17:90a:5417:: with SMTP id z23mr17698546pjh.111.1615087136668;
        Sat, 06 Mar 2021 19:18:56 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id mr5sm5445709pjb.53.2021.03.06.19.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 19:18:56 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] python3-cython: Check for files before editing
Date: Sat,  6 Mar 2021 19:18:53 -0800
Message-Id: <20210307031853.1720080-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If using debug-without-src policy then usr/src/debug won't exist,
therefore the function will fail due to missing files, adding a check
for files to exist before editing them fixes it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Check if file exists instead of checking for debug split style
    makes it more generic

 meta/recipes-devtools/python/python3-cython_0.29.22.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cython_0.29.22.bb b/meta/recipes-devtools/python/python3-cython_0.29.22.bb
index 01f716c16f..2ec4033fa0 100644
--- a/meta/recipes-devtools/python/python3-cython_0.29.22.bb
+++ b/meta/recipes-devtools/python/python3-cython_0.29.22.bb
@@ -20,8 +20,7 @@ do_install_append() {
 PACKAGEBUILDPKGD += "cython_fix_sources"
 
 cython_fix_sources () {
-	sed -i -e 's#${WORKDIR}#/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}#g' \
-		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Compiler/FlowControl.c \
+	for f in ${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Compiler/FlowControl.c \
 		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Compiler/FusedNode.c \
 		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Compiler/Scanning.c \
 		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Compiler/Visitor.c \
@@ -29,5 +28,9 @@ cython_fix_sources () {
 		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Plex/Scanners.c \
 		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Runtime/refnanny.c \
 		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython-${PV}/Cython/Tempita/_tempita.c \
-		${PKGD}${libdir}/${PYTHON_DIR}/site-packages/Cython*/SOURCES.txt
+		${PKGD}${libdir}/${PYTHON_DIR}/site-packages/Cython*/SOURCES.txt; do
+		if [ -e $f ]; then
+			sed -i -e 's#${WORKDIR}#/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}#g' $f
+		fi
+	done
 }
-- 
2.30.1

