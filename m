Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49764C4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 06:32:23 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web08.3286.1667370734925521887
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 23:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=bMHNz4TE;
 spf=pass (domain: underview.tech, ip: 209.85.160.177, mailfrom: vince@underview.tech)
Received: by mail-qt1-f177.google.com with SMTP id fz10so5065256qtb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 23:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D0xNumqO4xMnP4nEmcUulMfL1HYkiWQsR2TjrTvnCCU=;
        b=bMHNz4TE5Qx20Vl361bAkAQ5oTPfl/Y7TtVQQZGg612v+/NCuSOPjaaSbxX3EX/VTp
         2EOf0ZxZGaZg09LgRtvPpejIxQaSwg6G+oR1SBIb6cRpLx09xTazufS0zcoiyQuiaFSA
         EidpsMVrsrM3PE+4l/Afc/HdqN9/ScVwv+w5nWF/ccXenUzvbwnP3NnefCSZUUZLn+8I
         vTtib5DyoRVg62G3ssafCf9BwmnnUtLfBa0OFvpShTNBLjr7an2fpd1QrJamgpiK4prc
         NY4ERMszNdl2OiyRSSKpKdEgrN3bhv7jhgfR3mkVrdsACSIsaPme06fKkeysg1x5JBKL
         hJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D0xNumqO4xMnP4nEmcUulMfL1HYkiWQsR2TjrTvnCCU=;
        b=GrRq9e5Rc1e4la2OMZqCwZVRdgBQfOVaSb/t3Ri7mqSJVlLRNCr56jeFAtB2MesBAW
         uFz7cXFcFt+DqsjxnSTzusPZqDazykSv8hvaclrso9eqEgKwIQtA6UbNB3z2jfRiZ6qX
         fYGUUxGzfTtP4n6A6YZLVMtH4AZJCYiA9IZ9QwlDz2J764kSV83BJcmgrqoYHLiFRus4
         Z2e5C0ZQOfb78hDN+Dns3wuD7rM3ffQO+5h7DYw35cjXBYfI/u5ErkL7rObjj3l5QkY2
         0RSkyWVAVOZdVS3fotBi/yUInbfHk1P2T3k+cnO9Z6Qn07cXZYtdOGO3/w22Vyi/FOtM
         V8mQ==
X-Gm-Message-State: ACrzQf1Z5HjqYlR1FS1gQ0gFhjU5d81cYT473E5tPPAYBZdx8ZVnw79y
	ofsN9RKHk6BeqJZ7tXvJZ6EgbsnZAgkCo4XMDtw=
X-Google-Smtp-Source: AMsMyM5Toq4+nWwPr+paaL2+UWhhL19lYSpGRJCY+4rXu+n+s+4wxNc3zo5WXtYrm7WdNXFc9arOpA==
X-Received: by 2002:ac8:5712:0:b0:39c:cd48:25e4 with SMTP id 18-20020ac85712000000b0039ccd4825e4mr18597647qtw.581.1667370733575;
        Tue, 01 Nov 2022 23:32:13 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-251-35.nyc.biz.rr.com. [172.254.251.35])
        by smtp.googlemail.com with ESMTPSA id g1-20020ac84681000000b003a4d5fed8c3sm6153412qto.85.2022.11.01.23.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 23:32:13 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [kirkstone][PATCH] linux-firmware: package amdgpu firmware
Date: Wed,  2 Nov 2022 02:31:57 -0400
Message-Id: <20221102063157.7853-1-vince@underview.tech>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 06:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172574

Add packages for the firmware required by amdgpu kernel driver.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 .../linux-firmware/linux-firmware_20220913.bb        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
index 45c9d0e861..bf15e53472 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
@@ -228,6 +228,7 @@ do_install() {
 PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-mt7601u-license ${PN}-mt7601u \
              ${PN}-radeon-license ${PN}-radeon \
+             ${PN}-amdgpu-license ${PN}-amdgpu \
              ${PN}-marvell-license ${PN}-pcie8897 ${PN}-pcie8997 \
              ${PN}-sd8686 ${PN}-sd8688 ${PN}-sd8787 ${PN}-sd8797 ${PN}-sd8801 \
              ${PN}-sd8887 ${PN}-sd8897 ${PN}-sd8997 ${PN}-usb8997 \
@@ -428,6 +429,17 @@ FILES:${PN}-radeon = " \
 
 RDEPENDS:${PN}-radeon += "${PN}-radeon-license"
 
+# For amdgpu
+LICENSE:${PN}-amdgpu = "Firmware-amdgpu"
+LICENSE:${PN}-amdgpu-license = "Firmware-amdgpu"
+
+FILES:${PN}-amdgpu-license = "${nonarch_base_libdir}/firmware/LICENSE.amdgpu"
+FILES:${PN}-amdgpu = " \
+  ${nonarch_base_libdir}/firmware/amdgpu \
+"
+
+RDEPENDS:${PN}-amdgpu += "${PN}-amdgpu-license"
+
 # For lontium
 LICENSE:${PN}-lt9611uxc = "Firmware-Lontium"
 
-- 
2.25.1


