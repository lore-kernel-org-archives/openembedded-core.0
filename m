Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D40AC5B552
	for <webhook@archiver.kernel.org>; Sun,  8 Jun 2025 21:01:11 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.45186.1749416465064458155
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jun 2025 14:01:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=MTkQiO1p;
 spf=pass (domain: snapchat.com, ip: 209.85.221.42, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a365a6804eso2268044f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Jun 2025 14:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1749416463; x=1750021263; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XHo88n/9eQbGWl6U6W8dsCw0LWQcN34M9kC+NAKW5fc=;
        b=MTkQiO1pgxO0y4a3uWuihcZrl2tSCafbqEg3BBmNPE+o4er8+RNC4lmLCepBW/mktq
         FDEAUB7/QkBIRmzNhR9l+U6Flo4WPXBBrk72w3ZcHlEF9JuGDoAXNq6bRPFrXye0WLWL
         gC/rT8vzEfGmT6q0zYKhYK1vBItPuo5DLJF28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749416463; x=1750021263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XHo88n/9eQbGWl6U6W8dsCw0LWQcN34M9kC+NAKW5fc=;
        b=R6HQpnvWQOwZ3pvzcYsINcEOZ8NdXCyEwoJR/nsa5Pq26oYqVg5jrd0QkAOrbP6J7p
         8Uap00QFwbW4EFOIhxgU9r7stUsYIcXmlMm35kogROR11+5bPimtH4bWEb9dF14sSRb7
         AtDZqk16F7D641Mr1Yse36xWabKa/KhpobveYq+rDk2uvCj9VGOkSooxoFsIXDi9R/GG
         MdXcAuL78wBcWSXXRXR0e5VsT+bsfwKwdMMFDuanPhCK9mhQprEPY4Dqr9z1+krDBUiV
         2xwx3NZ8Myt8adzx7h2u+pCB7LcQOYwa1+dV0ra9F2ae6r8i2p09naSCFoyk1gHbnuYK
         z3wA==
X-Gm-Message-State: AOJu0YxrhqTsPjF9sFpBtDxhwoW7YEu5RV1qdphFk2dE3hRgMYGuGXqH
	oqd3uW2K6gRKRrg+Pc0sE9dT3cl89m1bZ5f+epermh13D+xyOqadceKf5ce+4gfb097OaPS5OH+
	a5DoOzrY=
X-Gm-Gg: ASbGncvmc12upDT8QX1YZzvOgqmF9crQXk6Q0L5r6EmlPrfutBYfCtR7o2Xbg1CKJVl
	3ndAgFN/u2qNanJ1caEl1W+Gs/d6jrsttdAG9ZIX+smfnPi3juoDLSF0wGH2cuRw3XEIdH+0ys7
	cjqsdnxXDK+O0E5lU6ZiuiWOgSWSJOqVVhuQ6J/swrXUDiLnO5GmtQq8G/aPCUkHV0hqNEHulw8
	PV0s6Oga7cZYkDZd6j85wfZJg2r5UAoniNjdyGzQMHC7cAdZKU0vI98ij6dwSv//tM80F0En6B4
	ee0Cx1y8baUG+Y+G67QtxMH/UF5/0LcuW8BPzHqMtFMvSmOvt3hvNU0SWVMKLEVqIukZeY8GfLE
	QZ4Xs7+rJ5YbLt4ebZ5eVenZMtdOOcdfRzesUgZ4D
X-Google-Smtp-Source: AGHT+IEPdzGIvgwbtMf/Ek7Vs7Fkfr6biiHC2/a0UqOMP2IDaZ6S03Hoy/aT1DqqwqAt1mC2gT4P/Q==
X-Received: by 2002:a05:6000:40ca:b0:3a4:dbdf:7154 with SMTP id ffacd0b85a97d-3a531cf497cmr7833665f8f.54.1749416463251;
        Sun, 08 Jun 2025 14:01:03 -0700 (PDT)
Received: from localhost.localdomain (80-108-196-96.cable.dynamic.surfer.at. [80.108.196.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730d15f4sm93117785e9.40.2025.06.08.14.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 14:01:03 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [OE-core][PATCH v2 2/2] Revert "coreutils: split out coreutils-getlimits"
Date: Sun,  8 Jun 2025 23:00:32 +0200
Message-ID: <20250608210032.46280-2-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250608210032.46280-1-ecordonnier@snap.com>
References: <20250608210032.46280-1-ecordonnier@snap.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Jun 2025 21:01:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218222

From: Etienne Cordonnier <ecordonnier@snap.com>

This reverts commit 149584beef1e1b28a4e51f40515204e7edaa9d1f.

The coreutils-getlimits package is no longer needed since findutils-ptest
now uses its own getlimits implementation. This improves modularity and
makes it easier to use alternative coreutils implementations via PREFERRED_PROVIDER
(e.g. uutils-coreutils recipe in meta-openembedded).

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/recipes-core/coreutils/coreutils_9.7.bb | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_9.7.bb b/meta/recipes-core/coreutils/coreutils_9.7.bb
index 091e1ea2c5..dc9dfae26b 100644
--- a/meta/recipes-core/coreutils/coreutils_9.7.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.7.bb
@@ -74,11 +74,6 @@ RDEPENDS:coreutils:class-target += "${@bb.utils.contains('PACKAGECONFIG', 'singl
 # regardless of whether single-binary is in effect.
 RPROVIDES:coreutils += "${@bb.utils.contains('PACKAGECONFIG', 'single-binary', 'coreutils-stdbuf', '', d)}"
 
-# put getlimits into coreutils-getlimits, because other ptest packages such as
-# findutils-ptest may need this command. Note that getlimits is a noinst_PROGRAM
-PACKAGE_BEFORE_PN:class-target += "${PN}-getlimits"
-FILES:${PN}-getlimits = "${bindir}/getlimits"
-
 # Deal with a separate builddir failure if src doesn't exist when creating version.c/version.h
 do_compile:prepend () {
 	mkdir -p ${B}/src
@@ -106,9 +101,6 @@ do_install:append() {
 	# in update-alternatives to fail, therefore use lbracket - the name used
 	# for the actual source file.
 	mv ${D}${bindir}/[ ${D}${bindir}/lbracket.${BPN}
-
-	# this getlimits noinst_PROGRAM would possibly be needed by other ptest packages
-	install ${B}/src/getlimits ${D}/${bindir}
 }
 
 inherit update-alternatives
@@ -213,6 +205,7 @@ do_install_ptest () {
         fi
     done
 
+    install ${B}/src/getlimits ${D}/${bindir}
     # handle multilib
     sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
 }
@@ -224,6 +217,7 @@ do_install_ptest:append:libc-musl () {
     sed -i -e '/tests\/split\/line-bytes.sh/d' ${D}${PTEST_PATH}/Makefile
 }
 
-RDEPENDS:${PN}-ptest += "${PN}-getlimits xz  \
+RDEPENDS:${PN}-ptest += "xz  \
                          ${@bb.utils.contains('PACKAGECONFIG', 'acl', 'acl', '', d)} \
                          ${@bb.utils.contains('PACKAGECONFIG', 'xattr', 'attr', '', d)}"
+FILES:${PN}-ptest += "${bindir}/getlimits"
-- 
2.43.0


