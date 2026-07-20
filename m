Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52027C4452D
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:23:58 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2889.1784568231465534911
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=C679SxmX;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-471eeac43bfso9699853f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784568230; x=1785173030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MCRovVGnOGwfD/CiXgpqwaGzJbs9CFRTDuY9AqGUuVs=;
        b=C679SxmX5F5dw2Ax/jncPUy4nIyAtKKnESb9C+b/7eAHgpNbfl4wIr76ALmcJgvnkk
         TDpKWQlLLssIrjVIL6o8zxZarzfx/VMRrCDUkQAz2AL20Ru03SPpwEGGXR5Z4HMpgonb
         WFXSfDDb5jBpD2JSo+0wY2Xr/hYdc16Qm0mmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568230; x=1785173030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MCRovVGnOGwfD/CiXgpqwaGzJbs9CFRTDuY9AqGUuVs=;
        b=QlpYI4MKGp4Kq+p15kgI7YCvBRb/Ongvs6cd0Erxzjy8L0y91c1xDa4qSjWLsE/UGZ
         trqS42f9c+XNcz7Y7NyAP8zjguW9lgQqDEUQs3u72RVdiE+Lky+kgmKZ5lWqHJZ9ybR3
         GUePIxKPv534WV/AFL6goLl78mhw64jLW8oNVWCrMMCKLGTjLS6i4XO34v9ccXNT7Hv6
         R7LAbVd5OGbh9BGhjnNxVcQi/OlJeoHcGUjA94ccD48t+dttV80uYcVnyK4TBwIQ2k7l
         vZ1gBqcxxcnbZ3vqhMHokrC494H+AlMmZUXQSXrOvWD5RYCELAJZGBCwBAVkGd0GQoBO
         TJsw==
X-Gm-Message-State: AOJu0Yx6U/lQ5Lp15Ry3xvjiErfPKtQt3em137yX16Ob62LZzNrHOVXV
	/EigQssBm4yGxicnRdLoY+RlcYE0hxLhp4nmM82aLpz7yniP9DIETvDaAoamO6vVRE5MnZP5OGt
	5aJQqVNI=
X-Gm-Gg: AfdE7cmtQ+xvLtGaTUjzxpWQwd+87wj0YICSFG1FOOltyyAKw3OnhuJKflhnqPbh3Y7
	0vBtWu2ebgFOTBJ0aFVc4emoJv+18+6ggU4Dt/qxELC3TcLaAkE497vriuK7iu0nR2TBlKQFC8g
	Zz+Ww+mN9l9mtcfKWXEK2gGf3L+8byYHH7SKfdUjl8IKPg0wPYo2X+UJ5c1exyFDLgnZWwLVUqq
	USzAUq8W/24OHRlQHwsND+djthskl5hcWZ51b9dUUGxl6XNxRtniZWmdxB1hcBmrjXUaiRp4Jqw
	plNWz1vCwYnldV/K39/putJQu3jBCKn/CoY9Y5EKjXMglVgZJqZu6zTLdkztpkqCF14aZ8kL0uu
	C/nbcVg42Kd4TD+1bfOEjvzV6UZPoMDktopHgS9Xxre5pZ1SHuKtHLCUoV7FXZoCQ5OUyOeIwIX
	pWwSQJmjIZFLTdry5SbdzMa38DRbKBVu3Fn9b7wYO/76Sy4cuX4AGROGg92eQpgP+bAucO/5E4V
	ta9RVDy
X-Received: by 2002:a05:600c:3baa:b0:495:52a5:8815 with SMTP id 5b1f17b1804b1-49552a588admr144693635e9.6.1784568229655;
        Mon, 20 Jul 2026 10:23:49 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-b501-5b7b-2580-caa3-ecc1-dea5.rev.sfr.net. [2a02:8440:b501:5b7b:2580:caa3:ecc1:dea5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563eee22esm36508575e9.1.2026.07.20.10.23.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:23:49 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 30/33] wireless-regdb: upgrade 2026.03.18 -> 2026.05.30
Date: Mon, 20 Jul 2026 19:23:03 +0200
Message-ID: <ed276c7044c659e3f39611257eb56910a82872e2.1784567958.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784567958.git.yoann.congal@smile.fr>
References: <cover.1784567958.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:23:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241464

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 86e35bc1ab5fb2132b06b666fe73fc9bd6446ab6)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
[YC: Changelog:
https://git.kernel.org/pub/scm/linux/kernel/git/wens/wireless-regdb.git/log/?qt=range&q=master-2026-03-18..master-2026-05-30
]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...ireless-regdb_2026.03.18.bb => wireless-regdb_2026.05.30.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2026.03.18.bb => wireless-regdb_2026.05.30.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb
index a70e9dd0dae..e544b729656 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "5fc0000475d8c5368ccc5222827c16aef98b1eb6a69c9b5a3e7b7e98528945ac"
+SRC_URI[sha256sum] = "8a27bfc081bafed8c24dd70fab0d96f098e5a0bfcd08d3da672595f225ab8993"
 
 inherit bin_package allarch
 

