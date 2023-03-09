Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30933C76188
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 15:20:22 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.16123.1678375210112749934
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 07:20:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nL4ax6sx;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id g3so2242573wri.6
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 07:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678375212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+9NSuRI6dvwImEm2enNmBMQxXichP7OU7jbBMaS/VI=;
        b=nL4ax6sxdDrJFGypMSM8TIyd9yhrb2uFKnMh+D1PvgRYxr7QtSvJTS28/Hy785abnm
         ukGRL9HsG/fjSFE3/DRsXni8/PXsJQPpEYSoH0VCC5ZFuwsuNGYcYB4vFd24+Dti5onB
         8JksMmfqLc82AhyU0zjVsI7gnJU8IYHRAUbyJSyO6r6trYgCXbYmViumoc3CTxBNeIXz
         aJkFTm8SntIOBVnQttcH0XF+NKtP2O4CAQ6FvvDx3TfQCdXNvWnWD4vQRYShW64gvDZw
         1Yk5fWVH+qPF/fALKadLarGEyl+GrSW4dGVw7zS4d1fqQForrXxEHGGOIaXZvH9dccMa
         wjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678375212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v+9NSuRI6dvwImEm2enNmBMQxXichP7OU7jbBMaS/VI=;
        b=20yYtvfNmTGxGHTtdmf2/MUR6gPOUraSaFKku6GBUziRAqqLxfGCV5pqqtdOIqcYfy
         Zu1USiypFSt9EBUnVzhzR/h8B/cBCngupYwz5638AKek9d8htGD4W18kj2wlRpzXKuUw
         TFknn6CLLFAt2xHIb2bD689wQfI0zt/9AASbThVdcrbOLvId3xo2ffzF014Z/zMKIfCd
         ew5zO3ENk3/fIkR2k3GsiVrdxmMq3B+GlOnotsHzTmNx40yFk9GtKSHNHD39mKeSX80y
         rPfc97Rg/mHyhv20ufp6Qx1kHQ8sKFnamuoixBi32meqtwckNzKoLXrVuurIisv3WzXj
         33uQ==
X-Gm-Message-State: AO0yUKXabeH/PfLqmyuXdzQbQDn+H/NUgx/EDI5htjRQ6uJZ5A7GVgrH
	X9/ZJ4pemV5jqpoVuPr8TkWsr6IO3Y8=
X-Google-Smtp-Source: AK7set+mG+m2+BLyDC12ZeXEX0hBPrSzRlk55K5Wlxb9rqPu2naV40QJH72D+CnjOChNFlp0X8XMZQ==
X-Received: by 2002:adf:f751:0:b0:2cd:ceab:970d with SMTP id z17-20020adff751000000b002cdceab970dmr17761747wrp.24.1678375212813;
        Thu, 09 Mar 2023 07:20:12 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s10-20020adfea8a000000b002c7e1a39adcsm18314521wrm.23.2023.03.09.07.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 07:20:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/26] enchant2: upgrade 2.3.3 -> 2.3.4
Date: Thu,  9 Mar 2023 16:19:48 +0100
Message-Id: <20230309151958.3619193-16-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230309151958.3619193-1-alex@linutronix.de>
References: <20230309151958.3619193-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 15:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178241

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../enchant/{enchant2_2.3.3.bb => enchant2_2.3.4.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/enchant/{enchant2_2.3.3.bb => enchant2_2.3.4.bb} (89%)

diff --git a/meta/recipes-support/enchant/enchant2_2.3.3.bb b/meta/recipes-support/enchant/enchant2_2.3.4.bb
similarity index 89%
rename from meta/recipes-support/enchant/enchant2_2.3.3.bb
rename to meta/recipes-support/enchant/enchant2_2.3.4.bb
index c892f570c4..5a6a3157a6 100644
--- a/meta/recipes-support/enchant/enchant2_2.3.3.bb
+++ b/meta/recipes-support/enchant/enchant2_2.3.4.bb
@@ -7,12 +7,12 @@ BUGTRACKER = "https://github.com/AbiWord/enchant/issues/"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
-DEPENDS = "glib-2.0"
+DEPENDS = "glib-2.0 groff-native"
 
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "3da12103f11cf49c3cf2fd2ce3017575c5321a489e5b9bfa81dd91ec413f3891"
+SRC_URI[sha256sum] = "1f7e26744db1c9a0fea61d2169f4e5c1ce435cf8c2731c37e3e4054119e994a0"
 
 GITHUB_BASE_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.30.2


