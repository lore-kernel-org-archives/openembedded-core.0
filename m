Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 342AAC61D97
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 14:42:17 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.46643.1674657736048551622
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 06:42:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=cOJIKyLp;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id f11so950501pfc.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 06:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ke0vkRgtkG4au6LjK8pJ7AbFg9pyBAoM9wSWmTf22LU=;
        b=cOJIKyLpNeRxZJGvD8jiVfij0LJ0MgCv1ef+NbVQlGqYtcdoz9cJWnPvufei01JEA3
         zhJaIbdAhSOjPOQnK56CKIyTBnpq9Q4M5tbAUT7iAIFSRubJ/nYq2x01crvPcAUm49V6
         isZE21KO4sYm8n7Mcl4aU18N2Ne/adNrSjPFqBDUes0QlmjK8LJd1c5/MXddV5opuIly
         1OC+FzEP6OCs2KxUUXc0qw03QuyT0dpfh8JfadpZUom+LP/m14fREpGXuPb7m+K38h5v
         pCllioOPc7tglg248cxA2WyRr/WAckab4MgcxV+VbEhanC2UQWCHlvGzaSPkIbVr18At
         u6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ke0vkRgtkG4au6LjK8pJ7AbFg9pyBAoM9wSWmTf22LU=;
        b=BBVqrY+6bVE0IFb266MXudxYFyQXs18pvXzpBAERLLfQ4StxvBDW57WlTlzoSKoSZb
         wBLSOKTJjZ1+IeA9u8R+h0FFlX7ZBuxfsNLk+kChcaU9wZaqOEqUSRtcFrHk5NRKINXR
         Dtb2wkXLl8nbXHw2/9m0VV4cLqH7GzGBgUjsQUiXlvuLudB4YDGIELFWmLU8xde6nbLk
         46icgGkALhbEmFgac3M/3y9ltuGTKQCIwXzibasOnCML1yv1A1gOonhFj55ey7pNuVj4
         MBW2DqJgOuP49VKOMhAxrkqcUWrfYjJXbGSTfrclKCM7PLCg43X4OBcihPCkyEpzacNu
         z/xQ==
X-Gm-Message-State: AO0yUKWKUudGsflx0ShXlkhZKAOhRFS2puS6qjGEvZeREoPOLIrrQvC0
	dYChJ+5LaiG1kFwut07tvx5qfkd2OxmuK0iFxoo=
X-Google-Smtp-Source: AK7set8y8sihXK/lxl3DsNS4mXWlk1Jw0nCgqN0OlZ4G0Ufjjbri6s5I/Qys8pVJbZgE0CqevNBk8Q==
X-Received: by 2002:a62:1790:0:b0:590:67e8:f2f5 with SMTP id 138-20020a621790000000b0059067e8f2f5mr1352074pfx.23.1674657735127;
        Wed, 25 Jan 2023 06:42:15 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d2-20020aa78142000000b005810c4286d6sm3723703pfn.0.2023.01.25.06.42.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:42:14 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/16] cve-check: write the cve manifest to IMGDEPLOYDIR
Date: Wed, 25 Jan 2023 04:41:48 -1000
Message-Id: <c25a5c5f6fede29893a2ac1502216e9deccfa6c3.1674657501.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674657501.git.steve@sakoman.com>
References: <cover.1674657501.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 14:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176356

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
index 4fc4e545e4..87a59d5c6d 100644
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
 
@@ -195,7 +195,7 @@ python cve_check_write_rootfs_manifest () {
         recipies.add(pkg_data["PN"])
 
     bb.note("Writing rootfs CVE manifest")
-    deploy_dir = d.getVar("DEPLOY_DIR_IMAGE")
+    deploy_dir = d.getVar("IMGDEPLOYDIR")
     link_name = d.getVar("IMAGE_LINK_NAME")
 
     json_data = {"version":"1", "package": []}
-- 
2.25.1


