Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB88CD4F3E
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:25:02 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.16359.1695367497393282561
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DXDA/Cbj;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-986d8332f50so230717466b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367496; x=1695972296; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3d/n02TOLveexkIdW0uWUqWTshEXQ4EHip5wXMnknlA=;
        b=DXDA/Cbjzb9hF8fdiLg9EAFobOpa4px1nzkobFrmTPBFhMVIkyG7H8ZJnrIZ9xXyDA
         oTS2rC0VxR6CRWTCKehVDMGDttN3qVEGZz7kIXWxQ93N4GITxLzA4GQfCNhk19nTgDip
         VcizMIbSwoqADtonZbq54t5iK7qOkxObRL+7CJ1S0j1r2p4iL74CayM/KfGAolTNwAYV
         C5THMQY1FvwzobZ71J+4engnCAICrUHFV4SZtKYAXWB5PwzFPKRZWVGjNrKFQf+t4Enb
         oVYfgzacnoWZfqSCHxyk60EOelOTrEk2ikQ6puBHgx624XDaEB7gGG7YoI8MYMbCCYhi
         Tuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367496; x=1695972296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3d/n02TOLveexkIdW0uWUqWTshEXQ4EHip5wXMnknlA=;
        b=oS14Yvl34QCCQHiRx+G+D/7bewbmOGL5+Gt0J6GnVLaUvJEcMjAtYzPmatxrIQQWv2
         cypsXlv5GmMgcrKsTTYnsA3r4DD9jNHNwItZfM62iZI7z8896qtFEJu6mO3OS+X/Uc7F
         Nl7Q/E5PIvlIY9rxJpkAJ4vJ3fB8/ysFbhthPUPI5M3FxE0/RYp39aYhri3ZlA3Zr/4P
         /jLFLaXbx3gUFcZ26GsxgnsYgMUqilRRkAkrjGKRA+UPZZzg/HaimnjCM1SaIK8iy/DO
         ZgXGxSvdNL70qaKGJvCDDSJu9C7N7e84hIM9wBnnk//TKQ8tghdBw01ifjW2dw/n6fcm
         Id5A==
X-Gm-Message-State: AOJu0YzBVv6PM6tYkO2W51FCAPUkxmzNeYtuy7kvshrXsOueiJrAWrK+
	ZtUXH+IPtDkh3HYlIWUngED17EBvF3Y=
X-Google-Smtp-Source: AGHT+IGIxXq+TJ/lvC/7tW1dXv439qebHw0WiZMSiLgbLvuNVFsgPponsbwM0mbWUywdEMgRmI29EA==
X-Received: by 2002:a17:907:2717:b0:9a1:f81f:d0d5 with SMTP id w23-20020a170907271700b009a1f81fd0d5mr6046842ejk.54.1695367495714;
        Fri, 22 Sep 2023 00:24:55 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 34/40] seatd: upgrade 0.7.0 -> 0.8.0
Date: Fri, 22 Sep 2023 09:24:25 +0200
Message-Id: <20230922072431.1481743-34-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:25:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188076

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/seatd/{seatd_0.7.0.bb => seatd_0.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/seatd/{seatd_0.7.0.bb => seatd_0.8.0.bb} (96%)

diff --git a/meta/recipes-core/seatd/seatd_0.7.0.bb b/meta/recipes-core/seatd/seatd_0.8.0.bb
similarity index 96%
rename from meta/recipes-core/seatd/seatd_0.7.0.bb
rename to meta/recipes-core/seatd/seatd_0.8.0.bb
index 59ef6ad9c15..14c5b1b7ae4 100644
--- a/meta/recipes-core/seatd/seatd_0.7.0.bb
+++ b/meta/recipes-core/seatd/seatd_0.8.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=715a99d2dd552e6188e74d4ed2914d5a"
 
 SRC_URI = "git://git.sr.ht/~kennylevinsen/seatd;protocol=https;branch=master \
            file://init"
-SRCREV = "a803ba0502cccf147eec7fbcacd11c5b8643c0e0"
+SRCREV = "3e9ef69f14f630a719dd464f3c90a7932f1c8296"
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig update-rc.d
-- 
2.30.2


