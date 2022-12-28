Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F28C3DA7A
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 07:37:42 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.177179.1672213058947151996
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 23:37:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WSwE8S/c;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id fm16-20020a05600c0c1000b003d96fb976efso8547974wmb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 23:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JX+Y71W0v0D7iUuL3Mos6jwskt0qeufb7Ptf5b/bpxk=;
        b=WSwE8S/cSTpSX9hDoPIvczEu2i8oqulOhjgDg2WKcYD+/HUGPWbP+sFpd+xEM3rK94
         3ugveCHelavTQJkbij4YW5yVNC2njwzn2wtF53gJuNrpDydRadbMrh9A5eadowEKD8ZY
         FyLNmN+KbzNecazNZQNXu81Xd3u0choGejHRD6/YjSWmqsQQ0xBbdAOtHCpE1/szddFp
         S+kkwsulf6MH8nfBa12ELQYbumMLuFBoHAzP16SL2osXxhH+CBlyoA1pqVwbOMNyS1nK
         Mi7Ey5yRCkF8qnxPAu6Eu+kv87RywxY6rlvaUQ/5ZnMgvUIbDPA7zP1eBH0u4+ufV8jr
         XVpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JX+Y71W0v0D7iUuL3Mos6jwskt0qeufb7Ptf5b/bpxk=;
        b=fIkq8flLyybC58+fZonV357J6/MTKJWOZ/aSqctnJc5k1IAwb1j0O++OdmcNPh1TUN
         Cu4xaMqB0oG6RQH/r5g5jGlJjFUUQnj9EbR9UBOHcoAP5BQmWErzrCtMRFxqYEENVHOK
         k/6Y/F+JlrFNWVLySPBOUpdc+Zf6pKs08Nk2CzhBTfO034Widt00kmVb7mNS+mbXRr55
         a1jcYDI6q+VpmVCUWAFmvIYLjQNyPiQiN5WLsaKJLE5nOY7zrShuTb6LdjjErd3zi/l/
         aI5hZ27/9cs8juhg4N8fA9OsyuJYA69EEhlenL128/ORMJndb/Le98neOmUE1j6T3ngK
         nYEA==
X-Gm-Message-State: AFqh2krwgcZNOOs8QniWX0rXd0aRkhwkiPlY7bnK/yGjunboVFOhyr+r
	3UFB63CDJVZfR24o1JwW3+91QjiviPM=
X-Google-Smtp-Source: AMrXdXtvTPHFWEi2e8gzkaoDxJzwVJqdiIpyGfMb0LmtMNFfLYH+vpWGiDNWdHn9E0bEubTB/5wJ+A==
X-Received: by 2002:a05:600c:539b:b0:3d9:6bc3:b8b9 with SMTP id hg27-20020a05600c539b00b003d96bc3b8b9mr12754904wmb.9.1672213057482;
        Tue, 27 Dec 2022 23:37:37 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id t15-20020a5d534f000000b002365254ea42sm14802040wrv.1.2022.12.27.23.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 23:37:37 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/25] xf86-video-vesa: update 2.5.0 -> 2.6.0
Date: Wed, 28 Dec 2022 08:37:08 +0100
Message-Id: <20221228073721.3454255-12-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221228073721.3454255-1-alex@linutronix.de>
References: <20221228073721.3454255-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:37:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175053

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{xf86-video-vesa_2.5.0.bb => xf86-video-vesa_2.6.0.bb}     | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-vesa_2.5.0.bb => xf86-video-vesa_2.6.0.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.5.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.6.0.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.5.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.6.0.bb
index 05bb905b35..33c2035f6b 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.5.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.6.0.bb
@@ -15,5 +15,6 @@ COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
 RRECOMMENDS:${PN} += "xserver-xorg-module-libint10"
 
-SRC_URI[sha256sum] = "1f1624f3c73906801ad1bc98335a2cb5676a7a4d18e5374d9a1d18464e54c659"
+XORG_DRIVER_COMPRESSOR = ".tar.xz"
+SRC_URI[sha256sum] = "10082771b1a8f659c60b3d9b70456a4b59948a75b3cade2dfa33b8b05e549bb1"
 
-- 
2.30.2


