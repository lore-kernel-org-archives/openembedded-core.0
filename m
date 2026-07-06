Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94439C4450B
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:44 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156331.1783358263695433314
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Xuuus2SY;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493c00f74baso20315615e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358262; x=1783963062; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/c6UqTvndW0HU4NyFpVF2fY0gaUwYSYcOb1/6i2AKc=;
        b=Xuuus2SYFFmsemYuSIW1dkhBGdx5Q35xGL6FdOTdY3rv0DbWPWI//JTcL1WijubACX
         ZZDL6/Jt9HMn/ODRlhy1MH7pCWH9KwQpD3fbi0v5CqDTFA+p7zYtOcH0lP1Asio2HrxS
         lZdEjnrOTcd8qHHYreD8vonML96TbNNcJy4MSBitVsqGrNszXU6wen5XK4uNLnM0+AMX
         DG+NS8WhpvrWmQf2I98rLyacv2PDlwo61FRnxrRsf4I7xlotR+NgWwbsLHFB9jPDSzXz
         6XMVI90Vw5jbp+lByQRT7sSZNZ20w2UQbTlByfZQ9qhCqXlOvepbln9i7kVBRzhyGXYK
         keew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358262; x=1783963062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s/c6UqTvndW0HU4NyFpVF2fY0gaUwYSYcOb1/6i2AKc=;
        b=dbP5HWjbZcMe03lDCx7JepR7gUd+HweiAz/cd8gjcK6Rr/OS0WV1PxcIxTZb27HCes
         L0Xzmuq8oxdjGmLlyREmCtKjEwqJZ90+0XX7k87TBNt03MR0czlttPbWI3O+DcwHYZI7
         zmYR7h9Ab02X003MvQMPZN+4DiQ3jfedv6s3j+KVkknxBcpcOo4WIaExl5ztoJ8j+A3e
         gqi3ZlbWfXLJXHRxGDOoIdDrqOvJYahw2dXlSg/6pfeia2xLFgwaMqukLxFad5doeYP9
         1VkbdNjpXkTi+zwKmyM5MuI7ZlniThss2In26twCwmNcD5J35tHYITAQbHKhxlKuOj1G
         0CIA==
X-Gm-Message-State: AOJu0YxCrgD9+SwfKD3qcClPtSQCLEJhifmZETjbM44cDnuVCcgI4CzE
	CM39K3RaUzsx2PD9A8fJHkJm3AA4Rj6ekKbFtQjsA+FX6iBj7iB7mIsHlEk4jQ==
X-Gm-Gg: AfdE7cm13ZE18xFnzpLOCS3TAUFj8K8CahWccQgjb6Kns/hXiIrL2y5O1y5EM6Bv79v
	kx3LWk7NOWakftnGpe2lqUxH0vAly39DWR++FZ/NbwPvSHBKhTtIJ75puDpN5yorIbvXBb/UgWN
	LAhuDraMCwoJpFks7zSbq9EzlwkREte2Rq3T5Lci6kvdNkGZVeo9uj1sYcab4SW6jJJueQQ0lzZ
	D5QdY7I+ENSwfQby9OFFhgT3iMCIH+gWKN8QStx/ok1E8FDa4Ih93Az1/U+vz5pJUGhtNUvIaaU
	CArUJpHF3rZBEmKMRd2y+BwsUXFhbf+vmis4D17oZQiZAij0NulD/7xa1XH0lw3rQUAkP6tFAVE
	4ZHq+dXEFg6WYVLRomCq29qTyZFrFJzDYdZf2aHmVnvgezq4A+7R5y63YP1XrW+Z8WC7Oc7fMKr
	sqV0qozFmtgilezce3SS38q4DmFUHmzNza37shV0dGT1qoyPPT
X-Received: by 2002:a05:600c:4585:b0:493:9b02:484c with SMTP id 5b1f17b1804b1-493df0aed69mr18553425e9.29.1783358261925;
        Mon, 06 Jul 2026 10:17:41 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:41 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 43/45] waffle: upgrade 1.8.2 -> 1.8.3
Date: Mon,  6 Jul 2026 19:16:57 +0200
Message-ID: <20260706171701.70536-43-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240329

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../waffle/{waffle_1.8.2.bb => waffle_1.8.3.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/waffle/{waffle_1.8.2.bb => waffle_1.8.3.bb} (97%)

diff --git a/meta/recipes-graphics/waffle/waffle_1.8.2.bb b/meta/recipes-graphics/waffle/waffle_1.8.3.bb
similarity index 97%
rename from meta/recipes-graphics/waffle/waffle_1.8.2.bb
rename to meta/recipes-graphics/waffle/waffle_1.8.3.bb
index dd31d4057d..377187b499 100644
--- a/meta/recipes-graphics/waffle/waffle_1.8.2.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.8.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4c5154407c2490750dd461c50ad94797 \
                     file://include/waffle-1/waffle.h;endline=24;md5=61dbf8697f61c78645e75a93c585b1bf"
 
 SRC_URI = "git://gitlab.freedesktop.org/mesa/waffle.git;protocol=https;branch=maint-1.8"
-SRCREV = "70dd251e0390401ab9dc4f768ee9665863f4c268"
+SRCREV = "920b709036d7313b59007435786fc3da61af31ab"
 
 inherit meson features_check lib_package bash-completion pkgconfig
 
-- 
2.47.3


