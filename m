Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC2EE6ADCD
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:37 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87695.1766434115773373382
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BMJGj9wg;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b79ea617f55so771282766b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434114; x=1767038914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74bnsQ3wdOnphUS4gJUnrxHrpaUde1GV4SzfDTGhnsc=;
        b=BMJGj9wgsOi4FSYM0KVgekq/DvVuOR6WFUKflh2qz8Sr3MJ+8RvsLRtBK6mGCqDen7
         3YvZlwK4CNsNLpppRlx0faNR47htMKmkKMNymmq2KaOizbKFUrldQWO1cv/DSRkc7tBm
         P8qME4CUXvAPm4UasNRViOB2Cidc0PL3dhndRtFT0ZRcGxz5+pTyhYupe/W5rizEp8Cs
         sMqSHjlOgKYgjFlWKyHGQQvDzSwaMEeAKf6nOg/P61MxaIr6c2KHdSW4vpdnoN3fTGhB
         eCYi9xb/oqtmk5aH3+jSZR8SjSkqs4VTq6sQqq8ly40y3piNCb+fOj0+hsPlYnjgLKg/
         orHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434114; x=1767038914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=74bnsQ3wdOnphUS4gJUnrxHrpaUde1GV4SzfDTGhnsc=;
        b=sjCwWMLeq/T7JeJWeXWASlM2BrIUQ2SjvvVNPxGuqC8NaSu7S9QF/zCmekg4Q0guT2
         ntt+iLh/n3zsf7OK2CbVroQObziulUd5Cxo84TFiVY/dG0izyTLgyNryRMD+9RUEXKQB
         CGoUIC5UnRNZ2KbuuCRLFGMR04ZiQY5C4zHo8GzJNUYN6o2nK0znPQEHFNUw1tL0LF0q
         pgWMdOZ2lG9N3QWmBmdXVntS+tTle797q7xo4DKtEwFi2lrTa/4jLVOQBUvzPIgz+Duv
         hmM1R28Pf/pJemjXC2A11XDihOaHxRAsbRUkYRz82GWShtnxX+0HPOmj1OoMdfLXlQoQ
         xMnw==
X-Gm-Message-State: AOJu0YzSEHNdWwCdgp1KbA248e6Xr28GgqfQO3HNOov3VtTr8nYXncp+
	3wl4aNJS9rcER5KAWF53maExxIdJ6ReBkV6pXVtgufzA7crVnYmyK3Twsw4cIg==
X-Gm-Gg: AY/fxX7eCtZm7FKhnhB6S1t8tO7vdfDpFA4uvuLqmpM2vg8TK1U/Z8UntsgECqesiMp
	RQuDidBfwZnKTLFYE29XTp/3y0XiY0KFFO9QzV6yohZqzY16OA0koZ9v88R8If6+oaOhnjbBGLg
	xWVfL39dP/yPO4W9sz/WiW3gaNzktZQnenQeH0VQS0CFTeQsx4gZLNpf5yw44vizgH37A3pL+9l
	D0UHQDuZnAQdmU2ZTDry6kdokzPXs4uK8/YYtCWgWP50AZUWeHbICVLIglxKbP86Ciz3x05NxKo
	wbj+MKTjOehor2HMk1StBxE0hj+ZR+FdNqjYoMOXPFjc/32sHAWqR06x+hXN8pWkUoBW1biOqyJ
	JdfxLQdLGwl2HhMCMqVCXF1oxdjWcsTeeWmtjZnmo7yxrJgW0eTBMvCR4k6JNA3pbAG+Ktw5+FO
	jPIOphV44t5CiFq4GID5ovgvJP0VkXVsaKsqdFG0zb8pobjD7LeNu/+5w/KA==
X-Google-Smtp-Source: AGHT+IFDJ+UVtTmlmeaUL9tENoT8aSp7lMVWX/hBEEUpVjxHShWfUMj0+m3emUAbfSWADqc2NYuIyg==
X-Received: by 2002:a17:907:3dac:b0:b72:c261:3ad2 with SMTP id a640c23a62f3a-b80371d3b67mr1325192066b.50.1766434114043;
        Mon, 22 Dec 2025 12:08:34 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:33 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 070/114] python3-pycparser: upgrade 2.22 -> 2.23
Date: Mon, 22 Dec 2025 21:06:52 +0100
Message-ID: <20251222200739.2278706-70-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228395

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-pycparser_2.22.bb => python3-pycparser_2.23.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycparser_2.22.bb => python3-pycparser_2.23.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pycparser_2.22.bb b/meta/recipes-devtools/python/python3-pycparser_2.23.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pycparser_2.22.bb
rename to meta/recipes-devtools/python/python3-pycparser_2.23.bb
index 0be39ea383..a33a6553b4 100644
--- a/meta/recipes-devtools/python/python3-pycparser_2.22.bb
+++ b/meta/recipes-devtools/python/python3-pycparser_2.23.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eliben/pycparser"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9761c3ffee7ba99c60dca0408fd3262b"
 
-SRC_URI[sha256sum] = "491c8be9c040f5390f5bf44a5b07752bd07f56edf992381b05c701439eec10f6"
+SRC_URI[sha256sum] = "78816d4f24add8f10a06d6f05b4d424ad9e96cfebf68a4ddc99c65c0720d00c2"
 
 inherit pypi setuptools3
 
-- 
2.47.3


