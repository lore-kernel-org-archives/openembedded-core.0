Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4635AC282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 17:05:22 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.20524.1741885521738836927
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 10:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fhKnPFfQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-391342fc0b5so1032955f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 10:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741885520; x=1742490320; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYQBbAvlNTpK6G/lYhY4DhLOJzIqMKSHh/2HgmpaXAg=;
        b=fhKnPFfQ/T2C0EmWGTW8hREGNwUO8VjjApxCXzdSzeZTgQlhx8W7VzqW31VPPM9Q/E
         I6DqTIB2YgWbTm/rgXEjMYFcWmnsQqS9AgwbneFCFVikuscWTBdfyb/smZCkNBUCORSE
         YTI4yqoKD6Sn8sYaq80I7lUuT+6DB3+wBfHWP8aJl0pv3J47w/XtMGddeNrX9aby1vWb
         qqYfRmTK/YLbTYw7QXqM5qBgC4MSMlyBXpI7sWJBeNnwSDiasOXuvl/V+2CJjCyGmjNL
         ru+vEuatUrBCrCQj9pBAd3x0THToswAC3gJ8Rl006HGKqeF8oeGC+gzT9JPaLJG1sYQo
         BLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741885520; x=1742490320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYQBbAvlNTpK6G/lYhY4DhLOJzIqMKSHh/2HgmpaXAg=;
        b=o9JcFDsp6/5TlRIVJoBW86ubLO/nAxFFic6/PJ6+NE041CfshogUWQ8r74rZCyxV32
         GMz9q0bc2BkAIIzXLs5sUsgn0yHVZ9zuE60Ne8gHkQjZpsn6HyxI3Kh7I3u4jgYY7jWM
         TtEaH7n9NFkBRNiqjtto6+9ICiLYwQhe8FL4X4VYV6bH5kcefRbeyUffThnsS51MIS/q
         fJzdKIdXn5m8tKS+qaaGF464Bl84z1n/fPCy6HgypU0LqM2XpPue54qePNZdTKxTsyo9
         1d2MBus7oe0WJRuswJgMFDkR3fjEWcaSiStHO5uHRF1Swnghi+9czQoBbwqVofyZkW6J
         EEwA==
X-Gm-Message-State: AOJu0Yx4J9ippmYRd9CvFp+DpMyY+FM/zJWELGKgbHFCKumVMS0X+pBs
	YI6+jgaG+a/cCzmuIPoDyU5G4EXFhrANY0ZKdgQxMx0x5BYYn1Sr5z5Rcg==
X-Gm-Gg: ASbGncu5hseF5fxnTQ+SDr8qVBwLGrvXzxNDV+3WFZDL3NIlCoE+s4ciDK+bFXk7Cr3
	n483fUWv/xRRIiEvLPGKcJYk0krojLKYyV4VOvF3xZiORe37vz8eTlOe8A0lS/Lod3tAtn84k1C
	qzKMZdf0UO3CtfPkLRdP3306B8JdiFauobz1y7cIJYcpOwkjtqVW0XtJHbYcc1cfNJnCMxdiwFU
	N9RgKnAY1hYcVG583cgMS20OtmTiL2l6KK7RtmDcbvaIGfA77kE8WHrZds0a/LZ9kYzW3EcSdYz
	NgGCN89f5ysKCih6i3JNVDwefgY9x71q09kC28pfGjvbHq8lvJ9hXoLnC9gdAQJtOPEElfSleU7
	i23gfpw==
X-Google-Smtp-Source: AGHT+IEBY1XKjAXGO8BmFz32d6DU5NEX8Qz1ykZJmbIt87f2gNJZ3SUbghy46akFkzrQb1FVsBpWxw==
X-Received: by 2002:a05:6000:18a9:b0:391:4940:45c3 with SMTP id ffacd0b85a97d-396c3e17c4fmr366831f8f.54.1741885519698;
        Thu, 13 Mar 2025 10:05:19 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df320csm2680322f8f.7.2025.03.13.10.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 10:05:19 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] glib-2.0: address ptest failures
Date: Thu, 13 Mar 2025 18:05:03 +0100
Message-Id: <20250313170503.3402790-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250313170503.3402790-1-alex.kanavin@gmail.com>
References: <20250313170503.3402790-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 17:05:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212794

From: Alexander Kanavin <alex@linutronix.de>

Particularly:
- one of the tests requires a C.utf-8 locale
(only available in glibc)
- another needs .gir files to be installed

Also, consolidate the ptest dependencies in a
single variable assignment.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/glib-2.0/glib.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index c6e2d6e1a0a..ee23c5089d6 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -157,8 +157,6 @@ CODEGEN_PYTHON_RDEPENDS:mingw32 = ""
 
 RDEPENDS:${PN}-codegen += "${CODEGEN_PYTHON_RDEPENDS}"
 
-RDEPENDS:${PN}-ptest += "${PN}-utils"
-
 RDEPENDS:${PN}-ptest += "\
             coreutils \
             libgcc \
@@ -171,6 +169,7 @@ RDEPENDS:${PN}-ptest += "\
             tzdata-europe \
             tzdata-posix \
             shared-mime-info \
+            ${PN}-dev \
             ${PN}-locale-ja \
             ${PN}-locale-fr \
             ${PN}-locale-el \
@@ -179,6 +178,7 @@ RDEPENDS:${PN}-ptest += "\
             ${PN}-locale-pl \
             ${PN}-locale-ru \
             ${PN}-locale-th \
+            ${PN}-utils \
             python3-core \
             python3-modules \
             ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'python3-dbusmock', '', d)} \
@@ -190,6 +190,7 @@ RDEPENDS:${PN}-ptest += "\
             locale-base-fr-fr \
             locale-base-ru-ru \
            "
+INSANE_SKIP:${PN}-ptest = "dev-deps"
 
 RDEPENDS:${PN}-ptest:append:libc-glibc = "\
             glibc-gconv-utf-16 \
@@ -203,6 +204,7 @@ RDEPENDS:${PN}-ptest:append:libc-glibc = "\
             glibc-gconv-iso8859-15 \
             glibc-charmap-invariant \
             glibc-localedata-translit-cjk-variants \
+            locale-base-c \
             locale-base-lt-lt \
             locale-base-ja-jp.euc-jp \
             locale-base-fa-ir \
-- 
2.39.5


