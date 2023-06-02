Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6301CC77B7A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 13:00:28 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.11988.1685710818909934434
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 06:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=JM5+gbhI;
 spf=pass (domain: baylibre.com, ip: 209.85.160.181, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-3f6b94062f3so17282591cf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 06:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685710817; x=1688302817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GFvfI3F1ierBZJ2vCdunuybHP+00JzCutb6JIBPduoc=;
        b=JM5+gbhIlz6YM+oUZx9VYHIvjmDjgiwkGGXgh0q0nVUb1lRlbH06M+/LD6ikWcS5HR
         Q34Pn7a/v1RkMuDQh/UJb3Ezx2MAio0K0NdalbskhPI2eNVSKj7DLvuh1vBOMzTtIT7m
         /dXEL9guNedObEXc93W0yUQA81mq08RWMwwO+0NcfP4qKz+HRknuoHqIHZBlVZuq04Fc
         H9tDl+hjp/IT/H+zKEwszcdpC0J0WLFkMHw7K2bimVrGXz+dms551STvscTtI1e0RUNA
         s3F6HHa53GwW66GM2hWsk7YeKXVgGcOn2pQQ5J2BMsdFoIUXHsRg2fPmDhh9roaZ7Dvn
         4vqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685710817; x=1688302817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GFvfI3F1ierBZJ2vCdunuybHP+00JzCutb6JIBPduoc=;
        b=L4OwyeQ5WpcMyQRk4PUxvcIKkA+lZKvXYJugP2bcNQGKjSq5XwR1kVgAn3zH3BapJI
         rVd4jDv8daMqqOykkgbbAX2WHZNEaIKMMjlMiC3e1yDdTQq2NUY96DUML36mMfrjRilK
         3XiJCUFLjOxk98hmv+tlZt7XPKVxHrJwNQZrCqc5ekuEavVPC7RmiwQeHz+5b3zkehII
         lvxRCgVCCMvBqV14DRtueeeB5Je8kE9DSwXPExrYOtcFVQBZD1AICuGpoFW8BHr1UT56
         iGzUKE6fMEuDFT2/zx2WTZVcjyXyHxf2t+YtlYm1w8wsdzeogsDffNsJULRqi8QLk66u
         PHAQ==
X-Gm-Message-State: AC+VfDxC7LMVzaAeXNXWP9xtmC8WKsi+1WH+ASSRzjx1jcPLwz5F0pie
	1/Kl+t8tvfpzMP7/9TrqpD9Hf/4DhaqauSlugMs=
X-Google-Smtp-Source: ACHHUZ5DB434Kuz6YFqrrnaBa1DBQW/ovaPbrUPY84HInuxJsfwCcE8KojUkuEJG+VpBPn5OyOl4Cg==
X-Received: by 2002:a05:622a:15d1:b0:3f1:f8fa:11c7 with SMTP id d17-20020a05622a15d100b003f1f8fa11c7mr13860435qty.34.1685710814824;
        Fri, 02 Jun 2023 06:00:14 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id b18-20020ac84f12000000b003e4d9c91106sm733780qte.57.2023.06.02.06.00.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 06:00:14 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] sqlite3: upgrade 3.41.2 -> 3.42.0
Date: Fri,  2 Jun 2023 09:00:12 -0400
Message-Id: <20230602130012.3998377-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 13:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182315

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../sqlite/{sqlite3_3.41.2.bb => sqlite3_3.42.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.41.2.bb => sqlite3_3.42.0.bb} (86%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.41.2.bb b/meta/recipes-support/sqlite/sqlite3_3.42.0.bb
similarity index 86%
rename from meta/recipes-support/sqlite/sqlite3_3.41.2.bb
rename to meta/recipes-support/sqlite/sqlite3_3.42.0.bb
index b09e8e7f55..f60aca63d2 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.41.2.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.42.0.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2023/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "e98c100dd1da4e30fa460761dab7c0b91a50b785e167f8c57acc46514fae9499"
+SRC_URI[sha256sum] = "7abcfd161c6e2742ca5c6c0895d1f853c940f203304a0b49da4e1eca5d088ca6"
 
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_IGNORE += "CVE-2019-19242"
-- 
2.40.1


