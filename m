Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A4B0C76196
	for <webhook@archiver.kernel.org>; Sun,  2 Apr 2023 16:42:59 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.48696.1680453750816217484
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Apr 2023 09:42:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=mI2Ewrp3;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id kc4so25817312plb.10
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 09:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680453773; x=1683045773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KENU/j2xG3Vsdx0K29hF7OQSXyG13AHFi76Y2uXhO2Q=;
        b=mI2Ewrp3Dmxns+yxcVvrn9rsHetgw8ELVRKJjGPvuZIn0XEI53AIrOV4URDlWlfszA
         JnZeJhbu+yObeEj/FYuF2M2Gv/sC88S+6eP+fxqrrftBPXHravSy4ALj0adA43Qf0nlB
         OrgVBm5RCtGQjy21iQ5PaPV4qoHNv47/Jashnvc7z4/t9jm+6PNbk3T4W81w6b1sod1h
         0BG5GZJqP3RPDdkKc/Q/B8MkjHFjgd0qRgDBVSAzW6hFcMiY4p5vwgMQ4cYE06U9orXU
         TPGUXr33vuSPcwjpTde2Lv4YxrRnWySnNSMaZ+Kl6tpFiSHjSejD3G+N0mMc7Clq2Tnq
         MWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680453773; x=1683045773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KENU/j2xG3Vsdx0K29hF7OQSXyG13AHFi76Y2uXhO2Q=;
        b=lGN3G01RXT50jTs7C6QoZpO7I3ExCd63l+h9sO5I8dKLiG8gDQs9V/Gp7JisKfpJVF
         7BqMeq2FPNYAbE4T5Gk+B7nH9nBBJuIjThIzSwjEkELaeU8FojdN0SeQ27I3u5rB60D1
         7q7YFV6jpRGIHRe3YX/Hy6DJqSi4Zup14I4D4eFR9rEkftCgPCe+zKdhaFey10HYG9F7
         L9wrtAlI3te4kqI8QZqtOXeuuCigjPeE+Mm5bGdutXKPowT9Hc3yF5idlnJV+nK2Porw
         xOnUZ5aESM8UD53Aik9oCPObEr5M48WNG9U60rQe4i39kOyAp2RQPsQSbqKk93KVzqgn
         H2vw==
X-Gm-Message-State: AAQBX9c6NzcOc69291+hB9JdYZyxbrzPXP5SIn3CJ+WT5chKbL2haGyH
	uMn5+TQyM29XDWatFs/TyK+CuXO9N7sKI0zabxc=
X-Google-Smtp-Source: AKy350bcjT1RLGvT9Ak+6fZyiQjlf3L+XxA0lyUSpTBnaL29XTWKYFhjKm7fJmW91DTrUxUgFhp08g==
X-Received: by 2002:a17:902:d4c7:b0:1a1:b52d:68e1 with SMTP id o7-20020a170902d4c700b001a1b52d68e1mr41997819plg.32.1680453772698;
        Sun, 02 Apr 2023 09:42:52 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ja7-20020a170902efc700b001a1ddd224desm5042079plb.89.2023.04.02.09.42.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 09:42:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/21] vim: upgrade 9.0.1403 -> 9.0.1429
Date: Sun,  2 Apr 2023 06:42:10 -1000
Message-Id: <e578b685a7fca4e8a40b1863ec58b71f6c4d263c.1680453201.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680453201.git.steve@sakoman.com>
References: <cover.1680453201.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 16:42:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179596

From: Randy MacLeod <randy.macleod@windriver.com>

Fixes: CVE-2023-1127, CVE-2023-1170, CVE-2023-1175,
       CVE-2023-1264, CVE-2023-1355

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 2415072c3800feb164dd4d1fa0b56bd141a5cbd8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 42a2ba46b8..1e27415288 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1403"
-SRCREV = "e764d1b4219e6615a04df1c3a6a5c0210a0a7dac"
+PV .= ".1429"
+SRCREV = "1a08a3e2a584889f19b84a27672134649b73da58"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.34.1


