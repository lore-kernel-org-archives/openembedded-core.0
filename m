Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C763D5AE6C
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:01:19 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2996.1765620076435900122
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:01:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WF5JIqVQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-295548467c7so23746085ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620076; x=1766224876; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsYDAAkTd3vcRnWwQP2EC1VP+1pjtlh5eEnGxojO4Dg=;
        b=WF5JIqVQBXT+bxlOMIqKQMKhT2paIZqNyqp8cXbx70CKD/twRWhymGiMl+d5mVxUI9
         W9ynzrZ9EKKFIq7/BQes2SYfqBV3bRbbZLECPPQNQF+giVyYRjZjJnONH2uOxvDHAuFE
         nqXfiZK1fc+jnpLwQqdhCd69hg2gyMaBVxn4ga6aLth+CEj49b4dG4JBofGJp8fjmVHX
         eVKSe204loKmpntwvEfjBgpkc3z9vgZyZxv1UBmwq/LYVZAWf96naS2WzG522vkHilcc
         81106EaU2urJXnMxNQkalQ1oLuqimwOFMJo9OSLQUdgR6Th+D/lj+v09voy/xled6gKN
         dKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620076; x=1766224876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fsYDAAkTd3vcRnWwQP2EC1VP+1pjtlh5eEnGxojO4Dg=;
        b=mMsnEs64bVR7EJKJhCdCav/XEN5nOSXJONLxlHLF8QXneXAEExhI5f85Ri1nJ5N63L
         wdLZxneSeiPMwLvhUHxkrRODd7bouPW9Z1UDlpqsXi+eBQJ4i9/jNnVeJyvmiWJyvKMt
         feGi2JAFoSdB/5u+3LSaT2g8rxd67zpsBUGoVGV2/iHfUChxZius5QizuIylfzLepq9V
         fxRHUTgV5WIGfh7Ca205dc1Y7jNCijrI4JZ2In6g2r133BYpRbGWG8s5Jy+W3Vua3tcW
         EtyPTdKYp9ZekJxQGZomuKWyqme8YT+5UttGf+FMYkv369a7tvWcfrD82Bk8P2m6gWeN
         b4TQ==
X-Gm-Message-State: AOJu0YyC4YKXI9P+DqHCj7d+ST4uhfFkNnhu5c3j78PWXBivYJ1zkihn
	fl5k7e6r8ONXEt1SBYoBjSCLg0C4t/8m78WqkZG2bYVtg9FdDrqaQWAc9UNTTwoz
X-Gm-Gg: AY/fxX68CzHG1y/mpj1mLZAcRZZhOaZflDTACjBoRewh49MDoJZCPSelQJQVwYu1kbR
	QFhvsc7KSNFpYprjlIFfYpJLR4NbvrYurh2yEZfaBS/MaHWJMZ7wN/wgmpFn+UVfbxSfPe4d1Y7
	KJYd+2tgCMBmb8NkbvoV/Kg89G1VgswfW4nx284vOEGxwIQr32467l9fyUq6dJicwZULl6BvDqt
	BZttzpSwEMQXzhCfiijgFrbZuzVvQKAlrpK/8DDxjmVetYt9XrhkZd7v2AIaMsxe+1NuNDg90F4
	1CZCkhMAu6orDeYQYHlgRHsQKLgeNR/eOsaXuxTaVF0439O98pY8rpE9oF+YBMydl2DehIsydEe
	7pAxlo0xamA+0TGFZ+WO0iaShQYMK5hk3Pz8K/rGhJzcuanlvWZSiT+ekeCMxvdj4nnxnOrryxO
	2Cb5MdCGIdl7xDzo6M/H9cWrLRGBwHfiDpSdQ=
X-Google-Smtp-Source: AGHT+IG1AhimXR8S+m/1iCaN2gcfyLzylCk8fHM8fRiKC/VAA9ZEj2ISCSPeocLEkU0epgewvpoTbg==
X-Received: by 2002:a17:903:380d:b0:29e:c2de:4ad with SMTP id d9443c01a7336-29f26d26fdamr47123255ad.24.1765620075644;
        Sat, 13 Dec 2025 02:01:15 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:01:15 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 35/67] gstreamer1.0-vaapi: upgrade 1.26.5 -> 1.26.7
Date: Sat, 13 Dec 2025 15:28:59 +0530
Message-ID: <20251213095931.2571498-35-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:01:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227653

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 7d2536a8a83aa030c41ebac9ae831220906f41a6)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...streamer1.0-vaapi_1.26.5.bb => gstreamer1.0-vaapi_1.26.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.26.5.bb => gstreamer1.0-vaapi_1.26.7.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.7.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.7.bb
index f61125105d..e9515405ce 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.7.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "b42d44db63f3195a6f33296e1ead32c14d01ef27452b7068f1a2d86624f55ea9"
+SRC_URI[sha256sum] = "4885d4a02bb2f17c2af618879b5e77f1acdcedcba859aabd3b970550e2940a38"
 
 S = "${UNPACKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"

