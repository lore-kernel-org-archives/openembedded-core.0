Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BDC8C2D0D0
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 10:43:09 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.69899.1718966584321422514
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jun 2024 03:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gei5dYcB;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a6f04afcce1so217462366b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 03:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718966582; x=1719571382; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fjaawwy+dTYvdP6O9e7ZY8hEBAQzMJK4eTVcsipVR00=;
        b=Gei5dYcBWXOaKe1dHMTCAVXBBDk5j6YhwMYI26Qr+luXme2clXI/CJ2iJZB1fuh9Vr
         eDGFC8cpqA3UJpLK04cv1/6njidu4t5Cf9ws/IV5a24nHombjQiR6BNdGHTiSnK0p1Y3
         Kn5Cy8rtf2EyU8lpSRTglAgOuKKDDRfsmj+3ZaPLMoRglKKJn7TknJDF9zLvLlR2f8b/
         7i7xnvHjwJilIfK9IbhSWfPZZpPPBsAWcklCW+dS3LB+EizYxKEW7nH+f8xgGn273eXO
         AGKWzL8YfkvJiJZgqq/6kaisa/rOFch8LkwCR7VU8ICJGDdjxr95ldgd9AdcEFGOdxTY
         lERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718966582; x=1719571382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fjaawwy+dTYvdP6O9e7ZY8hEBAQzMJK4eTVcsipVR00=;
        b=pcMXBZVMvmoo6T1BWLXTLUkvo9LKVkD7v6zOfDhsRE2yGVSiIGgkGsvS5Fl9TqY6uc
         4IcFjzAdey1KF7Idn4tXdqAq8EXsM8Rgq3/j1KNmNV9jANm74/OXRfkNSGYlW9iqMLv4
         GS4g0MJNZGL9aVgi/rExx9dARq4Ai9B0UZBf152DKFVaWEFdKOi2Hgiyf9I5j56V/pdk
         TZrtdRGhhmOjF6Zf38DJ/zbGzwsZEhipbNw9gbNQMruevs9Q1R6X/+2VcHfRg+TL9f0w
         jX2k6DZOg42wbd6xEEDVz/LJ3FjzKK5+Nl7UARna7pLBuKGMLmppQjld0WQMWUTsuU3c
         yKDw==
X-Gm-Message-State: AOJu0YxmqGPqbOUMNdwEmom3XEHvby1+/6gfVZZVSRNn2LPAmGlYIOvd
	xbrqDHwqfU2NY25C4tbf29H0bSvyY3hx2pxNmudK0iJ2o2ZlVMsgvaUc1w==
X-Google-Smtp-Source: AGHT+IHDg3Ikz3MKq5diEPzSIIKN+xrWKa00/oPnW2sdbvRFElJ9VTULwNOUiUZ8LTZFRZRzVOmDSQ==
X-Received: by 2002:a17:906:2602:b0:a6f:56d2:8f0d with SMTP id a640c23a62f3a-a6fab62a1afmr524108766b.17.1718966582642;
        Fri, 21 Jun 2024 03:43:02 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf560addsm71378066b.175.2024.06.21.03.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 03:43:02 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/11] mesa: rename mesa-gl on recipe version upgrades
Date: Fri, 21 Jun 2024 12:34:13 +0200
Message-Id: <20240621103414.2842509-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240621103414.2842509-1-alex.kanavin@gmail.com>
References: <20240621103414.2842509-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 10:43:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201015

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/mesa/mesa_24.0.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa_24.0.7.bb b/meta/recipes-graphics/mesa/mesa_24.0.7.bb
index 96e8aa38d61..0b36d8d5869 100644
--- a/meta/recipes-graphics/mesa/mesa_24.0.7.bb
+++ b/meta/recipes-graphics/mesa/mesa_24.0.7.bb
@@ -1,2 +1,4 @@
 require ${BPN}.inc
 
+inherit recipe-upgrade-additional-rename
+RECIPE_UPGRADE_ADDITIONAL_RENAME = "mesa-gl_{pv}.bb"
-- 
2.39.2


