Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web12.12996.1611672220297624045
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:43:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=j5Ny8AvI;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id h15so7397503pli.8
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NtGGyfaNJelN1O6Xu+LkJcGD4s8vaF/cAml5my1AGPc=;
        b=j5Ny8AvIkAi2moK5dqRJg1R9MPRfWsKx1yvnysuEGBYp51u7GdrGssbnT3mwMkKxWe
         KO7Sw9Soj8TNycCLXIdM8d8aVVIKmxnm0gjwDhwv4+4BBh3mLb4fEL78Bej1XJwaGAxL
         dFuoy/wKW7KCJjnuKs7l5fL6bAZhjC/pEGLGRFfJSVS55i78/PEDFAF4sIX0ZCzH78in
         mF6I32x+536G4Unpu+sPNUyDsjx9Wwc62Ka6bv9vCA1UV0jAZGVKD5omDmYJuHL0z3K+
         8Y1/VKMLQRk1dWd2nMIs0Y76stx8z48q27DYSM9UXmmIgG+BlghiWCvHPDFCNtHa9pqL
         xfQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NtGGyfaNJelN1O6Xu+LkJcGD4s8vaF/cAml5my1AGPc=;
        b=TXPjRktNrhBWqtE9N7aAwE5XJO14covRFq0Y3ssu3cNwr1pDVFNimJwqELRuayCF1z
         +P5MZKq0wpK0hwBHlunDSb05DHYp4HdU5DgDA1uF8YVcFOW8WxBpEul0P+rePcnBpJaT
         Bh5F1Z+2CKBU5VLiwg95mwj5F1KPxs90i+bZ40YqnlvlCrlY7JcXr4ov4TJQ0mAvZrT/
         KIjk8zPeafXtM55eWDyvWERFsVoeCHILYGk3wRePnF/LJWK7BfHiYLK/PK9P1KXoyp0i
         Z2mVr9DuJKcnrNDt8KECBkHSnxeoTTW/uB7tt+vGy17bKrMZ09mP5iab1AcTfzF/FzkV
         H5Mw==
X-Gm-Message-State: AOAM532YpXaCKFgVq6qCtfK2eK1iGKfLCJN5e31PrNgREgbKNOijgLNT
	F65iDsZuUr2g7D8hYZg+zzYbztgAYeBLkBNEYCM=
X-Google-Smtp-Source: ABdhPJwOpLlNjd1eX1i2WmFsPeH/o1zK84te9x89ylojhVN9D6xY6KH+uIKVQDs+dTmKPImxSYKeYw==
X-Received: by 2002:a17:90a:4890:: with SMTP id b16mr146575pjh.36.1611672219449;
        Tue, 26 Jan 2021 06:43:39 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.43.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:43:38 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 32/46] bitbake.conf: Canonicalize paths in PSEUDO_IGNORE_PATHS
Date: Tue, 26 Jan 2021 04:41:43 -1000
Message-Id: <5b729c07b586eb8fa81051d11ed44dab3e7d393c.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Use oe.path.canonicalize() to canonicalize the paths in
PSEUDO_IGNORE_PATHS before passing them to pseudo. This is needed since
pseudo will compare them to paths that are canonicalized.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1f2a497daa09cf3459e27ad6e0e8513938b52c79)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 38ee6aa277..d8ef39027e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -692,9 +692,9 @@ export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
 #export PSEUDO_BINDIR = "${STAGING_DIR_NATIVE}${bindir_native}"
 #export PSEUDO_LIBDIR = "${STAGING_DIR_NATIVE}$PSEUDOBINDIR/../lib/pseudo/lib
-FAKEROOTBASEENV = "PSEUDO_BINDIR=${PSEUDO_SYSROOT}${bindir_native} PSEUDO_LIBDIR=${PSEUDO_SYSROOT}${prefix_native}/lib/pseudo/lib PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_IGNORE_PATHS=${PSEUDO_IGNORE_PATHS} PSEUDO_DISABLED=1"
+FAKEROOTBASEENV = "PSEUDO_BINDIR=${PSEUDO_SYSROOT}${bindir_native} PSEUDO_LIBDIR=${PSEUDO_SYSROOT}${prefix_native}/lib/pseudo/lib PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_IGNORE_PATHS=${@oe.path.canonicalize(d.getVar('PSEUDO_IGNORE_PATHS'))} PSEUDO_DISABLED=1"
 FAKEROOTCMD = "${PSEUDO_SYSROOT}${bindir_native}/pseudo"
-FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1 PSEUDO_IGNORE_PATHS=${PSEUDO_IGNORE_PATHS} PSEUDO_DISABLED=0"
+FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1 PSEUDO_IGNORE_PATHS=${@oe.path.canonicalize(d.getVar('PSEUDO_IGNORE_PATHS'))} PSEUDO_DISABLED=0"
 FAKEROOTNOENV = "PSEUDO_UNLOAD=1"
 FAKEROOTDIRS = "${PSEUDO_LOCALSTATEDIR}"
 PREFERRED_PROVIDER_virtual/fakeroot-native ?= "pseudo-native"
-- 
2.25.1

