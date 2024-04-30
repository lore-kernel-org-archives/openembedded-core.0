Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA55C19F53
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 21:24:38 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.210.1714512276907860521
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Apr 2024 14:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Pf1ib9v9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1eab16c8d83so50314225ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 14:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1714512276; x=1715117076; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S8HA/5gK2pdKK4PIgJlDYyg4jOyFyOPNh5yTd9iIPec=;
        b=Pf1ib9v96Uew7a3vkyQDNANdEuezhPmMVZ3ARCgqLM7VA+MzNrxyEDpUd/+zWvKsY8
         siCzf5wLjcxNwN9SKflSUiRAM779sjkJiWqwLo7YEguXXj/pb73ACo6fs2yQ5ED6WRsp
         e8G39UXYg6VeU56upof98HuiNm1QIEkjA28TUpGWmUcAHO+ozMPynmN1OJ7S2bQxxndC
         KpV2e1GAk6JZcbBKL0PG6KutdVnGRJi4xgbO65ikSn44T8PzKnlGT3D42Q6FXsEWni7A
         owqMOGdGhL+2Nl54raPb6Tx1Hghu7G/8mILNYfwqfVrRsbrxN6zCzzn8Wo6nzBcSaODe
         65Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714512276; x=1715117076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S8HA/5gK2pdKK4PIgJlDYyg4jOyFyOPNh5yTd9iIPec=;
        b=ODgJ1DMlS1idTkdh3CN8/HifloRMHcDKBgPuDdbmmTGkGt8qRAwC42gl+oSkArknwf
         sPgLlZrYFPifGUtFnK279CGbH3DiTGO3xrL6Xsl+NQxYYqah+utw7lQYp42wD8WMvbce
         AgGA0TGg6poXznUfhVAVWlKCVP6mC+mxMNWnvzgzilm8QqyS/LFsNV+F8JMVgpAbaU2L
         ERd3zUVW+e3jutj80p3d2KCF+fwP0f4KcDKA2rOb0gLlQXUtvovgpI2N4Uab31Q+viVS
         hHr3iyt1fBg6Q5wXhqcLJ2I3HwDcKznugqVtl21i6Y9JztoRWeHN0z3dL3YuLUMzmL5/
         dUbA==
X-Gm-Message-State: AOJu0Yz2wyfN8pjsTvWC3gG4FqyfgOwwrwQM0jXNju8AweyXzOrTKq0S
	TzSGpGH63fTGw2PkWtlPLHjZI4rVyZEwp1VNV0jjVLhp2mVi9cq5feE2txGq0Iy8Gg+Egcc0ALB
	vVZg=
X-Google-Smtp-Source: AGHT+IEYHS6Dw6tTX2NWegh1jkEsjZR/7ZeYi71RZLLc1RIBDygm+Dw+jaHc+icDtHc2KSxepkiTpQ==
X-Received: by 2002:a17:903:583:b0:1e4:b1eb:7dee with SMTP id jv3-20020a170903058300b001e4b1eb7deemr554274plb.47.1714512276212;
        Tue, 30 Apr 2024 14:24:36 -0700 (PDT)
Received: from xps13.. ([209.237.67.158])
        by smtp.gmail.com with ESMTPSA id l8-20020a170903244800b001ea9580e6a0sm11193133pls.20.2024.04.30.14.24.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 14:24:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/17] ell: upgrade 0.63 -> 0.64
Date: Tue, 30 Apr 2024 14:23:57 -0700
Message-Id: <29e3e0eb9b69f966a319810270fb668e4fce9389.1714511660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714511660.git.steve@sakoman.com>
References: <cover.1714511660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 21:24:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198776

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Fix issue with casting in C++ environment.
-Fix issue with ASCII string upper and lower helpers.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a28405da8dad7e6222d7badaa3eda175e3df32c9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/ell/{ell_0.63.bb => ell_0.64.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.63.bb => ell_0.64.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.63.bb b/meta/recipes-core/ell/ell_0.64.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.63.bb
rename to meta/recipes-core/ell/ell_0.64.bb
index 7ecb63a478..c4f16905fd 100644
--- a/meta/recipes-core/ell/ell_0.63.bb
+++ b/meta/recipes-core/ell/ell_0.64.bb
@@ -15,7 +15,7 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "7397c76996d7646b9917ebf016cd67586b10166295af2e0e18cdb5b8f6659965"
+SRC_URI[sha256sum] = "760f3901078409f66cadf1bb24c8bdc60f13d53f6dd66b88631221d2494f8405"
 
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
-- 
2.34.1


