Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E76BBC001DE
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:33 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.7344.1686734967736568139
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=pHu+lBSY;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9741caaf9d4so74748266b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734966; x=1689326966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0Z6wuXnPq97xGYYGMAY0TsUpa9r3UmD1ce/QhSFSn0=;
        b=pHu+lBSYvpJyijr6AVgNtdey09b4nzwg+NAvCiDhT96Vrjz7UiM/+giUfNNE+P9gec
         qvhCRLAODqdlt37L6Bl8pOd8nPz3b5FV2bD9MnPCE6cMXsT8Sa1C2z2YWzmovNVjHoXR
         3ZLPRznQfBhwAnr/MLnlO8pUNHOQU0+dEhJWrZmTqz+qIvDGHhLpJuC81N8UNNxYp+9H
         z1A3Nx8BRgxv/8tL1K16gmsYfRAWGlLWQnRq7XJSebZN/59eET0/eNNhUShdtZGsFVBc
         gvkghKhOeDStlTI0apLJSukD2fmZuhcOhgQRuNF04IJDR1wGIgVIKasiXRWcr0FrvCJy
         M9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734966; x=1689326966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L0Z6wuXnPq97xGYYGMAY0TsUpa9r3UmD1ce/QhSFSn0=;
        b=NSh5OuhxgbevNuEI78ygyzun0PVNn4yrSvVYOvCEtjVZh7ljFKos7iGPyXfMQbummU
         6TGUDd5TTceEgfOsBNr2DJmZZAG6UIOApJpo2jb6Xuf26fZyEhWRnTDvKKjYa17LZIVr
         ciZzXVZ6cgx6bKLoxjS4LBtS5KM8YpQjgFWj5i1KvyC+e7x2f0MDaD0913EaF4Uu506L
         iMGJg9zo+dANG6ah8R1P89Ijca+8nrYREV0wp3kZ/kG7CfhjQdF5/X70HDDDNNAGfe2O
         koUfXhC/i7yRFx9b/hKOoihCaNn+phoRkMpjDP5PDFast9eX0MdRfTSo+Ry04igRT0H8
         6n5g==
X-Gm-Message-State: AC+VfDwHycdcwJ0GioRmwSCI4IpGqRy/h69lIqH74KCvdNfy5YXeQlB3
	+dcWMldWo7KKgx/bfn+Q9kPBrQtPBlo=
X-Google-Smtp-Source: ACHHUZ58SdYb2t+cKgURiVpj0FrkRSCG2TtI3fEeMmzKUUcZq/qpNe/D6cw9GInqFg142kJHfumagA==
X-Received: by 2002:a17:907:a02:b0:94f:7edf:8fa1 with SMTP id bb2-20020a1709070a0200b0094f7edf8fa1mr15247554ejc.32.1686734966071;
        Wed, 14 Jun 2023 02:29:26 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:25 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/55] sysfsutils: fetch a supported fork from github
Date: Wed, 14 Jun 2023 11:28:28 +0200
Message-Id: <20230614092918.4065570-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182750

Debian does the same:
https://packages.debian.org/source/sid/sysfsutils

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
index c90a02f1319..fd72cf41659 100644
--- a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
+++ b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
@@ -10,18 +10,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3d06403ea54c7574a9e581c6478cc393 \
                     file://lib/LGPL;md5=b75d069791103ffe1c0d6435deeff72e"
 PR = "r5"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/linux-diag/sysfsutils-${PV}.tar.gz \
+SRC_URI = "git://github.com/linux-ras/sysfsutils.git;protocol=https;branch=master \
            file://sysfsutils-2.0.0-class-dup.patch \
            file://obsolete_automake_macros.patch \
            file://separatebuild.patch"
 
-SRC_URI[md5sum] = "14e7dcd0436d2f49aa403f67e1ef7ddc"
-SRC_URI[sha256sum] = "e865de2c1f559fff0d3fc936e660c0efaf7afe662064f2fb97ccad1ec28d208a"
+SRCREV = "0d5456e1c9d969cdad6accef2ae2d4881d5db085"
 
-UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/linux-diag/files/sysfsutils/"
-UPSTREAM_CHECK_REGEX = "/sysfsutils/(?P<pver>(\d+[\.\-_]*)+)/"
-
-S = "${WORKDIR}/sysfsutils-${PV}"
+S = "${WORKDIR}/git"
 
 inherit autotools
 
-- 
2.30.2


