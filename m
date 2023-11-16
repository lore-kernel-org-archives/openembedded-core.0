Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D54C54FB9
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 07:37:16 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.2317.1700120226494539067
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 23:37:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XQ1W+vaA;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9f27af23441so64963866b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 23:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700120225; x=1700725025; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUzxIrnCQ5V0Oz6E1BkNfhrZqttDgUZwr+LnclbLTxI=;
        b=XQ1W+vaAEODf9qxeg6+dtTEGyx1r7C+vqNwr1DJGtymqWJOs47TI2Dz7Prds5pO/D6
         F6H/O0gsIzwXOrh+Up6tH0gdLSnxke7OShOORkGw2tsXYaShl4xk7qvofLqDFhW5XVeY
         7jc+9U4+hC64jB8+U6FhpAo+pB9FENWxZ+q4mJUI3a/M5aHwNkiRXmZiFlDBBElrlWOE
         mYGHzyN6WiwTlMweGxMSiZc33Iq/LmKfRp6eQiKwv6gE5D/+bWuSzaul/RvIAz0Imdxu
         8wCyoCnzQkdU0xgde5npg4GWQnNh3nIJGO5s1aM2Ym3AnKOk4jBLUQeS6cdsREtFW4td
         FSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700120225; x=1700725025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUzxIrnCQ5V0Oz6E1BkNfhrZqttDgUZwr+LnclbLTxI=;
        b=Vr1y/F4fi4E/ADyptaM6ZKEbh5wiz/e3I/Bxl6U4EZgmeeGmylXZTPUCLAP6iyYDuP
         wn3Mkxbc1FLUgpnQXRZWQSGpmG5TXZFflyZQ9ERbPtK8BLh8HqzLqltd4yhk/8e0gkes
         qAF7sX9B/tX+ick2OR7yPn1gZxUxzNvkhtyoFt/LFl0pj2NhkEWFPtBjued03XcrN3g+
         yqZx3W2+SEX7WXNH2/zon0pr7qYX1FjOSFoABybPLKF0nK4kpruIUWNQR6aC4VKcPa/2
         48W2J239ZFdVWkCZrRGuoENr43ny/29hRqoe3k8G/RWR9mepzx04R2n+YGVTl2hzDK+Y
         NRHw==
X-Gm-Message-State: AOJu0YxX2HF6hyXmyBQoBiXhd80b5GQyhvw8aI333L8pNcrcW9fzSYaj
	+Qvre7e9v2ournRxPy4Cgof0KwzNCPc=
X-Google-Smtp-Source: AGHT+IFi5lfosp8WAiwiBBdV/3xn42t8VYWgVfvTaIK9iGiKVlGGsfh5NTxM42jyncuJnAgEsrq4Sw==
X-Received: by 2002:a17:906:441:b0:9e3:5495:a33 with SMTP id e1-20020a170906044100b009e354950a33mr13088116eja.63.1700120225011;
        Wed, 15 Nov 2023 23:37:05 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a14-20020a170906190e00b009c764341f74sm7942673eje.71.2023.11.15.23.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 23:37:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 09/11] vulkan-samples: drop PE, PR from /usr/src/debug paths
Date: Thu, 16 Nov 2023 08:36:48 +0100
Message-ID: <20231116073650.2710535-9-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231116073650.2710535-1-martin.jansa@gmail.com>
References: <20231116073650.2710535-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 07:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190761

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../0001-vulkan-samples-Fix-reproducibility-issue.patch         | 2 +-
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-vulkan-samples-Fix-reproducibility-issue.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-vulkan-samples-Fix-reproducibility-issue.patch
index 7609011421..fbe5cf0c8e 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples/0001-vulkan-samples-Fix-reproducibility-issue.patch
+++ b/meta/recipes-graphics/vulkan/vulkan-samples/0001-vulkan-samples-Fix-reproducibility-issue.patch
@@ -9,7 +9,7 @@ in the debug source remapping from CFLAGS
 
 We export the right path to use in the recipe with:
 
-EXTRA_OECMAKE = "-DCMAKE_DEBUG_SRCDIR=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/"
+EXTRA_OECMAKE = "-DCMAKE_DEBUG_SRCDIR=/usr/src/debug/${PN}/${PV}/"
 
 and we then patch this into the code instead of the broken use
 of CMAKE_SOURCE_DIR since __FILENAME__ will match our path prefix
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 66f1ef5e9d..973ceeb573 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -29,7 +29,7 @@ FILES:${PN} += "${datadir}"
 # used for logging with LOGE in the code. We need to make this match the value we use
 # in the debug source remapping from CFLAGS
 #
-EXTRA_OECMAKE += "-DCMAKE_DEBUG_SRCDIR=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/"
+EXTRA_OECMAKE += "-DCMAKE_DEBUG_SRCDIR=/usr/src/debug/${PN}/${PV}/"
 # Binaries built with PCH enabled don't appear reproducible, differing results were seen
 # from some builds depending on the point the PCH was compiled. Disable it to be
 # deterministic
-- 
2.42.1


