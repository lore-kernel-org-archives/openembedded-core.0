Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75234C44512
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 12:47:14 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4668.1784465227422156684
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 05:47:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fKM3FvU+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4955adb04e8so2195565e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 05:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1784465226; x=1785070026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v7dZ6U0fCrcKpSzqRtIdPdiyaSXnJNBzlFYvc6v+Q4E=;
        b=fKM3FvU+NVe9pqOtGLevtuS1EGoGw9hvsnm+4EVXSRXQhh2Tn49qXpCZLxFshLkzgS
         n7WCgJRO3PKazJLe9fHzvWbkLK6/DGUGA14dsELmcf45poM8pUC/E8nYqNDfqC+hRZYn
         Eixp/tKP/7bjTPvYve3taYMM7Zbny1bYYzl9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784465226; x=1785070026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v7dZ6U0fCrcKpSzqRtIdPdiyaSXnJNBzlFYvc6v+Q4E=;
        b=B+W12XrQg715ax2w9LUJfThLSViH354NrF9tgmLfiPtmEb/5zV5DgxlO14C9UvK3DW
         l6N8klcoY/CYCbAGGH8ZwDA1uQTKdG98bbv4HaqRHV9Hs1mvCw8gLg7VFDIREaZ5Cyki
         Gbi4KRGGEjATfqo9IE9ONnpgUNf9SDFPxs0EsNgZMv4oLinYkSqUoZfjpKYS2F9UNQOw
         puhzUaP1fc0E6KYusbRJQmdhiZWkcJjEqgSQGO92pCnzGybzUISfX7OaucV7z8isDoNH
         I1qiMi3qiswq71XKqFhe/39+QCqiVZi+6t8gWo42j8JY7w5xnjfsWRi1aLcJbJwv1hu1
         ZKvg==
X-Gm-Message-State: AOJu0Yxw7eT6UUlH2vIQkoN7gV3MlY58UFmRhvSMyuSkrmdC3pyNkI6B
	BjZR85uOwD3lw26rUEuW4+Fq2V+9V22auzYece1TNg4ny4zJzolx7tgmBbLW89iMGkpaFkoQ46/
	AtFzdk5M=
X-Gm-Gg: AfdE7ckbWEAhOqklGnisPCSU7GPDLUAgWbxq8eKvdTL1aEude89P+xw+wQG4QfL1Zxw
	Q/dp95OSmwOMtAatJbeJf2KzY5SlglGlbwwPNivwG2GHR4VtXKdzVyaumelD+DwuprRAx8+WI26
	dLd6yhqGj6dNctDHn91I08C3nN7hPqJLjgJsJR7oU1qQI9G5ND3DlfkbwuRSjyy1W1gHIof2a/L
	GegHp9sWFjP38KfIVXSSOkAH0NU/MFEbdIgeohBzIHfoujIY+xpaSlhVEojIZez2TlrC5PVTTcr
	mngsr8RE25l/Eh2gIXFycyIJ76qVr8lG2nlsRLkTU8Lp+Tt2wbxO9hGuY74dnmgWMQm7/aK0BHl
	jVbB42XghMdSOWogw+CHSIEyfCiLog0y+KZBEaCtNzSMF8Qo5sLhksMgdT7JX/vGh096tr9xgO9
	q8RdvxgxVkSKnl2icV08VyKlD4O5CynA==
X-Received: by 2002:a05:600c:4585:b0:493:b87c:c87d with SMTP id 5b1f17b1804b1-4954a3f3644mr104191315e9.11.1784465225625;
        Sun, 19 Jul 2026 05:47:05 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f295:f98:ef6a:b332])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3f07esm191841385e9.6.2026.07.19.05.47.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 05:47:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] selftest/layerappend: Improve LICENSE handling
Date: Sun, 19 Jul 2026 13:47:04 +0100
Message-ID: <20260719124704.137852-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 12:47:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241284

Rather than using "CLOSED" for the test, which isn't really a license, switch
to use MIT. This improves our SPDX compatibility.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/layerappend.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/layerappend.py b/meta/lib/oeqa/selftest/cases/layerappend.py
index 64b17117cc2..e8634d9fc84 100644
--- a/meta/lib/oeqa/selftest/cases/layerappend.py
+++ b/meta/lib/oeqa/selftest/cases/layerappend.py
@@ -23,7 +23,8 @@ BBFILE_PATTERN_meta-layerINT := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-layerINT = "6"
 """
     recipe = """
-LICENSE="CLOSED"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 INHIBIT_DEFAULT_DEPS = "1"
 
 python do_build() {

