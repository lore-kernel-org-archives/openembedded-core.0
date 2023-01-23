Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC436C61D97
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 02:22:26 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.34096.1674440538395713571
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jan 2023 18:22:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=jm89xRUo;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id g68so7944776pgc.11
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 18:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jPqhW3uImt4Ba8Os84yacJdGrkkubgI0PrgHvwKD2ik=;
        b=jm89xRUoZ9Z68MVZBOWUaQi5ThvZRLPrvZYFuOwm5pduXU4/n2IVl1YaXkclZHw96N
         K7WdziZp5Ojyd9dffCCGwXPcWDxVRpnNCSeQ5gzBBwATbucYM7yYyM2Z395sZLcvzIT7
         dhZ7Lcuo3E/LtFlCN40S7mwBAB0kBu6S15LAQLp1+mGoZehY9At2xtXdgSweC4TTu9Fz
         UfTq+jIy6i73NlCJ6Iqv9DdkcdTBp3CeLKXM/7CjlS4EKVTpQh6bcUl4HE9WwG161cbq
         lkbb3IkhNA+9VI7XDSCl/Z9tfTxsNaSGu+rgzrFNkvGVqxZR43+zo3FlZ3042RfOrBBP
         yXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jPqhW3uImt4Ba8Os84yacJdGrkkubgI0PrgHvwKD2ik=;
        b=d7nNtevFrBrdglMvQQts3WELUai3Fq7LAc3PeDGm5IoBbUSG2kCVLkM94MVN0HxKza
         mYhrThHlOZ00lVX+L7a6X2+jlrHWkL+PJqGYFMkVScvyA5p1cqWwxvvzxW6Ho2qYf9J0
         8zukok+Nw+rjpkDup6pqldbr22FAfsblqNNz41/LlhIW8L438FNkgani0oxcFs8Plj5C
         p0IRXIU0Rz3BwF3F49gzj7v3JFJT82T87QhjJKtzyvKcfqRNnjqHWDtXLh1Dm8zowNPn
         Snx3zgKlJYo5X0jzLslvRwCxUu0fAiRbPXbhapld0yee5DED6DJ5IZPyc+sNxJegfRTi
         VofA==
X-Gm-Message-State: AFqh2koz8NvD5mlv9oLVaalNgz9IjrGdDS2+KaXYkzz+19a5v5f0vmme
	3qA2JJHi61QubBF9k7QzEYen3jvKS8mRmos/Np4=
X-Google-Smtp-Source: AMrXdXtDx9hksUB4q3/Hwj6uVefeuSyq+PEb4bOpA5xU7sDhQpZk0tggYnfl137flkXMxxvx/jYtEQ==
X-Received: by 2002:a62:52d0:0:b0:582:c408:3ed1 with SMTP id g199-20020a6252d0000000b00582c4083ed1mr44114998pfb.32.1674440537419;
        Sun, 22 Jan 2023 18:22:17 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id h11-20020a056a00000b00b0058dd9c46a8csm10384222pfk.64.2023.01.22.18.22.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 18:22:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/32] linux-yocto/5.15: powerpc: Fix reschedule bug in KUAP-unlocked user copy
Date: Sun, 22 Jan 2023 16:21:11 -1000
Message-Id: <9308cfbb6cff9fd38fcea8495803d71da821aec2.1674440376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674440376.git.steve@sakoman.com>
References: <cover.1674440376.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 02:22:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176281

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    f100c753aa1f powerpc: Fix reschedule bug in KUAP-unlocked user copy

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b457e6976e9e64a737517f9d9142ab290cdce214)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.15.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 22 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index dd9f940c7c..122fc0feac 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6a972b54f014ca67588d73f32058c42af0bd856e"
-SRCREV_meta ?= "72756ee16d7230f04fb6bbf0bb115e32a9d73d8d"
+SRCREV_machine ?= "e53e73b907707b92b3433de7c9c776aa504b2d0b"
+SRCREV_meta ?= "e77e5259a3d11efe417b164a0f3341c07ba2bc46"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 8aa2ee14f2..f060e22e84 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "6e85c80a960287ec238f53c91eeade3456044fa3"
-SRCREV_meta ?= "72756ee16d7230f04fb6bbf0bb115e32a9d73d8d"
+SRCREV_machine ?= "ae2415ee19511e205a983bc8024700c1f794076a"
+SRCREV_meta ?= "e77e5259a3d11efe417b164a0f3341c07ba2bc46"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index f28dae716b..bb48e158ab 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "24c30a8e9f8385f6d74785aa345f5731321b6c41"
-SRCREV_machine:qemuarm64 ?= "c3caed57192735dc74adff939ea35af248a11177"
-SRCREV_machine:qemumips ?= "3bed92886dc9177ce0076dada5056cbe83ec11f0"
-SRCREV_machine:qemuppc ?= "45cbeb05d362ee51b7836a7faa07958670110c38"
-SRCREV_machine:qemuriscv64 ?= "da5513f301871b972d5bc6fab284d3cb277e0a28"
-SRCREV_machine:qemuriscv32 ?= "da5513f301871b972d5bc6fab284d3cb277e0a28"
-SRCREV_machine:qemux86 ?= "da5513f301871b972d5bc6fab284d3cb277e0a28"
-SRCREV_machine:qemux86-64 ?= "da5513f301871b972d5bc6fab284d3cb277e0a28"
-SRCREV_machine:qemumips64 ?= "2642cdd862a63f5a8c2774f372f3d3424991b1b9"
-SRCREV_machine ?= "da5513f301871b972d5bc6fab284d3cb277e0a28"
-SRCREV_meta ?= "72756ee16d7230f04fb6bbf0bb115e32a9d73d8d"
+SRCREV_machine:qemuarm ?= "8c0f02ba7db6a463ca3aef969441906706edb350"
+SRCREV_machine:qemuarm64 ?= "42a14881ba8145b2d1bdfc019c603abe79aeafd4"
+SRCREV_machine:qemumips ?= "1ea321a5c9c66edba818ddffcef2aa9910de552e"
+SRCREV_machine:qemuppc ?= "14da484e7f2fc95e10abb4db96bc5fd6b444cb60"
+SRCREV_machine:qemuriscv64 ?= "f100c753aa1f9638bfd476da0498b09fdee569d6"
+SRCREV_machine:qemuriscv32 ?= "f100c753aa1f9638bfd476da0498b09fdee569d6"
+SRCREV_machine:qemux86 ?= "f100c753aa1f9638bfd476da0498b09fdee569d6"
+SRCREV_machine:qemux86-64 ?= "f100c753aa1f9638bfd476da0498b09fdee569d6"
+SRCREV_machine:qemumips64 ?= "8db5fd5c032f44486ef52f34724d0452aa3a6fea"
+SRCREV_machine ?= "f100c753aa1f9638bfd476da0498b09fdee569d6"
+SRCREV_meta ?= "e77e5259a3d11efe417b164a0f3341c07ba2bc46"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.25.1


