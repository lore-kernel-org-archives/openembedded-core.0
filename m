Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 208B1C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 13:49:18 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web12.6665.1650980953841111825
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 06:49:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ame+avql;
 spf=pass (domain: gmail.com, ip: 209.85.218.43,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id r13so36217588ejd.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 06:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pkHoIxxWHQ73BKaFfy8HVAE+YWD9LSw8MeYy/TxCLes=;
        b=Ame+avqlKdKyOWgtp+AN6mIcpd8L1I/G6CMjAJDvTxpDiq0AQR8M81L3NsLq9+hVAW
         JxM5XPrP+GsPEXFBM89CtwLX3IQUefk6urccA9ik82w3o1u3PNyml2ZeJdHZ7mw13U+9
         X3aesMa8ldFNAfcTu/prklf1mOQbIQx+RrRo4Npq7LG8vyDuxK7aGyd6K6l4fi4PEfmG
         ZgsnPl8+cTQhT7sQ6ZO/NdjjL1E+RZGgVZe1Pee+cffcOrrY7uAARTA0W7vAfycelLwN
         oQXI3/RTh9OCnmw8B5RoMI/3tCJ1GHEpOROTwZF2VKwP2Mn76olQcYkzr8v7bjqfnlaf
         EaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pkHoIxxWHQ73BKaFfy8HVAE+YWD9LSw8MeYy/TxCLes=;
        b=JBqg+z6kCkuELtF9EbQGr6cbZts4hLycD46YZ2MqjaHCWhA9NUZbREYhUF9+jJVtEt
         /M2LBRiCs+bPyDSGyHo8kPR6WQssoyPyPZu11QrwvIIpaHonICgkLEkmf4wUYwoLhmYX
         nysk1fLwJC8lJ5d7p+AnNs4loZyGIh0EVZNKKsBqNmaQgORrIv2x4yGX503/+9FGZ7Vz
         j/Bgsg2g4zS0dXqh9YFzp/6CVsmYIfuCVcESAOWSlLpIPODIBNqNdLizQZ5H8XYnAWm8
         U67swk7pKTWos9RpPnDe3BMitGjQymj6lH8nsEGd+uCfrMZrvprO6OsU+A/5bc/FcLK5
         u9Cw==
X-Gm-Message-State: AOAM531Ld9n4se+wgrd+vNym6i9oYzz0PvvGGNeg/Gt2sxUEAOiJZzgF
	ALxJx87qr0/O6GwMX558W/NsF8vzBs0=
X-Google-Smtp-Source: 
 ABdhPJw9MzhZr05gZxczEOHED+terRzGD6k6caL7elHOLYd9kOhzNmrFuutIS446DLe6BOmNEFVOWw==
X-Received: by 2002:a17:907:761c:b0:6d6:e553:7bd1 with SMTP id
 jx28-20020a170907761c00b006d6e5537bd1mr21246717ejc.5.1650980951867;
        Tue, 26 Apr 2022 06:49:11 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-5-19-5.retail.telecomitalia.it. [87.5.19.5])
        by smtp.gmail.com with ESMTPSA id
 lb26-20020a170907785a00b006ea4d2928e5sm4905210ejc.218.2022.04.26.06.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 06:49:11 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [master][kirkstone][PATCH v2] create-spdx: delete virtual/kernel
 dependency to fix FreeRTOS build
Date: Tue, 26 Apr 2022 15:49:08 +0200
Message-Id: <20220426134908.520502-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Apr 2022 13:49:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164876

When building FreeRTOS this dependency generates an error because
bitbake cannot find any provider for "virtual/kernel".
From a dependency analysis the task is executed indipendently from
this so it can be safely removed.

This patch has been discussed in this ML thread:
https://lists.openembedded.org/g/openembedded-core/topic/90602531

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
Updates:
 - v2: Reword of the commit message
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


