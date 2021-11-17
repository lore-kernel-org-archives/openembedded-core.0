Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7767DC433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 12:32:14 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web08.6468.1637152333784799462
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 04:32:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZkgUQyGX;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id w1so10413482edc.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 04:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JOXafviGNXDXTrB0HyZi9kR2CW2jB4+rCUjnVRZHg9g=;
        b=ZkgUQyGXhi1D5ENn/d0Gt5yyl8XlxUvVhthN/0wsFcW9xJwI9hXQZd0t9jVC+j192u
         Cy890IWPyK6OxfBmxNylbwJvsSkc5u3AKTPWtdn62KmRlhDomZ++TXfql3Ug+iJC0GS6
         SHB4wczLrqPiaHTkZ/e6Pa9yDtWBFwUds+sHwABJ0p8hrm5FhnLB4J8hL95IdDHsN+IB
         G+cBhNHM88M3WMU76wqAKYpYzGwviRCHHvPaERYKZHeMgTaNnRv8k4I/CD72jyPjBjdw
         VXE6NiATeo7BH7gm0rZPYGGSPsjyJiH+ZIVW6VVKDJHeyJT+Crx0dCPPOUq/mCyQfR0S
         +siw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JOXafviGNXDXTrB0HyZi9kR2CW2jB4+rCUjnVRZHg9g=;
        b=P4Du2UvGMkdzkxHyT4ee4ePKcXPb1lPa0xcIe3SSjz/4Kblcpb0pW7UdwtkZB9k6KP
         YRCXi9VPUBB9aVXb+dpMhZ+kif/2SOl7igV/I7htL8nz80i/Kg/6vJ9o+eYwuFVRpZk9
         Vk/KTyib6559eunNT52yz6+Iz7NLiKip1inI4bBu09oWtXKV91LQ7S0izQD+Q8YDRiNi
         xvVuU8oQuB66sG82SXJjy4gqySQ60y+EPJrIXi+NRdPzo+1+1JytijPL+2EBg9s8KUZp
         BO5pjS5vbj3OvRHkoTUvqoWG1aY/yps1LAsXxa7cNBogd4YGjGs8KyE13BzFvODWbuSc
         DzTw==
X-Gm-Message-State: AOAM5337XMyXJTcVw2l3gQZ7DLlMLysS5ZbPcpYhTwdh4pge/1/ny/wU
	SvmAJokzOwSkmrNsvBMkGe3wtkvs11KQIQ==
X-Google-Smtp-Source: 
 ABdhPJxHR/BzpFyoARlLFcBlDiWtN/Nu4Tuy3s1p3AYi+JTdg97kkvkD0be07pp6kD2DENByPcL+dQ==
X-Received: by 2002:aa7:d652:: with SMTP id v18mr8160203edr.68.1637152332108;
        Wed, 17 Nov 2021 04:32:12 -0800 (PST)
Received: from localhost ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id
 x14sm9673555ejs.124.2021.11.17.04.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 04:32:11 -0800 (PST)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: paul.eggleton@microsoft.com
Subject: [PATCH 4/8] volatile-binds: remove /var in nativesdk builds
Date: Wed, 17 Nov 2021 12:31:57 +0000
Message-Id: <20211117123201.111905-5-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211117123201.111905-1-luca.boccassi@gmail.com>
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 12:32:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158388

From: Luca Boccassi <luca.boccassi@microsoft.com>

Nothing picks it up, so it fails QA checks

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-core/volatile-binds/volatile-binds.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/volatile-binds/volatile-binds.bb b/meta/recipes-core/volatile-binds/volatile-binds.bb
index d5c5538cd7..66e28f4fc9 100644
--- a/meta/recipes-core/volatile-binds/volatile-binds.bb
+++ b/meta/recipes-core/volatile-binds/volatile-binds.bb
@@ -79,3 +79,8 @@ do_install () {
     ln -s /dev/null ${D}${sysconfdir}/tmpfiles.d/home.conf
 }
 do_install[dirs] = "${WORKDIR}"
+
+# Nothing picks up /var in the nativesdk case
+do_install_append_class-nativesdk () {
+    rm -rf ${D}/var
+}
-- 
2.30.2


