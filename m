Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A892C47DDC
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 21:14:36 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.5984.1705698867638950593
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 13:14:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VZKkoz18;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4298e866cd6so7950541cf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 13:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705698867; x=1706303667; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGwT3zd/Pq09ufo4QbSVzfxgITgB5SB97+YwYkNoKcI=;
        b=VZKkoz18oYUe6jtxKKFDH1aY0oSjVZ414X7GEt8vEae7H9lQ3krb2c+XF8EOejlpkF
         LdJE9v31FdKXXUFrZJHAcObJ0eV1TGZKKbl7XcZaL/nRLB7zYYkATawuaXbF0f0Yxjjr
         GcUAXdDzOf818uU+cCiFSWISsE4dXARht78qKR41mgC5rW3zvV4+d7Q/FKSzayYepj2v
         2ln+wU9HvUsNX6Ddo2Jhq6RggEbg4Gdocf+giK/25vqFjPfIMKxWtBWYu0NiIeC/YlRF
         dBizsNW2xM2vxQc7QrAyaBkB9NQe5hxM17p594N8KX0UmVD4PJCHV6Inw0fqyMKses5s
         IdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705698867; x=1706303667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nGwT3zd/Pq09ufo4QbSVzfxgITgB5SB97+YwYkNoKcI=;
        b=tSwh5SOIZuMkVqNkBWJbLFUQjUxeXnQfsLDX+mgs44H2DZNze4ispz/F6L6Iw64T2l
         5ORTU+IrNiKjz8X0CV/gUOg/zLXvT7CqCy/x3OIqmjxdlZ2kIdzK/OKoAQoFvWfOVXnX
         cIqjnFkRZPTIDH4xEUCth6LI0Fs18lgR1hhTPjomrX7q85KQjfFxcM0Cn0I0hoFSu2sy
         MwGGnKcqdFOr6mp7Laqa3+BEOLSo920zaXSrwBzAguamEIfF0NUOhEwoNHdmw2npcEeE
         Jl0leG9pSEbeRy913AwaxneAWNUpDxF31Ul6deEfWtP3w9g4ybprJ2oT8PvN9ZQuSbKx
         /JEA==
X-Gm-Message-State: AOJu0Yx+1KAuj3bpnSwBfHAcuhGDOBHhmJwOobzY3ArQ8qxJL82F2wt0
	va0J1TCd12T6/Jpx1wLsvxjTmoNY7pIVowmmMsOMgs2hFcqnd479
X-Google-Smtp-Source: AGHT+IE6hVX8mryqJvo61SjkaY6pslH6s9Ndof4086vnIMdjV0UXPqczyQ4xJ8nedctyQB7xGVhoxg==
X-Received: by 2002:a05:6214:5289:b0:681:77e3:e3ac with SMTP id kj9-20020a056214528900b0068177e3e3acmr602863qvb.89.1705698866606;
        Fri, 19 Jan 2024 13:14:26 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id mk13-20020a056214580d00b0068178f50102sm33552qvb.25.2024.01.19.13.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 13:14:26 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/11] linux-yocto/6.6: cfg: arm: introduce page size fragments
Date: Fri, 19 Jan 2024 16:14:13 -0500
Message-Id: <4611ede535afa80d6a746647b79c961859908808.1705698717.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1705698717.git.bruce.ashfield@gmail.com>
References: <cover.1705698717.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 21:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194071

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Ross Burton
    Email: ross.burton@arm.com
    Subject: arch/arm: add fragments to explicitly select 4/16/64 KB pages on arm64
    Date: Tue, 9 Jan 2024 13:33:06 +0000

    Linux on aarch64 supports various page sizes. The default is 4KB but
    there can be performance improvements in many workloads with larger
    pages.

    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 2094613aa0..324494f122 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "3e67e7e050ae8af74f9158dc71f952539f1516e5"
-SRCREV_meta ?= "25ae36cd00a816ba8aab368a443cab1c166e3c2f"
+SRCREV_meta ?= "399295102a9b0db007323d12f561ecfd5782dcf0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 842e9c7693..b839bac95d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "1c28ec6773065e82643c9ec1cb7dd2bd8ab1f929"
-SRCREV_meta ?= "25ae36cd00a816ba8aab368a443cab1c166e3c2f"
+SRCREV_meta ?= "399295102a9b0db007323d12f561ecfd5782dcf0"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 9dae76e9a3..7c5d5f25d1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "1c28ec6773065e82643c9ec1cb7dd2bd8ab1f929"
 SRCREV_machine:qemux86-64 ?= "1c28ec6773065e82643c9ec1cb7dd2bd8ab1f929"
 SRCREV_machine:qemumips64 ?= "cbf59cfe385657b0ee385264be2fcf785f6f1959"
 SRCREV_machine ?= "1c28ec6773065e82643c9ec1cb7dd2bd8ab1f929"
-SRCREV_meta ?= "25ae36cd00a816ba8aab368a443cab1c166e3c2f"
+SRCREV_meta ?= "399295102a9b0db007323d12f561ecfd5782dcf0"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


