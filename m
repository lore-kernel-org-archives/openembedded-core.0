Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3971CD3423
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:31:02 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9401.1777739462331042002
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:31:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FO+Ni+Ir;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d73422431so2375289f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739460; x=1778344260; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MampgW9pVWCSsq9S+COdKX9/eLhW8HeW1O38d0YsJl0=;
        b=FO+Ni+Ir4iSFyVfJ3aj4agdgKSsiDK1MF+zDAkm9D2m2hwSE34GdLD5JJ6Tis81xmg
         YACxWmb93gdsbufgBN9NGbc03ZEqTD6wpA4tTNy0ENQ3WRM3Z3j9wck8DrzMOCuFp16L
         cxXqV+g+HgKpP7SmyRQ9K/uT9ApPxyE/TsDdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739460; x=1778344260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MampgW9pVWCSsq9S+COdKX9/eLhW8HeW1O38d0YsJl0=;
        b=Suifw1otURA638jn5uqgoR9vwEeXBz9sNMUMvCh2S/2y1XThRdjOubJOAMRhxyRzac
         rV8+Q7HpwGBFWd7z8sbLjO4Qm513F1Si9UEasG2VjMQy4KHW9ODo0uk3jJY9NVb7kpFb
         Bfk/CTuds6NOSjq+8rI29rH51Zx45G2WohYDvBU9pa9y+GOmQ/3bUQ73cvR+ISgjqyVX
         Ga4bTTPmWUcvUZ6i/6D+7v8uMYKdCHvdP03QurlUSxHD84K3H/rnPIwPwYwkq9BR9K4R
         7krk47DXSNNujtTeFsdiCnqUOG/hA+gbZ/WPyFriGQdqFDljbOzDhGIrOuTdmTH2RbRq
         6+EA==
X-Gm-Message-State: AOJu0Yy+A+ncaQ1GXH5qqil9S8lJ1SM+4ts0QtR55JTgH6KO2zMQoHyq
	2AW05ezMp32+HJOTLjWR4VwDfwRKj/WEepRs6rQUs6LSATlagr9R3GgVf8lc7nc6woclAhTaQ7K
	kT0IOf1R/Us5v318fVfyOYCtGkzs/XrRw0vYwSsL2iB+SuiBoYitfsba175bN8Xb+0R98Aa851H
	IpUoIho1k8ynDvGQY=
X-Gm-Gg: AeBDiesAW6XKEA7XHpWqIlj42C5JaUVsrTyEQVcQVtTPDmZPIIyHBsih4ytTI6Rt+fx
	3w/fXU4f/q7N8E5w3ZRzxVOWY42kgVskX5YF+gehntdYHSpFGtr7MKfa5EL7ycIgWxC1f8MBrtz
	BGmvloSx86yti63h1b65o6wcANk18elc22UIoi46+LQECOzgwP8I8rxH0z/amIhKIkw+UzH1aTx
	nDfpvLQct7/Phyn4hqS/6fCs6C9g+kcCqBTmKyHAx4Y8j7i9TLCQv8IAI5Lr2OqRDedBv8gCHYW
	Nsj6jXy2a2SlDp/GiXT5/Ms58nmIho5zGPZulBUzcoPJdPoh3g+vxBE5pd+xdWI1qQSF3Q3KLjj
	FaqXugXCFLF3YHY4gucaAfHRX8A2r05kohUL0jL0fmIOniejvGqFJMcu3die05k9tFuqxjEpyys
	1efhOzkm6cz0/FZpSuM0pVB7cU2oxQfkK2mlJOQRTvDFy07cF2sXu7CXcRX3Z9th0=
X-Received: by 2002:a5d:4d0d:0:b0:44d:261:54c5 with SMTP id ffacd0b85a97d-44d026154e5mr547187f8f.30.1777739460318;
        Sat, 02 May 2026 09:31:00 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.30.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:30:58 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 43/62] python3-pip: upgrade 26.0.1 -> 26.1
Date: Sat,  2 May 2026 17:29:03 +0100
Message-ID: <20260502162929.1377831-43-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:31:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236352

License-Update: Drop mention of CONTRIBUTORS.txt

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-pip/no_shebang_mangling.patch              | 2 +-
 .../python/{python3-pip_26.0.1.bb => python3-pip_26.1.bb}     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_26.0.1.bb => python3-pip_26.1.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
index b057852b7e3..5823d6307cb 100644
--- a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
+++ b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
@@ -1,4 +1,4 @@
-From 60093e823780d9a3483844cc3faaed18dc1c351b Mon Sep 17 00:00:00 2001
+From adccf194155f40fb1d387c2cac432341a1dc8a0e Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 23 Feb 2022 12:27:06 +0000
 Subject: [PATCH] python3-pip: Don't change shebang
diff --git a/meta/recipes-devtools/python/python3-pip_26.0.1.bb b/meta/recipes-devtools/python/python3-pip_26.1.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-pip_26.0.1.bb
rename to meta/recipes-devtools/python/python3-pip_26.1.bb
index 28af8f7ec78..a6275be1407 100644
--- a/meta/recipes-devtools/python/python3-pip_26.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_26.1.bb
@@ -19,14 +19,14 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=63ec52baf95163b597008bb46db68030 \
                     file://src/pip/_vendor/rich/LICENSE;md5=b5f0b94fbc94f5ad9ae4efcf8a778303 \
                     file://src/pip/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
                     file://src/pip/_vendor/truststore/LICENSE;md5=74420fc3965c4558a4a1529e63c2867f \
-                    file://src/pip/_vendor/urllib3/LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c \
+                    file://src/pip/_vendor/urllib3/LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda \
                     "
 
 inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "c4037d8a277c89b320abe636d59f91e6d0922d08a05b60e85e53b296613346d8"
+SRC_URI[sha256sum] = "81e13ebcca3ffa8cc85e4deff5c27e1ee26dea0aa7fc2f294a073ac208806ff3"
 
 do_install:append(){
 	# pip vendors distlib which ships Windows launcher templates (*.exe).

