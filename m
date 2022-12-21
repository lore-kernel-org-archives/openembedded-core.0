Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E0BC10F1B
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 12:53:33 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.17639.1671627205210396201
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 04:53:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z7zUQrDQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id m19so11069315wms.5
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 04:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KTwWqstqugEIhkp7pEb97N3UY4xkdK+Q0LeYPIX/1I=;
        b=Z7zUQrDQffw9oZU+FBzrTQEqXB9BPu8oIV+FWdmd3BEo5ED4CSw2tmz6b2aPvd6gaZ
         KgY+e0gwRLTnjMRRVAZculhHko3Y6B8YNYkOZiyrvedAluXwzWfk9sbSOpiddo4FWXGm
         3kGtUJUZGSibJrseZ7FEZtp5XICO0pXsWvpkAeRm+txvS1gXFH3EHCsP9He9Mmt3Da1x
         oc87ow2n6gIwnK1vXsiHmMkQ47N/y4y8UCmfjbwJZ39OeUKnknx0iAvJYVQxWiRbvU08
         FIXVgCj/p2MTmQSN8AbmiuB+ak7whFqUh2kd4S+uDDyHOwxOzzBjBZWAvB725dvhhXuJ
         ME8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+KTwWqstqugEIhkp7pEb97N3UY4xkdK+Q0LeYPIX/1I=;
        b=qQ0aHS0ipXM9plAakerxGTzllB9c2DivrXgpCzy14CflFJhTqhvNH1eE/yY0SV/M2I
         H2Wiv+XqADmYeg9HxO/JqmhC8IcC4CIVWPX5OkhYcQuyqjB0Zl+bpaOmRyILThvN/aff
         nUvVP3J4QRHiEdJPh+3WPgV5j5U5uCedsDdzFSxaTcUtL0GYBeQDPbHkQ/WbwnTiONnJ
         oF5E4h0jmfBi/8gDvu1anfS/PeoeEtDFbmKJKpU/iJDhM96ab/quU3iuv/35LgPJbaw6
         AmWev0QyMmPmqb0fjihkXCgoDXy8O4/wpUnPV6S9jqBklka/wsVA+PwZoMMu5sPdJjbu
         gaOQ==
X-Gm-Message-State: AFqh2kpbKZXEfGknpVoAK0YpUnv46eDAl+rPQhuj3wRZvb2wWDzkNzTM
	MWfqXwmfxatERhXjCfLPtg7TWAey+xI=
X-Google-Smtp-Source: AMrXdXuwdiMjxZINErjNZJPFpOKxF+SpAS2a4OGr3rWqBucd2TeSomWkXezqglwUIaSN1Afjc+ESxg==
X-Received: by 2002:a05:600c:41c2:b0:3d3:5565:3617 with SMTP id t2-20020a05600c41c200b003d355653617mr4345678wmh.24.1671627203393;
        Wed, 21 Dec 2022 04:53:23 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id m6-20020a7bcb86000000b003b47ff307e1sm2124097wmi.31.2022.12.21.04.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 04:53:22 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2 08/10] packagegroup-rust-sdk-target: Add Rust SDK target packagegroup
Date: Wed, 21 Dec 2022 12:53:03 +0000
Message-Id: <20221221125306.13779-9-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221125306.13779-1-alex.kiernan@gmail.com>
References: <20221221125306.13779-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 12:53:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174914

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


