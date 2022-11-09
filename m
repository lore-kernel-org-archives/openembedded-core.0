Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB364C4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 14:21:10 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web09.3847.1668003656162736447
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 06:21:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ZYGtP+2M;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id z26so16837460pff.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 06:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4rNOtsoSA4iHZuqXcTlM8kYthk3yOYprjduffsq1ivQ=;
        b=ZYGtP+2M+RMNkRMM9WuK8F3x6NWrSjx0/qCRZpNFSy+5aUgw5wkDlUfDo6IjLPvhUB
         jQNS5O2oqclWbNRHeORp8upzFl82hIXQtNg3BBrg6uqnV0Rdc2XPcAlZdoltVoGA/9GU
         XlfK485xTiQ8bOtVoU57bNoES8L6fPK8yHpDHUcPA3qIKiJS+Vvx4VwAObLTA4bkquXT
         TjesHCbHTRLRPn5WQ6vFxcktEiP3LB/r2elRKOifRA5uObo9ThqhNL5iNKV0RdQyBmJA
         QB+cE/vDFFHOd0qxhgrxg9fTiMIdp2IPCnyid4uUysX0CqdTRydQSqUajn9u9/4K7spx
         MTLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rNOtsoSA4iHZuqXcTlM8kYthk3yOYprjduffsq1ivQ=;
        b=UPw90Su9ADqis3hwcVRoRrVQF+ASbrxViU2AURdJZpxUL0fkV/NYeePUoFX9Wi+oIU
         J5QgXKM35nVt5RLBFgVyz3zrXLWGTV+o/4L6AhW5T6ErE7FouJXY1I6QBD3KmlaQdmki
         vyvau3oLFJBsRoJ5XvE1xykGZJDJ0eJJxHuM5KiCwLcQjxG8HDHnIeBftQO0OP+FVZ5e
         dHaoipBYvGJZ+GIp8MZY96x3T9GzWdsGeINDzb+ud/ESs6LQuPtseS56jsxQp9YyXEFE
         4uAgys0/M7ilqb6DD5Hh7goRveHQvkmNkOFK1Ct0cGpTwh8SrWhiJfJyaazfFBm98BSu
         1pzg==
X-Gm-Message-State: ACrzQf2UZjFYLGr4J7JzyX9rpNn7uOlO+yK471Xye4qTYhreGxp6bWkY
	/lR3zUQlvJGi1S7g9TV6pbXuGoGccaeZ5Mtn
X-Google-Smtp-Source: AMsMyM5ItRMjt6f9sWjDUhYJkEWUSkfJtsK3hBhLa8H3YF65o+FRCozhY+kTntYIQ7EiCiYCQ1Fn7w==
X-Received: by 2002:a62:5a03:0:b0:56e:664e:a1d9 with SMTP id o3-20020a625a03000000b0056e664ea1d9mr32182629pfb.50.1668003666496;
        Wed, 09 Nov 2022 06:21:06 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s17-20020a170902a51100b001822121c45asm9059337plq.28.2022.11.09.06.21.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 06:21:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 09/10] wic: swap partitions are not added to fstab
Date: Wed,  9 Nov 2022 04:20:39 -1000
Message-Id: <8fdb75c0f0f7458305ccae657cf2722520e00572.1668003427.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668003427.git.steve@sakoman.com>
References: <cover.1668003427.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 14:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173028

From: ciarancourtney <ciaran.courtney@activeenergy.ie>

- Regression in 7aa678ce804c21dc1dc51b9be442671bc33c4041

Signed-off-by: Ciaran Courtney <ciaran.courtney@activeenergy.ie>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f1243572ad6b6303fe562e4eb7a9826fd51ea3c3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 3e766972b4..67dc56d4ff 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -117,7 +117,7 @@ class DirectPlugin(ImagerPlugin):
         updated = False
         for part in self.parts:
             if not part.realnum or not part.mountpoint \
-               or part.mountpoint == "/" or not part.mountpoint.startswith('/'):
+               or part.mountpoint == "/" or not (part.mountpoint.startswith('/') or part.mountpoint == "swap"):
                 continue
 
             if part.use_uuid:
-- 
2.25.1


