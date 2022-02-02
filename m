Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA65C4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 18:28:29 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.2258.1643826507766399568
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bwa/RdYi;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id n10so430835edv.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7iNCITmlBPqMyXWdlnLtRWeAQQbi31rS0nCWuuDFFPc=;
        b=bwa/RdYi9PEXDUUNMO5wkeQoNB7T3tISN1IEzjsnJp+YzRLPorIn1cmQmumDQifiJU
         3cjAfJ67hhtuCjiUeR4o/dNyH3A03ECdvIICVKsbEP5T9Hr2z5qeqHL+6CzLv0x5u4bP
         HSWWmAwN1Q5kQRwQhNdBMzcypSj9Pa4Kebs2pW9PA4ZAm07H97IZW79C44efZYSHDQpb
         hP72Kv5o04K0ehFxJmeE38OGv5y6iTpQE8/mC9UAl3FJSITkG9ikgX6dwa/DHLXj6MTW
         Vm+LIwvUHU9YF2c6AroIc5OQRQLDCN6QzmLE2AyGGPE0JmDEvoRmNHCxtcUPU6602pmR
         Kfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7iNCITmlBPqMyXWdlnLtRWeAQQbi31rS0nCWuuDFFPc=;
        b=hlp/Ck1Ce2GhaUX03O/d4kUaVfUQOb6+kb8Mpqs4eKmjVNMex/jwGxxTsqA7UJpsTv
         mE78ZT6fR3E6dhRkozt5ohpYC6YU7Ks9i5FgU0yyYIcpgY6Am6Zm3WgL5qUcFxW4JT27
         3WyUCZtZJHvTpcppeAaQicjYSG02vpKAUqarxk5YI34kjDWaGWkTHAVjyKU46FKMskC+
         KabPqSKCxN3L6R5JTCtpITCEh3O2La9yUYb3kjAUQ4OBmBin1LKhE9+wnr66yidDvLnD
         efHpzUhzrvLJ9NG7z9/+haxCOnWC6JK9nyJ68LRCrC3GiVZnmPqsON6mw6o7QbjCYOBD
         qOBA==
X-Gm-Message-State: AOAM531rx9NbsA11CVl5lgNPISnifggdRqVtKsUKyfaUJ/A7V3I6NrE+
	8W0o5Iq3oS9uZc+S9oKl0ZodiHNfvnE=
X-Google-Smtp-Source: 
 ABdhPJysIv81cqD9Hf/LaFxa2aSo70mAW76zIgTG2nuVg9igm5fQhI/JE87Mwo6f2ApO8t3zCFbRyA==
X-Received: by 2002:a05:6402:f0c:: with SMTP id
 i12mr31940389eda.156.1643826506391;
        Wed, 02 Feb 2022 10:28:26 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i12sm15644203ejy.43.2022.02.02.10.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 10:28:25 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 27/33] wayland-protocols: upgrade 1.24 -> 1.25
Date: Wed,  2 Feb 2022 19:27:52 +0100
Message-Id: <20220202182758.919991-27-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220202182758.919991-1-alex@linutronix.de>
References: <20220202182758.919991-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 18:28:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161252

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{wayland-protocols_1.24.bb => wayland-protocols_1.25.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.24.bb => wayland-protocols_1.25.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.24.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.25.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.24.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.25.bb
index 0cfdb90b68..074801b22d 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.24.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.25.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[sha256sum] = "bff0d8cffeeceb35159d6f4aa6bab18c807b80642c9d50f66cba52ecf7338bc2"
+SRC_URI[sha256sum] = "f1ff0f7199d0a0da337217dd8c99979967808dc37731a1e759e822b75b571460"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-- 
2.20.1


