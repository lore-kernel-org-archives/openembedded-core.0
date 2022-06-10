Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E77DCCA480
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 21:43:32 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.32764.1654897402464040001
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 14:43:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WEcs3fKT;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: ptsneves@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id
 m39-20020a05600c3b2700b0039c511ebbacso1728089wms.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 14:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jx10Eh51y4HbWngWLtUzs8P6priZADjXMkCR29+D+5U=;
        b=WEcs3fKTkz48MuTg68wRxkJgfUWq8o09oeVtTCtmYmAaZ8gxmh7FMEiHYi2HKB4YPz
         pX+HtaGxrXIsfGhhhsSUB8dq0T3MgTRn7fI+Stu/cALnK6qj40r1NsCKk/VLjWFMuHuD
         odYTB5CWYAetXSCFbOMrScc9uUG9lrFYryc0RShzv6tHqh3iTfEHgV7HCeR/r1bJLaXX
         IwTDD/yLKYE+pz6WUSuk1YtTltoXnuUdOLaE7l4V1CE+0nmTwyZF2/Nm6KbsmWphmMS0
         fMiKl5wRW5ggb929yWOxRlOOdlnCF37SutGj9R3zmchY9xzhrJNl3qS0DYRm94AHUaDi
         mfwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jx10Eh51y4HbWngWLtUzs8P6priZADjXMkCR29+D+5U=;
        b=a2IzD6Mmo7uUH+Lmvk2Ig+sxvzK6NDcINkYEU5mMcUsEKl6RSh4us8g0/EOLBpwWZl
         8p7HdCHEKsK/1wU5kqHo48TO4P1bBP0dFfHY6U0I52auRhqXS7JJslSXjXft7j26gT8S
         +Bl+nnrgu8IsSgtzq46su824Dw8gCbPztz0wBZRf1A2/xCyUpRxnF//LqA1LThEMc1Ui
         3WHETLjJL9srXRQ5+TlpmR2CDWuugrSZyO6gMDH4dN8nQnsJ2RJ35tVpJ1pkKdsC6C35
         49ipZtbKLCW4fWW3U/BI4FYJddNZthK1WCIowHEwuAn06TaFIKxtJ/sTqMP7pC4fkqKr
         5dtA==
X-Gm-Message-State: AOAM532DhaXkwB5z+zcpsezGWv3hC0X5H+AbYk6iSOfFJZ2uPxdFdlfQ
	KVV29leOTHzy9KJ1P4DLcZO+DCamTg==
X-Google-Smtp-Source: 
 ABdhPJyHKimjLA+dQPJKTOJvoXM0qn1VWtIC4ln6Gg6HUMEyFiThEgvaCh077xKxEtzuF8X/cDXLhw==
X-Received: by 2002:a7b:ce0f:0:b0:39c:8217:1a5d with SMTP id
 m15-20020a7bce0f000000b0039c82171a5dmr989354wmc.101.1654897401058;
        Fri, 10 Jun 2022 14:43:21 -0700 (PDT)
Received: from localhost.localdomain
 (031011128028.dynamic-3-poz-k-0-2-0.vectranet.pl. [31.11.128.28])
        by smtp.gmail.com with ESMTPSA id
 e15-20020adfe7cf000000b0020feb9c44c2sm579309wrn.20.2022.06.10.14.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 14:43:20 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v3 2/7] gtk-doc: Fix potential shebang overflow on
 gtkdoc-mkhtml2
Date: Fri, 10 Jun 2022 23:43:09 +0200
Message-Id: <20220610214314.2754247-2-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610214314.2754247-1-ptsneves@gmail.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220610214314.2754247-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jun 2022 21:43:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166814

A native path can cause a shebang overflow on gtkdoc-mkhtml.
Replace it with /usr/bin/env.

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
index 150d2c0b23..392913fcc6 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
@@ -43,6 +43,7 @@ do_install:append () {
         ${datadir}/gtk-doc/python/gtkdoc/config.py; do
         sed -e 's,${RECIPE_SYSROOT_NATIVE}/usr/bin/pkg-config,${bindir}/pkg-config,' \
             -e 's,${HOSTTOOLS_DIR}/python3,${bindir}/python3,' \
+            -e '1s|^#!.*|#!/usr/bin/env python3|' \
             -i ${D}$fn
     done
 }
-- 
2.25.1


