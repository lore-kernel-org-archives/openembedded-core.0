Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84350C7618E
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 12:16:04 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.18081.1678709760320240602
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 05:16:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H9A9nalU;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id fd5so13954487edb.7
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 05:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678709759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8abbq+PjyCVRZ+oaXsw+0IWSp1RY1n+4YNXwFKz1knQ=;
        b=H9A9nalUYkPkgRZoat1q0olydFz8T08I3qyEZfB0KbOst5rncJYI9DEmFskyL7Rlwn
         7P3IhpT5xh616CRDYsop3mJx3BhdNy5rQc/751b6H166oZ2BiS3IgMEfLlRWNMQbCvn4
         JAkZeKnv0MKzhpm2pFGZn8a7edS4yxZEJVl5xFjT7X6+RHZXOOd6wzK/X5JR+DV5jnW0
         8zUav9C3a9mMkAzcxWaJV/8AOnU+afBRQpwyb+BrQ6+9j4GX4qWr4/rqrnPItEYXuABJ
         XcKlX0CxNI5fBWAlTNeLJU02wsuhCRTGgIthesid0y9phdifhjbXhwUs4DfRobuCkRC6
         61xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678709759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8abbq+PjyCVRZ+oaXsw+0IWSp1RY1n+4YNXwFKz1knQ=;
        b=AQ0KTIZ6WYyPGo9bGMkoPMUElEUCQLQ0oL0680IhUnpOZHXg8g3HTwBbTg85aomlp1
         MpnadMNBdts/0RCUW/rIKRzwbSoVD+NZY63PtIVXf0dBE+5B8bJB4IW3jnWxHmY7aKSM
         r9+Zlz1nPSvOnOjHgAMT5RAUYa2CL/ihQTvN1RHkg5KHdKqdK0SzJm+ly9L2bJOFb4v3
         FQrAmVcLeG0NkFJ9BOJlk/G6GL/AujhGHqlTHfmQceE2ezqP8X2d7GV9t1ntvePpSU0n
         zlJgCtm423XfZ7fETFcKrb6aMaGZLIC6Sep0OkoWEciwCzefIhxUkK4zTTK0Yrt0KCij
         FURQ==
X-Gm-Message-State: AO0yUKXz5Tievjap/31N+ntZDlHitM/YLPxRAAQn5DnH3VHLdlF/HdQt
	0/nFc2Tn+dGuR1MYLd9156M+JOtSrbg=
X-Google-Smtp-Source: AK7set/FecBhG7P1mCLlkPjnx3IkUJIC+XS53xHHppdq2SPAux4fzsFCM7U7dUDv4oN5Ens69V4DLw==
X-Received: by 2002:a17:906:66d8:b0:872:b17a:9b59 with SMTP id k24-20020a17090666d800b00872b17a9b59mr32505403ejp.38.1678709758799;
        Mon, 13 Mar 2023 05:15:58 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id y24-20020a50ce18000000b004fc2a75c6b3sm1272986edi.23.2023.03.13.05.15.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 05:15:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/14] image-artifact-names: add IMAGE_MACHINE_SUFFIX variable
Date: Mon, 13 Mar 2023 13:15:36 +0100
Message-Id: <06c7db2b170b9cf47c803ea12c83b58f886074b2.1678709427.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678709427.git.Martin.Jansa@gmail.com>
References: <cover.1678709427.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 12:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178441

* to make it easier for projects to avoid default -${MACHINE} suffix if
  the ${MACHINE} named DEPLOY_DIR_IMAGE works better for them

* also use IMAGE_LINK_NAME in IMAGE_NAME to make it more clear
  that IMAGE_NAME is the same as IMAGE_LINK_NAME but with version
  suffix

* adding it as separate variable helps us to catch the cases
  where we didn't respect ${IMAGE_LINK_NAME} variable and just used
  the common default ${IMAGE_BASENAME}-${MACHINE}.

[YOCTO #12937]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes-recipe/image-artifact-names.bbclass  | 15 ++++++++++++---
 meta/classes-recipe/kernel-artifact-names.bbclass |  2 +-
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/image-artifact-names.bbclass b/meta/classes-recipe/image-artifact-names.bbclass
index 9dc25b6dde..ac2376d59a 100644
--- a/meta/classes-recipe/image-artifact-names.bbclass
+++ b/meta/classes-recipe/image-artifact-names.bbclass
@@ -11,11 +11,20 @@
 IMAGE_BASENAME ?= "${PN}"
 IMAGE_VERSION_SUFFIX ?= "-${DATETIME}"
 IMAGE_VERSION_SUFFIX[vardepsexclude] += "DATETIME SOURCE_DATE_EPOCH"
-IMAGE_NAME ?= "${IMAGE_BASENAME}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
-IMAGE_LINK_NAME ?= "${IMAGE_BASENAME}-${MACHINE}"
+IMAGE_NAME ?= "${IMAGE_LINK_NAME}${IMAGE_VERSION_SUFFIX}"
+IMAGE_LINK_NAME ?= "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}"
 
 # This needs to stay in sync with IMAGE_LINK_NAME, but with INITRAMFS_IMAGE instead of IMAGE_BASENAME
-INITRAMFS_IMAGE_NAME ?= "${@['${INITRAMFS_IMAGE}-${MACHINE}', ''][d.getVar('INITRAMFS_IMAGE') == '']}"
+INITRAMFS_IMAGE_NAME ?= "${@['${INITRAMFS_IMAGE}${IMAGE_MACHINE_SUFFIX}', ''][d.getVar('INITRAMFS_IMAGE') == '']}"
+
+# The default DEPLOY_DIR_IMAGE is ${MACHINE} directory:
+# meta/conf/bitbake.conf:DEPLOY_DIR_IMAGE ?= "${DEPLOY_DIR}/images/${MACHINE}"
+# so many people find it unnecessary to include this suffix to every image
+# stored there, but other people often fetch various images for different
+# MACHINEs to the same downloads directory and then the suffix is very helpful
+# add separate variable for projects to decide which scheme works best for them
+# without understanding the IMAGE_NAME/IMAGE_LINK_NAME structure.
+IMAGE_MACHINE_SUFFIX ??= "-${MACHINE}"
 
 # IMAGE_NAME is the base name for everything produced when building images.
 # The actual image that contains the rootfs has an additional suffix (.rootfs
diff --git a/meta/classes-recipe/kernel-artifact-names.bbclass b/meta/classes-recipe/kernel-artifact-names.bbclass
index 311075c68d..1a7611a15e 100644
--- a/meta/classes-recipe/kernel-artifact-names.bbclass
+++ b/meta/classes-recipe/kernel-artifact-names.bbclass
@@ -12,7 +12,7 @@
 
 inherit image-artifact-names
 
-KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
+KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}${IMAGE_MACHINE_SUFFIX}${IMAGE_VERSION_SUFFIX}"
 KERNEL_ARTIFACT_LINK_NAME ?= "${MACHINE}"
 KERNEL_ARTIFACT_BIN_EXT ?= ".bin"
 
-- 
2.39.2


