Return-Path: <andrew@fernandes.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 558DEC27C79
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 23:27:09 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.73431.1718666826040029838
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 16:27:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fernandes.org header.s=google header.b=ceUNUrjy;
 spf=pass (domain: fernandes.org, ip: 209.85.210.169, mailfrom: andrew@fernandes.org)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-70435f4c330so3968348b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 16:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fernandes.org; s=google; t=1718666825; x=1719271625; darn=lists.openembedded.org;
        h=date:message-id:to:subject:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rTzzDW70R0gI4XFXkozQK4lo2zcILYVp8d04abXo49U=;
        b=ceUNUrjyvG8hl+Esgu4c43+C39wdG588WKUzU2NuLzXMLXK6Sli793Hk+vabHLDvA4
         HBme4M1KalqRXwLRHKHjOVTaNYatQjdjV61tnzaRP8gAG7RUmBQlwCY8r3ODnDl7Qs2l
         aZqTWW2vCtL0ZON2lk+4zzgYKPcsE7/2ucD2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718666825; x=1719271625;
        h=date:message-id:to:subject:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTzzDW70R0gI4XFXkozQK4lo2zcILYVp8d04abXo49U=;
        b=aGZxxXrT3RWhW7v3cydGe9YIA35YlmWWlg58FBnRFAzOiNhgAN7sW+vlyM5PDhGixO
         E1nMKMYWr7VkK+SQm5+ea4qHrUV3Wh62AR8ztRyZvScPfuqgVNd9zsDd6MdpmjvqSSs9
         7kCSdW2oGalFLBU7m1rFxD+fbMykmcPGBqfbg1but6A62UaXyg8woYhFHWy5ev61/Oq4
         6LCYWbpu/SQpVb7rDgKzd19luz6ZwBoemOW6PlGddzXQzqa6O4sNak2yRTNASvLcdKcs
         WUgf1WIeTO56UTbu7o6KCAMGykHEah+R/06eVVUXL6wdC9FNaZvh+N8iTtjfGEKpqOxn
         ETKQ==
X-Gm-Message-State: AOJu0YzSqqcdiBdq2cd+z3PgWjsD0J9vk7wXO7+CWwlJPiXzIeHxLwBF
	osnuVzvYQ8oAYhMpx7w9AB4RgVDwc/3POZSCCF8L9pwm6yPdYD+fGgx6Kb3g8FH5w0oqvAPvsM2
	Nvw==
X-Google-Smtp-Source: AGHT+IEnQ7kSFnIyPQBkxRX0ftwitByJCcAY4AozMpA2/VNeRw01vLqAA9XIWUPaOV5B5Z50Mz5PEQ==
X-Received: by 2002:aa7:9f5b:0:b0:705:dd44:ae8a with SMTP id d2e1a72fcca58-705dd44b05cmr9897528b3a.7.1718666825464;
        Mon, 17 Jun 2024 16:27:05 -0700 (PDT)
Received: from nexus.fernandes.org (nexus.fernandes.org. [2600:3c01::f03c:91ff:fedf:3b2a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc96eb9bsm7874845b3a.81.2024.06.17.16.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 16:27:04 -0700 (PDT)
From: Andrew <andrew@fernandes.org>
X-Google-Original-From: Andrew <andrew@nexus.fernandes.org>
Received: by nexus.fernandes.org (Postfix, from userid 1000)
	id 1F10DA847; Mon, 17 Jun 2024 16:27:04 -0700 (PDT)
Subject: [PATCH] gtk+: add missing libdrm dependency
To: <openembedded-core@lists.openembedded.org>
X-Mailer: mail (GNU Mailutils 3.4)
Message-Id: <20240617232704.1F10DA847@nexus.fernandes.org>
Date: Mon, 17 Jun 2024 16:27:04 -0700 (PDT)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 23:27:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200852

Fixes [YOCTO #15513]

When built without the wayland feature, gtk4 does not
build due to a missing explicit dependency on libdrm.

Signed-off-by: Andrew Fernandes <andrew@fernandes.org>
---
 meta/recipes-gnome/gtk+/gtk4_4.14.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.14.1.bb b/meta/recipes-gnome/gtk+/gtk4_4.14.1.bb
index ce733769a5..ae6fdcf604 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.14.1.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.14.1.bb
@@ -16,6 +16,7 @@ DEPENDS = " \
     graphene \
     harfbuzz \
     jpeg \
+    libdrm \
     libepoxy \
     libpng \
     librsvg \
-- 
2.45.2

