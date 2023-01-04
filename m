Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9634C6379F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:11 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.9379.1672830371113999238
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oJUYEmfB;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id w1so20447351wrt.8
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHXw4fgwBzbjLnhvQbDJrI2uaXWQh0TQQMziZRyQAuQ=;
        b=oJUYEmfBkhCgERO2Z+MkafXG5Mv1NIPvK3PlWpp0rIxxOwSruZAu4Q2gj+ZJ+/MT0G
         tZAY/zRD1vTnqU3ZTj4l4dOoQAl8FUeRSkctIwLCXcmYbYL75ZRyqleAufghXb1mUklW
         OhkOj8120BVy/1Wut9R5rN8vcC/w1EMvKYvjU2HSakq6Alqe1G5y7aNWTUW7YmjurBNy
         9rKX+MTakrmXNuzxlK2BnpDSzcpucSbitHQcMWSS8rhnJpe7E6x+b17OXDWsLW06Q3CO
         AxSETkMLrOoimmeFsjhKrvMgy5mZkrxg6suaarl5ZRxm79y9xkIN1yguKNcpBNvdjTmv
         0ZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FHXw4fgwBzbjLnhvQbDJrI2uaXWQh0TQQMziZRyQAuQ=;
        b=jnd+0Gk6HQoeucW2e7HNPPgluhIW8EZNhAVV75r4Wo4YtEA6+Wahb+7Ih+5aR8/lkK
         ulfMd2LdENec87Q3w8aCGKkq5cJvCISKaOUdYne7X39Wl69nutONUVF8D8msMhhzOYMl
         CfbHO7FoEYJ+IxicPX+FmlwwSzm2uF5gLpMWkuHe6pcIQf3UOUQsQCweQ4XjoLCiH4e/
         ODcRVp1YN4ldRg6sTcHFNIS712pZgw1VCuTPcUCsy2QRGnYU6YaObA0t1DV0UzTfc0vf
         luFGRjOHbKcidR9RTsIggxG/gAhZJgw2wF/kVNXlmBrRmjSGh868DrcMSvqLxLvLxPEv
         Nu6Q==
X-Gm-Message-State: AFqh2kqrhFKw+uedE1alu7JCLcU7Sc5o6NRjDWutn8vjc/R+pWBUrcfE
	3fsmoEhA3IvAYeaD7gmEF6TvLxT9pWw=
X-Google-Smtp-Source: AMrXdXs8TOjNxpQ8/Gn+2CJtGnUD/Ew9PruD7n+Vh7Z1gNW1S4lMKM7QuiQzcYOvU4HBt588Y4gGMg==
X-Received: by 2002:a5d:4538:0:b0:278:da32:8263 with SMTP id j24-20020a5d4538000000b00278da328263mr25313972wra.64.1672830369655;
        Wed, 04 Jan 2023 03:06:09 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 22/77] python3-pytz: upgrade 2022.6 -> 2022.7
Date: Wed,  4 Jan 2023 12:04:53 +0100
Message-Id: <20230104110548.2537259-22-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175407

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-pytz_2022.6.bb => python3-pytz_2022.7.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytz_2022.6.bb => python3-pytz_2022.7.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-pytz_2022.6.bb b/meta/recipes-devtools/python/python3-pytz_2022.7.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-pytz_2022.6.bb
rename to meta/recipes-devtools/python/python3-pytz_2022.7.bb
index 9631f59288..a6a69c8b59 100644
--- a/meta/recipes-devtools/python/python3-pytz_2022.6.bb
+++ b/meta/recipes-devtools/python/python3-pytz_2022.7.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1a67fc46c1b596cce5d21209bbe75999"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI[sha256sum] = "e89512406b793ca39f5971bc999cc538ce125c0e51c27941bef4568b460095e2"
+SRC_URI[sha256sum] = "7ccfae7b4b2c067464a6733c6261673fdb8fd1be905460396b97a073e9fa683a"
 
 RDEPENDS:${PN}:class-target += "\
     ${PYTHON_PN}-datetime \
-- 
2.30.2


