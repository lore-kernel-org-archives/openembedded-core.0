Return-Path: <bbara93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25ED0C71153
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 08:04:42 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.43393.1693814678896688338
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Sep 2023 01:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=rceJ/Egg;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: bbara93@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-31c5cac3ae2so966276f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 01:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693814677; x=1694419477; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Qhm+/IwyLiQ8xR1Kr4WKdtEbW3lm/Lwj/Bj+ZCIyw0=;
        b=rceJ/Egg4D3LbswscF82aVxv65MqIc2sS5KPRwBg4gVQuRvKTp4UfdzkCmUz2lUMb+
         G3wfngBqOBREt+gMFaMCYSOcQIpxKBPoVeaIWjNLbKXbh/RY02eyIZt6oYCnhRsgT61n
         g21GUmnzIMe3dXlMc1jw8QpspmNtKaNPgx/pOaZINE1hsjMyxalknqgrqSsGVQ6I7Ujy
         nUQgTRXw+vsBuO/EOo3OSc3jSqJbJkx9wF60MbUayVaAEBwU5EhfN+COa2nXTCTHVeUy
         MqekPOCDccv2a5+lrvw6/LapLp0frtUBJd43y96Gc2M8YT78eDgeukdFQNtGRWuKIl6L
         pd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693814677; x=1694419477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Qhm+/IwyLiQ8xR1Kr4WKdtEbW3lm/Lwj/Bj+ZCIyw0=;
        b=VkHD/XwdXrOZe7M1HzO1zteqCDdUoa4DAj8BpfiNzZNm7vgqVHbzDZoz85xln5iItl
         FnaZdDOQTkq83GkKthAg7mcN4EaTfIob8LtB4CwhyCV03TiQ7OUWF0il9V8w4UYWBf9B
         NhvbGbilGaoCZFA4GjtvCyu7r76GktIqIaCxG0vavObBJoY3UZ0V5bmsPwGYJdwwrxLO
         Guxryr32xxnr9tVFyyWGJi4IMqwS96tkBXS6ec6ygfPNVhwDxij7qJPmUzol3Twqq7qj
         gasJhfHE4/hWHRCz80x14qBrNBCS0TbigqBCJWBAh2XhDaVodd08voR3Q6emOEzeIAzt
         adNQ==
X-Gm-Message-State: AOJu0YwMPaBipY8tj11F3NQCBRCon4NV/daIjEgtC7o0wfnsuWibLyha
	uts2EM3an42Qk6arQfc0DS40bY+LVv0c9Q==
X-Google-Smtp-Source: AGHT+IHXgvf7T2sYdwuSsS7CdcqaHHWZSjwntyWjT7SwJoYbkkzGMbMBjOM7VWqrm0I0wr4W3eMtPA==
X-Received: by 2002:a5d:560a:0:b0:317:e5ec:8767 with SMTP id l10-20020a5d560a000000b00317e5ec8767mr6566085wrv.21.1693814676724;
        Mon, 04 Sep 2023 01:04:36 -0700 (PDT)
Received: from PCBABN.skidata.net ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id n4-20020a5d4844000000b0031ad5470f89sm13697350wrs.18.2023.09.04.01.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 01:04:36 -0700 (PDT)
From: Benjamin Bara <bbara93@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Benjamin Bara <benjamin.bara@skidata.com>
Subject: [PATCH] pixman: avoid neon on unsupported machines
Date: Mon,  4 Sep 2023 10:04:19 +0200
Message-Id: <20230904080419.4134661-1-bbara93@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 08:04:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187162

From: Benjamin Bara <benjamin.bara@skidata.com>

Disable neon if the machine does not support it.

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
 meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb b/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
index a580d73185..98df6dab21 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
@@ -37,4 +37,7 @@ EXTRA_OEMESON:append:class-target:powerpc = " ${@bb.utils.contains("TUNE_FEATURE
 EXTRA_OEMESON:append:class-target:powerpc64 = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "-Dvmx=enabled", "-Dvmx=disabled", d)}"
 EXTRA_OEMESON:append:class-target:powerpc64le = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "-Dvmx=enabled", "-Dvmx=disabled", d)}"
 
+EXTRA_OEMESON:append:armv7a = "${@bb.utils.contains("TUNE_FEATURES","neon",""," -Dneon=disabled",d)}"
+EXTRA_OEMESON:append:armv7ve = "${@bb.utils.contains("TUNE_FEATURES","neon",""," -Dneon=disabled",d)}"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


