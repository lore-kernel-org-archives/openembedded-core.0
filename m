Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7090C433FE
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 03:58:08 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web09.5064.1634270287202113096
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 20:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YxsE4W1X;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id
 qe4-20020a17090b4f8400b0019f663cfcd1so8438734pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 20:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nW9jn44tlTljTAJVTLDdg0WBdUPnV2ZAFtNqRSorV/c=;
        b=YxsE4W1Xgbm0jYz1k7rQ7IiZTj4aTlgypywwWCtnSeKy5OS6X+/3ha8IY+yCJKdfhH
         yUKyhKphX1mTq0nzC05QSa0WNq0RzaiLBzbnO00WOvtMqOItpeg982vbHDfowpZNb9U1
         BnTwKAhc3Bz6J/2b5NZgZ9ECVPmNZ37zqZGieuJHpzDMVBjjlepV0BWSVCFuzGJkhsWy
         MDQ9Mrvm9dKKi5JhKynaIWc6Z60a3obb03DYbUHPIDOGFohncYaO9ykOlMvGx9+XyjZZ
         pakzf65G/nPoi+zBe6LeEuFwWOCRgZYzeO5iD2gpdQU4L6Xx2kNLS8OetKlWdcufeylp
         O5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nW9jn44tlTljTAJVTLDdg0WBdUPnV2ZAFtNqRSorV/c=;
        b=W/wVM3xLV1uC0gLF5XPvhrLfcYxDDPwtkcbQfegWDYmvybZ6O6h8ekMAubRVN6TGfy
         ZglbnAKRQOL8LHiYTIX6qU1MDuOX0s+oHuwTjwDi077z4X3ec6Zu6URw4D5IItHO9wg2
         Y0cE+/M+DjPtAbU+CqgcjxFg1qR4M8Jhpq5qWuKGtCXLgGvHlK8SznbbUKNQK09M6nhc
         MYmMLUyXtX8MSIb3dIEE0bPGpRqi97QYF+0TWttcHn6uTjlPvHL+UaunirQP09zxuiVT
         I+F/FutiYJvUKwH3nIlyapYSOuIYMXvytdMQv4tcTHCbZNmVfR3r+3B8yK6jzlLHamOs
         UP+A==
X-Gm-Message-State: AOAM533awmGJ5HN5o2pPlTLARrlgO2rL4oaC0VOSHwqeW51LX8SGSf91
	o6Nnydjzocaq+jLronGmSA1kKIIgVtz+eQ==
X-Google-Smtp-Source: 
 ABdhPJzwUsd6eNUyDUJixPT1367EIEW1tKnV1ufdhPt5nXAu4jM9r/Dg5s9b1G5mv27GX9ADkIPVbg==
X-Received: by 2002:a17:902:a710:b029:12b:9b9f:c461 with SMTP id
 w16-20020a170902a710b029012b9b9fc461mr8862855plq.59.1634270286538;
        Thu, 14 Oct 2021 20:58:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3fd8])
        by smtp.gmail.com with ESMTPSA id
 b10sm3735543pfi.122.2021.10.14.20.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 20:58:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] mesa: Enable svga for x86 only
Date: Thu, 14 Oct 2021 20:58:03 -0700
Message-Id: <20211015035803.1524562-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211015035803.1524562-1-raj.khem@gmail.com>
References: <20211015035803.1524562-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Oct 2021 03:58:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156984

Enable svga only on x86/x86_64 since some arches e.g. riscv64 do not
support it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 282671d30f..4e95911165 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -143,7 +143,9 @@ GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', '',
 
 # radeonsi requires LLVM
 GALLIUMDRIVERS_RADEONSI = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',radeonsi', '', d)}"
-GALLIUMDRIVERS_LLVM = "r300,svga,nouveau${GALLIUMDRIVERS_RADEONSI}"
+GALLIUMDRIVERS_LLVM = "r300,nouveau${GALLIUMDRIVERS_RADEONSI}"
+GALLIUMDRIVERS_LLVM:append:x86:class-target = ",svga"
+GALLIUMDRIVERS_LLVM:append:x86-64:class-target = ",svga"
 
 PACKAGECONFIG[r600] = ""
 PACKAGECONFIG[virgl] = ""
-- 
2.33.1


