Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3328C54EAA
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 10:27:39 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.99230.1674815252436166763
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jan 2023 02:27:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XpbePazy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id f19-20020a1c6a13000000b003db0ef4dedcso5078692wmc.4
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Jan 2023 02:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oy0GU9gqm1DcGsMJ3jYhcS1aSmpNQ5fd7ChDbaWHghY=;
        b=XpbePazy+Nh3r4B+dTw8jgA4+bqzfvid0zijWQSZhbUK99AwEj5bXrbfg5BU7s3DDw
         +Bf/U8XF/Q/yxQjSx5Md7nR9XwKvfBU4mSZ18TEGtVPsyD9RHzLCFCoWDbpL36mKSkAd
         7jrzGguljC3dIFlDeHQWDKGJ9/a8p9So+Ec9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oy0GU9gqm1DcGsMJ3jYhcS1aSmpNQ5fd7ChDbaWHghY=;
        b=GXjD8ksQr3DRpB7ImX5jDLOHORTNeRFlDmfFJPhGU2uIH99EMDLe+9KPNqiPOyqHYy
         I9VqB1MomBcAj4PD1NOi3CJP+++Yvs7q/03Hp4ZiLlGxPCnHA0SfpNy8NWcpNp7Zmsoe
         IE+5gam8fV+QNFc7PH4XaS1O3hYp0Bj8xkSohkEWLtj5uNkb1WeAMlpeXcp3bYSdxADw
         46i+KrCQBJ3Cx15DsIo/1Da32v0hjHwZl/L9toFxOBehsohWDOeDhVen04NKMfmopEGE
         8IpwEep6PANNv3D9EnsLeZDRznBqdIV40H1sqCNZjWazpeBTytB0s3HVLEmbp/APFWRa
         b9ng==
X-Gm-Message-State: AO0yUKUr8vrKxFPzO2wMAANwXhe1FN/wFOxB6mOyA0bAiWJt8A5Fre3j
	Z5gRwDyUAikdXLOdqStLMJ+p6375jKz8SoeO
X-Google-Smtp-Source: AK7set/ZN0dYf17wpKxcqH2dVCljhLZhFfkIoiotdJ5ArxUGPnaI98+wXYsYBHDE6M2njUoKXEJ0Yw==
X-Received: by 2002:a05:600c:3501:b0:3dc:19d1:3c1f with SMTP id h1-20020a05600c350100b003dc19d13c1fmr10384130wmq.30.1674815250377;
        Fri, 27 Jan 2023 02:27:30 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3876:ca46:43a6:4b49])
        by smtp.gmail.com with ESMTPSA id o25-20020a1c7519000000b003daf6e3bc2fsm12462050wmc.1.2023.01.27.02.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 02:27:29 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH] make-mod-scripts: Ensure kernel build output is deterministic
Date: Fri, 27 Jan 2023 10:27:29 +0000
Message-Id: <20230127102729.2623316-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jan 2023 10:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176436

The definitions in linux-kernel-base are needed to ensure the generated headers
are consistent. This was a small step that was missing from the previous
changes to linux-kernel-base as both kernel-devsrc and make-mod-scripts
need this information defined consistently.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 9afd6714f0d..38282e58f10 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://www.yoctoproject.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 
-inherit kernel-arch
+inherit kernel-arch linux-kernel-base
 inherit pkgconfig
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.37.2


