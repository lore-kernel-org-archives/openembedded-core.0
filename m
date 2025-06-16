Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A40C71155
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 11:56:25 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.23292.1750049235642207684
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 21:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nyz+3up2;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: nmjain23@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-23636167b30so34979475ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 21:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750049235; x=1750654035; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yZY8wLaiDG5HCn3cqg0MF3xtJzkNJuIE4FLd2lU8jJI=;
        b=Nyz+3up2HUV4eLEUaBz8bsybje6DaaS7XXLuvZgo8heFVjkpp0Z7Bhir+dQvNnIOxd
         7gBIeKT339zF5rV+jLA/75nvujjNUFp7CgEtcbM2E9m3TbwIkTR6D7fAEKh2H4pzGdj4
         syITQlLXuO+sxTx6U2Z/qplhvVfU2lYNCQGKtr6GGGzLwM7N0wTaaugMJLZ8KssXjJWk
         C3kg974QVga3kv9S5ElG5AS3yiHtBPwEhjxFY0wCUnHprJMyTB7qLfe0qbzXCvRgT0rb
         slZfCjAfFOwXDVDznk9VRDgl+SNYNGel6YVLizNJOcHWg71UfJQ+d7TJdXx+IObDMRda
         HS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750049235; x=1750654035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yZY8wLaiDG5HCn3cqg0MF3xtJzkNJuIE4FLd2lU8jJI=;
        b=JgH4S/YrgxAROuOTRRCThESvFbEoPjWnsO+J1Zb1JRZBa1HvRjMSmbZJBq/EYT+xg/
         31ddy8A+RTbgRJyRpwQsTeUX4LNqalc5TexP/TSsXWJG2rbPUKQm6ClX8ORc5wE5ctXo
         uppZYjuiiwHwIfQoSdiOTBH1eWQJ5ALaXUx4LFasrnxL4Zoo8qjYqIeAl0glLJbo3vIo
         rn3aH+OSB6xp3k3724Og82rvYqlKv73oBOVfI9VGYcig200581O1RibAVxxR44e3JWJU
         UvnIhLEyLfA/vrBEvc8qmH8ci8VAi8OPCb+hNUwu+aPbB7js6LHYKreTBm+4en3fNi8n
         tnZA==
X-Gm-Message-State: AOJu0YzQaGCdQtVnNsbqkflusNtWb1cLNaJZ6UHOOiQY2FgBSV/nPpJH
	8duzcsWG+DUKPyhGvkWBZ4HDuuRDdXp0xGU8aN7vTFmzd0flIhhgKF5/pui80A==
X-Gm-Gg: ASbGncveiMNsFg6LUpQU6eDH8nCm2OZXJHTd6b8TA651DZVqa8jnuTOXg6EPpRI5sXt
	6r1cZrQMby5zvfx+DJPu7onVV100jqMHROUfm5MJnEVEQBhe+QqvlhB9jnvW/zN/ezD8y8oyc8G
	NZY1rbFPmntlE8TCD2dsw4lKdlAwqTe6+/SiUcsekEul02xzpLFO/RmfJgnsH+nXdcwNfcfAYls
	2biBpOMcpAGoDh5DmM/Irg/bdd89LQjFdLDw1D9ZgLnP37I3iTa70uPs0ddmbMJJZQ0Kgr/6oyV
	R0S55fklpxSQA5VeG3U716NPOi3M4ZzmlX6nh2cROIoVO6fVHFTJMNPFnjd+ksY27oo=
X-Google-Smtp-Source: AGHT+IHUdM/3TV04HE9dV5kPgAhEv+nBA6qVpROsyqTOl8xggf1A9MVqTTs5jlxHrXIQjqOodvEX+w==
X-Received: by 2002:a17:902:f68d:b0:234:8f5d:e3a4 with SMTP id d9443c01a7336-2366b32e4camr115989485ad.2.1750049234495;
        Sun, 15 Jun 2025 21:47:14 -0700 (PDT)
Received: from LL-3450L.kpit.com ([2405:201:6807:8e5:486a:d246:6c6e:6f5e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de78287sm52137335ad.102.2025.06.15.21.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 21:47:14 -0700 (PDT)
From: Naman Jain <nmjain23@gmail.com>
X-Google-Original-From: Naman Jain <namanj1@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com
Subject: [[kirkstone][PATCH]] ffmpeg: Add "libswresample libavcodec" to CVE_PRODUCT
Date: Mon, 16 Jun 2025 10:16:12 +0530
Message-Id: <20250616044612.3449659-1-namanj1@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 11:56:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218816

From: aszh07 <mail2szahir@gmail.com>

Currently, CVE_PRODUCT only detects vulnerabilities where the product is "ffmpeg".

However, there are also vulnerabilities where the product is "libswresample",
and "libavcodec" as shown below.
https://app.opencve.io/vendors/?vendor=ffmpeg

Therefore, add "libswresample libavcodec" to CVE_PRODUCT to detect vulnerabilities
where the product is "libswresample libavcodec" as well.

(From OE-Core rev: 9684eba5c543de229108008e29afd1dd021a9799)

Signed-off-by: aszh07 <mail2szahir@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Naman Jain <namanj1@kpit.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index 4b99c0fa21..3dddf50a63 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -231,3 +231,5 @@ INSANE_SKIP:${MLPREFIX}libavutil = "textrel"
 INSANE_SKIP:${MLPREFIX}libswscale = "textrel"
 INSANE_SKIP:${MLPREFIX}libswresample = "textrel"
 INSANE_SKIP:${MLPREFIX}libpostproc = "textrel"
+
+CVE_PRODUCT = "ffmpeg libswresample libavcodec"
-- 
2.34.1


