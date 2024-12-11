Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D7F8E77185
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 21:59:16 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.6558.1733954349590699097
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 13:59:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bdiXIveU;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-385ef8b64b3so5836596f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 13:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733954348; x=1734559148; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4hjuVLZ/5K/WaoiI93KOQT7qScWedFSOcLBYP6wqJc=;
        b=bdiXIveUIUGdpqgr84H6ACoRgY+jBUxxxM90eSyqZrLv5KxLX4QSGjLemNgSIH8sM9
         qV8dnSfFq01RZATIf28QlpAcwEhrpfPnHoWYHwaXbE+KlKx6ivARlKqFqoUyfc9vrOHh
         vzWELQVjT10/e0nMJxeDEArwpWfzIXjJ0gu2DlrUwlBz5WAEvNdLGQaypyHS8R+Mr022
         ZQXFQRODwliGxbxLUkMx0Oe5tumCxd9I7dImLlUFgqFLEjjxpr9sZJeQVQwovxcTEHcV
         30XAwh44MnDQDs2IZ7/6mNgfMXb/MOcbelf5kOEW/C/ZRyNyic4kFwTQapJ88MWXazjz
         rJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733954348; x=1734559148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W4hjuVLZ/5K/WaoiI93KOQT7qScWedFSOcLBYP6wqJc=;
        b=V3xUlpD0oYt0bM4JSTMn4yOpH3cuecI+M/xzdTN+0j39gqek0b1TzMxyYPXLwNlfbD
         krtO3NwUXZijHgtcgVZIyfgmt8Y394Bsdd9SgaOersewZLR5wTSQUj4eg+TLTPA3lSfG
         4rBKABWWM02R9QvCPhHpSCNWOmTppFqOlDXLzFqA3Zb8xUcity/dTEHQfyJworQnWd4V
         UHM7QhFZDQ/bnVNXobDLpvqjOatAssi2C49jimhK5JC10lQNnyVeZEXfdiU559lwzPUQ
         iFySfmFEdQCDoEpQVhWBlM29t9ReuMBjaJ/sfo//1WXWPbLrOvYqrzBoFj1pE7Maqpo1
         RYbA==
X-Gm-Message-State: AOJu0YxZMXrgtl0y5pp90vcAt8+2h0P9p30q3MgwlG7XNd9jwJDEKdAB
	qxgKBx3ijssdpYMVI8xHNiHn9A6R4LjfrKF0d8jTC4sEyq/PNa5wV32vYA==
X-Gm-Gg: ASbGncu4+BQRd3N4ieEliQQ7Wn6LT9Oru1E6876XnFwk/maCQ2mxm54FPtvt8whxE9d
	u0Tcah63q0mS5coRcVSjFIRVC6O8rZ+hyzal0pZ+2DJNO7zs9j5Me6gna9UgA+s76XVY4YAAbLp
	EfITmI6pZFC0QkFB1UFNPZr4N8orgN2jMqIrOcBW+oqSrIbV0DHyH5G/fmhvvd61K9rz5CALMmV
	eqReDfBsEClfwGAJsyww3nzX5emmcg2+EI2xMjfAIZfZozBA8djaYxttMufmiqkTQbdFA4BAA==
X-Google-Smtp-Source: AGHT+IEbehMb7arB28/gxP6Gpd9BQBMRe91lBIZNQyMI4+cqG3kDcv60qxrOVPFyxRROG5Z4PPGwGw==
X-Received: by 2002:a5d:64ad:0:b0:386:4a0d:bb23 with SMTP id ffacd0b85a97d-387876850a3mr956904f8f.11.1733954347573;
        Wed, 11 Dec 2024 13:59:07 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824c5c98sm2180792f8f.58.2024.12.11.13.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 13:59:06 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/5] dropbear: add dropbearkey.service to FILES
Date: Wed, 11 Dec 2024 22:58:38 +0100
Message-ID: <20241211215859.2187259-3-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241211215859.2187259-1-adrian.freihofer@gmail.com>
References: <20241211215859.2187259-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 21:59:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208613

From: Adrian Freihofer <adrian.freihofer@siemens.com>

dropbear.socket file contains:
  Also=dropbearkey.service

That's why dropbearkey.service got automatically added to FILES.
Since this incorrect auto adding feature gets dropped from
systemd.bbclass this needs to be added explicitly.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/recipes-core/dropbear/dropbear_2024.86.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/dropbear/dropbear_2024.86.bb b/meta/recipes-core/dropbear/dropbear_2024.86.bb
index e3f4d17896c..be246a0ccd5 100644
--- a/meta/recipes-core/dropbear/dropbear_2024.86.bb
+++ b/meta/recipes-core/dropbear/dropbear_2024.86.bb
@@ -129,3 +129,5 @@ pkg_postrm:${PN} () {
 }
 
 CONFFILES:${PN} = "${sysconfdir}/default/dropbear"
+
+FILES:${PN} += "${systemd_system_unitdir}/dropbearkey.service"
-- 
2.47.0


