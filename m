Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web11.10530.1628177864374474122
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 08:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=y5vdWbYQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.45, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f45.google.com with SMTP id y14-20020a4acb8e0000b029028595df5518so836323ooq.6
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 08:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3iVS/RtnDfieNu9Um47P+Jl46j9A2i61pbfjKhZpSaE=;
        b=y5vdWbYQnSbHyfRahBlimV66F/OVIGgasrAYIPgLZ5flOkhUXvm7LVxUs98s2y2zb4
         8u3oBjuVN7mhGtWEfne9TmMxtXQfPapebwskFlRvm37eg0e5Vb1xXjGktCnBXblwdAAo
         z2urpVSNkx6X01Ux6ociuefwegRsSn7BM3quQ4rJAWE7mB3iB+Q2KZe56FKQjAbl0ovi
         3YB6TrMph+WurpDrHfdMSepsDzitLmZchM3vfE3gAdIQWjOgp9hknx4uphZSLQFVAHrK
         xdQHT12DKUkmzVt6GriIJ+SIQY7SIDWWgcUeakUq3OFsTnKIy6u+r8EpFrGmBsopGbj8
         swFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3iVS/RtnDfieNu9Um47P+Jl46j9A2i61pbfjKhZpSaE=;
        b=o4lgCSGKawj4MmndNNHuf3dXE6td0fu8tF6+h3RGOExj/VMCkaP9/8m3GFiWKuoaww
         yuE5sTd1NCzwPu4bOPceiNbIPifxhxqhLAyr5yYTiBPKoUXr2V1PFrmcrvp4au+pY0rH
         jVswpmj5IFLqqya7ttwP27w4bY11Kys50gMcrSXPVMgaY28NtshAhGL+VANu88kpbpmN
         k1RnolfEtq4RtnhiZF8BUgbee8/loKRuFKK6FZ9BPOfZ2mTyOsrJiDylgY3M8DVOODEE
         SbzVw5fYADXk3K/6XisPPU0GSFqZU83nwq8kvkZ4FrByXgcDeTogZZWZE004GgvK2oks
         zhng==
X-Gm-Message-State: AOAM531Cjw2GphzSrC3wGacsOiK4Q/jQ8ry3V2184KFbmUPZ6qHE/8/B
	jUZOJxJIJnr0JGum2ujG+otNhHIC9wo6KTki
X-Google-Smtp-Source: ABdhPJxJoBfAdv2R80ErwmylDnQEeEq5qvplifW67zAqiGCHK/G6WioHRBpxCOuNirac07eEIdvskg==
X-Received: by 2002:a4a:dd04:: with SMTP id m4mr3648987oou.69.1628177863327;
        Thu, 05 Aug 2021 08:37:43 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id bf41sm1103076oib.41.2021.08.05.08.37.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 08:37:42 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 27/33] yocto-check-layer: improve missed dependencies
Date: Thu,  5 Aug 2021 05:34:04 -1000
Message-Id: <84e63d179d935a071730e89a0963bb9ae867c93b.1628176985.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628176985.git.steve@sakoman.com>
References: <cover.1628176985.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nicolas Dechesne <nicolas.dechesne@linaro.org>

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
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fceb84f7bc472731b8f96ee1ebf0f4485943226c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/yocto-check-layer | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index 84fb0011e9..847fabfd9d 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -158,9 +158,7 @@ def main():
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
2.25.1

