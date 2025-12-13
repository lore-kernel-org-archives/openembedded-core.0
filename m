Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BDC3D5AE5A
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:00:39 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2874.1765620030361164971
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:00:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f1Yif/7J;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a094b1e84cso3527515ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620029; x=1766224829; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvIxsv1X88Gd4H57743Amh6cBtpHk9TLO4o4QR1me0w=;
        b=f1Yif/7JrcCPMeAOLSMI0YPvXKgg5xENdN4EBQZizlFxsZX65chmrJ6tNNbJRVa5dt
         HZyOAA6cgN6ezrFSjVgSOnOD4dndLfksUj5AuUht3ihSXJa7GAIcg4qbsEKe+pk2y6Xh
         XJIez1cjpSKr3XKAxpgwy81QMcxXNOhg/x0vKYRwt7JzNq94mE2zAa+2gaCbHYgJRwMw
         fzx/al75mtFaaBvUr3iDwanbTUO0BZFO7OmGpnxx40nLuPZTSGCsMTxq5wfb4bvFmzSH
         EqxlLo/SM79e4tFdXNIb2b8/8SHsG7IY4t3P9c5b5RS5pZiZFIG5bkQ6qoK5ZX5vk83g
         FBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620029; x=1766224829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fvIxsv1X88Gd4H57743Amh6cBtpHk9TLO4o4QR1me0w=;
        b=rJhMM0v8TMFu6RI/FH8vWGnyZCTUlJk27vyI3Dou5BBknULXqY+fqzXS28ZcNUB4Vj
         zM15ZIr4GBmm9joHsGNYmvraY7y62y1OnpSQyJQwuVI9TcA28Q10+od1r+30zEtHl+E6
         3W7Ot7m5ditZy9kk2bJ7D8JfbKC2MdQ6Vb7rsmY+RZ/GbKnhbbJNd4KUySvDdGGUUCXW
         hkfUh49mQuD5Vj/imL1yiX188xIHWaRJgHNFs5g3lO9iSwOal+kRex3emJlffMFWKFM3
         n7KcqlQCIEVqEAMa2q5+UUWM1570AX3MjxK/dYsnY1QSWgLmprLP30OyBBtS+d4DN8ip
         qRGQ==
X-Gm-Message-State: AOJu0YyOxAGNQBLxhRt4f4CBVgfJtDs9KMcpwOK4iY9U4veIGgiF7Gp0
	FfoOwGPyn+I/yHGXufsFNU87HRb6JfMwjJYtkz8INjqyB1MleRj5Fzc6kbszh2OC
X-Gm-Gg: AY/fxX47XJ/G0bzKOeJJ+a5B4gkHtTbf0GbzVF9fzg3DS5Ly0LlqTkZpLCVjo5npKCG
	oRoz8ZtX5SrSzyE4x4U+HWfdWX7Z72JUgVC6MSHrqJRkml5zmnq8/NkwZmuLfak5//hKjGGH8Y0
	IwIm8blLRW9iVXJDnURjJjNlsB2N1K1Ts5N8XHkiAhuQAAgqlyHBCbJn7qAkT5rMKnkB+4nsX+C
	HWO9HJCPdkgFW5kLXh2FHV1UyXV2sbcTNiKqzK8qWMxsiC60tzK1kEPEB45yXbHIR3vi9ZvxbQh
	gbTAcaZhnAVjoU5uQEbJiqcfOlGtjsFgjRS0VcEZkfcTcdObmK74NJXN52Sh//dFUXeEl3mJ8hb
	rW7RqseV8K7wd6/eNW1qzIpD4xWz7Je/XmpjSC3raQgPPq5RHG1lNkNRynbRCN4t1uXLQ5vW/VR
	9biliY5/+RdstxlcD7D5sZtxP+7Cb+/aCFgHo=
X-Google-Smtp-Source: AGHT+IElXtuEa8t7rJWByTqj8JpQPBygdtkxmZmIN/TYtjbVcsX65sWsr/Fj6etYGhYIW8N7CkEjaA==
X-Received: by 2002:a17:903:4b50:b0:298:3aa6:c034 with SMTP id d9443c01a7336-29f26eb2b13mr43162525ad.32.1765620029660;
        Sat, 13 Dec 2025 02:00:29 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:00:28 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [OE-core][whinlatter][PATCH 19/67] usbutils: upgrade 018 -> 019
Date: Sat, 13 Dec 2025 15:28:43 +0530
Message-ID: <20251213095931.2571498-19-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:00:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227637

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/gregkh/usbutils/blob/v019/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit b351aea4798eb1724c446658a1a716176fafb208)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-bsp/usbutils/{usbutils_018.bb => usbutils_019.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/usbutils/{usbutils_018.bb => usbutils_019.bb} (93%)

diff --git a/meta/recipes-bsp/usbutils/usbutils_018.bb b/meta/recipes-bsp/usbutils/usbutils_019.bb
similarity index 93%
rename from meta/recipes-bsp/usbutils/usbutils_018.bb
rename to meta/recipes-bsp/usbutils/usbutils_019.bb
index b96a1b4f19..6aa5c5f5c2 100644
--- a/meta/recipes-bsp/usbutils/usbutils_018.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_019.bb
@@ -15,7 +15,7 @@ DEPENDS = "libusb1 virtual/libiconv udev"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
           "
-SRC_URI[sha256sum] = "0048d2d8518fb0cc7c0516e16e52af023e52b55ddb3b2068a77041b5ef285768"
+SRC_URI[sha256sum] = "347c52b65a6aeb22cfe3af8382192004f99725850e1dc5f705336e54cf6d59fc"
 
 inherit meson pkgconfig update-alternatives
 

