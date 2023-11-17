Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A4EC5ACB3
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 19:49:16 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.4807.1700250555536303019
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Nov 2023 11:49:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Vsnvw9u5;
 spf=pass (domain: baylibre.com, ip: 209.85.128.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5afa5dbc378so25593117b3.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 11:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700250554; x=1700855354; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BUdLV35z5p3hAShLKX6Cw1hGp9ztIw1jwFRWsRPwfcY=;
        b=Vsnvw9u53HkYhdpV1+pFpeu8koZqpS+CQUx2f/ZRqPkMw2sEcOSNT5hNlwUT0EBW0o
         Ov4HnVbMMmTN6RfjebUEaX9jON40wyiGrUfbqVWTUBAtldrPceyUSU5srUPH1C4+TMeA
         erBCy424+JfJ9Z5P2yUH/oT+K5hAky6fo9/Ciylpc0t+hg1jsgPj0771xSuXHafo/C/I
         T2ZHYkaN0yVupya3AGHc9wEy46ix3+d9W8FVXErrjAVFB7LwLZsxCCOEYMZGkJhm2fbW
         +3J7q76xDlws33PbDbbYVL4shPNUmRCo7oeaRLuwu15s+Y11gIXVzlWvLyFQQ576fiyB
         PQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700250554; x=1700855354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BUdLV35z5p3hAShLKX6Cw1hGp9ztIw1jwFRWsRPwfcY=;
        b=c0znNqub8z8mZTyQkAKor9U8qWme23AH2aVxfTnx/JEjK8FWhIGtZwi41wwupzIyNS
         AEFthKsMKsAbPtgWgy7M5V+82gb2zwqffA43fNNcdwo1z7L+dBDDiynSaAWYpQmy4v4g
         Nqmpv8fCo8/kpXzLIkDYymrFeTBFJXrSpZqhTKUiLCMlFMv5m1VH3fIXV8NB7/l6LCdT
         b2Lxf8D97pFCGQDE/dEth7gDmRZBmY5S3pX/cQ11vsVlPa2lc+ojYLDV8UE/Yd206kwn
         zONVPxxqpEbPTrdO5JANjer9RWD57ULcKfqKZI5FJDBjMv1UWaVVUIUuh2HE6/vhllRA
         nPYg==
X-Gm-Message-State: AOJu0Yx3X7m76QXUcJS7abXegIqlSCb3YFNYMU+RJE/5w+wmx06FGQBL
	l2rbRusMdm1F1oAx8GPbK6/2Mr7UqJ+EE9CGbtlZNA==
X-Google-Smtp-Source: AGHT+IED5Z2ir0T8HHSvFF/7xTc1DJQSaVQo+22bP8cqUgy3HKtDM042K8aLdmGnNK1gwnsE6hPK6w==
X-Received: by 2002:a81:5fc2:0:b0:5c6:9488:4c99 with SMTP id t185-20020a815fc2000000b005c694884c99mr829882ywb.18.1700250554485;
        Fri, 17 Nov 2023 11:49:14 -0800 (PST)
Received: from megalith.. (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id j10-20020a0cc34a000000b00677f8d80f76sm533481qvi.90.2023.11.17.11.49.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 11:49:14 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 4/4] python3-cython: upgrade 0.29.36 -> 3.0.5
Date: Fri, 17 Nov 2023 14:49:05 -0500
Message-ID: <20231117194905.2080320-4-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231117194905.2080320-1-tgamblin@baylibre.com>
References: <20231117194905.2080320-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 19:49:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190860

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
 meta/recipes-devtools/python/python-cython.inc             | 4 ++--
 .../{python3-cython_0.29.36.bb => python3-cython_3.0.5.bb} | 7 +++++++
 2 files changed, 9 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-cython_0.29.36.bb => python3-cython_3.0.5.bb} (73%)

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
similarity index 73%
rename from meta/recipes-devtools/python/python3-cython_0.29.36.bb
rename to meta/recipes-devtools/python/python3-cython_3.0.5.bb
index 78be2b94edb..94074aaf811 100644
--- a/meta/recipes-devtools/python/python3-cython_0.29.36.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.0.5.bb
@@ -24,10 +24,17 @@ cython_fix_sources () {
 		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Compiler/FusedNode.c \
 		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Compiler/Scanning.c \
 		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Compiler/Visitor.c \
+		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Compiler/Parsing.c \
+		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Compiler/Code.c \
 		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Plex/Actions.c \
 		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Plex/Scanners.c \
+		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Plex/Machines.c \
+		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Plex/DFA.c \
+		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Plex/Transitions.c \
 		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Runtime/refnanny.c \
 		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Tempita/_tempita.c \
+		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/StringIOTree.c \
+		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Utils.c \
 		${PKGD}${libdir}/${PYTHON_DIR}/site-packages/Cython*/SOURCES.txt; do
 		if [ -e $f ]; then
 			sed -i -e 's#${WORKDIR}/Cython-${PV}#/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}#g' $f
-- 
2.42.0


