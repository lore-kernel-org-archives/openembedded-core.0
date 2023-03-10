Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC11C64EC4
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 10:07:08 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.15765.1678442827884802927
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 02:07:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=puA800sR;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id fr5-20020a17090ae2c500b0023af8a036d2so8463339pjb.5
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 02:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678442827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IhJv/PE7BTdXRiWjHbUFs+4aUqJmJ1VQmHQWNXXHTsE=;
        b=puA800sRO5nBz1+HdNKH3RwDzvwdaI0jZIH1FLw+bCVT/JldRXEbxpQhXsi4ZKbXIU
         /tgWYsuLV2x5LPYqryMIQ2uJ3M1eHs9F5zbR+kJgGaz3BfC1ACSh4hYx2a/j5Km6eroH
         7d9FoMxfdchbHUhc3hC2EVtMgXCtNVeHebS08+3mFyorSou0tU0BXN60cKGz1jTRaqEu
         8NEYl01NRrcWwwQs19+6A7yxgS00puisLMIWDP2+oHqi5D/UPjKYa+2xhhxfIv6WG4Ef
         h9+57xO+ekza4gd+BPv9UpFdOFHndzjjOK/Jhg8xMK6EDOCMbueuni3newq8CdjUT482
         h3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678442827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IhJv/PE7BTdXRiWjHbUFs+4aUqJmJ1VQmHQWNXXHTsE=;
        b=kIYbnzoXGfYvf591OXjeMpryz5gMmNXVwByEFRlVxdXAFvwQ2YwBjgYalGINuQvubg
         //Z7QH2u/YaCU+LMHCzaSaTtr4TC8TDCj5cv9/0xpC5JGkB7lrSMYzEzIwXfrzAmAOg+
         hORf/y0u7TgZZxL7su/U7EzObuZpIbmm1b4sAniWAjV+v/mmzCTkiO3YpK0ekSr9CaCD
         QAx+Wc9BwX2a98D2PDANJWwKD2BcstRZd4WadGBbZ0yds5k4ar36lzJ6NHFVsISFo0yj
         5GhOhqLQaMNy2fPV1bN5bX2VrTvt6K9pgYJxNfC/yunKtDBzMCx9wrYfNJBcluiLok15
         QDMQ==
X-Gm-Message-State: AO0yUKV5pZv04/TV0HduaRpKSzer2qUA97CKUVBYTA7TQ5DOOFrsXtP2
	/pinFqinCh6aV/2f5Kjrv8X13PC1cAo=
X-Google-Smtp-Source: AK7set+pQHQi+wajBl+kSGe+uFY/EKXTs7OwlGsl1aSAYGv8xNPzq+yLdlKryOQNO8W5kqz7jfoSiw==
X-Received: by 2002:a17:90a:e392:b0:237:cfdb:c251 with SMTP id b18-20020a17090ae39200b00237cfdbc251mr1783739pjz.16.1678442826722;
        Fri, 10 Mar 2023 02:07:06 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::8cdc])
        by smtp.gmail.com with ESMTPSA id m133-20020a633f8b000000b004fbb4a55b64sm962784pga.86.2023.03.10.02.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 02:07:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] systemd.bbclass: Add /usr/lib/systemd to searchpaths as well
Date: Fri, 10 Mar 2023 02:07:03 -0800
Message-Id: <20230310100703.3885093-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 10:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178323

Some packages like lirc places its unit files into $systemd_user_unitdir
and also uses them in SYSTEMD_SERVICE list in recipe. This fails in
do_package

ERROR: Didn't find service unit 'lircmd.service', specified in SYSTEMD_SERVICE:lirc.

here lircmd.service is installed in /usr/lib/systemd/system/lircmd.service

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes-recipe/systemd.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/systemd.bbclass
index f9c92e6c2a..9a16babe43 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -152,6 +152,7 @@ python systemd_populate_packages() {
     def systemd_check_services():
         searchpaths = [oe.path.join(d.getVar("sysconfdir"), "systemd", "system"),]
         searchpaths.append(d.getVar("systemd_system_unitdir"))
+        searchpaths.append(d.getVar("systemd_user_unitdir"))
         systemd_packages = d.getVar('SYSTEMD_PACKAGES')
 
         keys = 'Also'
-- 
2.39.2


