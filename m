Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA9EC7619A
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 22:44:14 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.41345.1680216248626010243
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 15:44:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I8h7l+6H;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id t17-20020a05600c451100b003edc906aeeaso3819334wmo.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 15:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680216247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JtZViuugc11tfEJGySDAJXYP6P1B+vZm1+L+4EGb5k8=;
        b=I8h7l+6HSPy/pUFEtKpr7/sIrfZZjac4WG/ivQlL6auvOnj9o9KUECD9h7p9zlo462
         2kszQhgvCHDihjBO1l95ZxhHH2R5IJ7ZNlh+kG1XItxbOoNIvvlh/WFx23IWNs2be6q8
         SuWjqinrf8d6mDVkl1B+Xx1MlvfNJyGvK6lgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680216247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JtZViuugc11tfEJGySDAJXYP6P1B+vZm1+L+4EGb5k8=;
        b=kAbyYrdz5cLQCoNd4zDGu5eMKZ+mD9Zb8A/+RUhbltNSsDFXuCE+ut8KjbAbjR8nif
         3FzVXyoveedr8cKRll1TzYD2JTFQXXdnT/aAp5wrWLTXT+K2ew2KMWvmtaU4X3kBXsVd
         tN90RySNqodv/7LmHT/OQ3myO2h3rKL7Wn7xPdPYJB/8UJcrd43K63mHPkoyn+7pALTz
         9iwgh9nY6dVIVU+N4v38PpnwjwgdD2SRQqmQioTq3Lx/F25GULE2ReCRLWApwmvWumNW
         Iy9+xUTp3Clx0pXd0qQbSVAHw4PDT9ixRASpVkeHAGoRyO+ljS/EBcydQrmtfsMOml+G
         RqoQ==
X-Gm-Message-State: AAQBX9cE7Z5V2Z8w5hpuHbNcICv8L0dbvOKoC9SN8sCHqHSrJostcNoY
	Pu1Eg7OGQe+719ze7rbUFtjzQFd0ngygnktaF4w=
X-Google-Smtp-Source: AKy350ZZ5aaqzNP9HT4aQcQdwKJGgsBTf4BqKjSzpoA0lsAtFv4KHOLnALvFPwZGcliplWQNqlvMKw==
X-Received: by 2002:a05:600c:6008:b0:3ed:ad05:5841 with SMTP id az8-20020a05600c600800b003edad055841mr5340090wmb.17.1680216246467;
        Thu, 30 Mar 2023 15:44:06 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:18b7:bfe:d74b:7341])
        by smtp.gmail.com with ESMTPSA id z13-20020a1c4c0d000000b003e20cf0408esm552206wmf.40.2023.03.30.15.44.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 15:44:06 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/loader: Ensure module names don't contain uppercase characters
Date: Thu, 30 Mar 2023 23:44:04 +0100
Message-Id: <20230330224404.51167-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 22:44:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179375

Python modules aren't supposed to have uppercase characters in their names
according to python conventions. We have regexs in the code which work
on that assumption too. Rather than showing errors under some filtering
situations, make it clear and error if a problematic name is seen.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/loader.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index f25b5970e93..d12d5a055cc 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -316,6 +316,9 @@ class OETestLoader(unittest.TestLoader):
                                   module_name_small in self.modules) \
                                else False
 
+        if any(c.isupper() for c in module.__name__):
+            raise SystemExit("Module '%s' contains uppercase characters and this isn't supported. Please fix the module name." % module.__name__)
+
         return (load_module, load_underscore)
 
 
-- 
2.39.2


