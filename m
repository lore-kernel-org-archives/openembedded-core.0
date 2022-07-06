Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B11CCA486
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 08:07:41 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.3742.1657094855035211929
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gBx7LAnm;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id f23so1404981ejc.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qbm3Zxieydq1L7t3UppVE5HIJiSb2Ivolepf56J4YKg=;
        b=gBx7LAnmF6OP3MHYgeUW8Qg8MF4j0INXliJoaCdrlF7I7WHZyU0bIvJUYtITRzaVqA
         Y2aduwEG6XCmDFkXfHY98bVVp3TLpO5phF7mKB/Y8jV+ykPNfpyisbgLyHa8kpg/9FsB
         E+jZqr73RL1sGW03z//Q/DSMvy3qW09fwAAQ8CYSsTOKThDH9dMAqLw0vgMDxjTrnvI1
         TH/uBlix0iKZtkhBvFDDcpte6xbzBIZsR00da5qhleqmtFOPqR2ItMe9MHP9VlLkmnw6
         s3OIM76y2wi39DCZMez3v61S9ZK7ctyuK9O8qOna3Az2wD9lsIYQXOr8atVGUMYXTGsh
         IeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qbm3Zxieydq1L7t3UppVE5HIJiSb2Ivolepf56J4YKg=;
        b=uuuKS+yCFKfF2FEf9yR/+3W+YxiRi1cx2QMqV5D/JFm/N4hIEigSekb+rNfv9hkJpK
         v3PJPYUCMNWzCQjsElW4fkin7f2YhP+/tTqK6syTI/vskJcxzTE8TLdnS+VeXAsXfVvS
         9ZSxBaj9ilHktz4v+TisxLZwYIlRb+bCEm6hEmTTQ7MHM0oKnwsGmk15xtU2Bqe/DZ2F
         Mb6+Kqe5iOhBgPiXPV9OgEk3n1xEyT6Fh4WUkCSapW/vrEfNysomtBDA0ldXUFfsAtjU
         GrB1IsniFzntqwF0ljDOeyh13vSiCQkxl7PexnEb/A32pHvEa8M4Jz7Cf3TxolznA2ar
         IGhQ==
X-Gm-Message-State: AJIora/qjCBVHNcvcyWNAFwauV37IsQDc87tvekm7UhNnep+vl7QiLG0
	1KmeFO8Q/eVndSFdcL13oBA3+y2IQUgkxg==
X-Google-Smtp-Source: 
 AGRyM1vRWVK4udy09LS89AbYoVftzxzxpjgAGYqej3UBVWXhF9T2MsW0CeW1xLgrg+qKR4jm35/OvQ==
X-Received: by 2002:a17:906:6545:b0:722:7c99:1ad7 with SMTP id
 u5-20020a170906654500b007227c991ad7mr37721849ejn.325.1657094853510;
        Wed, 06 Jul 2022 01:07:33 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 v19-20020a170906381300b00721d8e5bf0bsm17001344ejc.6.2022.07.06.01.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 01:07:33 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/27] mesa: upgrade 22.1.2 -> 22.1.3
Date: Wed,  6 Jul 2022 10:07:03 +0200
Message-Id: <20220706080721.3072553-9-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220706080721.3072553-1-alex@linutronix.de>
References: <20220706080721.3072553-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 08:07:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167696

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../mesa/{mesa-gl_22.1.2.bb => mesa-gl_22.1.3.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_22.1.2.bb => mesa_22.1.3.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_22.1.2.bb => mesa-gl_22.1.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_22.1.2.bb => mesa_22.1.3.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.1.2.bb b/meta/recipes-graphics/mesa/mesa-gl_22.1.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_22.1.2.bb
rename to meta/recipes-graphics/mesa/mesa-gl_22.1.3.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index bb39e2f369..710cacb09d 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -24,7 +24,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-swrast_kms-use-swkmsDRI2Extension-instead-of-driDRI2.patch \
            "
 
-SRC_URI[sha256sum] = "0971226b4a6a3d10cfc255736b33e4017e18c14c9db1e53863ac1f8ae0deb9ea"
+SRC_URI[sha256sum] = "b98f32ba7aa2a1ff5725fb36eb999c693079f0ca16f70aa2f103e2b6c3f093e3"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_22.1.2.bb b/meta/recipes-graphics/mesa/mesa_22.1.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_22.1.2.bb
rename to meta/recipes-graphics/mesa/mesa_22.1.3.bb
-- 
2.30.2


