Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B80CDC433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 23:59:17 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web08.1393.1645833557247390964
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 15:59:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pWjg2eZ/;
 spf=pass (domain: gmail.com, ip: 209.85.215.178,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 195so5990103pgc.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 15:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0NizLoGnExkmOD3E1jsmbFv/ZLgL5Q9qRO0xUyaIaYo=;
        b=pWjg2eZ/xIYVeBERU8dIDfyfDC4ET9++EEjcswpFw7oBG+LUle7Ej3n2LXVY58c3Us
         xQh9+D0Ds54UcbHx5WNwYHLiM/a4Y3Yem+HZpyiJvwVSi3mzLhN0G51duZjBVdwxQFgN
         DKzweRsIlae4lUjh2UlP+apiJL/GxoqknkKoDXjQgQ3He1zd4z1kn91zoZgLaAsoKyOt
         bYrp2eE2uv1LplmWMB6V/xkAcqEOCUsAmuV5qfJ1wQ8qpGbQTuo2cJlW7K62Olpn5eot
         ZH9RSpRoI5n2KvIjcaAagOFs0hEQOu7tg9XKr17MVG0sZb8ds2Q+HLU60OgWuqXnFkY7
         +aVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0NizLoGnExkmOD3E1jsmbFv/ZLgL5Q9qRO0xUyaIaYo=;
        b=y7CBlBQUHkN5Ypp6owz0G96HU7NJbJbU2IBPkO2xl9a+oEKfv2TKtIjPw95Zq23YBQ
         6SJ2CbE7vrj4VWXe5S9v37pNL34IxrLUWfDVwBgfWEqHzCnh62Cv0gbuHR35GXBjC1v4
         9rCA08AP81K0rCEU0MTN/cN2eVgadj4LuF0ZazRf2OtyJgWtceXEvJimvmyB5+4TAR+M
         MZxR0o6h/Ezi+PKOJbQzTnEXQ1YWdDNUWgW0TkoJSxB03pzUuuOtIi8NeJlGf9yjMPXX
         dYYMJzdPzPJo/yP+eHploD0ZvFu1Ad9R6pV6AVdsjOlDFqpbLV6qsIgCRWredP5Dp+Gr
         LnVw==
X-Gm-Message-State: AOAM531B6l8Qtmc6P9GISSZIt0/3byTxzmsGPXzYnZ7fmdBF/nlcO21s
	lzvyBUeNSxWYu3Ef/+gJZ9fcsxoam/Q=
X-Google-Smtp-Source: 
 ABdhPJwFXO0bxnG9CRcTCCuFLxwfKGScETXjVzc6e0bQv3+osyDkCjt0xgPwQeoJ62uTREP5dHhBZQ==
X-Received: by 2002:a05:6a00:1a8f:b0:4e1:cde3:7bf7 with SMTP id
 e15-20020a056a001a8f00b004e1cde37bf7mr10296968pfv.52.1645833556366;
        Fri, 25 Feb 2022 15:59:16 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d615:a2e3:253b:5be5])
        by smtp.gmail.com with ESMTPSA id
 c18-20020a056a00249200b004df81f5ab5dsm4711550pfv.173.2022.02.25.15.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 15:59:15 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v2] flit_core: inherit setuptools3-base
Date: Fri, 25 Feb 2022 15:58:34 -0800
Message-Id: <20220225235833.671321-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 23:59:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162415

This helps bridge the old setuptools3 behavior.

FILES:${PN} has sane defaults in setuptools3-base

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Change in v2:
  minor grammar correction in git commit log

 meta/classes/flit_core.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/flit_core.bbclass b/meta/classes/flit_core.bbclass
index 0f2eec85d0b..8edbd654ff2 100644
--- a/meta/classes/flit_core.bbclass
+++ b/meta/classes/flit_core.bbclass
@@ -1,4 +1,4 @@
-inherit pip_install_wheel python3native python3-dir
+inherit pip_install_wheel python3native python3-dir setuptools3-base
 
 DEPENDS += "python3 python3-flit-core-native python3-pip-native"
 
-- 
2.30.2


