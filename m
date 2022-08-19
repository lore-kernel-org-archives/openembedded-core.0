Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E9C0C32771
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:28:08 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.484.1660894078505378157
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:27:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=neNcbqxR;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id k9so4201524wri.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=reyYFzg3irWXzZGSiy4VklQHwcm/6SOrBU29y7NvoTs=;
        b=neNcbqxR0qCOLZuS4jd/a/+ERrHxv83AfkPjTuWayqOy2Ajrgl9cYm707+bzigDkXq
         KKagA1r8NHe4isTU8YjvqQvNuha3ybpILV0hkpORxkO2FXvhh0zbzK895ZsA0/4pIzUe
         PNcMPKsrPItMg2gQ92ICvH9hdvNmXjTWsKPQuv6F27KCA6GQUPfP3T6jaEKfggTUeHXZ
         NQnH66I9y39UyxQeM/VMGfMXvvi/IlZ9lfemholFT0WsBtNLxcWKju75EUCbxPfBbGSH
         Gsxb1hxCSzr47NGPeHHCf2yuJK4RI96CjATOxurw68BFmSRdoMOm0us+xq8H8FzPUlTT
         WgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=reyYFzg3irWXzZGSiy4VklQHwcm/6SOrBU29y7NvoTs=;
        b=BwMQAbDVQLO/RmuOwyVTiiKF6GbPEUB3oTDaYC2bNxD3DxMdRIQZNR1Phr+a2kbcdh
         lD7LcmRBk5YW3Z1AzA1/nrcsViq/Zc3YM8Tqv3XO7JHBAwkg2Xw/o4YGPRiXB4Nix/eS
         IwZwXYtOU5QmYJ3sOHL+6Y6chqtsYrJvPpLfKUeliFEbCRbsDeawxdf0zs5TQ9Z8heSb
         phbrnLxUyjuZ1Hg5GduAI+0tZ90TsPMT5DOUS5Gs0wn7R8fZ4Y9vYlQKvsp9J9TepLzv
         tqCuAJl1n4JXVVYxryOv9bntPXyNlt6W0P5BeCXdmHN6f+iZ5l8urXHNFAYDC5969Ao4
         LcqA==
X-Gm-Message-State: ACgBeo038B2W+GN+N0hPtkX5M6nAdd/IQXOBfgyJfo1wBJtn0VEfUpw7
	B8TCuVy9aE96Gq6b/ELiyNWo3ga3XBg=
X-Google-Smtp-Source: 
 AA6agR7LhF28R2JTigit3MyojG4x4/oTrL9lLztYNz9EyLrCgey4weakld1TgTSd5wnLwoDhakZZ6g==
X-Received: by 2002:a5d:494d:0:b0:225:1bfc:6820 with SMTP id
 r13-20020a5d494d000000b002251bfc6820mr3431534wrs.473.1660894076964;
        Fri, 19 Aug 2022 00:27:56 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:27:56 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/42] epiphany: upgrade 42.3 -> 42.4
Date: Fri, 19 Aug 2022 09:26:58 +0200
Message-Id: <20220819072727.2236928-13-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:28:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169584

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../epiphany/{epiphany_42.3.bb => epiphany_42.4.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_42.3.bb => epiphany_42.4.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_42.3.bb b/meta/recipes-gnome/epiphany/epiphany_42.4.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_42.3.bb
rename to meta/recipes-gnome/epiphany/epiphany_42.4.bb
index f9d60ff2a9..9efd2800da 100644
--- a/meta/recipes-gnome/epiphany/epiphany_42.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_42.4.bb
@@ -28,7 +28,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "7316d3c6500e825d8e57293fa58047c56727bee16cd6b6ac804ffe5d9b229560"
+SRC_URI[archive.sha256sum] = "370938ad2920eeb28bc2435944776b7ba55a0e2ede65836f79818cfb7e8f0860"
 
 PACKAGECONFIG_SOUP ?= "soup2"
 PACKAGECONFIG ??= "${PACKAGECONFIG_SOUP}"
-- 
2.30.2


