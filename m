Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A8E8C4332F
	for <webhook@archiver.kernel.org>; Sun, 25 Dec 2022 21:59:35 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.125283.1672005574799387788
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Dec 2022 13:59:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hc/h4W9I;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id tz12so23086179ejc.9
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Dec 2022 13:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1YlgVUmiYjg1J/GEX49qH/hsjBd0WI8g61dopNy/aw0=;
        b=hc/h4W9IvBm5UTyN4/o+BisrAB1JuroZrmDQ+ZTHGZ0ASxTP7xtshd1XiFSgWuB4/Y
         Mnt26jBGt9QAKqYsjKqoL+QfoOcdH5Stn341S5KrZMWxMnwVdMbto0MbreM4eF0Ud4y8
         +eGR5J7LHjaqt1V+hW+qOvOx0XhjGYhaEtY0x/9UDW5CArTG2I1kQxP/MfhprVEp7bKX
         /Pbk+/QQp6d2kc0lh+jhncf6eXI5EXYxEcM6NMG0Pi5qP3SxuIN5No4RqeuJWk/I1uDF
         5odNTtlcbPOsCp/lcGQTFZre/h8jrM6f6XJDsnIK4Y1nBUrgzkE8y3A7IkVw4krNDF0q
         FA4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YlgVUmiYjg1J/GEX49qH/hsjBd0WI8g61dopNy/aw0=;
        b=GrozYzSKjsPhR7zVzZe+LzQgeAJEcY1Acdy6gZ0ZHZx7fyQxjUaMNYVg6ufIINj9Hv
         jPEeHp/f/pxhxeUNWy2amZXQHbkxXX2O495YlU0nFUoENYn0plJV5or4YhfJxuIl8xiG
         C/4akyaDcUxxliNaPxlbtT6I+S5iVISUTW8aZwIM0StyRdpETOO4pFYwDzfVRO9wkCcC
         1lo8up8Ck5JEcib8OK8gMHHrpM/U5iRajFi+wwZDP6U8aVSkE7GtPuOOzS4GqwG4kp6D
         TTr/3X8nMfR23188cKaOGoIDcurAYumNv8IbQy10ZyyIGWOWAqNvUX30zWjQxtIgQg4A
         kEFQ==
X-Gm-Message-State: AFqh2kqaVKAzutIEKM4thnn56vL0WuPrxijJYXrzGnIVA6+EAcoN1xf8
	bwctKuP4R5ahwUTZXLOCm/1TcKxPT6I=
X-Google-Smtp-Source: AMrXdXtndHUjTTC+04sAc/7A/i9AO7vNhTHueThGoMKMK2dt1WI+7eJn3gAo7x0zpVX0PIBlyY9MrA==
X-Received: by 2002:a17:907:2587:b0:7c0:e7ad:fb0f with SMTP id ad7-20020a170907258700b007c0e7adfb0fmr11009651ejc.20.1672005573188;
        Sun, 25 Dec 2022 13:59:33 -0800 (PST)
Received: from localhost.localdomain (42.93.115.87.dyn.plus.net. [87.115.93.42])
        by smtp.gmail.com with ESMTPSA id k8-20020a17090632c800b007c0f2c4cdffsm4066487ejk.44.2022.12.25.13.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 13:59:32 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v4 03/11] packagegroup-rust-sdk-target: Add Rust SDK target packagegroup
Date: Sun, 25 Dec 2022 21:59:13 +0000
Message-Id: <20221225215921.12868-4-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221225215921.12868-1-alex.kiernan@gmail.com>
References: <20221225215921.12868-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Dec 2022 21:59:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174998

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

 .../packagegroups/packagegroup-rust-sdk-target.bb   | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta/recipes-core/packagegroups/packagegroup-rust-sdk-target.bb

diff --git a/meta/recipes-core/packagegroups/packagegroup-rust-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-rust-sdk-target.bb
new file mode 100644
index 000000000000..334b24900b4b
--- /dev/null
+++ b/meta/recipes-core/packagegroups/packagegroup-rust-sdk-target.bb
@@ -0,0 +1,13 @@
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
+"
-- 
2.39.0


