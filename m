Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84414C76196
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 12:16:04 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.17699.1678709758962351284
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 05:15:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Mqo5BA4O;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id r15so20638881edq.11
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 05:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678709757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W1CS1YCv7Dnz2AOpLFWitdlyME3wgbwbhMu97MvtRbg=;
        b=Mqo5BA4OwXgJ6MMrN7Oc93cRFn3yQsR+Qoh+v9yWJniEqATaAN7u/oy9EjM1AGM6hs
         yCVtAriYadvm1VZgny41aVgho8NT4drIwENvMvbJQRe2NOe5R/h9ChLFl6Qdrwvhjvbw
         nQyiHfmAONUp/r2LRX7/BvUnWSvhALh1+MhRW6605W544z6UwPideB3YeoIUrVIHqsC9
         lly8XfArUm4VqnVgJWxNpRmSlzO8u2mu4Zx/wltMGyFFAUfHNfGEkQ0EZCg190rME1k0
         e0SvHex2oWnp6dbN8VdxBFhaaSTbfUb0mIZBvyqb27upTEREZAthUmesu/JF8xI26JZo
         VVuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678709757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W1CS1YCv7Dnz2AOpLFWitdlyME3wgbwbhMu97MvtRbg=;
        b=EQ6vfsqnUZiorFqYTLQN7PqkIB+h3lgTTt1eMGRZL8LHyXOE8W8/29D5RNiU+NRCc0
         PMdabghQIuPy9oqqBVsmR/S9Kwt2QO7OZnyHDzH4kL680VL4q/egIyXdaBFExkympOmK
         RhUqvKCkgG536j+IYES8xXVgztRv9XGOvWdgvnCd7L0/1YDPWTZe3ZSAuc2xwEEQeUA6
         BMPZXdM54Mg1l1IkT4YPhG+1vTkwvGpmsu2j5M/iADEk92L7iuDhCp5wqzxeBeXWPLAi
         wNb2zOtVH9g+vmqJDfYjh4n99aaCw9RpJgmefQF9SJkXQHm+OpoCJqR8C+iFv7laWaMM
         o9CQ==
X-Gm-Message-State: AO0yUKU6etWiCkcXw4aiy3sg1UwIUnUk+XB5MQa43hsAyxbmeZNgbiGj
	zzDxs/tzoOMSz4UF2yXECuQxUkOC7HI=
X-Google-Smtp-Source: AK7set8arBO1/rZqM8ZIkWkZ/LNjzdJxwmH+E7+StaJaPm3mePjDmFlBD55bh+Dl2Wx4nKOOPpfanw==
X-Received: by 2002:a17:906:1604:b0:879:bff:55c with SMTP id m4-20020a170906160400b008790bff055cmr7107773ejd.1.1678709757393;
        Mon, 13 Mar 2023 05:15:57 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id u13-20020a50950d000000b004af70c546dasm3138695eda.87.2023.03.13.05.15.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 05:15:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/14] image-artifact-names.bbclass: add INITRAMFS_IMAGE_NAME from kernel.bbclass
Date: Mon, 13 Mar 2023 13:15:34 +0100
Message-Id: <94b43880d87f405dec680b0a6f666af7b0c774a0.1678709427.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678709427.git.Martin.Jansa@gmail.com>
References: <cover.1678709427.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 12:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178439

* move it from kernel.bbclass, because it needs to stay in sync with
  IMAGE_LINK_NAME structure

* image-artifact-names.bbclass is also inheritted from kernel-artifact-names.bbclass
  so every recipe which needs this variable probably already inherits one of these

* fixes kernel-fitimage.bbclass with modified IMAGE_LINK_NAME

[YOCTO #12937]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes-recipe/image-artifact-names.bbclass | 3 +++
 meta/classes-recipe/kernel.bbclass               | 1 -
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image-artifact-names.bbclass b/meta/classes-recipe/image-artifact-names.bbclass
index 5c4e746b90..9dc25b6dde 100644
--- a/meta/classes-recipe/image-artifact-names.bbclass
+++ b/meta/classes-recipe/image-artifact-names.bbclass
@@ -14,6 +14,9 @@ IMAGE_VERSION_SUFFIX[vardepsexclude] += "DATETIME SOURCE_DATE_EPOCH"
 IMAGE_NAME ?= "${IMAGE_BASENAME}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
 IMAGE_LINK_NAME ?= "${IMAGE_BASENAME}-${MACHINE}"
 
+# This needs to stay in sync with IMAGE_LINK_NAME, but with INITRAMFS_IMAGE instead of IMAGE_BASENAME
+INITRAMFS_IMAGE_NAME ?= "${@['${INITRAMFS_IMAGE}-${MACHINE}', ''][d.getVar('INITRAMFS_IMAGE') == '']}"
+
 # IMAGE_NAME is the base name for everything produced when building images.
 # The actual image that contains the rootfs has an additional suffix (.rootfs
 # by default) followed by additional suffices which describe the format (.ext4,
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 92090ac14e..aefa0d21bc 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -33,7 +33,6 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 KERNEL_IMAGETYPE ?= "zImage"
 INITRAMFS_IMAGE ?= ""
-INITRAMFS_IMAGE_NAME ?= "${@['${INITRAMFS_IMAGE}-${MACHINE}', ''][d.getVar('INITRAMFS_IMAGE') == '']}"
 INITRAMFS_TASK ?= ""
 INITRAMFS_IMAGE_BUNDLE ?= ""
 INITRAMFS_DEPLOY_DIR_IMAGE ?= "${DEPLOY_DIR_IMAGE}"
-- 
2.39.2


