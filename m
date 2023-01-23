Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91249C54EAA
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 02:21:56 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.34076.1674440512787320354
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jan 2023 18:21:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=anGkckjM;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id z9-20020a17090a468900b00226b6e7aeeaso9802725pjf.1
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 18:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AEyaz4FlbXuB6AknVRp3frP2iebNQwdvg4u9d06tFps=;
        b=anGkckjMTSSQYuXoYoDj1BPut4LycfH67L7HN6OaGJogCPaGzjCGAHskY4gnKXgd1g
         JbDi2tScQKExP8nuPeYI+LVJ+gwA20TSn63gdx5LgwemoxHLz8CtcWrAwmfEth/coytw
         ueI5yY/AhE3jAiwyC7V5rnz44P5LKxr5Ly3A8zc/MoPBWrqyv5EJ8wTdW0iG5sfzXfcr
         CNia7cQ3c+iePC7qQrBOvk5q78GFCv6/ndK0V343eDBPQ4MTqUVZu+l9VCi8McLZ7VNG
         WnJV/DqOpcAyH4qLFFWf0kHtlVwKDkuvcfF9MwZsG1VMOubGEOGwfJNvUNEYu+8Vj54u
         MaHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AEyaz4FlbXuB6AknVRp3frP2iebNQwdvg4u9d06tFps=;
        b=uDr6OqEHvJrj2yjTIsEo47GXPfb1iBfdT9CwwKS246SYN3PbW+5cAesGZ8OETR39kf
         NVB8azcy0o7JrlRYcNo+cHkM6LlfL4cKY1baZ+kOkgiqosO4YKZaNbWuhypOFemoHWNd
         +6yqizQ+Au/8pD0ZfHeb86ueE9amNJPl8wN5Q59MIrkLe26pozK6Vl3PQZIOMfyJ4Q6A
         o1oo58Gr1L+ozxlsOdMTsWrjfpiOc/S1KrA9FwgUfcGEL/cVM7zXwEIaCNQDpTTwWpTu
         T5C3CR7ORNLoUY2VRTVC7tVlgVMZpPra+NSbSYgCC4jHWBqBRd4M0KD5iY+v3CycTvrG
         cMDA==
X-Gm-Message-State: AFqh2kopeEjFF2bD8v6QUMNebfgaWWVEiiDcJwvYC6LXt/U1Iui64pSx
	DfG1T+RkFjj7xgxcqIiqjXo3sf0NXe02u/qBhkk=
X-Google-Smtp-Source: AMrXdXutuGxxtlQV2fYqSYZp8M8WOvfeaBx641ZOFTUzYleqCv5YX11I1Vuqv1xNWPUut/ON9qBNsw==
X-Received: by 2002:a05:6a20:9585:b0:9d:efbe:52ae with SMTP id iu5-20020a056a20958500b0009defbe52aemr24408737pzb.30.1674440511850;
        Sun, 22 Jan 2023 18:21:51 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id h11-20020a056a00000b00b0058dd9c46a8csm10384222pfk.64.2023.01.22.18.21.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 18:21:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/32] cve-check: write the cve manifest to IMGDEPLOYDIR
Date: Sun, 22 Jan 2023 16:20:59 -1000
Message-Id: <3e1ae171d89d0ac5487a8930bf6f8a97c43fdf57.1674440376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674440376.git.steve@sakoman.com>
References: <cover.1674440376.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 02:21:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176269

From: Jermain Horsman <jermain.horsman@nedap.com>

When building an image cve_check_write_rootfs_manifest() would sometimes fail
with a FileNotFoundError when writing the manifest.cve due to the parent
directory (DEPLOY_DIR_IMAGE) not (yet) existing.

The image task will provide the manifest in the deploy directory afterwards,
so other recipes depending on the manifest being in DEPLOY_DIR_IMAGE should
continue to function properly.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 00fb2aae22ce0d7ff5f3f8766fa770eeb4e73483)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 16466586a7..b9c0bfd6d8 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -42,8 +42,8 @@ CVE_CHECK_LOG_JSON ?= "${T}/cve.json"
 CVE_CHECK_DIR ??= "${DEPLOY_DIR}/cve"
 CVE_CHECK_RECIPE_FILE ?= "${CVE_CHECK_DIR}/${PN}"
 CVE_CHECK_RECIPE_FILE_JSON ?= "${CVE_CHECK_DIR}/${PN}_cve.json"
-CVE_CHECK_MANIFEST ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cve"
-CVE_CHECK_MANIFEST_JSON ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.json"
+CVE_CHECK_MANIFEST ?= "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cve"
+CVE_CHECK_MANIFEST_JSON ?= "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.json"
 CVE_CHECK_COPY_FILES ??= "1"
 CVE_CHECK_CREATE_MANIFEST ??= "1"
 
@@ -196,7 +196,7 @@ python cve_check_write_rootfs_manifest () {
         recipies.add(pkg_data["PN"])
 
     bb.note("Writing rootfs CVE manifest")
-    deploy_dir = d.getVar("DEPLOY_DIR_IMAGE")
+    deploy_dir = d.getVar("IMGDEPLOYDIR")
     link_name = d.getVar("IMAGE_LINK_NAME")
 
     json_data = {"version":"1", "package": []}
-- 
2.25.1


