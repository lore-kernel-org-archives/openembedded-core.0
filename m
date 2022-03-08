Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D4AC43219
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 09:32:38 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web08.6289.1646731956721549339
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 01:32:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f3NUFzo+;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id y22so4561808eds.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 01:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p7idZFqrMtaB1dSKZkcrK4tcJYGRD/XugOKkMc4QuD8=;
        b=f3NUFzo+2iAVr8q7awa9WqFkQCajRTisSEXbhJpm4ksdS9JRAwxlt0adn9Kog5xq5H
         hs/ZaEegnNvkgYplOEjeet0ZtYaBiMXlv9yDIw09XNowVsj1Fc85mJAw0JWmW4IvD7qZ
         ShsWdMw+C6NSPwmEItsDHYdDb1/EKJ8u4mYCvlqtTW9NcLtrVGJlQt77QAwelVxcrsgE
         awTkZXlcdTFL8n5SSv3LufywlGc6m2Kgi0jZTsWT7P6Om1H4ltT9VajN8KWzLyKSP6hz
         ksbsnihT7UdiHYCmN7AiHKjMEBlobpHPnLjXqXar5PYBsGBn8Uzn2YiY1eYLNCyLizXM
         z5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p7idZFqrMtaB1dSKZkcrK4tcJYGRD/XugOKkMc4QuD8=;
        b=2u6x18R6KnNj7OdnjG4m4dc/IxR59HoEKwC9hoOoxh2wSdOTUk+JkNc+xLDnrFSq9i
         KN3FA093bhQy2LppIExjhbn44I3wCqesnLY76Lvp9/HRq7ER5pU2gyVBHZ/DlinK8xWO
         tmTIArJc7KoeJU80gsv369k/oWBI2PIAr/Ov+e8VSGynBm2Rpag7ENkrsUvYMSdVcjy6
         LfhJ3eU6kYBS78Ig2cd7IraYDfHc/06vG5ZsrU30Yiv850avZL4EHeVqQnwup3qLzJid
         3hP8y/peJgn6jZHpAXZh0YZL4FCUQ2RDIefJIKAI42T9PaJx6WyWhofvHtD+usI2ZnJg
         lCLw==
X-Gm-Message-State: AOAM533uW9WprtUKBwp8l7+GgTsgG+k+4UqHPOYDpMEgGwLjszEk2jyZ
	vvVlNtLp+56kdbZ7GhwMi4s0iM+Aen4=
X-Google-Smtp-Source: 
 ABdhPJxgvct/KaHHevgxwc1KUhN03gD+RnsFG2l3QJtkXMZsCXYdxAePIdXqrbSgegU2ZkgELq+o0w==
X-Received: by 2002:a05:6402:1b90:b0:415:d7d0:d9bf with SMTP id
 cc16-20020a0564021b9000b00415d7d0d9bfmr15362993edb.17.1646731955303;
        Tue, 08 Mar 2022 01:32:35 -0800 (PST)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 g22-20020a170906395600b006cec40b9cf0sm5640178eje.92.2022.03.08.01.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 01:32:34 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/16] diffoscope: upgrade 204 -> 206
Date: Tue,  8 Mar 2022 10:32:18 +0100
Message-Id: <20220308093224.3436483-10-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220308093224.3436483-1-alex@linutronix.de>
References: <20220308093224.3436483-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 09:32:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162887

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../diffoscope/{diffoscope_204.bb => diffoscope_206.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_204.bb => diffoscope_206.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_204.bb b/meta/recipes-support/diffoscope/diffoscope_206.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_204.bb
rename to meta/recipes-support/diffoscope/diffoscope_206.bb
index 588894cb9a..7eaca74b33 100644
--- a/meta/recipes-support/diffoscope/diffoscope_204.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_206.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "cc99eb4cd9555947b11d6abb7ba83e71234f92ad1372e3b61e934115192ecb4e"
+SRC_URI[sha256sum] = "93731939ede57547a3275c3c81875ab4bd222f26364a7519cf6aafe1939cd603"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.30.2


