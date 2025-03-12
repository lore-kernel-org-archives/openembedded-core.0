Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E2D6C35FF2
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:56:07 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.4549.1741809363663643562
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:56:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZurVxqsc;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22403cbb47fso5175685ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809363; x=1742414163; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pPsfw/k/C+zPJzZNMh2/NFPq829yoH2bzzBecVfuZ0w=;
        b=ZurVxqsc3gTW19gP7dVbYcjC/MEJOSYaevKPjFrOUeF/h34OpSfQ4mLxrIRphUzRIf
         r0pG6N4LAyTMFuSv0TPn5O3eX4KdOiloAVptjKMuWFMJCeZr+TSQi5I/tSWwbPJuFaiL
         lkfEY98zaOp9Q+6nSrqeCb/RSAS9GiFyxT++UKBuaAqKy4sm6OKfjcXz8n+4mpkDSihT
         sbQoY9BWj+/3oSIscZ+n0+LofmtjzvCzwhtbB0Ap5GdvHc0SBD3RctcxLUF4TaH1AzvM
         Ey0Bct/0lBZNK45vzOKy3r8eG88lCPuVZchAtOlmV6bt+xNd/R4VFOF+1rH8de1aZH3S
         Us1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809363; x=1742414163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pPsfw/k/C+zPJzZNMh2/NFPq829yoH2bzzBecVfuZ0w=;
        b=Rs1JBofyKvRnFKhbUe0Metj6hiTYpE2N4Aanvc/MJtfRvYt3HkF/ksfOZHaq2Uon7x
         Rqs0VEEzOXyRyLv56DtD3FcaNOoWNbGh57/D3GZWpJP/681HEkIIddyfV5hBq8RuoDUB
         hbD9IYOCTlpr9rYdOLydp0X9khpXJFCc16A8NXvWZKj31WWNhgY0x6TqeD/JF6tULl7p
         PKCu/OjbNs5MTtFopxv+GjYPujePEr+vzV9STTtctLtbeLNXSQnV4VA67wMvMe+K5fK1
         Wda1rN3ctaQcnZOk0aZ72ZE1yAg5w+6IjcUpv7hYoY2RhH1F5zOfVlVHCzRW5GmhEAsX
         QF0A==
X-Gm-Message-State: AOJu0Yws3dHF9IL2EocJJmylB2t1+ieuNLcKpoihpGOmCS8dC88gucf5
	ggCmQCAN3cwYuyqoxseB0H5e0hGbTlu69FI1TZU+2V7o4tzY1qo3qBIZqj6YVaH66v2LiQ0OSUl
	l
X-Gm-Gg: ASbGncus6iw+zJ72ZN2PXDb0dG/4++pwRTFoifKpGpod+OChE0icg7NmhafUEXF0TJN
	cU5vTWqJwr/t3MnLGMo1VhY/hrNejsTL6yZQh6OGdXsDkKW1OitsxXYPx9wsqAHxr2ELdN1pihn
	eR9PfytzAYUTBR1aH97DZiQwqgNFCUMa10b5dqpqL1rbzZff5noMKNUC4s6J4bHUQ63HJdpX3ew
	Gt6iKWrzcr3W7N5lj9BL4suqBQOOkNpDMOwA61NiWph25eJZHrBnHJfeenB+kjkzlGK7uP1ABoE
	jSo6bgfdiZ/ak8FRTCV8wxmDVCnorU2o43c=
X-Google-Smtp-Source: AGHT+IFwqSf9Jwp2Dd3MTvTz+SSKUCpRXDIiuPK9r47ir2NkssHXsaqm8F0FG8H9xov39O9G4Poytg==
X-Received: by 2002:a05:6a21:b90:b0:1f5:7862:7f3a with SMTP id adf61e73a8af0-1f578628090mr20481929637.14.1741809362815;
        Wed, 12 Mar 2025 12:56:02 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281287c10sm9830332a12.78.2025.03.12.12.56.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:56:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/28] cve-check.bbclass: Mitigate symlink related error
Date: Wed, 12 Mar 2025 12:55:25 -0700
Message-ID: <35e210e3ebe21f1f4466760076b7140618af536e.1741809252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741809252.git.steve@sakoman.com>
References: <cover.1741809252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:56:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212698

From: Niko Mauno <niko.mauno@vaisala.com>

According to Yocto reference manual, in description of the
IMAGE_LINK_NAME variable, it is said that

  It is possible to set this to "" to disable symlink creation,
  however, you also need to set :term:`IMAGE_NAME` to still have
  a reasonable value e.g.::

    IMAGE_LINK_NAME = ""
    IMAGE_NAME = "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}${IMAGE_VERSION_SUFFIX}"

However, when using following additions in local.conf file:

  INHERIT += "cve-check"
  IMAGE_LINK_NAME = ""
  IMAGE_NAME = "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}${IMAGE_VERSION_SUFFIX}"

the implicit symlink creation in cve_check_write_rootfs_manifest leads
to following build failure

  $ bitbake core-image-minimal core-image-base
  ...
  ERROR: core-image-base-1.0-r0 do_image_complete: Recipe core-image-base is trying to install files into a shared area when those files already exist. The files and the manifests listing them are:
    /home/poky/build/tmp/deploy/images/qemux86-64/.json
      (matched in manifest-qemux86_64-core-image-minimal.image_complete)
  Please adjust the recipes so only one recipe provides a given file.

Mitigate the issue by creating the symlink only in case IMAGE_LINK_NAME
has not been set to empty string.

(From OE-Core rev: 64bfec359bd909761ce0a6a716286d938ed162d1)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index ed219bf472..badfee550c 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -281,13 +281,15 @@ python cve_check_write_rootfs_manifest () {
 
     if enable_json:
         manifest_name_suffix = d.getVar("CVE_CHECK_MANIFEST_JSON_SUFFIX")
-        link_path = os.path.join(deploy_dir, "%s.%s" % (link_name, manifest_name_suffix))
         manifest_name = d.getVar("CVE_CHECK_MANIFEST_JSON")
 
         with open(manifest_name, "w") as f:
             json.dump(json_data, f, indent=2)
 
-        update_symlinks(manifest_name, link_path)
+        if link_name:
+            link_path = os.path.join(deploy_dir, "%s.%s" % (link_name, manifest_name_suffix))
+            update_symlinks(manifest_name, link_path)
+
         bb.plain("Image CVE JSON report stored in: %s" % manifest_name)
 }
 
-- 
2.43.0


