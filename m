Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B77DC35264
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:39 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.2636.1639608046756959662
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WunMV7NA;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id e5so7311281wrc.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pYhAhWm+nTdV0yU/RSJbdrzJxRdHh+HwBoh9slyJvJM=;
        b=WunMV7NAXY4IYx0lc9LUnzYi9L8GyAypxyI7/Oq7fNIkILevhGqwf8xJbKVfuclP+Y
         uel0yUG/1GyCPSRtNlHE6dLXcj0Wyom+ZlzsRG+X5APUCEqOSZsPUM+Lp6hw0oUs7hs/
         sieC/iPFEUsWqRlWWlV9v8YGURUaqK4wFulr8cJCbAmcqrOJv1zEC38JUvgGgu4/iJ1O
         w7HT1PeTubLBzHdlktei0LZtXBmnP0ZI/KIPs/0bCvoG8ivzYHbZDtmdvJ24fDW3MTkA
         Vkm5fz1fewXE9X93ZwuN1s0WnN4owwuybb8rxC54wdKlmRTNH1TDonjksk9FU60qLyuE
         fjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pYhAhWm+nTdV0yU/RSJbdrzJxRdHh+HwBoh9slyJvJM=;
        b=TNCzY3fh2d52hJOtAEwM6diUy8nIBhCaEcQTrvHwPPP6ZHNCniXXcMkySx293ul3ed
         qVHioA3BdtT7ywt+cA4XD2a3fmaqmrA0miDCgZ0d0OgsA2pVHTdki5QRhH3XR2AtX1DW
         /V6skI+XLQl0+f2skU4/sGAvjFZKrDvpPmYekz1o8VrxvtNA+YhLCYLesWTMVS1ebQPo
         85VMRukkw8FeZX8uL8PyfOrnEZFEX03xvvSJ+zB35fPqlcwqcjkL9AeaLLiuS6yrqljZ
         xcTr0C1TF8SJqTWY+8VG4fjGJNiMQ9HNKmXvCo0BEclrxZ19hlyDrTcaHrCwzFpTXz7s
         47Gg==
X-Gm-Message-State: AOAM531dtYJcJrpaWpwIEk6vbuz3rvHjBGvDh7FgJEqLAiot5pVH23dy
	ZtEkc4AiCS+NXw8crd81zsT5J3qXkFxZbQ==
X-Google-Smtp-Source: 
 ABdhPJxwwAiSh5UYXoWWFASKXbFj39oGJ3Rd8nyfwKcf1BmmjCT/C2TAeUN7dZv1m4FAVwR5MADJzA==
X-Received: by 2002:a5d:4d0a:: with SMTP id z10mr6450756wrt.649.1639608045414;
        Wed, 15 Dec 2021 14:40:45 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 u2sm3587269wrs.17.2021.12.15.14.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:40:45 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/26] less: upgrade 590 -> 598
Date: Wed, 15 Dec 2021 23:40:18 +0100
Message-Id: <20211215224034.1814148-10-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211215224034.1814148-1-alex@linutronix.de>
References: <20211215224034.1814148-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159752

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: http->https
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/less/{less_590.bb => less_598.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/less/{less_590.bb => less_598.bb} (87%)

diff --git a/meta/recipes-extended/less/less_590.bb b/meta/recipes-extended/less/less_598.bb
similarity index 87%
rename from meta/recipes-extended/less/less_590.bb
rename to meta/recipes-extended/less/less_598.bb
index 5d0d0a5afe..574efff365 100644
--- a/meta/recipes-extended/less/less_590.bb
+++ b/meta/recipes-extended/less/less_598.bb
@@ -20,7 +20,7 @@ SECTION = "console/utils"
 #
 
 LICENSE = "GPLv3+ | BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
                     file://LICENSE;md5=ba01d0cab7f62f7f2204c7780ff6a87d \
                     "
 DEPENDS = "ncurses"
@@ -28,7 +28,7 @@ DEPENDS = "ncurses"
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
 	  "
 
-SRC_URI[sha256sum] = "6aadf54be8bf57d0e2999a3c5d67b1de63808bb90deb8f77b028eafae3a08e10"
+SRC_URI[sha256sum] = "64e0eb24534ac70d15ff3a36c8853f7a48196aa230d2a104707fc4ff1a45e982"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.20.1


