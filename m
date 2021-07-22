Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.7169.1626958025838469718
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 05:47:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=K4Ru0B0R;
 spf=pass (domain: linaro.org, ip: 209.85.128.54, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f54.google.com with SMTP id f10-20020a05600c4e8ab029023e8d74d693so2894827wmq.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 05:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TPfWR9esXk04Nj9J6stE3E2JcSYA/Dhq/7vD1gEcbTQ=;
        b=K4Ru0B0R41vvuyIhm/hwENYTTrIx3YYUcDACqyyD1QiYiKG7ydR/aMWZR8tvFQY62i
         rhaex06qUXCnZ/Q7nml7tZPqkTmi21VqDwj7RGM0vsiCWXb1Zb7t+X/0Cgeq9/a6D/nX
         nuUftyJTykFv70p1k5HRZkm3QBZj9XopmWS3u7z30rbG8WGVm6BkfrjB0Td/mcVDxzBI
         pE8JbU/aYw0SFCCrIYNb0KY2JktyvCwW0NZ+NmChns2vB8Xwif3mwZKL26is84rPEtxm
         is8gGJ1v1gShVdwz2c9A7Ig0xhwpPWO1EbGG3UfE8HSN2HxRLZkehbhdsjRAaGhYDJl3
         vz7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TPfWR9esXk04Nj9J6stE3E2JcSYA/Dhq/7vD1gEcbTQ=;
        b=Mln7J9GJnGN4+yx7b6Q4osvVM6XszVpqtLWsO1YiaVeFCJ/+p8QtuRRyyCpyqZpJZy
         CqU52EjnwqCUmM3lbQ4IY2RZXEQi0ItG/S0PWjy/Vvfbm8geTIE8LL4y3F+LHKBLddAZ
         NuQOMWhDp7B3K0/cC4WwGfG620Lp6/rKrU7DeNz6kKD9Xc6qB7mUrXzc2gIsIeuY2VOY
         Q0akGBRwo3O/jfKFmyh8knwp5lv1Qp4m3B8PP8Rx6sXlFpRJAU5BBpmOs9iRFYjDtGNd
         9Q4JC58cVnWZlmHyB+TzuQrN6/tWtVkWLhJYApeYEChLlFD9Ofq8qS8CbeCOA67FpAkL
         jxdw==
X-Gm-Message-State: AOAM533beas9cE7UBJwjQgT5lC6Hg7Omj8pmis2/qvIX3VR55ymPUqS+
	5msNqjDEghAioapPfNh+hnlSd8WWlpN/xw==
X-Google-Smtp-Source: ABdhPJwwUI+ThLsC2Vga7oq9bZWyICGaGvBa20N2H9BrFmpQzKsEuNQ4ba4oaaEzDkHj/17r5Jkxgw==
X-Received: by 2002:a7b:c013:: with SMTP id c19mr8820361wmb.158.1626958024072;
        Thu, 22 Jul 2021 05:47:04 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from qcom-hackbox.linaro.org.net (163-172-5-244.rev.poneytelecom.eu. [163.172.5.244])
        by smtp.gmail.com with ESMTPSA id p18sm2468610wmg.46.2021.07.22.05.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 05:47:03 -0700 (PDT)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 1/4] yocto-check-layer: improve missed dependencies
Date: Thu, 22 Jul 2021 14:46:41 +0200
Message-Id: <20210722124644.19962-2-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210722124644.19962-1-nicolas.dechesne@linaro.org>
References: <20210722124644.19962-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first 2 calls to add_layer_dependencies() are here to add all
dependencies for the 'layer under test' and the additional layers
provided by the users.

In both cases, we use misssing_dependencies boolean to indicate if any
dependency is missing. But we then never really use
missing_dependencies. Instead the script is calling
add_layer_dependencies() again (for both the layer under test, and the
additional layers) to detect if there are any missing dependency. As a
result, we are trying to add again all dependencies, and we can see
that from the traces:

INFO: Detected layers:
INFO: meta-aws: LayerType.SOFTWARE, /work/oe/sources/meta-aws
INFO: checklayer: Doesn't have conf/layer.conf file, so ignoring
INFO:
INFO: Setting up for meta-aws(LayerType.SOFTWARE), /work/oe/sources/meta-aws
INFO: Adding layer meta-python
INFO: Adding layer meta-oe
INFO: Adding layer meta-networking
-->
INFO: Adding layer meta-python
INFO: meta-python is already in /work/oe/poky/master/build-checklayer/conf/bblayers.conf
INFO: Adding layer meta-oe
INFO: meta-oe is already in /work/oe/poky/master/build-checklayer/conf/bblayers.conf
INFO: Adding layer meta-networking
INFO: meta-networking is already in /work/oe/poky/master/build-checklayer/conf/bblayers.conf
<--
INFO: Getting initial bitbake variables ...

The code appears more complex than it should, and we can simply
replace the complex if statement by using missing_dependencies, and
avoid duplicating the call to add_layer_dependencies().

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 scripts/yocto-check-layer | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index 44e77b73d0..a179240fd0 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -160,9 +160,7 @@ def main():
                 if not add_layer_dependencies(bblayersconf, additional_layer, dep_layers, logger):
                     missing_dependencies = True
                     break
-        if not add_layer_dependencies(bblayersconf, layer, dep_layers, logger) or \
-           any(map(lambda additional_layer: not add_layer_dependencies(bblayersconf, additional_layer, dep_layers, logger),
-                   additional_layers)):
+        if missing_dependencies:
             logger.info('Skipping %s due to missing dependencies.' % layer['name'])
             results[layer['name']] = None
             results_status[layer['name']] = 'SKIPPED (Missing dependencies)'
-- 
2.29.2

