Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB04CAC5A7
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 13:41:30 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.11873.1758807681170735517
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 06:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kR6vmWyK;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-33255011eafso962680a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 06:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758807680; x=1759412480; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UURjuUtu3KHD77woL9qlN0iaS1yaQw8+KXRlx/JopaA=;
        b=kR6vmWyKGhM6PIxYPMoWDTIIbxmXeWpipIPR9ruL3kpWnl0OQGv9bHNSPViECS1OPj
         yZ7LDPikqfpYegHvxenl5PRMV/vdKsUY2YgKduhqTLYzzqeOjJaR8FGjr7DxH7sJ7EC/
         4Owzdmz3ZDv2aFlcRn+LbOVnMdBHysPSqRMXq/RiE+AfEokusS/dpms6l6Z/ehpIrId+
         I2UdMpW/xR0D6a9QcgxWM4HAYsk5lqnR58veZK7Iyd8k1M4YeKLiy66YubtLcFuLZPfT
         33tth9abj+1TOwHwM4bSnuy+/KA+1h8rKYYvHKUfbGOLIE0tKj5/ysxnFCVTvTJVdHHc
         BeKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758807680; x=1759412480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UURjuUtu3KHD77woL9qlN0iaS1yaQw8+KXRlx/JopaA=;
        b=DCrua/u5OXdyWTvR3oYJ1fISq67VvKTL9JqbxdgDrG1UDWzRM3QWZe08e0iXxw8vhV
         RZkEzbbUWRqX+JIBqhp0tQAekxjgMzrtZcCqfMTfK4ub/HesVrae5eKAXh+np/DMdEwj
         BIN4AFvntVULeEBUUpFtCgY0LmWTWTV39XNNt+8fU24xdSB+id7YJt0NWuAAmg7zWtI7
         7NdIDgePRzaiCnGB8udI8V2qu4EpzzWm3SUuRmF6JxDgHCAyHep/ZT+PLLvW6vQC34mC
         lE+Mg/1NxPV0lZsNeB+1g3vgXINrxNk4JB/6Y/xhLwqFrWOZpGi0N5wpR/JYBh/Mb2PZ
         WHCA==
X-Gm-Message-State: AOJu0YyfCCIR/9YIs/ZwUWeVMRG1m2DqwEFs+pRefsjCdgIyudAZK/k2
	0cY3GkzF45mGe45/FZf+xP/iNeIZ+KqFtSMz7qLzT3+h79CSuZnvLUK12WTsghAY1NrIUgk8WE2
	AR7ww
X-Gm-Gg: ASbGncuyQ08N8PzD7boqCToknjrSc0c6aAYfQ/CLY7HBFnstSoaNxwbfwNjWoV2hKgw
	S5IjjBP0x58e+4XT+Zdz4X9qAIlsYhvgkF6sWvNNreBtMN9igLjw6nwrAm4nT2rtAgFOjpfBlEz
	XqyddzuwXdWPyN1z7N+hRKeMre8qF9EbUSeQqiKwFNj8wWHdFrIBDDepS7JLFfAZnAfIeAgKKBK
	QjRH1ygOa52k1qSW34Bw1ntT5PJdjwECUN22mw08tif+31dT/l5DXuDWJjDVEJV7DwDNo48xWIJ
	kfKbLmFTdVLsWIvLGIzy1vGKX/vDdEvnKfutNbR9WwWfdsIS+SduOBSYIW5rEa2GUGDDO5CAy0i
	MA/IlL18CFOKg/w==
X-Google-Smtp-Source: AGHT+IH9X1HPdHNjHD3ejNUZw0BDaRBp+8RVBrlUCmcB7+r8mEyDwCwt0Cw+hexiwHNmGpLr2uikUA==
X-Received: by 2002:a17:90b:314c:b0:32e:96b1:fb6e with SMTP id 98e67ed59e1d1-3342a29906dmr3663921a91.18.1758807680313;
        Thu, 25 Sep 2025 06:41:20 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:127b:348d:dc99:9937])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3346e9eba87sm2430014a91.0.2025.09.25.06.41.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 06:41:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/11] util-linux: use ${B} instead of ${WORKDIR}/build, to fix building under devtool
Date: Thu, 25 Sep 2025 06:40:55 -0700
Message-ID: <378f87f087651bacdb6efc6b98168bc6ba865070.1758807463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758807463.git.steve@sakoman.com>
References: <cover.1758807463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 13:41:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224029

From: Chris Laplante <chris.laplante@agilent.com>

This change already exists on master, but it was made as part of the
larger migration to ${UNPACKDIR} and is not cherry-pickable.

See: d73595df696 (recipes: Update WORKDIR references to UNPACKDIR)

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/util-linux/util-linux_2.39.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.39.3.bb b/meta/recipes-core/util-linux/util-linux_2.39.3.bb
index 79ddf2d115..12c504e0a2 100644
--- a/meta/recipes-core/util-linux/util-linux_2.39.3.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.39.3.bb
@@ -329,7 +329,7 @@ do_install_ptest() {
     cp ${S}/tests/*.sh ${D}${PTEST_PATH}/tests/
     cp -pR ${S}/tests/expected ${D}${PTEST_PATH}/tests/expected
     cp -pR ${S}/tests/ts ${D}${PTEST_PATH}/tests/
-    cp ${WORKDIR}/build/config.h ${D}${PTEST_PATH}
+    cp ${B}/config.h ${D}${PTEST_PATH}
 
     sed -i 's|@base_sbindir@|${base_sbindir}|g' ${D}${PTEST_PATH}/run-ptest
 
-- 
2.43.0


