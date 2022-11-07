Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC8FC4167D
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:55:52 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.4309.1667832943977102843
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IxDmBcgA;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id g12so16558601wrs.10
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZxGvqb54M6+kaikqHh9ykYdAS+MZID9/Xd8ctMe3v4=;
        b=IxDmBcgAQy7hZFgBrt+qlKyp4rM48lnq8h/P6LMyc9BVNy+FBOYHa9uxvY8hfucnT3
         V9Et7FWeoIsUEKcsB438rC0d2hR9FBdBcsZirmI+3lkyBjd2aqv5QnTadsmFXhRZyodH
         xIUCunRea1AszrhlyTC+FsHHWOVQYu5Oif8kmHQai/bSPlpX/HmmhNHBH8yEZKhvygLj
         Mr484ZGWg1pVDYnJ9VyLEf4Uxp+vMwSAhKI/YgECXo1OR5Od6JQpgCO1WvGSJ0Ng/AvQ
         DGjseHu+UjWE/O/IuWBqsLg8RI8HlH0NWXjdWSZlnHjfjG8lw8COK3VSCzT2Fuyc6kcR
         6BkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ZxGvqb54M6+kaikqHh9ykYdAS+MZID9/Xd8ctMe3v4=;
        b=neBasf+C9y2uIMKqTMrOl5ITZoLcx9j+ieqzZpLd/VWE14+0HnPZyzB/bNvklI9NVJ
         JxaD2m1fPJ5FoAWXuCBw1ArVm1Ol1afk0isIPbMSHOsCmH9sNWeHYs9CjXZraXGJK28x
         uX9Fd2tZvTjcy4go+Fn308lxzUG0tGqg+Rcxae3Aztkqakk3ABlpdWfONq+eT8thcrbL
         YL/IifmgODYNwnXWuVgfVABdcRQsnJv3sVLRcixRrZti+jCQYu/BJj2/YGu1DM8MoPYu
         p8xDhQC/Kbp53b6TRCa3d09HrjTAf/A6UrRnuOL+oq9a2j2nKxz7/sBXdZC366mz4kec
         2KaQ==
X-Gm-Message-State: ACrzQf2MjO699Zaq7X8t6WjgmCM4ci3GOHNuISuCw3mTeugpwfDP4+lw
	t2Gzt5cbfy99U19zGf5aWaWmgJ5reAg=
X-Google-Smtp-Source: AMsMyM44iVB7cpb7yeCL8MoNalrpnVU271WWzNf7pfazUmxOVEjlNURF1kEYs0SWy8SwdoTqeLVJaQ==
X-Received: by 2002:a5d:64ee:0:b0:236:8f54:f180 with SMTP id g14-20020a5d64ee000000b002368f54f180mr30820995wri.559.1667832942403;
        Mon, 07 Nov 2022 06:55:42 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:41 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 28/48] libidn2: upgrade 2.3.3 -> 2.3.4
Date: Mon,  7 Nov 2022 15:54:48 +0100
Message-Id: <20221107145508.1051404-28-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:55:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172879

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libidn/{libidn2_2.3.3.bb => libidn2_2.3.4.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libidn/{libidn2_2.3.3.bb => libidn2_2.3.4.bb} (94%)

diff --git a/meta/recipes-extended/libidn/libidn2_2.3.3.bb b/meta/recipes-extended/libidn/libidn2_2.3.4.bb
similarity index 94%
rename from meta/recipes-extended/libidn/libidn2_2.3.3.bb
rename to meta/recipes-extended/libidn/libidn2_2.3.4.bb
index a86b2b5a8d..b48de39fa0 100644
--- a/meta/recipes-extended/libidn/libidn2_2.3.3.bb
+++ b/meta/recipes-extended/libidn/libidn2_2.3.4.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d834ea7d480438ada04e5d846152395 \
                     "
 
 SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "f3ac987522c00d33d44b323cae424e2cffcb4c63c6aa6cd1376edacbf1c36eb0"
+SRC_URI[sha256sum] = "93caba72b4e051d1f8d4f5a076ab63c99b77faee019b72b9783b267986dbb45f"
 
 DEPENDS = "virtual/libiconv libunistring"
 
-- 
2.30.2


