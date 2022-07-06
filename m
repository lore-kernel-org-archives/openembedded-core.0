Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7AC9C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 08:07:51 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web08.3745.1657094864933943894
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XxaKBaa5;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id u15so1222393ejx.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wqChXzgiM3QRl5rhGhLtMrwcvL9YdQTA5QkZ4+gMOU8=;
        b=XxaKBaa5b/s2ARk4DF7p47JHIiEqTug+MdeGFYD5JSgToxf+IiYjFZStCbhH5kYQ9N
         JdgDKE8RXvRkc30TFcHt4C5VdhT2iSTdO3kxxSysqCnpdXyDT+99bxG/zzvXaHmZFe/h
         9XXimb76UzNsHGEIFvWxTnza7PtR8qX38YjvxAE8Xfm2HkF9KbAlyp7KcFgZpetmlvoB
         /QG4K25KqEsEJvTPeFLAHZJOyjEqxAd2mZZuBn88C8eh2JkKRKND824cjmdOv7g2Glxd
         PiWEktkgaDaf3GZHAR7CwwvfdqqNdmllNzZemoCzXfJ/YN1qMV+baSSAJJnsVTpopySz
         7LiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wqChXzgiM3QRl5rhGhLtMrwcvL9YdQTA5QkZ4+gMOU8=;
        b=dB/XRUdbvHAMfzDkwqW9gCZTKMmuA3lOf0h5MetvxI9pUK/KxrVnA30nTxeCuLxph4
         COte3LHQ3ydUrWMa5KW0mTVrmWNDMtqLO5DXzywTZOkSv90nM+M4NjpTIks1swoT/fiV
         nPgtyrrG89NZud2cMzPK3BlOj8LDdec3Ihf5Mx9mIrdm63l+hPpYOgF0FIY1jJdMLmzU
         6Ipqy5ZfxF5BWbdk9/ISj7Iqc9M7LdvKjmQ00/Ej4DtFJydz3FSKcu6Sh4iFg+8DY+8t
         gBJpaMUSgO9sAs8kLshj8HLU5VpGqTWB6ej3whet5H3oD4ve0B92ZiO9r3jV/UQYhyZV
         eJ/Q==
X-Gm-Message-State: AJIora/2bPbTAWJUOAz9600DHT4QQR6aVO4bPBOfkzCPbk4NvQ+plKKR
	7oBf3gZ3HjZhM/1iNK2sVHRNYiBxSY7qvg==
X-Google-Smtp-Source: 
 AGRyM1sspL4JNB+Uo/Kyrb5OX3+gteRTGdzSF274DdvIO2ZU2nRfMtQKh+SzXqwJ22CRT1Xzzdu73w==
X-Received: by 2002:a17:906:2dd:b0:712:1293:3dd8 with SMTP id
 29-20020a17090602dd00b0071212933dd8mr37791247ejk.448.1657094869662;
        Wed, 06 Jul 2022 01:07:49 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 v19-20020a170906381300b00721d8e5bf0bsm17001344ejc.6.2022.07.06.01.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 01:07:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 24/27] python3-sphinx: upgrade 5.0.0 -> 5.0.2
Date: Wed,  6 Jul 2022 10:07:18 +0200
Message-Id: <20220706080721.3072553-24-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220706080721.3072553-1-alex@linutronix.de>
References: <20220706080721.3072553-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 08:07:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167711

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-sphinx_5.0.0.bb => python3-sphinx_5.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx_5.0.0.bb => python3-sphinx_5.0.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_5.0.0.bb b/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-sphinx_5.0.0.bb
rename to meta/recipes-devtools/python/python3-sphinx_5.0.2.bb
index 93edd9db7e..46cc26e67e 100644
--- a/meta/recipes-devtools/python/python3-sphinx_5.0.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=72c536e78c21c567311b193fe00cd253"
 
 PYPI_PACKAGE = "Sphinx"
 
-SRC_URI[sha256sum] = "464d9c1bd5613bcebe76b46658763f3f3dbb184da7406e632a84596d3cd8ee90"
+SRC_URI[sha256sum] = "b18e978ea7565720f26019c702cd85c84376e948370f1cd43d60265010e1c7b0"
 
 inherit setuptools3 pypi
 
-- 
2.30.2


