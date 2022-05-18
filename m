Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14724C4167B
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:06 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.3489.1652871539620739912
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F6tP4jt6;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id wh22so2896707ejb.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vztp9RI+ulIjfgu8dFP2YGKU4sPp2uV5zfQatX2Ng0Y=;
        b=F6tP4jt6uwMColbuoXaTx4xw79JIE1wO8Ybq9tJy7f14BZPZfP6mYDGfviYTxUwRLJ
         h5twP/+KWGxqH2VB1+VsVm6XGnpbTj+u1WNJ7PYjV9ygJYgBKzyjG+UfHnkzT08RAePp
         0tW+Ah0NZtmM1VB4oyy9n5JzDML6A2ateaBCHgu57Fg7xD2rh5Y3dlFMy2Q0/1zg6zBP
         s9CVSKWYTJDsULZ0gUT8oImIZfHdn48WdvusH8qWdXaze1VVSvvHRO6wbb29oXqxKzu+
         O4OjpNhlIdVrztW2lT47aFwc9NXvvz8NIpCffqWF9nZY91GMuCiR22BDWVZxS0fuav8k
         zKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vztp9RI+ulIjfgu8dFP2YGKU4sPp2uV5zfQatX2Ng0Y=;
        b=bjsH7xacQ3qZevVzS+RDUJPnnMIQAYFD1oHq2B7zUceobvJJk86wTsLCW1b9pc08w/
         3sN+IL/fBgkprKN9Lm0gixWml2TND+5bpg8buWAIMIMjfYdmqdP95VzV7fNw+4a7/dAo
         9189P89pNqCSJnPiYzH4tBwAakAvCKE2ikFcpuYwOvJQzYK4d5MNgZ9JPVIKEmCmz2yY
         nHJzUWbg/cVGlizH67uKOtYhcn0VuSXfJ78rc+0XnjWYVKI9cmALtFCCoMpvS0lCT+kA
         Dd6aBOH+8mxQ3Po0jbJrcZPh683JP1mxwaob0jGg3TpmkTR5r/nJlrChzsGf7Agpa4bf
         OjSw==
X-Gm-Message-State: AOAM533K2+YDfkHGu1sK2ngkPRJgyG0vFiHMBV+s6wOY10zI7EZXM5gA
	j6yHS+QrPLbQPREaZfE9m8i9mTo7wi4=
X-Google-Smtp-Source: 
 ABdhPJweoGMXbwaKE1Jb7szbRxnKuxT7vJeionpUtD5B2hB/KJFJvI/KP/7QpObnFWPRTwzGShKLYw==
X-Received: by 2002:a17:906:fccc:b0:6f3:7569:77fd with SMTP id
 qx12-20020a170906fccc00b006f3756977fdmr23664813ejb.266.1652871540136;
        Wed, 18 May 2022 03:59:00 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:58:59 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/49] curl: upgrade 7.83.0 -> 7.83.1
Date: Wed, 18 May 2022 12:58:07 +0200
Message-Id: <20220518105843.3299331-13-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165810

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/curl/{curl_7.83.0.bb => curl_7.83.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/curl/{curl_7.83.0.bb => curl_7.83.1.bb} (97%)

diff --git a/meta/recipes-support/curl/curl_7.83.0.bb b/meta/recipes-support/curl/curl_7.83.1.bb
similarity index 97%
rename from meta/recipes-support/curl/curl_7.83.0.bb
rename to meta/recipes-support/curl/curl_7.83.1.bb
index 07027a2f31..1d9de29a65 100644
--- a/meta/recipes-support/curl/curl_7.83.0.bb
+++ b/meta/recipes-support/curl/curl_7.83.1.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT-open-group"
 LIC_FILES_CHKSUM = "file://COPYING;md5=190c514872597083303371684954f238"
 
 SRC_URI = "https://curl.se/download/${BP}.tar.xz"
-SRC_URI[sha256sum] = "bbff0e6b5047e773f3c3b084d80546cc1be4e354c09e419c2d0ef6116253511a"
+SRC_URI[sha256sum] = "2cb9c2356e7263a1272fd1435ef7cdebf2cd21400ec287b068396deb705c22c4"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.30.2


