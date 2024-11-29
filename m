Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D68ED6EC02
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 11:54:14 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.114641.1732881251304921040
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Nov 2024 03:54:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B3exIQYY;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: festevam@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-215513ea198so214515ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 03:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732881250; x=1733486050; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oyuLsSSnAj0XkmQIYm7vplHfeQvdn8S2tkYVF5rHNYQ=;
        b=B3exIQYYXenNheXw+9FSIAb/UA4qV3+Rlpl3AtWcq+iZUxy6EN1Whb14FnwwAw97XB
         twNuolTEZHWNoIsdbqF2MeuRw0CRHK3eu+PoEBcTn48ju+YnpXbGeP83Iho5bWqKpH5g
         xFlxKwLnWhtzP1fLPVsN5osJ1SGVHFCGsroae/VDfUlYMTh3MalAnRNlj6PeHmawDinI
         pP7id+D5p0+Vdy1551MP44NGVlCDbNCmvgJQIToqdn6HlwZLKXSVm7Xr5pDPmgSiWBha
         fEZCV6pvfFU5DMCoaa05f4cHzsHBac1Qud7DS905kxahFBKQFTVl/4+rRFmkpU3xqJRN
         NeWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732881250; x=1733486050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oyuLsSSnAj0XkmQIYm7vplHfeQvdn8S2tkYVF5rHNYQ=;
        b=Pc5P8j0E6DHliJVmoqp7/h/RBUaRT00bavy9O8cgbuVFlnoVzRLOcl9twdHc8iPXq8
         nYTQ2N3JET8jIxsyp492IpQSheh5b4lUsqSxYckx0k5JZiD+nzawqJjunpiB6h5vsfVC
         CcF/SeR38V7JapvUKWusvdJ5o0e1sqkUzqRihlH+MOikrwZsjKvf0RLKhMAMd8U+gAoM
         uM0D5mxyDBSnf43v6mC47l8o0+s0XVfIiT1mcQvcVzDzoVB+T+pqRuUFdzHgpa5qHguX
         K7khRXU3Tz9VfxweJLquXS11WloHTDwqkXWudgVOcm7KBhYpBs0v/eB8ZOAIwOWMcDxM
         wNkw==
X-Gm-Message-State: AOJu0YxpV2uiazKqHch/rSypLhptwGnYw2aHrAJ/jBlRdfFoTn0LFmOR
	zXpU18jAQtGS1hztFi4TwOnutUfB+lBDGwCxfgMeL+5+kEGZ17H6hP+QMQ==
X-Gm-Gg: ASbGncv4smMmUmgYOqfQqoPsktPlZ6qz++PkmOlwjpgta+EYCNlod6PRbK+6TJ5UkJi
	Z+aluXSqfYAxoo8xRzm1Zu1Dr3Uzbkvmb8dJ0QGqb06CORQ53ilFD60SMIiQMLdnozCPwJRR3Hg
	jzJGPpqJ8kpm0YNLVMwOGwCaek5kDbLupr/u4trU3onkEhZ0R/BjXIHKeG314sOobxZDPPtdAZx
	E/owca9pZfmWrFZ4bJAzsIIXw283jebbPdq7QBnq+ztb2Q6FM0G/6KC8Dm8QpL1
X-Google-Smtp-Source: AGHT+IH7Ea2oDcZZ3fvzp+DFS8BS8LA7eUP12tOzhS68B/e0Zd1NvEW3Gp5vrSQWvsbUJctTx7nkpg==
X-Received: by 2002:a17:903:41c1:b0:20b:831f:e8f7 with SMTP id d9443c01a7336-2151d3168cdmr101065715ad.11.1732881249718;
        Fri, 29 Nov 2024 03:54:09 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:1ee2:4ef6:4759:d260])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72541848924sm3367845b3a.180.2024.11.29.03.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 03:54:09 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] kmscube: Use COPYING for licensing information
Date: Fri, 29 Nov 2024 08:54:03 -0300
Message-Id: <20241129115403.111434-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 11:54:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208013

From: Fabio Estevam <festevam@denx.de>

Since kmscube commit d874c7811854 ("add license file"), the COPYING file
has been introduced for holding the licensing information for the
project.

Make LIC_FILES_CHKSUM point to the COPYING file to make the licensing
text information more explicit instead of extracting it from the
kmscube.c file.

License-Update: Point to the dedicated COPYING file.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 meta/recipes-graphics/kmscube/kmscube_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 0fcea0702c..7035dd446b 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 SECTION = "graphics"
 DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm virtual/libgbm"
 
-LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2a12bf7a66f5f663d75186bf01eb607b"
 
 SRCREV = "311eaaaa473d593c30d118799aa19ac4ad53cd65"
 SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https \
-- 
2.37.3


