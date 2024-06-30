Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC3F3C30653
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 20:08:38 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web10.4257.1719778116042027367
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 13:08:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UzajuaEh;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.169, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3d5d7fa3485so1671455b6e.1
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 13:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719778115; x=1720382915; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1J6eXCFYiqwaRoDxjx4eGf6cpI5CUZrSigr8ngoGOas=;
        b=UzajuaEh46CAatdjUwgnp6Ho3glu1KePUZBysOhGhUEYM8quFnPuO9rpwedcpESWtn
         39+H3q2PbKUVbBNgC/VLgIB+ig+AKrDGxLkPWai6rQqqhTo2XgfzrpYBzCbmS3Q5pfw0
         bzAFMoGTGOTpgIP0qzPyAySQXxQm/WiALMy983DZKHHwnQMKLpR0ZJeBK3sZc5/LX2S2
         RZDgQjq1UyyroJo8I5UQqTa9n7Jrb5yJ/k1n7zLFquXB9kQ3xpFKdh2Wotnmyed+7Dqb
         OuiVP72K7W/tNYHqUTTjHIRkJ/irShkHjpo5WxAmUKlcd+9PThR4SMLcb6LlOjTbkrG9
         o03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719778115; x=1720382915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1J6eXCFYiqwaRoDxjx4eGf6cpI5CUZrSigr8ngoGOas=;
        b=HtKL1L7psHx9Zx2gLzYG1/8ijYA8i04ARr3TrwFeO8V4qXYPgxBaqv3FKoBq6Atemm
         bhE/kCUbB5fOj8y35z+3qI1aaF55Io2cjgPwsArDGh6LSoWO2uaKwEA35S1IyM06JXqv
         CcVxVzlgVlswrZA4oCP1p0f5Ab+Fai13i9L040yOVbjLZR/hQeUvbTMnoaTuzwGUCW1Z
         Gi2RqMKaCHdxUVZt2evtDORKw59Vs/oFsvArBs6R1WCxrzubsf7rMYCEPvWCfeQ7IocE
         QlmxRF/4tfKr2Qe34jri7rmujRfUGJwcoLrF1eQaEZ23zSnsMS0IQRtZ2Z5scrb6zs37
         haeA==
X-Gm-Message-State: AOJu0YzNUe8w2kDeYlyJQRbhfrF3U+3fVb9nz8YOv7qnWi8NslHBEm9c
	FEkxCrhOaqgvitJ0AmH3w6T2Y4eUuRXca8R5rms1yXLuZCv9qPYKSnTEx0a1Vxcg5e3fh67os3F
	o+KQ=
X-Google-Smtp-Source: AGHT+IEGrR/0YNb4qOEo3yqAVIvQyi9GWTzxGgaos+vy5vv7h6BgfIDYMBnbIKakxBHxWy4O3oipIg==
X-Received: by 2002:a05:6808:211b:b0:3d2:1c37:25ca with SMTP id 5614622812f47-3d6b558f228mr5909873b6e.53.1719778115101;
        Sun, 30 Jun 2024 13:08:35 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6a6f0817sm3340835a12.27.2024.06.30.13.08.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 13:08:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 22/35] linux-yocto/6.6: fix kselftest failures
Date: Sun, 30 Jun 2024 13:07:34 -0700
Message-Id: <7074f115d1f13db346d2b680f5b5bc3f602824e8.1719777887.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719777887.git.steve@sakoman.com>
References: <cover.1719777887.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 20:08:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201259

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.6:

1/1 [
    Author: Mark Brown
    Email: broonie@kernel.org
    Subject: kselftest: Add a ksft_perror() helper
    Date: Thu, 28 Sep 2023 16:38:11 +0200

    The standard library perror() function provides a convenient way to print
    an error message based on the current errno but this doesn't play nicely
    with KTAP output. Provide a helper which does an equivalent thing in a KTAP
    compatible format.

    nolibc doesn't have a strerror() and adding the table of strings required
    doesn't seem like a good fit for what it's trying to do so when we're using
    that only print the errno.

    Signed-off-by: Mark Brown <broonie@kernel.org>
    Reviewed-by: Kees Cook <keescook@chromium.org>
    Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3d747dabd7bf59b653730f245d134931d143f60f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  2 +-
 .../linux/linux-yocto-tiny_6.6.bb             |  2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 22 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index ea429692d8..53f413407d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,7 +14,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "99d3632c1cf7688066e57aea89f9adfe8d1a5ca5"
+SRCREV_machine ?= "9bdb085cb6fcfd49586b980ba27cb81e5c76689e"
 SRCREV_meta ?= "a78c74a3510067017dda1926f88bd914f0a053b3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index bdad73bbbc..44c9a7b1e0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -17,7 +17,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "6655dc03f5de7bb734da3ec8eb97f9be281dfbdb"
+SRCREV_machine ?= "7c76aad68f6d1247e72f024f1e0291067a404f8d"
 SRCREV_meta ?= "a78c74a3510067017dda1926f88bd914f0a053b3"
 
 PV = "${LINUX_VERSION}+git"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 12197ba414..817639bce0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,17 +18,17 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "45982c347ee123883a88f220d1d9a740e2c2b959"
-SRCREV_machine:qemuarm64 ?= "6655dc03f5de7bb734da3ec8eb97f9be281dfbdb"
-SRCREV_machine:qemuloongarch64 ?= "6655dc03f5de7bb734da3ec8eb97f9be281dfbdb"
-SRCREV_machine:qemumips ?= "738f344ef6da38ebf6fcca87b701281c930b16e4"
-SRCREV_machine:qemuppc ?= "6655dc03f5de7bb734da3ec8eb97f9be281dfbdb"
-SRCREV_machine:qemuriscv64 ?= "6655dc03f5de7bb734da3ec8eb97f9be281dfbdb"
-SRCREV_machine:qemuriscv32 ?= "6655dc03f5de7bb734da3ec8eb97f9be281dfbdb"
-SRCREV_machine:qemux86 ?= "6655dc03f5de7bb734da3ec8eb97f9be281dfbdb"
-SRCREV_machine:qemux86-64 ?= "6655dc03f5de7bb734da3ec8eb97f9be281dfbdb"
-SRCREV_machine:qemumips64 ?= "7f4b889b7acb9fe36e290bf40c2e9b6cec523f6d"
-SRCREV_machine ?= "6655dc03f5de7bb734da3ec8eb97f9be281dfbdb"
+SRCREV_machine:qemuarm ?= "0b90bbe1359b3fd590780119f19dbd0a01e58560"
+SRCREV_machine:qemuarm64 ?= "7c76aad68f6d1247e72f024f1e0291067a404f8d"
+SRCREV_machine:qemuloongarch64 ?= "7c76aad68f6d1247e72f024f1e0291067a404f8d"
+SRCREV_machine:qemumips ?= "ab44de80a320e30a49150ea74554a937affaf78d"
+SRCREV_machine:qemuppc ?= "7c76aad68f6d1247e72f024f1e0291067a404f8d"
+SRCREV_machine:qemuriscv64 ?= "7c76aad68f6d1247e72f024f1e0291067a404f8d"
+SRCREV_machine:qemuriscv32 ?= "7c76aad68f6d1247e72f024f1e0291067a404f8d"
+SRCREV_machine:qemux86 ?= "7c76aad68f6d1247e72f024f1e0291067a404f8d"
+SRCREV_machine:qemux86-64 ?= "7c76aad68f6d1247e72f024f1e0291067a404f8d"
+SRCREV_machine:qemumips64 ?= "75da5d44c2e54a85a1221ea7d0c04be9aefb7fa1"
+SRCREV_machine ?= "7c76aad68f6d1247e72f024f1e0291067a404f8d"
 SRCREV_meta ?= "a78c74a3510067017dda1926f88bd914f0a053b3"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.34.1


