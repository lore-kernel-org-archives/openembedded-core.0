Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 988E9C4167B
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:55:32 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.4332.1667832924591572685
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OGL+q+xO;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id a14so16605678wru.5
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5yPcLe77yowCmSRuCMWRv96dxKl2SxT5hPKw9FMRLU=;
        b=OGL+q+xO7Y8egaYbNG4smWq6uBIAJPB2Mm5Sr62sAlfzBW943m6IfXl3Inj8I57VCu
         eqh3lupAJvmwRY6QhD1N89FJA4VQwjLlRzJXczevR/VNi07HJicfWwi3Gi8u3jPdTls2
         TdPdUpXgdFYUgJzWwap470t0220yL/vv3ofF8zU35I88H16YJA+0kDagK5YcswDa+Dlu
         HZoyzs45+6EpkctHPUZOPVi4j9klHQRnvDEye4l93s3S5dWF6RbZH8I5LQuquyeZDxQb
         Oz+2/YqGpxfPuvBJk3rtQBrxSREd9swbTqB+u+lNWawi1bCQRUXqpdeXtBa7c2xAqmmw
         BLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r5yPcLe77yowCmSRuCMWRv96dxKl2SxT5hPKw9FMRLU=;
        b=QWb5r10T27vzlE+EbrywaAXSh6qkHGqtLCKnxOpFhvpI5xI0hT0YZAzrod4lBfyrn2
         Lt3pfvMmnUS8IiUA2ozVLcijG7IUmSQYM59BrhQI1e0whkUQdP7Gyg8gcAHR3bP73EIP
         jKka/6mq/OwZ3EWqUQLu8WtGuTmyNGhXvAk1eYxTi3rT2vYuRDDyXLHHrdROA8BHXPyD
         41AAjgkPKk4IlJ/dEuNrwHzpecRSDUk6EQWzwJbd/ZdhrYzPUf6d5KOD1/6mgX7qEuSK
         XzOLOzNctZOcOlIEz+aoYJfBnx5Y02OJq//Zky8KgBUqbaRMGKTmy273gd9+75GVbWIF
         CFqg==
X-Gm-Message-State: ACrzQf2rvMbZApheyMmlfVXod+4jNCjUNLlJk5I/FYg9ImO5BFCxloAH
	DmdgXHK3dCPc8vASpgKY7tWYuV6+DcA=
X-Google-Smtp-Source: AMsMyM6hVNvh995TWjpJAzgi1sNB9HjlXD9TtquT7Sk3cFkuzkOcSrKmZfZ1dbslEHY69xc/XnGvBw==
X-Received: by 2002:a5d:5e8a:0:b0:236:cdf2:aa33 with SMTP id ck10-20020a5d5e8a000000b00236cdf2aa33mr26725892wrb.713.1667832922934;
        Mon, 07 Nov 2022 06:55:22 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/48] libbsd: upgrade 0.11.6 -> 0.11.7
Date: Mon,  7 Nov 2022 15:54:30 +0100
Message-Id: <20221107145508.1051404-10-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172860

License-Update: copyright years, removed redundant bsd 4-clause copy

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libbsd/{libbsd_0.11.6.bb => libbsd_0.11.7.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libbsd/{libbsd_0.11.6.bb => libbsd_0.11.7.bb} (90%)

diff --git a/meta/recipes-support/libbsd/libbsd_0.11.6.bb b/meta/recipes-support/libbsd/libbsd_0.11.7.bb
similarity index 90%
rename from meta/recipes-support/libbsd/libbsd_0.11.6.bb
rename to meta/recipes-support/libbsd/libbsd_0.11.7.bb
index 74fc8ef4e5..7a1deed1f6 100644
--- a/meta/recipes-support/libbsd/libbsd_0.11.6.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.11.7.bb
@@ -29,12 +29,12 @@ HOMEPAGE = "https://libbsd.freedesktop.org/wiki/"
 # License: public-domain-Colin-Plumb
 LICENSE = "BSD-3-Clause & BSD-4-Clause & ISC & PD"
 LICENSE:${PN} = "BSD-3-Clause & ISC & PD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c2c635b94c8dcd3593f53e10fa8a499e"
+LIC_FILES_CHKSUM = "file://COPYING;md5=75e85c5a558f86d10fbd5abc567ea5e6"
 SECTION = "libs"
 
 SRC_URI = "https://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "19b38f3172eaf693e6e1c68714636190c7e48851e45224d720b3b5bc0499b5df"
+SRC_URI[sha256sum] = "9baa186059ebbf25c06308e9f991fda31f7183c0f24931826d83aa6abd8a0261"
 
 inherit autotools pkgconfig
 
-- 
2.30.2


