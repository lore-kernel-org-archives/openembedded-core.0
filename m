Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73495C433F5
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 08:21:47 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.4273.1645863706665131979
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Feb 2022 00:21:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Gj7GoBbd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id j22so7640614wrb.13
        for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Feb 2022 00:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VXXc63uHOJGifba8CMTHHJX3cnWq2Bi0vEuQrHCJM6M=;
        b=Gj7GoBbd6EAR0UluExvrB5gqz6hHj8CkyGHeyfmpbSzm0lD++l8T0DZ+lZSRtCmL7n
         tC9ZJkqtQCXzDWAaEs+tdH8zGJsz9F00fEE8uOdXikjC/V7fhCAmqeQHJ1XTd04JAlZ+
         0hH6WMDl5rhcL6ojv5WgvsDuXAIuiFrbzHRz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VXXc63uHOJGifba8CMTHHJX3cnWq2Bi0vEuQrHCJM6M=;
        b=a9jHYxXhJu2brTS8S3pLFAAZZnE3phaGZPmgGgVgiM+zhGqTYq8fzQf67INJPQRUDQ
         jk+hXk2EmFQAiLOy4QFjzUHPqNL5Io+ytncWqlk2ZKs6f2SbdRH1Lh8O8frUu87MuVzh
         FMQWBBL3+eRfoelXzn1SMbcWvQxxHGLf3GyeRSP9M2+thpLtm6qBSXEwPWAOqrwvXm8Q
         NHTyv6pZVa2+/wIGmQhuOIdB04bWG0Uk5ZPrKabCEnS2lTdCVh+d9SLbp6WIhAu80e1v
         8fPzIkcpewzfNrJa4FQ4Q+A1u181wbih+k+i0ULr2ri5EyNHQ2xe9OZABqDQwU7ShZkO
         454Q==
X-Gm-Message-State: AOAM532Cne/V0aaYJG1xh7GgzXf82wn97v2SaDKIyhBR/Dt18Gj8/cH7
	lulqiz4x7O+ppQKP//0onTWJbHugZ8H26qsU
X-Google-Smtp-Source: 
 ABdhPJwBA8x3LLmZy5J6gBThpLSAQkDOGhBaIAauIno+PZW5sFUvenTUqwAWZP1deK+RiSegirM5BA==
X-Received: by 2002:a5d:5042:0:b0:1ef:88d0:f631 with SMTP id
 h2-20020a5d5042000000b001ef88d0f631mr1032269wrt.232.1645863704745;
        Sat, 26 Feb 2022 00:21:44 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:3901:1ac2:e293:e734])
        by smtp.gmail.com with ESMTPSA id
 j7-20020adfd207000000b001edc209e70asm4222297wrh.71.2022.02.26.00.21.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 00:21:44 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pip_install_wheel: Use BPN instead of PN to construct
 PYPI_PACKAGE default
Date: Sat, 26 Feb 2022 08:21:42 +0000
Message-Id: <20220226082142.119063-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Feb 2022 08:21:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162423

This fixes the name for native and nativesdk recipes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/pip_install_wheel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/pip_install_wheel.bbclass b/meta/classes/pip_install_wheel.bbclass
index 9f9feda6ee0..5b7e5cd7064 100644
--- a/meta/classes/pip_install_wheel.bbclass
+++ b/meta/classes/pip_install_wheel.bbclass
@@ -2,7 +2,7 @@ DEPENDS:append = " python3-pip-native"
 
 def guess_pip_install_package_name(d):
     '''https://www.python.org/dev/peps/pep-0491/#escaping-and-unicode'''
-    return (d.getVar('PYPI_PACKAGE') or d.getVar('PN')).replace('-', '_')
+    return (d.getVar('PYPI_PACKAGE') or d.getVar('BPN')).replace('-', '_')
 
 PIP_INSTALL_PACKAGE ?= "${@guess_pip_install_package_name(d)}"
 PIP_INSTALL_DIST_PATH ?= "${B}/dist"
-- 
2.32.0


