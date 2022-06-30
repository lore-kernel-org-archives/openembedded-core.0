Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2858AC43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 16:23:52 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.27121.1656606231054091753
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 09:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=mfDdukWw;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id d14so19239577pjs.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 09:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ix7TNWOxEorgglXbgd4k33GU7kZMg3LWWbAzBJmLKxw=;
        b=mfDdukWwh0eSAgdnRg5eeQebrarJ55VqHqRmnxhDHdK/g6fozD8veqM/8AtDU9MsqT
         r8uu6YnICKqhCw5s81jCTRTRCNIjCo94ajM1LMkqZNA/yk2yNQJykJhos9FiUPU7Ui5h
         +fSe8TJp7+WwriqzGsAw6LeeUTQUwORYlWy834nVXBvWD+QRpFR9+Tj/V1A/he2MT5ke
         hNG1NKUSawII4EXE749NDiyopuRjrMi/+JZQgLTgM92uGZRQ2QjaLfnyrk9Uv78OmrXl
         5mL6r1I6CEhuKTMN8jrxYke0jIHdaIpKFujmOXq9i5auYv9ryZK/4trt+YbE+CJ8VmxE
         +9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ix7TNWOxEorgglXbgd4k33GU7kZMg3LWWbAzBJmLKxw=;
        b=5SYcsexTA8DhyiI24awXzYPp5CXlTbsKla45HVQocZc4hw3qeyqpxlqm/FH4fVHphJ
         Gr4eCKJ3Kw1AfO3YRowinrLXFF9YlyjUuWcVfUlJxst6DSxv5URC4eYsut+Kjve1zbAO
         NcwSzRzMgK2u4EQbHuo+Fdn3rdLZrh5nqxFCQctUQEkSDh6A2Q+9nOhBSnyhMiZJR1zF
         V0AxvehK4tJTEXJXHR+zba1dmo7eRynwv+glSujUlbxaJVbPOGhPh4wdyY5UhI/QC7Ic
         bx980IOSLcGsX/rEfgJSZy14/So2IOXDLKdRur12EfEfH9uOXthWe7zvtbX2poqaa1Wp
         xhEw==
X-Gm-Message-State: AJIora/JX7/4m0F9kuQehfUKKk7t7NOLBZRsqcvBM4HiA21KL1VFwm12
	ingNp8qig3BsBwY7Rwe19iHjK29WKDhxkUzO
X-Google-Smtp-Source: 
 AGRyM1tUSkFdjVYzKgej97bWoYkZFc96pdZFIuEjZiAqqvW1Nhz3716VuU37j+KLakWRL1Rj+7lGUg==
X-Received: by 2002:a17:90b:4f4e:b0:1ec:a71c:4148 with SMTP id
 pj14-20020a17090b4f4e00b001eca71c4148mr11114107pjb.124.1656606230075;
        Thu, 30 Jun 2022 09:23:50 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 t129-20020a625f87000000b005259578e8fcsm10517611pfb.181.2022.06.30.09.23.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 09:23:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/12] insane.bbclass: host-user-contaminated:
 Correct per package home path
Date: Thu, 30 Jun 2022 06:23:12 -1000
Message-Id: 
 <b75caf4a985e3c20996531785125eaffdc832104.1656605800.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656605800.git.steve@sakoman.com>
References: <cover.1656605800.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 16:23:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167428

From: Ahmed Hossam <Ahmed.Hossam@opensynergy.com>

The current home path that is compared against is incorrect as it is missing the
package name, this patch adds it.

[YOCTO #14553]

Signed-off-by: Ahmed Hossam <Ahmed.Hossam@opensynergy.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit ae8f22d9e2694eea5ede3b31c6f3bca404ea4a5a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index eb19425652..77a2039738 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -945,7 +945,7 @@ def package_qa_check_host_user(path, name, d, elf, messages):
 
     dest = d.getVar('PKGDEST')
     pn = d.getVar('PN')
-    home = os.path.join(dest, 'home')
+    home = os.path.join(dest, name, 'home')
     if path == home or path.startswith(home + os.sep):
         return
 
-- 
2.25.1


