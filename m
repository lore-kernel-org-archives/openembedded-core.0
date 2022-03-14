Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A255C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 22:48:53 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web09.3334.1647298132298432731
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hZEsJ9sX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so411097wmp.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bSGkO+BO9Rc1Xlu/al5AXwipKz70HS0mr7v9TJ07w7Y=;
        b=hZEsJ9sXJ8sZJgF07LeYYZoeTf/dNAwFbbQrlzne1Wkom0WUuASRN7aBd2XvwudOhm
         2bYonFxFAHIWhtI1i97dgQ+gsN2CPAUAydUZ7N4s42VIhlTTTxTGDm6sRFNjgz8ySteZ
         Fk3NQLwv2cgb56YjClhBhmaq9O1q6d7DMrUUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bSGkO+BO9Rc1Xlu/al5AXwipKz70HS0mr7v9TJ07w7Y=;
        b=mR2MkG6fDGEwIc7T61wUAKRZVC1DgG/8F7fnSiQnDzh6yqW3WPhdPTPvIXeMSKhr6Z
         9itlaRwiyEt8551RqOUfoBEnaCQHO6hMci7Y6pcEHzVBSTgXgXzVecAu4lhUQbPrEwu0
         i2Js6GpYhb6ye8q3/RDHdbGJ8xqQsoepM96KSzL/7x5B6OD+U2ameJ7GVuGgSsuDS1RB
         uYW0IQQEU179TlO3aZCCp2WG0Qf4pp5uEfHZ9qHw6d2/zsPmEM5r2RU0glBcWhH4I2Ql
         jyyTAZEJ58Sdks4YVrwFf0HxaTJk29yIhExAGb79oCjktqRkRCmUGATDrgta1JydW4VV
         /Jdw==
X-Gm-Message-State: AOAM530TlhNQiNUpejdl56YNvDn0R7ibEJCZlGpGucn/6mMh2kYf9cQa
	ZxavLLraavsPLFJU0NdVD1YApsPs4iKBVIlO
X-Google-Smtp-Source: 
 ABdhPJzVYYYOgii8sYWJB4HHdswreyXIOiGoOhZtBnU/yUo6wTg5sFU272P5igKn4k8b5WqWLU4yJw==
X-Received: by 2002:a1c:4b04:0:b0:389:a498:3820 with SMTP id
 y4-20020a1c4b04000000b00389a4983820mr1006234wma.50.1647298130607;
        Mon, 14 Mar 2022 15:48:50 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm788599wmb.3.2022.03.14.15.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 15:48:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 12/33] python3-pretend: move from meta-python
Date: Mon, 14 Mar 2022 22:48:16 +0000
Message-Id: <20220314224837.834776-12-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
References: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 22:48:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163178

From: Tim Orling <tim.orling@konsulko.com>

Dependency for python3-cryptography

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-pretend_1.0.9.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pretend_1.0.9.bb

diff --git a/meta/recipes-devtools/python/python3-pretend_1.0.9.bb b/meta/recipes-devtools/python/python3-pretend_1.0.9.bb
new file mode 100644
index 00000000000..21d14a03b8d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pretend_1.0.9.bb
@@ -0,0 +1,11 @@
+SUMMARY = "A library for stubbing in Python"
+HOMEPAGE = "https://github.com/alex/pretend"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=411780c0b7fa756753e94affeee5bc99"
+
+SRC_URI[md5sum] = "ad53883ede48aeac7ae584f0de0240e8"
+SRC_URI[sha256sum] = "c90eb810cde8ebb06dafcb8796f9a95228ce796531bc806e794c2f4649aa1b10"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0


