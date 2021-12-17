Return-Path: <matt@madison.systems>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D136C433FE
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 15:37:07 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web12.7586.1639755426280581481
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 07:37:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison.systems header.s=google header.b=OQmaRI0a;
 spf=pass (domain: madison.systems, ip: 209.85.210.179,
 mailfrom: matt@madison.systems)
Received: by mail-pf1-f179.google.com with SMTP id r26so1888221pfg.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 07:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison.systems; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LFHnJy1Uz27To9MJDCAiQkbDNAClr1MrVWwSLgTyH8w=;
        b=OQmaRI0aRbQiP3GkJtu1mE7J42Ly7j/NK1y21xyDrdzzlOGP+3fbF2lvgmAOeU8p7q
         Z8xGoApjRmF98m6wAtAynevdfdhf4m//7cpMW6qtVbQ5eSFUO+NAU5q2wsGFahK05+ES
         fEXQ6RDTSGksW5EtABXexnx6QqN3dFj0Gl0hrmvvdgQQEJr6YG6HzhOWbv7C+jLd/HSZ
         divXapNCbjR/h9VyJAw+sCnlXyVWm+GGDKl5YbYPcBLudOuJe5xx9GZxqnc7Hc6cwgnK
         zwquHeMF/JyKITrLjmacM6uP/dny1aPeAryQjQWZH/e9n8XMlgl+r8MyV/DLvKEVDZkH
         0nVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LFHnJy1Uz27To9MJDCAiQkbDNAClr1MrVWwSLgTyH8w=;
        b=IDoFUPlpLMx8IOC2uQ3BXtxecibEg85kNIUGonetW2wbHtLe8JuGbQo7Q/ZhZZxEDW
         ZL/ubp66WOgufxmZVGNQzohUCyR3O1fQZTD3mp8A/oN+S1xz1FcyeqxH46rE+Zf9cJdM
         Ey/CxtPsZD+krqp7u8OIZp2IxXHU1+lOQc5G0IKQCVF9zQquylBFSrSHoRFGgOTQ7A4p
         RkZSKfGXyA2RRPTzczPzGR0S69lQdCYdTo7nZgJQkmbrL3hDIibW0l8P9Po7Xjto897c
         LKDp5N70F9XzBwhX932dKXfRk9lNX2gUZA3/SPe9I9s03I4aZTrQasVvcKx9/+Ukl6hQ
         lvwg==
X-Gm-Message-State: AOAM531KjDoErvp/MMJAvQfVFxmE7JThv1PouY9ndFUrhci+4PMeG0Zy
	fgOwrFlOgdapyT4rXMV+RCdrm7G7xnG6/g==
X-Google-Smtp-Source: 
 ABdhPJzlx+jrNSKcICVwnV+rASeozNnh4+ougmP7pN46JvaAq3xJVBhtCL14Jun+LUEntKfZLhjR3A==
X-Received: by 2002:aa7:9af4:0:b0:4a4:cd7f:2732 with SMTP id
 y20-20020aa79af4000000b004a4cd7f2732mr3589586pfp.60.1639755425434;
        Fri, 17 Dec 2021 07:37:05 -0800 (PST)
Received: from visar.local (76-209-242-28.lightspeed.mtryca.sbcglobal.net.
 [76.209.242.28])
        by smtp.gmail.com with ESMTPSA id
 ip5sm8271631pjb.1.2021.12.17.07.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 07:37:04 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <jpewhacker@gmail.com>,
	Matt Madison <matt@madison.systems>
Subject: [OE-core][PATCH 4/4] classes: remove crate-fetch.bbclass
Date: Fri, 17 Dec 2021 07:36:30 -0800
Message-Id: <20211217153630.1746217-5-matt@madison.systems>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211217153630.1746217-1-matt@madison.systems>
References: <20211217153630.1746217-1-matt@madison.systems>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Dec 2021 15:37:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159832

No longer required now that the crate fetcher
gets installed via OE_IMPORTS.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/crate-fetch.bbclass | 28 ----------------------------
 1 file changed, 28 deletions(-)
 delete mode 100644 meta/classes/crate-fetch.bbclass

diff --git a/meta/classes/crate-fetch.bbclass b/meta/classes/crate-fetch.bbclass
deleted file mode 100644
index a7fa22b2a0..0000000000
--- a/meta/classes/crate-fetch.bbclass
+++ /dev/null
@@ -1,28 +0,0 @@
-#
-# crate-fetch class
-#
-# Registers 'crate' method for Bitbake fetch2.
-#
-# Adds support for following format in recipe SRC_URI:
-# crate://<packagename>/<version>
-#
-
-def import_crate(d):
-    import crate
-    if not getattr(crate, 'imported', False):
-        bb.fetch2.methods.append(crate.Crate())
-        crate.imported = True
-
-python crate_import_handler() {
-    import_crate(d)
-}
-
-addhandler crate_import_handler
-crate_import_handler[eventmask] = "bb.event.RecipePreFinalise"
-
-def crate_get_srcrev(d):
-    import_crate(d)
-    return bb.fetch2.get_srcrev(d)
-
-# Override SRCPV to make sure it imports the fetcher first
-SRCPV = "${@crate_get_srcrev(d)}"
-- 
2.32.0


