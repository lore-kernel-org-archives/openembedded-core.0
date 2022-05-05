Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85556C4332F
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:13 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.7356.1651727157611693412
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CqDpLTkd;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id g23so3887356edy.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ID5jE5KUbzvRs/ZnJDyJrrMTbJq6n+9207uX0D4SWUk=;
        b=CqDpLTkdh258hRVes7Hs/LXjDzgaYQobHx39/KtgWWwpHeqLqsp6lF4F9CiHzFCnQF
         QKEffxuYGwv/N2Q76CbbR/Z4safyRJ0FRDl0wpozJ70v6H6PwCWuRm/eC8S6hWu7iRvT
         +5NRqfcux0EomIJ8esIWFYaH8BFL5T+sHDPC4oK2vtLqznFyJoVosNxyLMa76m6Wvbsj
         sZgBUjpypdRlfeOBwsgP2WPcZDd8Ad3V+9XqXcqnc4yOYkJz97AoszTfXz+OPOzqNo12
         jAjj7ndeHcZVlxOTCAsmt+tLKD1tHlfZGg2bBlmh7zw3Bs6qhVUw8EpO+JHJBOJ6AOkt
         tbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ID5jE5KUbzvRs/ZnJDyJrrMTbJq6n+9207uX0D4SWUk=;
        b=GfDaKJFtpCX7+5Kmq1Yl7R756l6vitRc+1dJlYqX+KbNkv5R7ilbG3BzCRS4WCorMs
         lE205jZlJso8FywtX9WVxVQgtoTaa48ZnIe/41epbtKYaiQ01YA90hyfB1GQ0E+W002h
         4M5d4Begj2ziAYWvW2svBOEZG7dT4aiYrh5xPN8BmNNVpbadEG8gBovl1wBNx1+ZYFKu
         70j0E0qH3DtdHSNWsFzNp7JpXoV98kJxuGwYsuAHwavj/91toj5tfmqmyaxG4i0DeQlT
         sXMyuuHTVN/pPds2TBkLjx9J2Vv/QYbSzRA9vaDSNWeyT3CbglkMAhmdVzBPLobAmqKH
         zLEA==
X-Gm-Message-State: AOAM530wuw7hyscRhEWwCYnjZLTIEGZ9bZuuVAUIVe1BBdSD/7EszOxu
	nq4i2SdAEbmRtTe+i0mbZuVuRWl7o4E=
X-Google-Smtp-Source: 
 ABdhPJxdk8bXbdJTNjODIfxa5cLQmoI1XJhYaQz3qws/KSONUBCdjb/PXFn4NRDFzI0Pzu/GVW4ybQ==
X-Received: by 2002:a05:6402:5ca:b0:423:f330:f574 with SMTP id
 n10-20020a05640205ca00b00423f330f574mr27831579edx.116.1651727164961;
        Wed, 04 May 2022 22:06:04 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:04 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 23/61] libinput: upgrade 1.19.3 -> 1.19.4
Date: Thu,  5 May 2022 07:05:06 +0200
Message-Id: <20220505050544.651895-23-alex@linutronix.de>
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
 https://lists.openembedded.org/g/openembedded-core/message/165252

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../wayland/{libinput_1.19.3.bb => libinput_1.19.4.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.19.3.bb => libinput_1.19.4.bb} (95%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.19.3.bb b/meta/recipes-graphics/wayland/libinput_1.19.4.bb
similarity index 95%
rename from meta/recipes-graphics/wayland/libinput_1.19.3.bb
rename to meta/recipes-graphics/wayland/libinput_1.19.4.bb
index a7f13240d5..a7d0c4be69 100644
--- a/meta/recipes-graphics/wayland/libinput_1.19.3.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.19.4.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://run-ptest \
            file://determinism.patch \
            "
-SRC_URI[sha256sum] = "3cae78ccde19d7d0f387e58bc734d4d17ab5f6426f54a9e8b728c90b17baa068"
+SRC_URI[sha256sum] = "ff33a570b5a936c81e6c08389a8581c2665311d026ce3d225c88d09c49f9b440"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.30.2


