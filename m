Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D114C433FE
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:13 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.7359.1651727163245965653
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mCyWAap3;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id z19so3886434edx.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7PGZcjP32oU1n8xRjlxDv1zlsGJBjQYgI71Jare9RFc=;
        b=mCyWAap3YwjOdk/wxtysVSPT0CUV/k66FwRLbsc577hOs4CXDalVVwh0wqD2TreNN5
         7KR380sNNk+KIGJs13GpOWrIXqpo4L4BRA559O2+HqdnmMGFsvUUScOD2Roxa4r6gt0r
         /wCREqgzWYT6juczUWOLs59Knl3P8mscHkvuF9ZlmdYEWyT2m9vMqbDzNaURxyRzHWQQ
         9WAhOeRWf4X05AtgC7AygsH9cIvbGaeCusdtb6lu/U6Sp95E08YCfMgOFW5j1enTvzKR
         J+eEa3mPQhel570flFXurxO0WKJoCHvPxHmB2Dm6Kh76NNXKSfndvyuTI+b1KPYDAKvr
         AlEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7PGZcjP32oU1n8xRjlxDv1zlsGJBjQYgI71Jare9RFc=;
        b=wSDeOtPf4EF7z1LOgZzfSipVYyli9yYPC0JQQuQjkIiI8jEBwZHeTDVBPWTxC+L4xp
         sGvZX6vwxGnhQcy84fAShgWYo2iCyFCp4oyr7xVyXGoZ4wYWu1TAfEySRn6I4n2AQUPx
         UT99Gbg6rLG37X3ZyTcpDVddFi1xqU91KAs4LcLBjUL1a661TW3O0ypAMayUdUSAQ18u
         Z68XdukhbijWDNVHFztqQOcfVWiITNZ+jbQx496jBdpxa3A6oKWe6xtx9jZqzi31XhR0
         0b0yAVAihOsd+ch+yB/bcEzOdP2pleLMZtwE22Z/P/sA4VaZ7aoZqQU2JV6Nya76cad/
         NaJA==
X-Gm-Message-State: AOAM531KhKoFYsOkT2wPxYxr7u95rOEQBSTRDxeJEj/USlzhTCZ6KrMD
	3Fg9WM9Pf3Z9d3QfYUMN7ItzIgzgfsE=
X-Google-Smtp-Source: 
 ABdhPJzNyNNwrywoYsELusORJa3x+jv8zIJlMu6Mb2bWgobiBEc3F5teI9rI8Dh8THtRxYs1KCkRXA==
X-Received: by 2002:a05:6402:d4c:b0:410:a415:fd95 with SMTP id
 ec12-20020a0564020d4c00b00410a415fd95mr27208411edb.288.1651727161816;
        Wed, 04 May 2022 22:06:01 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:01 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/61] epiphany: upgrade 42.0 -> 42.2
Date: Thu,  5 May 2022 07:05:02 +0200
Message-Id: <20220505050544.651895-19-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165248

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../epiphany/{epiphany_42.0.bb => epiphany_42.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_42.0.bb => epiphany_42.2.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_42.0.bb b/meta/recipes-gnome/epiphany/epiphany_42.2.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_42.0.bb
rename to meta/recipes-gnome/epiphany/epiphany_42.2.bb
index 1cf731c7d6..dc1b34ac92 100644
--- a/meta/recipes-gnome/epiphany/epiphany_42.0.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_42.2.bb
@@ -28,7 +28,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "3dbfa8c00e45b7f44e1824d01f0febe83707b5fb9330c261173f68b7f03cd5e3"
+SRC_URI[archive.sha256sum] = "92c02cf886d10d2ccff5de658e1a420eab31d20bb50e746d430e9535b485192d"
 
 PACKAGECONFIG_SOUP ?= "soup2"
 PACKAGECONFIG ??= "${PACKAGECONFIG_SOUP}"
-- 
2.30.2


