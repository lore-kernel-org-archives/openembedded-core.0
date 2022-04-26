Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C39CC433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 07:30:53 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web12.3383.1650958246808444580
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 00:30:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kerrYdxw;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id bv19so34237966ejb.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 00:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TOXG3+bc/e0E0t6N5G34dI/+oOvR4jPYGH0xz/0FyS4=;
        b=kerrYdxwIYatTP2i4/3FBXdCqhgm2q9l032eTUfr29/RjINdc2mXA1OK+n+Q0UjJnH
         EcZAo03MBsMyMHbxapgsngFRNU4fi0vXVGjeB58QFXTlBePg+jMjlGSs4I8WzRggVaZZ
         m1TkxIWX3W//DbeFcwkLJQnBWNSGwG9tW6ezGD/wZ/TkbaSANtl60px7kI6h63NkiRWg
         BhytPjDHjCMay+y7HbYMi+C5UK5yBlFyGS/GI9K2O5cND3hmPJjUYns7Uq55BQsZsgPv
         /2siaqjHC56Arj2KUsVsQhw94bhb1pwgPys2mu/iUtWxASwZPSI3bSK3fhHnfLI5HFgM
         ULrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TOXG3+bc/e0E0t6N5G34dI/+oOvR4jPYGH0xz/0FyS4=;
        b=svvu3Y214mUJKvcp0kTA6x/rKOxQ83KvCseaK287R5XzPwsf6YwmVr1cQNwXXhpLW+
         wqv5Utq0CHaltfTF/MMG+llEjcXwTrE5mA1n7K4pECCdCAXkD4SuTH+NPltPo8QI6sJI
         Dxd8QGoGfkC4o7NT7DTVzLz1SLAwkJsNXbkm3yVGavqjnueLDfSzK5duj8sQsfR2wtsE
         mA5/N6V1AxB815ou2tXoreWqDyw6y08ID1yD1SGg+TYVba6F2XKbiu0cGW5SI38oXN5t
         UZgNDCwzNKZTXIYP7nXjJ4bHYzhPMbhwe8D0e7tTQDECbbxFl4ks7Tynzzl+9Pzlciyl
         ROrA==
X-Gm-Message-State: AOAM5314CKzqvArTVzovTypD5MuoScPGgaRh2AWO7B16fEz1fD8sAyfA
	gtLxr1tAE/xB/7CqJce1AYY3w/GLE6I=
X-Google-Smtp-Source: 
 ABdhPJxH5UYgMScOzqRCBy4RV9sNlURPhTAu9TMJLMNvIeom9VOpclAvTuao0Dp70utv+opbwbuxMQ==
X-Received: by 2002:a17:906:d550:b0:6ec:9ff:8791 with SMTP id
 cr16-20020a170906d55000b006ec09ff8791mr20043748ejc.494.1650958244844;
        Tue, 26 Apr 2022 00:30:44 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-5-19-5.retail.telecomitalia.it. [87.5.19.5])
        by smtp.gmail.com with ESMTPSA id
 h12-20020a05640250cc00b00425f22ea3e7sm1811464edb.6.2022.04.26.00.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 00:30:44 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [master][kirkstone][PATCH] create-spdx: delete virtual/kernel
 dependency to fix FreeRTOS build
Date: Tue, 26 Apr 2022 09:30:38 +0200
Message-Id: <20220426073038.7026-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Apr 2022 07:30:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164859

This patch has been discussed in this ML thread:
https://lists.openembedded.org/g/openembedded-core/topic/90602531

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 meta/classes/create-spdx.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 28fc449636..9979c1d70e 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -35,8 +35,6 @@ SPDX_SUPPLIER[doc] = "The SPDX PackageSupplier field for SPDX packages created f
     is the contact information for the person or organization who is doing the \
     build."
 
-do_image_complete[depends] = "virtual/kernel:do_create_spdx"
-
 def extract_licenses(filename):
     import re
 
-- 
2.32.0


