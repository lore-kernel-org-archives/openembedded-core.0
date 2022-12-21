Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D8E3C4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 21:17:26 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.30962.1671657445911287787
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 13:17:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JE0ZHGDs;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id m14so16191185wrh.7
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 13:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KTwWqstqugEIhkp7pEb97N3UY4xkdK+Q0LeYPIX/1I=;
        b=JE0ZHGDsnpbwKdhB6iqoltMx6w27SWxsXY0TSp7f/QH17NxX3UrtD/Xag7oqTNTmyu
         YXdtMF7V7xvg82rUWHIvzSwO6XYq6gTZuAOi3ACbVBdEgoEeAXQ4bXpHSqrZeLsXbgoi
         Y/mo1Z9uDdDFGs8APGBOo4le/huKuk5Fcz+nJz4JzRO3NvEoodAviVDoMiWXC1hqZ2qG
         PzmMGLmKgd6f9cmZgiMsz3CnCD0D6oZKIInM8+t+Vb8EmzIEAF4gDw3Bd4Wh5JOsFjzC
         XMF/yy7R4kSLIRENazuAR7UyZwrt3XNXjjUAdmYp6/1mBVPE98nftMHXrV5+GZKs8bFj
         egmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+KTwWqstqugEIhkp7pEb97N3UY4xkdK+Q0LeYPIX/1I=;
        b=E+nkalYMBsnxs5ou6qwmy45Ei0w1uws6BNFr+H5vBsMfvr7xJ1yaOelJWUYav+TGDk
         74Kj2ix8YnwFUMCoQEwVieNOO7mOO9qAhEzd8pya6S0LbWJmLXL5lOQ2TC+kjMJlcH+S
         ybEn1KlFhlqGJJlSSDSk/OmzNY6eiDJ7Pr4ZpCfQXMneIkrf90zTjiUOAdAvS6vi6eOE
         iqsJUA2yGC8VrSMzrs/ZCyQPRl+IyoDtHdEYPgwsqjPceMsmZcE6JPuFfrV4ECmt/ryC
         JjVKGRl/UL+eQFnCNFYaFT4x4lu6er3Ns7AJHDyWC6l8uzlkYytN9gonIVzWxCmNA+zG
         +O5A==
X-Gm-Message-State: AFqh2kr3wmwzh4LGBlUhQWie8ep/O95SjswKfyydkxRe2CIjsiKFHDRJ
	iqiT8J8H65q1VzYrgMbO0I8BeOj/qgM=
X-Google-Smtp-Source: AMrXdXs2NdmoALwMDy3TW00Lgd9urx05vP4AfnBej1e6Gyh/JQBXhV5Wvhk1JEyXPVEHdhG7WGeLmA==
X-Received: by 2002:a5d:4005:0:b0:268:7106:a318 with SMTP id n5-20020a5d4005000000b002687106a318mr2073785wrp.21.1671657444321;
        Wed, 21 Dec 2022 13:17:24 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id bx25-20020a5d5b19000000b00225307f43fbsm16312442wrb.44.2022.12.21.13.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 13:17:23 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v3 08/10] packagegroup-rust-sdk-target: Add Rust SDK target packagegroup
Date: Wed, 21 Dec 2022 21:17:04 +0000
Message-Id: <20221221211706.25347-9-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221211706.25347-1-alex.kiernan@gmail.com>
References: <20221221211706.25347-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 21:17:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174948

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

 .../packagegroups/packagegroup-rust-sdk-target.bb  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/recipes-core/packagegroups/packagegroup-rust-sdk-target.bb

diff --git a/meta/recipes-core/packagegroups/packagegroup-rust-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-rust-sdk-target.bb
new file mode 100644
index 000000000000..59874c4c2c81
--- /dev/null
+++ b/meta/recipes-core/packagegroups/packagegroup-rust-sdk-target.bb
@@ -0,0 +1,14 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+SUMMARY = "Target packages for the Rust SDK"
+
+inherit packagegroup
+
+RDEPENDS:${PN} = " \
+    rust \
+    cargo \
+"
-- 
2.39.0


