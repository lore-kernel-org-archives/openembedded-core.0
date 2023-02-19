Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB53C64ED8
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:20 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.3846.1676835075403345916
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Bmf+qhQ8;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id o18so968112wrw.1
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=as1wUoYbyzEO0q7jpQYpFLLw2k30wiFTA2G0GpXDVRE=;
        b=Bmf+qhQ82aAPNfw64MbpyNNFWhVy2U/KlhjlX6lEpi8IguPrtymr7DdRJCOH0/2J5P
         tgyGqJmm3zh/4VNRd1EUKAs7EEofTiIsBAOUKmxN/GA8t5gbGT7udOdVdvss1PPEv4Yi
         grSeEoYAed07eZN42Y5Jf9X2fdkEiC/HXPkmS2ZIvwl19BMRqPMm9/QEaMSjiw0bG6Py
         FGrdLm/kiiwsppCmLKXlO1JXPyxlRDM9ehHfnyRqfewSGoikx72PoLjehK66kbSxmUYY
         j2L2q3S35QYYnlqBSwXgR2cuVPu9EC5At4P64vMi77fPGo+o4uRRFBBsIhdeGw+I5Rkj
         ZouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=as1wUoYbyzEO0q7jpQYpFLLw2k30wiFTA2G0GpXDVRE=;
        b=CkYTm8IXY5yehgg3pfZmtjwnGnuqnEb6ZVyTOXKP+sv7bAmBlfQWezM3kL8KJANsFg
         tXOcgVNd707f3xRxQMjtoHu83LtQGLdu6NB7ke9DV6Jtuj+TTKlp0dmxzO5XhnJjgxf8
         ebMS0mrEhBiY7S3QvpRUxittC1sZaafG1xtN7R/LNYid0gyukw0ElK+Dk+9NnKSIwRas
         e2jikBqfXlhqLVKz9gj2aR2ih1FURBmBmijtI/o2KMvY/ZMe+KO4Ad6qIg6TbobWu4sr
         ukN2sr84ipBrZN5FbHF0E7ovVGuywEmt9eZ9vZZZ67OGmXzsR/bp0T8LIpXLvF/P8jqW
         p9EQ==
X-Gm-Message-State: AO0yUKVmrdb4VSrlNdnN774JccfD+69rlbP/7XaRZ3iqZqDIKiRJTZHn
	QMlUza85jgpSq/O7Q/4mg3kcECsiqV0=
X-Google-Smtp-Source: AK7set+cJa5bVe0kXPGfbffMMkOPLsYvqD8oM2xoT5NhQdSBGXjF1bRfqUXsL0/9U1SJZvZ7hUz/ZA==
X-Received: by 2002:a5d:5001:0:b0:2c5:8e61:3fe2 with SMTP id e1-20020a5d5001000000b002c58e613fe2mr1126320wrt.40.1676835076029;
        Sun, 19 Feb 2023 11:31:16 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/39] webkitgtk: upgrade 2.38.4 -> 2.38.5
Date: Sun, 19 Feb 2023 20:30:39 +0100
Message-Id: <20230219193101.338397-17-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177360

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../webkit/{webkitgtk_2.38.4.bb => webkitgtk_2.38.5.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.38.4.bb => webkitgtk_2.38.5.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.38.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.38.4.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
index cab91eec93..e52920883a 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.38.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
            file://d318bb461f040b90453bc4e100dcf967243ecd98.patch \
            "
-SRC_URI[sha256sum] = "4f47ea29a2d4d5f15eef3dc9e2d6c6f067e8de863a3f64455e1ccf9693cc1d36"
+SRC_URI[sha256sum] = "40c20c43022274df5893f22b1054fa894c3eea057389bb08aee08c5b0bb0c1a7"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.30.2


