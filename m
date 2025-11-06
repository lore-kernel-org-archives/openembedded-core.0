Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5882CCFA13
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 17:08:30 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2835.1762448901677247058
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 09:08:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bmen7qUf;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b726997b121so340715866b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 09:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762448900; x=1763053700; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FdvSs3Mql3eirF4VWojvsnzRN5E6GksT/LGlfp7NltM=;
        b=Bmen7qUfZ4h/F+K36Q6p5J/wQNGoPK2bUecwt9EYvcZd88tkPY0T8jdIY//UkJB2ej
         LKV2ompFtkGzT8b2FWKd63LAsvfJ1RDqvDwQheaVWu3EVNo3qHC2T7ZD6t7rxg0HsK7z
         MzkY4C13B2nJlwABFlXY3yW9MeCikxcR94tjl4vtM6J8FhYtCVlU90Ziu5+mTQAdDWNU
         Wy7ey1B8bAQwdA97wzvSKSJvhMpTOxfenPkWw5eFn9wKRG/s3yY0Jr+pcnNEL4X2OevK
         bV7Q2EMC0sH1Y/I+iO9c3j+jfcO4sfC9TljLFQRHO46TAkkhc6DcM7EqWqZ1XMQ/ORGy
         Y33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762448900; x=1763053700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FdvSs3Mql3eirF4VWojvsnzRN5E6GksT/LGlfp7NltM=;
        b=cbz2qcKhfpVfQmwX7BrU/kqB1Jom/oQye60vstNgc7uRV43swa+d1kikj/Vq0wE2Hy
         1+2WREAHf4Wkjcjp+R0I076UIaZVK9y5DxbsKe/8lpRXOvbWt/ir7+Mscld1sEXC1f20
         gWA8rwqUOwbZ8prwWvZ1CR8fEkcFtGtdixsSJHo5V7767tnRCflC1HD1n66TsSxVm8p0
         6bDrBVdF7VWzmnIStGxB37Jfdg8wdY7c9qO8JvKI+AtbVsRoIbQGBXM0WIEjzi+DSk0S
         h9ZPjzg7OX3QFPWrNjMxSS9kDX+eweVXLOWpUXXIzg883ReRxgTR8+8G6W3XEr/FtBU5
         glsQ==
X-Gm-Message-State: AOJu0Yx8DwoMJN3qs0zOD0mDz1YkeqTUCpE5fQstOh9rKFogh7bfM4de
	V2KV+WhUfNAESQX255H43A65uc4Gqkl5CR0F6pejNbM83pNKhG0FiGDOCeXspQ==
X-Gm-Gg: ASbGncu8uv3EZWvs8SytVpiCvBUor0INaYjA2YBar3CaM44M7ZNgDiy26LO3glEQ1z/
	n9y5Cm674R8T+ksYUKlhdJbOHLbzPyoVtI6kJDZoEEgXc46s81ZacVzoBqnkugOaTTGTI9guO00
	yHDOpomu9uGQdxB6ajLih/LYmvH0RiCYk+0yp+zANe/a9ygm7yEfVNE2zScnydNh4mbNSQKb8K+
	l6TmZsghbMtJ1cVQB9YbIFlnoMJOk2OPrnYgiVdS5RoqVw916J6Sbff21oeTdRHf6GvQuQwb+56
	PiMH0F9n9lop5mUxSDA6AGYYS2AU8Us73Q2H3l7pej0a8W982upiOsJ8Z3H5jwFwnLYoTnSe/7/
	JoZNjn5qmLrypHuY1b15oO/Gsuz7/971JPuXzMbd5m8RHIsnY/Lv8XNXpsEKWwLj1i9ctfEkQ5K
	A72Ufdq9Wb8+Apc6y9g4nu/HoYS/Iabsh9YaPa
X-Google-Smtp-Source: AGHT+IF6U4VteJzak/nTFyEetNmGhrJJf+09/NZJypucjW0fqyG8oBnCuB2Q3DTWScivQWrht3OU3A==
X-Received: by 2002:a17:907:9309:b0:b3f:331a:a982 with SMTP id a640c23a62f3a-b72b95533camr41795566b.6.1762448899798;
        Thu, 06 Nov 2025 09:08:19 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa25454sm3905766b.75.2025.11.06.09.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 09:08:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2] meta/files/bitbake-setup.schema.json: add a definition for bb-layers-relative
Date: Thu,  6 Nov 2025 18:08:15 +0100
Message-Id: <20251106170815.2439421-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 17:08:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225982

From: Alexander Kanavin <alex@linutronix.de>

Also, adjust the description for bb-layers property.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/files/bitbake-setup.schema.json | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/files/bitbake-setup.schema.json b/meta/files/bitbake-setup.schema.json
index 5101b0de53e..6e79bd6018a 100644
--- a/meta/files/bitbake-setup.schema.json
+++ b/meta/files/bitbake-setup.schema.json
@@ -39,7 +39,14 @@
                             },
                             "bb-layers": {
                                 "type": "array",
-                                "description": "List of BitBake layers to include",
+                                "description": "List of BitBake layer paths to include, relative to the layer checkout directory",
+                                "items": {
+                                    "type": "string"
+                                }
+                            },
+                            "bb-layers-relative": {
+                                "type": "array",
+                                "description": "List of BitBake layers paths to include, relative to the configuration file",
                                 "items": {
                                     "type": "string"
                                 }
-- 
2.39.5


