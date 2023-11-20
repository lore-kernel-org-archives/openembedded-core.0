Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E3AEC2BB3F
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 21:58:25 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.16718.1700517502812899681
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 13:58:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=IrLDq7eo;
 spf=pass (domain: baylibre.com, ip: 209.85.167.174, mailfrom: tgamblin@baylibre.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3b5714439b3so2395774b6e.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 13:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700517502; x=1701122302; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dYdKT/tiq3g/YB3zBOCIjvgr6BKH8xeaBZ3hMGZv+0Y=;
        b=IrLDq7eoovMVszypPezxHrSpQ2qkJO18ZWF2kpoB7yIkQz8beFGesv2Isss6KlKcGt
         CtU5Opv3LFB0ZaoJP66Sk00YBKpZqhzjawsq94UcYro9vInm6248f+umBZVEz14wbGD5
         CZeTYbT6ju+zQ2fpNyVcb661zyc35od36Iyl4uOnmKzRHuHGPNimz+21tl02zJxbNwAz
         S3CUU36IpVfuJKmZlUMkaQcC+q0FQRtJv8pr5qtc5Bihp2x6TQIvHGgdZDFumUwAh5U+
         hc8iEBs/okAcHWnUtXzUWp5WKInfCv2lSurKWlHaPMRyrSU9FsIztjvq2Kj2NcKMz8r1
         FvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700517502; x=1701122302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dYdKT/tiq3g/YB3zBOCIjvgr6BKH8xeaBZ3hMGZv+0Y=;
        b=sObeptHYM7ARQb//57BBVZzu9/e9DyqxG/+XtiJnP9gbmBNs4SaWozTj57DRa6TRWI
         9mzgvDVWrnFJwdr+215u8pg2TdpQVHc4XKJLBmpLCm1Z1NwzdR9S7QFZbB79We984gTR
         r4s5+N46yJUdBf1ks9aleRoHNBrjazFABSQ2oMmUW8a1obvz0TjAfFonCuwuyAzI47yx
         QqwpmWxzTcaj/C3nffwHEiUg5NgRGxQmFjl2yIHqzn3QWnqlHc9Dm859UZE71x2r5A9Q
         PbIKMKg0wcsb8ehOJJF/t0pyPT35/sOq3acxPVi/cSl0wfJ8yxNuvb0tYg+ruTE+OvWR
         cidA==
X-Gm-Message-State: AOJu0YwLuYNcy/GWCfDFl3FTsiH3SxAucYNna+CFuX8lGIpHOWHzls3u
	f5/h2Nd4X7pkso4rascximBLD0DmZfz2ijFJOGLLMA==
X-Google-Smtp-Source: AGHT+IHXwwbB1R3eQEoaEzHpQsUqpxoUN2wAJK/q/4PehI8RCH4ohqiQvgvY7uOcQdEQiMCXPm5k/w==
X-Received: by 2002:a05:6870:b68b:b0:1f0:8120:88a6 with SMTP id cy11-20020a056870b68b00b001f0812088a6mr7368160oab.58.1700517501770;
        Mon, 20 Nov 2023 13:58:21 -0800 (PST)
Received: from megalith.. (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id m6-20020ac86886000000b0041969bc2e4csm2975089qtq.32.2023.11.20.13.58.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:58:21 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] python3-cython: upgrade 0.29.36 -> 3.0.5
Date: Mon, 20 Nov 2023 16:58:20 -0500
Message-ID: <20231120215820.1475322-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 21:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190937

License-Update: Update license link to use https

cython 3.0.x attempts to remain compatible with 0.29.x but still makes
some major changes (in addition to fixing old issues). For a complete
overview it's best to view the CHANGES.rst doc rather than including
them here: https://github.com/cython/cython/blob/master/CHANGES.rst.

Note that more source files were added to cython_fix_sources to avoid
the following:

|WARNING: python3-cython-3.0.5-r0 do_package_qa: QA Issue: File /usr/src/debug/python3-cython/3.0.5-r0/Cython/Utils.c in package python3-cython-src contains reference to TMPDIR
|File /usr/src/debug/python3-cython/3.0.5-r0/Cython/StringIOTree.c in package python3-cython-src contains reference to TMPDIR
|File /usr/src/debug/python3-cython/3.0.5-r0/Cython/Compiler/Parsing.c in package python3-cython-src contains reference to TMPDIR
|File /usr/src/debug/python3-cython/3.0.5-r0/Cython/Compiler/Code.c in package python3-cython-src contains reference to TMPDIR
|File /usr/src/debug/python3-cython/3.0.5-r0/Cython/Plex/Machines.c in package python3-cython-src contains reference to TMPDIR
|File /usr/src/debug/python3-cython/3.0.5-r0/Cython/Plex/DFA.c in package python3-cython-src contains reference to TMPDIR
|File /usr/src/debug/python3-cython/3.0.5-r0/Cython/Plex/Transitions.c in package python3-cython-src contains reference to TMPDIR [buildpaths]

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
v2 rebases the patch to apply on latest master. There was a previous
improvement made to the python3-cython recipe that was merged first.

 meta/recipes-devtools/python/python-cython.inc           | 4 ++--
 ...python3-cython_0.29.36.bb => python3-cython_3.0.5.bb} | 9 ++++++++-
 2 files changed, 10 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-cython_0.29.36.bb => python3-cython_3.0.5.bb} (72%)

diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
index 6aec6b012f1..e757e3f7c87 100644
--- a/meta/recipes-devtools/python/python-cython.inc
+++ b/meta/recipes-devtools/python/python-cython.inc
@@ -5,11 +5,11 @@ It's designed to bridge the gap between the nice, high-level, easy-to-use world
 and the messy, low-level world of C."
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "41c0cfd2d754e383c9eeb95effc9aa4ab847d0c9747077ddd7c0dcb68c3bc01f"
+SRC_URI[sha256sum] = "39318348db488a2f24e7c84e08bdc82f2624853c0fea8b475ea0b70b27176492"
 UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
 
 inherit pypi
diff --git a/meta/recipes-devtools/python/python3-cython_0.29.36.bb b/meta/recipes-devtools/python/python3-cython_3.0.5.bb
similarity index 72%
rename from meta/recipes-devtools/python/python3-cython_0.29.36.bb
rename to meta/recipes-devtools/python/python3-cython_3.0.5.bb
index 07638d7ad78..342c0f8f3fe 100644
--- a/meta/recipes-devtools/python/python3-cython_0.29.36.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.0.5.bb
@@ -20,14 +20,21 @@ do_install:append() {
 PACKAGESPLITFUNCS =+ "cython_fix_sources"
 
 cython_fix_sources () {
-	for f in ${PKGD}${TARGET_DBGSRC_DIR}/Cython/Compiler/FlowControl.c \
+	for f in ${PKGD}${TARGET_DBSRC_DIR}/Cython/Compiler/Code.c \
+		${PKGD}${TARGET_DBGSRC_DIR}/Cython/Compiler/FlowControl.c \
 		${PKGD}${TARGET_DBGSRC_DIR}/Cython/Compiler/FusedNode.c \
+		${PKGD}${TARGET_DBGSRC_DIR}/Cython/Compiler/Parsing.c \
 		${PKGD}${TARGET_DBGSRC_DIR}/Cython/Compiler/Scanning.c \
 		${PKGD}${TARGET_DBGSRC_DIR}/Cython/Compiler/Visitor.c \
 		${PKGD}${TARGET_DBGSRC_DIR}/Cython/Plex/Actions.c \
+		${PKGD}${TARGET_DBGSRC_DIR}/Cython/Plex/DFA.c \
+		${PKGD}${TARGET_DBGSRC_DIR}/Cython/Plex/Machines.c \
 		${PKGD}${TARGET_DBGSRC_DIR}/Cython/Plex/Scanners.c \
+		${PKGD}${TARGET_DBGSRC_DIR}/Cython/Plex/Transitions.c \
 		${PKGD}${TARGET_DBGSRC_DIR}/Cython/Runtime/refnanny.c \
 		${PKGD}${TARGET_DBGSRC_DIR}/Cython/Tempita/_tempita.c \
+		${PKGD}${TARGET_DBGSRC_DIR}/Cython/StringIOTree.c \
+		${PKGD}${TARGET_DBGSRC_DIR}/Cython/Utils.c \
 		${PKGD}${libdir}/${PYTHON_DIR}/site-packages/Cython*/SOURCES.txt; do
 		if [ -e $f ]; then
 			sed -i -e 's#${WORKDIR}/Cython-${PV}#${TARGET_DBGSRC_DIR}#g' $f
-- 
2.42.0


