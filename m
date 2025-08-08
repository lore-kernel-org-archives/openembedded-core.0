Return-Path: <osama.abdelkader@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EFF9C87FCB
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 16:16:50 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.26606.1754669804664894752
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 09:16:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EqoHuogO;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: osama.abdelkader@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-af97c0290dcso432049266b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 09:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754669803; x=1755274603; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LCvnUOua3iFdahAaQ0FjbbGg55Z4iRipjbj/ym9Fttw=;
        b=EqoHuogOS0Js8WJP+nKU0wGYYHDkr8OKWXSVuNzylmUZ2xzEln4sUuxUz7iOCns7eF
         Qjz3U/pR6u4grfwCmaraV+GuQFmrHnBmS2a6Ul8DZA5lzOQtmFw21BO2z9h7/9Y9yn1R
         54NtWikwkcvWsdFjJp5VacO2BNlEGSajXYPE0taNpznNbBYajc1lU41qhkVjinCVRXq6
         GYXtu/h1eyYLAJACPWkjXFGQIlNU/dfGOHFjo//0snJqqIaHuRBW8rF+JdnhwRm0JzTg
         7BPzhSUCrypM20/+9y2iF83U6AbKWdQd2hz4o3t2E0i1Zqb+kqU4hECHVa9YNewG++GI
         PBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754669803; x=1755274603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LCvnUOua3iFdahAaQ0FjbbGg55Z4iRipjbj/ym9Fttw=;
        b=RnKnIfM1aagAEDpx9RBnXG9TYFquUOKxI+tbFKx6zQLz4e2UXjkQa1ZknCxxMK4SOS
         pN1oHjb8EL64vLiPLtRgJR5VB4xstF6l/gWqG3uCuOPy0xo7fPIN4wKSzfhNUpGUQMQK
         Thk8Q4BIdc+ibZWBbOaNzmUZWgAmRvwCvl4o1UebY+eafryZRMRuqDyZy4RlOfdr/fwj
         LaEr9FD/CV+8/w6o/r5ECJUmu+/pc5818E8nWJVE1PXKhUKFHUvohIDUwsRoF8cbpf0u
         IH4afuxi4h3cM81+vDDv572NP+kO+3OZfV6WBXOsuceUpeq5T7fApjdVd6dXsV2vPwAG
         9ZGA==
X-Gm-Message-State: AOJu0YxzB3Bp2wIFvbLFDMRgyIYowYiR+UfpRPjtmDIbcDqagxD3IB18
	FjMWxohMYBa3E4fXZ6Ji3C5zDQ6HVJj4z28J5uP2MO6uPCZsmllLdZ1ocj9RCRSTMg8=
X-Gm-Gg: ASbGncspt4Bx9Pu0Y52VgQEEL43tjGktOsWueByygO9SaiUs/N8kks/culdHLZSMqmY
	NzowEcTfvptVfWLw4FFG9ybT2qeynIc77YecEIb9pt+A79YHy7wWL5dUzAvgoDH8FmJSuhqiLNF
	C0lqQtfONR2u7G3J5fy0EQQKTt2XMXIq6bML5C4xmTNUjQtofuIaJPDVFbuui7pdQZgZ815A/pK
	vi0Dn5uWhQp6R65uKZ0gj6k6FQEzdzKy02YrrLwEaPV/q55E6699WcAFez5godM9pRpX3gZxCm2
	tDvnaIU/mxrLBtFNc70P0APkrLDUM1clNt6/nnTx4QOdMRev4GKGaN8MBa5mJWS3fu/WniM2tPu
	i13ZoHtQkrBl6ITCgNa5gdR1x
X-Google-Smtp-Source: AGHT+IG+9mzRCDFiv/VyDLFjjzy0xmU0DoweAMDhT6opoNpA30mNgXMvveeHIc35iHEhrYIhFqNgLg==
X-Received: by 2002:a17:907:6e92:b0:af9:8438:de22 with SMTP id a640c23a62f3a-af9c6553099mr285404766b.39.1754669802516;
        Fri, 08 Aug 2025 09:16:42 -0700 (PDT)
Received: from XPS.. ([2a02:908:1b0:afe0:5414:be8f:862c:f3f9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c050sm1509664866b.104.2025.08.08.09.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 09:16:42 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] go-cross-canadian: fix binaries install and GOARCH
Date: Fri,  8 Aug 2025 18:15:33 +0200
Message-ID: <20250808161533.13752-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 16:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221662

Canadian cross builds produce host-side binaries (x86_64), but
GOARCH=arm was leaking in from go-${PV}.inc/go-common.inc, causing
arch mismatch and package QA errors. Explicitly set GOARCH = "${HOST_GOARCH}" to
ensure the correct host architecture is used.

Also fix do_install to correctly install all binaries from
${GO_BUILD_BINDIR} by using 'find -type f' to avoid issues when the
directory contains subdirectories (e.g. "linux_arm").

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 meta/recipes-devtools/go/go-cross-canadian.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc b/meta/recipes-devtools/go/go-cross-canadian.inc
index 39330fc98b..4a6f2f4c36 100644
--- a/meta/recipes-devtools/go/go-cross-canadian.inc
+++ b/meta/recipes-devtools/go/go-cross-canadian.inc
@@ -5,6 +5,8 @@ DEPENDS = "go-native virtual/${HOST_PREFIX}go virtual/nativesdk-${HOST_PREFIX}go
            virtual/nativesdk-compilerlibs"
 PN = "go-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
+GOARCH = "${HOST_GOARCH}"
+
 # it uses gcc on build machine during go-cross-canadian bootstrap, but
 # the gcc version may be old and not support option '-fmacro-prefix-map'
 # which is one of default values of DEBUG_PREFIX_MAP
@@ -51,7 +53,7 @@ do_install() {
 	install -d ${D}${libdir}/go/pkg/tool
 	cp --preserve=mode,timestamps -R ${B}/pkg/tool/${HOST_GOTUPLE} ${D}${libdir}/go/pkg/tool/
 	install -d ${D}${bindir} ${D}${libdir}/go/bin
-	for f in ${B}/${GO_BUILD_BINDIR}/*
+	for f in $(find ${B}/${GO_BUILD_BINDIR} -type f)
 	do
 		base=`basename $f`
 		install -m755 $f ${D}${libdir}/go/bin
-- 
2.43.0


