Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A53C4332F
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:35:07 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.11523.1634657706104659761
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Pt++rVCU;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id
 a140-20020a1c7f92000000b0030d8315b593so3325657wmd.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dL28d6mB6LIGaCDgbzcF0s1c176i6wurtKA38ll/Sao=;
        b=Pt++rVCUrv/8qh+wBn0AKaG4ImgRSdbMFzwXcmGe74IpOTqxoc9ka3n9SttBnfBtlt
         A3qPhzN85JzXLMKmBQ1RNkg8Uhxffjd7kzTF1bPx4YTicGz5L7b2tU4dI9EjfZnnWp8P
         1yJQLGyirn/TxTs9nh3vTIxP02m6V+C2R6XLFwN8UlpckSrDUxH7d1hHVGCXY1+Mgd79
         RfG4Ex3nsUa3kofuY93ID/DF28YsI0QERnJHaP12iA8KGKVfZfcMiaOSoS+jqtv2bUqI
         5rWL0cdmk3jgo2zua51soVmAb4dRy1g7UZlewlu1vRVkNze6wHiOCp7h9ZEhT5K/Hoal
         V6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dL28d6mB6LIGaCDgbzcF0s1c176i6wurtKA38ll/Sao=;
        b=uysaprGo1rvCz7J16RYMQPQM2oUiHvzQk1tuvFc594UP2kgVOCZoDbcmX3A2njGn4P
         MN40vI65DRhbIm6tS/vNEIV6GosCicVg+pnLSU3RwiiPao4DTjT5/SacwjaGPgpe+lXF
         heIMWovoolrsX29AmvqWG5onGCyaZMhqxPj3QtEEQZohm24PEx9DnRcyoTwbayf7DOJF
         P7LttTLnkVNPHx7+VKI401FTLNiuQ1meWbPSTl2o5PgcGNoh+Zm0vnTA/HSsS+862OPZ
         M7/BZ9wGxfK9n667eCX+fp5SlZSpqD8ond4WXvVoYJgFj/PTzI2j0I7kOrVbR8pXY89n
         NSwQ==
X-Gm-Message-State: AOAM533Seiaiz5/84QH0rEM0zcK5h3hWsnz4GFQtR5yDYSRSJUoYMwoy
	ZjGY1U1eV43/8FJfvNJSgQpZ4cd5U54=
X-Google-Smtp-Source: 
 ABdhPJwAjsZKW7KKOetn3J6Do7NTyfYULeq5hQmytc+bsiZCnfub8VgywYqhMZF0HADU/CLMuehGSg==
X-Received: by 2002:adf:9787:: with SMTP id s7mr44179750wrb.191.1634657704659;
        Tue, 19 Oct 2021 08:35:04 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:35:04 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 57/65] fribidi: upgrade 1.0.10 -> 1.0.11
Date: Tue, 19 Oct 2021 17:34:11 +0200
Message-Id: <20211019153419.3319802-57-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:35:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157176

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../fribidi/{fribidi_1.0.10.bb => fribidi_1.0.11.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/fribidi/{fribidi_1.0.10.bb => fribidi_1.0.11.bb} (85%)

diff --git a/meta/recipes-support/fribidi/fribidi_1.0.10.bb b/meta/recipes-support/fribidi/fribidi_1.0.11.bb
similarity index 85%
rename from meta/recipes-support/fribidi/fribidi_1.0.10.bb
rename to meta/recipes-support/fribidi/fribidi_1.0.11.bb
index b2ef77349a..7e4f29497b 100644
--- a/meta/recipes-support/fribidi/fribidi_1.0.10.bb
+++ b/meta/recipes-support/fribidi/fribidi_1.0.11.bb
@@ -11,8 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.xz \
            "
-SRC_URI[md5sum] = "97c87da9930e8e70fbfc8e2bcd031554"
-SRC_URI[sha256sum] = "7f1c687c7831499bcacae5e8675945a39bacbad16ecaa945e9454a32df653c01"
+SRC_URI[sha256sum] = "30f93e9c63ee627d1a2cedcf59ac34d45bf30240982f99e44c6e015466b4e73d"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 
-- 
2.20.1


