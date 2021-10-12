Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33C75C433F5
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 11:57:25 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.12900.1634039843550642843
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 04:57:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DpftfKOJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id k7so66038187wrd.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 04:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FL4ooyfAzU0YBtEbJyX2S772B/ak5Vw8LJIP9hvYnN4=;
        b=DpftfKOJrC0dtsBctY57VB98scMwu8aI+YjxFg/H30YYX31Bwy7w2Haon77jYcQ5D2
         /6QMz6TYmaVKlH8LzrVADc4Ye3mtRpeD88/uusLLvWgr508HY7f8k2iXVW9y4znY5KxR
         TEy4tgYgNCFkCpPM4wn9ZVzGRxpyrup7Wi51k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FL4ooyfAzU0YBtEbJyX2S772B/ak5Vw8LJIP9hvYnN4=;
        b=TgPOFvhGIkimBPSX7WZHyK/WCuIaQIPHR8rqDmvzmxuAME8DEZz4/9LLN47Pn808Rk
         ZzdC6Ax18TcTRHB5YVNb36HeLB36geVvqh4aNzEDww5rVpyMJsB3E16uY71qFisBqb4A
         ZoFlYfVN2+g2jIJrMIF1zNB8TbQqkvVvaMgOO7hjhlBEO1RQL1rhTUjNmCA/s+lsbiOW
         JBjR4RhXR6fr6ObOyNIkBtLtk+puBoumhvq9zAO/Z2uD6CMuRSU6LDZfLb63Uq5E2vKc
         ze9fM9MupbjEN1Uz1dCDQ1yJkfL3x7XJDotNy+PdO7lQv0tUUukXpSAqWdjFQ2Y6P6SG
         DhJg==
X-Gm-Message-State: AOAM530O9piXhZRlFvkzJiqdPOCnM0kZusq3SvbvFZHxMT2Wg7ff3U+/
	RlgFOlGDznxmi9EuY7rrIrH3Txjg5g+6mQ==
X-Google-Smtp-Source: 
 ABdhPJzKQJ2wMm/vkMzh6g0r+gXnYbfxXRlz3FHz36nO4FTiNZyLllCzQJh36siIJJEe3tlY0ybiiw==
X-Received: by 2002:a1c:7e10:: with SMTP id z16mr5067844wmc.141.1634039837127;
        Tue, 12 Oct 2021 04:57:17 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:d206:d72:2579:f3])
        by smtp.gmail.com with ESMTPSA id
 196sm2449102wme.20.2021.10.12.04.57.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 04:57:16 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bootchart2: Don't compile python modules
Date: Tue, 12 Oct 2021 12:57:16 +0100
Message-Id: <20211012115716.2755827-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Oct 2021 11:57:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156875

"make install" may attempt to compile the python modules but it uses the host python
and host paths which means the binaries are not reproducbile. Make things consistent.
If anyone needs compiling, it will beed to be fixed to be cross compile compatible.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
index 974faa3b3f5..f44fd6455e9 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -131,7 +131,7 @@ do_install () {
     export PKGLIBDIR="${base_libdir}/bootchart"
     export SYSTEMD_UNIT_DIR="${systemd_system_unitdir}"
 
-    oe_runmake install
+    oe_runmake install NO_PYTHON_COMPILE=1
     install -d ${D}${sysconfdir}/init.d
     install -m 0755 ${WORKDIR}/bootchartd_stop.sh ${D}${sysconfdir}/init.d
 
-- 
2.32.0


