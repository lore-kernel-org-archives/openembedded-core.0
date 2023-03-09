Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF74C64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 22:58:45 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.5722.1678402705090102212
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 14:58:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=NR+wy2Yk;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id a2so3681936plm.4
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 14:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678402717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=koHyEXx07SVx6tY0/jrJwtQ2hWsZ0Dznz0l2267IXQE=;
        b=NR+wy2YkeDf4fd7RW57ZpmMBi/TAs4+YDusCGbp7fUEqrU1v94ZnN4jWD3u297+3cJ
         sf6p6ZzZ1tAesR6dnlxXOigy6P8HcjIJmZf7y92wOouA4tEUwSsTaTuUD79wn8y5a8Uy
         sCInW0g1faacJDNlptcSTtXpx7+al7yp0r1qp7VU57x+4QvrQqXjdkCHZlmKfwR/bn1u
         cCoOX9LpxUgiHJpQSIgKeroNwCcYDQkiDbc6p6AqV7vhv1a2fPOCXr8YFTYXqpdXdpsf
         g4VrPpwSo8Nux6dq0VcVFVjZE6oVBYmmOmXnLS12rNwT54nXgjKVwvZq9g7cihStYnmC
         reeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678402717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=koHyEXx07SVx6tY0/jrJwtQ2hWsZ0Dznz0l2267IXQE=;
        b=5EQ0N+gCfd9ebr1a99qyYHKwyQVv7dhjlI+cgYj3hssno6wImZj0PVTl80fvo46Wya
         zdys4SGbNqA4b6ktvg3YOhsGqU/6vXOLFxIHwxZEql/TrIeHchnjypOtiLpdIYaRYlLg
         4Cc4hiZdF6B4uR+AWWFBsFtHcsrvfjjTJeIbYImRVX36Q5juC7KqLyRXPRAfMvKbQesY
         bpRCffoUJ7BpuGmfyzix3i70pS1jrP0UwdLk7DrkAzny1zt9jq3olRyAaqiySMuDrx7T
         oJSKs9mLUuqdpYCQrPMp+QsfvDNVQxmYHN0o4Aljvn0rW2hCxFzDLuH3yP8Hb7oS1Dyq
         Nj4g==
X-Gm-Message-State: AO0yUKXC7M7023VtF0zrxsNKQePxcDA3i2F49ozJoRtAGWKcZrtIvdsr
	M9VNgtCVKwvOjiBVHyVYyJ3/6OtI3AoW2KmHaiQ=
X-Google-Smtp-Source: AK7set/jH/coTwXXZt49lvJaBUysoqwISWEJf6Dv+ww5mD1wKCgWe8H0qx9R6fVW0OPQVlfYcAJIbA==
X-Received: by 2002:a05:6a20:12c7:b0:cc:e0fb:a83f with SMTP id v7-20020a056a2012c700b000cce0fba83fmr30133590pzg.36.1678402716876;
        Thu, 09 Mar 2023 14:58:36 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id j9-20020aa79289000000b0058db8f8bce8sm89717pfa.166.2023.03.09.14.58.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 14:58:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 14/27] u-boot: Map arm64 into map for u-boot dts installation
Date: Thu,  9 Mar 2023 12:57:49 -1000
Message-Id: <c01ec95aa19e9377554c544ed166a03ba4cd46a3.1678401759.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678401759.git.steve@sakoman.com>
References: <cover.1678401759.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 22:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178287

From: Pavel Zhukov <pavel@zhukoff.net>

While arm64 is a valid UBOOT_ARCH (according to mkimage -A) u-boot
keeps arm64 specific dts under 'arch/arm' directory.
As the result the recipe tries to install arch/arm64 (if UBOOT_DTB
was specified) and fails with [1]. Remapping "arm64" to "arm" to fix this
issue.

[1]
| install: cannot stat '.../u-boot/1_2023.01-r0/build/arch/arm64/dts/u-boot.dtb': No such file or directory

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3ca99403d5f320c6d7ae59b107f3b3bf183b4089)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 5705e5835b..4a8d93f70a 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -32,7 +32,7 @@ do_savedefconfig() {
 }
 do_savedefconfig[nostamp] = "1"
 addtask savedefconfig after do_configure
-
+UBOOT_ARCH_DIR = "${@'arm' if d.getVar('UBOOT_ARCH').startswith('arm') else d.getVar('UBOOT_ARCH')}"
 do_compile () {
     if [ "${@bb.utils.filter('DISTRO_FEATURES', 'ld-is-gold', d)}" ]; then
         sed -i 's/$(CROSS_COMPILE)ld$/$(CROSS_COMPILE)ld.bfd/g' ${S}/config.mk
@@ -336,7 +336,7 @@ do_deploy () {
 
     if [ -n "${UBOOT_DTB}" ]
     then
-        install -m 644 ${B}/arch/${UBOOT_ARCH}/dts/${UBOOT_DTB_BINARY} ${DEPLOYDIR}/
+        install -m 644 ${B}/arch/${UBOOT_ARCH_DIR}/dts/${UBOOT_DTB_BINARY} ${DEPLOYDIR}/
     fi
 }
 
-- 
2.34.1


