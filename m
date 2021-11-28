Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D289C433EF
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 09:46:20 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web08.46140.1638092778962621713
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 01:46:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oTOKdXQG;
 spf=pass (domain: gmail.com, ip: 209.85.208.177,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id k2so28433728lji.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 01:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZovpjYXHjeslsQ7QIGAyXJhpR6ixZJGeXdU9zGnxFNE=;
        b=oTOKdXQGodCiGidRyBUxtu3lMzBwldliZ1gakiN2l+KSH4qrECU2rE2YjhV3ugeWTs
         Wccf9T+JKO9+T6v2AFN5Req05KqWhtcDH2VUi8vSd04Mf2QTAtmm98/9/5IH0jNauIv1
         YJcpAlpXQhjiQ13bkxt2sEkhQL2Z7ZDpeHDjDOez/okrc0nNN4CN8tPB+GJRBRXEwWs8
         R0R6Dxv2d+38evp176TwqsjOpe8c45mqNO2/AA3NuPAP0MARWj/Ix1hHq0uXOU8MPT9m
         tS45yKVA2aKR5I7n7xb7C+DZhhdHreX8y/LkEMTPmocLweZZdm/wDfJLl1/zvmhKKYil
         1w2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZovpjYXHjeslsQ7QIGAyXJhpR6ixZJGeXdU9zGnxFNE=;
        b=VV83sotBXQ3XCQNidKx7dAhTyK2L5d4JBDAEnyj6GHtwEXJin8KdeRrdl+CTuNyxlf
         RcpNNpgw7Ytobo4rUm8oO5e7NF43W4KNP4h5Du3wTlg7kEC3Lug1F0zGoP27Zn+TxKYH
         RvupkbqHiqPgOtyDP6RoCnOEDsZO+U02WMDWIsFr92vUbFN2d78ibjlJkgAtvWfYzymG
         Pn9xDM0oEm1P+lJ1iFOGVFpeB1EUXWNtUJkkWm4OrtnL92U5+f2FiHnFswxrJTMJrKXF
         QJ/+z3KJnvnxjvTWPA0lflYDPIe4rYAGG23xAMHTPgVeAV21gQjD4pf0E31L0T8lhA88
         utSw==
X-Gm-Message-State: AOAM5307EjpfcbR7x3UIwLqG74mdQQBvU46ZdC4t1fsF64pKZ+FwLNht
	XpSKoO3R/uFHD0R4BQZcFxxIFF8hRG15fg==
X-Google-Smtp-Source: 
 ABdhPJzKzbLoHgVDE3vHOWfhNMzngjeq7u2rnPh2vHqhfAmcNo8TnXGUs9G/xul56w/tVzbeGJnx6w==
X-Received: by 2002:a2e:9601:: with SMTP id v1mr43936162ljh.478.1638092777352;
        Sun, 28 Nov 2021 01:46:17 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 k15sm1031749ljg.123.2021.11.28.01.46.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 01:46:17 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 2/9] libtool: Improve native reproducibility
Date: Sun, 28 Nov 2021 10:45:25 +0100
Message-Id: <20211128094532.1145820-3-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211128094532.1145820-1-jacob.kroon@gmail.com>
References: <20211128094532.1145820-1-jacob.kroon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 09:46:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158869

Avoid encoding build-specific paths in the resulting binaries.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/recipes-devtools/libtool/libtool-native_2.4.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/libtool/libtool-native_2.4.6.bb b/meta/recipes-devtools/libtool/libtool-native_2.4.6.bb
index 3b20ce3e69..ea19b86d4a 100644
--- a/meta/recipes-devtools/libtool/libtool-native_2.4.6.bb
+++ b/meta/recipes-devtools/libtool/libtool-native_2.4.6.bb
@@ -7,6 +7,7 @@ SRC_URI += "file://prefix.patch"
 inherit native
 
 EXTRA_OECONF = " --with-libtool-sysroot=${STAGING_DIR_NATIVE}"
+CACHED_CONFIGUREVARS += "lt_cv_sys_dlsearch_path=/non/existent"
 
 do_configure:prepend () {
 	# Remove any existing libtool m4 since old stale versions would break

