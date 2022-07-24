Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7379CCA47C
	for <webhook@archiver.kernel.org>; Sun, 24 Jul 2022 19:33:32 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web08.20058.1658691206385432054
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jul 2022 12:33:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NGwn36Sk;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id g2so5208958wru.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jul 2022 12:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1OsGe0/85HAhge1w32uU4JKDr2ll92Djpv+Gvx1DLb4=;
        b=NGwn36SkuND3nSNpLGQVmX5z+hnfKbehyoPaWXIwbkEkmOw+MJ8bFhTof3n7ji1UtP
         O3uW4MRaC2sDBSTDyJ1XUaHSGpz0hLyGWyxYQpfEA3/UTCrNCDE5YMYIRG/y8YUdjbd+
         +nISeiAtHCwSdLgHVyrRi1Fg9FWV7bmR4wAD6/wlYrE0mIq7l/TUtDDLY5CBMoDj4BdW
         CNf0xFkXimGKJ3FEE4mMDaMaJXlA9Y6zNkmKzD+1GzIZ/jqhS+zVy45jwmAMLsEckJbx
         RdzKYRC1uar6OJhlVsSDds9KOYqPzJALSP4JucZo/fHR2qZVhKv/9AJ8WfzRhWFsw4m5
         KvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1OsGe0/85HAhge1w32uU4JKDr2ll92Djpv+Gvx1DLb4=;
        b=aX5gUEwPKUy/AtBC55xGwvzsuA+ZOi9ewVK61jrcNPOUC+yB+I0OhiT0xPijAMjcJI
         qC0MUD9FhalT/cjdBcmWSeiULEY0LtCBVXuaJHkrqCVIGhtEZvmHY2Cb5LGBM8ZOsnXd
         LHxlKtta2oQam+J7CCFRuJY9Bm5AdJzAj48apPV8BgMZhVab5H16vfbQ49QvIyYHE5M5
         ZzjfDvdRNIukJxgdDPE3OxbKF7pzYLOzygfi/wrkNX2zwqo8rtKOi3cDRAHr9i6rzTnq
         QZYuRdaxXiQSg0kjYbdKfzgOzGEKsIgjBLLliA3TkCAW57kIccoFZfmvIdxWn1bVACFf
         P4dg==
X-Gm-Message-State: AJIora8P6xP7dTSdxdA5s43RtjOaR1OOfR+Hl0+lYqzAVzAsXxxUNEo+
	j2noENzeRU0L05+uxdnFfUs75qCdB3E=
X-Google-Smtp-Source: 
 AGRyM1sOyRdZ9Dtf9baTZUp2pFUBqXCDx3oaj+JpMmlrEOof8pDi/+gXWo9o6OEzgKA9njhV94NC/Q==
X-Received: by 2002:a05:6000:18d2:b0:21d:6661:60b5 with SMTP id
 w18-20020a05600018d200b0021d666160b5mr5912200wrq.475.1658691204812;
        Sun, 24 Jul 2022 12:33:24 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 u16-20020a05600c00d000b003a31c4f6f74sm18373085wmm.32.2022.07.24.12.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jul 2022 12:33:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 1/2] python3-setuptools: move patch from 'files' to
 'python3-setuptools'
Date: Sun, 24 Jul 2022 21:33:04 +0200
Message-Id: <20220724193305.817056-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Jul 2022 19:33:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168464

* it's not used by any other recipe AFAIK
* meta-python2 has own copy for python-setuptools there in:
  meta-python2/recipes-devtools/python/python-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-conditionally-do-not-fetch-code-by-easy_install.patch    | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-devtools/python/{files => python3-setuptools}/0001-conditionally-do-not-fetch-code-by-easy_install.patch (100%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
similarity index 100%
rename from meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
rename to meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
-- 
2.35.1


