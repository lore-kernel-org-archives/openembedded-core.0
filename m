Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B072C43217
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 09:07:47 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.9124.1635325666687089809
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jw/jWSjX;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id m22so2967262wrb.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dk8N3oDbAEFnUTShorfLznt+NvLC92tLEIuwim7L+FM=;
        b=jw/jWSjXjD/NdC2U0Jqhj5O3dNbuflgu+6LwCxEoUrQ75cbK5QGIqiNREoQg3TBUpn
         aJADt0Pc+pQAb8qq4DdZ5kCtbX6PIlJIBcEyYswAtH0QXjvXrPFiphRExijVEosC5blr
         bPuiC/PlqtJRPACjVyZihxvJrKY3iSao2XlDbAKb+OQavauA/IXdqOaLnEEUOu6ihcuc
         YHVFzm1h2Sqw5KAdsX0HFjilWmyf5i2PUwNkzpB3LPrUI5yqyDQ34OZAriBK4df4Qxgd
         vib+5aEViWtg8ZYVfIf0OC8Z1OHYMm3v64EkXReMY8pkCWZK1h7Lre1PfEzuaa/47Jyf
         lzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dk8N3oDbAEFnUTShorfLznt+NvLC92tLEIuwim7L+FM=;
        b=xm4khZUIk6yoYpbBmAkxOGseD3kqMcOHRDGFRh0wPUkjisHiazboUmnrPEFl2dheKq
         Gjg1ghJPR2Sikf/qtLAChiP5Q7oMQZyWbZ3RDNA7VrPiQVoa1L4bDaUrOmxkF6lsP0lP
         ctae/xb56xPUJmP+7/OVukrm8++rspouq2kbl3w1KgcupbajmZpBorRlg7JDHi0I0Z89
         X4K8INwMToABQbr2OAxxYdJcI8jC54Lxn07kzBEy0GrIxHZxrmMufAlep1DqwCZh1x6f
         +/XD5yj8y02nRJZF8v+DtruWiR1IMhYNjxSt8v5yleul7ZXnh1HFiVcMdN3x5+gP6OGx
         s2zA==
X-Gm-Message-State: AOAM532MhXfy9mjyD2dYrBkiy+PbygQ1buXQKLLcTUuAVTyD9KK/qHGy
	bna3JV0ARghe/q7CKJqHnjd1+VfqyBs=
X-Google-Smtp-Source: 
 ABdhPJwjQmImScXtUV+KAPOeeNmVjd6rJleqKrP0pbJ72bYk6N/8noFT8pFBF1J75A4tnaS0vgBGVA==
X-Received: by 2002:adf:a48e:: with SMTP id
 g14mr38739875wrb.327.1635325665358;
        Wed, 27 Oct 2021 02:07:45 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id 3sm2962790wms.5.2021.10.27.02.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 02:07:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/30] libinput: upgrade 1.19.1 -> 1.19.2
Date: Wed, 27 Oct 2021 11:07:17 +0200
Message-Id: <20211027090736.2546759-11-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027090736.2546759-1-alex@linutronix.de>
References: <20211027090736.2546759-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 09:07:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157487

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../wayland/{libinput_1.19.1.bb => libinput_1.19.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.19.1.bb => libinput_1.19.2.bb} (95%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.19.1.bb b/meta/recipes-graphics/wayland/libinput_1.19.2.bb
similarity index 95%
rename from meta/recipes-graphics/wayland/libinput_1.19.1.bb
rename to meta/recipes-graphics/wayland/libinput_1.19.2.bb
index adf63933f5..590dee42e5 100644
--- a/meta/recipes-graphics/wayland/libinput_1.19.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.19.2.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://run-ptest \
            file://determinism.patch \
            "
-SRC_URI[sha256sum] = "0bdcf5b1783b737854b7af1ca22df67bc36a6fe7c9cfa71f01e9149f9220446d"
+SRC_URI[sha256sum] = "0fc39f0af3ee1a77c60c34bc45391a4d0879169f7c0f7bbbeb5eef590b98b883"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.20.1


