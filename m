Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B99C3DA7D
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 18:07:24 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.57315.1671559640228553669
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 10:07:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GEBAJDdA;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id m5-20020a7bca45000000b003d2fbab35c6so9460342wml.4
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 10:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qrGf0by00v18zFZYloKhIUkn1mSXxDrmdLn4kDjb0I=;
        b=GEBAJDdAkSRHcz2+6MOLJ2x+C8es+xMWhmCiz0/fMSAKgF96wv2HmbUBj8MCgg51wP
         Pmyfu6ygS08sqgzDV2fMtzNAuFtYulCBGiXVhG+NN3f1yIjEsRH61npZvUz/CWo1RoLu
         SFNVkEMhgOWBC5Vcm89ptA42X5PZbaLy7Tr0jtzsp2QXiDs9yLYXFiH1sLKM70y/2mez
         6jgvfad754XazRbT6KuhSpdm1KRrj1j9Gi3sM48McWNSQds5V1GXXmE1SBM3/QNqRUta
         XlcDary6sP2slxWjk/FchXc9e7MOa8jdf24/w8xIxVDEohF4GqJWpJqrLRomGa5UPbCu
         3JOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qrGf0by00v18zFZYloKhIUkn1mSXxDrmdLn4kDjb0I=;
        b=gvwZWbetxvOGRIQI1SH9y29g63OiZONfmj/0spGS5OYnqhojx4WjT/TQ6VHL8aLSHU
         tdAj2Cg9Ot3/DTt+cWcCyxnBBNEc/IwmuM+dG0j3sXwFiyKR+lqB/2aascwVs/ND9+jm
         PgmmDR7JVo2feAwKR23r2d1aBZY3KWPVLot4NGXif/cqjJlXS3HnCL+JyfAl5n7E03RQ
         ql99PoVgBzhlig/VCDq+AaHYjIqO7TYOCehWsI4n8fdqJPbJeYf26iLE1x5n7FXoEKi4
         /Ea1GMsaN+8PFK2JBRLSMCEvQ27uui1/SS+noXvSHsU4Im5Mv2sgFZzUdca8JJOYjGGG
         R77w==
X-Gm-Message-State: ANoB5pn2wNeOFxALns6JeRfvqNtNy8OwT7/tvFa7pPYcHWPyC44YUNIq
	1C1CnWVJGKD3O0+lJSlcBzvaOxs7HqI=
X-Google-Smtp-Source: AA0mqf7B2kuQobrgNqy33YmXoIHKAu1CcwpnK5BqE4CmRxqu4eZdVG5dF0CpvDngpzFLHtTz8alYRQ==
X-Received: by 2002:a05:600c:3b8a:b0:3d1:f0f1:ceb4 with SMTP id n10-20020a05600c3b8a00b003d1f0f1ceb4mr35426094wms.19.1671559638620;
        Tue, 20 Dec 2022 10:07:18 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id u9-20020a05600c00c900b003cf37c5ddc0sm16243754wmm.22.2022.12.20.10.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 10:07:18 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH][PATCH 06/11] packagegroup-rust-sdk-target: Add Rust SDK target packagegroup
Date: Tue, 20 Dec 2022 18:06:07 +0000
Message-Id: <20221220180612.24555-7-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221220180612.24555-1-alex.kiernan@gmail.com>
References: <20221220180612.24555-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 18:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174866

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../packagegroups/packagegroup-rust-sdk-target.bb  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/recipes-core/packagegroups/packagegroup-rust-sdk-target.bb

diff --git a/meta/recipes-core/packagegroups/packagegroup-rust-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-rust-sdk-target.bb
new file mode 100644
index 000000000000..59874c4c2c81
--- /dev/null
+++ b/meta/recipes-core/packagegroups/packagegroup-rust-sdk-target.bb
@@ -0,0 +1,14 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+SUMMARY = "Target packages for the Rust SDK"
+
+inherit packagegroup
+
+RDEPENDS:${PN} = " \
+    rust \
+    cargo \
+"
-- 
2.39.0


