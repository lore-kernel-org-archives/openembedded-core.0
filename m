Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0158C7EE24
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 21:30:39 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.148.1685741433421160380
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 14:30:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=BZlWF2ux;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3f6d01d390bso25945345e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 14:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685741432; x=1688333432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gb5SbNdF2+cLf1iC3xT7uEexc8t5q1EiKqYpX81tbos=;
        b=BZlWF2uxqd2T9VfjcMUNhlzttm7Ag2hdQoSqI3TKDQ+gc0OSUpMcxYFLUFYz1484n5
         KFg0Pe23rrBnNFQ0aLC4UChoNPz/ylWTidZIuH5CPpkJaN/dMQzjy0gmVR98Qlq9JEsd
         qL+AhAIfUvwSCkycqhXarI/rdvih4v4FpHGBpeVgEsc3aBes+31Ye0yoN4ATAPiYzpWb
         QihkCu2djSa7x+x5U25inJJBHCtN/YgKFBOb6MTCsqcanOM/8b909YNKR8fKtS6e8TuD
         dByR6KMkgdQ3ZteSbxYCu4tc1XiPKlYi9vxn3yAompxuPR/S9OLYcSxaPniYbcoQwlU1
         TNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685741432; x=1688333432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gb5SbNdF2+cLf1iC3xT7uEexc8t5q1EiKqYpX81tbos=;
        b=Tu3rvoWL/U8eSwlNUyr+APtNvsWMNg9aBqD52MdIaR/GoGUrxgivkmUFZkBceIiHRs
         ZOmxyZeNS8DElLIfvsUA44TMzeUHFxFqcAm1QsTIjGRbz1mnl6S8LnpLvN7BdQ+pF4UX
         PnUIO3CH3FKOcuMVScJ/O/CFus1K+2u0iO7npvJCaXMGD8UQuySFEvXwbku0wVM9DZud
         qXDy0STmeNYT3ubJeCrypuCqSsb8bXfWql8LFDutEqKMUYCPvav6zsPXbWfWh2DuS4+o
         PRcG0FNTmFz/Jqi7ZsWw+uxaVsn5+p7Bz6EEBbvOmDH2tHTq/LssEpOURi1j8mUVwLGZ
         kp8Q==
X-Gm-Message-State: AC+VfDwVlvgsVilEuhbrImy36sEqflM4IJ81xIpzwjf3JOaRPid3seR5
	zzJnbeknABpnlpTRstV+ADeKSojeAws=
X-Google-Smtp-Source: ACHHUZ7LZpA32BIRnWU8NKfRe1C1v6f6NelOE7AyrtSb535uEQItl89i6LBo5ue47CGUCyP5A6bL4Q==
X-Received: by 2002:a05:600c:201:b0:3f5:f83:4d72 with SMTP id 1-20020a05600c020100b003f50f834d72mr3079068wmi.38.1685741431451;
        Fri, 02 Jun 2023 14:30:31 -0700 (PDT)
Received: from localhost.localdomain ([63.135.72.41])
        by smtp.gmail.com with ESMTPSA id e35-20020a5d5963000000b00306c5900c10sm2686009wri.9.2023.06.02.14.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 14:30:30 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] dpkg: upgrade to v1.21.22
Date: Fri,  2 Jun 2023 22:30:27 +0100
Message-Id: <20230602213027.23572-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 21:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182342

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 meta/recipes-devtools/dpkg/{dpkg_1.21.21.bb => dpkg_1.21.22.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.21.21.bb => dpkg_1.21.22.bb} (95%)

diff --git a/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb b/meta/recipes-devtools/dpkg/dpkg_1.21.22.bb
similarity index 95%
rename from meta/recipes-devtools/dpkg/dpkg_1.21.21.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.21.22.bb
index a19a96ef06..04bcc93321 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.21.22.bb
@@ -18,6 +18,6 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=1.21.
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
 
-SRCREV = "9ef736b7b3a5fa0d6e991e8475eb2e3151fec345"
+SRCREV = "48482e4f16467e05a08aa3b3b8048e08f0024609"
 
 S = "${WORKDIR}/git"
-- 
2.30.2


