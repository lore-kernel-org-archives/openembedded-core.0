Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EBB1C54EF1
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:42 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.9363.1672830368120524387
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I9Sx6BH3;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id z16so16085711wrw.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cb9GYtPV/FzOazRovU623tk4KW6zjopDVzbWszb0nQI=;
        b=I9Sx6BH3TdZfw4YtVJrqrswwLwPOSTXVEDXQQ19orrwhScSgSKGhhXGsTQShujzcjz
         OFYZ0e0sjUyDzvJgUm7lgYc54lcS5g5fytDBf9FVrR/SD/CaZexbuLw9981GmBU6xfbY
         Zny7N+xP8tFkgOQILoDW0Z4MwbzkFXJZ7bifdBv13Ei/5uPl5kTO29UlMin7xF/4o79a
         2VvuXNU2R3/+LnpkHayN9Mlrqn6AtEDj6y3wQyp9HSB3HMMs/OkEb/RYkpThtlqG74Vg
         v2VOmx8m/HwSzyRI+tLPBTLqaGLMUbtEVdq7/yc8O3rzF048UFWUGJWVE5/O7ZIJJVxd
         LBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cb9GYtPV/FzOazRovU623tk4KW6zjopDVzbWszb0nQI=;
        b=cega4bQKRN1jjZO8riScJz9Eyaf1oeFEjltjpRLSWAEDYB5vpQCvefNuHlpu90bVeJ
         trTa5aGFSdfQvuojwxfyEdvuqxVg3yzKCvLuGAui8DcXyyhKgxM8pLkCOTMRSJ13eSpb
         mpVooVkC1nwUq+9EaYVvvQ3bxxfFyGfK/i5S2Gk5SMfowxw2K5KHN6mIK9zF1tcJ8+6f
         Mxvh6oliz4NYr1g2t3GPj1bogqVt78RZ3eN1H8hG9YOQTSi83u67/3UmdhC5digWxKu2
         xJNmHkiWvbaXi473hBybm01lrXXUOO9tUgjHieo8wZqWfh1N3tpjf77bAZ/c1UoLSuWc
         yI3A==
X-Gm-Message-State: AFqh2kpuLZxZkfeXJmjPTzjVpdvymC9b5T6y0+N5J6dMquKNRxgqliiu
	VbNupZn7f/EiEWb6qIi7RJ0Wkbyywg4=
X-Google-Smtp-Source: AMrXdXvv0xtSYwAdQ/s5XoWdxd/2+DE/75IIccdPPF6tYIMTh5TdEUnhs00PzOxmz+dgYZ0MixC8oA==
X-Received: by 2002:a5d:4f05:0:b0:28c:6430:c1bc with SMTP id c5-20020a5d4f05000000b0028c6430c1bcmr12542654wru.3.1672830394549;
        Wed, 04 Jan 2023 03:06:34 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:34 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 55/77] python3-lxml: upgrade 4.9.1 -> 4.9.2
Date: Wed,  4 Jan 2023 12:05:26 +0100
Message-Id: <20230104110548.2537259-55-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175440

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-lxml_4.9.1.bb => python3-lxml_4.9.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-lxml_4.9.1.bb => python3-lxml_4.9.2.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-lxml_4.9.1.bb b/meta/recipes-devtools/python/python3-lxml_4.9.2.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-lxml_4.9.1.bb
rename to meta/recipes-devtools/python/python3-lxml_4.9.2.bb
index 92a30f7907..c7f1e1fc3c 100644
--- a/meta/recipes-devtools/python/python3-lxml_4.9.1.bb
+++ b/meta/recipes-devtools/python/python3-lxml_4.9.2.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "fe749b052bb7233fe5d072fcb549221a8cb1a16725c47c37e42b0b9cb3ff2c3f"
+SRC_URI[sha256sum] = "2455cfaeb7ac70338b3257f41e21f0724f4b5b0c0e7702da67ee6c3640835b67"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3
-- 
2.30.2


