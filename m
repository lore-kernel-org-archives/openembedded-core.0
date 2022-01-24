Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A8BAC433EF
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 18:12:23 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web12.603.1643047942832189204
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 10:12:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZPRMr+1B;
 spf=pass (domain: gmail.com, ip: 209.85.210.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id 128so16757223pfe.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 10:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PHpagOirH8FZLk4sMZi9BNXBytJZ0YaZFV+nd31jiXs=;
        b=ZPRMr+1B7XM7lbusK7Z7atnrwte1pjP2F5ubVYfYOHGo1YEK1I1BcbNKIIr5XYtiY1
         HbxFwIDVhXlqbrdRDS8Xaq0D7cazrMOdOi7K6tStRd3bgcWdz4//ymnJIutZ+hJaV6Dw
         zx1svapLchei3ZT+a2IoGQ6PBni/4+om4kYydelpAW2GPIXt/8a+w8qoB1ETO1vnGpJk
         g2NkhxWxF0iqfTCuZ5JYqfzi1sRSc0WbFukqzJcK639Oes6PJifvGGDhWLo1nIGg+fOo
         5WEWm6pMj0mH9GH2TCRkRzd898xwyussdj8E60oy25s+aWI/dzM+VM4EHT6UbbKZ/4Eu
         qkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PHpagOirH8FZLk4sMZi9BNXBytJZ0YaZFV+nd31jiXs=;
        b=JGlBEBxJqcownyb3MdSgzbZMj/R3mHSmx5Id8HCi2d2zxeR6TBbs7lh6LmPwyYcNMP
         Ekwm1d/wjZEfmTMUL7BDqZv1ZWyfxZkP0uGv9Io+kBBld7ABPmMxyp7GaaEv1bXERajG
         cLpZUFdR3TkbYUtK5dKUzWdOiK1xWLzN8FDzFhl/h1BXtERUI1PBAYPVEiMhHvcvVNdx
         mLoLLzD8yoyWW13cemuqJdBLair27PWC2QRbRLXrqbpQbJHiT08/2vjzTTPKfnYjfaXE
         HfqKl74CUzQCAUyohB7bG3tQdZuOKlyi4fSNpp1L+68f5XsjXEuEKugi/lztESDDF+ZV
         WS7w==
X-Gm-Message-State: AOAM5320OeAINP8VhUKs6ywqxlcrZ2cSwTE8KFhef7k57jAwgZg4iUwx
	U/tNQ2LefrERDSlbyddNUynSg2BqDA73zQ==
X-Google-Smtp-Source: 
 ABdhPJxIARAxY4p+N+gmiIzHm550GYnvATRaOmbI2xcYrtV1oDGHbo2ua1Mtohx0KDvUd0furgE3Rg==
X-Received: by 2002:a05:6a00:24c9:b0:4bb:ffe2:17c2 with SMTP id
 d9-20020a056a0024c900b004bbffe217c2mr12610376pfv.31.1643047942051;
        Mon, 24 Jan 2022 10:12:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b5e3])
        by smtp.gmail.com with ESMTPSA id
 v8sm6916131pfu.186.2022.01.24.10.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 10:12:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python3-dbusmock: Add native recipe
Date: Mon, 24 Jan 2022 10:12:19 -0800
Message-Id: <20220124181219.2764108-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jan 2022 18:12:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160891

Needed by apps like folks

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb b/meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb
index e64e343a1e0..4a857eaf5ae 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb
@@ -16,3 +16,5 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-unittest \
     ${PYTHON_PN}-xml \
     "
+
+BBCLASSEXTEND = "native"
-- 
2.34.1


