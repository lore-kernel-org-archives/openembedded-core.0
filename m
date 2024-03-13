Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6666AC54E68
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 17:33:47 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.2033.1710351222338509104
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 10:33:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BBSGXad6;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-413ef770363so665185e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 10:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710351221; x=1710956021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z05kvBgycTAQaHDNJT4Ww5+ks6zFl7WLzPOuNgIn/LQ=;
        b=BBSGXad6T/R4/Dc4VBYOAnSAN1W0TRidaxwWqshM7/70v5dDDDb3psBgdU9epDHt4a
         7GyPOpNP4nfXjXlnGUiI+iKKPPOXw6CZ54uBab/DGMv5ITve4YJGjQGNfvX4Hzf0RGOa
         TPsO3RTy0Ilj8aBfiGM+VLKXn7YllHBCjwSz+vfMAYInV/uofADkg7/A2oh7Y3iJasqJ
         etKKZs8Nm95l114NrC/fFkD5VehsHn2qekI2to5mTJMAFhuZZZjGzpEH8A7wGy7m4BoB
         CHt71fThhIpYjrjwZtUCjM/Lh8zSmS9Ej4LxG9Nx42DvcU/YCcwS8WCmEWBWW3cJ1wQ4
         5JXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710351221; x=1710956021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z05kvBgycTAQaHDNJT4Ww5+ks6zFl7WLzPOuNgIn/LQ=;
        b=a1ZJwpJL0Geu4CMoZQoH8OXN0xB1XiDr9aJ3sb3wsuivOJfyKsDBiAC3A7fodC5PDj
         kYcjI9thDrxPGcnZEV08Cc3ZFU/6w1ewEK5zvWgqmf/SYJZddwgooauq+P+JPbPCTMkj
         76RvrE9MSKORpTD0DnI5dRf3Do6QlQePd3t02u5FGfw3eqjT8u/vy8wdLOZveCMpVG6h
         ui09SYos4GsCa2ehBBHvAx5zkoNNl74l159WCy8neGpt4p9JnNfhBZDwLdm/zJKuuaJT
         xLlhLBobI7mK/VwLD3eX7FBD5luL2US/ijiDAbBBkj8XZbx5q3ygbaTJ5/twefU7NqNS
         bWtg==
X-Gm-Message-State: AOJu0YwfImnaxxvsfiKLckTjms3ADG8tecSpXF/RbkljgP21rAQbiXJC
	l/Q5ix9thx8Du6DEkA8lbxJc71eW/tnTPJ4MqvXJHkcP8pwtKq6K2shHe+/G
X-Google-Smtp-Source: AGHT+IHsa+X5SKgHIGdbGQqk5pjfO1XB8Gjyh7A3lctkr4ZeR9UVDkyXKiirwmY1p6FHpLEHkwKkBg==
X-Received: by 2002:a05:600c:548f:b0:412:d149:254c with SMTP id iv15-20020a05600c548f00b00412d149254cmr500418wmb.17.1710351220762;
        Wed, 13 Mar 2024 10:33:40 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l5-20020a05600c1d0500b00412ea52b102sm2989710wms.34.2024.03.13.10.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 10:33:40 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/21] attr: update 2.5.1 -> 2.5.2
Date: Wed, 13 Mar 2024 18:33:17 +0100
Message-Id: <20240313173336.3900178-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240313173336.3900178-1-alex@linutronix.de>
References: <20240313173336.3900178-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 17:33:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197054

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/attr/attr_2.5.1.bb | 5 -----
 meta/recipes-support/attr/attr_2.5.2.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-support/attr/attr_2.5.1.bb
 create mode 100644 meta/recipes-support/attr/attr_2.5.2.bb

diff --git a/meta/recipes-support/attr/attr_2.5.1.bb b/meta/recipes-support/attr/attr_2.5.1.bb
deleted file mode 100644
index 5c5f7bcffb4..00000000000
--- a/meta/recipes-support/attr/attr_2.5.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require attr.inc
-
-SRC_URI[sha256sum] = "bae1c6949b258a0d68001367ce0c741cebdacdd3b62965d17e5eb23cd78adaf8"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/attr/attr_2.5.2.bb b/meta/recipes-support/attr/attr_2.5.2.bb
new file mode 100644
index 00000000000..2110c6d8853
--- /dev/null
+++ b/meta/recipes-support/attr/attr_2.5.2.bb
@@ -0,0 +1,5 @@
+require attr.inc
+
+SRC_URI[sha256sum] = "39bf67452fa41d0948c2197601053f48b3d78a029389734332a6309a680c6c87"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


