Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEDB3C44506
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 12:36:40 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4206.1783773394364203160
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 05:36:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fL5i65Uf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f365afc5aso5185f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 05:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783773393; x=1784378193; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=alFXOUwQ59KZD1nIfHiNVQpnVspST64/2vqxkSFZdik=;
        b=fL5i65Uf3nDm+zuFkBWGI/iWydjb8nio/1tehm2hZJZzhhljNZz59h0JbJHJjZtpEA
         Y1C4VhbZFV0rVye4U4qMQrNXLc/O2axvD2NKODbc2ACRuEJJA1gAeuUc5kefNEbMjJAq
         OodQglmWPNTim6Xrrtiq+588Em1b4sl1TTPUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783773393; x=1784378193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=alFXOUwQ59KZD1nIfHiNVQpnVspST64/2vqxkSFZdik=;
        b=YsBMBCltuM+7zXJx0v3XuASmEb6ddWqUp/g6ii1LVVwwEmMG/uFG+j+8lr5+POrCRo
         6vMy+U9ODcxkB+sbsUlFmcI1Z62bEkW5mY5sATFFGjjyYPwT5XCokDv3xyCPIbAeRbsi
         XHRl446ve/IfROg4m0u2poAbAN3d1NCiaWBsb+cfpGarGPch+0EzxP/htyn8jedv49/k
         OYWbkO5C9jDU2R6tueB9qPfvIGLw4TIzRdbM2A/GkD+1mGzQ9AIU5LAzKKQNVCXLuePt
         /22bcseZeuhkhCu8YY12zReLU/Hk5Pq0FkpPAC1MHikOSZ0hZTopZ+kwXfmCCGB4XdX/
         zB2A==
X-Gm-Message-State: AOJu0YwOko3cP5/zqHoafctD4bcwJ08TR/rPghUDnZKyjBDY7ZEK1H6i
	27395NYy2pPjf2lg02LMCIBQtQQYwIguCicdKV92zbO1AdyjFV0VK+3fcYKfey1Hk0D/7oQ06Yl
	PGlncka8=
X-Gm-Gg: AfdE7ckvvB2w1whRJvyOar4wwZBQazFE9AIcETjY8IKdkNmk3FtwTPGKnoq1CnPCvaJ
	hGST9GwtZuLXO1JSpfqHLPKchUBHS9jU4gRaspIe96V4QMfAn9LvfyQid3Y7IGZc6Vh8KE7GXhP
	U8WRjOG3tu9rDAYtPSJ2/71Uu+RJddgekgkcgVUmuz1zP+4DLQr38xa5E8oJVyTKvrrsXdANT2T
	vJsmCrgLywSA7oKDTENlmGydVirSDH/T0ChmYzbQuZsL0SjS6x4jDDolgoUVv4tM406Tw2bXWu+
	2TOt05DI7tO79fmp/eWGU48gxQm2BCczdCIY/sRvBeo1sox5n6yt6cA6j9eHQbhcOuyWlMn6RU8
	HKxwKHf9dIdEw5AGuIlXk4hjTY99fI2QmulspAWbJyaA6XmMp0q0jO7fpE1s6UbjBERlpFFWG5B
	lfeqg/MMCJ3qQpR71+Oi6sAEpm9/RT6K6uTLENzKwhoA==
X-Received: by 2002:a5d:59c9:0:b0:47d:ebac:409 with SMTP id ffacd0b85a97d-47f2dce8dd5mr2704647f8f.60.1783773392669;
        Sat, 11 Jul 2026 05:36:32 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2004:2e5c:aef2:b707])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm77172097f8f.17.2026.07.11.05.36.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 05:36:31 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/8] python3-build: upgrade 1.5.0 -> 1.5.1
Date: Sat, 11 Jul 2026 13:36:23 +0100
Message-ID: <20260711123626.1583730-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711123626.1583730-1-richard.purdie@linuxfoundation.org>
References: <20260711123626.1583730-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 12:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240714

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-build_1.5.0.bb => python3-build_1.5.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-build_1.5.0.bb => python3-build_1.5.1.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-build_1.5.0.bb b/meta/recipes-devtools/python/python3-build_1.5.1.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-build_1.5.0.bb
rename to meta/recipes-devtools/python/python3-build_1.5.1.bb
index e263e29383b..dd741cb8623 100644
--- a/meta/recipes-devtools/python/python3-build_1.5.0.bb
+++ b/meta/recipes-devtools/python/python3-build_1.5.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/build"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=310439af287b0fb4780b2ad6907c256c"
 
-SRC_URI[sha256sum] = "302c22c3ba2a0fd5f3911918651341ebb3896176cbdec15bd421f80b1afc7647"
+SRC_URI[sha256sum] = "94e17f1db803ab22f46049376c44c8437c52090f0dfdf1adc43df56542d644fb"
 
 inherit pypi python_flit_core
 

