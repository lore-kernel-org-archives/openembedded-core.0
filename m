Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9987FC36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 16:30:04 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.1461.1743784194594582802
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 09:29:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ov6dZuwZ;
 spf=pass (domain: linaro.org, ip: 209.85.167.50, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-549b116321aso2585778e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 09:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743784192; x=1744388992; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xULRQVdTY/LxRb9S1oZ219XVrnqgSCEV0rTfQfvvQAA=;
        b=ov6dZuwZSuVRqEi9/OI5Vzw9f5FkBu0Na36Ri1rH3fG7/RxZ+ssJPniPslsilMoknH
         82ZmLSFJe7EOGkwm3U7s9ChOz7HinkscgAYWveYjOq+lVntd6Yzy6DxJn58zWPKbU+xU
         cjFniFfwEi1zV4ST7AhCky1t9MQw2is79loOuenvsq3nutmPDy8beDUxDKQ4F7du0fgO
         FEeyfG1ZSZSnQj6ZFRr1wzb2UK7Fdjbax5RIP8Y63rGBjIYqDj1wj3kDSKNo+lc1uIIy
         uPdqM5osmaxoG2RlB0q0XMmLzJ4qyj6D5zNBbi370aoQVfo+MAbS3RRpNNZXi0NfAQpG
         esjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743784192; x=1744388992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xULRQVdTY/LxRb9S1oZ219XVrnqgSCEV0rTfQfvvQAA=;
        b=RMFFQSQb43ACW7IUEClTvv5cexGlhHnqDAbKg62n70JnMBu2UCfNMIq8ivEViO/8Rx
         7oRd5TWXpNDjJbHkIrd1PmgdFRn+r2DiGsXY0elkJn9a5B3T/sknkYhWdmZyl+oQbpzj
         aEvFYQI0GbVKi4zs579hLXQVWw4pbPyc+flwHLjnXqsaFO6U+osq9JP87WB4r3faBU+b
         MtAVD1DS9QENNIpC6h/xIxdfQRE02o4xqJoFVfOoJHlC7LW0MeVgm8vtroYNbM1owRBe
         9e1ZIqegwcvhDoblPUQFmauAKH4M8R1A5g1gRLuXCrP6iz9ZuPLxiBzFAdsLuM4UaQ9c
         NRfg==
X-Gm-Message-State: AOJu0Yx2w24LcDj4+CzZGvC7WM4Rhg8o6BxYAiXR85E3G2oePH6NMZwz
	1zrXz+rCjL2pk9rRsMkjo49pTSzO7hr/r9a8Hriu8dHMTd+kEGqM/3HePYAp81hsAh0DGM8eh/h
	sjS8=
X-Gm-Gg: ASbGncsW/rdCTp9WMATfTWHmvGKVilCFvyniuQnJQ0HmVWKH9FBsRp28/FTuMocG8Ct
	Gs+X0z5pKQwWz1rvHn+GKYfdO1JHOZxfm7Xe80Ycj6nl8MKOviBzP2G0sdOo8+2CzL7cXr2z0vn
	/WJOw1HjzizUPnNCqGZPDMEqkhVPLe8WqR6uySilqiK8FT34FYuPcv5RG7v+SopdeeyCxCC3UqY
	03A91qmWphvCppMsZL9IJOFD+xf6aGz4sr6nvgQ6oLVyARoT7jh4gltHcNOvdFRXuABODoxu63u
	2v4CIHDCFUUfKBkx3rE/HgPlzoxiZCiARkttQuy6fucs0wHY0nAEmEf+eqvwroiwemaUuZFnixa
	kr9AXHQqUhUHCqRbh8oAEiA==
X-Google-Smtp-Source: AGHT+IE6pOp+r+RFyjPX8C24MbaHHX2HvGRpb/qgSfohygVo5s9chGltlSXdvdfYi8OkD4LL8KlySA==
X-Received: by 2002:a05:6512:3d94:b0:549:8f06:8225 with SMTP id 2adb3069b0e04-54c227ff846mr1054157e87.53.1743784192441;
        Fri, 04 Apr 2025 09:29:52 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e671f54sm469786e87.228.2025.04.04.09.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 09:29:52 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 02/11] uki.bbclass: drop serial console from kernel command line
Date: Fri,  4 Apr 2025 19:29:23 +0300
Message-ID: <20250404162932.447699-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250404162932.447699-1-mikko.rapeli@linaro.org>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 16:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214353

The kernel will continue using console from firmware which is
much better on HW when we may not know at build time which
console HW and drivers are available, e.g. like on
genericarm64 machine.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/uki.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbclass
index d9a7fb0e6f..fedff222c6 100644
--- a/meta/classes-recipe/uki.bbclass
+++ b/meta/classes-recipe/uki.bbclass
@@ -81,7 +81,7 @@ UKIFY_CMD ?= "ukify build"
 UKI_CONFIG_FILE ?= "${UNPACKDIR}/uki.conf"
 UKI_FILENAME ?= "uki.efi"
 UKI_KERNEL_FILENAME ?= "${KERNEL_IMAGETYPE}"
-UKI_CMDLINE ?= "rootwait root=LABEL=root console=${KERNEL_CONSOLE}"
+UKI_CMDLINE ?= "rootwait root=LABEL=root"
 # secure boot keys and cert, needs sbsign-tools-native (meta-secure-core)
 #UKI_SB_KEY ?= ""
 #UKI_SB_CERT ?= ""
-- 
2.43.0


