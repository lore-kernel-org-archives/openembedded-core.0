Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C64CD1296
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 03:12:13 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.2638.1712113929167827779
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Apr 2024 20:12:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DwZh3dl5;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6e6f69e850bso6546482b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 20:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1712113928; x=1712718728; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n/bCAw/8Z/WUI+iMwtdeFoGcdMDDV0pB3+hUu+rs9+M=;
        b=DwZh3dl5PTYUvnDeLVn20qOdw5MBejL8oydC6Aip8P78kdD2OCeI0bn+LnA5fEmYfM
         DHNybstrkBdQz+dZXGV496z1qytFuh8v7hf8sui5E2qhn5H9FHnXAdzR71MPEbMeesCg
         66FmlXkYoCT1GS72rd4tNBSLlDv0lRZO87B9wWhVIEJXeth4G0wf0QRhyjONrPNOwbU3
         AWoYRTIbhmLpdMGauBtJLVCGL+zhJB8hb8m7JgFHdLk4hgQW/QamRBJW+bU1V3WB9FAO
         irfx21nMQl/PBwIglf8ufzfUrnMSEIwoyIXwJN5CT73jx0H+vld98cjVxydN29fwvRUz
         Dwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712113928; x=1712718728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n/bCAw/8Z/WUI+iMwtdeFoGcdMDDV0pB3+hUu+rs9+M=;
        b=cCJ7A5yg+OssZO7wy/zaqAw8S5EocTQ4FHT1Ab+Wx+Iutyz6uoMbAqTq4OSVOLbQn0
         TpFbA9oSN2AY+WYekIJltC8dU5lZwlU/vsFmHTkQKhcarE/1c9xxhF8S2pZEPRpvAKS+
         y6Bvr8SdtoH4OS/5vyO73+ZycsNDjBmBYVqortg0ZIqRUv7UN/tVMlMOh3jXnJUuN19m
         6rKDNAADaYoopgEdrlauDv244Y97/ZRoZs1x26YNM+v3GtptIUohtuwuXiP2ud6kX9xC
         L+aDgd7wJ9tXW5irX7BCSM3aIkKSFt20f5CmrgnxJxppB9b8xe6iGrg4FwzW3/H7wFI2
         U+zQ==
X-Gm-Message-State: AOJu0YyVL/xVesdEjGRz3Sjo7TDswlRI5u+fWQwCNq5ObIAWgb56y8xu
	kRGCFIb6JhWqNPJTXzZoEIaaF2M4pewGlltvFcOsuZlR8LBoSpcvfOcmsTjflevuMK38uPeBDCX
	V2CU=
X-Google-Smtp-Source: AGHT+IE2nnO3Oz7WJ4A47nw17i1HF8XyKceZ/+k8PAtJp/M+vPyKz3VAblZnGzSpue1IK1bJlvbQVA==
X-Received: by 2002:a05:6a21:2d89:b0:1a7:2e1f:9549 with SMTP id ty9-20020a056a212d8900b001a72e1f9549mr43360pzb.61.1712113928513;
        Tue, 02 Apr 2024 20:12:08 -0700 (PDT)
Received: from xps13.. (067-053-223-136.biz.spectrum.com. [67.53.223.136])
        by smtp.gmail.com with ESMTPSA id x15-20020a63170f000000b005dc87f5dfcfsm10371743pgl.78.2024.04.02.20.12.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 20:12:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/7] tar: bump PR to deal with sstate corruption on autobuilder
Date: Tue,  2 Apr 2024 17:11:51 -1000
Message-Id: <cbce426763592e82e6e0ed20f18cedfa4d01f61e.1712113689.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712113689.git.steve@sakoman.com>
References: <cover.1712113689.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 03:12:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197891

Testing of an SPDX patch corrupted sstate, so bump PR to work around the issue

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/tar/tar_1.32.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/tar/tar_1.32.bb b/meta/recipes-extended/tar/tar_1.32.bb
index c560741599..9297480e85 100644
--- a/meta/recipes-extended/tar/tar_1.32.bb
+++ b/meta/recipes-extended/tar/tar_1.32.bb
@@ -6,6 +6,8 @@ SECTION = "base"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
+PR = "r1"
+
 SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2 \
            file://musl_dirent.patch \
            file://CVE-2021-20193.patch \
-- 
2.34.1


