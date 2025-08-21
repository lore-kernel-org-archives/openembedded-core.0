Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79BB7CA0EF8
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 06:45:49 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.3231.1755758741183143415
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 23:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U/8vnBzo;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2445826fd9dso7793655ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 23:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755758740; x=1756363540; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsazSvrC+YIY9t8Dq1EY1tL7jVpP0b5rOkOXy2GubbM=;
        b=U/8vnBzooREd/3dApPirh0rdBUkRJ3OVAH4jJd5lf4+MiZ5oWLzIFQhfluAD3Oxq82
         YEsz9UVnP62VvrbIlG/iFZzn2qdrHvWn/kFwfxzIMMqWpeVawDpNR7iWbRRLVaiw6bMt
         ZWSo/Eblms9NaK1dyAsq4DQQhawfIBJrnOMzNNWjinyCgUypaefSWNhIvGvXiqSzQZUQ
         KQxfftqcDTAcMajdWtYR865vW1ZyGApN7WmQLqLNlKQVljaTURXNh2w/3cLX+bDodfT7
         49tfajLB0hxxS0zKYqICrgaxh6e1ZhPC+4qvt95oVng0StJ3yVLQ7Id5byvSvk0NKh2e
         zwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755758740; x=1756363540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YsazSvrC+YIY9t8Dq1EY1tL7jVpP0b5rOkOXy2GubbM=;
        b=oF4QOLaAnUERlyT6AfY8Mh/BafiZdH9MB3PsbyMF7hlJ/Nxi89GAinXqR0zjGwVboK
         GS8CEv6nO4LmdIb5rkMMz0+UGlFEwPSZ98t27r2qpKp0dCBQAJyvPnSmPtXTP2n5RmT8
         xBhVRJA0IAGMXsqcxjAbPkS6f8jzUM8+Hmr7ZJqqYTvH+VR3jHDn+PzmVsrZ50TgoqmB
         WOQTFhEX2QS4/0fg9PXipjVZm6CT/5som3jVboW4mCdYQaJiMeg/TqfcCfq0xhJfbfOH
         tocIQzGbaIa2EN8TGYwh8L0+Rk++zd8WpXvSnMZsx8o4CHh6UZNQpnzsYI4O9MCWWece
         2vRQ==
X-Gm-Message-State: AOJu0YwMlqoon5AK21kgIgcQslRpSqDGJlbu5ZDmGcNk7WcjErfBaJA9
	3ie5wVo3PxPDCPbKQnVzTe61CSw9ISlIrEFSJJ1BT8RGkfDk6XBi6fUyZS116jFW
X-Gm-Gg: ASbGncsVHN2onGI70D8nzdPxDZUEFNaf4WL3QYNEeNOjlw2BTFJ14JuPlVKba5biLMa
	EtZHNgYSXN4eKiVah27ePG8axpBBc+r6LQdZD/qAdEnXtTBicgmlUQVRxA1teGl3Uwnetf/6Abp
	ecfgOZRLpCiy8xzzhsBL6mPGSh9YUi34BEgBCdSyNQwvn2gAnzYkRe30ovSmsI2WYSO5gvRV1vc
	0URDQvsWXw+koehOkP4ojoFnEJ5WLoBuX4y4G9Ms8m+mzodoW+wEbfhTs7zoZbtZSzTZO08AnMm
	oztFRyjD1S42urPA3iOWaKV7OVmxHEC9AiteTkP3Oihfia7eikQPuN4Q2KOUaWZhx/0vi9BVUMB
	rzPUeoX0c/RyFGBr/NenfRw==
X-Google-Smtp-Source: AGHT+IHrXnsKVSvNI2YEK+bhACMU+sxTjnlKk4y+4TcevxS+6B+gxzxQTWrdOJsBxovuoU7la5Snfg==
X-Received: by 2002:a17:903:124c:b0:224:23be:c569 with SMTP id d9443c01a7336-245fec03a92mr16897235ad.22.1755758740250;
        Wed, 20 Aug 2025 23:45:40 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::adc2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed35d778sm45876685ad.49.2025.08.20.23.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 23:45:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 9/9] python3-rpds-py: Upgrade to 0.27.0
Date: Wed, 20 Aug 2025 23:45:26 -0700
Message-ID: <20250821064528.754633-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821064528.754633-1-raj.khem@gmail.com>
References: <20250821064528.754633-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 06:45:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222217

Allow packaging of wheels for riscv64 architecture

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{python3-rpds-py_0.26.0.bb => python3-rpds-py_0.27.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-rpds-py_0.26.0.bb => python3-rpds-py_0.27.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-rpds-py_0.26.0.bb b/meta/recipes-devtools/python/python3-rpds-py_0.27.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-rpds-py_0.26.0.bb
rename to meta/recipes-devtools/python/python3-rpds-py_0.27.0.bb
index 3fd7701f8d3..ca2122f8df5 100644
--- a/meta/recipes-devtools/python/python3-rpds-py_0.26.0.bb
+++ b/meta/recipes-devtools/python/python3-rpds-py_0.27.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/rpds-py/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7767fa537c4596c54141f32882c4a984"
 
-SRC_URI[sha256sum] = "20dae58a859b0906f0685642e591056f1e787f3a8b39c8e8749a45dc7d26bdb0"
+SRC_URI[sha256sum] = "8b23cf252f180cda89220b378d917180f29d313cd6a07b2431c0d3b776aae86f"
 
 require ${BPN}-crates.inc
 

