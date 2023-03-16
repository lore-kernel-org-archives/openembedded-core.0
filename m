Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F41DC7618E
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 21:45:44 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.5141.1679003134934892300
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 14:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=pWyj5Wii;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id c4so2028537pfl.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 14:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679003134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D/HXj6kbvDdMUzeqJ9ySt+J5/Sr97GJZLlzAFaUoMec=;
        b=pWyj5Wiiga63ag4Fnn6rR33uwmYJ5lTTP5xPoSnrhysesqLobamXn5Z2X6dxP+kfyU
         Z3kDFmZrcRMxQNrUPIl/FspWUgcWX8FxFe+whyRhDqFarJmYvHwu+XyzxA2qAyCirQDA
         63ZV+Hvzhgmqgo0tBq6pHU93mvHAyCzc8l4F4yzqv+QHHvLFTGSSyMQbRnSAID3giRY4
         I+a7AClbswjXQDLJl2WMju7A+nq4LKVHB4ginTURGJZuPnySF8Wv/02WTiu4BeGigchP
         fBE3HPfIfBhpGzXw+eAsQUIpNsThqIZ/bCsPbHY6G1SNW0N+D/2thXW9/RgaHOfUPo8P
         vTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679003134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D/HXj6kbvDdMUzeqJ9ySt+J5/Sr97GJZLlzAFaUoMec=;
        b=nQYEaH4AVZXWT4SznvySrKH04O2X2RKzxrMS1BcR1iO/WGhCPNv8z1QNJvdUF0MsBm
         7oANqBdsLniDChxH0ncgr4WOdlkPbfnOCX3Zm8r0o+FpOiE3znY3gXNmI0KsCFYCSRaG
         /07/I1Vbc52pGjcr/u/gx1HhvL6mz9iXQ1BCGZfRGFUSdM8p8Y2lE49bqpxgVe6b0Ln0
         l5ssfoFPIw15/n8AYfRGwoIR4DQLpOJHow5n9iS31cjYkFr8wCxurNqpmDgQlO0wrHy7
         yAMR1TWRmS8Lqk09/NvmrMmRkF58YKkVGci5/zR+l1Y9rVgYYlssRBGmfXLALBsqOlkk
         XzZw==
X-Gm-Message-State: AO0yUKW9auixe9YnKhZpUW2mjCpedAFHOdbFqJPIYaGHCZmPqCJ+GT44
	DMlmH06/5Tm24T6iJx8aMd0UoLub5ZSxumlloQU=
X-Google-Smtp-Source: AK7set+ahu7qx7IY5CgCrSfyUqabznYXuAQ7DDUbvzNtg61giGjAI1iBKCM4xh17Scsbv2IdwQi23g==
X-Received: by 2002:aa7:958a:0:b0:626:8b9:977b with SMTP id z10-20020aa7958a000000b0062608b9977bmr1838182pfj.9.1679003134010;
        Thu, 16 Mar 2023 14:45:34 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id bn10-20020a056a00324a00b005a84ef49c63sm137746pfb.214.2023.03.16.14.45.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 14:45:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 03/23] sudo: update 1.9.13p2 -> 1.9.13p3
Date: Thu, 16 Mar 2023 11:45:00 -1000
Message-Id: <d45cbfe4f6ab93f83056ebbf8450be1259c73dd6.1679003014.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679003014.git.steve@sakoman.com>
References: <cover.1679003014.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 21:45:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178714

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7d5193a9437dedb3f2cf35cb466acfe29cfa654e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sudo/{sudo_1.9.13p2.bb => sudo_1.9.13p3.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.13p2.bb => sudo_1.9.13p3.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.13p2.bb b/meta/recipes-extended/sudo/sudo_1.9.13p3.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.13p2.bb
rename to meta/recipes-extended/sudo/sudo_1.9.13p3.bb
index a028bcc216..2e11739470 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.13p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.13p3.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "df2004fde4c1033b1fdca339958e0ec633d393d604fcff9d1513abef1f94574d"
+SRC_URI[sha256sum] = "92334a12bb93e0c056b09f53e255ccb7d6f67c6350e2813cd9593ceeca78560b"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.34.1


