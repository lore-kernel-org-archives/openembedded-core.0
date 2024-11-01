Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08ADAE674BD
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 09:17:04 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.33473.1730452614237554073
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 02:16:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=el52je2Q;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4314b316495so15828505e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 02:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730452612; x=1731057412; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6VgRcPrCLjgM/Wt0CJ3rIf8K0jay1y7xmiFdh7Lrkyw=;
        b=el52je2QoyOJV31UZ717qdh7J+7L6MyIK69MlBSmZ4SkKFuNnFMfXRLjsJVI25bfGp
         KxDGmFE6nZfnGz1jBoel5E4kLwV75mFacG2j1/hyWM97iYoMxetkMVqOSOMcTt+jqWGu
         riOvdFxgs9WEhBs6/kvujVvxl/fyKLq4ULz9eKiZH/fuh+AeCuGV8ntOrVSVV/wo50bN
         Wf2RWjHcnB0UHEq+wYAdRR6C9x57AaNtfDiUiSPEfOcD0b4CDw3UpeqsYaSziBr6f8mr
         QvD3YUIxPXJEbV3Lykww7reeHhNlGlzT3ex5FFLT+rTQQMjGtIFVrfYbgmsBtHmg0TbW
         KM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730452612; x=1731057412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6VgRcPrCLjgM/Wt0CJ3rIf8K0jay1y7xmiFdh7Lrkyw=;
        b=f0Iw7dtsv7wA9l7AAst+BAktkzGENdVIVvjnsaqd2d4ywUoMDkQD7PmHpLG+D9dgaD
         MOn3rVfl885XujB0rqX+PuutnBQl9snTIaTmmQWQIsidIes5gohyhxbarP8Eh01yGEfZ
         LqgcONQn7S4Yz/KYv9onUucN0CJMZoEXn0nqkkPXMyxtZ+3Sjez85q8aimPNLtY0W5cA
         2v+Es0cxVTv9fMeDyItAYKCimlmn7cslf5bNb4petjEeSsYiPqzdDv8KpUV8U6maktJZ
         mDh+Vwe/B/roSY4yOS54OHZceY032HuimtMrE+xXUO0HA3xhqD3/2iOGGnbHhX4wVP61
         oQ0Q==
X-Gm-Message-State: AOJu0YxLi8G1IMini/zMyZeNAXtTmfj0xKWJQlumUdIHuogBGODqSEkn
	w+m9DCseaUkTgvYBb1Rioti9eWcxfdQNh0HBPh3Yqti1vvDYmgUBWQQrqw==
X-Google-Smtp-Source: AGHT+IEHuPKHwacDgXQuUPGx5pi3CAstLQULo0bJobeXxVY1wOkFW6Eeerkk4dFFQVL/xPZyoLiPLw==
X-Received: by 2002:a05:600c:198d:b0:431:5d89:646e with SMTP id 5b1f17b1804b1-4327b8011cdmr53603095e9.32.1730452612458;
        Fri, 01 Nov 2024 02:16:52 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9cab20sm82637715e9.47.2024.11.01.02.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 02:16:52 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] xf86-input-libinput: update 1.4.0 -> 1.5.0
Date: Fri,  1 Nov 2024 10:16:38 +0100
Message-Id: <20241101091639.2872561-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 09:17:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206611

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...f86-input-libinput_1.4.0.bb => xf86-input-libinput_1.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-libinput_1.4.0.bb => xf86-input-libinput_1.5.0.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb
index 92272c3f2a7..513f7c91ccc 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb
@@ -7,6 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a22925127bd3c827c384cedd23ed2309"
 DEPENDS += "libinput"
 
 XORG_DRIVER_COMPRESSOR = ".tar.xz"
-SRC_URI[sha256sum] = "3a3d14cd895dc75b59ae2783b888031956a0bac7a1eff16d240dbb9d5df3e398"
+SRC_URI[sha256sum] = "2524c35f196554ea11aef3bba1cf324759454e1d49f98ac026ace2f6003580e6"
 
 FILES:${PN} += "${datadir}/X11/xorg.conf.d"
-- 
2.39.5


