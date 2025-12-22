Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D68E6ADCB
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:37 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87813.1766434111455071237
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gYz44yY1;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b7633027cb2so787371866b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434110; x=1767038910; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCxy0OZl+Ca6M7FpTo9+8v4OvPUqe2srQ8uUm5NyCco=;
        b=gYz44yY10GvOTCCJgzjFjnhG8QlR1jXfQlAU6q40ZQEbtT1D2vnTpWGnmngNWeo7yJ
         CbuCY2l23tghfTX9/r6xfYoW/ooKpZiWi0a6UJF7dQLSFE8P5wfTn8UbNZLaTFRsB4ek
         P7aHVeVr+8aAlkaBhE9UixuyXnNSuSwLv9FRtaiXOuI7L2e0eT8bFz3cB7PNFB+P0p4s
         47RXY1m966IOEYrsW5P+VjYYzokHdyr9aAPkYY1ONffQGRZz6X14noGx93S24hvbZEez
         FloIuPn+McowXMrtpY1Fmlggm1IY1Ny0KDrnF5voCiK4E1J6k73aqf0eHqBnmpjfvRbz
         K1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434110; x=1767038910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZCxy0OZl+Ca6M7FpTo9+8v4OvPUqe2srQ8uUm5NyCco=;
        b=VAG5l1q3UYf9IE6KlkekhYAkQgBEVrLN2QiEbh79WqAscX4TlDJouV+OitLA4Ba2Wd
         5Njr1NQYQGGcDBUjgOyEahs8wdbmSqgoqJvUHpZbtbbbzx0/TOL4aKvpI7/qHGRZ7TVq
         efvG8LU7nxrQBk/rpWBxDIBMI0rH1OloBAFz+YoXWC99fddcn+lrLkFYvHdOd5289+99
         Eyyi0k4T1iG8+zngyk3BXoWi8AnxHM6loR0VTwZIBHS2wdOxTJESeNy5+frMtriptlNE
         wrBcdlChxISEqWn6zv8PCH4/I0qz59TOMzlYjDzKJ4i5W7Oz0iDdOYY6fTooQsRf77kC
         PJvA==
X-Gm-Message-State: AOJu0YxANsZBOfwX38NMa+9L8sUmft1AuRX2ZuVRbqYV5RnBSlAXcc2R
	qzJFJR6m8ZsbL95rIKtonpxQzWR/eDlgzO3rQnD9mVuSqSG3u2fFJSBJWjdziQ==
X-Gm-Gg: AY/fxX4Up7nRd5scF/iobDP1m3DloOFcdSSPEiCipzzH2ExW+9LcfJL2NiOJAT/g26v
	fIuLjfG7CE8ExH6PxpfutFZSr32aKCdGtQ6/FkZjXonFTOqyq5FWIkdm3Lg0lpAeBOBO2p7eX/X
	vWlpqyyHL/5Q6lGPVaZ+CQxlOfTXx6DDv48ugQjlXceKRLUJT+9LJ/4TcpYT/gfSCj2q66hyrhS
	WFWoTvEz4/zS3n4QR8l9JLTw8hs9IhL9It0gzXCZK9MNX1M8UGtoNC0J0MN5gIfvbR4l3kbO98Y
	OO+m7ZApwaT9ckJOh+0X3N4PMbGMXeTOyxbcKYWUE+ByWJwncQsLnWtG1j5EAvxNYcl6FJFFnPI
	TYqVq0Mf4R/C8SZjnex/6wB5/s0pSsGaeWhZHGIETuT95TdXjb3ardksU0HmUQIOczE//1eWzrU
	R3PCtWrJ5H4uY7p5rjDaoZBRecPz5KhIYxZrjAfcWacRa6eRY=
X-Google-Smtp-Source: AGHT+IGhvAcE4cwhkjm3Dy5uiz6KyXzP/+DUGy3e9k2rS0EdiBLxvJGqzSlOKJFuSD7wxF/yzDzUFg==
X-Received: by 2002:a17:907:e158:b0:b80:42cf:1157 with SMTP id a640c23a62f3a-b8042cf11d5mr845152366b.36.1766434109635;
        Mon, 22 Dec 2025 12:08:29 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:29 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 063/114] python3-pbr: upgrade 7.0.1 -> 7.0.3
Date: Mon, 22 Dec 2025 21:06:45 +0100
Message-ID: <20251222200739.2278706-63-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228388

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-pbr_7.0.1.bb => python3-pbr_7.0.3.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pbr_7.0.1.bb => python3-pbr_7.0.3.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pbr_7.0.1.bb b/meta/recipes-devtools/python/python3-pbr_7.0.3.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pbr_7.0.1.bb
rename to meta/recipes-devtools/python/python3-pbr_7.0.3.bb
index 6878fa0967..dee32aa885 100644
--- a/meta/recipes-devtools/python/python3-pbr_7.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pbr_7.0.3.bb
@@ -11,4 +11,4 @@ RDEPENDS:${PN} += "python3-pip"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "3ecbcb11d2b8551588ec816b3756b1eb4394186c3b689b17e04850dfc20f7e57"
+SRC_URI[sha256sum] = "b46004ec30a5324672683ec848aed9e8fc500b0d261d40a3229c2d2bbfcedc29"
-- 
2.47.3


