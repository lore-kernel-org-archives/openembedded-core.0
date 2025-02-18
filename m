Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B4A2C021AF
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 21:15:48 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.7524.1739913345006751668
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 13:15:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=itHPYgM5;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-220e989edb6so120441055ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 13:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739913344; x=1740518144; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EC4QAr9BSNPvHtaY8BZ5R2gr7ZgX/w6k5VJtjc4fVXw=;
        b=itHPYgM5B0H8LvePK18s0NvffcEEHODWQma7jKjjQqK06kp2WN8wV3pwGWpT6RBsLQ
         Zj7BxICKOqK2QYkgGKphwq7P3Q8P/tU4fjjquxcjBps5zOo6LwE2HmlNnqn0Z/r1YpTk
         hN5pKZ5j95irr6H8T1nx7F0ruw2pHPP5TMPHPdkPBIY3wd7ASs9Qd+vFaAH/w22g+7oC
         FGBvDVTrfTmNsqy/z22j/MEn9n1Q5AHcCJ9w8pexRYcar4zvlSXuMiVO79q5JTsclWjC
         FudawMuHnxb645XWacpQhRQDfzqRZBo16Hgdmaek8l5PG55jGLQg/fNUTQmjz7QoP93s
         97ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739913344; x=1740518144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EC4QAr9BSNPvHtaY8BZ5R2gr7ZgX/w6k5VJtjc4fVXw=;
        b=Neb5hdmVWAwTmvEYe5vvGogkX79+gb27cYx8O6nBHSGjmB7tE9WW5t2THI6EnPo9Rv
         BegI7xK6va4WzHaSsw+sN1o5m4hlmrkRQoYBSXZEPbcPl+wGX/6aKMChaYOxdItl/AiU
         BM+c881+p7evFctdNCpeAuJna+qAiv2H4jsriH0Ds1zysX74gEUitvj5IGLBmvB38t9k
         WRdQ7wrgSI76rJlIeQ1bSgqkJBVRWUtWSlDNPJLFMcBRovLB2AqVAWyUCBxfmXUDBrFX
         +WxhYqBKVHhL5v5rxHd4jL5h9NjGmT0a4PyMX6uFJJYGY6KsME3JxmKR9fYiT5cX8Wxl
         WpyQ==
X-Gm-Message-State: AOJu0YwG/OF+7SRqZO5JxeJc72BUNL63TCdVoG3VXPZqPez6U7lsutoo
	/65y9/IJaX6fXk+YUZu4KKfUQdndImFdFGmWqQjhXZEYRtGkBb83ZnzjZOla4VCnewN5V+KI2QG
	I
X-Gm-Gg: ASbGnct58kk9n/dGceJGkjkOWMRo9vVobJH/d8iwQfbaeTuk5x27IN0joCHtnVt9HkR
	DhK0afPqf+DEOh6tvEhHz1vD678OwdcvnMhFl61jl+dp7a0+v2/UpChC2b9kODesgyr1aTVuEqy
	1xkQ06SJx+gKr682oIzCs4G28C01P9hHUZKIls4KOWd6J4h2uxS/JLQ6lPKfTiwh16IsY7yfXnU
	dKaN6aNRwOdXbjMT3VP9pFD6Y490oh5fn1YCS6P/eY00yyizZed19WGrBLn1EFvdduehpDw4pul
	+Y+44ys=
X-Google-Smtp-Source: AGHT+IHj3wOQuIldrCNNwz9a0ns7J3igcB4twJk1aTgChgVCHqIYmpVLrSZI9uStis+KSj45QS1NNw==
X-Received: by 2002:a17:902:d4c3:b0:21f:3abc:b9e8 with SMTP id d9443c01a7336-221040bd33cmr206228905ad.43.1739913344249;
        Tue, 18 Feb 2025 13:15:44 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:83c7:94a9:a555:bf05])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5349056sm93720055ad.22.2025.02.18.13.15.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 13:15:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 7/7] icu: remove host references in nativesdk to fix reproducibility
Date: Tue, 18 Feb 2025 13:15:25 -0800
Message-ID: <b9d99803d351b0653461754a0848039a1f0c5c43.1739913090.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739913090.git.steve@sakoman.com>
References: <cover.1739913090.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 21:15:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211659

From: Oleksandr Hnatiuk <ohnatiuk@cisco.com>

Fix is only done for target. Use same code for nativesdk.

Backport from poky master: https://git.yoctoproject.org/poky/commit/?id=c63b8f28ac52047fad689b78d605aa792baf1ad8

(From OE-Core rev: dc6306883cc2c7d4d98d595442e5bf4037a160c5)

Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
Signed-off-by: Oleksandr Hnatiuk <ohnatiuk@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c63b8f28ac52047fad689b78d605aa792baf1ad8)
Signed-off-by: Bhabu Bindu <bindu.bhabu@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/icu/icu_74-2.bb | 33 ++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-support/icu/icu_74-2.bb b/meta/recipes-support/icu/icu_74-2.bb
index 8352bf2a5b..53853e24a5 100644
--- a/meta/recipes-support/icu/icu_74-2.bb
+++ b/meta/recipes-support/icu/icu_74-2.bb
@@ -30,7 +30,7 @@ TARGET_CXXFLAGS:append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', '
 
 ASNEEDED = ""
 
-do_compile:prepend:class-target () {
+remove_build_host_references_from_libicutu () {
 	# Make sure certain build host references do not end up being compiled
 	# in the image. This only affects libicutu and icu-dbg
 	sed  \
@@ -39,6 +39,14 @@ do_compile:prepend:class-target () {
 	    -i ${B}/tools/toolutil/Makefile
 }
 
+do_compile:prepend:class-target () {
+	remove_build_host_references_from_libicutu
+}
+
+do_compile:prepend:class-nativesdk () {
+	remove_build_host_references_from_libicutu
+}
+
 PREPROCESS_RELOCATE_DIRS = "${datadir}/${BPN}/${PV}"
 do_install:append:class-native() {
 	mkdir -p ${D}/${STAGING_ICU_DIR_NATIVE}/config
@@ -49,6 +57,15 @@ do_install:append:class-native() {
 	cp -r ${B}/tools ${D}/${STAGING_ICU_DIR_NATIVE}
 }
 
+remove_build_host_references() {
+	sed -i  \
+	    -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
+	    -e 's|${DEBUG_PREFIX_MAP}||g' \
+	    -e 's:${HOSTTOOLS_DIR}/::g' \
+	    ${D}/${libdir}/${BPN}/${@icu_install_folder(d)}/Makefile.inc \
+	    ${D}/${libdir}/${BPN}/${@icu_install_folder(d)}/pkgdata.inc
+}
+
 do_install:append:class-target() {
     # The native pkgdata can not generate the correct data file.
     # Use icupkg to re-generate it.
@@ -56,14 +73,12 @@ do_install:append:class-target() {
         rm -f ${D}/${datadir}/${BPN}/${@icu_install_folder(d)}/icudt${ICU_MAJOR_VER}b.dat
         icupkg -tb ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat ${D}/${datadir}/${BPN}/${@icu_install_folder(d)}/icudt${ICU_MAJOR_VER}b.dat
     fi
-	
-	# Remove build host references...
-	sed -i  \
-	    -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
-	    -e 's|${DEBUG_PREFIX_MAP}||g' \
-	    -e 's:${HOSTTOOLS_DIR}/::g' \
-	    ${D}/${libdir}/${BPN}/${@icu_install_folder(d)}/Makefile.inc \
-	    ${D}/${libdir}/${BPN}/${@icu_install_folder(d)}/pkgdata.inc
+
+	remove_build_host_references
+}
+
+do_install:append:class-nativesdk() {
+	remove_build_host_references
 }
 
 PACKAGES =+ "libicudata libicuuc libicui18n libicutu libicuio"
-- 
2.43.0


