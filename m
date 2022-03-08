Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC81C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 09:42:07 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.6544.1646732526202340978
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 01:42:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PSHQYQCY;
 spf=pass (domain: gmail.com, ip: 209.85.208.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id c20so5206392edr.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 01:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cAOjSIP5eI6x5woHHEExFuok2w+/I2MzcV/hU5QeNgo=;
        b=PSHQYQCYKQADF5H5BRti5ToR9BNeAipz6Bv3hZd1tbok66mrurGajPbf3hL0atdqke
         fuBqvERv3LS4viXnwlG0pHPXlUodSjK8LAOxH+yLVUPN8cpvhUkpLg0fLd5BJq0TMceG
         zvJU6XD3K1oe2ZuQ1/JQa1Jox5AyTaaRJKIZgkoCGORfNl4Bl5FArV8tOU3dyqsNUvSb
         k34IrQT9iNH+ADS7M8v8pRCjYOlkFMXbbTeI3TuscViEDiLId1SwZegErDq8hSO7jvEE
         0k16gqNT+xomLCoMo0KruTDs8dWxDETZBq5gAt7k/QFc6eMwQQShVJnyGXynhzFrGIX7
         Il/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cAOjSIP5eI6x5woHHEExFuok2w+/I2MzcV/hU5QeNgo=;
        b=hpXDqvtL8KQi6unL5LO4FadiTXmVyGGW1MIum4mbmCtthTJfi5B8MWI/c2Xm5laLMC
         xjdr2Isb03L6MjfLvxjqUFXp3Y2Sc1NIkzE3f8dy7RXN9oYKo6DvvDeDHtzhFO+i13cp
         PmnparxJEodzmv670biKCqEwuODN7sRze16SJibDQi6Bsivp9ndgwfJKt39q5xPpZm39
         PFXBP+XDLCluqlT73VcCvjmwNZ5mzMzeutuizUEwsi2sSvWNQ6vUG6CQ+gDcCUi3ZUXU
         PL3QVFTqOxXh39wwZ7B+DZDM0tpgPdEH2iceduSHjk4wOgqrb7Vd9RaFN4pQLySiOksF
         MHew==
X-Gm-Message-State: AOAM533ChSZ7L1k7cmHXgrsklpS9lmeZcWpOP/j1q22YqHII7+S9gXf2
	18D5r4h6qIxJtfA15BtqMRZKGCeEtdg=
X-Google-Smtp-Source: 
 ABdhPJwkn8jBT8MHsJPimaNs9geP5u9hyOlbqhmFmOA9JgysH0IIzTEDPksh3qCUHrFOBi9oSf7nOg==
X-Received: by 2002:a05:6402:44:b0:416:5582:91e with SMTP id
 f4-20020a056402004400b004165582091emr6915890edu.9.1646732524693;
        Tue, 08 Mar 2022 01:42:04 -0800 (PST)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 w15-20020a056402268f00b00416474fbb42sm2837023edd.19.2022.03.08.01.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 01:42:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] libuv: fix upstream version check
Date: Tue,  8 Mar 2022 10:42:01 +0100
Message-Id: <20220308094201.3439256-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 09:42:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162894

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-connectivity/libuv/libuv_1.43.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.43.0.bb b/meta/recipes-connectivity/libuv/libuv_1.43.0.bb
index 1b536de1e3..4ae4262fb9 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.43.0.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.43.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
 
 SRCREV = "988f2bfc4defb9a85a536a3e645834c161143ee0"
 SRC_URI = "git://github.com/libuv/libuv;branch=v1.x;protocol=https"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


