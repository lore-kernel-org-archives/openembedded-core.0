Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FC73C47074
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 03:18:06 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.4877.1700018285353321532
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 19:18:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=v93zv2Nt;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5bdb0be3591so5018292a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 19:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700018284; x=1700623084; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=maJummaCH/YIjMqoCIuVO+Gjw+QXYVkapUXhhycRuY4=;
        b=v93zv2NtJF3ZlOsgZuN4WBfvwiuVMMZil/BquWpzZjjs5m9bwj/LlGQ7xSab20UyQp
         +B8/7HlyDcbVMtw0yQfZNQJuWkSqEewokUDXI2laEbMrjoecXCicJ+iPs1Z/AJGXIlvO
         hfMPg5/+BRYZZXr4iYz+03U7zaw9H7CDKDqbzcmuGiLlxobmu6NYnhvZ3rRR0QJSWDCg
         AUZXctqVWnJboJd5+EbXMc4sK9Ht/3Ifc61zWx6RrqZ9M6J/sLIwtvw6wJ31AeNd/ye0
         RXHja39vgaN+tZind3fcAJiI31rnCHNJ6uRggJ7cdQZqaFuyGD94NMhmUtO9e90p8ldO
         r1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700018284; x=1700623084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=maJummaCH/YIjMqoCIuVO+Gjw+QXYVkapUXhhycRuY4=;
        b=M/WKGM1zLy1q3TW4UH8WfhBo5DsSZgSyJq6pdTHTCe/ow4LL281uAs4dEv/ukpTN2q
         SugavnzBS1YLGUyvXppo+DWd5K3P0aNCH3Z2VllheIv9YPpv1eXGtsyp6vynJpxOv9jn
         au7KBoG3UDEezm/EJhZfiJ4WxVdOP0NtDOQ4Tfj35M9Kv5PnMIwsA/L286XZjNDDrGjl
         4FKsb2TzBUlyVKSDRH9vOc0lLsd6IJpoXylN/wsiQ7glc0+KdfdJlPLP6Xiz2Io1bvuu
         oGTC8OkpbV6ErbtlAwEyc2RBnsIaYVpxgQbHuYqgu3SpiLswT6EFDn+d12Ia480EoHAT
         2SMw==
X-Gm-Message-State: AOJu0YyJ3xKxTy58R1Ca5pcrHwRuYojIFbX7RifaasmfFWGh4wsPzE3I
	dGaMHkrklNJHHavZ2IG6gQK6aUVGot06+r45u2TiXw==
X-Google-Smtp-Source: AGHT+IGl0X1y85QaUWfDhhkJDgF0ePS5SSrVrqySl2pAamZZPgW2IyqDZmToOBAjiSkDJALJEswcqw==
X-Received: by 2002:a05:6a20:8f14:b0:185:c28f:d188 with SMTP id b20-20020a056a208f1400b00185c28fd188mr14763768pzk.45.1700018284130;
        Tue, 14 Nov 2023 19:18:04 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l5-20020a170903120500b001c6187f2875sm6369300plh.225.2023.11.14.19.18.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 19:18:03 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/17] assimp: Explicitly use nobranch=1 in SRC_URI
Date: Tue, 14 Nov 2023 17:17:30 -1000
Message-Id: <4bd92b9621909b8b528b648529baaaa48bc1c424.1700018112.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700018112.git.steve@sakoman.com>
References: <cover.1700018112.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 03:18:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190543

From: Naveen Saini <naveen.kumar.saini@intel.com>

Branch 'assimp_5.0_release' is not present in repo.

Error:
assimp-5.0.1-r0 do_fetch: Fetcher failure: Unable to find revision 8f0c6b04b2257a520aaab38421b2e090204b69df in branch assimp_5.0_release even from upstream

Set nobranch=1, to fetch from v5.0.1 tag.

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/vulkan/assimp_5.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/assimp_5.0.1.bb b/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
index 295ac12fc5..0774f37e31 100644
--- a/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
+++ b/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2119edef0916b0bd511cb3c731076271"
 
 DEPENDS = "zlib"
 
-SRC_URI = "git://github.com/assimp/assimp.git;branch=assimp_5.0_release;protocol=https \
+SRC_URI = "git://github.com/assimp/assimp.git;nobranch=1;protocol=https \
            file://0001-closes-https-github.com-assimp-assimp-issues-2733-up.patch \
            file://0001-Use-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch \
            "
-- 
2.34.1


