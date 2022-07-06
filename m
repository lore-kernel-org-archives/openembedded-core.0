Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF34DC43334
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 16:34:24 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.8436.1657125263427853477
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 09:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fmg9BrzO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id j7so9162661wmp.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 09:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pa3b8HxxnB+ga9r9HTBC+gRk6A8Agp8j9xczDinvtI8=;
        b=fmg9BrzOWTC/L2RlcycTJjapsjwvEAJJhzFT7z89o4XTQ4mxiDd7hL5a5z+20DU9W2
         j1WnUlszOfCVplNJ05WCDPhNoL9m1GmOYErMY6ZI0Ebu5fTv789oAe75aJr9tOmEC0ox
         gyOEFvkuFYOeWckSxZFhR9nHhLeDh3J3uEER0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pa3b8HxxnB+ga9r9HTBC+gRk6A8Agp8j9xczDinvtI8=;
        b=UMY5pLs4kjioj0Rb/21uztfDWl7sX5UoVv8QC/C9i3ugiA+3jQo+dSImwGGE3rUSlL
         BYsEuGru73HhFb6cl/VmAfFo8NOz8QxDpnNTKMSgEESQ6nn2Z931xzO8g+nLaL6/w72X
         Q8dVcqghqwJsgIt0Fb3bDsmvBUbex0UPdMP5pNVRvLpbsEkeXG3hd2pmwSG9ajOpLkTX
         3Qjfm9IpKsVNUIH3T7rjbZE4u5GYQnVTplCyR7mDynNrmTJXtor0oa+SSWqKWmaGbmvQ
         J84e6MoPLM84KA1c3mJ2hAcpz01ZeEhWjUxy6b9xLC1p1uwQ61+iLBRzk7C7kmaSd6M8
         ntng==
X-Gm-Message-State: AJIora8W2YEi+LdrArNLHZYngWoMMLfXCzwhk5kqBZx4VN8CPP3Kklk+
	Gu8E1Uar7Ip9iFZsz8GyzSLYX09nEKRJEQ==
X-Google-Smtp-Source: 
 AGRyM1v8nIUrQwRx0RgewKNvkLsfyjezvCbar/ov1sgb1SEW/nLC5v6eHOA3R1aKf2/qYOE6UzS5Ig==
X-Received: by 2002:a05:600c:4e56:b0:3a1:7db0:9e35 with SMTP id
 e22-20020a05600c4e5600b003a17db09e35mr38206792wmq.44.1657125261443;
        Wed, 06 Jul 2022 09:34:21 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9b71:63f4:5737:a5c8])
        by smtp.gmail.com with ESMTPSA id
 y13-20020a5d620d000000b0021d4694fcaesm16033260wru.107.2022.07.06.09.34.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 09:34:20 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] vala: Fix on target wrapper buildpaths issue
Date: Wed,  6 Jul 2022 17:34:19 +0100
Message-Id: <20220706163419.1022899-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 16:34:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167734

The on target wrapper contains paths from the host build. Remove them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/vala/vala.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index 90e0b77de0c..974baa33f5b 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -60,3 +60,9 @@ vapigen_sysroot_preprocess() {
 }
 
 SSTATE_SCAN_FILES += "vapigen-wrapper"
+
+PACKAGE_PREPROCESS_FUNCS += "vala_package_preprocess"
+
+vala_package_preprocess () {
+	sed -i -e 's:${RECIPE_SYSROOT}::g;' ${PKGD}${bindir}/vapigen-wrapper
+}
-- 
2.34.1


