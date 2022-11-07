Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D0CC47088
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:55:32 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.4224.1667832925081087669
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ldg9tQpV;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id v1so16564617wrt.11
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rS7oHri7Cfc3AKjTOgexvpQc5i2752qekE8JW1IY1mE=;
        b=ldg9tQpVrHeHgDFHmQBs2F+9ihb7Zy8NFTJv4Evk+c6InbEchM+nwDAnqxXbw36TQY
         A+D3GXkwkexuJFIOLCNQMMf9JpQK5pVc0PPOAz8g/YaFNs2E2lah+oQrM/ZKYfntwCX8
         4Q9adhsXn5SEQvUiuCydqyRNudqJOZY5VGRFma9v3Jnak9pyinI/up3INdhIYU861wf1
         6yEfW+nY+JfVJMcpWvSVfzE08BPNe7djCHxaPopsWqExEk4SKUI0p0mkyYKEipWZ8agG
         L9HYowy9z0leHoOURkH7edZfz5mlcRtPQml10wKBQs7XXHwu0p+oZZbK7WcqCTu5X9kA
         shMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rS7oHri7Cfc3AKjTOgexvpQc5i2752qekE8JW1IY1mE=;
        b=rWkqj6NhWHZ1eXzPi76YUWcdXeAJpNoFu3jlCAOi15BPjJnEXaQG/HRvfuhj+2ZlIu
         /mDfeVM26O+wV5Ol3I7ulpOpeliS4XDvnXrVO6+YaeHS+akVKI+vmAYgJsMRQteaKYoq
         zipMqMesNVK5+0qMeqcHFv268cjD++LQproaoRWMrCNLaaHd0pE2lqb/vHvGIFYHx0em
         9x2o/Jrq8094bbKUFyGZQ6BmgUdejYB3PSXXKHQFC8I8FMcdbr2Jvt+cbQPYZQebcTAR
         HjnwJDgg9nt0DCqHvj/cLDQ8uES+QgYzw68UB6tQzfL8rXEPdu+zTobJnuW9EblpyfI0
         N9+Q==
X-Gm-Message-State: ACrzQf2WPhhl5Kd0oVoMofdCoshtJQWPvnOr2R/L6YUFiUBXV49GJFqx
	9VQwR2Jd/yyPj05vgxamY/QIlGfzTxg=
X-Google-Smtp-Source: AMsMyM7u00LynSyYlKvuoCF0jkDuGjMIqmPpTkyEiEKHna6lmYlv0cvtoGodkg5HCoZu9z1k9gmPlA==
X-Received: by 2002:adf:f688:0:b0:235:f9ec:ae54 with SMTP id v8-20020adff688000000b00235f9ecae54mr31220849wrp.319.1667832923631;
        Mon, 07 Nov 2022 06:55:23 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:23 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/48] libunistring: upgrade 1.0 -> 1.1
Date: Mon,  7 Nov 2022 15:54:31 +0100
Message-Id: <20221107145508.1051404-11-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172861

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libunistring/{libunistring_1.0.bb => libunistring_1.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libunistring/{libunistring_1.0.bb => libunistring_1.1.bb} (93%)

diff --git a/meta/recipes-support/libunistring/libunistring_1.0.bb b/meta/recipes-support/libunistring/libunistring_1.1.bb
similarity index 93%
rename from meta/recipes-support/libunistring/libunistring_1.0.bb
rename to meta/recipes-support/libunistring/libunistring_1.1.bb
index b6f5100ae8..009707a54a 100644
--- a/meta/recipes-support/libunistring/libunistring_1.0.bb
+++ b/meta/recipes-support/libunistring/libunistring_1.1.bb
@@ -21,7 +21,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
 DEPENDS = "gperf-native"
 
 SRC_URI = "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz"
-SRC_URI[sha256sum] = "3c0184c0e492d7c208ce31d25dd1d2c58f0c3ed6cbbe032c5b248cddad318544"
+SRC_URI[sha256sum] = "a2252beeec830ac444b9f68d6b38ad883db19919db35b52222cf827c385bdb6a"
 
 inherit autotools texinfo
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


