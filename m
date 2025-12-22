Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32583E6ADD9
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:37 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87810.1766434108272604045
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JQjKJi9N;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b79ea617f55so771259966b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434107; x=1767038907; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sLJhBn3jt++dNEraGPKInG1bjTiZ6Nbw28BvLgEvqd4=;
        b=JQjKJi9N+pd3p+l38ybwjRNnRG5oDyX8aYE+PSss1x6aWNAxfi9kYZUzjYNCq2pRFF
         /H0oMZqWHuRxsBVai5pybvjFyEjPaKTnI+mNkUO0qftmWzAByau+rjZB3Y4tgSuvHr7+
         HM4WzDGVBrJNZDxYWYS9ZIsiTQL7xHP1FQ2JCf9oE2tHrHVnLOXbhFgPCGFcrsKfJ65w
         hprRb2Og40n606uXryKbYLkulA0HBLvMV27ZXdexWC2W0WU57yOM6Gyjw8lODHDbFivw
         6xshZXvttYFQovNE4x7hQN3oRHbAmFzTG+c0O4MyFzKEaEQXZr3ZCd0v9CjWcwXBlTe3
         9Ygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434107; x=1767038907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sLJhBn3jt++dNEraGPKInG1bjTiZ6Nbw28BvLgEvqd4=;
        b=oGXzQ9fCBcl7A63Uetk1Y8yN9jW19t/ilwvIEVGLud2JB8STRYmSghB6vVOQP3a3JF
         NKKxPYNoHOo6odBh0j2isaIWoAQFoQf3DM7FqGS7nxRC8A4MSW0ZDRBxdnGE1q4M9AnU
         u5xOBFSCuUYwzl9jq5CQ43PdyXq5uekaUESk36hkv/IvA31uZmMBJKHB3bVuo08xfGvw
         wvaNu+3bEOzZKPKp4G8K7YUMGvM2FEcZWWMQS85ygFGxxuIdPFX0J/jOX4re4CVzURFa
         1rTZHkaTXL7Ujhenn2p9oNFq0s2KwrEHl47HypDegenhq7slGarE4rzNQoSu4IvdO2P0
         3Wmg==
X-Gm-Message-State: AOJu0Yy90BU0IRTuOBO99AcPlKsZw46sV5hG0Fd5rRTszZ1U/gxoGoPW
	GqYj7GwhLRuAf3llZJHKpOrjB1tzH6Ybs99lvQTO6/SCn72JSYFD9x/JeG+OJA==
X-Gm-Gg: AY/fxX4Ar0a0III+XzvzjiBTKNkiPYMQaDs9zINwmlKJsGRj7kXoJ7JXqCwfya3R7kP
	QH5tOcHvPpQghtWEHKK3arXibGdJvbqF8EeEsit09A7zhMs+pB/FKooGKleA/6aDpsS1Z0lbY0s
	gGeH8EOXaqZT7Y+JWjzDOoG27UGLlz+Et+LgnLtpLwSVr84oHx+UCWDGFkehiqHrN0cpZVQdbUG
	TyzRTs77i4zk4KMeZwGFLAwP4jZAolV4ysZOZxjIWiqK7O6my02vQ1RYy4gbXB6EdUgvh8a8ARw
	ilR8XqbkcVa6EcVfslpwatF2RaGZeX2+OexNjHmKoV8zAYPrkn1Tj+ILbuFGbaXt3k3krn8YTD2
	rhsMMQ++2xfYfMXbgZcqnib/soOHPM59bKc2jpFIpXI8yd5+H0nV/pmKXQQGsF7v6xLHlIS4kfc
	ieuqW1rfrhsQzvuQmDK+Y+8efElZj+XbSo8HtwytQebS4MTt8=
X-Google-Smtp-Source: AGHT+IF3bbCOzdrcK4FwkZkrAKaUso4pw00YKTb644+sgcyTQ/NJ3pwrixqU5/JThutHNV+Q602zLA==
X-Received: by 2002:a17:907:961c:b0:b7f:fd02:9b4e with SMTP id a640c23a62f3a-b8036f90153mr1373414566b.28.1766434106629;
        Mon, 22 Dec 2025 12:08:26 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:26 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 059/114] python3-hypothesis: upgrade 6.148.5 -> 6.148.7
Date: Mon, 22 Dec 2025 21:06:41 +0100
Message-ID: <20251222200739.2278706-59-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228384

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...hon3-hypothesis_6.148.5.bb => python3-hypothesis_6.148.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.148.5.bb => python3-hypothesis_6.148.7.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb b/meta/recipes-devtools/python/python3-hypothesis_6.148.7.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.148.7.bb
index b461e8f9b6..a8c0421025 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.148.7.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "bb0c67bff155b8d8cfe8fbc1f1218028f7e2f0ee7f24d8ccc89f4c14ee4e65c0"
+SRC_URI[sha256sum] = "b96e817e715c5b1a278411e3b9baf6d599d5b12207ba25e41a8f066929f6c2a6"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.3


